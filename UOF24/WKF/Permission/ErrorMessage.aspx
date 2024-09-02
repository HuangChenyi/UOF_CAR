<%@ Page Title="" Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" CodeBehind="ErrorMessage.aspx.cs" Inherits="Ede.Uof.Web.WKF.Permission.ErrorMessage" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<script id="CallBackErrorjs" type="text/javascript">
    function CopyToClipBoard()
    {
        var obj = $('#<%= this.txtErrorMessage.ClientID%>')
        window.clipboardData.setData('Text',obj.val());
    }
</script>
    <asp:Button ID="btnCopy" runat="server" Text="複製至剪貼簿" CausesValidation="False" meta:resourcekey="btnCopyResource1" /><br />
    <asp:TextBox ID="txtErrorMessage" runat="server" Height="100%" TextMode="MultiLine" Width="100%" meta:resourcekey="txtErrorMessageResource1" ></asp:TextBox>
</asp:Content>
