// 初始化修改密码dialog
function act_u(username){
    $('#form_username').val(username)
    $('#change_form_password').dialog('open')

}
$('#change_form_password').dialog({
    title: '修改密码',
    width: 260,
    height: 175,
    closed: true,
    cache: false,
    iconCls:'icon-save',
    modal: true,
    resizable:false,
    draggable:false,
    buttons:[{
				text:'确定',
                iconCls:'icon-ok',
				handler:function(){
                    var flag = $('#system_index_update_password_form').form('validate');
                    console.log(flag)
                    if(flag){
                        //$('#system_index_update_password_form').submit()
                        submit_form()
                        $('#system_index_update_password_form input').val('')
                        $('#system_index_update_password_dialog').dialog('close');
                    }
                }
			},{
				text:'关闭',
                iconCls:'icon-no',
				handler:function(){
                    $('#change_form_password').dialog('close');
                    $('#system_index_update_password_form input').val('')
                }
			}]
});

$.extend($.fn.validatebox.defaults.rules, {
    check_length:{
        validator: function (value){
            return (value.length >=8 && value.length <= 16)
            },
        message: '密码长度必须为8~16位'
        },
    regx_password:{
        validator: function (value) {
            var reg = /^(?=.*?[a-z])(?=.*?[A-Z])(?=.*?\d)(?=.*?[#@*&.])[a-zA-Z\d#@*&.]{8,16}$/;
            return (reg.test(value))
        },
        message: '密码长度必须有大小写字母和特殊字符'
    },
    again_password:{
        validator: function (value,param) {
            //param取到dom对象,还需取jq对象再取值
            return (value == $(param[0]).val())
    },
    message: '两次密码不一致'
}}

);


    //提交表单
function sub_form(){
    $('#csrfmiddlewaretoken').val($.cookie('csrftoken'))
    $('#system_index_update_password_form').form('sumbit',{
                url:'/system/update_password/',
                success:function(result){
                    var obj = JSON.parse(result)
                    $.messager.show({
                        title: '提示',
                        msg: obj.msg,
                        timeout: 5000
                    });  
                    if(200 == obj.code){
                        //清除cookie
                        $.removeCookie('login_cookie',{ expires: 5 ,'path': '/'});
                        setTimeout(function(){
                            window.location.href = '/system/logout/'
                        },2000)
                        
                    }
                }
            });
}
//安全退出
function logout(){
    // 弹出提示框是否退出
    $.messager.confirm('是否退出', '您确认要退出系统吗？', function (r) {
        if (r) {
            // 清除cookie  *技能提升:设置保留用户名,需重构两个cookie
            $.removeCookie('login_cookie',{ expires: 5 ,'path': '/'});
        };
            // 请求后台
            window.location.href = '/system/logout/';
        
    });

}

// 添加一个新的标签页面板（tab panel）
function openTab(table,url,icos){
        var flag = $('#tabs').tabs('exists',table) //true则重复存在 false则不存在
        if(flag){
            $('#tabs').tabs('select',table
            )
        }else{
            $('#tabs').tabs('add',{
                title:table,
                closable:true,
                iconCls:icos,
            });
        }
}