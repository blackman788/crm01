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
        面板内有两个pannel 下面是可编辑数据表格
            按钮有 添加计划 取消计划 保存计划 删除计划  开发成功 终止开发 
            可编辑表格内的内容是
    后台:
        sql查询数据反显至面板和数据网格，t_cus_dev_plan 的内容
            数据有编号     日期             计划内容         执行效果
        对应:     id        plan_date       plan_item       exe_affect
        删除均用逻辑删除  is_valid  改为0  终止开发 dev_result 改为 3  开发成功改为 2 且a标签改为查看详情
        后隐藏工具栏
*/
//-------------------------客户开发计划----------------end-----------------------

$('#tg').edatagrid({
	url: '/sales/inquire_dev_plan/'+ $('#sales_chance_id').val() + '/',
	saveUrl: '/sales/add_dev_plan/'+ $('#sales_chance_id').val() + '/',
	updateUrl: '',
	destroyUrl: '/sales/delete_dev_plan/',
    pagination:true, //显示分页工具栏
    rownumbers: true,  // 显示行号
    toolbar: '#tt',
});

function add(){
    $('#tg').edatagrid('addRow');
}

function cancel(){
    $('#tg').edatagrid('cancelRow');
}

function save(){
    $('#tg').edatagrid('saveRow');
    setTimeout(function () {
        $('#tg').edatagrid('reload');
    }, 200);
}

function delete00(){
    $('#tg').edatagrid('destroyRow');
    
}

