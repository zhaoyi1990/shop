<%@ page language="java" contentType="text/html; charset=gb2312"
	pageEncoding="gb2312"  %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>



<html>
<head>
<title>�����̳�</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link rel="stylesheet" href="style.css" type="text/css">
</head>
<body bgcolor="#FFFFFF" text="#000000" topmargin="2">


<table width="760" border="0" cellspacing="0" cellpadding="0" align="center">
  <tr> 
    <td background="images/topback.gif" width="130"><img src="images/sitelogo.gif" height="88"></td>
    <td background="images/topback.gif" width="500" align="center" valign="middle"><a href="http://www.fans8.com" target="_blank"><img src="images/fans8.gif" width="468" height="60" border="0"></a> 
    </td>
    <td background="images/topback.gif" width="130"> 
    
<table width="100%" border="0" cellspacing="2" cellpadding="2">
        <tr> 
          <td valign="middle" align="center"><a href="cart.jsp"><img src="images/button_cart.gif" width="87" height="18" border="0"></a></td>
        </tr>
        <tr> 
          <td valign="middle" align="center"><a href="checkorder.jsp"><img src="images/button_ddcx.gif" width="87" height="18" border="0"></a></td>
        </tr>
        <tr> 
          
    <td valign="middle" align="center"><a href="customer_register.jsp"><img src="images/button_regist.gif" width="87" height="18" border="0"></a></td>
        </tr>
      </table>
</td>
  </tr>
</table>
<table width="760" border="0" cellspacing="1" cellpadding="0" align="center" bgcolor="#000000">
  <tr> 
    <td bgcolor="#FF9900" height="22" valign="middle" align="center">
    
<table width="80%" border="0" cellspacing="2" cellpadding="2">
          <tr align="center" valign="middle"> 
            <td><a href="product_new.do" class="white">��Ʒ���</a></td>
            
    <td><a href="product_commend.do" class="white">�ص��Ƽ�</a></td>
            
    <td><a href="product_sell.do" class="white">��������</a></td>
            
    <td><a href="product_price.do" class="white">�ؼ���Ʒ</a></td>
          </tr>
        </table>
</td>
  </tr>
  <tr> 
    <td bgcolor="#FFCC66" height="22"> 
      <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr> 
          <td>��<a href="index.jsp">��ҳ</a> &gt; ����ȷ��</td>
          <td>&nbsp;</td>
        </tr>
      </table>
    </td>
  </tr>
</table>
<table width="760" border="0" cellspacing="0" cellpadding="0" align="center">
  <tr> 
    <td width="1" bgcolor="#000000"></td>
    <td align="center" valign="top" width="758"> 
      <p>&nbsp;</p>
      <span class="productName">${sessionScope.user.realname},����~��</span><br>
      <form name="form1" method="POST" action="orderdetail.jsp?op=add">
        <table width="90%" border="0" cellspacing="2" cellpadding="2">
          <tr bgcolor="#E1E1E1"> 
            <td colspan="3" height="24" class="productName">�����������������Ʒ</td>
          </tr>
          <tr bgcolor="#999999"> 
            <td colspan="3" height="1"></td>
          </tr>
          <!-- �������Ʒ�б�ʼ -->
          <c:forEach items="${ sessionScope.cart.itemList }" var="item">
          <tr> 
            <td width="50%"><b>��Ʒ��ţ�</b>${item.productId}</td>
            <td colspan="2"><b>��Ʒ���ƣ�</b>${item.productName}</td>
          </tr>
          <tr> 
            <td width="50%"><b>�������ۣ�</b>${item.productPrice}Ԫ</td>
            <td colspan="2"><b>�ء�������</b>${item.productWeigh}����</td>
          </tr>
          <tr> 
            <td width="50%"><b>����������</b>${item.productCount}</td>
            <td colspan="2">&nbsp;</td>
          </tr>
          <tr> 
            <td colspan="3" height="1" bgcolor="#999999"></td>
          </tr>
          </c:forEach>
          <!-- �������Ʒ�б���� -->
          <tr bgcolor="#E1E1E1" valign="middle"> 
            <td colspan="2">����������${fn:length(sessionScope.cart.itemList)}����Ʒ������Ϊ${sessionScope.cart.weight}����ܼƷ���Ϊ��${sessionScope.cart.total}Ԫ��</td>
            <td width="20%" align="center">
            <a href="cart.jsp"><img src="images/updatecart.gif" width="87" height="24" border="0"></a></td>
          </tr>
        </table>
        <br>
        <table width="90%" border="0" cellspacing="2" cellpadding="2">
          <tr bgcolor="#E1E1E1"> 
            <td colspan="3" height="24" class="productName">��������д�ջ��˵���ϸ��Ϣ��Ĭ��Ϊ����ע����Ϣ��</td>
          </tr>
          <tr> 
            <td colspan="3" height="1" bgcolor="#999999"></td>
          </tr>
          <tr> 
            <td colspan="2"><b>�ջ��������� 
              <input type="text" name="order.name" value="${sessionScope.user.realname}" class="textbox">
              </b></td>
            <td width="48%"><b>�ջ��˳��У� 
              <input type="text" name="order.city" value="${sessionScope.user.city}" class="textbox">
              </b></td>
          </tr>
          <tr> 
            <td colspan="2"><b>�ջ��˵绰�� 
              <input type="text" name="order.phone" value="${sessionScope.user.phone}" class="textbox">
              </b></td>
            <td width="48%"><b>�ջ����ʱࣺ 
              <input type="text" name="order.zip" value="${sessionScope.user.zip}" class="textbox">
              </b></td>
          </tr>
          <tr> 
            <td width="13%"><b>�ջ��˵�ַ�� </b></td>
            <td valign="top" colspan="2"><b>
              <textarea name="order.addres" cols="50" rows="3" class="textbox">${sessionScope.user.address}</textarea>
            </b></td>
          </tr>
          <tr> 
            <td valign="top" colspan="2"><b>���ʽ�� 
              <select name="order.payMethodId">
                <!-- �б�ѡ�� -->
                < <c:forEach items="${paymethodList }" var="paymenthod" >
                <option value="${paymenthod.id}" >${paymenthod.name}</option>
                </c:forEach>
                <!-- �б�ѡ�� -->

              </select>
              </b></td>
            <td width="48%"><b>�ջ���ʽ�� 
              <select name="order.shippingId">
                <c:forEach items="${shippingList }" var="shipping">
                <option value="${shipping.id}" >${shipping.name}</option>
                </c:forEach>
                
              </select>
              </b></td>
          </tr>
          <tr> 
            <td colspan="3" height="1" bgcolor="#999999"></td>
          </tr>
          <tr bgcolor="#E1E1E1" align="center" valign="middle"> 
            <td colspan="3" height="25"> 
              <input type="submit" value="�ύ����">>
            </td>
          </tr>
        </table>
        <input type="hidden" name="order.customerId" value="${sessionScope.user.id}">
        <input type="hidden" name="MM_insert" value="true">
      </form>
    </td>
    <td width="1" bgcolor="#000000"></td>
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
