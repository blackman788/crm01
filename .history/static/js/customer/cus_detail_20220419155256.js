//查询功能实现
function inquire_cus_detail(){
    var name = $('#cusname').val().trim() 
    var khno = $('#cusid').val().trim() 
    var state = $('#cus_state').combobox('getValue') 

    $('#ddg').datagrid('reload',{
        name :name,
        khno:khno,
        state:state,
    })
}

//初始模版
$('#cus_inquirie').dialog({
    iconCls:'icon-save',
    resizable:true,
    modal:true,
    closed:true,
    resizable:false,
    draggable:true,
    buttons:[{
            text:'保存',
            iconCls:'icon-ok',
            handler:function(){
               
                }
            
        },{
            text:'关闭',
            iconCls:'icon-no',
            handler:function(){
               
            }
        }]
})
