<%@ Page Title="" Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" CodeBehind="EdocViewerDialog.aspx.cs" Inherits="Ede.Uof.Web.Edoc.Common.EdocViewerDialog" %>

<%@ Register Src="~/Edoc/Common/UC_EdocViewer.ascx" TagPrefix="uc1" TagName="UC_EdocViewer" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script type="text/javascript">
        Sys.Application.add_load(function () {

        });
    </script>

    <asp:UpdatePanel ID="updatePanel1" runat="server" UpdateMode="Always">
        <ContentTemplate>
            <uc1:UC_EdocViewer runat="server" ID="UC_EdocViewer" />
        </ContentTemplate>
    </asp:UpdatePanel>
    <asp:HiddenField ID="hfViewerHeight" runat="server" />
</asp:Content>
