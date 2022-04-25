
function sumbit_add_server_form(){
    $('#fm').form('submit', {
        url:'/server/sumbit_add_server_form/',
        success:function(data){
            obj = JSON.parse(data)
            $.messager.show({
                title:'服务创建',
                msg:obj.msg,
                timeout:5000,
                showType:'slide'
            });
            if(obj.code == 200){
                $('#save_btn').linkbutton('disable');
            }
        }
    });
}