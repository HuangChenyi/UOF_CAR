<%@ Page Title="" Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" CodeBehind="CustomerMemoEditor.aspx.cs" Inherits="Ede.Uof.Web.EIP.Customer.CustomerMemoEditor" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" %>

<%@ Register Src="~/Common/HtmlEditor/UC_HtmlEditor.ascx" TagPrefix="uc1" TagName="UC_HtmlEditor" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <uc1:UC_HtmlEditor runat="server" ID="UC_HtmlEditor" Width="100%" Height="600"/>
</asp:Content>
