<%@ Control Language="C#" AutoEventWireup="true" Inherits="WKF_Admin_TaskRecord_UC_Site" Codebehind="UC_Site.ascx.cs" %>

<br />
<table border="0" cellpadding="2" cellspacing="0" width="600px">
    <tr>
        <td style="height: 23px; text-align: center;background-image: url('<%=themePath %>/images/headerbg.gif');width:30%" >
            <strong><font color="#ffffff" size="2">
                <asp:Label ID="lblSiteInfo" runat="server"
                Text="站點資訊：" CssClass="j" meta:resourcekey="lblSiteInfoResource1"></asp:Label>
                <asp:Label ID="lblSignType" runat="server" CssClass="j" meta:resourcekey="lblSignTypeResource1"></asp:Label></font></strong></td>
                </td>
               
        <td style="height: 23px" width="77%" align="right">
            <asp:Table ID="Table1" runat="server">
            </asp:Table>
            </td>
    </tr>
    <tr>
        <td bgcolor="#e3e3e3" colspan="2">
            <table cellpadding="5" cellspacing="1" width="100%" style="border:4px; padding:5px;  border-style:solid; border-color:#e3e3e3;  ">
                <tr>
                    <td align="left" bgcolor="#ffffff" colspan="5" rowspan="2">
                    <asp:Table ID="tbSiteSignInfo" runat="server" BorderColor="#6699FF" boder="1" Width="100%" meta:resourcekey="tbSiteSignInfoResource1">
                    </asp:Table>
                        <asp:Table ID="tbAlert" runat="server" boder="1" BorderColor="#6699FF" Width="100%" meta:resourcekey="tbAlertResource1">
                        </asp:Table>
                    </td>
                </tr>
                <tr>
                </tr>
            </table>
        <asp:HyperLink ID="SiteClientId" runat="server"  NavigateUrl="~/Default.aspx" style="cursor:default;" meta:resourcekey="SiteClientIdResource1"></asp:HyperLink></td>
    </tr>
</table>
<br />
&nbsp;
<div align="center"><asp:Image ID="Image1" runat="server" ImageUrl="~/Common/Images/Icon/icon_m54.gif" meta:resourcekey="Image1Resource1" />
    </div>
    
<asp:Label ID="lblGeneral" runat="server" Text="一般" Visible="False" meta:resourcekey="lblGeneralResource1"></asp:Label><asp:Label ID="lblOr" runat="server" Text="並簽" Visible="False" meta:resourcekey="lblOrResource1"></asp:Label>
<asp:Label ID="lblAnd" runat="server" Text="會簽" Visible="False" meta:resourcekey="lblAndResource1"></asp:Label>
<asp:Label ID="lblSignResultApprove" runat="server" Text="同意" Visible="False" meta:resourcekey="lblSignResultApproveResource1"></asp:Label>
<asp:Label ID="lblSignResultDisApprove" runat="server" Text="否決" Visible="False" meta:resourcekey="lblSignResultDisApproveResource1"></asp:Label>
<asp:Label ID="lblSignResultPass" runat="server" Text="無意見" Visible="False" meta:resourcekey="lblSignResultPassResource1"></asp:Label>
<asp:Label id="lblSigner_title" runat="server" Text="簽核者：" Visible="False" meta:resourcekey="lblSigner_titleResource1"></asp:Label>
<asp:Label id="lblSignResult_title" runat="server" Text="簽核狀態：" Visible="False" meta:resourcekey="lblSignResult_titleResource1"></asp:Label>
<asp:Label id="lblAlert_titile" runat="server" Text="知會人員：" Visible="False" meta:resourcekey="lblAlert_titileResource1"></asp:Label>
<asp:Label ID="lblRead" runat="server" Text="已讀取" Visible="False" meta:resourcekey="lblReadResource1"></asp:Label>
<asp:Label ID="lblUnRead" runat="server" Text="未讀取" Visible="False" meta:resourcekey="lblUnReadResource1"></asp:Label>
<asp:Label ID="lblReturn" runat="server" Text="退簽" Visible="False" meta:resourcekey="lblReturnResource1"></asp:Label>
<asp:Label ID="lblApplicant" runat="server" Text="申請者" Visible="False" meta:resourcekey="lblApplicantResource1" ></asp:Label>
<asp:Label ID="lblAdditionalSiteMsg" runat="server" Text="(加簽站點)" Visible="False" meta:resourcekey="lblAdditionalSiteMsgResource1" ></asp:Label>
