<%@ Control Language="C#" AutoEventWireup="true" Inherits="WKF_FormUse_TaskSiteSignInfo_UC_ParallelFlow" Codebehind="UC_ParallelFlow.ascx.cs" %>
<%@ Reference Control="~/WKF/FormUse/TaskSiteSignInfo/UC_Site.ascx" %>
<br />
<center>
<table border="0" cellpadding="2" cellspacing="0" width="700px">
    <tr>
        <td style="height: 23px; text-align: center;background-image: url('<%=themePath %>/images/headerbg2.gif');width:23%"  nowrap>
            <asp:Label ID="lblSubName" runat="server" Text="平行流程站點：" CssClass="j" meta:resourcekey="lblSubNameResource1"></asp:Label></td>
        <td style="height: 23px; text-align: right;" width="77%">&nbsp;</td>
    </tr>
    <tr>
        <td bgcolor="#a9a9a9" colspan="2" style="height: 107px; text-align: center;">
            <table bordercolordark="#000000" bordercolorlight="#ffffff" cellpadding="0" cellspacing="1"
                width="100%">
                <tr>
                    <td colspan="3" rowspan="3" style="text-align: center; background-color:#ffffff" valign="top">
                        <br />
                        <asp:Table ID="tbTask" runat="server" meta:resourcekey="tbTaskResource1">
 
                        </asp:Table>
                        <br />
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>
<br />
<asp:Image ID="Image1" runat="server" ImageUrl="~/Common/Images/Icon/icon_m54.gif" meta:resourcekey="Image1Resource1" />
</center>

<asp:Label ID="lblAddtionalFlowMsg" runat="server" Text="加簽流程" Visible="False" 
    meta:resourcekey="lblAddtionalFlowMsgMsgResource1"></asp:Label>