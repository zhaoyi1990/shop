<%@ page language="java" contentType="text/html; charset=gb2312"
	pageEncoding="gb2312"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<html>
<head>
<title>网上商城</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link rel="stylesheet" href="style.css" type="text/css">
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
						<td valign="middle" align="center"><a href="checkorder.jsp"><img
								src="images/button_ddcx.gif" width="87" height="18" border="0"></a></td>
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
						<td><a href="productList_new.do" class="white">新品快递</a></td>

						<td><a href="productList_commend.do" class="white">重点推荐</a></td>

						<td><a href="productList_sell.do" class="white">销售排行</a></td>

						<td><a href="productList_price.do" class="white">特价商品</a></td>
					</tr>
				</table>
			</td>
		</tr>
		<tr>
			<td bgcolor="#FFCC66" height="22">
				<table width="100%" border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td><a href="index.jsp" class="red">首页</a> &gt; 定单查询</td>
						<td>&nbsp;</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
	<table width="760" border="0" cellspacing="0" cellpadding="0"
		align="center">
		<tr>
			<td><img src="images/checkorder.gif" width="190" height="30">
				<table width="80%" border="0" cellspacing="2" cellpadding="2"
					align="center">
					<tr align="center" valign="middle">
						<td height="24" class="productName" colspan="3">${sessionScope.user.realname}，您好！以下是您的所有定单信息。</td>
					</tr>
					<tr align="center" valign="middle">
						<td height="24" class="productName" bgcolor="#5880A8"><font
							color="#FFFFFF">定单号</font></td>
						<td height="24" class="productName" bgcolor="#5880A8"><font
							color="#FFFFFF">下单日期</font></td>
						<td height="24" class="productName" bgcolor="#5880A8"><font
							color="#FFFFFF">是否完成处理</font></td>
					</tr>
					<!--订单列表 -->
					
					<c:forEach items="${orderList }" var="order">
					<tr align="center" valign="middle">
						<td height="24" bgcolor="#D9D9DB"><a href="orderdetail.jsp?orderId=${order.orderId }"
							class="productName">${order.orderId }</a></td>
						<td height="24" bgcolor="#D9D9DB" class="productName">${order.orderDate}</td>
						<td height="24" bgcolor="#D9D9DB">
							<!-- 订单是否处理完成：Fulfilled  --> <c:choose>
								<c:when test="${order.finished}">
									<span class="productName">是</span>
								</c:when>
								<c:otherwise>
									<!-- 订单是否没有处理完成 -->
									<span class="productName">否</span>
									<!-- 订单是否没有处理完成 -->
								</c:otherwise>
							</c:choose> <!-- 订单是否处理完成  -->
						</td>
					</tr>
					</c:forEach>
					<!--订单列表 -->
				</table>
				<p>&nbsp;</p></td>
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
