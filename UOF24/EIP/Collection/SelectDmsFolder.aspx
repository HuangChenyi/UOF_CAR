<%@ Page Title="選擇文管目錄" Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="EIP_Collection_SelectDmsFolder" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" Codebehind="SelectDmsFolder.aspx.cs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <telerik:RadTreeView ID="rddmstree" runat="server" EnableNodeTextHtmlEncoding="true"></telerik:RadTreeView>   
    <asp:Label ID="lblRoot" runat="server" Text="文件庫" Visible="False" meta:resourcekey="lblRootResource1" ></asp:Label>
</asp:Content>

