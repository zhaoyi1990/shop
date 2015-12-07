<%@ page language="java" contentType="text/html; charset=gb2312"
	pageEncoding="gb2312"  %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
	
<html>
<head>
<title>�����̳�</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link rel="stylesheet" href="style/${category.style}" type="text/css">
</head>
<body bgcolor="#FFFFFF" text="#000000" topmargin="2">
<table width="760" border="0" cellspacing="0" cellpadding="0" align="center">
  <tr> 
    <td background="images/topback.gif" width="130"><img src="images/sitelogo.gif" height="88"></td>
    <td background="images/topback.gif" width="500" align="center" valign="middle">
    <table width="468" border="0" cellspacing="0" cellpadding="0">

					<tr>

						<td align="center" valign="middle"><a href="#"
							target="_blank"><img src="adbanner/fans8.gif" width="468"
								height="60" border="0" alt=".:: ���Ծ��ֲ� ::."></a></td>

					</tr>
				</table>
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
<form name="search_form" method="get" action="quick_search.asp">
  <table width="760" border="0" cellspacing="1" cellpadding="0" align="center" bgcolor="#000000">
    <tr> 
      <td bgcolor="#FF9900" height="22" valign="middle" align="center"><table width="80%" border="0" cellspacing="2" cellpadding="2">
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
            <td width="50%" height="30">��<a href="index.jsp" class="red">��ҳ</a> 
              &gt;${category.name}</td>
            <td width="50%" valign="middle" height="30" align="center"> 
              <select name="mnuCategory">
                <option value="${category.id}" selected>�ڱ����̳���</option>
                <option value="1">��ͼ���̳���</option>
                <option value="2">��Ӱ���̳���</option>
                <option value="3">�������̳���</option>
              </select>
              <input type="text" name="textPname" size="20" maxlength="50">
              <input type="submit" name="Submit" value="����">
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
</form>
<table width="760" border="0" cellspacing="0" cellpadding="0" align="center">
  <tr> 
    <td width="360" valign="middle"> 
      <!-- ѭ����ʾ�������ƣ���ÿ��4�еķ�ʽ��ʾ-->
      <table>
        
        <c:forEach items="${category.children}" var="subCategory" varStatus="status" >
        
        <c:if test="${status.index % 4==0 }">
            
            <tr  valign="top">
           
             
        </c:if>
        
          <td> 
              <img src="images/category/square.gif" width="9" height="9">
              <a href="subcategory.jsp?id=${subCategory.id }" class="subcate">${subCategory.name}</a>
          </td>
          
        <c:if test="${status.count % 4==0 }">
        
            </tr>
           
             
        </c:if>
        
        </c:forEach>
        
      </table>
      <!-- ѭ����ʾ�������ƣ���ÿ��4�еķ�ʽ��ʾ-->
    </td>
    <td valign="bottom" align="right"><img src="images/category/${category.bigImg}"></td>
  </tr>
