<%@ Page Language="C#" AutoEventWireup="true" Inherits="System_Organization_Employee_DownloadEmpExcel" culture="auto" Title="匯出人員" meta:resourcekey="PageResource1" uiculture="auto" Codebehind="DownloadEmpExcel.aspx.cs" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <asp:Label ID="lblExportMsg" runat="server" Text="匯出Excel" Visible="False" ></asp:Label>
    <asp:Label ID="lblAccount" runat="server" Text="*Account" Visible="False"></asp:Label>
    <asp:Label ID="lblName" runat="server" Text="*Name" Visible="False"></asp:Label>
    <asp:Label ID="lblDepName" runat="server" Text="*Department" Visible="False"></asp:Label>
    <asp:Label ID="lblTitleName" runat="server" Text="Title" Visible="False"></asp:Label>
    <asp:Label ID="lblFuncName" runat="server" Text="Function" Visible="False"></asp:Label>
    <asp:Label ID="lblSex" runat="server" Text="Gender(M,F)" Visible="False"></asp:Label>
    <asp:Label ID="lblBirthday" runat="server" Text="Birthday" Visible="False"></asp:Label>
    <asp:Label ID="lblArrive" runat="server" Text="ArriveDate" Visible="False"></asp:Label>
    <asp:Label ID="lblEmail" runat="server" Text="Email" Visible="False"></asp:Label>
    <asp:Label ID="lblMobile" runat="server" Text="Mobile" Visible="False"></asp:Label>
    <asp:Label ID="lblEmergency" runat="server" Text="Emergency Phone" Visible="False"></asp:Label>
    <asp:Label ID="lblExt" runat="server" Text="Extension" Visible="False"></asp:Label>
    <asp:Label ID="lblEducName" runat="server" Text="Eduction" Visible="False"></asp:Label>
    <asp:Label ID="lblSuperior" runat="server" Text="Superior" Visible="False"></asp:Label>
    <asp:Label ID="lblSigner" runat="server" Text="Signer" Visible="False"></asp:Label>    
    <asp:Label ID="lblLocation" runat="server" Text="Location" Visible="False"></asp:Label>
    <asp:Label ID="lblDisplayTimeZone" runat="server" Text="Time Zone" Visible="False"></asp:Label>    
    <asp:Label ID="lblSid" runat="server" Text="Sid" Visible="False"></asp:Label>    
        
    <asp:Label ID="lblOption1" runat="server" Text="Option1" Visible="False"></asp:Label>    
    <asp:Label ID="lblOption2" runat="server" Text="Option2" Visible="False"></asp:Label>    
    <asp:Label ID="lblOption3" runat="server" Text="Option3" Visible="False"></asp:Label>    
    <asp:Label ID="lblOption4" runat="server" Text="Option4" Visible="False"></asp:Label>    
    <asp:Label ID="lblOption5" runat="server" Text="Option5" Visible="False"></asp:Label>    
    <asp:Label ID="lblOption6" runat="server" Text="Option6" Visible="False"></asp:Label>    

    <asp:Label ID="lblTimeZoneId" runat="server" Text="Time Zone ID" Visible="False"></asp:Label>
    <asp:Label ID="lblCardNo" runat="server" Text="Card No" Visible="False"></asp:Label>
    <asp:Label ID="lblEmployeeNo" runat="server" Text="Employee No" Visible="False"></asp:Label>
    <asp:Label ID="lblAiraFaceId" runat="server" Text="AiraFace ID" Visible="False"></asp:Label>
    <asp:Label ID="lblUseADvalidation" runat="server" Text="Use AD validation" Visible="False"></asp:Label>
    <asp:Label ID="lblADaccount" runat="server" Text="AD account" Visible="False"></asp:Label>
    <asp:Label ID="lblAccountlockup" runat="server" Text="Account lock up" Visible="False" ></asp:Label>
    <asp:Label ID="lblExpiredat" runat="server" Text="Expired at" Visible="False" ></asp:Label>
    <asp:Label ID="lblSuspendaccount" runat="server" Text="Suspend account" Visible="False" ></asp:Label>
    </div>
    </form>
</body>
</html>
