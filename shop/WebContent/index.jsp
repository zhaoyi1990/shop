<%@ page language="java" contentType="text/html; charset=gb2312"
	pageEncoding="gb2312"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<html>
<head>
<title>�����̳�</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link rel="stylesheet" href="style.css" type="text/css">
</head>
<body bgcolor="#FFFFFF" text="#000000" topmargin="2">
<table width="760" border="0" cellspacing="0" cellpadding="0" align="center">
  <tr>
    <td width="130" background="images/topback.gif"><img src="images/sitelogo.gif"  height="88"></td>
    <td background="images/topback.gif" width="500" align="center" valign="middle"><table width="468" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td align="center" valign="middle">
          	<a href="#" target="_blank"><img src="adbanner/fans8.gif" width="468" height="60" border="0" alt=".:: ���Ծ��ֲ� ::."></a>
          </td>
        </tr>
      </table></td>
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
<form name="search_form" method="get" action="quick_search.asp">
  <table width="760" border="0" cellspacing="1" cellpadding="0"
			align="center" bgcolor="#000000">
    <tr>
      <td bgcolor="#FF9900" height="22" valign="middle" align="center"><table width="80%" border="0" cellspacing="2" cellpadding="2">
          <tr align="center" valign="middle">
            <td><a href="productList_new.do" class="white">��Ʒ���</a></td>
            <td><a href="productList_commend.do" class="white">�ص��Ƽ�</a></td>
            <td><a href="productList_sell.do" class="white">��������</a></td>
            <td><a href="productList_price.do" class="white">�ؼ���Ʒ</a></td>
          </tr>
        </table></td>
    </tr>
    <tr>
      <td bgcolor="#FFCC66" height="22"><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="50%">${counterpic}</td>
            <td width="50%" valign="middle" align="center"><select
								name="mnuCategory">
                <option value="1" selected>��ͼ���̳���</option>
                <option value="2">��Ӱ���̳���</option>
                <option value="3">�������̳���</option>
              </select>
              <input type="text" name="textPname" size="20" maxlength="50">
              <input type="submit" name="Submit" value="����"></td>
          </tr>
        </table></td>
    </tr>
  </table>
