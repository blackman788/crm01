//查询功能实现 也可做重置信息的函数
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
function open_cus_detail(num){
    $('#flag').val(num)
    $('#cus_inquirie').dialog('open')
    
}

//初始模版
$('#cus_inquirie').dialog({
    title:'添加客户信息',
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
                add_cus_form()
                inquire_cus_detail()
                }
            
        },{
            text:'关闭',
            iconCls:'icon-no',
            handler:function(){
                $('#cus_inquirie').dialog('close')
                $('#add input').val('')
                $('#add select').combobox('setValue', '---请选择---')

            }
        }]
})

//发送表单
function add_cus_form(){
    $('#add').form('submit', {
        url:'/customer/add_cus_detail/',
        success:function(data){
            obj= JSON.parse(data)
            $.messager.show({
                title:'提交状态',
                msg:obj.msg,
                timeout:5000,
                showType:'slide'
            });
            
            //提交成功后清除数据
            $('#cus_inquirie').dialog('close')
            $('#add input').val('')
            $('#add input').combobox('setValue', '---请选择---');
            
        }
    });
}
