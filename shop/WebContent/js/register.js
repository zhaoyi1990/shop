/**
 * 
 */

function formValidate(form){
	var input =document.getElementsByClassName("input");
	
	for(i=0;i<input.length;i++){
		if(input[i].value.length==0){
			alert("������������Ϣ���ύ��");
			return false;
		}
	}
	var reg= /^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+(.[a-zA-Z0-9_-])+/; 
	if(!reg.test(input[0].value)){
		alert("�����ʽ����ȷ�����������롣");
		return false;
	}
	if(input[1].value!=input[2].value){
		alert("������������벻��ͬ�����������롣");
		return false;
	}
	return true;
}