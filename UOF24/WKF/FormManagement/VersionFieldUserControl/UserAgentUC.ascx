<%@ Control Language="C#" AutoEventWireup="true" Inherits="WKF_FormManagement_VersionFieldUserControl_UserAgentUC" CodeBehind="UserAgentUC.ascx.cs" %>
<%@ Reference Control="~/WKF/FormManagement/VersionFieldUserControl/VersionFieldUC.ascx" %>

<script type="text/javascript">
    function DropDownOnChange_<%=DropDownList1.ClientID%>() {
        var tbx_value = $("#<%=this.tbx_value.ClientID%>");
        var tbx_text = $("#<%=this.tbx_Text.ClientID%>");
        var obj = $("#<%=this.DropDownList1.ClientID%> option:selected");
        tbx_value.val(obj.val());
        tbx_text.val(obj.text());
    }

    function DropDownOnCheck_<%=DropDownList1.ClientID%>(e, args) {

        if ($("#<%=lblDropDown.ClientID%>").is(':visible')) {
            args.IsValid = true;
        }
        else {
            if ($("#<%=DropDownList1.ClientID%>").val() == "###***$$$") {
                args.IsValid = false;
                $("#<%=hyperlinkFocus1.ClientID%>").focus();
                $("#<%=lblAgentDelete.ClientID%>").hide();
                $("#<%=lblAgentEnableDelete.ClientID%>").hide();
                $("#<%=lblAgentDisableDelete.ClientID%>").hide();
            }
            else {
                args.IsValid = true;
            }
        }
    }

    function CheckEnableAgent_<%=lblAgentEnableDelete.ClientID%>(source, args) {
        
        if ($("#<%=lblAgentEnableDelete.ClientID%>").is(':visible')) {
            args.IsValid = false;
        }
        else {
            args.IsValid = true;
        }
    }

        function CheckEnableAgent_<%=lblAgentDisableDelete.ClientID%>(source, args) {

        if ($("#<%=lblAgentDisableDelete.ClientID%>").is(':visible')) {
            args.IsValid = false;
        }
        else {
            args.IsValid = true;
        }
    }

</script>

<%-- 為了避免designer錯誤，所以要與Mobile元件同步 --%>
<asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate></ContentTemplate>
</asp:UpdatePanel>

<table border="0" cellpadding="0" cellspacing="0">
    <tr>
        <td nowrap>
            <table border="0" cellpadding="0" cellspacing="0" id="tbField" runat="server">
                <tr>
                    <td>
                        <asp:LinkButton ID="lnk_Edit" CausesValidation="false" runat="server" OnClick="lnk_Edit_Click" Visible="False" meta:resourcekey="lnk_EditResource1" Text="[修改]"></asp:LinkButton>
                        <asp:LinkButton ID="lnk_Cannel" CausesValidation="false" runat="server" OnClick="lnk_Cannel_Click" Visible="False" meta:resourcekey="lnk_CannelResource1" Text="[取消]"></asp:LinkButton>
                        <asp:LinkButton ID="lnk_Submit" CausesValidation="false" runat="server" OnClick="lnk_Submit_Click" Visible="False" meta:resourcekey="lnk_SubmitResource1" Text="[確定]"></asp:LinkButton>
                    </td>
                    <td id="tdInvisible" runat="server">
                        <asp:Label ID="lblInvisible" runat="server" Text="******"></asp:Label>
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
            <asp:Label ID="lblAgentEnableDelete" runat="server" ForeColor="Blue" Text="選取的代理人已不存在於代理人設定中，需重選代理人" Visible="False" meta:resourcekey="lblAgentEnableDeleteResource1"></asp:Label>
            <asp:Label ID="lblAgentDisableDelete" runat="server" ForeColor="Red" Text="選取的代理人已不存在於代理人設定中，需重選代理人" Visible="False" meta:resourcekey="lblAgentDisableDeleteResource1"></asp:Label>  
            <asp:Label ID="lblAgentDelete" runat="server" ForeColor="Blue" Text="選取的代理人已不存在於代理人設定中，需重選代理人" Visible="False" meta:resourcekey="lblAgentDeleteResource1"></asp:Label>
            <asp:CustomValidator ID="CustomValidator1" runat="server" Display="Dynamic" ErrorMessage="請選擇項目" 
                ForeColor="Red" meta:resourcekey="CustomValidator1Resource1">
            </asp:CustomValidator>
            <asp:CustomValidator ID="CustomValidator2" runat="server" Display="Dynamic"></asp:CustomValidator>
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
            <asp:HiddenField ID="hfAgentFieldValue" Value="" runat="server" />
        </td>
    </tr>
</table>
