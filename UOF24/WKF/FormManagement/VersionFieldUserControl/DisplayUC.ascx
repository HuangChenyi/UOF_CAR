<%@ Control Language="C#" AutoEventWireup="true" Inherits="WKF_FormManagement_VersionFieldUserControl_DisplayUC" CodeBehind="DisplayUC.ascx.cs" %>
<%@ Register Src="../../../Common/ChoiceCenter/UC_BtnChoiceOnce.ascx" TagName="UC_BtnChoiceOnce" TagPrefix="uc2" %>
<%@ Register Src="../../../Common/ChoiceCenter/UC_ChoiceList.ascx" TagName="UC_ChoiceList" TagPrefix="uc1" %>
<%@ Reference Control="~/WKF/FormManagement/VersionFieldUserControl/VersionFieldUC.ascx" %>
<table id="tbField" runat="server">
    <tr>
        <td id="tdInvisible" runat="server">
            <asp:Label ID="lblInvisible" runat="server" Text="******"></asp:Label>
        </td>
        <td id="tdVisible" runat="server" >
            <asp:Label ID="lblFieldValue" runat="server" meta:resourcekey="lblFieldValueResource1"></asp:Label>
        </td>
    </tr>
</table>
