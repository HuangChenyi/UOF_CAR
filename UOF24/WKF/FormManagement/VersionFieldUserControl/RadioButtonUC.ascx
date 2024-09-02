<%@ Control Language="C#" AutoEventWireup="true" Inherits="WKF_FormManagement_VersionFieldUserControl_RadioButtonUC" CodeBehind="RadioButtonUC.ascx.cs" %>
<%@ Reference Control="~/WKF/FormManagement/VersionFieldUserControl/VersionFieldUC.ascx" %>

<style>
    .printSimpleLabel {
        display: none;
    }
    
    .fieldDisabled {
        opacity:0.5;
    }

</style>

<script type="text/javascript">
    Sys.Application.add_load(
        function () {
            SetDefault_<%=rbOthers.ClientID%>();
    });

    function SetDefault_<%=rbOthers.ClientID%>() {
        var rbList = $("#<%=rbList.ClientID%> input[type='radio']");
        var txtOthers = $("#<%=txtOthers.ClientID%>");
        var rbOthers = $("#<%=rbOthers.ClientID%>");
        var otherCheck = rbOthers.is(":checked");

        if (otherCheck) {
            rbList.each(function () {
                $(this).prop("checked", false);
            });
            txtOthers.show();
        }
        else {
            rbOthers.prop("checked", false);
            txtOthers.hide();
        }
    }

    function SetRadioButtonEnabled_<%=rbList.ClientID%>(enabled) {
        var aryInput = $('input[id^="<%=rbList.ClientID%>"][type="radio"]');
        var rbOthers = $("#<%=rbOthers.ClientID%>");
        if (enabled == "True") {
            for (var i = 0; i < aryInput.length; i++) {
                $(aryInput[i]).removeClass("fieldDisabled");
            }

            if (rbOthers) {
                rbOthers.removeClass("fieldDisabled");
            }
        }
        else {
            for (var i = 0; i < aryInput.length; i++) {
                $(aryInput[i]).addClass("fieldDisabled");
            }
            if (rbOthers) {
                rbOthers.addClass("fieldDisabled");
            }
        }
    }
   
    function rbOthers_Click_<%=rbOthers.ClientID%>() {
        
        //如果有fieldDisabled這個class就擋掉
        var rbOthers = $("#<%=rbOthers.ClientID%>.fieldDisabled");
        if (rbOthers && rbOthers.length > 0)
            return false;

        var txtOthers = $("#<%=txtOthers.ClientID%>");
        var rbList = $("#<%=rbList.ClientID%> input[type='radio']");
        var rbDisabled = rbList.prop('disabled');

        if (!rbDisabled) {
            rbList.each(function () {
                $(this).prop("checked", false);
            });

            txtOthers.show();
        }
        else {
            txtOthers.hide();
        }
    }

    function rbList_Click_<%=rbList.ClientID%>() {
        //如果有fieldDisabled這個class就擋掉
        var aryInput = $('input[id^="<%=rbList.ClientID%>"][type="radio"].fieldDisabled');
        if (aryInput && aryInput.length > 0)
            return false;

        var rbOthers = $("#<%=rbOthers.ClientID%>");
        var txtOthers = $("#<%=txtOthers.ClientID%>");
        var rbDisabled = rbOthers.prop('disabled');

        if (!rbDisabled) {
            rbOthers.prop("checked", false);
            txtOthers.hide();
        }
        else {
            txtOthers.show();
        }
    }

    function CheckFieldEmpty_<%=CustomValidator1.ClientID%>(sender, args) {
        var rbList = $("#<%=rbList.ClientID%> input[type='radio']");
        var rbOthers = $("#<%=rbOthers.ClientID%>");
        var otherCheck = rbOthers.is(":checked");
        var isValid = false;

        //先檢查其他
        if (otherCheck) {
            isValid = true;
        }
        else {
            //其他沒勾選再一個個檢查list
            rbList.each(function () {
                if ($(this).is(":checked")) {
                    isValid = true;
                }
            });
        }
        args.IsValid = isValid;

        if (!isValid) {
            $("#<%=hyperlinkFocus1.ClientID%>").focus();
        }
    }
