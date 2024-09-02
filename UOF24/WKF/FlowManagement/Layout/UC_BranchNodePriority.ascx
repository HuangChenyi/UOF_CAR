<%@ Control Language="C#" AutoEventWireup="true" Inherits="WKF_FlowManagement_Layout_UC_BranchNodePriority" Codebehind="UC_BranchNodePriority.ascx.cs" %>
<script>
    function WKF_swapImage(imgbtn, imgurl) {
        var ImgButton = $('#' + imgbtn)
        ImgButton.attr("src", '<%=themePath %>' + imgurl);
    }

</script>
<center>
    <table id="TBModify" runat="server" border="0" cellpadding="0" cellspacing="0" class="SubFlowTD">
        <tr>
            <td>
                <asp:ImageButton ID="imgLeft" runat="server" Enabled="false"/></td>
            <td>
                <asp:ImageButton ID="imgBtnAdjust" runat="server" ImageUrl="<%=themePath %>/images/wkf/action_01.gif" OnClick="imgBtnAdjust_Click" meta:resourcekey="imgBtnAdjustResource1" /></td>
            <td>
                <asp:ImageButton ID="imgBtnModify" runat="server" ImageUrl="<%=themePath %>/images/wkf/action_02.gif" meta:resourcekey="imgBtnModifyResource1" /></td>
            <td>
                <asp:ImageButton ID="imgBtnInsert" runat="server" ImageUrl="<%=themePath %>/images/wkf/action_03.gif" OnClick="imgBtnInsert_Click" meta:resourcekey="imgBtnInsertResource1" /></td>
            <td>
                <asp:ImageButton ID="imgBtnDel" runat="server" ImageUrl="<%=themePath %>/images/wkf/action_04.gif"
                    OnClick="imgBtnDel_Click" meta:resourcekey="imgBtnDelResource1" /></td>
            <td>
                <asp:ImageButton ID="imgBtnUp" runat="server" ImageUrl="<%=themePath %>/images/wkf/action_05.gif"
                    OnClick="imgBtnUp_Click" meta:resourcekey="imgBtnUpResource1" /></td>
            <td>
                <asp:ImageButton ID="imgBtnDown" runat="server" ImageUrl="<%=themePath %>/images/wkf/action_06.gif"
                    OnClick="imgBtnDown_Click" meta:resourcekey="imgBtnDownResource1" /></td>
            <td>
                <asp:ImageButton ID="imgRight" runat="server" Enabled="false"/></td>
        </tr>
    </table>
    </center>
<asp:Label ID="lblCustGroupSite" runat="server" Text="使用者自選流程站點" Visible="False" meta:resourcekey="lblCustGroupSiteResource1"></asp:Label>
   <asp:Label ID="lblSureDelete" runat="server" Text="確定刪除?" Visible="False" meta:resourcekey="lblSureDeleteResource1" ></asp:Label>   
 <asp:Label ID="lblInsertSite" runat="server" Text="新增站點" Visible ="False" meta:resourcekey="lblInsertSiteResource1"></asp:Label>
    <asp:Label ID="lblDeleteSite" runat="server" Text="刪除站點" Visible ="False" meta:resourcekey="lblDeleteSiteResource1"></asp:Label>
    <asp:Label ID="lblUpPrev" runat="server" Text="上移一站點" Visible ="False" meta:resourcekey="lblUpPrevResource1"></asp:Label>
    <asp:Label ID="lblDownNext" runat="server" Text="下移一站點" Visible ="False" meta:resourcekey="lblDownNextResource1"></asp:Label>
    <asp:Label ID="lblSetSite" runat="server" Text="設定" Visible ="False" meta:resourcekey="lblSetSiteResource1"></asp:Label>
      <asp:Label ID="lblSetNodeOrder" runat="server" Text="調整節點順序" Visible ="False" meta:resourcekey="lblSetNodeOrderResource1"></asp:Label>
