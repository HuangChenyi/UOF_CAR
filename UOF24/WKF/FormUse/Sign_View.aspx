<%@ Page Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="WKF_FormUse_Sign_View" Title="" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" Codebehind="Sign_View.aspx.cs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Label ID="lblIqyMessage" runat="server" Text="此徵詢已被徵詢者刪除或送出!!" 
        Visible="False" meta:resourcekey="lblIqyMessageResource1" ></asp:Label>
    <asp:Label ID="lblNoSiteMessage" runat="server" Text="此表單已被簽核過!" 
        Visible="False" meta:resourcekey="lblNoSiteMessageResource1" ></asp:Label>
    <asp:Label ID="lblNoViewAuthority" runat="server" Text="您無法簽核此表單!"></asp:Label>
    <asp:Label ID="lblNodata" runat="server" Text="表單已被刪除，無法找到表單相關資訊" Visible="False" meta:resourcekey="lblNodataResource1"></asp:Label>
</asp:Content>

