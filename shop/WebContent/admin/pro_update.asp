<%@LANGUAGE="VBSCRIPT"%>
<!--#include file="../Connections/conneshop.asp" -->
<%
' *** Restrict Access To Page: Grant or deny access to this page
MM_authorizedUsers="admin,category,product"
MM_authFailedURL="logfail.asp"
MM_grantAccess=false
If Session("MM_Username") <> "" Then
  If (false Or CStr(Session("MM_UserAuthorization"))="") Or _
         (InStr(1,MM_authorizedUsers,Session("MM_UserAuthorization"))>=1) Then
    MM_grantAccess = true
  End If
End If
If Not MM_grantAccess Then
  MM_qsChar = "?"
  If (InStr(1,MM_authFailedURL,"?") >= 1) Then MM_qsChar = "&"
  MM_referrer = Request.ServerVariables("URL")
  if (Len(Request.QueryString()) > 0) Then MM_referrer = MM_referrer & "?" & Request.QueryString()
  MM_authFailedURL = MM_authFailedURL & MM_qsChar & "accessdenied=" & Server.URLEncode(MM_referrer)
  Response.Redirect(MM_authFailedURL)
End If
%>
<%
' *** Edit Operations: declare variables

MM_editAction = CStr(Request("URL"))
If (Request.QueryString <> "") Then
  MM_editAction = MM_editAction & "?" & Request.QueryString
End If

' boolean to abort record edit
MM_abortEdit = false

' query string to execute
MM_editQuery = ""
%>
<%
' *** Update Record: set variables

If (CStr(Request("MM_update")) <> "" And CStr(Request("MM_recordId")) <> "") Then

  MM_editConnection = MM_conneshop_STRING
  MM_editTable = "Products"
  MM_editColumn = "ProductID"
  MM_recordId = "'" + Request.Form("MM_recordId") + "'"
  MM_editRedirectUrl = "actionok.asp"
  MM_fieldsStr  = "pid|value|pname|value|cateid|value|subcateid|value|supply|value|author|value|description|value|price|value|listprice|value|hotdeal|value|pubdate|value|commend|value|simg|value|bimg|value|stock|value|sell|value|visit|value|weight|value"
  MM_columnsStr = "ProductID|',none,''|ProductName|',none,''|CategoryID|none,none,NULL|SubCategID|none,none,NULL|Supplier|',none,''|Author|',none,''|Description|',none,''|Price|none,none,NULL|ListPrice|none,none,NULL|HotDeal|none,none,NULL|PubDate|',none,''|Commend|none,none,NULL|sImgUrl|',none,''|bImgUrl|',none,''|Stock|none,none,NULL|Sell|none,none,NULL|Visits|none,none,NULL|UnitWeight|none,none,NULL"

  ' create the MM_fields and MM_columns arrays
  MM_fields = Split(MM_fieldsStr, "|")
  MM_columns = Split(MM_columnsStr, "|")
  
  ' set the form values
  For i = LBound(MM_fields) To UBound(MM_fields) Step 2
    MM_fields(i+1) = CStr(Request.Form(MM_fields(i)))
  Next

  ' append the query string to the redirect URL
  If (MM_editRedirectUrl <> "" And Request.QueryString <> "") Then
    If (InStr(1, MM_editRedirectUrl, "?", vbTextCompare) = 0 And Request.QueryString <> "") Then
      MM_editRedirectUrl = MM_editRedirectUrl & "?" & Request.QueryString
    Else
      MM_editRedirectUrl = MM_editRedirectUrl & "&" & Request.QueryString
    End If
  End If

End If
%>
<%
' *** Update Record: construct a sql update statement and execute it

If (CStr(Request("MM_update")) <> "" And CStr(Request("MM_recordId")) <> "") Then

  ' create the sql update statement
  MM_editQuery = "update " & MM_editTable & " set "
  For i = LBound(MM_fields) To UBound(MM_fields) Step 2
    FormVal = MM_fields(i+1)
    MM_typeArray = Split(MM_columns(i+1),",")
    Delim = MM_typeArray(0)
    If (Delim = "none") Then Delim = ""
    AltVal = MM_typeArray(1)
    If (AltVal = "none") Then AltVal = ""
    EmptyVal = MM_typeArray(2)
    If (EmptyVal = "none") Then EmptyVal = ""
    If (FormVal = "") Then
      FormVal = EmptyVal
    Else
      If (AltVal <> "") Then
        FormVal = AltVal
      ElseIf (Delim = "'") Then  ' escape quotes
        FormVal = "'" & Replace(FormVal,"'","''") & "'"
      Else
        FormVal = Delim + FormVal + Delim
      End If
    End If
    If (i <> LBound(MM_fields)) Then
      MM_editQuery = MM_editQuery & ","
    End If
    MM_editQuery = MM_editQuery & MM_columns(i) & " = " & FormVal
  Next
  MM_editQuery = MM_editQuery & " where " & MM_editColumn & " = " & MM_recordId

  If (Not MM_abortEdit) Then
    ' execute the update
    Set MM_editCmd = Server.CreateObject("ADODB.Command")
    MM_editCmd.ActiveConnection = MM_editConnection
    MM_editCmd.CommandText = MM_editQuery
    MM_editCmd.Execute
    MM_editCmd.ActiveConnection.Close

    If (MM_editRedirectUrl <> "") Then
      Response.Redirect(MM_editRedirectUrl)
    End If
  End If

