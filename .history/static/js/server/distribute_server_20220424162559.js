//初始化分配框
$('#distribute').dialog({
    title: '服务分配',
    width: 400,
    height: 200,
    closed: false,
    cache: false,
    modal: true,
    buttons:[{
        text:'Save',
        handler:function(){...}
    },{
        text:'Close',
        handler:function(){...}
    }]
});