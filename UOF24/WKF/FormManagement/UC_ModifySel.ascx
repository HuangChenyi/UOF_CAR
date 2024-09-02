<%@ Control Language="C#" AutoEventWireup="true" Inherits="WKF_FormManagement_UC_ModifySel" Codebehind="UC_ModifySel.ascx.cs" %>
<%@ Register src="../../Common/ChoiceCenter/UC_ChoiceList.ascx" tagname="UC_ChoiceList" tagprefix="uc1" %>

<style type="text/css">
    .style2
    {
        width: 200px;
    }
    
    .style1
    {
        width: 3px;
    }
</style>

<script type="text/javascript">
    function <%=ClientID%>_OnRblClick() {

        if ($("#<%=this.rb_yes_Modify.ClientID%>").prop("checked")) {
            $("#<%=this.Panel2.ClientID%>").show();
        }
        else {
            $("#<%=this.Panel2.ClientID%>").hide();
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

    function <%=ClientID%>_RequireValidateOtherPeople(sender, args) {
        var rb_yes_Modify = $("#<%=rb_yes_Modify.ClientID%>");
        var chk_Applicent = $("#<%=chk_Applicent.ClientID%>");
        var chk_Other = $("#<%=chk_Other.ClientID%>");
        var choiceListJSON = $("#<%=Panel1.ClientID%> input[name*='hiddenJSON']").val();
        //只驗證允許修改
        if (rb_yes_Modify[0].checked) {
            //兩個都沒勾就擋掉
            if (!chk_Applicent[0].checked && !chk_Other[0].checked) {
                args.IsValid = false;
            }
            //勾了其他人員就必須選人
            else if (chk_Other != null && chk_Other[0].checked && (choiceListJSON == "" || choiceListJSON == '{"UserSet":{"Element":[]}}')) {
                args.IsValid = false;
            }
        }
    }
</script>

<table border="0" width="100%">
    <tr>
        <td class="style2" valign="top" colspan="2">
                <asp:Panel ID="Panel3" runat="server" meta:resourcekey="Panel3Resource1">
                    <asp:RadioButton ID="rb_accede_Modify" runat="server" GroupName="rb_grp_modify" Text="繼承表單" meta:resourcekey="rb_accede_ModifyResource1" /><br />
                </asp:Panel>
                    <asp:RadioButton ID="rb_no_Modify" runat="server" GroupName="rb_grp_modify" Text="不允許修改" meta:resourcekey="rb_no_ModifyResource1" /><br />
                    <asp:RadioButton ID="rb_yes_Modify" runat="server" GroupName="rb_grp_modify" Text="允許修改" meta:resourcekey="rb_yes_ModifyResource1" />
        </td>
    </tr>
    <tr>
        <td class="style1">&nbsp;</td>
        <td valign="top">
                <asp:Panel ID="Panel2" runat="server" meta:resourcekey="Panel2Resource1">
                    <asp:CheckBox ID="chk_Applicent" runat="server" Text="填寫者" meta:resourcekey="chk_ApplicentResource1" /><br />
                    <asp:CheckBox ID="chk_Other" runat="server" Text="其他人員" meta:resourcekey="chk_OtherResource1" /><br />
                    <asp:Panel ID="Panel1" runat="server" meta:resourcekey="Panel1Resource1">
                        <uc1:UC_ChoiceList ID="UC_ChoiceList1" runat="server" ExpandToUser="false" 
                            TreeHeight="55px" ShowMember="true" /></asp:Panel>
                </asp:Panel>
                <asp:CustomValidator ID="CustomValidator1" runat="server" Display="Dynamic" ErrorMessage="請選擇可修改人員" meta:resourcekey="CustomValidator1Resource1"></asp:CustomValidator>
        </td>
    </tr>
</table>

<asp:Label ID="lblDetailColumnMsg" runat="server" Text="繼承明細欄位" meta:resourcekey="lblDetailColumnMsgResource1" Visible="False"></asp:Label>
<asp:Label ID="lblInheritField" runat="server" Text="繼承欄位設定" Visible="false" meta:resourcekey="lblInheritFieldResource1"></asp:Label>