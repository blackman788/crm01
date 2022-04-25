//---------------------------创建营销机会----start---------------------------------
 /*  要求: 点击添加时,跳出面板,并且同时进行数据库获取  客户名称 ，联系人  ,指派人
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
function add_phone(request){
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
            
        }
    });

}

//---------------------------创建营销机会----end---------------------------------