<%@ Control Language="C#" AutoEventWireup="true" Inherits="WKF_FlowManagement_Layout_UC_SubFlow" Codebehind="UC_SubFlow.ascx.cs" %>
<%@ Reference Control="~/WKF/FlowManagement/Layout/UC_SignableSite.ascx" %>
<%@ Reference Control="~/WKF/FlowManagement/Layout/UC_BranchSiteCond.ascx" %>
<%@ Reference Control="~/WKF/FlowManagement/Layout/UC_CustDesignFlowSite.ascx" %>
<%@ Reference Control="~/WKF/FlowManagement/Layout/UC_FieldSite.ascx" %>
<%@ Reference Control="~/WKF/FlowManagement/Layout/UC_ParallelSite.ascx" %>
<%@ Reference Control="~/WKF/FlowManagement/Layout/UC_AlertSite.ascx" %>

<script>
    function WKF_swapImage(imgbtn, imgurl) {
        var ImgButton = $('#' + imgbtn)
        ImgButton.attr("src", '<%=themePath %>' + imgurl);
    }

</script>
<asp:Table ID="tbSubFlowBranchNode" runat="server" BorderWidth="0px" CellPadding="0"
    CellSpacing="0" Width="143px" meta:resourcekey="Table1Resource1">
</asp:Table>
<table id="tbSubFlowMaster" runat="server" cellpadding="0" cellspacing="0" >
    <tr>
        <td>
            <table border="0" style="padding:0px;width:160px;align-content:center" >
                <tr>
                    <td colspan="3" style="vertical-align:middle;height:55px;background-image:url(<%=themePath %>/images/wkf/site_top_big.gif);background-repeat:no-repeat; background-position:bottom;">
                        <center>
                        <table id="TBModify" runat="server"  border="0"  style="text-align:center;padding:0px" align="center">
                            <tr >
                                <td style="vertical-align:middle;" >
                                    <asp:ImageButton ID="imgLeft" runat="server" Enabled="false"/></td>
                                <td style="vertical-align:middle" >
                                    <asp:ImageButton ID="imgBtnModify" runat="server" ImageUrl="<%=themePath %>/images/wkf/action_02.gif" meta:resourcekey="imgBtnModifyResource1" /></td>
                                <td style="vertical-align:middle" >
                                    <asp:ImageButton ID="imgBtnInsert" runat="server" ImageUrl="<%=themePath %>/images/wkf/action_03.gif" OnClick="imgBtnInsert_Click" meta:resourcekey="imgBtnInsertResource1" /></td>
                                <td style="vertical-align:middle" >
                                    <asp:ImageButton ID="imgBtnDel" runat="server" ImageUrl="<%=themePath %>/images/wkf/action_04.gif"
                                        OnClick="imgBtnDel_Click" meta:resourcekey="imgBtnDelResource1" /></td>
                                <td style="vertical-align:middle" id="tdUp" runat="server" >
                                    <asp:ImageButton ID="imgBtnUp" runat="server" ImageUrl="<%=themePath %>/images/wkf/action_05.gif"
                                        OnClick="imgBtnUp_Click" meta:resourcekey="imgBtnUpResource1" /></td>
                                <td style="vertical-align:middle"  id="tdDown" runat="server">
                                    <asp:ImageButton ID="imgBtnDown" runat="server" ImageUrl="<%=themePath %>/images/wkf/action_06.gif"
                                        OnClick="imgBtnDown_Click" meta:resourcekey="imgBtnDownResource1" /></td>
                                <td style="vertical-align:middle" >
                                    <asp:ImageButton ID="imgRight" runat="server" Enabled="false"/></td>
                            </tr>
                        </table>
                        </center>
                    </td>
                </tr>
                <tr>
                    <td class="CondLeftTD" valign="top" style="min-width: 10px">
                        </td>
                    <td style="background-image: url(<%=themePath %>/images/wkf/site_con_big.gif); width: 143px;
                        background-repeat: repeat-y; text-align: center" valign="top">
                        <asp:UpdatePanel ID="updatePanel1" runat="server" UpdateMode="Conditional">
                            <ContentTemplate>
                        <asp:LinkButton ID="lbtnSubName1" runat="server" Visible=false ></asp:LinkButton>
                                </ContentTemplate>
                        </asp:UpdatePanel>
                        <asp:Label ID="lbtnSubName" runat="server" meta:resourcekey="lbtnSubNameResource1"></asp:Label>
                        <asp:Table ID="tbSubFlow"
                            runat="server" BorderWidth="0px" CellPadding="0" CellSpacing="0" meta:resourcekey="Table1Resource1"
                            Width="143px">
                        </asp:Table>
                    </td>
                    <td class="CondRightTD" valign="top" style="min-width:10px">
                    </td>
                </tr>
                <tr>
                    <td colspan="3" style="height: 28px">
                        <asp:Image ID="Imgdown" runat="server" meta:resourcekey="Image1Resource1" /></td>
                </tr>
            </table>
        </td>
    </tr>
</table>
<asp:Label ID="lblMsgFlowStart" runat="server" Text="流程起始依據" Visible="False" meta:resourcekey="lblMsgFlowStartResource1"></asp:Label>
<asp:Label ID="lblMsgApplicant" runat="server" Text="申請者" Visible="False" meta:resourcekey="lblMsgApplicantResource1"></asp:Label>
<asp:Label ID="lblSureDelete" runat="server" Text="確定刪除?" Visible="False" meta:resourcekey="lblSureDeleteResource1" ></asp:Label>   
    <asp:Label ID="lblInsertSite" runat="server" Text="新增站點" Visible="False" meta:resourcekey="lblInsertSiteResource1"></asp:Label>
    <asp:Label ID="lblDeleteSite" runat="server" Text="刪除站點" Visible="False" meta:resourcekey="lblDeleteSiteResource1"></asp:Label>
    <asp:Label ID="lblUpPrev" runat="server" Text="向上" Visible="False" meta:resourcekey="lblUpPrevResource1"></asp:Label>
    <asp:Label ID="lblDownNext" runat="server" Text="向下" Visible="False" meta:resourcekey="lblDownNextResource1"></asp:Label>
    <asp:Label ID="lblSetSite" runat="server" Text="設定" Visible="False" meta:resourcekey="lblSetSiteResource1"></asp:Label>
<asp:Label ID="lblFieldId" runat="server" Text="欄位代號" Visible="False" meta:resourcekey="lblFieldIdResource1"></asp:Label>


<asp:Label ID="lblPevSite" runat="server" Text="上一站點簽核者部門及職級" Visible="False" meta:resourcekey="lblPevSiteResource1"></asp:Label>


