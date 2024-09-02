<%@ Control Language="C#" AutoEventWireup="true" Inherits="WKF_Browse_UC_SubFlowLayOut_UC_AlertSite_Sub" Codebehind="UC_AlertSite_Sub.ascx.cs" %>
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
                    <td colspan="2" style="text-align:left">
                        <asp:Label ID="Label1" runat="server" Text="知會站點" 
                            meta:resourcekey="Label1Resource1" ></asp:Label></td>
                </tr>
            </table>
            <div class="SignerTD">
                <asp:Table ID="tbAlert" runat="server" BorderWidth="0px" CellPadding="0" CellSpacing="0"
                    meta:resourcekey="tbSignerResource1">
                </asp:Table>
            </div>
        </td>
        <td class="SiteRightTD">&nbsp;</td>
    </tr>
    <tr>
        <td colspan="3">
            <asp:Image ID="ImgDown" runat="server" meta:resourcekey="ImgDownResource1" /></td>
    </tr>
</table>
<asp:Label ID="lblAlertSite" runat="server" Text="知會站點" Visible="False" 
    meta:resourcekey="lblAlertSiteResource1"  ></asp:Label>
    <asp:Label ID="lblApplyer" runat="server" Text="申請者" Visible="False" meta:resourcekey="lblApplyerResource1"></asp:Label>
    <asp:Label ID="lblLastSiteAgent" runat="server" Text="上一站點代理人" Visible="False" meta:resourcekey="lblLastSiteAgentResource1"></asp:Label>
    <asp:Label ID="lblApplyerSuperiorSign" runat="server" Text="申請者直屬主管" Visible="False" meta:resourcekey="lblApplyerSuperiorSignResource1"></asp:Label>
    <asp:Label ID="lblLastSuperiorSign" runat="server" Text="上一站直屬主管" Visible="False" meta:resourcekey="lblLastSuperiorSignResource1"></asp:Label>
