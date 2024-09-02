<%@ Page Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="PMS_Query_ViewProject" Title="" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" Codebehind="ViewProject.aspx.cs" %>

<%@ Register Src="../Common/UC_ProjectMaintainToolbar.ascx" TagName="UC_ProjectMaintainToolbar" TagPrefix="uc2" %>
<%@ Register Src="../Common/UC_ProjectContent.ascx" TagName="UC_ProjectContent" TagPrefix="uc1" %>
<%@ Register Assembly="System.Web.Extensions" Namespace="System.Web.UI" TagPrefix="asp" %>
   
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<asp:UpdatePanel id="UpdatePanel1" runat="server"><contenttemplate>
    <asp:ValidationSummary ID="ValidationSummary1" runat="server"  ValidationGroup="Maintain" meta:resourcekey="ValidationSummary1Resource1" />
    <uc2:UC_ProjectMaintainToolbar ID="UC_ProjectMaintainToolbar1" runat="server" />
    <uc1:UC_ProjectContent ID="UC_ProjectContent1" runat="server" />
</contenttemplate>
</asp:UpdatePanel>    
</asp:Content>