</script>

<%-- 為了避免designer錯誤，所以要與Mobile元件同步 --%>
<asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate></ContentTemplate>
</asp:UpdatePanel>

<table border="0" cellpadding="0" cellspacing="0">
    <tr>
        <td>
            <table border="0" cellpadding="0" cellspacing="0">
                <tr>
                    <td id="tdInvisible" runat="server">
                        <asp:Label ID="lblInvisible" runat="server" Text="******"></asp:Label>
                    </td>
                    <td nowrap>
                        <asp:LinkButton ID="lnk_Edit" runat="server" CausesValidation="false" OnClick="lnk_Edit_Click" Visible="False" meta:resourcekey="lnk_EditResource1">[修改]</asp:LinkButton>
                        <asp:LinkButton ID="lnk_Cancel" runat="server" CausesValidation="false" OnClick="lnk_Cancel_Click" Visible="False" meta:resourcekey="lnk_CannelResource1">[取消]</asp:LinkButton>
                        <asp:LinkButton ID="lnk_Submit" runat="server" CausesValidation="false" OnClick="lnk_Submit_Click" Visible="False" meta:resourcekey="lnk_SubmitResource1">[確定]</asp:LinkButton>
                    </td>
                    <td>
                        <table>
                            <tr id="trField" runat="server">
                                <td>
                                    <div class="printFullOption" >
                                    <asp:RadioButtonList ID="rbList" runat="server" RepeatDirection="Horizontal" meta:resourcekey="rbListResource1"></asp:RadioButtonList>
                                        </div>
                                    <asp:Label ID="lblList" class="printSimpleLabel" runat="server" meta:resourcekey="lblListResource1"></asp:Label>
                                    <asp:Label ID="lblOthers" class="printSimpleLabel" runat="server"></asp:Label>
                                    <asp:HyperLink ID="hyperlinkFocus1" NavigateUrl="#" runat="server" />
                                </td>
                            </tr>
                            <tr id="trOthers" class="printFullOption"  runat="server">
                                <td>
                                    <asp:RadioButton ID="rbOthers" runat="server" Text="其他" meta:resourcekey="rbOthersResource1" />
                                    <asp:TextBox ID="txtOthers" runat="server" Style="border-left: 1px solid #cdcdcd !important; border-right: 1px solid #cdcdcd !important; border-top: 1px solid #cdcdcd !important; border-bottom: 1px solid #cdcdcd !important"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:CustomValidator ID="CustomValidator1" runat="server" Display="Dynamic" ErrorMessage="不允許空白"
                                        SetFocusOnError="true" ForeColor="Red" ClientValidationFunction="CheckFieldEmpty"
                                        Visible="false" meta:resourcekey="CustomValidator1Resource1">
                                    </asp:CustomValidator>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </td>
        <td>
            <asp:Label ID="lblHasNoAuthority" runat="server" ForeColor="Red" Text="無填寫權限" Visible="False" meta:resourcekey="lblHasNoAuthorityResource1"></asp:Label>
            <asp:Label ID="lblFiller" CssClass="FillerVisible" runat="server" meta:resourcekey="lblFillerResource1"></asp:Label>
            <asp:Label ID="lblModifier" runat="server" Visible="False" meta:resourcekey="lblModifierResource1"></asp:Label>
            <asp:Label ID="lblMsgSigner" runat="server" Text="填寫者" Visible="False" meta:resourcekey="lblMsgSignerResource1"></asp:Label>
            <asp:Label ID="lblMsgEditor" runat="server" Text="修改者" Visible="False" meta:resourcekey="lblMsgEditorResource1"></asp:Label>
            <asp:Label ID="lblAuthorityMsg" runat="server" Text="具填寫權限人員" Visible="False" meta:resourcekey="lblAuthorityMsgResource1"></asp:Label>
        </td>
    </tr>
</table>
