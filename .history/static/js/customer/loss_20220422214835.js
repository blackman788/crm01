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

function format_state(value){
    if(0==value){
        return '暂时流失'
    }else if(1==value){
        return '确认流失'
    }
}
