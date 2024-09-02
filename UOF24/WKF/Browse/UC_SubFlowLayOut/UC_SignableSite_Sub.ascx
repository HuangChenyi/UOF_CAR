<%@ Control Language="C#" AutoEventWireup="true"
    Inherits="WKF_Browse_UC_SubFlowLayOut_UC_SignableSite_Sub" Codebehind="UC_SignableSite_Sub.ascx.cs" %>
<%@ Register Src="../../../Common/ChoiceCenter/UC_ChoiceList.ascx" TagName="UC_ChoiceList"
    TagPrefix="uc2" %>
<table cellpadding="0" cellspacing="0">
    <tr>
        <td colspan="3">
            <asp:Image ID="ImgTop" runat="server" meta:resourcekey="ImgTopResource1" /></td>
    </tr>
    <tr>
        <td width="10" valign="top" class="SiteLeftTD">&nbsp;</td>
        <td width="125" valign="top" class="SiteMiddleTD" style="height:40px;vertical-align:top;width:125px;background-image:url(<%=themePath %>/images/wkf/site_con.gif)" >
            <table width="125" cellpadding="0" cellspacing="0">
                <tr>
                    <td colspan="2" align="left">
                        <asp:LinkButton ID="linkbtnSiteType" runat="server" meta:resourcekey="linkbtnSiteTypeResource1"></asp:LinkButton></td>
                </tr>
            </table>
            <div class="SignerTD">
                <asp:Table ID="tbSigner" runat="server" BorderWidth="0px" CellPadding="0" CellSpacing="0"
                    meta:resourcekey="tbSignerResource1">
                </asp:Table>
            </div>
        </td>
        <td class="SiteRightTD">&nbsp</td>
        <tr>
            <td colspan="3">
                <asp:Image ID="ImgDown" runat="server" meta:resourcekey="ImgDownResource1" /></td>
        </tr>
</table>
<asp:Panel ID="Panel1" runat="server" Visible="False" meta:resourcekey="Panel1Resource1">
    <asp:Label ID="lblStartSigner" runat="server" Text="流程起始人員" meta:resourcekey="lblStartSignerResource1"></asp:Label>
    <asp:Label ID="lblApplyer" runat="server" Text="申請者" meta:resourcekey="lblApplyerResource1"></asp:Label>
    <asp:Label ID="lblLastSiteAgent" runat="server" Text="上一站點代理人" meta:resourcekey="lblLastSiteAgentResource1"></asp:Label>
    <asp:Label ID="lblApplyerSuperiorSign" runat="server" Text="申請者直屬主管" meta:resourcekey="lblApplyerSuperiorSignResource1"></asp:Label>
    <asp:Label ID="lblLastSuperiorSign" runat="server" Text="上一站直屬主管" meta:resourcekey="lblLastSuperiorSignResource1"></asp:Label>
    <asp:Label ID="lblGeneral" runat="server" Text="一般" Visible="False" meta:resourcekey="lblGeneralResource1"></asp:Label>
    <asp:Label ID="lblAnd" runat="server" Text="會簽" Visible='False' meta:resourcekey="lblAndResource1"></asp:Label>
    <asp:Label ID="lblOr" runat="server" Text="並簽" Visible="False" meta:resourcekey="lblOrResource1"></asp:Label>
    <asp:Label ID="lblByCondition" runat="server" Text="依條件" Visible="False" meta:resourcekey="lblByConditionResource1"></asp:Label>
    <asp:Label ID="lblYes" runat="server" Text="可結案" Visible="False" meta:resourcekey="lblYesResource1"></asp:Label>
    <asp:LinkButton ID="linkBtnSetting" runat="server" meta:resourcekey="linkBtnSettingResource1"
        Text="設定" Visible="False"></asp:LinkButton>
    <asp:Label ID="lblNo" runat="server" Text="不可結案" Visible="False" meta:resourcekey="lblNoResource1"></asp:Label>
    <asp:Label ID="lblAssign" runat="server" Text="上一站指定" Visible="False" meta:resourcekey="lblAssignResource1"></asp:Label>
    <asp:Label ID="lblViewSiteMsg" runat="server" Text="觀看站點資訊" Visible="False" 
        meta:resourcekey="lblViewSiteMsgResource1"></asp:Label>
</asp:Panel>
