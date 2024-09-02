<%@ Control Language="C#" AutoEventWireup="true" Inherits="WKF_Browse_UC_SubFlowLayOut_UC_CustSite_Sub" Codebehind="UC_CustSite_Sub.ascx.cs" %>
<table cellpadding="0" cellspacing="0">
    <tr>
        <td colspan="3">
            <asp:Image ID="ImgTop" runat="server" meta:resourcekey="ImgTopResource1" /></td>
    </tr>
    <tr>
        <td class="SiteLeftTD" valign="top" width="10">&nbsp;</td>
        <td class="SiteMiddleTD" valign="top" width="125">
            <table cellpadding="0" cellspacing="0" width="125">
                <tr>
                    <td align="center" colspan="2">
                        <br />                       
                        <asp:Label ID="Label1" runat="server" Text="自訂流程站點" meta:resourcekey="Label1Resource1"></asp:Label></td>
                </tr>
            </table>
            <div class="SignerTD">
                &nbsp;</div>
        </td>
        <td class="SiteRightTD">&nbsp;</td>
    </tr>
    <tr>
        <td colspan="3">
            <asp:Image ID="ImgDown" runat="server" meta:resourcekey="ImgDownResource1" /></td>
    </tr>
</table>
<asp:Label ID="Label2" runat="server" Text="自訂流程站點" Visible="False" meta:resourcekey="Label2Resource1"></asp:Label>