End If
%>
<%
Dim proup__MMColParam
proup__MMColParam = "1"
if (Request.QueryString("ProductID") <> "") then proup__MMColParam = Request.QueryString("ProductID")
%>
<%
set proup = Server.CreateObject("ADODB.Recordset")
proup.ActiveConnection = MM_conneshop_STRING
proup.Source = "SELECT * FROM Products WHERE ProductID = '" + Replace(proup__MMColParam, "'", "''") + "'"
proup.CursorType = 0
proup.CursorLocation = 2
proup.LockType = 3
proup.Open()
proup_numRows = 0
%>
<%
Dim catename__MMColParam
catename__MMColParam = "1"
if (Request.QueryString("ProductID") <> "") then catename__MMColParam = Request.QueryString("ProductID")
%>
<%
set catename = Server.CreateObject("ADODB.Recordset")
catename.ActiveConnection = MM_conneshop_STRING
catename.Source = "SELECT CategoryName  FROM Products INNER JOIN Categories ON  Products.CategoryID= Categories.CategoryID  WHERE ProductID = '" + Replace(catename__MMColParam, "'", "''") + "'"
catename.CursorType = 0
catename.CursorLocation = 2
catename.LockType = 3
catename.Open()
catename_numRows = 0
%>
<%
set allcate = Server.CreateObject("ADODB.Recordset")
allcate.ActiveConnection = MM_conneshop_STRING
allcate.Source = "SELECT CategoryID, CategoryName FROM Categories"
allcate.CursorType = 0
allcate.CursorLocation = 2
allcate.LockType = 3
allcate.Open()
allcate_numRows = 0
%>
<%
Dim subcatename__MMColParam
subcatename__MMColParam = "1"
if (Request.QueryString("ProductID") <> "") then subcatename__MMColParam = Request.QueryString("ProductID")
%>
<%
set subcatename = Server.CreateObject("ADODB.Recordset")
subcatename.ActiveConnection = MM_conneshop_STRING
subcatename.Source = "SELECT SubCategoryName  FROM Products INNER JOIN SubCategories ON  Products.SubCategID= SubCategories.SubCategoryID  WHERE ProductID = '" + Replace(subcatename__MMColParam, "'", "''") + "'"
subcatename.CursorType = 0
subcatename.CursorLocation = 2
subcatename.LockType = 3
subcatename.Open()
subcatename_numRows = 0
%>
<%
set allsubcate = Server.CreateObject("ADODB.Recordset")
allsubcate.ActiveConnection = MM_conneshop_STRING
allsubcate.Source = "SELECT SubCategoryID, SubCategoryName FROM SubCategories"
allsubcate.CursorType = 0
allsubcate.CursorLocation = 2
allsubcate.LockType = 3
allsubcate.Open()
allsubcate_numRows = 0
%>
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
.bigfont {  font-family: "����"; font-size: 18px; font-weight: bold; color: #306898}
-->
</style>
<script language="JavaScript">
<!--
function checkdata() {
if (document.form1.pid.value=="") {
window.alert ("��������Ʒ��� ��")
return false
}
if (document.form1.pname.value=="") {
window.alert ("��������Ʒ���� ��")
return false
}
if (document.form1.supply.value=="") {
window.alert ("��������Ʒ������ ��")
return false
}
if (document.form1.author.value=="") {
window.alert ("��������Ʒ����/��Ա ��")
return false
}
if (document.form1.description.value=="") {
window.alert ("��������Ʒ������ ��")
return false
}
if (document.form1.price.value=="") {
window.alert ("��������Ʒԭ�� ��")
return false
}
if (document.form1.listprice.value=="") {
window.alert ("��������Ʒ�ּ� ��")
return false
}
if (document.form1.pubdate.value=="") {
window.alert ("��������Ʒ�������� ��")
return false
}
if (document.form1.simg.value=="") {
window.alert ("��������Ʒ��СͼƬ�ļ��� ��")
return false
}
if (document.form1.bimg.value=="") {
window.alert ("��������Ʒ�Ĵ�ͼƬ�ļ��� ��")
return false
}
if (document.form1.stock.value=="") {
window.alert ("��������Ʒ����� ��")
return false
}
if (document.form1.sell.value=="") {
window.alert ("��������Ʒ������ ��")
return false
}
if (document.form1.visit.value=="") {
window.alert ("��������Ʒ������ ��")
return false
}
if (document.form1.weight.value=="") {
window.alert ("��������Ʒ���� ��")
return false
}
return true
}
//-->
</script>
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
    <td> ������<img src="images/product.gif" width="129" height="27"></td>
    <td rowspan="3" bgcolor="#306898" width="1"></td>
  </tr>
  <tr> 
    <td align="center" valign="middle"> 
      <p class="bigfont">������Ʒ��Ϣ</p>
      <form name="form1" method="POST" action="<%=MM_editAction%>" onSubmit="return checkdata()">
        <table width="80%" border="0" cellspacing="2" cellpadding="2">
          <tr> 
            <td width="19%" align="center" valign="middle" height="18" bgcolor="#FFFFFF"><b>��Ʒ���</b></td>
            <td> 
              <input type="text" name="pid" value="<%=(proup.Fields.Item("ProductID").Value)%>" size="50">
            </td>
          </tr>
          <tr> 
            <td width="19%" align="center" valign="middle" height="18" bgcolor="#FFFFFF"><b>��Ʒ����</b></td>
            <td> 
              <input type="text" name="pname" value="<%=(proup.Fields.Item("ProductName").Value)%>" size="50">
            </td>
          </tr>
          <tr> 
            <td width="19%" align="center" valign="middle" height="18" bgcolor="#FFFFFF"><b>��������</b></td>
            <td> 
              <select name="cateid">
                <%
While (NOT allcate.EOF)
%>
                <option value="<%=(allcate.Fields.Item("CategoryID").Value)%>" ><%=(allcate.Fields.Item("CategoryName").Value)%></option>
                <%
  allcate.MoveNext()
Wend
If (allcate.CursorType > 0) Then
  allcate.MoveFirst
Else
  allcate.Requery
End If
%>
                <option value="<%=(proup.Fields.Item("CategoryID").Value)%>" selected><%=(catename.Fields.Item("CategoryName").Value)%></option>
              </select>
            </td>
          </tr>
          <tr> 
            <td width="19%" align="center" valign="middle" height="18" bgcolor="#FFFFFF"><b>��������</b></td>
            <td> 
              <select name="subcateid">
                <%
While (NOT allsubcate.EOF)
%>
                <option value="<%=(allsubcate.Fields.Item("SubCategoryID").Value)%>" ><%=(allsubcate.Fields.Item("SubCategoryName").Value)%></option>
                <%
  allsubcate.MoveNext()
Wend
If (allsubcate.CursorType > 0) Then
  allsubcate.MoveFirst
Else
  allsubcate.Requery
End If
%>
                <option value="<%=(proup.Fields.Item("SubCategID").Value)%>" selected><%=(subcatename.Fields.Item("SubCategoryName").Value)%></option>
              </select>
            </td>
          </tr>
          <tr> 
            <td width="19%" align="center" valign="middle" height="18" bgcolor="#FFFFFF"><b>����/������</b></td>
            <td> 
              <input type="text" name="supply" value="<%=(proup.Fields.Item("Supplier").Value)%>" size="50">
            </td>
          </tr>
          <tr> 
            <td width="19%" align="center" valign="middle" height="18" bgcolor="#FFFFFF"><b>����/��Ա</b></td>
            <td> 
              <input type="text" name="author" value="<%=(proup.Fields.Item("Author").Value)%>" size="50">
            </td>
          </tr>
          <tr> 
            <td width="19%" align="center" valign="middle" height="18" bgcolor="#FFFFFF"><b>��Ʒ����</b></td>
            <td> 
              <textarea name="description" cols="60" rows="6"><%=(proup.Fields.Item("Description").Value)%></textarea>
            </td>
          </tr>
          <tr> 
            <td width="19%" align="center" valign="middle" height="18" bgcolor="#FFFFFF"><b>ԭ����</b></td>
            <td> 
              <input type="text" name="price" value="<%=(proup.Fields.Item("Price").Value)%>">
              Ԫ</td>
          </tr>
          <tr> 
            <td width="19%" align="center" valign="middle" height="18" bgcolor="#FFFFFF"><b>�֡���</b></td>
            <td> 
              <input type="text" name="listprice" value="<%=(proup.Fields.Item("ListPrice").Value)%>">
              Ԫ </td>
          </tr>
          <tr> 
            <td width="19%" align="center" valign="middle" height="18" bgcolor="#FFFFFF"><b>�Ƿ����</b></td>
            <td> 
              <% If proup.Fields.Item("HotDeal").Value = (-1) Then %>
              <input type="radio" name="hotdeal" value="-1" checked>
              �ǡ��� 
              <input type="radio" name="hotdeal" value="0">
              �� 
              <% Else %>
              <input type="radio" name="hotdeal" value="-1" >
              �ǡ��� 
              <input type="radio" name="hotdeal" value="0" checked>
              �� 
              <% End If %>
            </td>
          </tr>
          <tr> 
            <td width="19%" align="center" valign="middle" height="18" bgcolor="#FFFFFF"><b>��������</b></td>
            <td> 
              <input type="text" name="pubdate" value="<%=(proup.Fields.Item("PubDate").Value)%>">
            </td>
          </tr>
          <tr> 
            <td width="19%" align="center" valign="middle" height="18" bgcolor="#FFFFFF"><b>�ص��Ƽ�</b></td>
            <td> 
              <% If proup.Fields.Item("Commend").Value = (-1) Then %>
              <input type="radio" name="commend" value="-1" checked>
              �ǡ��� 
              <input type="radio" name="commend" value="0">
              �� 
              <% Else %>
              <input type="radio" name="commend" value="-1" >
              �ǡ��� 
              <input type="radio" name="commend" value="0" checked>
              �� 
              <% End If %>
            </td>
          </tr>
          <tr> 
            <td width="19%" align="center" valign="middle" height="18" bgcolor="#FFFFFF"><b>СͼƬ����</b></td>
            <td> 
              <input type="text" name="simg" value="<%=(proup.Fields.Item("sImgUrl").Value)%>" size="50">
            </td>
          </tr>
          <tr> 
            <td width="19%" align="center" valign="middle" height="18" bgcolor="#FFFFFF"><b>��ͼƬ����</b></td>
            <td> 
              <input type="text" name="bimg" value="<%=(proup.Fields.Item("bImgUrl").Value)%>" size="50">
            </td>
          </tr>
          <tr> 
            <td width="19%" align="center" valign="middle" height="18" bgcolor="#FFFFFF"><b>�����</b></td>
            <td> 
              <input type="text" name="stock" value="<%=(proup.Fields.Item("Stock").Value)%>">
            </td>
          </tr>
          <tr> 
            <td width="19%" align="center" valign="middle" height="18" bgcolor="#FFFFFF"><b>������</b></td>
            <td> 
              <input type="text" name="sell" value="<%=(proup.Fields.Item("Sell").Value)%>">
            </td>
          </tr>
          <tr> 
            <td width="19%" align="center" valign="middle" height="18" bgcolor="#FFFFFF"><b>������</b></td>
            <td> 
              <input type="text" name="visit" value="<%=(proup.Fields.Item("Visits").Value)%>">
            </td>
          </tr>
          <tr> 
            <td width="19%" align="center" valign="middle" height="18" bgcolor="#FFFFFF"><b>�ء���</b></td>
            <td> 
              <input type="text" name="weight" value="<%=(proup.Fields.Item("UnitWeight").Value)%>">
              ����</td>
          </tr>
          <tr> 
            <td colspan="2" align="center" valign="middle" height="18" bgcolor="#FFFFFF"> 
              <input type="image" border="0" name="imageField" src="images/update.gif" width="37" height="19">
            </td>
          </tr>
        </table>
        <input type="hidden" name="MM_update" value="true">
        <input type="hidden" name="MM_recordId" value="<%= proup.Fields.Item("ProductID").Value %>">
      </form>
      <p>&nbsp;</p>
    </td>
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
  <area shape="rect" coords="134,20,234,41" href="cate_manage.asp">
  <area shape="rect" coords="254,20,355,43" href="order_manage.asp">
  <area shape="rect" coords="134,53,234,73" href="pro_manage.asp">
  <area shape="rect" coords="13,20,113,41" href="adminlogin.asp">
  <area shape="rect" coords="13,53,118,74" href="user_manage.asp">
  <area shape="rect" coords="254,52,355,74" href="ad_manage.asp">
</map>
</body>
</html>
<%
proup.Close()
%>
<%
catename.Close()
%>
<%
allcate.Close()
%>
<%
subcatename.Close()
%>
<%
allsubcate.Close()
%>
