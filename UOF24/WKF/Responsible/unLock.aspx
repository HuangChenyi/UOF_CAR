<%@ Page Title="解除鎖定" Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="WKF_Responsible_unLock" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" Codebehind="unLock.aspx.cs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table width="100%" class="PopTable" cellspacing="1">
        <tr>
            <td class="PopTableHeader" style="height: 25px; text-align:center"><asp:Label ID="lblTitle" runat="server" Text="表單解除鎖定" meta:resourcekey="lblTitleResource1"></asp:Label></td> 
        </tr>
        <tr>
            <td style="height: 35px; background-color:White; text-align:center">
                <asp:Label ID="lblunLockForm" runat="server" Text="確定將表單解除鎖定嗎?" meta:resourcekey="lblunLockFormResource1"></asp:Label></td> 
        </tr>
    </table>
    
    <asp:Label ID="lblSuccessunLockForm" runat="server" Text="表單已成功解除鎖定" 
        meta:resourcekey="lblSuccessunLockFormResource1" Visible="False"></asp:Label>
    <asp:Label ID="lblFailunLockForm" runat="server" Text="表單解除鎖定失敗" 
        meta:resourcekey="lblFailunLockFormResource1" Visible="False"></asp:Label>
</asp:Content>

