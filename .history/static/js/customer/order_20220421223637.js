$('#tgggg').edatagrid({
    url: '/customer/gain_order/' + $('#id').val() + '/',
    saveUrl: '',  // 保存时提交url
    updateUrl: '',  // 修改时提交url
    destroyUrl: '',  // 删除时提交url
    pagination: true,  // 显示分页工具栏
    rownumbers: true,  // 显示行号
    width: 600,
    height: 333
});

// 添加行
function add() {
    $('#tgggg').edatagrid('addRow');
}

// 取消行
function cancel() {
    $('#tgggg').edatagrid('cancelRow');
}

// 删除行
function destroy() {
    $('#tgggg').edatagrid('destroyRow');
}

// 保存行
function save() {
    $('#tgggg').edatagrid('saveRow');
    setTimeout(function () {
        $('#tgggg').edatagrid('reload');
    }, 200);
}