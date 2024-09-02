<%@ Page Title="發送訊息結果" Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" CodeBehind="ErrorMessage.aspx.cs" Inherits="Ede.Uof.Web.EIP.SMS.ErrorMessage" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Label ID="lblShowErrorMsg" runat="server" meta:resourcekey="lblShowErrorMsgResource1"></asp:Label>
    <asp:HiddenField ID="hfMsgID" runat="server" />
</asp:Content>
