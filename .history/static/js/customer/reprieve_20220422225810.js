$('#tt').edatagrid({
    url: '/customer/reprieve_detail/' + $('#id').val() + '/',
    saveUrl: '/customer/add_reprieve_detail/' + $('#id').val() + '/',  // 保存时提交url
    updateUrl: '',  // 修改时提交url
    destroyUrl: '',  // 删除时提交url
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

// 确认流失
function ok() {
    $.messager.prompt('系统提示', '请输入流失原因：', function (r) {
        if (r) {
            $.post('/customer/ok_reprieve/', {
                loss_id: $('#id').val(),
                lossReason: r
            }, function (result) {
                $.messager.alert('系统提示', result.msg, 'info');
                // 隐藏工具栏
                $('#tb').hide();
            });
        }
    });
}