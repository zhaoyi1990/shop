<%@ page language="java" contentType="text/html; charset=gb2312"
	pageEncoding="gb2312"  %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
	
<html>
<head>
<title>�����̳�</title>
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
            <td><a href="productList_new.do" class="white">��Ʒ���</a></td>
            
    <td><a href="productList_commend.do" class="white">�ص��Ƽ�</a></td>
            
    <td><a href="productList_sell.do" class="white">��������</a></td>
            
    <td><a href="productList_price.do" class="white">�ؼ���Ʒ</a></td>
          </tr>
        </table><!-- #EndLibraryItem --></td>
  </tr>
  <tr> 
    <td bgcolor="#FFCC66" height="22"> 
      <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr> 
          <td>��<a href="index.jsp" class="red">��ҳ</a> &gt; ���û�ע��</td>
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
        ������<img src="images/newregister.gif" width="190" height="30"> <br>
        
        <table width="80%" border="0" cellspacing="2" cellpadding="2" align="center" bgcolor="#CCCCCC">
          <tr bgcolor="#FFFFCC"> 
            <td colspan="2" height="24">���������ݽ���Ϊ���¼ʱ��ƾ֤����������д��</td>
          </tr>
          <tr bgcolor="#FFFFFF"> 
            <td width="34%" align="right">�����ʼ���</td>
            <td width="66%"> 
              <input type="text" class="input"id="email" name="customer.email" maxlength="100">
            </td>
          </tr>
          <tr bgcolor="#FFFFFF"> 
            <td width="34%" align="right">���룺</td>
            <td width="66%"> 
              <input type="password" class="input"id="pass"name="customer.password" maxlength="10">
              ���������4λС��10λ</td>
          </tr>
          <tr bgcolor="#FFFFFF"> 
            <td width="34%" align="right">ȷ�����룺</td>
            <td width="66%"> 
              <input type="password"class="input" id="comf" name="comfpass" maxlength="10">
            </td>
          </tr>
          <tr bgcolor="#FFFFCC"> 
            <td colspan="2" height="24">���������ݽ�������ȡ�����ǵ����룬���μǡ�</td>
          </tr>
          <tr bgcolor="#FFFFFF"> 
            <td width="34%" align="right">ȡ���������⣺</td>
            <td width="66%"><input type="text"class="input" name="customer.passwordQuestion" maxlength="100"></td>
          </tr>
          <tr bgcolor="#FFFFFF"> 
            <td width="34%" align="right">ȡ������𰸣�</td>
            <td width="66%"> 
              <input type="password" class="input"name="customer.passwordAnswer" maxlength="100">
            </td>
          </tr>
          <tr bgcolor="#FFFFCC"> 
            <td colspan="2" height="24">����׼ȷ��д�Լ���ʵ�������Ϣ���Ա�������ȷ��Ϊ���ṩ����</td>
          </tr>
          <tr bgcolor="#FFFFFF"> 
            <td width="34%" align="right">��ʵ������</td>
            <td width="66%"> 
              <input type="text"class="input" name="customer.realname" maxlength="50">
            </td>
          </tr>
          <tr bgcolor="#FFFFFF"> 
            <td width="34%" align="right">���У�</td>
            <td width="66%"> 
              <input type="text" class="input" name="customer.city" maxlength="50">
            </td>
          </tr>
          <tr bgcolor="#FFFFFF"> 
            <td width="34%" align="right" height="17">��ϸ��ַ��</td>
            <td height="17" width="66%"> 
              <textarea class="input" name="customer.address" rows="3" cols="30"></textarea>
            </td>
          </tr>
          <tr bgcolor="#FFFFFF"> 
            <td width="34%" align="right">�ʱࣺ</td>
            <td width="66%"> 
              <input type="text"class="input" name="customer.zip" maxlength="10">
            </td>
          </tr>
          <tr bgcolor="#FFFFFF"> 
            <td width="34%" align="right">�绰��</td>
            <td width="66%"> 
              <input type="text"class="input"name="customer.phone" maxlength="50">
            </td>
          </tr>
          <tr bgcolor="#FFFFFF" valign="middle"> 
            <td colspan="2" align="center"> 
              <input type="submit" name="Submit" value="ע��">
              ������ 
              <input type="reset" name="Submit2" value="����">
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
