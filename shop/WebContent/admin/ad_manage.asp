<%@LANGUAGE="VBSCRIPT"%>
<!--#include file="../Connections/conneshop.asp" -->
<%
' *** Restrict Access To Page: Grant or deny access to this page
MM_authorizedUsers="admin,advertise"
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
set adtodeal = Server.CreateObject("ADODB.Recordset")
adtodeal.ActiveConnection = MM_conneshop_STRING
adtodeal.Source = "SELECT * FROM Advertise ORDER BY AddDate DESC"
adtodeal.CursorType = 0
adtodeal.CursorLocation = 2
adtodeal.LockType = 3
adtodeal.Open()
adtodeal_numRows = 0
%>
<%
Dim Repeat1__numRows
Repeat1__numRows = 6
Dim Repeat1__index
Repeat1__index = 0
adtodeal_numRows = adtodeal_numRows + Repeat1__numRows
%>
<%
'  *** Recordset Stats, Move To Record, and Go To Record: declare stats variables

' set the record count
adtodeal_total = adtodeal.RecordCount

' set the number of rows displayed on this page
If (adtodeal_numRows < 0) Then
  adtodeal_numRows = adtodeal_total
Elseif (adtodeal_numRows = 0) Then
  adtodeal_numRows = 1
End If

' set the first and last displayed record
adtodeal_first = 1
adtodeal_last  = adtodeal_first + adtodeal_numRows - 1

' if we have the correct record count, check the other stats
If (adtodeal_total <> -1) Then
  If (adtodeal_first > adtodeal_total) Then adtodeal_first = adtodeal_total
  If (adtodeal_last > adtodeal_total) Then adtodeal_last = adtodeal_total
  If (adtodeal_numRows > adtodeal_total) Then adtodeal_numRows = adtodeal_total
End If
%>
<%
' *** Move To Record and Go To Record: declare variables

Set MM_rs    = adtodeal
MM_rsCount   = adtodeal_total
MM_size      = adtodeal_numRows
MM_uniqueCol = ""
MM_paramName = ""
MM_offset = 0
MM_atTotal = false
MM_paramIsDefined = false
If (MM_paramName <> "") Then
  MM_paramIsDefined = (Request.QueryString(MM_paramName) <> "")
End If
%>
<%
' *** Move To Record: handle 'index' or 'offset' parameter

if (Not MM_paramIsDefined And MM_rsCount <> 0) then

  ' use index parameter if defined, otherwise use offset parameter
  r = Request.QueryString("index")
  If r = "" Then r = Request.QueryString("offset")
  If r <> "" Then MM_offset = Int(r)

  ' if we have a record count, check if we are past the end of the recordset
  If (MM_rsCount <> -1) Then
    If (MM_offset >= MM_rsCount Or MM_offset = -1) Then  ' past end or move last
      If ((MM_rsCount Mod MM_size) > 0) Then         ' last page not a full repeat region
        MM_offset = MM_rsCount - (MM_rsCount Mod MM_size)
      Else
        MM_offset = MM_rsCount - MM_size
      End If
    End If
  End If

  ' move the cursor to the selected record
  i = 0
  While ((Not MM_rs.EOF) And (i < MM_offset Or MM_offset = -1))
    MM_rs.MoveNext
    i = i + 1
  Wend
  If (MM_rs.EOF) Then MM_offset = i  ' set MM_offset to the last possible record

End If
%>
<%
' *** Move To Record: if we dont know the record count, check the display range

If (MM_rsCount = -1) Then

  ' walk to the end of the display range for this page
  i = MM_offset
  While (Not MM_rs.EOF And (MM_size < 0 Or i < MM_offset + MM_size))
    MM_rs.MoveNext
    i = i + 1
  Wend

  ' if we walked off the end of the recordset, set MM_rsCount and MM_size
  If (MM_rs.EOF) Then
    MM_rsCount = i
    If (MM_size < 0 Or MM_size > MM_rsCount) Then MM_size = MM_rsCount
  End If

  ' if we walked off the end, set the offset based on page size
  If (MM_rs.EOF And Not MM_paramIsDefined) Then
    If (MM_offset > MM_rsCount - MM_size Or MM_offset = -1) Then
      If ((MM_rsCount Mod MM_size) > 0) Then
        MM_offset = MM_rsCount - (MM_rsCount Mod MM_size)
      Else
        MM_offset = MM_rsCount - MM_size
      End If
    End If
  End If

  ' reset the cursor to the beginning
  If (MM_rs.CursorType > 0) Then
    MM_rs.MoveFirst
  Else
    MM_rs.Requery
  End If

  ' move the cursor to the selected record
  i = 0
  While (Not MM_rs.EOF And i < MM_offset)
    MM_rs.MoveNext
    i = i + 1
  Wend
