<%@ Control Language="C#" AutoEventWireup="true" Inherits="PMS_Common_UC_ProjectTree" Codebehind="UC_ProjectTree.ascx.cs" %>

<asp:Panel ID="panTree" runat="server" meta:resourcekey="panTreeResource1">
    <table align="center" border="0" cellpadding="5" cellspacing="3" height="100%" width="100%">
        <tr>
            <td valign="top">
                <telerik:RadTreeView ID="uTreeProj" runat="server" OnNodeClick="uTreeProj_NodeClick" OnNodeCheck="uTreeProj_NodeCheck"  EnableNodeTextHtmlEncoding="True"></telerik:RadTreeView>
            </td>
        </tr>
    </table>
</asp:Panel>

<asp:Label ID="lblDraft" runat="server" Text="草稿" Visible="False" meta:resourcekey="lblDraftResource1"></asp:Label>
<asp:Label ID="lblNotYetBegin" runat="server" Text="尚未開始" Visible="False" meta:resourcekey="lblNotYetBeginResource1"></asp:Label>
<asp:Label ID="lblProceeding" runat="server" Text="進行中" Visible="False" meta:resourcekey="lblProceedingResource1"></asp:Label>
<asp:Label ID="lblAudit" runat="server" Text="審核中" Visible="False" meta:resourcekey="lblAuditResource1"></asp:Label>
<asp:Label ID="lblSuspend" runat="server" Text="已中止" Visible="False" meta:resourcekey="lblSuspendResource1"></asp:Label>
<asp:Label ID="lblClose" runat="server" Text="已結案" Visible="False" meta:resourcekey="lblCloseResource1"></asp:Label>
<asp:HiddenField ID="hideProjCount" runat="server" value="0"/>
