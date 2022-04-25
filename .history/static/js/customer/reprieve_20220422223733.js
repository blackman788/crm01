$('#tt').edatagrid({
    url: '/customer/select_reprieve_by_loss_id/' + $('#id').val() + '/',
    saveUrl: '/customer/create_reprieve/' + $('#id').val() + '/',  // 保存时提交url
    updateUrl: '/customer/update_reprieve/',  // 修改时提交url
    destroyUrl: '/customer/delete_reprieve/',  // 删除时提交url
    pagination: true,  // 显示分页工具栏
    rownumbers: true,  // 显示行号
    width: 600,
    height: 333
});