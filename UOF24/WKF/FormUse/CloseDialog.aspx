<%@ Page Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="WKF_FormUse_CloseDialog" Title="" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" Codebehind="CloseDialog.aspx.cs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<script id="igClientScript" type="text/javascript">
    $(function() {
        alert('<%=lblNotCurrentSite.Text %>');
        $uof.dialog.close();
    });
</script>
<asp:Label ID="lblNotCurrentSite" runat="server" Text="此站點非可處理站點" Visible="False" meta:resourcekey="lblNotCurrentSiteResource1" ></asp:Label>
</asp:Content>