</table>
<table width="760" border="0" cellspacing="0" cellpadding="0" align="center">
  <tr> 
    <td colspan="2">&nbsp;</td>
  </tr>
  <tr> 
    <td valign="top" align="left" width="380"> 
      <table width="98%" border="0" cellspacing="0" cellpadding="0">
        <tr> 
          <td class="bar1" >�����¡�Ʒ</td>
        </tr>
        <tr> 
          <td valign="top"> 
            <table width="100%" border="0" cellspacing="2" cellpadding="2" class="bar1content">
              <!--��Ʒ�б�ʼ -->
              <c:forEach items="${newProductList}" var="product">
              <tr valign="top"> 
                <td rowspan="3"><a href="product.jsp?id=${product.id}">
                   <img src="images/product/${product.smallImg}" border="0"></a>
                </td>
                <td width="72%"><a href="product.jsp?id=${product.id }" class="productName">${product.name}</a>
                </td>
              </tr>
              <tr> 
                <td width="72%">${product.author}</td>
              </tr>
              <tr> 
                <td width="72%">${fn:substring(product.description,0,100)}
											${fn:length(product.description)>100?"...":""}</td>
              </tr>
              <tr> 
                <td width="25%" height="8"></td>
                <td width="72%" height="8"></td>
              </tr>
              
              <tr> 
                <td width="25%">&nbsp;</td>
                <td width="72%">&nbsp;</td>
              </tr>
              </c:forEach>
              <!--��Ʒ�б���� -->
            </table>
          </td>
        </tr>
      </table>
      <br>
      <table width="98%" border="0" cellspacing="0" cellpadding="0">
        <tr> 
          <td class="bar2">��������</td>
        </tr>
        <tr> 
          <td> 
            <table width="100%" border="0" cellspacing="2" cellpadding="2" class="bar2content">
              <!--�����б�ʼ -->
              <c:forEach items="${discountProductList }" var="product">
              <tr valign="top"> 
                <td rowspan="3"><a href="product.jsp?id=${product.id }"><img src="images/product/${product.smallImg}" border="0"></a></td>
                <td width="72%"><a href="product.jsp?id=${product.id }" class="productName">${product.name}</a></td>
              </tr>
              <tr> 
                <td width="72%">${product.author}</td>
              </tr>
              <tr> 
                <td width="72%">${fn:substring(product.description,0,80)}
											${fn:length(product.description)>80?"...":""}</td>
              </tr>
              <tr> 
                <td width="25%">&nbsp;</td>
                <td width="72%">ԭ�ۣ�<span class="hotPrice">${product.price}</span>Ԫ���ּۣ�${product.listPrice}Ԫ</td>
              </tr>
              <tr> 
                <td width="25%" height="8"></td>
                <td width="72%" height="8"></td>
              </tr>
             
              <tr> 
                <td width="25%">&nbsp;</td>
                <td width="72%">&nbsp;</td>
              </tr>
              </c:forEach>
               <!--�����б���� -->
            </table>
          </td>
        </tr>
      </table>
    </td>
    <td width="380" align="right" valign="top"> 
      <table width="98%" border="0" cellspacing="0" cellpadding="0">
        <tr> 
          <td class="bar2">�����ơ���</td>
        </tr>
        <tr> 
          <td valign="top"> 
            <table width="100%" border="0" cellspacing="2" cellpadding="2" class="bar2content">
              <!-- �Ƽ��б�ʼ-->
              <c:forEach items="${commendProductList }" var="product">
              <tr valign="top"> 
                <td rowspan="3"><a href="product.jsp?"><img src="images/product/${product.smallImg}" border="0"></a>
                </td>
                <td width="72%"><a href="product.asp?" class="productName">${product.name}</a>
                </td>
              </tr>
              <tr> 
                <td width="72%">${product.author}</td>
              </tr>
              <tr> 
                <td width="72%">${fn:substring(product.description,0,100)}
											${fn:length(product.description)>100?"...":""}
                </td>
              </tr>
              <tr> 
                <td width="25%" height="8"></td>
                <td width="72%" height="8"></td>
              </tr>
              
              <tr> 
                <td width="25%">&nbsp;</td>
                <td width="72%">&nbsp;</td>
              </tr>
              </c:forEach>
              <!-- �Ƽ��б����-->
              
            </table>
          </td>
        </tr>
      </table>
      <br>
      <table width="98%" border="0" cellspacing="0" cellpadding="0">
        <tr> 
          <td class="bar1">�����ȡ���</td>
        </tr>
        <tr> 
          <td valign="top"> 
            <table width="100%" border="0" cellspacing="2" cellpadding="2" class="bar1content">
             <!-- �����б�ʼ-->
             <c:forEach items="${bestSellProductList}" var="product">
              <tr valign="top"> 
                <td rowspan="3"><a href="product.jsp?">
                <img src="images/product/${product.smallImg}" border="0"></a></td>
                <td width="72%">
                <a href="product.asp?" class="productName">
				${product.name}</a>
                </td>
              </tr>
              <tr> 
                <td width="72%">${product.author}</td>
              </tr>
              <tr> 
                <td width="72%"> ${fn:substring(product.description,0,100)}
											${fn:length(product.description)>100?"...":""}
                </td>
              </tr>
              <tr> 
                <td width="25%" height="8"></td>
                <td width="72%" height="8"></td>
              </tr>
            
              <tr> 
                <td width="25%">&nbsp;</td>
                <td width="72%">&nbsp;</td>
              </tr>
              </c:forEach>
              <!-- �����б����-->
            </table>
          </td>
        </tr>
      </table>
    </td>
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
