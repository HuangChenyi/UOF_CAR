<%@ Control Language="C#" AutoEventWireup="true" Inherits="WKF_FlowManagement_Layout_UC_SignableSite" Codebehind="UC_SignableSite.ascx.cs" %>
<%@ Register Src="../../../Common/ChoiceCenter/UC_ChoiceList.ascx" TagName="UC_ChoiceList"
    TagPrefix="uc2" %>

<script>
    function WKF_swapImage(imgbtn, imgurl) {
        var ImgButton = $('#' + imgbtn)
        ImgButton.attr("src", '<%=themePath %>' + imgurl);
    }
    
</script>
<table border="0"  style="padding:0;width:143px" >
    <tr>
      <td colspan="3" style="vertical-align:bottom ">
          <asp:Image ID="imgArrow" runat="server" meta:resourcekey="imgArrowResource1" /></td>
    </tr>
    <tr>
        <td  colspan="3"  height="21" style="background-image:url(<%=themePath %>/images/wkf/app_top.gif); background-repeat:no-repeat; background-position:bottom;">
           <center>
            <table runat="server" id="TBModify" border="0" cellpadding="0" cellspacing="0">
                <tr>
                    <td style="vertical-align:middle">
                       <asp:ImageButton ID="imgLeft" runat="server" Enabled="false"/>
                    </td>
                    <td>
                        <asp:ImageButton ID="imgBtnModify" runat="server" ImageUrl="<%=themePath %>/images/wkf/action_02.gif" meta:resourcekey="imgBtnModifyResource1" />
                    </td>
                    <td style="vertical-align:middle">
                        <asp:ImageButton ID="imgBtnInsert" runat="server" ImageUrl="<%=themePath %>/images/wkf/action_03.gif" meta:resourcekey="imgBtnInsertResource1" />
                    </td>
                    <td style="vertical-align:middle">
                        <asp:ImageButton ID="imgBtnDel" runat="server" ImageUrl="<%=themePath %>/images/wkf/action_04.gif" OnClick="imgBtnDel_Click" meta:resourcekey="imgBtnDelResource1" />
                    </td>
                    <td style="vertical-align:middle" id="tdUp" runat="server">
                        <asp:ImageButton ID="imgBtnUp" runat="server" ImageUrl="<%=themePath %>/images/wkf/action_05.gif" OnClick="imgBtnUp_Click" meta:resourcekey="imgBtnUpResource1" />
                    </td>
                    <td style="vertical-align:middle"  id="tdDown" runat="server">
                        <asp:ImageButton ID="imgBtnDown" runat="server" ImageUrl="<%=themePath %>/images/wkf/action_06.gif" OnClick="imgBtnDown_Click" meta:resourcekey="imgBtnDownResource1" />
                    </td>
                    <td style="vertical-align:middle">
                        <asp:ImageButton ID="imgRight" runat="server" Enabled="false"/>
                    </td>
                </tr>
            </table>
            </center>
        </td>
    </tr>
    <tr>
        <td class="SiteLeftTD" valign="top" width="8px">
            &nbsp;</td>
        <td  style="height:61px;vertical-align:top;widows:125px;background-image:url(<%=themePath %>/images/wkf/site_con.gif)">
            <table cellpadding="0" cellspacing="0" width="100%" border="0">
                <tr style="height:20px">
                    <td  style="text-align:center;word-break:keep-all">
                        <asp:ImageButton ID="imgSiteType" runat="server" ImageUrl="site_normal.gif" meta:resourcekey="imgSiteTypeResource1" ToolTip="觀看站點" />
                    </td>
                    <td  style="text-align:center;word-break:keep-all"><asp:ImageButton ID="imgWSSetting" runat="server" ImageUrl="site_SetWS.gif" meta:resourcekey="imgWSSettingResource1" ToolTip="Web Service 設定" /></td>
                    <td  style="text-align:center;word-break:keep-all"><asp:ImageButton ID="imgsiteNote" runat="server" ImageUrl="site_noteSet.gif" meta:resourcekey="imgsiteNoteResource1" ToolTip="站點備註" /></td>
                    <td  style="text-align:center;word-break:keep-all"><asp:ImageButton ID="imgsiteMail" runat="server" ImageUrl="site_Mail.gif" meta:resourcekey="imgsiteMailResource1" ToolTip="站點郵件" /></td>
                    <td  style="text-align:center;word-break:keep-all"><asp:ImageButton ID="imgSetting" runat="server" ImageUrl="site_SetWS.gif" meta:resourcekey="imgSettingResource1" ToolTip="設定" /></td>
                    <td  style="text-align:center;word-break:keep-all"><asp:ImageButton ID="imgsiteCode" runat="server" ImageUrl="site_code.gif" meta:resourcekey="imgsiteCodeResource1" ToolTip="站點代號" /></td>
                </tr>
                <tr style="height:20px">
                    <td  style="text-align:center;word-break:keep-all"><asp:ImageButton ID="imgSignSetting" runat="server"  meta:resourcekey="imgSignSettingResource1" ToolTip="簽核設定" /></td>
                    <td  style="text-align:center;word-break:keep-all"><asp:ImageButton ID="imgSiteCustomWord" runat="server" ImageUrl="~/Common/Images/Icon/icon_m205.png" meta:resourcekey="imgSiteCustomWordResource1" ToolTip="自訂簽核字詞" /></td>
                    <td  style="text-align:center;word-break:keep-all"><asp:ImageButton ID="imgRequiredField" runat="server" ImageUrl="~/Common/Images/Icon/icon_m208.png" meta:resourcekey="imgRequiredFieldResource1" ToolTip="填寫權限設定" /></td>
                    <td  style="text-align:center;word-break:keep-all"></td>
                    <td  style="text-align:center;word-break:keep-all"></td>
                    <td  style="text-align:center;word-break:keep-all"></td>
                </tr>
            </table>
            <div style="width:127px; text-align:left">
               <asp:Table ID="tbSigner" runat="server" BorderWidth="0px" CellPadding="0" CellSpacing="0" meta:resourcekey="tbSignerResource1">
                </asp:Table>
                </div>
                </td>
        <td class="SiteRightTD" width="8px" valign="top">
            &nbsp;</td>
    </tr>
    <tr>
        <td colspan="3" height="27"><asp:Image ID="imgButton" runat="server" meta:resourcekey="Image1Resource1" /></td>
    </tr>
