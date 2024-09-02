<%@ Control Language="C#" AutoEventWireup="true" Inherits="WKF_FormUse_TaskSiteSignInfo_UC_SubFlow" Codebehind="UC_SubFlow.ascx.cs" %>
<%@ Reference Control="~/WKF/FormUse/TaskSiteSignInfo/UC_Site.ascx" %>
<br />
<center>
<table border="0" cellpadding="2" cellspacing="0" width="700px">
    <tr>
        <td  style=" background-image : url(<%=themePath %>/images/headerbg2.gif);height: 23px; text-align: center;" width="23%" nowrap>
            <asp:Label ID="lblSubName" runat="server" Text="流程式站點：" CssClass="j" meta:resourcekey="lblSubNameResource1"></asp:Label></td>
        <td style="height: 23px; text-align: right;" width="77%">&nbsp;</td>
    </tr>
    <tr>
        <td colspan="2" style="height: 107px; text-align: center; vertical-align:middle; background-color: #a9a9a9;
            padding-top: 5px; padding-right: 5px; padding-bottom: 5px; padding-left: 5px; border-top-color: #e3e3e3; border-right-color: #e3e3e3; border-bottom-color: #e3e3e3; border-left-color: #e3e3e3; border-top-width: 4px; border-right-width: 4px; border-bottom-width: 4px; border-left-width: 4px; border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid;
            border:2px">
            <table bordercolordark="#000000" bordercolorlight="#ffffff" cellpadding="0" cellspacing="1"
                width="100%"  align="center" style="vertical-align:middle">
                <tr>
                    <td bgcolor="#ffffff" colspan="3" rowspan="3" align="center" style="text-align: center; background-color:#ffffff" valign="top">
                        <br />
                        <center>
                        <asp:Table ID="tbTask" runat="server" meta:resourcekey="tbTaskResource1">
 
                        </asp:Table>
                        </center>
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

<asp:Label ID="lblAddtionalFlowMsg" runat="server" Text="加簽流程" Visible="false" meta:resourcekey="lblAddtionalFlowMsgMsgResource1"></asp:Label>