<%@ page language="java" contentType="text/html; charset=gb2312"
	pageEncoding="gb2312"%>	
<html>
<head>
<title>�����̳ǹ���ϵͳ</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
<!--
td {  font-family: "����"; font-size: 12px}
.mid {  font-family: "����"; font-size: 14px; font-weight: bold}
.fillbox {  font-family: "����"; font-size: 14px; font-weight: bold; color: #006600; border-color: black black #408C00; border-style: solid; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 1px; border-left-width: 0px}
.sbutton {  font-family: "����"; font-size: 14px; color: #006600; background-color: #D0F0B3; font-weight: bold; padding-top: 1px; padding-bottom: 1px}
-->
</style>
</head>
<body bgcolor="#FFFFFF" text="#000000" topmargin="2">
<table width="760" border="0" cellspacing="0" cellpadding="0" align="center">
  <tr> 
    <td><img src="images/admin_left.gif" width="382" height="98"></td>
    <td><img src="images/admin_right.gif" width="378" height="98" usemap="#Map" border="0"></td>
  </tr>
</table>
<table width="760" border="0" cellspacing="0" cellpadding="0" align="center">
  <tr> 
    <td rowspan="3" bgcolor="#306898" width="1"></td>
    <td align="center"> 
      <p>&nbsp;</p>
      <table width="80%" border="0" cellspacing="0" cellpadding="0">
        <tr> 
          <td><img src="images/adminlog.gif" width="129" height="27"></td>
        </tr>
        <tr> 
          <td align="center"> 
            <form name="form1" method="post" action="admin_login.do">
              <p><span class="mid">�û�����</span> 
                <input type="text" name="admin.username" class="fillbox">
              </p>
              <p> <span class="mid">�ܡ��룺 </span> 
                <input type="password" name="admin.password" class="fillbox">
              </p>
              <p> 
                <input type="submit" value="�ǡ�¼" class="sbutton">
              </p>
            </form>
          </td>
        </tr>
      </table>
      ������ </td>
    <td rowspan="3" bgcolor="#306898" width="1"></td>
  </tr>
  <tr> 
    <td>&nbsp;</td>
  </tr>
  <tr> 
    <td height="4" bgcolor="#306898"></td>
  </tr>
</table>
<table width="760" border="0" cellspacing="0" cellpadding="0" align="center">
  <tr> 
    <td background="images/admin_b1.gif" width="643" align="right" class="mid"><font color="#FFFFFF">copyright 
      2001 Powered By</font></td>
    <td width="117"><a href="http://www.fans8.com"><img src="images/admin_b2.gif" width="117" height="28" border="0" alt="..:::  ���Ծ��ֲ�  :::.."></a></td>
  </tr>
</table>
<map name="Map"> 
  <area shape="rect" coords="135,20,235,41" href="cate_manage.asp">
  <area shape="rect" coords="256,20,357,43" href="order_manage.asp">
  <area shape="rect" coords="134,53,234,73" href="pro_manage.asp">
  <area shape="rect" coords="13,20,113,41" href="adminlogin.asp">
  <area shape="rect" coords="13,53,118,74" href="user_manage.asp">
  <area shape="rect" coords="254,52,355,74" href="ad_manage.asp">
</map>
</body>
</html>

