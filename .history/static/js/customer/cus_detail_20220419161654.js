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
    title:'添加客户信息',
    iconCls:'icon-save',
    resizable:true,
    modal:true,
    closed:false,
    resizable:false,
    draggable:true,
    buttons:[{
            text:'保存',
            iconCls:'icon-ok',
            handler:function(){
                add_cus_form()
                }
            
        },{
            text:'关闭',
            iconCls:'icon-no',
            handler:function(){
               pass
            }
        }]
})

//发送表单
function add_cus_form(){
    $('#add').form('submit', {
        url:'/customer/add_cus_detail/',
        success:function(data){
            /* var obj = JSON.parse(data);
            $.messager.show({
                title:'提交状态',
                msg:obj.msg,
                timeout:5000,
                showType:'slide'
            }); */
            
            //提交成功后清除数据

            
        }
    });
}
