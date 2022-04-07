//验证邮箱信息 匹配正则 失去焦点时触发提示
$('#reg_email').on('blur',function(){
    email =  $('#reg_email').val().trim(); //去除空格
    if(email==undefined || email ==''){
        $('#reg_span').html('邮箱不能为空')
        return
    }
    $('#reg_span').html('')
    reg1 = /^[A-Za-z0-9]+@[a-zA-Z0-9_-]+(\.[a-zA-Z0-9_-]+)+$/ ;
    if(reg1.test(email)){
        $('#reg_span').html('')
        return
    }else{
        $('#reg_span').html('请输入正确的邮箱格式')
        return
    }
})
//验证密码 必须数字大小写字母特殊符号组成，最少8位 最多16位
$('#reg_password').on('blur',function(){
    pwd =  $('#reg_password').val().trim(); //去除空格
    if(pwd==undefined || pwd ==''){
        $('#reg_span').html('密码不能为空')
        return
    }
    $('#reg_span').html('')
    reg2 = /^(?=.*?[a-z])(?=.*?[A-Z])(?=.*?[#@*&.])[a-zA-Z\d#@*&.]{8,16} $/;
    if(reg2.test(pwd)){
        $('#reg_span').html('')
        return
    }else{
        $('#reg_span').html('请输入正确的密码格式')
        return
    }
})
//验证重复密码 
$('#reg_password2').on('blur',function(){
    pwd2 =  $('#reg_password2').val().trim(); //去除空格
    if(pwd2==undefined || pwd2 ==''){
        $('#reg_span').html('密码不能为空')
        return
    }
    if(pwd2 == pwd){
        $('#reg_span').html('')
    }else{
        $('#reg_span').html('两次密码不一致')
    }
    
})