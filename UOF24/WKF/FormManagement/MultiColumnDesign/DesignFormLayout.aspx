<%@ Page Title="" Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" CodeBehind="DesignFormLayout.aspx.cs" Inherits="Ede.Uof.Web.WKF.FormManagement.MultiColumnDesign.DesignFormLayout" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" %>
<%@ Register Src="~/WKF/FormManagement/MultiColumnDesign/UC_VersionFieldCollection.ascx" TagPrefix="uc1" TagName="VersionFieldCollectionUC" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:Panel ID="Panel1" runat="server" Width="100%" meta:resourcekey="Panel1Resource1">
        <table style="overflow: hidden;width:100%">
            <tr>
                <td>
                    <uc1:VersionFieldCollectionUC ID="VersionFieldCollectionUC1" runat="server" EnableViewState="False"></uc1:VersionFieldCollectionUC>
                </td>
            </tr>
        </table>
    </asp:Panel>
</asp:Content>
