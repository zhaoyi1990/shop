<%@ page language="java" contentType="text/html; charset=gb2312"
	pageEncoding="gb2312"  %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
	
<html>
<head>
<title>网上商城</title>
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
								height="60" border="0" alt=".:: 狂迷俱乐部 ::."></a></td>

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
            <td width="50%" height="30">　<a href="index.jsp" class="red">首页</a> 
              &gt;${category.name}</td>
            <td width="50%" valign="middle" height="30" align="center"> 
              <select name="mnuCategory">
                <option value="${category.id}" selected>在本类商城中</option>
                <option value="1">在图书商城中</option>
                <option value="2">在影视商城中</option>
                <option value="3">在音乐商城中</option>
              </select>
              <input type="text" name="textPname" size="20" maxlength="50">
              <input type="submit" name="Submit" value="搜索">
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
      <!-- 循环显示子类名称，按每行4列的方式显示-->
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
      <!-- 循环显示子类名称，按每行4列的方式显示-->
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
          <td class="bar1" >　　新　品</td>
        </tr>
        <tr> 
          <td valign="top"> 
            <table width="100%" border="0" cellspacing="2" cellpadding="2" class="bar1content">
              <!--新品列表开始 -->
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
              <!--新品列表结束 -->
            </table>
          </td>
        </tr>
      </table>
      <br>
      <table width="98%" border="0" cellspacing="0" cellpadding="0">
        <tr> 
          <td class="bar2">　　打　折</td>
        </tr>
        <tr> 
          <td> 
            <table width="100%" border="0" cellspacing="2" cellpadding="2" class="bar2content">
              <!--打折列表开始 -->
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
                <td width="72%">原价：<span class="hotPrice">${product.price}</span>元　现价：${product.listPrice}元</td>
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
               <!--打折列表结束 -->
            </table>
          </td>
        </tr>
      </table>
    </td>
    <td width="380" align="right" valign="top"> 
      <table width="98%" border="0" cellspacing="0" cellpadding="0">
        <tr> 
          <td class="bar2">　　推　荐</td>
        </tr>
        <tr> 
          <td valign="top"> 
            <table width="100%" border="0" cellspacing="2" cellpadding="2" class="bar2content">
              <!-- 推荐列表开始-->
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
              <!-- 推荐列表结束-->
              
            </table>
          </td>
        </tr>
      </table>
      <br>
      <table width="98%" border="0" cellspacing="0" cellpadding="0">
        <tr> 
          <td class="bar1">　　热　卖</td>
        </tr>
        <tr> 
          <td valign="top"> 
            <table width="100%" border="0" cellspacing="2" cellpadding="2" class="bar1content">
             <!-- 热买列表开始-->
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
              <!-- 热买列表结束-->
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
