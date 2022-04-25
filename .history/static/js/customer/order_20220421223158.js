$('#tgggg').edatagrid({
    url: '',
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