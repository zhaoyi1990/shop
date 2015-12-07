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
<table width="760" border="0" cellspacing="0" cellpadding="0" align="center">
  <tr>
    <td background="images/topback.gif" width="130"><img src="images/sitelogo.gif" height="88"></td>
    <td background="images/topback.gif" width="500" align="center" valign="middle"><a href="http://www.fans8.com" target="_blank"><img src="images/fans8.gif" width="468" height="60" border="0"></a></td>
    <td background="images/topback.gif" width="130"><table width="100%" border="0" cellspacing="2" cellpadding="2">
        <tr>
          <td valign="middle" align="center">
          	<a href="cart.jsp"><img src="images/button_cart.gif" width="87" height="18" border="0"></a>
          </td>
        </tr>
        <tr>
          <td valign="middle" align="center">
          	<a href="checkorder.jsp"><img src="images/button_ddcx.gif" width="87" height="18" border="0"></a>
          </td>
        </tr>
        <tr>
          <td valign="middle" align="center">
          	<a href="customer_register.jsp"><img src="images/button_regist.gif" width="87" height="18" border="0"></a>
          </td>
        </tr>
      </table></td>
  </tr>
</table>
<form name="form2" method="post" action="">
  <table width="760" border="0" cellspacing="1" cellpadding="0" align="center" bgcolor="#000000">
    <tr>
      <td bgcolor="#FF9900" height="22" valign="middle" align="center"><table width="80%" border="0" cellspacing="2" cellpadding="2">
          <tr align="center" valign="middle">
            <td><a href="productList_new.do" class="white">新品快递</a></td>
            <td><a href="productList_commend.do" class="white">重点推荐</a></td>
            <td><a href="productList_sell.do" class="white">销售排行</a></td>
            <td><a href="productList_price.do" class="white">特价商品</a></td>
          </tr>
        </table></td>
    </tr>
    <tr>
      <td bgcolor="#FFCC66" height="22"><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td>　<a href="index.jsp" class="red">首页</a> &gt; 重点推荐</td>
            <td>&nbsp;</td>
          </tr>
        </table></td>
    </tr>
  </table>
</form>
<table width="760" border="0" cellspacing="0" cellpadding="0" align="center">
  <tr>
    <td height="30" valign="middle">　　<img src="images/commend.gif" width="190" height="30"></td>
  </tr>
  <c:forEach items="${productList }" var="product" varStatus="status">
    <c:if test="${status.index%2==0 }"><tr></c:if>
    <td><table>
        <tr align="center" valign="top">
          <td><table width="380" border="0" cellspacing="2" cellpadding="2">
              <tr>
                <td rowspan="3" width="111" align="left" valign="top"><A HREF="product.jsp?id=${product.id}"><img src="images/product/${product.smallImg}" border="0"></A></td>
                <td width="255" valign="middle" class="productName"><A HREF="product.jsp?id=${product.id}">${product.name}</A></td>
              </tr>
              <tr>
                <td width="255" valign="middle">${product.author}</td>
              </tr>
              <tr>
                <td width="255" valign="middle">${product.supplier}</td>
              </tr>
            </table></td>
        </tr>
      </table></td>
      <c:if test="${status.count%2==0 }"></tr></c:if>
  </c:forEach>
  <tr>
    <td colspan="2">&nbsp;
      <table border="0" width="50%" align="center">
        <tr>
          <td width="23%" align="center"><c:if test="${pager.pageCount gt 0 }"> <a href="product_commend.do?currentPage=1" class="navi">第一页</a> </c:if></td>
          <td width="31%" align="center"><c:if test="${pager.hasPrev }"> <a href="product_commend.do?currentPage=${pager.currentPage-1}" class="navi">前一页</a> </c:if></td>
          <td width="23%" align="center"><c:if test="${pager.hasNext }"> <a href="product_commend.do?currentPage=${pager.currentPage+1}" class="navi">下一页</a> </c:if></td>
          <td width="23%" align="center"><c:if test="${pager.pageCount gt 0 }"> <a href="product_commend.do?currentPage=${pager.pageCount}" class="navi">最末页</a> </c:if></td>
        </tr>
      </table></td>
  </tr>
</table>
<br>
<table width="760" border="0" cellspacing="0" cellpadding="0" align="center">
  <tr>
    <td background="images/topback.gif" align="center" height="16"><font color="#FFFFFF">copyright 
      2001 Powered by Peter.HJ</font></td>
  </tr>
</table>
</body>
</html>
