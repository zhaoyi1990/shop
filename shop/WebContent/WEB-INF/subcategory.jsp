<%@ page language="java" contentType="text/html; charset=gb2312"
	pageEncoding="gb2312"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<html>
<head>
<title>�����̳�</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link rel="stylesheet" href="style/${subCategory.style}" type="text/css">
</head>
<body bgcolor="#FFFFFF" text="#000000" topmargin="2">
	<table width="760" border="0" cellspacing="0" cellpadding="0"
		align="center">
		<tr>
			<td background="images/topback.gif" width="130"><img
				src="images/sitelogo.gif" height="88"></td>
			<td background="images/topback.gif" width="500" align="center"
				valign="middle">
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
	<form name="search_form" method="get" action="quick_search.asp">
		<table width="760" border="0" cellspacing="1" cellpadding="0"
			align="center" bgcolor="#000000">
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
							<td width="50%"><a href="index.jsp" class="red">��ҳ</a> &gt;
								<a href="category.jsp?id=${subCategory.category.id }"
								class="red">${subCategory.category.name}</a> &gt;
								${subCategory.name}</td>
							<td width="50%" align="center" valign="middle"><select
								name="mnuCategory">
									<option value="${CategoryID}" selected>�ڱ����̳���</option>
									<option value="1">��ͼ���̳���`</option>
									<option value="2">��Ӱ���̳���</option>
									<option value="3">�������̳���</option>
							</select> <input type="text" name="textPname" size="20" maxlength="50">
								<input type="submit" name="Submit" value="����"></td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
	</form>
	<table width="760" border="0" cellspacing="0" cellpadding="0"
		align="center">
		<tr>
			<td width="75%" valign="top" align="left">
				<table width="100%" border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td width="49%"><img
							src="images/subcategory/${subCategory.img}"></td>
						<td width="51%" valign="bottom" align="center">
							<form name="form1" method="get" action="subcategory.jsp?id=${subCategory.id}">
								<input type="hidden" name="SubCategoryID"> ��Ʒ�� <select
									name="order" class="list">
									<option value="AddDate" selected>�ϼ�ʱ��</option>
									<option value="ListPrice">��ǰ�۸�</option>
									<option value="PubDate">����ʱ��</option>
									<option value="Sell">��������</option>
									<option value="Visits">�������</option>
								</select> �� <select name="sort" class="list">
									<option value="DESC" selected>����</option>
									<option value="ASC">����</option>
								</select> <input type="submit" value="����">
							</form>
						</td>
					</tr>
				</table>
				<table width="100%" border="0" cellspacing="2" cellpadding="2">
					<tr>
						<td valign="middle" align="left">��ǰΪ�� ${pager.firstRow+1} ��
							${pager.lastRow+1} ����¼����${pager.totalRows}����Ʒ��Ϣ</td>
					</tr>
				</table>

				<table width="99%" border="0" cellspacing="2" cellpadding="5">
					<!-- ��Ӧ����Ĳ�Ʒ��ҳ�б�ʼ -->
					<c:forEach items="${productList }" var="product">


						<tr>
							<td rowspan="3" width="20%" valign="top" align="center"><a
								href="product.jsp?id=${product.id}"><img
									src="images/product/${product.smallImg}" border="0" /></a></td>
							<td width="80%"><a href="product.jsp?id=${product.id }"
								class="productName">${product.name}</a> <!-- �ж��Ƿ���ʾ�ۿ�ͼ�꿪ʼ --> <c:if
									test="${product.hotDeal}">
									<img src="images/hotprice.gif" width="24" height="24">
								</c:if> <!-- �ж��Ƿ���ʾ�ۿ�ͼ�����--> <a
								href="cart.jsp?productId=${product.id }&productName=${product.name }&productPrice=${product.price }&productCount=1&op=add">
									<img border=0 src="images/addtocart.gif" width="30" height="18"
									alt="��ӵ����ﳵ">
							</a></td>
						</tr>
						<tr>
							<td width="80%">
								<!-- �Ƿ���ʾԭ�ۣ�������price not eq 0 --> 
                                <c:if test="${product.price != 0 }"> ԭ�ۣ�<span class="hotPrice">${product.price}</span>Ԫ </c:if> 
                                <!-- �Ƿ���ʾԭ�� --> 
                              	  �ּۣ�${product.listPrice}Ԫ

							</td>
						</tr>
						<tr>
							<td width="80%">${fn:substring(product.description,0,100)}
								${fn:length(product.description)>100?"...":""}</td>
						</tr>

					</c:forEach>

					<!-- ��Ӧ����Ĳ�Ʒ��ҳ�б���� -->
					<tr>
						<td colspan="2" height="1" bgcolor="#CCCCCC"></td>
					</tr>

				</table>

				<table width="100%" border="0" cellspacing="2" cellpadding="2">
					<tr>
						<td>��ǰΪ�� ${pager.firstRow+1} �� ${pager.lastRow+1}
							����¼����${pager.totalRows}����Ʒ��Ϣ</td>
					</tr>
					<tr>
						<td align="center">
							<table border="0" width="90%">
								<tr>
									<td width="15%" align="left">
										<!--�Ƿ���ʾ��һҳ --> <c:if test="${pager.pageCount gt 0 }">
											<a href="subcategory.jsp?id=${subCategory.id}&currentPage=1"
												class="navi">��һҳ</a>
										</c:if> <!--�Ƿ���ʾ��һҳ -->
									</td>
									<td width="15%" align="left">
										<!--�Ƿ���ʾǰһҳ --> <c:if test="${pager.hasPrev }">
											<a
												href="subcategory.jsp?id=${subCategory.id}&currentPage=${pager.currentPage-1}"
												class="navi">ǰһҳ</a>
										</c:if> <!--�Ƿ���ʾǰһҳ -->
									</td>
									<td width="40%" align="center"></td>
									<td width="15%" align="right">
										<!--�Ƿ���ʾ��һҳ --> <c:if test="${pager.hasNext }">
											<a
												href="subcategory.jsp?id=${subCategory.id}&currentPage=${pager.currentPage+1}"
												class="navi">��һҳ</a>
										</c:if> <!--�Ƿ���ʾ��һҳ -->
									</td>
									<td width="15%" align="right">
										<!--�Ƿ���ʾ��ĩҳ --> <c:if test="${pager.pageCount gt 0 }">
											<a
												href="subcategory.jsp?id=${subCategory.id}&currentPage=${pager.pageCount}"
												class="navi">��ĩҳ</a>
										</c:if> <!--�Ƿ���ʾ��ĩҳ -->
									</td>
								</tr>
							</table>
						</td>
					</tr>
				</table>
			</td>
			<td width="25%" valign="top" align="right">
				<table width="100%" border="0" cellspacing="2" cellpadding="2"
					class="commendbox">
					<tr valign="top">
						<td align="center" valign="middle" colspan="2" height="24"
							class="commendtitle">.:: �����Ƽ���Ʒ ::.</td>
					</tr>

					<c:forEach items="${commendProductList}" var="product">
						<tr>
							<td width="8%" height="17" valign="top"><img
								src="images/category/square.gif" width="9" height="9"></td>
							<td height="17"><a href="product.jsp?id=${product.id }"
								class="commend">${fn:substring(product.name,0,10)}
							${fn:length(product.name)>10?"...":""}</a></td>
						</tr>
					</c:forEach>

					<tr>
						<td colspan="2">&nbsp;</td>
					</tr>
				</table> <br>
				<table width="100%" border="0" cellspacing="2" cellpadding="2"
					class="bestsellbox">
					<tr valign="top">
						<td align="center" valign="middle" colspan="2" height="24"
							class="bestselltitle">.:: ���೩������ ::.</td>
					</tr>

					<c:forEach items="${bestSellProductList }" var="product">

						<tr>
							<td width="8%" height="17" valign="top"><img
								src="images/category/square.gif" width="9" height="9"></td>
							<td height="17"><a href="product.jsp?id=${product.id }"
								class="bestsell">${fn:substring(product.name,0,10)}
							${fn:length(product.name)>10?"...":""}</a></td>
						</tr>

					</c:forEach>
					<tr>
						<td colspan="2">&nbsp;</td>
					</tr>
				</table> <br>
				<table width="100%" border="0" cellspacing="2" cellpadding="2"
					class="commendbox">
					<tr>
						<td align="center" valign="middle" height="24"
							class="commendtitle">.:: ����������� ::.</td>
					</tr>
					<tr>
						<td>
							<form name="comp_form" method="get" action="comp_search.asp">
								<table width="100%" border="0" cellspacing="2" cellpadding="2">
									<tr>
										<td width="54%" align="right" valign="middle">��Ʒ��:</td>
										<td width="46%" align="left" valign="middle"><input
											type="text" name="tex_name" size="15"></td>
									</tr>
									<tr>
										<td width="54%" align="right" valign="middle">����/��Ա:</td>
										<td width="46%" align="left" valign="middle"><input
											type="text" name="tex_author" size="15"></td>
									</tr>
									<tr>
										<td width="54%" align="right" valign="middle">���浥λ:</td>
										<td width="46%" align="left" valign="middle"><input
											type="text" name="tex_supply" size="15"></td>
									</tr>
									<tr>
										<td width="54%" align="right" valign="middle">��������:</td>
										<td width="46%" align="left" valign="middle"><select
											name="menu_pub">
												<option value="1" selected>���г�������</option>
												<option value="date()-PubDate&lt;7">���ܳ��淢��</option>
												<option value="date()-PubDate&lt;15">������ڳ���</option>
												<option value="date()-PubDate&gt;30">һ����ǰ����</option>
												<option value="date()-PubDate&gt;90">������ǰ����</option>
												<option value="date()-PubDate&gt;180">����ǰ����</option>
												<option value="date()-PubDate&gt;365">һ��ǰ����</option>
										</select></td>
									</tr>
									<tr>
										<td width="54%" align="right" valign="middle">�ۿ۷�Χ:</td>
										<td width="46%" align="left" valign="middle"><select
											name="menu_hotdeal">
												<option value="1" selected>���۴������</option>
												<option value="HotDeal=YES">���д��۵�</option>
												<option value="HotDeal=NO">���в����۵�</option>
										</select></td>
									</tr>
									<tr>
										<td width="54%" align="right" valign="middle">�ۼ۷�Χ:</td>
										<td width="46%" align="left" valign="middle"><select
											name="menu_price">
												<option value="1" selected>���м۸�</option>
												<option value="ListPrice&lt;5">����5Ԫ��</option>
												<option value="ListPrice&lt;10">����10Ԫ��</option>
												<option value="ListPrice&lt;30">����30Ԫ��</option>
												<option value="ListPrice&gt;50">����50Ԫ��</option>
												<option value="ListPrice&gt;100">����100Ԫ��</option>
										</select></td>
									</tr>
									<tr valign="middle">
										<td colspan="2" align="center"><input type="hidden"
											name="h_subcateid" value="${SubCategoryID}"> <input
											type="submit" value="��ʼ����"> <input type="reset"
											value="�������" name="submit2"></td>
									</tr>
								</table>
							</form>
						</td>
					</tr>
				</table>
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
