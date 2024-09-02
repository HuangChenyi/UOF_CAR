<%@ Control Language="C#" AutoEventWireup="true"
    Inherits="WKF_Browse_TaskRecord_UC_Applicant" Codebehind="UC_Applicant.ascx.cs" %>
   <div runat="server" id="div1" style="cursor:hand; background-color: transparent;">
<table cellpadding="0" cellspacing="0">
    <tbody>
        <tr>
            <td colspan="3">
                <asp:Image ID="Image2" runat="server" meta:resourcekey="Image2Resource1" /></td>
        </tr>
        <tr>
            <td class="SiteLeftTD" valign="top" width="10">&nbsp;</td>
            <td class="SiteMiddleTD" valign="top" width="125">
                <div class="SignerTD">
                    <table cellpadding="0" cellspacing="0" width=100%>
                        <tr>
                            <td width="5" style="height: 20px"></td>
                            <td align="center" style="height: 20px">
                                <asp:Label ID="Label1" runat="server" Text="申請者" meta:resourcekey="Label1Resource1"></asp:Label></td>
                            <td align="center" style="height: 20px"></td>
                        </tr>
                        <tr>
                            <td></td>
                            <td>
                                <asp:Table ID="tbSigner" runat="server" BorderWidth="0px" CellPadding="0" CellSpacing="0" meta:resourcekey="tbSignerResource1">
                                </asp:Table>
                            </td>
                            <td width="5"></td>
                        </tr>
                    </table>
                </div>
            </td>
            <td class="SiteRightTD" style="width: 9px"></td>
        </tr>
        <tr>
            <td colspan="3">
                <asp:Image ID="Image1" runat="server"  meta:resourcekey="Image1Resource1" /></td>
        </tr>
    </tbody>
</table>
<asp:Label ID="lblSignResultApprove" runat="server" Text="同意" Visible="False" meta:resourcekey="lblSignResultApproveResource1"></asp:Label>
<asp:Label ID="lblSignResultDisApprove" runat="server" Text="否決" Visible="False" meta:resourcekey="lblSignResultDisApproveResource1"></asp:Label>
<asp:Label ID="lblSignResultPass" runat="server" Text="無意見" Visible="False" meta:resourcekey="lblSignResultPassResource1"></asp:Label>
</div>