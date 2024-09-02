
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Control Language="C#" AutoEventWireup="true"
    Inherits="Common_Organization_DepartmentTree" Codebehind="DepartmentTree.ascx.cs" %>
<table style="width: 100%;">
    <tr>
        <td>
            <asp:Label ID="lblControlWidth" runat="server" Text="" Width="1px" Visible="false"></asp:Label>
            <asp:CheckBox ID="chbDisplayAllDept" runat="server" Text="顯示已停用部門" Visible="false" AutoPostBack="true" OnCheckedChanged="chbDisplayAllDept_CheckedChanged" meta:resourcekey="chbDisplayAllDeptResource1"/>
        </td>
    </tr>
    <tr>
        <td>
            <telerik:RadTreeView ID="treeDepartment" runat="server" OnNodeClick="treeDepartment_NodeClick" EnableNodeTextHtmlEncoding="True" />
        </td>
    </tr>
</table>