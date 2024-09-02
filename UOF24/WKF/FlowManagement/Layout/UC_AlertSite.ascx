<%@ Control Language="C#" AutoEventWireup="true"
    Inherits="WKF_FlowManagement_Layout_UC_AlertSite" Codebehind="UC_AlertSite.ascx.cs" %>
<script>
    function WKF_swapImage(imgbtn, imgurl) {
        var ImgButton = $('#' + imgbtn)
        ImgButton.attr("src" ,'<%=themePath %>' + imgurl);
    }

</script>
<table border="0" cellpadding="0" cellspacing="0" width="143">
    <tr>
        <td colspan="3" >
            <asp:Image ID="imgArrow" runat="server" meta:resourcekey="imgArrowResource1" />
        </td>
    </tr>
    <tr>
        <td colspan="3" height="21" style="background-image:url(<%=themePath %>/images/wkf/app_top.gif); background-repeat:no-repeat; background-position:bottom;">
            <center>
                <table id="TBModify" runat="server" >
                    <tr>
                        <td>
                            <asp:ImageButton ID="imgLeft" runat="server" Enabled="false"/>
                        </td>
                        <td >
                            <asp:ImageButton ID="imgBtnModify" runat="server" meta:resourcekey="imgBtnModifyResource1" />
                        </td>
                        <td>
                            <asp:ImageButton ID="imgBtnInsert" runat="server" meta:resourcekey="imgBtnInsertResource1"/>
                        </td>
                        <td>
                            <asp:ImageButton ID="imgBtnDel" runat="server" OnClick="imgBtnDel_Click" meta:resourcekey="imgBtnDelResource1" />
                        </td>
                        <td>
                            <asp:ImageButton ID="imgBtnUp" runat="server" OnClick="imgBtnUp_Click" meta:resourcekey="imgBtnUpResource1" />
                        </td>
                        <td>
                            <asp:ImageButton ID="imgBtnDown" runat="server" OnClick="imgBtnDown_Click" meta:resourcekey="imgBtnDownResource1"/>
                        </td>
                        <td>
                            <asp:ImageButton ID="imgRight" runat="server" Enabled="false"/>
                        </td>
                    </tr>
                </table>
            </center>
        </td>
    </tr>
    <tr>
        <td class="SiteLeftTD" valign="top" width="10" height="40">&nbsp;</td>
        <td style="background-image:url(<%=themePath %>/images/wkf/site_con.gif)" height="40" valign="top" width="125">
            <asp:Label ID="Label1" runat="server" Text="知會站點" meta:resourcekey="Label1Resource1"></asp:Label>
            <div class="SignerTD" style="width:100%; text-align:left">
                <asp:Table ID="tbAlert" runat="server" BorderWidth="0px" CellPadding="0" CellSpacing="0" meta:resourcekey="tbAlertResource1" ></asp:Table>
            </div>
        </td>
        <td class="SiteRightTD" valign="top" width="8" height="40">&nbsp;</td>
    </tr>
    <tr>
        <td colspan="3" height="27">
            <asp:Image ID="imgButton" runat="server" meta:resourcekey="Image1Resource1" />
        </td>
    </tr>
</table>

<asp:Label ID="lblAlertSite" runat="server" Text="知會站點" Visible="False" meta:resourcekey="lblExternalSiteResource1" ></asp:Label>
<asp:Label ID="lblSureDelete" runat="server" Text="確定刪除?" Visible="False" meta:resourcekey="lblSureDeleteResource1" ></asp:Label>   
<asp:Label ID="lblInsertSite" runat="server" Text="新增站點" Visible ="False" meta:resourcekey="lblInsertSiteResource1"></asp:Label>
<asp:Label ID="lblDeleteSite" runat="server" Text="刪除站點" Visible ="False" meta:resourcekey="lblDeleteSiteResource1"></asp:Label>
<asp:Label ID="lblUpPrev" runat="server" Text="上移一站點" Visible ="False" meta:resourcekey="lblUpPrevResource1"></asp:Label>
<asp:Label ID="lblDownNext" runat="server" Text="下移一站點" Visible ="False" meta:resourcekey="lblDownNextResource1"></asp:Label>
<asp:Label ID="lblSetSite" runat="server" Text="設定" Visible ="False" meta:resourcekey="lblSetSiteResource1"></asp:Label>
<asp:Label ID="lblStartSigner" runat="server" Text="流程起始人員" Visible="False" meta:resourcekey="lblStartSignerResource1"></asp:Label>
<asp:Label ID="lblApplyer" runat="server" Text="申請者" Visible="False" meta:resourcekey="lblApplyerResource1"></asp:Label>
<asp:Label ID="lblLastSiteAgent" runat="server" Text="上一站點代理人" Visible="False" meta:resourcekey="lblLastSiteAgentResource1"></asp:Label>
<asp:Label ID="lblApplyerSuperiorSign" runat="server" Text="申請者直屬主管" Visible="False" meta:resourcekey="lblApplyerSuperiorSignResource1"></asp:Label>
<asp:Label ID="lblLastSuperiorSign" runat="server" Text="上一站直屬主管" Visible="False" meta:resourcekey="lblLastSuperiorSignResource1"></asp:Label>