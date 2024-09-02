<%@ Page Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="WKF_FormManagement_ViewForm" Title="預覽" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" Codebehind="ViewForm.aspx.cs" %>
<%@ Register src="VersionFieldUserControl/VersionFieldCollectionUC.ascx" tagname="VersionFieldCollectionUC" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
   <uc1:VersionFieldCollectionUC ID="VersionFieldCollectionUC1" runat="server" />
</asp:Content>
