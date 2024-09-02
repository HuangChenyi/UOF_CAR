<%@ Control Language="C#" AutoEventWireup="true" Inherits="WKF_FormManagement_VersionFieldUserControl_CheckBoxUC" CodeBehind="CheckBoxUC.ascx.cs" %>
<%@ Reference Control="~/WKF/FormManagement/VersionFieldUserControl/VersionFieldUC.ascx" %>

<style>
    wkfCbxList{
        white-space:normal;
    }

    
    .printSimpleLabel {
        display:none;
    }
    
    .fieldDisabled {
        opacity:0.5;
    }

</style>
<script type="text/javascript">

    Sys.Application.add_load(function () {
        cbOthers_Click_<%=cbOthers.ClientID%>();
    });

    //使用enable屬性會造成fieldvalue取值出現問題，為避免此一狀況
    //使用css及onclick事件來實現enabled的效果
    function SetCheckboxEnabled_<%=cbxList.ClientID%>(enabled) {
        var aryInput = $('input[id^="<%=cbxList.ClientID%>"][type="checkbox"]');
        var cbOthers = $("#<%=cbOthers.ClientID%>");
        if (enabled == "True") {
            for (var i = 0; i < aryInput.length; i++) {
                $(aryInput[i]).removeClass("fieldDisabled");
            }

            if (cbOthers) {
                cbOthers.removeClass("fieldDisabled");
            }
        }
        else {
            for (var i = 0; i < aryInput.length; i++) {
                $(aryInput[i]).addClass("fieldDisabled");
            }
            if (cbOthers) {
                cbOthers.addClass("fieldDisabled");
            }
        }
    }

    function cbList_Click_<%=cbxList.ClientID%>() {
        //如果有fieldDisabled這個class就擋掉
        var aryInput = $('input[id^="<%=cbxList.ClientID%>"][type="checkbox"].fieldDisabled');
        if (aryInput && aryInput.length > 0)
            return false;
    }

    function cbOthers_Click_<%=cbOthers.ClientID%>() {
        //如果有fieldDisabled這個class就擋掉
        var cbOthers = $("#<%=cbOthers.ClientID%>.fieldDisabled");
        if (cbOthers && cbOthers.length > 0)
            return false;

        //其他選項要把txt開出來
        var txtOthers = $("#<%=txtOthers.ClientID%>");
        if ($("#<%=cbOthers.ClientID%>")[0] && $("#<%=cbOthers.ClientID%>")[0].checked) {
            txtOthers.show();
        }
        else {
            txtOthers.hide();
        }
    }

   function CheckValidation_<%=CustomValidator1.ClientID%>(sender, args) {
        var aryInput = $('input[id^="<%=cbxList.ClientID%>"]');
        var status = false;
        var cbOthers = $("#<%=cbOthers.ClientID%>")[0];
        if (cbOthers)
            status = cbOthers.checked;

        for (var i = 0; i < aryInput.length; i++) {
            if ($(aryInput[i]).prop('checked')) {
                status = true;
                break;
            }
        }
        if (status == false) $("#<%=hyperlinkFocus1.ClientID%>").focus();
        args.IsValid = status;
    }

</script>

<%-- 為了避免designer錯誤，所以要與Mobile元件同步 --%>
<asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate></ContentTemplate>
</asp:UpdatePanel>
       
<table border="0" cellpadding="0" cellspacing="0" id="tbField" runat="server">
    <tr>
        <td nowrap>
            <table border="0" cellpadding="0" cellspacing="0">
                <tr>
                    <td nowrap>
                        <asp:LinkButton ID="lnk_Edit" runat="server" CausesValidation="false" OnClick="lnk_Edit_Click" Visible="False" meta:resourcekey="lnk_EditResource1">[修改]</asp:LinkButton>
                        <asp:LinkButton ID="lnk_Cannel" runat="server" CausesValidation="false" OnClick="lnk_Cannel_Click" Visible="False" meta:resourcekey="lnk_CannelResource1">[取消]</asp:LinkButton>
                        <asp:LinkButton ID="lnk_Submit" runat="server" CausesValidation="false" OnClick="lnk_Submit_Click" Visible="False" meta:resourcekey="lnk_SubmitResource1">[確定]</asp:LinkButton>
                    </td>
                    <td nowrap>
                        <table>
                            <tr id="trInvisible" runat="server">
                                <td>
                                    <asp:Label ID="lblInvisible" runat="server" Text="******"></asp:Label>
                                </td>
                            </tr>
                            <tr id="trField" runat="server">
                                <td>
                                    <div class="printFullOption">
                                        <asp:CheckBoxList ID="cbxList" runat="server" RepeatDirection="Horizontal" meta:resourcekey="cbxListResource1"></asp:CheckBoxList>
                                    </div>
                                    <asp:Label ID="lblHasNoAuthority" runat="server" ForeColor="Red" Text="無填寫權限"
                                        Visible="False" meta:resourcekey="lblHasNoAuthorityResource1"></asp:Label>
                                    <asp:Label ID="lblCbxList" class="wkfCbxList printSimpleLabel" runat="server" meta:resourcekey="lblCbxListResource1"></asp:Label>
                                    <asp:Label ID="lblOthers" class="printSimpleLabel" runat="server"></asp:Label>
                                    <asp:Label ID="lblMsgSigner" runat="server" Text="填寫者" Visible="false" meta:resourcekey="lblMsgSignerResource1"></asp:Label>
                                    <asp:Label ID="lblMsgEditor" runat="server" Text="修改者" Visible="False" meta:resourcekey="lblMsgEditorResource1"></asp:Label>
                                    <asp:HyperLink ID="hyperlinkFocus1" NavigateUrl="#" runat="server" />
                                </td>
                            </tr>
                            <tr id="trOthers" class="printFullOption" runat="server">
                                <td>
                                    <asp:CheckBox ID="cbOthers" runat="server" Text="其他" meta:resourcekey="cbOthersResource1" />
                                    <asp:TextBox ID="txtOthers" runat="server" Style="border-left: 1px solid #cdcdcd !important; border-right: 1px solid #cdcdcd !important; border-top: 1px solid #cdcdcd !important; border-bottom: 1px solid #cdcdcd !important"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:CustomValidator ID="CustomValidator1" runat="server"
                                        ErrorMessage="至少需要選擇一項"
                                        meta:resourcekey="CustomValidator1Resource1" Display="Dynamic"></asp:CustomValidator>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </td>
        <td nowrap>
            <asp:Label ID="lblFiller" CssClass="FillerVisible" runat="server" meta:resourcekey="lblFillerResource1"></asp:Label>
            <asp:Label ID="lblModifier" runat="server" Visible="false" meta:resourcekey="lblModifierResource1"></asp:Label>
            <asp:Label ID="lblAuthorityMsg" runat="server" Text="具填寫權限人員" Visible="False" meta:resourcekey="lblAuthorityMsgResource1"></asp:Label>
        </td>
    </tr>
</table>