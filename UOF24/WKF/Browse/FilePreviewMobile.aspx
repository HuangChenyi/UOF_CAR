<%@ Page Title="" Language="C#" MasterPageFile="~/Master/MobileMasterPage.master" AutoEventWireup="true" CodeBehind="FilePreviewMobile.aspx.cs" Inherits="Ede.Uof.Web.WKF.Browse.FilePreviewMobile" %>

<%@ Register Src="~/Common/DCS/UC_XpsViewer.ascx" TagPrefix="uc1" TagName="UC_XpsViewer" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script type="text/javascript">
        var ajaxManager;
        function ReturnToForm() {
            if (ajaxManager == null)
                ajaxManager = $find("<%= RadAjaxManager1.ClientID %>");

            ajaxManager.ajaxRequest(JSON.stringify({ "Key": "Return", "Value": "" }));
            return false;
        }
    </script>
    <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server" OnAjaxRequest="RadAjaxManager1_AjaxRequest"></telerik:RadAjaxManager>
    <asp:UpdatePanel ID="updatePanel1" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <uc1:UC_XpsViewer runat="server" ID="UC_XpsViewer" />
        </ContentTemplate>
    </asp:UpdatePanel>
    <asp:Label ID="lblReturnTxt" runat="server" Text="返回" Visible="false"></asp:Label>
</asp:Content>
