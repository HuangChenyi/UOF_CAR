<%@ Control Language="C#" AutoEventWireup="true"
    Inherits="Common_Organization_Hierarchical_Department" Codebehind="Hierarchical_Department.ascx.cs" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<table style="width: 100%;">
    <tr>
        <td>
            <asp:Label ID="lblControlWidth" runat="server" Width="1px" Visible="False" meta:resourcekey="lblControlWidthResource1"></asp:Label>
            <asp:CheckBox ID="chbDisplayAllDept" runat="server" Text="顯示已停用部門" Visible="False" AutoPostBack="True" OnCheckedChanged="chbDisplayAllDept_CheckedChanged" meta:resourcekey="chbDisplayAllDeptResource1" />
        </td>
    </tr>
    <tr>
        <td>
            <telerik:RadTreeView ID="UC_HRDEPTTREE" runat="server" EnableNodeTextHtmlEncoding="true"
                OnNodeClick="UC_HRDEPTTREE_NodeClick">
            </telerik:RadTreeView>
        </td>
    </tr>
</table>