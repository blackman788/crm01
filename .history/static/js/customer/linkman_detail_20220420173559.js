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
    window.parent.openTab('开发用户','/customer/inquire_linkman_detail/'+ id,'icon-khkfjh')
}

// 初始化编辑器
$('#tt').edatagrid({
    url: '/customer/select_linkman_by_customer_id/' + $('#id').val() + '/',
    saveUrl: '/customer/create_linkman/' + $('#id').val() + '/',  // 保存时提交url
    updateUrl: '/customer/update_linkman/',  // 修改时提交url
    destroyUrl: '/customer/delete_linkman/',  // 删除时提交url
    pagination: true,  // 显示分页工具栏
    rownumbers: true,  // 显示行号
    width: 600,
    height: 333
});

// 添加行
function add() {
    $('#tt').edatagrid('addRow');
}

// 取消行
function cancel() {
    $('#tt').edatagrid('cancelRow');
}

// 删除行
function destroy() {
    $('#tt').edatagrid('destroyRow');
}

// 保存行
function save() {
    $('#tt').edatagrid('saveRow');
    setTimeout(function () {
        $('#tt').edatagrid('reload');
    }, 200);
}