<%@ Page Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="WKF_FormManagement_DesignFieldCulture" Title="設定欄位多國語言" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" Codebehind="DesignFieldCulture.aspx.cs" %>

<%@ Register src="VersionFieldUserControl/UC_FieldCultureCollection.ascx" tagname="UC_FieldCultureCollection" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc1:UC_FieldCultureCollection ID="UC_FieldCultureCollection1" runat="server" />
</asp:Content>

