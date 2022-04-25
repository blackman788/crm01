//查询按钮功能
function inquire(){
    var customername = $('#cusName').val().trim()
    var overview = $('#cusManager').val().trim()
    var dev_result= $('#state').combobox('getValue')
    
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

function handler(value,row,index){
    if(0==row.state){
        return "<a href='#'>暂缓流失措施</a>"
    }else if(1==row.state){
        return "客户确认流失"
    }
}
