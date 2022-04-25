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
                flag= $('#flag').val()
                if(1 == flag){
                    add_cus_form()
                }else if(2 == flag){
                    update_cus_form()
                }
                
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
            inquire_cus_detail()
            
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
//发送修改框的提交请求
function update_cus_form(){
    $('#add').form('submit', {
        url:'/customer/update_cus_detail/',
        success:function(data){
            obj= JSON.parse(data)
            $.messager.show({
                title:'提交状态',
                msg:obj.msg,
                timeout:5000,
                showType:'slide'
            });
            
            $('#cus_inquirie').dialog('close')
            inquire_cus_detail()
            
        }
    });
}

function delete_cus_detail(){
    idx = $('#ddg').datagrid('getChecked')
    id = ''
    for(i=0;i<idx.length;i++){
        if(i == idx.length-1){
            id += idx[i].id
        }else{
            id += idx[i].id +','
        }
    }
    $.ajax({
        'type': 'POST',
        'url': '/sales/delete_sale_chance/',
        'data': {
            'ids': id
        },
        'dataType': 'json',
        'success': function (result) {
            // 显示提示信息
            $.messager.show({
                title: '提示',
                msg: result.msg,
                timeout: 5000
            });

            if (200 == result.code){
            inquire_cus_detail}
        },
        'error': function (result) {
            console.log(result);
        }
    });
}