// 初始化编辑器
$('#tggg').edatagrid({
    url: '/customer/contact_detail/' + $('#id').val() + '/',
    saveUrl: '/customer/add_contact_detail/' + $('#id').val() + '/',  // 保存时提交url
    updateUrl: '/customer/update_contact_detail/',  // 修改时提交url
    destroyUrl: '',  // 删除时提交url
    pagination: true,  // 显示分页工具栏
    rownumbers: true,  // 显示行号
    width: 600,
    height: 333
});

// 添加行
function add() {
    $('#tggg').edatagrid('addRow');
}

// 取消行
function cancel() {
    $('#tggg').edatagrid('cancelRow');
}

// 删除行
function destroy() {
    $('#tggg').edatagrid('destroyRow');
}

// 保存行
function save() {
    $('#tggg').edatagrid('saveRow');
    setTimeout(function () {
        $('#tggg').edatagrid('reload');
    }, 200);
}