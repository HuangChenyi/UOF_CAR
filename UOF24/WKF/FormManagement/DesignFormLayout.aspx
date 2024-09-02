<%@ Page Title="" Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="WKF_FormManagement_DesignFormLayout" Codebehind="DesignFormLayout.aspx.cs" %>

<%@ Register Src="~/WKF/FormManagement/VersionFieldUserControl/VersionFieldCollectionUC.ascx" TagPrefix="uc1" TagName="VersionFieldCollectionUC" %>







<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:Panel ID="Panel1" runat="server" Width="100%">
        <table style="overflow: hidden;width:100%">
            <tr>
                <td>
                    <uc1:VersionFieldCollectionUC ID="VersionFieldCollectionUC1" runat="server" EnableViewState="False"></uc1:VersionFieldCollectionUC>
                </td>
            </tr>
        </table>
    </asp:Panel>
</asp:Content>

