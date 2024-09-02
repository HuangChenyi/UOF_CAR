<%@ Page Title="" Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="System_CustomMenu_EditorHtml" Codebehind="EditorHtml.aspx.cs" %>

<%@ Register Src="~/Common/HtmlEditor/UC_HtmlEditor.ascx" TagPrefix="uc1" TagName="UC_HtmlEditor" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc1:UC_HtmlEditor runat="server" Width="100%" Height="650px" ID="UC_HtmlEditor" />
</asp:Content>

