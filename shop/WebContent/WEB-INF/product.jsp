<%@ page language="java" contentType="text/html; charset=gb2312"
	pageEncoding="gb2312"  %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
	
<html>
<head>
<title>网上商城</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link rel="stylesheet" href="style/subcategory1.css" type="text/css">
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
            <td width="50%">　
             <a href="index.jsp" class="red">首页</a> 
             &gt; <a href="category.jsp?id=${product.category.id}" class="red" >${product.category.name}</a>
             &gt; <a href="subcategory.jsp?id=${product.subCategory.id }" class="red">${product.subCategory.name}</a>
           &gt; 产品
            </td>
            <td width="50%" valign="middle" align="center"> 
              <select name="mnuCategory">
                <option value="${CategoryID}" selected>在本类商城中</option>
                
                <!-- 选择类别开始  -->
                
                <option value="${CategoryID}" >在${CategoryName}中</option>
                
                <!-- 选择类别结束  -->
                
              </select>
              <input type="text" name="textPname" size="20" maxlength="50">
              <input type="submit" name="Submit2" value="搜索">
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
</form>
<table width="760" border="0" cellspacing="0" cellpadding="0" align="center">
  <tr> 
    <td width="75%" valign="top" align="left"> 
      <table width="98%" border="0" cellspacing="2" cellpadding="2">
        <tr> 
          <td rowspan="4" align="left" valign="top" width="18%">
          <img src="images/product/${product.bigImg}"></td>
          <td width="82%" class="productName"> 
            <form name="cartform" method="post" action="cart.jsp">
              ${product.name} 
              <!-- 判断是否显示打折标识:price not eq 0 -->  
              <c:if test="${!(product.price eq 0) }">          
              <img src="images/hotprice.gif" width="24" height="24"> 
              </c:if>
              <!-- 判断是否显示打折标识:price not eq 0 -->
              <input type="image" border="0"  src="images/addtocart.gif" width="30" height="18" alt="加入购物车">
              <input type="hidden" name="productId" value="${product.id}">
              <input type="hidden" name="productCount" value="1">
              <input type="hidden" name="op" value="add">
              
            </form>
          </td>
        </tr>
        <tr> 
          <td width="82%">${product.supplier}　${product.author}</td>
        </tr>
        <tr> 
          <td width="82%">出版日期：${product.pubDate}　图书编码：${product.id}</td>
        </tr>
        <tr> 
          <td width="82%"> 
            <!-- 判断是否显示原价[price not eq 0] -->
            <c:if test="${!(product.price eq 0) }">
            原价：<span class="hotPrice">${product.price}</span>元　
            </c:if> 
            <!-- 判断是否显示原价[price not eq 0] -->
            <c:if test="${!(product.listPrice eq 0) }">
            <!-- 判断是否显示原价[listPrice not eq 0] -->
            现价： ${product.listPrice}元
            </c:if>
            <!-- 判断是否显示原价[listPrice not eq 0] -->
            </td>
        </tr>
        <tr> 
          <td colspan="2">${product.description}</td>
        </tr>
      </table>
      <table width="98%" border="0" cellspacing="0" cellpadding="0">
        <tr> 
          <td width="31%" valign="middle" align="center" height="22" class="bestselltitle">读者评论</td>
          <td width="69%">&nbsp;</td>
        </tr>
        <tr align="center" valign="top"> 
          <td colspan="2" class="bestsellbox"> 
            <table width="98%" border="0" cellspacing="2" cellpadding="2">
              <tr> 
                <td width="34%" height="17">&nbsp;</td>
                <td width="40%" height="17">&nbsp;</td>
                <td width="26%" height="17">&gt;&gt; <a href="#" onClick="MM_openBrWindow('review.jsp','','scrollbars=yes,width=500,height=300')">我要评论</a> 
                  &lt;&lt;</td>
              </tr>
              <!-- 评论开始 -->
              <c:forEach items="${reviewList }" var="review">
              <tr> 
                <td bgcolor="#E4E4E4"><a href="mailto:${review.email}">${review.name}</a>
                </td>
                <td colspan="2" align="center" bgcolor="#E4E4E4">${review.time}</td>
              </tr>
              <tr> 
                <td colspan="3">${review.content}</td>
              </tr>
              <tr> 
                <td colspan="3" height="1" bgcolor="#E1E1E1"></td>
              </tr>
              </c:forEach>
              <!-- 评论结束 -->
              
              <tr align="center"> 
                <td colspan="3"> 
                  <table border="0" width="50%">
                    <tr> 
                      <td width="23%" align="center"> 
                        <c:if test="${pager.pageCount gt 0 }">
                           <a href="product.jsp?id=${product.id}&currentPage=1" class="navi">第一页</a> 
                        </c:if>
                      </td>
                      <td width="31%" align="center"> 
                        <c:if test="${pager.hasPrev }">                  
                          <a href="product.jsp?id=${product.id}&currentPage=${pager.currentPage-1}" class="navi">前一页</a> 
                        </c:if>
                      </td>
                      <td width="23%" align="center"> 
                        <c:if test="${pager.hasNext }">                  
                         <a href="product.jsp?id=${product.id}&currentPage=${pager.currentPage+1}" class="navi">下一页</a> 
                        </c:if>
                      </td>
                      <td width="23%" align="center"> 
                        <c:if test="${pager.pageCount gt 0 }">                  
                         <a href="product.jsp?id=${product.id}&currentPage=${pager.pageCount}" class="navi">最末页</a> 
                        </c:if>
                      </td>
                    </tr>
                  </table>
                  <!-- 如果有评论 -->
                  <c:if test="${fn:length(reviewList) gt 0 }">
                  第${pager.firstRow+1} 到${pager.lastRow+1}条评论，共${pager.totalRows}条 
                  </c:if>
                  <!-- 如果有评论 -->
                  <!-- 如果没有评论 -->
                  <c:if test="${fn:length(reviewList) eq 0 }">
                  该商品目前没有任何评论。 
                  </c:if>
                  <!-- 如果没有评论 -->
                </td>
              </tr>
              <tr> 
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&gt;&gt; <a href="#" onClick="MM_openBrWindow('review.asp','','scrollbars=yes,width=500,height=300')">我要评论</a> 
                  &lt;&lt;</td>
              </tr>
            </table>
          </td>
        </tr>
      </table>
    </td>
    <td width="25%" align="right" valign="top"> 
      <table width="100%" border="0" cellspacing="0" cellpadding="4" class="commendbox">
        <tr> 
          <td height="22" align="center" class="commendtitle" colspan="2">商品评分</td>
        </tr>>
        <c:if test="${ratings.number != 0}">
        <tr> 
          <td colspan="2">以下是本商品得分情况：</td>
        </tr>
        <tr> 
          <td width="65%"> 
            <table width="70" border="0" cellspacing="0" cellpadding="0" background="images/rating/rate_back.gif" height="15">
              <tr> 
                <td> 
                  <table width="${ratings.gragWidth}px" border="0" cellspacing="0" cellpadding="0" height="15" background="images/rating/5.gif">
                    <tr> 
                      <td>&nbsp;</td>
                    </tr>
                  </table>
                </td>
              </tr>
            </table>
          </td>
          <td width="35%"> 
            ${ratings.aveRage}分
          </td>
        </tr>
        <tr> 
          <td colspan="2">共有${ratings.number}位顾客为本商品评分</td>
        </tr>
        <tr> 
          <td colspan="2">最高分：${ratings.highRate}分</td>
        </tr>
        <tr> 
          <td colspan="2">最低分：${ratings.lowRate}分</td>
        </tr>
        </c:if>

        <tr> 
        <c:if test="${ratings.number == 0 }">
          <td colspan="2">目前还没有顾客对此商品评分</td>
        </c:if>
        </tr>
        <tr align="center" bgcolor="#CCCCFF"> 
          <td colspan="2">&gt;&gt;&gt; 请您评分 &lt;&lt;&lt;</td>
        </tr>
        <tr align="center"> 
          <td colspan="2"> 
            <form name="rating_form" method="POST" action="product_rating.do">
              <table width="90%" border="0" cellspacing="2" cellpadding="2">
                <tr> 
                  <td width="24%"> 
                    <input type="radio" name="rating.rateLevel" value="5" checked>
                  </td>
                  <td width="76%"><img src="images/rating/5.gif" width="70" height="15"></td>
                </tr>
                <tr> 
                  <td width="24%"> 
                    <input type="radio" name="rating.rateLevel" value="4">
                  </td>
                  <td width="76%"><img src="images/rating/4.gif" width="70" height="15"></td>
                </tr>
                <tr> 
                  <td width="24%"> 
                    <input type="radio" name="rating.rateLevel" value="3">
                  </td>
                  <td width="76%"><img src="images/rating/3.gif" width="70" height="15"></td>
                </tr>
                <tr> 
                  <td width="24%"> 
                    <input type="radio" name="rating.rateLevel" value="2">
                  </td>
                  <td width="76%"><img src="images/rating/2.gif" width="70" height="15"></td>
                </tr>
                <tr> 
                  <td width="24%"> 
                    <input type="radio" name="rating.rateLevel" value="1">
                  </td>
                  <td width="76%"><img src="images/rating/1.gif" width="70" height="15"></td>
                </tr>
                <tr align="center"> 
                  <td colspan="2"> 
                    <input type="submit" name="Submit" value="评 分">
                    <input type="hidden" name="id" value="${product.id}">
                  </td>
                </tr>
              </table>
              <input type="hidden" name="MM_insert" value="true">
            </form>
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