End If
%>
<%
' *** Move To Record: update recordset stats

' set the first and last displayed record
adtodeal_first = MM_offset + 1
adtodeal_last  = MM_offset + MM_size
If (MM_rsCount <> -1) Then
  If (adtodeal_first > MM_rsCount) Then adtodeal_first = MM_rsCount
  If (adtodeal_last > MM_rsCount) Then adtodeal_last = MM_rsCount
End If

' set the boolean used by hide region to check if we are on the last record
MM_atTotal = (MM_rsCount <> -1 And MM_offset + MM_size >= MM_rsCount)
%>
<%
' *** Go To Record and Move To Record: create strings for maintaining URL and Form parameters

' create the list of parameters which should not be maintained
MM_removeList = "&index="
If (MM_paramName <> "") Then MM_removeList = MM_removeList & "&" & MM_paramName & "="
MM_keepURL="":MM_keepForm="":MM_keepBoth="":MM_keepNone=""

' add the URL parameters to the MM_keepURL string
For Each Item In Request.QueryString
  NextItem = "&" & Item & "="
  If (InStr(1,MM_removeList,NextItem,1) = 0) Then
    MM_keepURL = MM_keepURL & NextItem & Server.URLencode(Request.QueryString(Item))
  End If
Next

' add the Form variables to the MM_keepForm string
For Each Item In Request.Form
  NextItem = "&" & Item & "="
  If (InStr(1,MM_removeList,NextItem,1) = 0) Then
    MM_keepForm = MM_keepForm & NextItem & Server.URLencode(Request.Form(Item))
  End If
Next

' create the Form + URL string and remove the intial '&' from each of the strings
MM_keepBoth = MM_keepURL & MM_keepForm
if (MM_keepBoth <> "") Then MM_keepBoth = Right(MM_keepBoth, Len(MM_keepBoth) - 1)
if (MM_keepURL <> "")  Then MM_keepURL  = Right(MM_keepURL, Len(MM_keepURL) - 1)
if (MM_keepForm <> "") Then MM_keepForm = Right(MM_keepForm, Len(MM_keepForm) - 1)

' a utility function used for adding additional parameters to these strings
Function MM_joinChar(firstItem)
  If (firstItem <> "") Then
    MM_joinChar = "&"
  Else
    MM_joinChar = ""
  End If
End Function
%>
<%
' *** Move To Record: set the strings for the first, last, next, and previous links

MM_keepMove = MM_keepBoth
MM_moveParam = "index"

' if the page has a repeated region, remove 'offset' from the maintained parameters
If (MM_size > 0) Then
  MM_moveParam = "offset"
  If (MM_keepMove <> "") Then
    params = Split(MM_keepMove, "&")
    MM_keepMove = ""
    For i = 0 To UBound(params)
      nextItem = Left(params(i), InStr(params(i),"=") - 1)
      If (StrComp(nextItem,MM_moveParam,1) <> 0) Then
        MM_keepMove = MM_keepMove & "&" & params(i)
      End If
    Next
    If (MM_keepMove <> "") Then
      MM_keepMove = Right(MM_keepMove, Len(MM_keepMove) - 1)
    End If
  End If
End If

