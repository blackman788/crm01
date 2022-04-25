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

function format_time(value){
    if(undefined == value || null == value){
        return ''
    }
    return value.replace('T', ' ')
}
//格式化状态
function format_state(value){
    if ('0' == value)
        return '未回款';

    if ('1' == value)
        return '已回款';

    return value;
}

function handler(value,row,index){
        return  "<a href='javascript:click_handler_develop("+ row.id +")'>查看详情</a>"

}