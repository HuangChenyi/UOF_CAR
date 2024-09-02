<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="HtmlEditorUC.ascx.cs" Inherits="WKF_FormManagement_VersionFieldUserControl_HtmlEditorUC" %>
<%@ Reference Control="~/WKF/FormManagement/VersionFieldUserControl/VersionFieldUC.ascx" %>
<%@ Register Src="~/Common/HtmlEditor/UC_HtmlEditor.ascx" TagPrefix="uc1" TagName="UC_HtmlEditor" %>


<script type="text/javascript">
    function CheckContentEmpty_<%=this.VersionField.FieldID%>(e, args) {
        
        var editor1 = $find("<%=RadEditor1.ClientID%>");

        if (editor1 === null) {

            var content = $("#<%=RadEditor1.ClientID%> > div:first-child").text();

             if (content === "") {
                 args.IsValid = false;
             }
             else {
                 args.IsValid = true;
             }
        }
        else {
                //處理空白，跳行，undefined..等狀況，特別處理零寬長度空間，因組在一起無效
                var content = editor1.get_content().replace(/(\&nbsp;|\<p>|\<\/p>|\undefined|\s*)/g, "").replace(/\u200B/g, "");

                if (content.length === 0) {
                    args.IsValid = false;
                }
                else { args.IsValid = true; }
        }
        if (!args.IsValid) {
            $("#<%=hyperlinkFocus1.ClientID%>").focus();
        }
    }
</script>

<asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>
        <table border="0" cellpadding="0" cellspacing="0" style="width: 99%" id="tbField" runat="server">
            <tr id="trInvisible" runat="server">
                <td>
                    <asp:Label ID="lblInvisible" runat="server" Text="******"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:LinkButton ID="lnk_Edit" CausesValidation="false" runat="server" OnClick="lnk_Edit_Click" Visible="False" meta:resourcekey="lnk_EditResource1">[修改]</asp:LinkButton>
                    <asp:LinkButton ID="lnk_Cannel" CausesValidation="false" runat="server" OnClick="lnk_Cannel_Click" Visible="False" meta:resourcekey="lnk_CannelResource1">[取消]</asp:LinkButton>
                    <asp:LinkButton ID="lnk_Submit" CausesValidation="false" runat="server" OnClick="lnk_Submit_Click" Visible="False" meta:resourcekey="lnk_SubmitResource1">[確定]</asp:LinkButton>
                </td>
            </tr>
            <tr id="trVisible" runat="server">
                <td style="word-break: break-all; white-space: normal">
                    <div>
                        <asp:Label ID="lblNotSupport" runat="server" Text="此欄位不允許在App編輯" ForeColor="Blue" Visible="False" CssClass="SizeMemo" meta:resourcekey="lblNotSupportResource1"></asp:Label>
                    </div>
                    <div>
                        <asp:Panel ID="Panel1" runat="server" ScrollBars="Auto" Visible="False" CssClass="JustAddBorder" meta:resourcekey="Panel1Resource1">
                            <asp:Label ID="lblHtml" runat="server" Visible="False" CssClass="editorcontentstyle JustAddBorder" meta:resourcekey="lblDropDownResource1"></asp:Label>
                        </asp:Panel>
                    </div>
                    <div>
                        <asp:TextBox ID="txtEditor" runat="server" Width="98%" TextMode="MultiLine" Height="300px" meta:resourcekey="txtEditorResource1"></asp:TextBox>
                        <uc1:UC_HtmlEditor runat="server" ID="RadEditor1" Width="98%" ModuleName="WKF" EnableTheming="true" />
                        <asp:HyperLink id="hyperlinkFocus1" NavigateUrl="#" runat="server"/>
                    </div>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:Label ID="lblAgentDelete" runat="server" ForeColor="Blue" Text="選取的代理人已不存在於代理人設定中!" Visible="False" meta:resourcekey="lblAgentDeleteResource1"></asp:Label>
                    <asp:CustomValidator ID="CustomValidator1" runat="server" ErrorMessage="不允許空白" Display="Dynamic" ForeColor="Red" EnableTheming="true" Visible="false" meta:resourcekey="CustomValidator1Resource1"></asp:CustomValidator>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtEditor" ErrorMessage="不允許空白" ForeColor="Red" Visible="False" Display="Dynamic" SetFocusOnError="True" meta:resourcekey="RequiredFieldValidator2Resource1"></asp:RequiredFieldValidator>
                    <asp:Label ID="lblHasNoAuthority" runat="server" ForeColor="Red" Text="無填寫權限" Visible="False" meta:resourcekey="lblHasNoAuthorityResource1"></asp:Label>
                    <asp:Label ID="lblFiller" CssClass="FillerVisible" runat="server" meta:resourcekey="lblFillerResource1"></asp:Label>
                    <asp:Label ID="lblModifier" runat="server" Visible="False" meta:resourcekey="lblModifierResource1"></asp:Label>
                    <asp:Label ID="lblMsgSigner" runat="server" Text="填寫者" Visible="False" meta:resourcekey="lblMsgSignerResource1"></asp:Label>
                    <asp:Label ID="lblMsgEditor" runat="server" Text="修改者" Visible="False" meta:resourcekey="lblMsgEditorResource1"></asp:Label>
                    <asp:Label ID="lblAuthorityMsg" runat="server" Text="具填寫權限人員" Visible="False" meta:resourcekey="lblAuthorityMsgResource1"></asp:Label>
                    <asp:Label ID="lblField" runat="server" Text="外部資料訊息:" Visible="False" meta:resourcekey="lblFieldResource1" Font-Bold="False" ForeColor="Red"></asp:Label>
                    <asp:Label ID="lblShowWSMsg" meta:resourcekey="lblShowWSMsgResource1" runat="server" Font-Bold="False" ForeColor="Red" Visible="False"></asp:Label>
                    <asp:Label ID="lblWebServiceMsg" runat="server" Text="資料格式錯誤" meta:resourcekey="lblWebServiceMsgResource1" Visible="False" Font-Bold="False" ForeColor="Red"></asp:Label>
                    <asp:Label ID="lblotherMSG" runat="server" ForeColor="Red" Text="呼叫外部資料時發生錯誤" Visible="False" meta:resourcekey="lblotherMSGResource1"></asp:Label>
                    <asp:Label ID="lbl_WriteMsg" runat="server" Text="─暫不填寫─" Visible="False" meta:resourcekey="lbl_WriteMsgResource1"></asp:Label>
                    <asp:HiddenField ID="tbx_value" runat="server" />
                    <asp:HiddenField ID="tbx_Text" runat="server" />
                </td>
            </tr>
        </table>
    </ContentTemplate>
</asp:UpdatePanel>
