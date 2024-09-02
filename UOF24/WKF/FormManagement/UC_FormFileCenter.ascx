<%@ Control Language="C#" AutoEventWireup="true" Inherits="WKF_FormManagement_UC_FormFileCenter" Codebehind="UC_FormFileCenter.ascx.cs" %>
<%@ Register Src="~/Common/FileCenter/V3/UC_FileCenter.ascx" TagPrefix="uc2" TagName="UC_FileCenter" %>

<table cellpadding=0 cellspacing=0 width=100%>
<tr><td align="center">
    <asp:LinkButton ID="LinkButton1" runat="server" ForeColor="OliveDrab" OnClick="LinkButton1_Click" meta:resourcekey="LinkButton1Resource1" CausesValidation="False"></asp:LinkButton></td></tr>
<tr><td>
    <uc2:UC_FileCenter runat="server" ID="Uc_FileCenter1" ProxyEnabled="true"/>
</td></tr>

</table>
<asp:HiddenField ID="HiddenField1" runat="server" />
<asp:HiddenField ID="bool_IsUploadFile" runat="server" Value="false" />
