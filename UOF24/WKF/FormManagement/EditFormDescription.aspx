<%@ Page Title="" Language="C#" AutoEventWireup="true" CodeBehind="EditFormDescription.aspx.cs" Inherits="Ede.Uof.Web.WKF.FormManagement.EditFormDescription" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
    <meta content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="referrer" content="no-referrer" />
    <link id="Link4" href="~/Common/Style/cssReset.css" rel="stylesheet" runat="server" />
    <link id="Link2" href="~/Common/Style/uof-fixed.css" rel="stylesheet" runat="server" />
    <link id="Link3" href="~/Common/Style/telerik.css" rel="stylesheet" runat="server" />
    <style type="text/css">
        span.JustAddBorder table tr td {
            border-width: 1px;
            border-style: solid;
        }
    </style>
</head>

<body runat="server" id="Body">
    <div runat="server">
        <asp:Label ID="lblContext" runat="server"  class="editorcontentstyle JustAddBorder"></asp:Label>
    </div>
    <asp:Label ID="lblTitle" runat="server" Visible="false" Text="表單說明"></asp:Label>
</body>
</html>
