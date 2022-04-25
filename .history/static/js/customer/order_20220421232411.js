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
        return  "<a href='javascript:open_order("+ row.id +")'>查看详情</a>"
}

function open_order(order_id){
    $.get('/customer/back_order_detail/?id='+ order_id,function(result){
        obj = result.data
        // 返显数据
        $('#orderNo').val(obj.orderNo);
        $('#orderDate').val(obj.orderDate.replace('T', ' '));
        $('#address').val(obj.address);
        $('#totalPrice').val(obj.totalPrice);
        if (0 == obj.state) {
            $('#state').val('未回款');
        } else if (1 == obj.state) {
            $('#state').val('已回款');
        } 
    })

     // 初始化编辑器
     $('#tt2').edatagrid({
        url: '',
        pagination: true,  // 显示分页工具栏
        rownumbers: true,  // 显示行号
        width: 600,
        height: 333
    });

    $('#order_detail_dialog').dialog('open');
}

$('#order_detail_dialog').dialog({
    title: '订单详情',
    width: 700,
    height: 420,
    iconCls: 'icon-lsdd',
    resizable: false,
    modal: true, // 模态
    draggable: false, // 不可移动
    closed: true, // 是否关闭
    buttons: [{
        text: '关闭',
        iconCls: 'icon-cancel',
        handler: function () {
            $('#order_detail_dialog').dialog('close');
        }
    }]
});