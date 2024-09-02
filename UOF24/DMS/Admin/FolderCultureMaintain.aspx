<%@ Page Title="語系設定" Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" CodeBehind="FolderCultureMaintain.aspx.cs" Inherits="Ede.Uof.Web.DMS.Admin.FolderCultureMaintain" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Table ID="tbCulture" runat="server" class="PopTable" meta:resourcekey="tbCultureResource1"></asp:Table>
    <asp:HiddenField ID="hidFolderID" runat="server" />
    <asp:HiddenField ID="hidMode" runat="server" />
    <asp:Label ID="lblDefaultCulture" runat="server" Text="預設語系" Visible="False" meta:resourcekey="lblDefaultCultureResource1"></asp:Label>
    <asp:Label ID="lblNonEmpty" runat="server" Text="不可空白" Visible="False" meta:resourcekey="lblNonEmptyResource1"></asp:Label>
</asp:Content>
