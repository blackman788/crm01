$('#fm').form('submit', {
    url:'{% url "server:sumbit_add_server_form" %}',
    success:function(data){
		alert(data)
    }
});