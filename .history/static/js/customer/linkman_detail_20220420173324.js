function click_handler_develop(){
    idx = $('#ddg').datagrid('getChecked')

    if(idx.length==0){
        $.messager.alert('提示','必须选择一条才能修改','info');
        return
    }else if(idx.length>1){
        $.messager.alert('提示','只能选择一条进行修改','info');
        return
    }
    ids = idx[0].id
    window.parent.openTab('开发用户','/customer/linkamn_detail/'+ id,'icon-khkfjh')
}