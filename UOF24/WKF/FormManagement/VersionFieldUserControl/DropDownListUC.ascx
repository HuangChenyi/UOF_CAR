<%@ Control Language="C#" AutoEventWireup="true" Inherits="WKF_FormManagement_VersionFieldUserControl_DropDownListUC" Codebehind="DropDownListUC.ascx.cs" %>
<%@ Reference Control="~/WKF/FormManagement/VersionFieldUserControl/VersionFieldUC.ascx" %>




<script type="text/javascript">
    
    function <%=getFuncName%>(method)
     {
        if (method == "View")
        {
           return "<%=this.tbx_value.ClientID%>";
        }
        else
        {
            return "<%=this.DropDownList1.ClientID%>";
        }
      }
</script>

<%-- 為了避免designer錯誤，所以要與Mobile元件同步 --%>
<asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>

<table border="0" cellpadding="0" cellspacing="0" id="tbField" runat="server">
    <tr>
        <td nowrap>
            <table border="0" cellpadding="0" cellspacing="0">
                <tr>
                    <td id="tdInvisible" runat="server">
                    <asp:Label ID="lblInvisible" runat="server" Text="******"></asp:Label>
                </td>
                    <td>
                        <asp:LinkButton ID="lnk_Edit" runat="server" CausesValidation="false" OnClick="lnk_Edit_Click" Visible="False" meta:resourcekey="lnk_EditResource1">[修改]</asp:LinkButton>
                        <asp:LinkButton ID="lnk_Cannel" runat="server" CausesValidation="false" OnClick="lnk_Cannel_Click" Visible="False" meta:resourcekey="lnk_CannelResource1">[取消]</asp:LinkButton>
                        <asp:LinkButton ID="lnk_Submit" runat="server" CausesValidation="false" OnClick="lnk_Submit_Click" Visible="False" meta:resourcekey="lnk_SubmitResource1">[確定]</asp:LinkButton>
                    </td>
                    <td id="tdVisible" runat="server">
                        <asp:DropDownList ID="DropDownList1" runat="server" meta:resourcekey="DropDownList1Resource1" AppendDataBoundItems="True"></asp:DropDownList>
                        <asp:Label ID="lblDropDown" runat="server" Visible="False" meta:resourcekey="lblDropDownResource1"></asp:Label>
                        <asp:HyperLink id="hyperlinkFocus1" NavigateUrl="#" runat="server"/>
                    </td>
                </tr>
            </table>
        </td>
        <td>
            <div id="divWS" runat="server">
                <asp:Button ID="Button1" runat="server" meta:resourcekey="Button1Resource1" OnClick="Button1_Click" Text="取得值" Visible="False" CausesValidation="False" />
                <asp:CustomValidator ID="CustomValidator1" runat="server" Display="Dynamic" ErrorMessage="請選擇項目" 
                    meta:resourcekey="CustomValidator1Resource1">
                </asp:CustomValidator>
            </div>
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
            <asp:Label ID="lbl_WriteMsg" runat="server" Text="─請選擇─" Visible="False" meta:resourcekey="lbl_WriteMsgResource1"></asp:Label>
            <asp:HiddenField ID="tbx_value" runat="server" />
            <asp:HiddenField ID="tbx_Text" runat="server" />
        </td>
    </tr>
</table>
</ContentTemplate>
</asp:UpdatePanel>
