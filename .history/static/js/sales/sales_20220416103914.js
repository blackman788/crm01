//---------------------------创建营销机会----start---------------------------------
 /*  要求: 
            点击添加时,跳出面板,并且同时进行数据库获取  客户名称 ，联系人  ,指派人
            三样分别是 t_customer 中的name
                    t_customer_linkman 中的link_man
                    t_user 中的 user_name  
            取值后添加至3个下拉框,可供给选择，
            所有框带星框选择完后可以判断提交表单
            后在 后端进行数据库插入 t_sales_chance 表中
            暂时如此.........
*/
//ajax实现异步获取
function sales_add(){
    $.ajax({
        'type':'GET',
        'url':'/customer/add_sales/',
        'data': {
            'csrfmiddlewaretoken': $.cookie('csrftoken')
        },
        'dataType':'json',
        'success':function(result){
            if(result.code == 400){
                $.messager.show({
                    title: '系统提示',
                    msg: result.msg,
                    timeout: 5000
                });
            }
            if(result.code == 200){
                //添加取到的客户名称
                if(result.cs.length >0){
                    var cs = result.cs
                    $('#customer_select').append('<option value="0">---请选择---</option>')
                    for(var i=0;i<result.cs.length;i++){
                        $('#customer_select').append('<option value="' + cs[i].id  +'">' + cs[i].name + '</option>')
                        
                    }
                }

                //添加联系人
                if(result.ls.length >0){
                    var ls = result.ls
                    $('#linkman_select').append('<option value="0">---请选择---</option>')
                    for(var i=0;i<result.ls.length;i++){
                        $('#linkman_select').append('<option value="' + ls[i].id  +'">' + ls[i].linkName + '</option>')
                    }
                    
                }

                //添加指派人
                if(result.us.length >0){
                    var us = result.us
                    $('#username_select').append('<option value="0">---请选择---</option>')
                    for(var i=0;i<result.us.length;i++){
                        $('#username_select').append('<option value="' + us[i].id  +'">' + us[i].username + '</option>')
                    }
                    
                }


                $('#inquirie').dialog('open');
            }
        },
        'erroe':function(result){
            console.log(1)
        },
    })
}

//自动添加联系电话至只读框中
function add_phone(){
    if ('0' == $('#linkman_select').val()) {
        $('#linkPhone').val('');
        return;
    }

    var id00 = $('#linkman_select').find('option:selected').val()
    var res = $('#linkman_select').find('option:selected').text()
    $('#customerName_hidden').val( $('#customer_select').find('option:selected').text())
   
    $('#linkManName_hidden').val(res)
    
    $.ajax({
        'type':'get',
        'url':'/customer/add_phone/',
        'dataType':'json',
        'data':{'id':id00},
        'success':function(result){
            $('#linkPhone').val(result.phone)
        },
        'error':function(result){
            console.log(result)
        }
    })

}

//提交修改营销机会   dialog表单
/* 
    取到所有值已选择，只要带星的全部填写后就可提交
    前台post传到后台，后台插入数据库
    模糊点: description 为机会描述
            cgjl 为成功几率
            cahnce_source 为机会来源    三个名都是数据库名称，后台操作应该用模型内的名称
            
*/
function add_sumbit(){
    $('#add').form('submit', {
        url:'/customer/add_sumbit/',
        success:function(data){
            var obj = JSON.parse(data);
            $.messager.show({
                title:'提交状态',
                msg:obj.msg,
                timeout:5000,
                showType:'slide'
            });
        
            //提交成功后清除数据
            $('#inquirie').dialog('close');
            $('#add input').val('')  //清除所有input的值
            $('#add select').empty() //清除下拉框内的值
            $('#description').val('') //清除机会描述内的文本

            inquirie()
            
        }
    });

}

//---------------------------创建营销机会----end---------------------------------

//---------------------------修改营销机会----start---------------------------------
/* 
    要求:
        添加一个dialog对话框 title为修改营销机会
        给第一纵添加cheatbox 按钮 只可选中一个 为
        判断是否选中一个按钮 
            若有则打开修改框  ,打开时ajax同步获取选中项的信息,
            注意后台查询时使用sql语句查询，使用orm查询表中可能含特定字符的id而已
            若无弹出警示框,消息为 '必须选中一个' 
        修改完成后按提交，后台mysql修改t_sales_chance对应数据
        多数可通过修改  创建部分的code
        暂且如此..................
*/

//初始化修改模版
$('#sales_update').dialog({
    iconCls:'icon-save',
    resizable:true,
    modal:true,
    closed:true,
    resizable:false,
    draggable:true,
    buttons:[{
            text:'保存',
            iconCls:'icon-ok',
            handler:function(){
                $('#update_customerName_hidden').val( $('#update_customer_select').find('option:selected').val())
                $('#update_linkManName_hidden').val( $('#update_linkman_select').find('option:selected').val())
                $('#update_assignName_hidden').val( $('#update_username_select').find('option:selected').val())
                update_sumbit()
                /* $('#csrfmiddlewaretoken').val($.cookie('csrftoken')); */
                inquirie()
                }
            
        },{
            text:'关闭',
            iconCls:'icon-no',
            handler:function(){
                $('#sales_update').dialog('close');
                $('#update input').val('')  //清除所有input的值
                $('#update select').empty() //清除下拉框内的值
                $('#update_description').val('') 
            }
        }]
})


