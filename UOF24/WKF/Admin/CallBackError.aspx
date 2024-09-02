<%@ Page Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="WKF_Admin_CallBackError" Title="錯誤訊息" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" Codebehind="CallBackError.aspx.cs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<script id="CallBackErrorjs" type="text/javascript">
<!--
    function CopyToClipBoard()
    {
       

        var obj = $('#<%= this.txtErrorMessage.ClientID%>')
        window.clipboardData.setData('Text',obj.val());
    }
// -->
</script>
    <asp:Button ID="btnCopy" runat="server" Text="複製至剪貼簿" style="display:none" CausesValidation="False" meta:resourcekey="btnCopyResource1" /><br />
    <asp:TextBox ID="txtErrorMessage" runat="server" Height="100%" TextMode="MultiLine" Width="100%" meta:resourcekey="txtErrorMessageResource1"></asp:TextBox>
</asp:Content>

