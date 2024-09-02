<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CanvasUC.ascx.cs" Inherits="WKF_FormManagement_VersionFieldUserControl_CanvasUC" %>
<script>
    function ClientValidate_<%=this.VersionField.FieldID%>(source, arguments) {
        if ($("#<%=hdFieldGroupId.ClientID%>").val() != "") {
            arguments.IsValid = true;
        }
        else {
            arguments.IsValid = false;
        }
    }

    function MyImage(Img) {
        var width = 160; //預先設置的所期望的寬的值
        var height = 160; //預先設置的所期望的高的值
        var oWidth = Img.width;
        var oHeight = Img.height;
        if (oWidth > width || oHeight > height) {//現有圖片只有寬或高超了預設值就進行js控制
            w = oWidth / width;
            h = oHeight / height;
            if (w > h) {//比值比較大==>寬比高大
                Img.width = width; //定下寬度為width的寬度
                Img.height = oHeight / w; //以下為計算高度

            } else {//高比寬大
                Img.height = height; //定下寬度為height高度
                Img.width = oWidth / h; //以下為計算高度
            }
        }
    }
</script>
<asp:UpdatePanel ID="updatepanel1" runat="server">
    <ContentTemplate>
        <table id="tbInvisible" runat="server">
            <tr>
                <td>
                    <asp:Label ID="lblInvisible" runat="server" Text="******"></asp:Label>
                </td>
            </tr>
        </table>
        <table border="0" cellpadding="0" cellspacing="0" id="tbPC" runat="server">
            <tr runat="server">
                <td nowrap="nowrap" id="tdButton" runat="server">
                    <asp:LinkButton ID="lnk_Edit" runat="server" CausesValidation="false" OnClick="lnk_Edit_Click" Visible="False" meta:resourcekey="lnk_EditResource1">[修改]</asp:LinkButton>
                    <asp:LinkButton ID="lnk_Cannel" runat="server" CausesValidation="false" OnClick="lnk_Cannel_Click" Visible="False" meta:resourcekey="lnk_CannelResource1">[取消]</asp:LinkButton>
                    <asp:LinkButton ID="lnk_Submit" runat="server" CausesValidation="false" OnClick="lnk_Submit_Click" Visible="False" meta:resourcekey="lnk_SubmitResource1">[確定]</asp:LinkButton>
                </td>
                <td id="tdOperate" runat="server">
                    <table>
                        <tr>
                            <td>
                                <asp:LinkButton ID="lbtnSign" runat="server" Text="簽名操作" CausesValidation="False" ForeColor="OliveDrab" meta:resourcekey="lbtnSignMobileResource1"></asp:LinkButton>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <img id="imgCanvas" runat="server" class="mediaCanvas" />
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblHasNoAuthority" runat="server" Text="無填寫權限" ForeColor="Red" Visible="False" meta:resourcekey="lblHasNoAuthorityResource1"></asp:Label>
                                <asp:Label ID="lblToolTipMsg" runat="server" Text="不允許修改(唯讀)" Visible="False" meta:resourcekey="lblToolTipMsgResource1"></asp:Label>
                                <asp:Label ID="lblModifier" runat="server" Visible="False" meta:resourcekey="lblModifierResource1"></asp:Label>
                                <asp:Label ID="lblFiller" CssClass="FillerVisible" runat="server" meta:resourcekey="lblFillerResource1"></asp:Label>
                                <asp:Label ID="lblMsgSigner" runat="server" Text="填寫者" Visible="False" meta:resourcekey="lblMsgSignerResource1"></asp:Label>
                                <asp:Label ID="lblAuthorityMsg" runat="server" Text="具填寫權限人員" Visible="False" meta:resourcekey="lblAuthorityMsgResource1"></asp:Label>
                            </td>
                        </tr>
                    </table>
                </td>
                <td nowrap="nowrap" id="tdAlert" runat="server">

                </td>
            </tr>
        </table>
        <table id="tbMobile" runat="server">
            <tr id="trButton" runat="server">
                <td runat="server">
                    <asp:LinkButton ID="lnk_EditMobile" runat="server" CausesValidation="false" OnClick="lnk_Edit_Click" Visible="False" CssClass="canvasLinkButtonFont" meta:resourcekey="lnk_EditResource1">[修改]</asp:LinkButton>
                    <asp:LinkButton ID="lnk_CannelMobile" runat="server" CausesValidation="false" OnClick="lnk_Cannel_Click" Visible="False" CssClass="canvasLinkButtonFont" meta:resourcekey="lnk_CannelResource1">[取消]</asp:LinkButton>
                    <asp:LinkButton ID="lnk_SubmitMobile" runat="server" CausesValidation="false" OnClick="lnk_Submit_Click" Visible="False" CssClass="canvasLinkButtonFont" meta:resourcekey="lnk_SubmitResource1">[確定]</asp:LinkButton>
                </td>
            </tr>
            <tr id="trOperate" runat="server">
                <td runat="server">
                    <table>
                        <tr>
                            <td>
                                <asp:LinkButton ID="lbtnSignMobile" runat="server" Text="簽名操作" CssClass="canvasLinkButtonFont" CausesValidation="False" ForeColor="OliveDrab" meta:resourcekey="lbtnSignMobileResource1"></asp:LinkButton>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <img id="imgCanvasMobile" runat="server" class="mediaCanvas" />
                                &nbsp;</td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr id="trAlert" runat="server">
                <td runat="server">
                    <asp:Label ID="lblHasNoAuthorityMobile" runat="server" Text="無填寫權限" ForeColor="Red" Visible="False" meta:resourcekey="lblHasNoAuthorityResource1"></asp:Label>
                    <asp:Label ID="lblToolTipMsgMobile" runat="server" Text="不允許修改(唯讀)" Visible="False" meta:resourcekey="lblToolTipMsgResource1"></asp:Label>
                    <asp:Label ID="lblFillerMobile" CssClass="FillerVisible" runat="server" meta:resourcekey="lblFillerResource1"></asp:Label>
                    <asp:Label ID="lblModifierMobile" runat="server" Visible="False" meta:resourcekey="lblModifierResource1"></asp:Label>
                    <asp:Label ID="lblAuthorityMsgMobile" runat="server" Text="具填寫權限人員" Visible="False" meta:resourcekey="lblAuthorityMsgResource1"></asp:Label>
                    <asp:Label ID="lblShowWSMsgMobile" meta:resourcekey="lblShowWSMsgResource1" runat="server" Font-Bold="False" ForeColor="Red" Visible="False"></asp:Label>
                </td>
            </tr>
        </table>
        <asp:HiddenField ID="hdFieldGroupId" runat="server" />
        <asp:HiddenField ID="hdMobileUI" runat="server" />
        <asp:HiddenField ID="hdFirstLoad" runat="server" Value="false" />
        <asp:CustomValidator ID="CustomValidator1" runat="server" Display="Dynamic" ErrorMessage="請簽名" EnableTheming="True" meta:resourcekey="CustomValidator1Resource1"></asp:CustomValidator>
    </ContentTemplate>
</asp:UpdatePanel>