</table>
<asp:Panel ID="Panel1" runat="server" Visible="False" meta:resourcekey="Panel1Resource1">
    <asp:Label ID="lblStartSigner" runat="server" Text="流程起始人員" meta:resourcekey="lblStartSignerResource1"></asp:Label>
    <asp:Label ID="lblApplyer" runat="server" Text="申請者" meta:resourcekey="lblApplyerResource1"></asp:Label><asp:Label ID="lblLastSiteAgent" runat="server" Text="上一站點代理人" meta:resourcekey="lblLastSiteAgentResource1"></asp:Label>
    <asp:Label ID="lblApplyerSuperiorSign" runat="server" Text="申請者直屬主管" meta:resourcekey="lblApplyerSuperiorSignResource1"></asp:Label>
    <asp:Label ID="lblLastSuperiorSign" runat="server" Text="上一站直屬主管" meta:resourcekey="lblLastSuperiorSignResource1"></asp:Label>
    <asp:Label ID="lblGeneral" runat="server" Text="一般" Visible="False" meta:resourcekey="lblGeneralResource1"></asp:Label>
   <asp:Label ID="lblAnd" runat="server" Text="會簽" Visible='False' meta:resourcekey="lblAndResource1"></asp:Label>
   <asp:Label ID="lblOr" runat="server" Text="並簽" Visible="False" meta:resourcekey="lblOrResource1"></asp:Label> 
    <asp:Label ID="lblByCondition" runat="server" Text="依條件" Visible="False" meta:resourcekey="lblByConditionResource1"></asp:Label>
    <asp:Label ID="lblYes" runat="server" Text="可結案" Visible="False" meta:resourcekey="lblYesResource1"></asp:Label>
   <asp:Label ID="lblNo" runat="server" Text="不可結案" Visible="False" meta:resourcekey="lblNoResource1"></asp:Label>
   <asp:Label ID="lblAssign" runat="server" Text="上一站指定" Visible="False" meta:resourcekey="lblAssignResource1"></asp:Label>   
   <asp:Label ID="lblSureDelete" runat="server" Text="確定刪除?" Visible="False" meta:resourcekey="lblSureDeleteResource1" ></asp:Label>
    <asp:Label ID="lblInsertSite" runat="server" Text="新增站點" Visible="False" meta:resourcekey="lblInsertSiteResource1"></asp:Label>
    <asp:Label ID="lblDeleteSite" runat="server" Text="刪除站點" Visible="False" meta:resourcekey="lblDeleteSiteResource1"></asp:Label>
    <asp:Label ID="lblUpPrev" runat="server" Text="向上" Visible="False" meta:resourcekey="lblUpPrevResource1"></asp:Label>
    <asp:Label ID="lblDownNext" runat="server" Text="向下" Visible="False" meta:resourcekey="lblDownNextResource1"></asp:Label>
    <asp:Label ID="lblSetSite" runat="server" Text="設定" Visible="False" meta:resourcekey="lblSetSiteResource1"></asp:Label>

    </asp:Panel>
