
function sumbit_add_server_form(){
    $('#fm').form('submit', {
        url:'/server/sumbit_add_server_form/',
        success:function(data){
            $.messager.show({
                title:'服务创建',
                msg:data.msg,
                timeout:5000,
                showType:'slide'
            });
        }
    });

    
}