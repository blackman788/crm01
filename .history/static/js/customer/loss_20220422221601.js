//查询按钮功能
function inquire(){
    var cusName = $('#cusName').val().trim()
    var cusManager = $('#cusManager').val().trim()
    var state= $('#state').combobox('getValue')
    
    $('#dg').datagrid('reload',{
        cusName: cusName,
        cusManager: cusManager,
        state: state
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

function open_reprieve()