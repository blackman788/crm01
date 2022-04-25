//初始化分配框
$('#distribute').dialog({
    title: '服务分配',
    width: 600,
    height: 500,
    closed: false,
    cache: false,
    modal: true,
    buttons:[{
        text:'保存',
        handler:function(){
            console.log(1)
        }
    },{
        text:'关闭',
        handler:function(){
            console.log(2)
        }
    }],
});