<%@ Page Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="Common_ChoiceCenter_ChoiceOnce" Title="" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" Codebehind="ChoiceOnce.aspx.cs" %>

<%@ Register Src="UC_ChoiceOnce.ascx" TagName="UC_ChoiceOnce" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc1:UC_ChoiceOnce ID="UC_ChoiceOnce1" runat="server" />
    <asp:Label ID="lbNoSelectedItemWarning" runat="server" Visible="False" meta:resourcekey="lbNoSelectedItemWarningResource1" Text="您沒有選取任何項目,確定要關閉嗎?"></asp:Label>
</asp:Content>

