<%@ Control Language="C#" AutoEventWireup="true" Inherits="WKF_Browse_UC_SubFlowLayOut_UC_PrevSite" Codebehind="UC_PrevSite.ascx.cs" %>
<table cellpadding="0" cellspacing="0">
    <tr>
        <td colspan="3">
            <asp:Image ID="ImgTop" runat="server"  meta:resourcekey="ImgTopResource1" /></td>
    </tr>
    <tr>
        <td class="SiteLeftTD" valign="top" width="10">&nbsp;</td>
        <td class="SiteMiddleTD" valign="top" width="125">
            <div align="center" >
                &nbsp;<asp:Label ID="Label1" runat="server" Text="上一站點" ForeColor="Blue" meta:resourcekey="Label1Resource1"></asp:Label></div>
        </td>
        <td class="SiteRightTD">&nbsp;</td>
    </tr>
    <tr>
        <td colspan="3">
            <asp:Image ID="ImgDown" runat="server"  meta:resourcekey="ImgDownResource1" /></td>
    </tr>
</table>
<asp:Label ID="lblCustSiteTitle" runat="server" Text="自訂起始站點" Visible="False" meta:resourcekey="lblCustSiteTitleResource1"></asp:Label>