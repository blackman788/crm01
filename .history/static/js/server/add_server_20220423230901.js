
function sumbit_add_server_form(){
    $('#fm').form('submit', {
        url:'{% url "server:sumbit_add_server_form" %}',
        success:function(data){
            console.log(result)
        }
    });
}