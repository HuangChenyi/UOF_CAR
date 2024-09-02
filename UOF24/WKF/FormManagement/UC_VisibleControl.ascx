<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UC_VisibleControl.ascx.cs" Inherits="Ede.Uof.Web.WKF.FormManagement.UC_VisibleControl" %>
<%@ Register Src="~/Common/ChoiceCenter/UC_ChoiceList.ascx" TagPrefix="uc2" TagName="UC_ChoiceList" %>
<script type="text/javascript">

    Sys.Application.add_load(function () {
        <%=this.ClientID%>_OnRbNoLimitClick();
        <%=ClientID%>_OnCheckboxClick();
    });

    function <%=this.ClientID%>_OnRbNoLimitClick() {
        if ($("#<%=tdNormal.ClientID%>").is(':visible')) {
            var rbInherit = $('#<%=rbNoLimit.ClientID%>');
            var rbCustom = $('#<%=rbCustom.ClientID%>');
            var trVisible = $("#<%=trVisible.ClientID%>");
            if (rbInherit[0].checked) {
                trVisible.hide();
            }
            else if (rbCustom[0].checked) {
                trVisible.show();
            }
        }
    }

    function <%=ClientID%>_RequireValidateOtherPeople(sender, args) {
        if ($("#<%=tdNormal.ClientID%>").is(':visible')) {
            var rbCustom = $("#<%=rbCustom.ClientID%>");
            var chk_Filler = $("#<%=chk_Filler.ClientID%>");
            var chk_Other = $("#<%=chk_Other.ClientID%>");
            var choiceListJSON = $("#<%=Panel1.ClientID%> input[name*='hiddenJSON']").val();
            //只驗證允許修改
            if (rbCustom != null && rbCustom[0].checked) {
                //兩個都沒勾就擋掉
                if (!chk_Filler[0].checked && !chk_Other[0].checked) {
                    args.IsValid = false;
                }
                //勾了其他人員就必須選人
                if (chk_Other != null && chk_Other[0].checked && (choiceListJSON == "" || choiceListJSON == '{"UserSet":{}}')) {
                    args.IsValid = false;
                }
            }
        }
    }

    function  <%=ClientID%>_OnCheckboxClick() {

        if ($("#<%=this.chk_Other.ClientID%>").prop("checked")) {
            $("#<%=this.Panel1.ClientID%>").show();
        }
        else {
            $("#<%=this.Panel1.ClientID%>").hide();
        }
    }

</script>
<div>
    <table>
        <tr>
            <td id="tdNormal" runat="server">
                <asp:RadioButton ID="rbNoLimit" runat="server" Text="不限制" GroupName="VisibleLimit" Checked="True" meta:resourcekey="rbNoLimitResource1"></asp:RadioButton>
                <br />
                <asp:RadioButton ID="rbCustom" runat="server" Text="可觀看人員" GroupName="VisibleLimit" meta:resourcekey="rbCustomResource1"></asp:RadioButton>
                <div id="trVisible" runat="server" style="margin-left:10px">
                    <asp:CheckBox ID="chk_Filler" runat="server" Text="填寫者" meta:resourcekey="chk_FillerResource1" /><br />
                    <asp:CheckBox ID="chk_Other" runat="server" Text="其他人員" meta:resourcekey="chk_OtherResource1" /><br />
                    <asp:Panel ID="Panel1" runat="server" meta:resourcekey="Panel1Resource1">
                        <uc2:UC_ChoiceList runat="server" ID="UC_ChoiceList" ExpandToUser="false" ShowMember="true" />
                    </asp:Panel>
                </div>
                <asp:CustomValidator ID="CustomValidator1" runat="server" Display="Dynamic" ErrorMessage="請選擇人員" meta:resourcekey="CustomValidator1Resource1"></asp:CustomValidator>
            </td>
            <td id="tdFormula" runat="server" visible="false">
                <asp:Label ID="lblControlTip" runat="server" Text="*只要有計算公式中所有使用的數值欄位觀看權限者即可觀看，不需另外設定。" ForeColor="Blue" meta:resourcekey="lblControlTipResource1"></asp:Label>
                <br />
                <asp:Label ID="lblFormula" runat="server" Text="設定其他可觀看人員" meta:resourcekey="lblFormulaResource1"></asp:Label>
                <uc2:UC_ChoiceList runat="server" ID="UC_ChoiceListFormula" ExpandToUser="false" ShowMember="true" />
            </td>
        </tr>
    </table>
</div>