function open_sales_update(){
    //判断是否有选中一项,若无选中无法打开框
    var idx = $('#dg').datagrid('getChecked')
    if(0 == idx.length){
        $.messager.alert('提示','必须选中一项才能修改','warning');
        return
    }
    else if(1 == idx.length){
        //赋值给idx隐藏域
        $('#ids').val(idx[0].id)
        var idv = idx[0].customer_id
        
    }else if(1 < idx.length){
        $.messager.alert('提示','只能选中一项来修改','warning');
        return
    }
    var customer_id = null
    var linkman_id = null
    var username_id = null
     //获取复选框选中行
     $.ajax({
         'type':'POST',
         'async': false,
         'url':'/sales/sales_update/',
         'dataType':'json',
         'data':{'id':idv},
         'success':function(result){
             if(200 == result.code){
                var object = result.object
                $('#update_customer_select').val(object.name)
                $('#update_chanceSource').val(object.chance_source)
                $('#update_linkman_select').val(object.link_name)
                $('#update_linkPhone').val(object.link_phone)
                $('#update_cgjl').val(object.cgjl)
                $('#update_overview').val(object.overview)
                $('#update_description').val(object.description)
                $('#update_username_select').val(object.assign_man)
                customer_id = object.customer_id
                linkman_id = object.link_man
                username_id = object.id
             }
            
         },
         'error':function(result){
            console.log(1)
         }
     })

     $.ajax({
        'type':'GET',
        'url':'/customer/add_sales/',
        'dataType':'json',
        'success':function(result){
            if(result.code == 400){
                console.log(result.msg);
            }
            if(result.code == 200){
                //添加取到的客户名称
                if(result.cs.length >0){
                    var cs = result.cs
                    $('#update_customer_select').append('<option value="0">---请选择---</option>')
                    for(var i=0;i<result.cs.length;i++){
                        if(customer_id != cs[i].id ){
                            $('#update_customer_select').append('<option value="' + cs[i].id  +'">' + cs[i].name + '</option>')
                        }else{
                            $('#update_customer_select').append('<option selected value="' + cs[i].id  +'">' + cs[i].name + '</option>')
                        }
                    }
                }

                //添加联系人
                if(result.ls.length >0){
                    var ls = result.ls
                    $('#update_linkman_select').append('<option value="0">---请选择---</option>')
                    for(var i=0;i<result.ls.length;i++){
                        if(linkman_id != ls[i].id ){
                            $('#update_linkman_select').append('<option value="' + ls[i].id  +'">' + ls[i].linkName + '</option>')
                        }else{
                            $('#update_linkman_select').append('<option selected value="' + ls[i].id  +'">' + ls[i].linkName + '</option>')
                        }
                    }
                    
                }

                //添加指派人
                if(result.us.length >0){
                    var us = result.us
                    $('#update_username_select').append('<option value="0">---请选择---</option>')
                    for(var i=0;i<result.us.length;i++){
                        if(username_id != us[i].id ){
                            $('#update_username_select').append('<option value="' + us[i].id  +'">' + us[i].username + '</option>')
                        }else{
                            $('#update_username_select').append('<option selected value="' + us[i].id  +'">' + us[i].username + '</option>')
                        }
                    }
                    
                }

            }
        },
        'erroe':function(result){
            console.log(1)
        },
    });
    $('#sales_update').dialog('open')
}

//自动添加联系电话至只读框中
function update_phone(){
    if ('0' == $('#update_linkman_select').val()) {
        $('#update_linkPhone').val('');
        return;
    }

    var id00 = $('#update_linkman_select').find('option:selected').val()
    var res = $('#update_linkman_select').find('option:selected').text()
   
    $('#update_linkManName_hidden').val(res)
    
    $.ajax({
        'type':'get',
        'url':'/customer/add_phone/',
        'dataType':'json',
        'data':{'id':id00},
        'success':function(result){
            $('#update_linkPhone').val(result.phone)
        },
        'error':function(result){
            console.log(1)
        }
    })

}

//提交update表单
function update_sumbit(){
    $('#update').form('submit', {
        url:'/sales/update_sumbit/',
        success:function(data){
            var obj = JSON.parse(data);
            $.messager.show({
                title:'提交状态',
                msg:obj.msg,
                timeout:5000,
                showType:'slide'
            });
            
            //提交成功后清除数据
            $('#sales_update').dialog('close');
            $('#update input').val('')  //清除所有input的值
            $('#update select').empty() //清除下拉框内的值
            $('#update_description').val('')
            
        }
    });
}
//---------------------------修改营销机会----end---------------------------------
//---------------------------删除营销机会----end---------------------------------
/* 
    要求 :判断条数，点击删除跳出 '确定要删除 xx 条数据吗'
          传str数据至后台，后台执行sql逻辑删除，isvalid = 0;
*/

function delete_sales(){
    var idx = $('#dg').datagrid('getChecked')
    var data=new Array()
    for(i=0;i<idx.length;i++){
        data.push(idx[i].id)
    }
    $.ajax({
        'type':'post',
        'url':'/sales/delete_sales/',
        'dataType':'json',
        'data':{id:data},
        'success':function(result){
            console.log(result)
        },
        'error':function(result){
            console.log(result)
        },
    })
}
//---------------------------删除营销机会----end---------------------------------
