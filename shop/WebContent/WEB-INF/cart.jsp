<%@ page language="java" contentType="text/html; charset=gb2312"
	pageEncoding="gb2312"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<html>
<head>
<title>�����̳�</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">

<link rel="stylesheet" href="style.css" type="text/css">


<script src="js/cart.js" type="text/javascript"></script>
<script type="text/javascript">
	
</script>

</head>
<body bgcolor="#FFFFFF" text="#000000" topmargin="2">
	<table width="760" border="0" cellspacing="0" cellpadding="0"
		align="center">
		<tr>
			<td background="images/topback.gif" width="130"><img
				src="images/sitelogo.gif" height="88"></td>
			<td background="images/topback.gif" width="500" align="center"
				valign="middle"><a href="http://www.fans8.com" target="_blank"><img
					src="images/fans8.gif" width="468" height="60" border="0"></a></td>
			<td background="images/topback.gif" width="130">
				<table width="100%" border="0" cellspacing="2" cellpadding="2">
					<tr>
						<td valign="middle" align="center"><a href="cart.jsp"><img
								src="images/button_cart.gif" width="87" height="18" border="0"></a></td>
					</tr>
					<tr>
						<td valign="middle" align="center"><a
							href="checkorder.jsp"><img src="images/button_ddcx.gif"
								width="87" height="18" border="0"></a></td>
					</tr>
					<tr>

						<td valign="middle" align="center"><a
							href="customer_register.jsp"><img
								src="images/button_regist.gif" width="87" height="18" border="0"></a></td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
	<table width="760" border="0" cellspacing="1" cellpadding="0"
		align="center" bgcolor="#000000">
		<tr>
			<td bgcolor="#FF9900" height="22" valign="middle" align="center">
				<table width="80%" border="0" cellspacing="2" cellpadding="2">
					<tr align="center" valign="middle">
						<td><a href="productList_new.do" class="white">��Ʒ���</a></td>

						<td><a href="productList_commend.do" class="white">�ص��Ƽ�</a></td>

						<td><a href="productList_sell.do" class="white">��������</a></td>

						<td><a href="productList_price.do" class="white">�ؼ���Ʒ</a></td>
					</tr>
				</table>
			</td>
		</tr>
		<tr>
			<td bgcolor="#FFCC66" height="22">
				<table width="100%" border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td><a href="index.jsp" class="red">��ҳ</a> &gt; ���ﳵ</td>
						<td>&nbsp;</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
	<table width="760" border="0" cellspacing="0" cellpadding="0"
		align="center">
		<tr>
			<td><img src="images/yourcart.gif" width="190" height="30">

                
                
                
                
				<form name="form1" method="post" action="cart.jsp">
					<table width="98%" border="0" cellspacing="2" cellpadding="2"
						align="center">
						<tr valign="middle" align="center" bgcolor="#E1E1E1">
							<td height="24" width="27%"><b>��Ʒ���</b></td>
							<td height="24" width="34%"><b>��Ʒ����</b></td>
							<td height="24" width="11%"><b>����</b></td>
							<td height="24" width="10%"><b>����</b></td>
							<td height="24" width="18%"><b>�ϼ�</b></td>
						</tr>

						<!-- �������б�ʼ -->
						<c:forEach items="${ sessionScope.cart.itemList }" var="item"
							varStatus="status">

							<tr align="center" valign="middle">
								<td width="27%">${item.productId}</td>
								<td width="34%">${item.productName}</td>
								<td width="11%">${item.productPrice}Ԫ</td>
								<td width="10%"><input type="text" name="count" size="8"
									maxlength="8" value="${item.productCount}"></td>
								<td width="18%">${item.productPrice * item.productCount }Ԫ</td>
							</tr>
						</c:forEach>
						<!-- �������б���� -->

						<tr align="center" valign="middle">
							<td colspan="5" bgcolor="#CCCCCC" height="2"></td>
						</tr>
						<tr>
							<td width="27%">&nbsp;</td>
							<td width="34%">&nbsp;</td>
							<td align="right" width="11%" bgcolor="#E0E0E0"><b>�ܼƷ��ã�</b></td>
							<td colspan="2" id="total">${cart.total}Ԫ</td>
						</tr>
						<tr align="center" valign="baseline">
							<td></td>
							<td colspan="2"><a href="cart.jsp" onClick="update();">
									<img alt="" border="0" src="images/updatecart.gif" width="87"
									height="24">
							</a> <a href="cart.jsp?op=clean"><img border=0
									src="images/emptycart.gif" width="87" height="24"></a></td>
							<td colspan="2">
								<c:if test="${fn:length(sessionScope.cart.itemList) gt 0 }">
                            		<a href="order.jsp"><img src="images/check.gif" width="120" height="35" border="0"></a>
								</c:if>
								<c:if test="${fn:length(sessionScope.cart.itemList) eq 0 }">
									<font color="red">����û�й��</font>
								</c:if>
                            </td>
						</tr>
					</table>
				</form>  
                </td>
		</tr>
	</table>




	<br>
	<table width="760" border="0" cellspacing="0" cellpadding="0"
		align="center">
		<tr>
			<td background="images/topback.gif" align="center" height="16"><font
				color="#FFFFFF">copyright 2001 Powered by Peter.HJ</font></td>
		</tr>
	</table>
</body>
</html>

