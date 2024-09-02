<%@ Page Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="WKF_FormManagement_ManageTrackID" Title="編輯字軌" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" Codebehind="ManageTrackID.aspx.cs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<table width="100%" class="PopTable" cellspacing="1">
    <colgroup class="PopTableLeftTD"></colgroup>
    <colgroup class="PopTableRightTD"></colgroup>
    <tr>
       <td>
           <font color="red">*</font><asp:Label ID="lblTrackId" runat="server" Text="字軌" meta:resourcekey="lblTrackIdResource1"></asp:Label></td>
       <td>
           <asp:TextBox ID="txtTrackId" runat="server" Width="190px" MaxLength="15" meta:resourcekey="txtTrackIdResource1"></asp:TextBox>
           <asp:RequiredFieldValidator ID="RequiredFieldValidatorTrackId" runat="server" ErrorMessage="請輸入字軌編號" ControlToValidate="txtTrackId" Display="Dynamic" meta:resourcekey="RequiredFieldValidatorTrackIdResource1"></asp:RequiredFieldValidator>           
           <asp:CustomValidator ID="CustomValidatorTrackId" runat="server" ErrorMessage="字軌編號重複" Display="Dynamic" meta:resourcekey="CustomValidatorTrackIdResource1"></asp:CustomValidator></td>
    </tr>
    <tr>
       <td style="height: 26px">
           <asp:Label ID="lblTrackIdDesc" runat="server" Text="字軌說明" meta:resourcekey="lblTrackIdDescResource1"></asp:Label></td>
       <td style="height: 26px">
           <asp:TextBox ID="txtTrackIdDesc" runat="server" meta:resourcekey="txtTrackIdDescResource1" Width="80%" MaxLength="255"></asp:TextBox></td>
    </tr>
</table>
</asp:Content>