' set the strings for the move to links
If (MM_keepMove <> "") Then MM_keepMove = MM_keepMove & "&"
urlStr = Request.ServerVariables("URL") & "?" & MM_keepMove & MM_moveParam & "="
MM_moveFirst = urlStr & "0"
MM_moveLast  = urlStr & "-1"
MM_moveNext  = urlStr & Cstr(MM_offset + MM_size)
prev = MM_offset - MM_size
If (prev < 0) Then prev = 0
MM_movePrev  = urlStr & Cstr(prev)
%>
<html>
<head>
<title>网上商城管理系统</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
<!--
td {  font-family: "宋体"; font-size: 12px}
.mid {  font-family: "宋体"; font-size: 14px; font-weight: bold}
.fillbox {  font-family: "宋体"; font-size: 14px; font-weight: bold; color: #006600; border-color: black black #408C00; border-style: solid; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 1px; border-left-width: 0px}
.sbutton {  font-family: "宋体"; font-size: 14px; color: #006600; background-color: #D0F0B3; font-weight: bold; padding-top: 1px; padding-bottom: 1px}
.bigfont {  font-family: "黑体"; font-size: 18px; font-weight: bold; color: #306898}
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
    <td>　　　<img src="images/adver.gif" width="129" height="27"></td>
    <td rowspan="3" bgcolor="#306898" width="1"></td>
  </tr>
  <tr> 
    <td align="center" valign="middle"> 
      <p class="mid"><a href="addad.asp">添加广告</a>　　　　<a href="showad.asp">显示广告</a></p>
      <% 
While ((Repeat1__numRows <> 0) AND (NOT adtodeal.EOF)) 
%>
      <table width="80%" border="0" cellspacing="2" cellpadding="2" bgcolor="#7090B8">
        <tr> 
          <td width="13%" align="center"><b><font color="#FFFFFF">广告编号</font></b></td>
          <td bgcolor="#FFFFFF" width="37%"><%=(adtodeal.Fields.Item("AdID").Value)%></td>
          <td width="13%" align="center"><b><font color="#FFFFFF">图片名称</font></b></td>
          <td bgcolor="#FFFFFF" width="37%"><%=(adtodeal.Fields.Item("PicName").Value)%></td>
        </tr>
        <tr> 
          <td width="13%" align="center"><b><font color="#FFFFFF">广告链接</font></b></td>
          <td colspan="3" bgcolor="#FFFFFF"><%=(adtodeal.Fields.Item("AdURL").Value)%></td>
        </tr>
        <tr> 
          <td width="13%" align="center"><b><font color="#FFFFFF">图片显示</font></b></td>
          <td colspan="3" bgcolor="#FFFFFF"><img src="../adbanner/<%=(adtodeal.Fields.Item("PicName").Value)%>" width="468" height="60" border="0"></td>
        </tr>
        <tr> 
          <td width="13%" align="center"><b><font color="#FFFFFF">ALT内容</font></b></td>
          <td colspan="3" bgcolor="#FFFFFF"><%=(adtodeal.Fields.Item("AltInfo").Value)%></td>
        </tr>
        <tr> 
          <td width="13%" align="center"><b><font color="#FFFFFF">备注说明</font></b></td>
          <td colspan="3" bgcolor="#FFFFFF"><%=(adtodeal.Fields.Item("AdNotes").Value)%></td>
        </tr>
        <tr> 
          <td width="13%" align="center"><b><font color="#FFFFFF">添加日期</font></b></td>
          <td width="37%" bgcolor="#FFFFFF"><%=(adtodeal.Fields.Item("AddDate").Value)%></td>
          <td width="13%" align="center"><b><font color="#FFFFFF">显示次数</font></b></td>
          <td width="37%" bgcolor="#FFFFFF"><%=(adtodeal.Fields.Item("ViewCount").Value)%></td>
        </tr>
        <tr> 
          <td colspan="4" align="center" bgcolor="#FFFFFF"><A HREF="adupdate.asp?<%= MM_keepNone & MM_joinChar(MM_keepNone) & "AdID=" & adtodeal.Fields.Item("AdID").Value %>"><img src="images/update.gif" width="37" height="19" border="0"></A>　　　　　　　　　　<A HREF="addel.asp?<%= MM_keepNone & MM_joinChar(MM_keepNone) & "AdID=" & adtodeal.Fields.Item("AdID").Value %>"><img src="images/del.gif" width="37" height="19" border="0"></A></td>
        </tr>
      </table>
      <br>
      <% 
  Repeat1__index=Repeat1__index+1
  Repeat1__numRows=Repeat1__numRows-1
  adtodeal.MoveNext()
Wend
%>
      <table border="0" width="50%" align="center">
        <tr> 
          <td width="23%" align="center"> 
            <% If MM_offset <> 0 Then %>
            <a href="<%=MM_moveFirst%>">第一页</a> 
            <% End If ' end MM_offset <> 0 %>
          </td>
          <td width="31%" align="center"> 
            <% If MM_offset <> 0 Then %>
            <a href="<%=MM_movePrev%>">前一页</a> 
            <% End If ' end MM_offset <> 0 %>
          </td>
          <td width="23%" align="center"> 
            <% If Not MM_atTotal Then %>
            <a href="<%=MM_moveNext%>">下一页</a> 
            <% End If ' end Not MM_atTotal %>
          </td>
          <td width="23%" align="center"> 
            <% If Not MM_atTotal Then %>
            <a href="<%=MM_moveLast%>">最末页</a> 
            <% End If ' end Not MM_atTotal %>
          </td>
        </tr>
      </table>
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
    <td width="117"><a href="http://www.fans8.com"><img src="images/admin_b2.gif" width="117" height="28" border="0" alt="..:::  狂迷俱乐部  :::.."></a></td>
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
adtodeal.Close()
%>
