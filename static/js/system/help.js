// 添加一个新的标签页面板（tab panel）
function openTab(table,url,icos){
    var flag = $('#tabs').tabs('exists',table) //true则重复存在 false则不存在
    if(flag){
        $('#tabs').tabs('select',table)
    }else{
        $('#tabs').tabs('add',{
            title:table,
            closable:true,
            iconCls:icos,
            content:'<iframe scrolling="no" frameborder="0"  src="' + url + '" style="width:100%;height:100%;"></iframe>'
        });
    }
}