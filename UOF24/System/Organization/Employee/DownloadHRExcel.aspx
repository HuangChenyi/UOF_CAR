<%@ Page Language="C#" AutoEventWireup="true" Inherits="System_Organization_Employee_DownloadHRExcel" culture="auto" Title="匯出人員" meta:resourcekey="PageResource1" uiculture="auto" Codebehind="DownloadHRExcel.aspx.cs" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="lblExportMsg" runat="server" Text="匯出Excel" Visible="False" meta:resourcekey="lblExportMsgResource1"></asp:Label>
            <asp:Label ID="lblAccount" runat="server" Text="帳號" Visible="False" meta:resourcekey="lblAccountResource1"></asp:Label>
            <asp:Label ID="lblName" runat="server" Text="姓名" Visible="False" meta:resourcekey="lblNameResource1"></asp:Label>
            <asp:Label ID="lblDepName" runat="server" Text="部門" Visible="False" meta:resourcekey="lblDepNameResource1"></asp:Label>
            <asp:Label ID="lblTitleName" runat="server" Text="職級" Visible="False" meta:resourcekey="lblTitleNameResource1"></asp:Label>
            <asp:Label ID="lblFuncName" runat="server" Text="職務" Visible="False" meta:resourcekey="lblFuncNameResource1"></asp:Label>
            <asp:Label ID="lblSex" runat="server" Text="性別" Visible="False" meta:resourcekey="lblSexResource1"></asp:Label>
            <asp:Label ID="lblBirthday" runat="server" Text="生日" Visible="False" meta:resourcekey="lblBirthdayResource1"></asp:Label>
            <asp:Label ID="lblArrive" runat="server" Text="到職日" Visible="False" meta:resourcekey="lblArriveResource1"></asp:Label>
            <asp:Label ID="lblEmail" runat="server" Text="電子郵件" Visible="False" meta:resourcekey="lblEmailResource1"></asp:Label>
            <asp:Label ID="lblMobile" runat="server" Text="手機" Visible="False" meta:resourcekey="lblMobileResource1"></asp:Label>
            <asp:Label ID="lblEmergency" runat="server" Text="緊急電話" Visible="False" meta:resourcekey="lblEmergencyResource1"></asp:Label>
            <asp:Label ID="lblExt" runat="server" Text="分機" Visible="False" meta:resourcekey="lblExtResource1"></asp:Label>
            <asp:Label ID="lblEducName" runat="server" Text="教育程度" Visible="False" meta:resourcekey="lblEducNameResource1"></asp:Label>
            <asp:Label ID="lblSuperior" runat="server" Text="部門主管" Visible="False" meta:resourcekey="lblSuperiorResource1"></asp:Label>
            <asp:Label ID="lblSigner" runat="server" Text="簽核人員" Visible="False" meta:resourcekey="lblSignerResource1"></asp:Label>
            <asp:Label ID="lblLocation" runat="server" Text="辦公地點" Visible="False" meta:resourcekey="lblLocationResource1"></asp:Label>
            <asp:Label ID="lblDisplayTimeZone" runat="server" Text="顯示時區" Visible="False" meta:resourcekey="lblDisplayTimeZoneResource1"></asp:Label>    
        </div>
    </form>
</body>
</html>
