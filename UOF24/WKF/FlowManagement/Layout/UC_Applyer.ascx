<%@ Control Language="C#" AutoEventWireup="true" Inherits="WKF_FlowManagement_Layout_UC_Applyer" Codebehind="UC_Applyer.ascx.cs" %>
<script>
    function WKF_swapImage(imgbtn, imgurl) {
        var ImgButton = $('#' + imgbtn)
        ImgButton.attr("src", '<%=themePath %>' + imgurl);
    }

</script>
<table cellpadding="0" cellspacing="0">
    <tr>
        <td>
            <asp:Label ID="Label1" runat="server" Text="申請者" Font-Underline=True ForeColor=Blue meta:resourcekey="Label1Resource1" Visible="False"></asp:Label>
        </td>
    </tr>
</table>

<table border="0" cellpadding="0" cellspacing="0">
    <tr>
        <td style="width:16px">
            &nbsp;
        </td>
        <td>
            &nbsp;
            <asp:Image ID="Image1" runat="server" ImageUrl="~/App_Themes/DefaultTheme/images/wkf/claimer.gif" meta:resourcekey="Image1Resource1" />
        </td>
        <td>
            <asp:ImageButton ID="imgWSSetting" runat="server" ImageUrl="site_SetWS.gif" meta:resourcekey="imgWSSettingResource1" ToolTip="Web Service 設定" />
        </td>
        <td>
            <asp:Label ID="lblSpace" runat="server" >&nbsp;</asp:Label>
        </td>
        <td>
            <asp:ImageButton ID="imgSignSetting" runat="server" ImageUrl="site_setting.gif"  meta:resourcekey="imgSignSettingResource1" ToolTip="加退簽及否決設定" />
        </td>
    </tr>
</table>
<asp:ImageButton ID="imgBtnInsert" runat="server" OnClick="imgBtnInsert_Click" meta:resourcekey="imgBtnInsertResource1" />
<asp:Label ID="lblInsertSite" runat="server" Text="新增站點" Visible ="False" meta:resourcekey="lblInsertSiteResource1"></asp:Label>