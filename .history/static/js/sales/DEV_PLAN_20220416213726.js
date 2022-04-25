//-------------------------客户开发计划----------------start-----------------------
/* 
    要求: 
        实际用途; 用于记录开发的信息，比如与客户的洽谈，和约谈的记录
        查询用到的表 t_cus_dev_plan   模型在SaleChance 下的  CusDevPlan
    前台:
        点击弹出数据表格 数据有 客户编号,客户名称,概要,创建人,联系人,联系电话,分配给谁,分配时间,客户开发状态
        最后一行有两个选项  用a标签写  判断dev_result的值确定 0为未开发，1为开发中，2为开发完成,3为开发失败
             开发用户:未开发的用户和开发中的用户 ;  查看详情:开发完成或开发失败的用户
        点击操作后,跳至Panel面板 
        查看详情中的信息为数据库反显数据,input设为 readonly只读 
        开发用户的面板内顶部要有  添加计划，取消计划，保存计划，删除计划，开发成功，开发终止 按钮
    后台:
        sql查询数据反显至面板和数据网格，
*/
//-------------------------客户开发计划----------------end-----------------------
//格式化分配时间
function format_time(value){
    if(undefined == value || null == value){
        return ''
    }
    return value.replace('T', ' ')
}
//格式化状态
function format_state(value){
    if ('0' == value)
        return '未分配';

    if ('1' == value)
        return '已分配';

    return value;
}
//格式化开发状态
function format_devresult(value){
    if ('0' == value)
    return '未开发';

    if ('1' == value)
        return '开发中';

    if ('2' == value)
        return '开完完成';

    if ('3' == value)
        return '开发失败';

    return value;
}

function handler(value,row,index){
    if( 0 == row.dev_result || 1 == row.dev_result){
        return  "<a href='javascript:click_handler_develop("+ row.id +")'>开发用户</a>"
    }else{
        return  "<a href='javascript:click_handler_inquire("+ row.id+ ")'>查看详情</a>"
    }
}

//查询按钮功能
function inquire(){
    var customername = $('#customerName').val().trim()
    var overview = $('#overview').val().trim()
    var dev_result= $('#dev_result').combobox('getValue')
    
    $('#dg').datagrid('reload',{
        name: customername,
        overview: overview,
        dev_result: dev_result
    });
    }

//点击操作跳转页面
function click_handler_develop(id){
    window.parent.openTab('开发用户','/sales/select_dev_plan_detail/'+ id +','icon-khkfjh')
}
function click_handler_inquire(id){
    window.parent.openTab('查看详情','/sales/select_dev_plan_detail/'+ id +','icon-khkfjh')
}