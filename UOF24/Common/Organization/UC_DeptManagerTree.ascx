<%@ Control Language="C#" AutoEventWireup="true" Inherits="Common_ChoiceCenter_UC_DeptManagerTree" Codebehind="UC_DeptManagerTree.ascx.cs" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<table style="width: 100%;">
    <tr>
        <td>
            <asp:Label ID="lblControlWidth" runat="server" Text="" Width="1px" Visible="false"></asp:Label>
            <asp:CheckBox ID="chbDisplayAllDept" runat="server" Text="顯示已停用部門" Visible="false" AutoPostBack="true" OnCheckedChanged="chbDisplayAllDept_CheckedChanged" meta:resourcekey="chbDisplayAllDeptResource1" />
        </td>
    </tr>
    <tr>
        <td>
            <telerik:RadTreeView ID="DepartmentTree" runat="server"
                EnableNodeTextHtmlEncoding="true" OnNodeClick="DepartmentTree_NodeClick">
            </telerik:RadTreeView>
        </td>
    </tr>
</table>

<asp:Label ID="lblDeptManager" runat="server" Text="部門管理員" Visible="False" 
    meta:resourcekey="lblDeptManagerResource1"></asp:Label>
<asp:Label ID="lblSuperior" runat="server" Text="主管" Visible="False" 
    meta:resourcekey="lblSuperiorResource1"></asp:Label>
<asp:Label ID="lblPersonal" runat="server" Text="個人" Visible="False" 
    meta:resourcekey="lblPersonalResource1"></asp:Label>