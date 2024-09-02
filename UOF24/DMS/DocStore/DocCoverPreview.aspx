<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DocCoverPreview.aspx.cs" Inherits="Ede.Uof.Web.DMS.DocStore.DocCoverPreview" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div style="height: <%=Request.QueryString["h"] %>">
        <img id="imgDocCoverPreview" src='<%=System.Web.Security.AntiXss.AntiXssEncoder.HtmlEncode(Request.QueryString["Url"], true) %>' alt=" " style="max-height: 100%" />
    </div>
    </form>
</body>
</html>