</form>
<table width="760" border="0" cellspacing="0" cellpadding="0"
		align="center">
  <tr>
    <td width="160" valign="top"><table width="160" border="0" cellspacing="1" cellpadding="0"
					bgcolor="#000000">
        <tr>
          <td bgcolor="#006699" height="22" valign="middle">
          	<div align="center"> <font color="#FFFFFF">
          	  <img src="images/icon_arrow_d.gif" width="14" height="14"> ��Ʒ���� <img src="images/icon_arrow_d.gif" width="14" height="14"></font> 
          	</div>
          </td>
        </tr>
        <tr>
          <td bgcolor="#FFFFFF"><!--��ʼ������������ -->
            <table width="100%" border="0" cellspacing="2" cellpadding="2">
              <!-- ʹ��EL���ʽ(${""})��JSTL��ǩ����������ǩ  -->
              <c:forEach items="${categoryList}" var="category">
                <tr>
                  <td valign="middle" align="center"><a href="category.jsp?id=${category.id}">
                    <c:if test="${category.id==1}"><img src="images/${category.smallImg}" width="81" height="15" border="0"></c:if>
                    <c:if test="${category.id>1}"><img src="images/${category.smallImg}" width="81"height="20" border="0"></c:if>
                  </a></td>
                </tr>
                <tr>
                  <td align="center" bgcolor="#FFFFE8"><table width="100%" border="0" cellspacing="0"cellpadding="2">
                      <!-- ��Ʒ���࿪ʼ -->
                      <c:forEach items="${category.children}" var="subcategory">
                        <tr>
                          <td valign="middle" align="center" width="25%"><img src="images/board_arrow.gif" width="17" height="13"></td>
                          <td valign="middle" align="left" width="75%"><a href="subcategory.jsp?id=${subcategory.id}" class="white">${subcategory.name}</a></td>
                        </tr>
                      </c:forEach>
                      <!-- ��Ʒ������� -->
                    </table></td>
                </tr>
              </c:forEach>
              <tr>
                <td valign="middle" align="center">&nbsp;</td>
              </tr>
            </table>
            <!--���������������� --></td>
        </tr>
      </table></td>
    <td width="420" valign="top" align="center"><br>
      <table width="96%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td><img src="images/index_newproduct.gif" width="303" height="19"></td>
        </tr>
        <tr>
          <td><!-- ���²�Ʒ��ʼ -->
            <table width="100%" border="0" cellspacing="2" cellpadding="2">
              <c:forEach items="${newProductList}" var="product">
                <tr>
                  <td rowspan="3" width="25%" align="center">
                    <a href="product.jsp?id=${product.id }"><img src="images/product/${product.smallImg}" border="0"></a>
                  </td>
                  <td width="75%">
                    <a href="product.jsp?id=${product.id }" class="productName">${product.name}</a>
                  </td>
                </tr>
                <tr>
                  <td width="75%" class="a">${product.author}</td>
                </tr>
                <tr>
                  <td width="75%">${fn:substring(product.description,0,100)}
                    ${fn:length(product.description)>100?"...":""}</td>
                </tr>
              </c:forEach>
            </table>
            <!-- ���²�Ʒ���� --></td>
        </tr>
        <tr>
          <td valign="bottom" align="right">&nbsp;</td>
        </tr>
      </table>
      <br>
      <table width="96%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td align="right"><img src="images/index_commend.gif" width="303" height="19"></td>
        </tr>
        <tr>
          <td><!--�Ƽ���Ʒ��ʼ -->
            <table width="100%" border="0" cellspacing="2" cellpadding="2" height="52">
              <c:forEach items="${commendProductList }" var="product">
                <tr>
                  <td width="75%" align="right">
                    <a href="product.jsp?id=${product.id }" class="productName">${product.name}</a>
                  </td>
                  <td rowspan="3" align="center">
                  	<a href="product.jsp?id=${product.id }"><img src="images/product/${product.smallImg}" border="0"> </a>
                  </td>
                </tr>
                <tr>
                  <td width="75%" align="right">${product.author}</td>
                </tr>
                <tr>
                  <td width="75%">${fn:substring(product.description,0,100)}
                    ${fn:length(product.description)>100?"...":""}</td>
                </tr>
              </c:forEach>
            </table></td>
        </tr>
        <tr>
          <td>&nbsp;</td>
        </tr>
      </table>
      <!--�Ƽ���Ʒ���� -->
      <br>
      <table width="96%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td><img src="images/index_hotprice.gif" width="303" height="19"></td>
        </tr>
        <tr>
          <td><!-- �ۿ���Ʒ��ʼ-->
            <table width="100%" border="0" cellspacing="2" cellpadding="2">
              <c:forEach items="${discountProductList }" var="product">
                <tr>
                  <td rowspan="3" width="18%" align="center">
                  	<a href="product.jsp?id=${product.id }"><img src="images/product/${product.smallImg}" border="0"></a>
                  </td>
                  <td colspan="2">
                  	<a href="product.jsp?id=${product.id }" class="productName">${product.name}</a>
                  </td>
                </tr>
                <tr>
                  <td colspan="2">${product.author}</td>
                </tr>
                <tr>
                  <td width="20%">ԭ�ۣ�<span class="hotPrice">${product.price}</span>Ԫ </td>
                  <td width="80%">�ּۣ�${product.listPrice}Ԫ</td>
                </tr>
                <tr>
                  <td colspan="3">${fn:substring(product.description,0,100)}
                    ${fn:length(product.description)>100?"...":""}</td>
                </tr>
              </c:forEach>
            </table>
            <!-- �ۿ���Ʒ����--></td>
        </tr>
        <tr>
          <td valign="bottom" align="right">&nbsp;</td>
        </tr>
      </table></td>
    <td width="180" valign="top"><table width="180" border="0" cellspacing="1" cellpadding="0"
					bgcolor="#000000">
        <tr>
          <td bgcolor="#006699" height="22" valign="middle">
          	<div align="center"><font color="#FFFFFF"><img src="images/nav_document.gif" width="16" height="16"> �����ȵ�</font></div>
          </td>
        </tr>
        <tr>
          <td bgcolor="#FFFFFF" align="center" valign="top"><table width="100%" border="0" cellspacing="2" cellpadding="2">
              <tr>
                <td><table width="100%" border="0" cellspacing="0" cellpadding="2">
                    <!-- �����ȵ㿪ʼ -->
                    <c:forEach items="${hotProductList}" var="product">
                      <tr>
                        <td width="10%" align="center" valign="top"><img src="images/board_arrow_u.gif" width="17" height="13"></td>
                        <td width="90%" align="left" valign="middle"><a href="product.jsp?id=${product.id }" class="red">${product.name}</a></td>
                      </tr>
                    </c:forEach>
                    <!-- �����ȵ���� -->
                  </table></td>
              </tr>
            </table></td>
        </tr>
      </table>
      <br>
      <table width="180" border="0" cellspacing="1" cellpadding="0"
					bgcolor="#000000">
        <tr>
          <td bgcolor="#FFCC66" height="22" valign="middle"><div align="center"><font color="#FFFFFF">
          <img src="images/icon_arrow_u.gif" width="14" height="14"> </font>�������� <img src="images/icon_arrow_u.gif" width="14" height="14"> 
          </div></td>
        </tr>
        <tr>
          <td bgcolor="#FFFFFF"><table width="100%" border="0" cellspacing="2" cellpadding="2">
              <tr>
                <td><table width="100%" border="0" cellspacing="0" cellpadding="2">
                    <!--�������п�ʼ-->
                    <c:forEach items="${sellProductList}" var="product">
                      <tr>
                        <td width="10%" align="center" valign="top"><img src="images/board_arrow_u.gif" width="17" height="13"></td>
                        <td width="90%" align="left" valign="middle"><a href="product.jsp?id=${product.id }" class="red">${product.name}</a></td>
                      </tr>
                    </c:forEach>
                    <!--�������п�ʼ-->
                  </table></td>
              </tr>
            </table></td>
        </tr>
      </table></td>
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
