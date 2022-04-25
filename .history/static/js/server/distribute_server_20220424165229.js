//初始化分配框
$('#distribute').dialog({
    title: '服务分配',
    width: 600,
    height: 400,
    closed: false,
    cache: false,
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
    id = ids[0].id
    if (0 == ids.length) {
        $.messager.alert('系统提示', '必须选择一条信息', 'warning');
        return;
    }

    if (ids.length > 1) {
        $.messager.alert('系统提示', '只可以选择一条信息', 'warning');
        return;
    }
}