<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PushRedirect.aspx.cs" Inherits="Ede.Uof.Web.WKF.FormUse.Mobile.PushRedirect" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<meta name="referrer" content="no-referrer" />
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:Label ID="lblNotAllowMobile" runat="server" Text="此表單不允許手機簽核" Visible="false"></asp:Label>
        <asp:Label ID="lblNoViewAuthority" runat="server" Text="您無法簽核此表單!" Visible="false"></asp:Label>
    </div>
    </form>
</body>
</html>
