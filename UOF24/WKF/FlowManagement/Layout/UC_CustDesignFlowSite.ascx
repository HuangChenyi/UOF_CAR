<%@ Control Language="C#" AutoEventWireup="true" Inherits="WKF_FlowManagement_Layout_UC_CustDesignFlowSite" Codebehind="UC_CustDesignFlowSite.ascx.cs" %>
<script>
    function WKF_swapImage(imgbtn, imgurl) {
        var ImgButton = $('#' + imgbtn)
        ImgButton.attr("src", '<%=themePath %>' + imgurl);
    }

</script>

<table border="0" cellpadding="0" cellspacing="0" width="143px">
    <tr>
        <td colspan="3" valign="bottom">
            <asp:Image ID="imgArrow" runat="server" meta:resourcekey="imgArrowResource1" /></td>
    </tr>
    <tr>
        <td  colspan="3"  height="21" style="background-image:url(<%=themePath %>/images/wkf/app_top.gif);  background-repeat:no-repeat; background-position:bottom;"><center>
            <table id="TBModify" runat="server" border="0" cellpadding="0" cellspacing="0" style="text-align:center; ">
                <tr>
                    <td style="vertical-align:middle ">
                         <asp:ImageButton ID="imgLeft" runat="server" Enabled="false"/></td>
                    <td  style="vertical-align:middle ">
                        <asp:ImageButton ID="imgBtnInsert" runat="server" ImageUrl="<%=themePath %>/images/wkf/action_03.gif" OnClick="imgBtnInsert_Click" meta:resourcekey="imgBtnInsertResource1" /></td>
                    <td  style="vertical-align:middle ">
                        <asp:ImageButton ID="imgBtnDel" runat="server" ImageUrl="<%=themePath %>/images/wkf/action_04.gif"
                            OnClick="imgBtnDel_Click" meta:resourcekey="imgBtnDelResource1" /></td>
                    <td  style="vertical-align:middle " id="tdUp" runat="server">
                        <asp:ImageButton ID="imgBtnUp" runat="server" ImageUrl="<%=themePath %>/images/wkf/action_05.gif"
                            OnClick="imgBtnUp_Click" meta:resourcekey="imgBtnUpResource1" /></td>
                    <td  style="vertical-align:middle " id="tdDown" runat="server">
                        <asp:ImageButton ID="imgBtnDown" runat="server" ImageUrl="<%=themePath %>/images/wkf/action_06.gif"
                            OnClick="imgBtnDown_Click" meta:resourcekey="imgBtnDownResource1" /></td>
                    <td  style="vertical-align:middle ">
                        <asp:ImageButton ID="imgRight" runat="server" Enabled="false"/></td>
                </tr>
            </table>
            </center>
        </td>
    </tr>
    <tr>
        <td class="SiteLeftTD" valign="top" width="10">
            &nbsp;</td>
        <td  style="height:40px;vertical-align:top;width:125px;background-image:url(<%=themePath %>/images/wkf/site_con.gif)" >
            <br />
                        <asp:Label ID="Label1" runat="server" Text="自訂流程站點" meta:resourcekey="Label1Resource1"></asp:Label></td>
        <td class="SiteRightTD" valign="top" width="8">
            &nbsp;</td>
    </tr>
    <tr>
        <td colspan="3" height="27">
            <asp:Image ID="imgButton" runat="server" meta:resourcekey="Image1Resource1" /></td>
    </tr>
</table>
<asp:Label ID="Label2" runat="server" Text="自訂流程站點" Visible="False" meta:resourcekey="Label2Resource1"></asp:Label>
<asp:Label ID="lblSureDelete" runat="server" Text="確定刪除?" Visible="False" meta:resourcekey="lblSureDeleteResource1" ></asp:Label>   
 <asp:Label ID="lblInsertSite" runat="server" Text="新增站點" Visible ="False" meta:resourcekey="lblInsertSiteResource1"></asp:Label>
    <asp:Label ID="lblDeleteSite" runat="server" Text="刪除站點" Visible ="False" meta:resourcekey="lblDeleteSiteResource1"></asp:Label>
    <asp:Label ID="lblUpPrev" runat="server" Text="上移一站點" Visible ="False" meta:resourcekey="lblUpPrevResource1"></asp:Label>
    <asp:Label ID="lblDownNext" runat="server" Text="下移一站點" Visible ="False" meta:resourcekey="lblDownNextResource1"></asp:Label>
    <asp:Label ID="lblSetSite" runat="server" Text="設定" Visible ="False" meta:resourcekey="lblSetSiteResource1"></asp:Label>
