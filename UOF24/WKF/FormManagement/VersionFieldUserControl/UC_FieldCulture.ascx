<%@ Control Language="C#" AutoEventWireup="true" Inherits="WKF_FormManagement_VersionFieldUserControl_UC_FieldCulture" Codebehind="UC_FieldCulture.ascx.cs" %>
    

<fieldset id=groupbox runat=server style="border:1px solid;border-color:gray;padding:3px" > 
    <legend>
        <asp:Label ID="lblTitle" runat="server" meta:resourcekey="lblTitleResource1"></asp:Label>
    </legend>
    <asp:Table ID="Table1" runat="server" meta:resourcekey="Table1Resource1" Width="100%"></asp:Table>
</fieldset>

<asp:Label ID="lblFieldName" runat="server" Text="欄位名稱" Visible="false"  meta:resourcekey="lblFieldNameResource1"></asp:Label>
<asp:Label ID="lblFieldRemark" runat="server" Text="欄位備註" Visible="false"  meta:resourcekey="lblFieldRemarkResource1"></asp:Label>
<asp:Label ID="lblEmpty" runat="server" Text="不允許空白" Visible="false"  meta:resourcekey="lblEmptyResource1"></asp:Label>