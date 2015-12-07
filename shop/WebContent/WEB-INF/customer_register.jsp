<%@ page language="java" contentType="text/html; charset=gb2312"
	pageEncoding="gb2312"  %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
	
<html>
<head>
<title>网上商城</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link rel="stylesheet" href="style.css" type="text/css">
<script src="http://libs.baidu.com/jquery/1.9.1/jquery.min.js"></script>
<c:if test="${fail!=null}">
	<script type="text/javascript">
		var fail = "${fail}";
		alert(fail);
	</script>
</c:if>
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
    <td bgcolor="#FF9900" height="22" valign="middle" align="center"><table width="80%" border="0" cellspacing="2" cellpadding="2">
          <tr align="center" valign="middle"> 
            <td><a href="productList_new.do" class="white">新品快递</a></td>
            
    <td><a href="productList_commend.do" class="white">重点推荐</a></td>
            
    <td><a href="productList_sell.do" class="white">销售排行</a></td>
            
    <td><a href="productList_price.do" class="white">特价商品</a></td>
          </tr>
        </table><!-- #EndLibraryItem --></td>
  </tr>
  <tr> 
    <td bgcolor="#FFCC66" height="22"> 
      <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr> 
          <td>　<a href="index.jsp" class="red">首页</a> &gt; 新用户注册</td>
          <td>&nbsp;</td>
        </tr>
      </table>
    </td>
  </tr>
</table>
<table width="760" border="0" cellspacing="1" cellpadding="0" align="center" bgcolor="#000000">
  <tr> 
    <td bgcolor="#FFFFFF"> 
      <form name="form1" method="POST" action="register.action" onSubmit="return formValidate(this);">
        　　　<img src="images/newregister.gif" width="190" height="30"> <br>
        
        <table width="80%" border="0" cellspacing="2" cellpadding="2" align="center" bgcolor="#CCCCCC">
          <tr bgcolor="#FFFFCC"> 
            <td colspan="2" height="24">　以下内容将作为你登录时的凭证，请认真填写！</td>
          </tr>
          <tr bgcolor="#FFFFFF"> 
            <td width="34%" align="right">电子邮件：</td>
            <td width="66%"> 
              <input type="text" class="input"id="email" name="customer.email" maxlength="100">
            </td>
          </tr>
          <tr bgcolor="#FFFFFF"> 
            <td width="34%" align="right">密码：</td>
            <td width="66%"> 
              <input type="password" class="input"id="pass"name="customer.password" maxlength="10">
              密码需大于4位小于10位</td>
          </tr>
          <tr bgcolor="#FFFFFF"> 
            <td width="34%" align="right">确认密码：</td>
            <td width="66%"> 
              <input type="password"class="input" id="comf" name="comfpass" maxlength="10">
            </td>
          </tr>
          <tr bgcolor="#FFFFCC"> 
            <td colspan="2" height="24">　以下内容将用于你取回忘记的密码，请牢记～</td>
          </tr>
          <tr bgcolor="#FFFFFF"> 
            <td width="34%" align="right">取回密码问题：</td>
            <td width="66%"><input type="text"class="input" name="customer.passwordQuestion" maxlength="100"></td>
          </tr>
          <tr bgcolor="#FFFFFF"> 
            <td width="34%" align="right">取回密码答案：</td>
            <td width="66%"> 
              <input type="password" class="input"name="customer.passwordAnswer" maxlength="100">
            </td>
          </tr>
          <tr bgcolor="#FFFFCC"> 
            <td colspan="2" height="24">　请准确填写自己真实的相关信息，以便我们正确的为你提供服务。</td>
          </tr>
          <tr bgcolor="#FFFFFF"> 
            <td width="34%" align="right">真实姓名：</td>
            <td width="66%"> 
              <input type="text"class="input" name="customer.realname" maxlength="50">
            </td>
          </tr>
          <tr bgcolor="#FFFFFF"> 
            <td width="34%" align="right">城市：</td>
            <td width="66%"> 
              <input type="text" class="input" name="customer.city" maxlength="50">
            </td>
          </tr>
          <tr bgcolor="#FFFFFF"> 
            <td width="34%" align="right" height="17">详细地址：</td>
            <td height="17" width="66%"> 
              <textarea class="input" name="customer.address" rows="3" cols="30"></textarea>
            </td>
          </tr>
          <tr bgcolor="#FFFFFF"> 
            <td width="34%" align="right">邮编：</td>
            <td width="66%"> 
              <input type="text"class="input" name="customer.zip" maxlength="10">
            </td>
          </tr>
          <tr bgcolor="#FFFFFF"> 
            <td width="34%" align="right">电话：</td>
            <td width="66%"> 
              <input type="text"class="input"name="customer.phone" maxlength="50">
            </td>
          </tr>
          <tr bgcolor="#FFFFFF" valign="middle"> 
            <td colspan="2" align="center"> 
              <input type="submit" name="Submit" value="注册">
              　　　 
              <input type="reset" name="Submit2" value="重填">
            </td>
          </tr>
        </table>
        <p>&nbsp;</p>
        <input type="hidden" name="MM_insert" value="true">
      </form>
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
<script src="js/register.js" charset="gb2312"></script>
</body>
</html>
