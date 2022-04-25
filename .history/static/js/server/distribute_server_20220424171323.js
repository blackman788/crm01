//初始化分配框
$('#distribute').dialog({
    title: '服务分配',
    width: 600,
    height: 400,
    closed: true,
    cache: false,
    close:true,
    modal: true,
    buttons:[{
        text:'保存',
        iconCls:'icon-save',
        handler:function(){
            console.log(1)
        }
    },{
        text:'关闭',
        iconCls:'icon-cancel',
        handler:function(){
            console.log(2)
        }
    }],
});

function inquire_id(){
    ids = $('#dg').datagrid('getChecked')
    if (0 == ids.length) {
        $.messager.alert('系统提示', '必须选择一条信息', 'warning');
        return;
    }

    if (ids.length > 1) {
        $.messager.alert('系统提示', '只可以选择一条信息', 'warning');
        return;
    }
    $.get('/server/back_server_detail/?id='+ids[0].id,function(result){
        obj = result.y
        $('#serveType').val(obj.serveType)
        $('#customer').val(obj.customer)
        $('#overview').val(obj.overview)
        $('#createPeople').val(obj.createPeople)
        $('#createDate').val(obj.createDate.replace('T',' '))
    })
    $('#distribute').dialog('open')
}

//提交分配表单
function sumbit_distribute_server_form(){
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