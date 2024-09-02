<%@ Control Language="C#" AutoEventWireup="true" Inherits="WKF_Browse_UC_SubFlowLayOut_UC_ParallelSite" Codebehind="UC_ParallelSite.ascx.cs" %>

        <style>
            .SubFlowTD {vertical-align:top; background-attachment: fixed; background-image: url("../../App_Themes/DefaultTheme/images/wkf/line1.gif"); background-repeat: repeat-y;}
            .EmptyTable {padding:0px;border:0px;margin:0px;text-align:center}
            .SignerTD {color:blue;text-align:left}
            .SiteLeftTD {background-image: url("<%=themePath %>/images/wkf/site_left.gif"); background-repeat: repeat-y;}
            .SiteMiddleTD {background-image: url("<%=themePath %>/images/wkf/app_con.gif"); background-repeat: repeat-y;}
            .SiteRightTD {width:8px;background-image: url("<%=themePath %>/images/wkf/site_right.gif"); background-repeat: repeat-y;}
            .CondTextTD {text-align:center;font-weight:bold;}
            .CondLeftTD {background-image: url("<%=themePath %>/images/wkf/site_left_big.gif"); background-repeat: repeat-y;}
            .CondMiddleTD { background-image: url("<%=themePath %>/images/wkf/cond_con.gif");background-repeat: repeat-y;text-align:center}
            .CondRightTD {background-image: url("<%=themePath %>/images/wkf/site_rig_big.gif"); background-repeat: repeat-y;}
            td_{text-align:center;vertical-align:top;font-size:12px;width:120;}
            table_{text-align:center;border:0px}
        </style>
<table cellpadding="0" cellspacing="0"  width="160">
    <tr>
        <td colspan="3">
            <asp:Image ID="ImgTop" runat="server" meta:resourcekey="ImgTopResource1" /></td>
    </tr>
    <tr>
        <td width="10" valign="top" class="CondLeftTD">&nbsp;</td>
        <td  style="background-image: url(<%=themePath %>/images/wkf/site_con_big.gif); width: 143px;
                        background-repeat: repeat-y; text-align: center" valign="top">
            <table  cellpadding="0" cellspacing="0">
                <tr>
                    <td colspan="2" align="left">
                        <asp:LinkButton ID="linkbtnSiteType" runat="server" meta:resourcekey="linkbtnSiteTypeResource1"></asp:LinkButton></td>
                </tr>
            </table>
            <div class="SignerTD">
                <asp:Table ID="tb" runat="server" BorderWidth="0px" CellPadding="0" CellSpacing="0" HorizontalAlign=Center
                    meta:resourcekey="tbSignerResource1">
                </asp:Table>
            </div>
        </td>
        <td class="CondRightTD" style="width: 10px" >&nbsp</td>
        <tr>
            <td colspan="3">
                <asp:Image ID="ImgDown" runat="server" meta:resourcekey="ImgDownResource1" /></td>
        </tr>
</table>