<%@ Control Language="C#" AutoEventWireup="true" Inherits="WKF_Browse_TaskRecord_UC_Site" Codebehind="UC_Site.ascx.cs" %>
   <div runat="server" id="div1" style="cursor:hand; background-color: transparent;">

<table cellspacing="0" cellpadding="0">
    <tbody>
        <tr>
            <td colspan="3">
                <asp:Image ID="imgTop"
                    runat="server" meta:resourcekey="Image2Resource1"></asp:Image></td>
        </tr>
        <tr>
            <td class="SiteLeftTD" valign="top" style="width: 10px">&nbsp;&nbsp;</td>
            <td class="SiteMiddleTD" valign="top" style="width: 125px">
                <div class="SignerTD">
                    <table cellpadding="0" cellspacing="0" width="100%">
                        <tr>
                            <td align="center" style="height: 20px" valign="top" width="5"></td>
                            <td align="center" style="height: 20px" valign="top">&nbsp;<asp:Label ID="lblSiteType"
                                runat="server" meta:resourcekey="lblSiteTypeResource1"></asp:Label>
                                <asp:Image ID="imgAlert" runat="server" Visible="False" meta:resourcekey="imgAlertResource1" /></td>
                        </tr>
                        <tr>
                            <td></td>
                            <td>
                                <asp:Table ID="tbSigner" runat="server" CellSpacing="0" CellPadding="0" BorderWidth="0px"
                                    meta:resourcekey="tbSignerResource1">
                                </asp:Table>
                            </td>
                        </tr>
                    </table>
                </div>
            </td>
            <td class="SiteRightTD" style="width: 9px">&nbsp;&nbsp;</td>
        </tr>
        <tr>
            <td colspan="3">
                <asp:Image ID="imgButton"
                    runat="server" meta:resourcekey="Image1Resource1"></asp:Image></td>
        </tr>
    </tbody>
</table>
<asp:Label ID="lblMsg1" runat="server" Text="未簽核" Visible="False" meta:resourcekey="lblMsg1Resource1"></asp:Label>
<asp:Label ID="lblGeneral" Visible="False" runat="server" Text="一般" meta:resourcekey="lblGeneralResource1"></asp:Label>
<asp:Label ID="lblAddtionalSite" Visible="False" runat="server" Text="加簽" meta:resourcekey="lblAddtionalSite"></asp:Label>
<asp:Label ID="lblOr" Visible="False" runat="server" Text="並簽" meta:resourcekey="lblOrResource1"></asp:Label>
<asp:Label ID="lblAnd" Visible="False" runat="server" Text="會簽" meta:resourcekey="lblAndResource1"></asp:Label>
<asp:Label ID="lblSignResultApprove" runat="server" Text="同意" Visible="False" meta:resourcekey="lblSignResultApproveResource1"></asp:Label>
<asp:Label ID="lblSignResultDisApprove" runat="server" Text="否決" Visible="False"
    meta:resourcekey="lblSignResultDisApproveResource1"></asp:Label>
<asp:Label ID="lblSignResultPass" runat="server" Text="無意見" Visible="False" meta:resourcekey="lblSignResultPassResource1"></asp:Label>
<asp:Label ID="lblSignResultCancel" runat="server" Text="作廢" Visible="False" meta:resourcekey="lblSignResultCancelResource1"></asp:Label>
<asp:Label ID="lblAgnet" runat="server" Text="代理" Visible="False" meta:resourcekey="lblAgnetResource1"></asp:Label>
<asp:Label ID="lblReturn" runat="server" Text="退簽" Visible="False" meta:resourcekey="lblReturnResource1"></asp:Label>
<asp:Label ID="lblApplicant" runat="server" Text="申請者" Visible="False" ></asp:Label>
<asp:Label ID="lblForcedClosure" runat="server" Text="強制結案" Visible="False" meta:resourcekey="lblForcedClosureResource1" ></asp:Label>
</div>