//显示优化
$('#login_a').on('click',function(){
    $('#register').hide()
    $('#log-in').show()
})
$('#reg_a').on('click',function(){
    $('#log-in').hide()
    $('#register').show()
})


//验证用户名 字母开头，字母加数字
function check_user(){
    var flag = false
    var username =  $('#reg_username').val().trim(); 
    if(username==undefined || username ==''){
        $('#reg_span').html('用户名不能为空')
        return
    }
    $('#reg_span').html('')
    reg3 =  /^[a-zA-Z][a-zA-Z0-9]{4,16}$/ ;
    if(reg3.test(username)){
        $('#reg_span').html('')
    }else{
        $('#reg_span').html('请输入正确的用户名格式')
        return flag
        
    }
    //验证与数据库数据对应唯一
    $.ajax({
        'type': 'POST', //请求类型
        'url':"{% url 'system:check_username' %}",
        'async':false,
        'data': {
            'csrfmiddlewaretoken':$.cookie('csrftoken'),
            'username':username,
        },
        'dataType':'JSON',
        'success':function(result){
            if (400 == result.code) {
            flag = false;
            $('#reg_span').html(result.msg);
            }

            if (200 == result.code) {
            flag = true;
            $('#reg_span').html(result.msg);
        }},
        'error':function(result){
            pass
        }
        
    })
    return flag
}
$('#reg_username').on('blur',check_user)

//验证邮箱信息 匹配正则 失去焦点时触发提示
function check_email(){
    flag = false
    email =  $('#reg_email').val().trim(); //去除空格
    if(email==undefined || email ==''){
        $('#reg_span').html('邮箱不能为空')
        return
    }
    $('#reg_span').html('')
    reg1 = /^[A-Za-z0-9]+@[a-zA-Z0-9_-]+(\.[a-zA-Z0-9_-]+)+$/ ;
    if(reg1.test(email)){
        $('#reg_span').html('')
    }else{
        $('#reg_span').html('请输入正确的邮箱格式')
        return flag
    }

    $.ajax({
        'type': 'POST', //请求类型
        'url':"{% url 'system:check_email' %}",
        'async':false,
        'data': {
            'csrfmiddlewaretoken':$.cookie('csrftoken'),
            'email':email,
        },
        'dataType':'JSON',
        'success':function(result){
            if (400 == result.code) {
            flag = false;
            $('#reg_span').html(result.msg);
            }

            if (200 == result.code) {
            flag = true;
            $('#reg_span').html(result.msg);
        }},
        'error':function(result){
            pass
        }
        
    })
    return flag
}
$('#reg_email').on('blur',check_email)
//验证密码 必须数字大小写字母特殊符号组成，最少8位 最多16位
function check_password(){
    pwd =  $('#reg_password').val().trim(); //去除空格
    if(pwd==undefined || pwd ==''){
        $('#reg_span').html('密码不能为空')
        return
    }
    $('#reg_span').html('')
    //至少8-16个字符，至少1个大写字母，1个小写字母和1个数字，其他可以是任意字符
    reg2 = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[^]{8,16}$/;
    if(reg2.test(pwd)){
        $('#reg_span').html('')
        return true
    }else{
        $('#reg_span').html('请输入正确的密码格式')
        return false
    }
    
}
$('#reg_password').on('blur',check_password)
//验证重复密码 
function checkagain_password(){
    pwd2 =  $('#reg_password2').val().trim(); //去除空格
    if(pwd2==undefined || pwd2 ==''){
        $('#reg_span').html('再次输入密码不能为空')
        return
    }
    if(pwd2 == pwd){
        $('#reg_span').html('')
        return true
    }else{
        $('#reg_span').html('两次密码不一致')
    }
    
}
$('#reg_password2').on('blur',checkagain_password)

$('#reg_btn').on('click',function(){
    $('#reg_btn').attr("disabled", "true");
    var username =  $('#reg_username').val().trim();
    var email =  $('#reg_email').val().trim();
    var pwd =  $('#reg_password').val().trim();
    var flag = check_user()
    if(!flag){
        return
    }
    var flag = check_email()
    if(!flag){
        return
    }
    var flag = check_password()
    if(!flag){
        return
    }
    var flag = checkagain_password()
    if(!flag){
        return
    }
    $.ajax({
        'type': 'POST', //请求类型
        'url':"{% url 'system:send_email' %}",
        'async':false,
        'data': {
            'csrfmiddlewaretoken':$.cookie('csrftoken'),
            'email':email,
            'password':pwd,
            'username':username,
        },
        'dataType':'JSON',
        'success':function(result){
            if (400 == result.code) {
            $('#reg_span').html(result.msg);
            }
            if (200 == result.code) {
            $('#reg_span').html(result.msg);
        }},
        'error':function(result){
            console.log(result)
        }
    })
})

//验证用户名
function check_user2(){
    var username =  $('#login_username').val().trim(); 
    if(username==undefined || username ==''){
        $('#login_span').html('用户名不能为空')
        return false
    }
    $('#reg_span').html('')
    return true
    }
$('#login_username').on('blur',check_user2)
function check_password2(){
    pwd =  $('#login_password').val().trim(); //去除空格
    if(pwd==undefined || pwd ==''){
        $('#login_span').html('密码不能为空')
        return false
    }
    $('#reg_span').html('')
    return true
    }
$('#login_password').on('blur',check_password2)
$('#login_btn').on('click',function(){
    var username =  $('#login_username').val().trim();
    var pwd =  $('#login_password').val().trim();
    //var onclick = $('#remember').is(':checked ')
    //console.log(onclick)
    var flag = check_user2()
    if(!flag){return}
    flag = check_password2()
    if(!flag){return}
    
    $.ajax({
        'type': 'POST', //请求类型
        'url':'/system/login_user/',
        'async':false,
        'data': {
            'csrfmiddlewaretoken':$.cookie('csrftoken'),
            'username':username,
            'password':pwd,
            'remember':remember,
        },
        'dataType':'JSON',
        'success':function(result){
            if (400 == result.code) {
            $('#login_span').html(result.msg);
            //window.location.href='/system/index/'
            //console.log(result.login_cookies)
             //$.cookie('login_user')= $.base64.encode(username + "&" + pwd)
            }

            if (200 == result.code) {
            $('#login_span').html(result.msg);
            
        }},
        'error':function(result){
            console.log(1)
        }
        
    })
        
    }
)