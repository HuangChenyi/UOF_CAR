<%@ Page Language="C#" AutoEventWireup="true" Inherits="System_Organization_Member_DownloadMemExcel" culture="auto" Title="匯出人員" meta:resourcekey="PageResource1" uiculture="auto" Codebehind="DownloadMemExcel.aspx.cs" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
            <asp:Label ID="lblExportMsg" runat="server" Text="匯出Excel" Visible="False" meta:resourcekey="lblExportMsgResource1"></asp:Label>
            <asp:Label ID="lblAccount" runat="server" Text="帳號" Visible="False" meta:resourcekey="lblAccountResource1"></asp:Label>
            <asp:Label ID="lblName" runat="server" Text="姓名" Visible="False" meta:resourcekey="lblNameResource1"></asp:Label>
            <asp:Label ID="lblGroupName" runat="server" Text="群組" Visible="False" meta:resourcekey="lblGroupNameResource1"></asp:Label>
            <asp:Label ID="lblSex" runat="server" Text="性別" Visible="False" meta:resourcekey="lblSexResource1"></asp:Label>
            <asp:Label ID="lblBirthday" runat="server" Text="生日" Visible="False" meta:resourcekey="lblBirthdayResource1"></asp:Label>
            <asp:Label ID="lblEmail" runat="server" Text="電子郵件" Visible="False" meta:resourcekey="lblEmailResource1"></asp:Label>
            <asp:Label ID="lblExt" runat="server" Text="分機" Visible="False" meta:resourcekey="lblExtResource1"></asp:Label>
            <asp:Label ID="lblCompName" runat="server" Text="公司名稱" Visible="False" meta:resourcekey="lblCompNameResource1"></asp:Label>
            <asp:Label ID="lblCompAdd" runat="server" Text="公司地址" Visible="False" meta:resourcekey="lblCompAddResource1"></asp:Label>
            <asp:Label ID="lblCompFax" runat="server" Text="公司傳真" Visible="False" meta:resourcekey="lblCompFaxResource1"></asp:Label>
            <asp:Label ID="lblDisplayTimeZone" runat="server" Text="顯示時區" Visible="False" meta:resourcekey="lblDisplayTimeZoneResource1"></asp:Label>    
            <asp:Label ID="lblClass" runat="server" Text="類別" Visible="False" meta:resourcekey="lblClassResource1"></asp:Label>    
    </div>
    </form>
</body>
</html>
