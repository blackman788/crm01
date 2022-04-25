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
function open_cus_detail(value){
    $('#flag').val(value)
    if($('#flag').val()==2){
        back_display_cus_detail()
        return
    }
    $('#cus_inquirie').dialog('open')
}

//初始模版
$('#cus_inquirie').dialog({
    title:'添加客户信息',
    iconCls:'icon-save',
    resizable:true,
    modal:true,
    closed:true,
    closable:false,
    resizable:false,
    draggable:true,
    buttons:[{
            text:'保存',
            iconCls:'icon-ok',
            handler:function(){
                flag= $('#flag'),val()
                if(flag == 1){
                    add_cus_form()
                }else if(flag == 2){
                    pass
                    //update_cus_form()
                }else{
                    return
                }
                
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

//修改客户信息框返显数据
function back_display_cus_detail(){
    idx = $('#ddg').datagrid('getChecked')

    if(idx.length==0){
        $.messager.alert('提示','必须选择一条才能修改','info');
        return
    }else if(idx.length>1){
        $.messager.alert('提示','只能选择一条进行修改','info');
        return
    }
    $.ajax({
        'type':'get',
        'url':'/customer/back_cus_detail/',
        'dataType':'json',
        'data':{'id':idx[0].id},
        'success':function(result){
            if(result.code == 200){
                var obj = result.data;
                $('#id').val(obj.id);
                $('#khno').val(obj.khno);
                $('#name').val(obj.name);
                $('#cus_area').combobox('select', obj.area);
                $('#cusManager').val(obj.cusManager);
                $('#level').combobox('select', obj.level);
                $('#cus_myd').combobox('select', obj.myd);
                $('#cus_xyd').combobox('select', obj.xyd);
                $('#postCode').val(obj.postCode);
                $('#phone').val(obj.phone);
                $('#fax').val(obj.fax);
                $('#website').val(obj.website);
                $('#address').val(obj.address);
                $('#yyzzzch').val(obj.yyzzzch);
                $('#fr').val(obj.fr);
                $('#zczj').val(obj.zczj);
                $('#nyye').val(obj.nyye);
                $('#khyh').val(obj.khyh);
                $('#khzh').val(obj.khzh);
                $('#dsdjh').val(obj.dsdjh);
                $('#gsdjh').val(obj.gsdjh);
                $('#cus_inquirie').dialog('open')
            }
        },
        'error':function(result){
            console.log(result)
        },
    })
}
