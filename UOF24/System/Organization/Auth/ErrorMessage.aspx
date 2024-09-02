<%@ Page Title="" Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" CodeBehind="ErrorMessage.aspx.cs" Inherits="System_Organization_Auth_ErrorMessage" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">   
    <asp:TextBox ID="txtErrorMessage" runat="server" Height="100%" TextMode="MultiLine" Width="100%" ReadOnly="True" meta:resourcekey="txtErrorMessageResource1"></asp:TextBox>
    <input id="demoInput" value="hello world">
</asp:Content>
