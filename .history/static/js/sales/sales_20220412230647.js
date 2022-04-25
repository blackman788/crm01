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
                    for(var i=0;i<result.ls.length;i++){
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


//---------------------------创建营销机会----end---------------------------------