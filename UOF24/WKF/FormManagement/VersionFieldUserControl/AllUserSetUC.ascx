<%@ Control Language="C#" AutoEventWireup="true" Inherits="WKF_FormManagement_VersionFieldUserControl_AllUserSetUC" CodeBehind="AllUserSetUC.ascx.cs" %>
<%@ Register Src="../../../Common/ChoiceCenter/UC_ChoiceList.ascx" TagName="UC_ChoiceList" TagPrefix="uc2" %>
<%@ Reference Control="~/WKF/FormManagement/VersionFieldUserControl/VersionFieldUC.ascx" %>
<%@ Register Src="~/Common/ChoiceCenter/UC_ChoiceListMobile.ascx" TagPrefix="uc3" TagName="UC_ChoiceListMobile" %>

<%-- 為了避免designer錯誤，所以要與Mobile元件同步 --%>
<asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate></ContentTemplate>
</asp:UpdatePanel>
<script type="text/javascript">
    function cvExcludeApplicant_<%=UC_ChoiceList1.ClientID%>(e, arg) {
        var choicelist = $('#<%=UC_ChoiceList1.ClientID%>' + '_hiddenJSON').val();
        var applicantGuid = $('#<%=hfApplicantGuid.ClientID%>').val();
        var realValue = $("#<%=hfRealValue.ClientID%>").val();
        var data = [choicelist, '', realValue, applicantGuid];
        var result= $uof.pageMethod.syncUc('WKF/FormManagement/VersionFieldUserControl/AllUserSetUC.ascx', 'IsIncludeApplicant', data, function (response) {});
        if (result == "True") {
            arg.IsValid = false;
            $('#<%=hyperlinkFocus1.ClientID%>').focus();
        }
        else {
            arg.IsValid = true;

        }
    }
</script>
<table cellpadding="0" cellspacing="0" border="0">
    <tr>
        <td>
            <asp:LinkButton ID="lnk_Edit" runat="server" CausesValidation="false" OnClick="lnk_Edit_Click" Visible="False" meta:resourcekey="lnk_EditResource1" Text="[修改]"></asp:LinkButton>
            <asp:LinkButton ID="lnk_Cannel" runat="server" CausesValidation="false" OnClick="lnk_Cannel_Click" Visible="False" meta:resourcekey="lnk_CannelResource1" Text="[取消]"></asp:LinkButton>
            <asp:LinkButton ID="lnk_Submit" runat="server" CausesValidation="false" OnClick="lnk_Submit_Click" Visible="False" meta:resourcekey="lnk_SubmitResource1" Text="[確定]"></asp:LinkButton>
            <asp:Image ID="imgAllUser" runat="server" meta:resourcekey="imgAllUserResource1" />
            <span id="SpanValue" runat="server">
                <asp:Label ID="lblAllUserValue" runat="server" meta:resourcekey="lblAllUserValueResource1"></asp:Label>
            </span>
        </td>
        <td>
            <asp:Label ID="lblAllPeople" runat="server" meta:resourcekey="lblAllPeopleResource1" Text="所有人員" Visible="False"></asp:Label>
            <asp:Label ID="lblAllDep" runat="server" meta:resourcekey="lblAllDepResource1" Text="所有部門" Visible="False"></asp:Label>
            <asp:Label ID="lblAllFunc" runat="server" meta:resourcekey="lblAllFuncResource1" Text="所有職務" Visible="False"></asp:Label>
            <asp:Label ID="lblAllRank" runat="server" meta:resourcekey="lblAllRankResource1" Text="所有職級" Visible="False"></asp:Label>
            <asp:Label ID="lblAllMember" runat="server" meta:resourcekey="lblAllMemberResource1" Text="所有會員" Visible="false"></asp:Label>
            <asp:Label ID="lblMsgSigner" runat="server" Text="填寫者" Visible="False" meta:resourcekey="lblMsgSignerResource1"></asp:Label>
            <asp:Label ID="lblMsgEditor" runat="server" Text="修改者" Visible="False" meta:resourcekey="lblMsgEditorResource1"></asp:Label>
            <asp:Label ID="lblHasNoAuthority" runat="server" ForeColor="Red" Text="無填寫權限" Visible="False" meta:resourcekey="lblHasNoAuthorityResource1"></asp:Label>
            <asp:Label ID="lblAuthorityMsg" runat="server" Text="具填寫權限人員" Visible="False" meta:resourcekey="lblAuthorityMsgResource1"></asp:Label>
        </td>
    </tr>
    <tr>
        <td id="tdInvisible" runat="server" colspan="2">
            <asp:Label id="lblInvisible" runat="server" Text="******"></asp:Label>
        </td>
        <td colspan="2">
            <div style="display: none">
                <uc3:UC_ChoiceListMobile runat="server" ID="UC_ChoiceListMobile" />
            </div>
            <uc2:UC_ChoiceList ID="UC_ChoiceList1" runat="server" ShowMember="False" />
            <asp:Label ID="lblFiller" CssClass="FillerVisible" runat="server" meta:resourcekey="lblFillerResource1"></asp:Label>
            <asp:Label ID="lblModifier" runat="server" Visible="False" meta:resourcekey="lblModifierResource1"></asp:Label>
            <asp:HyperLink id="hyperlinkFocus1" NavigateUrl="#" runat="server"/>
            <asp:CustomValidator ID="CustomValidator1" runat="server" ErrorMessage="不允許空白"
                meta:resourcekey="CustomValidator1Resource1" SetFocusOnError="True" Visible="False" Display="Dynamic">
            </asp:CustomValidator>
            <asp:CustomValidator ID="cvCheckExcludeAppliant" runat="server" ErrorMessage="不允許選擇申請者" SetFocusOnError="true"
                Display="Dynamic" meta:resourcekey="cvCheckExcludeAppliantResource1" >
            </asp:CustomValidator>
        </td>
    </tr>
</table>
<span style="display: none">
    <asp:Label ID="lblRealValue" runat="server" meta:resourcekey="lblRealValueResource1"></asp:Label></span>
<asp:Label ID="lblChooseDept" runat="server" Visible="False" Text="選取部門" meta:resourcekey="lblChooseDeptResource1"></asp:Label>
<asp:Label ID="lblChoosePeople" runat="server" Visible="False" Text="選取人員" meta:resourcekey="lblChoosePeopleResource1"></asp:Label>
<asp:Label ID="lblChooseFunction" runat="server" Visible="False" Text="選取職務" meta:resourcekey="lblChooseFunctionResource1"></asp:Label>
<asp:Label ID="lblChooseRank" runat="server" Visible="False" Text="選取職級" meta:resourcekey="lblChooseRankResource1"></asp:Label>
<asp:Label ID="lblChooseMember" runat="server" Visible="False" Text="選取會員" meta:resourcekey="lblChooseMemberResource1"></asp:Label>
<asp:Label ID="lblChooseMemberGroup" runat="server" Visible="False" Text="選取群組" meta:resourcekey="lblChooseMemberGroupResource1"></asp:Label>
<asp:HiddenField ID="hfApplicantGuid" runat="server" />
<asp:HiddenField ID="hfRealValue" runat="server"/>