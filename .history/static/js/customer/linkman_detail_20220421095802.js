// 初始化编辑器
$('#tgg').edatagrid({
    url: '/customer/linkman_detail/' + $('#id').val() + '/',
    saveUrl: '/customer/add_linkman_detail/',  // 保存时提交url
    updateUrl: '/customer/update_linkman_detail/',  // 修改时提交url
    destroyUrl: '/customer/delete_linkman_detail/',  // 删除时提交url
    pagination: true,  // 显示分页工具栏
    rownumbers: true,  // 显示行号
    width: 600,
    height: 333
});

// 添加行
function add() {
    $('#tgg').edatagrid('addRow');
}

// 取消行
function cancel() {
    $('#tgg').edatagrid('cancelRow');
}

// 删除行
function destroy() {
    $('#tgg').edatagrid('destroyRow');
}

// 保存行
function save() {
    $('#tgg').edatagrid('saveRow');
    setTimeout(function () {
        $('#tgg').edatagrid('reload');
    }, 200);
}