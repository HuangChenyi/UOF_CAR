<%@ Control Language="C#" AutoEventWireup="true"
    Inherits="WKF_FlowManagement_Layout_UC_CustGroupFlowSite" Codebehind="UC_CustGroupFlowSite.ascx.cs" %>

     <script>
         function WKF_swapImage(imgbtn, imgurl) {
             var ImgButton = $('#' + imgbtn)
             ImgButton.attr("src" ,'<%=themePath %>' + imgurl);
    }

</script>
<table cellpadding="0" cellspacing="0" id="tbSubFlowMaster" runat="server">
    <tr>
        <td >
            <table border="0" style="padding:0px;width:160px">
                <tr>
                    <td  colspan="3" style="vertical-align:middle;text-align: center;height:55px;background-image:url(<%=themePath %>/images/wkf/site_top_big.gif)">
                    <center>
                        <table id="TBModify" runat="server" border="0" cellpadding="0" cellspacing="0">
                            <tr>
                                <td style="vertical-align:middle">
                                    <asp:ImageButton ID="imgLeft" runat="server" Enabled="false"/></td>
                                <td style="vertical-align:middle">
                                    <asp:ImageButton ID="imgBtnModify" runat="server" ImageUrl="<%=themePath %>/images/wkf/action_02.gif" meta:resourcekey="imgBtnModifyResource1" /></td>
                                <td style="vertical-align:middle">
                                    <asp:ImageButton ID="imgBtnInsert" runat="server" ImageUrl="<%=themePath %>/images/wkf/action_03.gif" OnClick="imgBtnInsert_Click" meta:resourcekey="imgBtnInsertResource1" /></td>
                                <td style="vertical-align:middle">
                                    <asp:ImageButton ID="imgBtnDel" runat="server" ImageUrl="<%=themePath %>/images/wkf/action_04.gif"
                                        OnClick="imgBtnDel_Click" meta:resourcekey="imgBtnDelResource1" /></td>
                                <td style="vertical-align:middle">
                                    <asp:ImageButton ID="imgBtnUp" runat="server" ImageUrl="<%=themePath %>/images/wkf/action_05.gif"
                                        OnClick="imgBtnUp_Click" meta:resourcekey="imgBtnUpResource1" /></td>
                                <td style="vertical-align:middle">
                                    <asp:ImageButton ID="imgBtnDown" runat="server" ImageUrl="<%=themePath %>/images/wkf/action_06.gif"
                                        OnClick="imgBtnDown_Click" meta:resourcekey="imgBtnDownResource1" /></td>
                                <td style="vertical-align:middle">
                                    <asp:ImageButton ID="imgRight" runat="server" Enabled="false"/></td>
                            </tr>
                        </table>
                    </center>
                    </td>
                </tr>
                <tr>
                    <td class="CondLeftTD" valign="top" style="min-width:10px">&nbsp;</td>
                    <td style="min-width:143px; text-align: left; background-image: url(<%=themePath %>/images/wkf/site_con_big.gif);
                        background-repeat: repeat-y;" valign="top">
                        <center>
                            <asp:Label ID="lbtnCustGroupFlow" runat="server" Text="使用者自選流程" Font-Overline="False" Font-Underline="False" ForeColor="Blue" meta:resourcekey="lbtnCustGroupFlowResource1"></asp:Label>
                        </center>

                        <table cellpadding="0" cellspacing="0"  >
                            <tr>
                                <td style="height: 6px"></td>
                            </tr>
                            <tr>
                                <td >
                                    <asp:Table ID="tbCustGroupFlowSite" runat="server"  meta:resourcekey="tbCustGroupFlowSiteResource1">
                                    </asp:Table>
                                </td>
                            </tr>
                        </table>
                    </td>
                    <td class="CondRightTD" valign="top" style="min-width:10px"></td>
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
<asp:Label ID="lblSureDelete" runat="server" meta:resourcekey="lblSureDeleteResource1"
    Text="確定刪除?" Visible="False"></asp:Label>
    
    <asp:Label ID="lblInsertSite" runat="server" Text="新增站點" Visible="False" meta:resourcekey="lblInsertSiteResource1"></asp:Label>
    <asp:Label ID="lblDeleteSite" runat="server" Text="刪除站點" Visible="False" meta:resourcekey="lblDeleteSiteResource1"></asp:Label>
    <asp:Label ID="lblUpPrev" runat="server" Text="向上" Visible="False" meta:resourcekey="lblUpPrevResource1"></asp:Label>
    <asp:Label ID="lblDownNext" runat="server" Text="向下" Visible="False" meta:resourcekey="lblDownNextResource1"></asp:Label>
    <asp:Label ID="lblSetSite" runat="server" Text="設定" Visible="False" meta:resourcekey="lblSetSiteResource1"></asp:Label>
