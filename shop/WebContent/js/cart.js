/**
 * 
 */

function update() {

	var xmlhttp;
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}

	var inputs = document.getElementsByName("count");
	var args = ""
	for (i = 0; i < inputs.length; i++) {
		args += "count[]=" + inputs[i].value + "&";
	}

	var url = "cart.jsp?" + args + "op=update";
	xmlhttp.open("GET", url, true);
	xmlhttp.send(null);

}