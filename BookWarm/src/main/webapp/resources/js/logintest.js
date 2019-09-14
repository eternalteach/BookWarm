console.log("login Test");

var user_id= sessionStorage.getItem('user_id');
if(user_id==null||user_id==undefined){
	window.location.href='index';
}