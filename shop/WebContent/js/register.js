/**
 * 
 */

function formValidate(form){
	var input =document.getElementsByClassName("input");
	
	for(i=0;i<input.length;i++){
		if(input[i].value.length==0){
			alert("请完整输入信息再提交。");
			return false;
		}
	}
	var reg= /^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+(.[a-zA-Z0-9_-])+/; 
	if(!reg.test(input[0].value)){
		alert("邮箱格式不正确，请重新输入。");
		return false;
	}
	if(input[1].value!=input[2].value){
		alert("两次输入的密码不相同，请重新输入。");
		return false;
	}
	return true;
}