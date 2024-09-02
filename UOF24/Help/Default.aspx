<%@ Page Language="C#" AutoEventWireup="true" Inherits="Help_Default" Codebehind="Default.aspx.cs" %>

<html>
<head id="Head1" runat=server ><title></title>
</head>
<frameset cols="25%,*"  frameborder="NO" border="0" framespacing="0">
	<frame name="topFrame" scrolling="yes" noresize src="LeftTree.aspx?<%=Request.QueryString %>">
	<frame name="helpContent" src="" scrolling="yes">
</frameset>
</html>
