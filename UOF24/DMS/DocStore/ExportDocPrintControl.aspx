<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ExportDocPrintControl.aspx.cs" Inherits="Ede.Uof.Web.DMS.DocStore.ExportDocPrintControl" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:Label ID="lblRecallTime" runat="server" Text="回收時間" Visible ="False" meta:resourcekey="lblRecallTimeResource1"></asp:Label>
        <asp:Label ID="lblRecallPerson" runat="server" Text="回收者" Visible ="False" meta:resourcekey="lblRecallPersonResource1"></asp:Label>
        <asp:Label ID="lblNumberOfRecall" runat="server" Text="回收份數" Visible ="False" meta:resourcekey="lblNumberOfRecallResource1"></asp:Label>
        <asp:Label ID="lblNumberOfVoid" runat="server" Text="遺失份數" Visible ="False" meta:resourcekey="lblNumberOfVoidResource1"></asp:Label>
        <asp:Label ID="lblRemark" runat="server" Text="備註" Visible ="False" meta:resourcekey="lblRemarkResource1"></asp:Label>
    </div>
    </form>
</body>
</html>
