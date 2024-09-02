<%@ Page Title="語系設定" Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" CodeBehind="ClassCultureMaintain.aspx.cs" Inherits="Ede.Uof.Web.DMS.Admin.ClassCultureMaintain" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Table ID="tbCulture" runat="server" class="PopTable" meta:resourcekey="tbCultureResource1"></asp:Table>
    <asp:HiddenField ID="hidClassID" runat="server" />
    <asp:Label ID="lblDefaultCulture" runat="server" Text="預設語系" Visible="False" meta:resourcekey="lblDefaultCultureResource1" ></asp:Label>
    <asp:Label ID="lblNonEmpty" runat="server" Text="不可空白" Visible="False" meta:resourcekey="lblNonEmptyResource1" ></asp:Label>
</asp:Content>
