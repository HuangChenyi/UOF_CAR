<%@ Page Title="" Language="C#" MasterPageFile="~/Master/DefaultMasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="CDS_Lab_Auth_Default" %>

<%@ Register Src="~/Common/ChoiceCenter/UC_ChoiceList.ascx" TagPrefix="uc1" TagName="UC_ChoiceList" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <asp:Button ID="btnSave" runat="server" Text="儲存" OnClick="btnSave_Click" />


    <uc1:UC_ChoiceList runat="server" ID="UC_ChoiceList" ExpandToUser="false" />

    <asp:Label ID="lblAlert" runat="server" Text="儲存成功!" Visible="false"></asp:Label>
</asp:Content>

