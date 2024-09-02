<%@ Control Language="C#" AutoEventWireup="true" Inherits="WKF_FormManagement_VersionFieldUserControl_AutoNumberUC" Codebehind="AutoNumberUC.ascx.cs" %>
<%@ Reference Control="VersionFieldUC.ascx" %>
<style>
    .AutoNumber{
        background-color:initial;
    }
</style>
		
<table>
    <tr>
        <td>
            <asp:TextBox ID="tbxAutoNumber" runat="server" CssClass="AutoNumber" ReadOnly="True" ToolTip="自動編號(唯讀)" EnableViewState="False" Enabled="False" Width="100%"></asp:TextBox>
            <asp:Label ID="lblSysAuto" runat="server" Visible="false" meta:resourcekey="tbxAutoNumberResource1"></asp:Label>
            <asp:Label ID="lblAutoNumber" runat="server" meta:resourcekey="lblAutoNumberResource1"></asp:Label>
        </td>
    </tr>
</table>


