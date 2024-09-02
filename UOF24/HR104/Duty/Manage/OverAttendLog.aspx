<%@ Page Title="錯誤訊息" Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" CodeBehind="OverAttendLog.aspx.cs" Inherits="Ede.Uof.Web.HR104.Duty.Manage.OverAttendLog" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:TextBox ID="txtErrorMsg" runat="server" TextMode="MultiLine" Rows="6" Width="100%" meta:resourcekey="txtErrorMsgResource1"></asp:TextBox>
    <asp:HiddenField ID="hfMasterGuid" runat="server" />
</asp:Content>
