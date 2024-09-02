<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="LeaveCancelInfoUC.ascx.cs" Inherits="Ede.Uof.Web.EIP.Duty.WKFOptionalFields104.LeaveCancelInfoUC" %>
<%@ Reference Control="~/WKF/FormManagement/VersionFieldUserControl/VersionFieldUC.ascx" %>
<%@ Register Src="~/Common/ChoiceCenter/UC_ChoiceList.ascx" TagPrefix="uc1" TagName="UC_ChoiceList" %>
<%@ Register Src="~/Common/ChoiceCenter/UC_ChoiceListMobile.ascx" TagPrefix="uc2" TagName="UC_ChoiceListMobile" %>

<script type="text/javascript">

    function CheckDeleteLeaveData_<%=ClientID%>(source, args) {
        var askId = $("#<%=lblAskId.ClientID %>").text(); //表單代碼
        var applicantEmployeeNo = $("#<%=hfApplicantEmployeeNo.ClientID%>").val();
        var applicantCompanyUnifiedId = $("#<%=hfApplicantCompanyUnifiedId.ClientID%>").val();
        var rddlLeaveTime = $find('<%=rddlLeaveTime.ClientID %>');

        if (applicantEmployeeNo === '' || applicantCompanyUnifiedId === '') {          
            return;
        }

        if (askId === '') {
            source.textContent = $('#<%=lblErrorLeaveNbr.ClientID%>').text();
            args.IsValid = false;
            return;
        }

        if ($("#<%=hfAllowModify.ClientID%>").val() === 'true' &&
            rddlLeaveTime != null &&
            (rddlLeaveTime.get_selectedItem().get_value() === '' || rddlLeaveTime.get_selectedItem().get_value() == null)) {

            source.textContent = $('#<%=lblErrorLeaveNbr.ClientID%>').text();
            args.IsValid = false;
            return;
        }

        var data = [askId];
        var errormsg = $uof.pageMethod.syncUc("EIP/Duty/WKFOptionalFields104/LeaveCancelInfoUC.ascx", "CheckDeleteLeaveData", data);
        if (errormsg !== '') {
            source.textContent = errormsg;
            args.IsValid = false;
            return;
        }
    }

    function ValidateMissingInfo_<%=ClientID%>(source, arguments) {
        var applicantEmployeeNo = $("#<%=hfApplicantEmployeeNo.ClientID%>").val();
        var applicantCompanyUnifiedId = $("#<%=hfApplicantCompanyUnifiedId.ClientID%>").val();

        if (applicantEmployeeNo === '' || applicantCompanyUnifiedId === '') {
            arguments.IsValid = false;
            return;
        }
    }

</script>
<asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>
        <table width="500px">
            <tr>
                <td>
                    <table class="PopTable" cellspacing="0" width="100%">
                        <tr>
                            <td class="PopTableLeftTD" style="width: 120px; white-space: nowrap;">
                                <asp:Label ID="Label1" runat="server" Text="請假時間" meta:resourcekey="Label1Resource1"></asp:Label>
                            </td>
                            <td class="PopTableRightTD">
                                <telerik:RadDropDownList ID="rddlLeaveTime" runat="server"
                                    AutoPostBack="True" CausesValidation="False"
                                    OnSelectedIndexChanged="ddlLeaveNbr_SelectedIndexChanged" meta:resourcekey="rddlLeaveTimeResource1">
                                </telerik:RadDropDownList>
                                <asp:Label ID="lblLeaveTime" runat="server" Visible="False" meta:resourcekey="lblLeaveTimeResource1"></asp:Label>
                                <asp:Label ID="lblAskId" runat="server" style="display:none" meta:resourcekey="lblAskIdResource1"></asp:Label>
                            </td>
                        </tr>

                        <tr>
                            <td class="PopTableLeftTD" style="width: 120px; white-space: nowrap;">
                                <asp:Label ID="Label2" runat="server" Text="假別" meta:resourcekey="Label2Resource1"></asp:Label>
                            </td>
                            <td class="PopTableRightTD">
                                <asp:Label ID="lblLeaCode" runat="server" meta:resourcekey="lblLeaCodeResource1"></asp:Label>
                                <asp:HiddenField ID="hfLeaCode" runat="server" />
                            </td>
                        </tr>

                        <tr>
                            <td class="PopTableLeftTD" style="width: 120px; white-space: nowrap;">
                                <asp:Label ID="Label5" runat="server" Text="請假時(天)數" meta:resourcekey="Label5Resource1"></asp:Label>
                            </td>
                            <td class="PopTableRightTD">
                                <asp:Label ID="lblLeatime" runat="server" meta:resourcekey="lblLeatimeResource1"></asp:Label>
                                <asp:HiddenField ID="hfUnit" runat="server" />
                                <asp:HiddenField ID="hfDays" runat="server" Value="0" />
                                <asp:HiddenField ID="hfHours" runat="server" Value="0" />
                                <asp:Label ID="lblDay" runat="server" Text="天" Visible="False" meta:resourcekey="lblDayResource1"></asp:Label>
                                <asp:Label ID="lblHour" runat="server" Text="小時" Visible="False" meta:resourcekey="lblHourResource1"></asp:Label>
                                <asp:Label ID="lblMin" runat="server" Text="分" Visible="False" meta:resourcekey="lblMinResource1"></asp:Label>
                            </td>
                        </tr>

                        <tr>
                            <td class="PopTableLeftTD" style="width: 120px; white-space: nowrap;">
                                <asp:Label ID="Label3" runat="server" Text="職務代理人" meta:resourcekey="Label3Resource1"></asp:Label>
                            </td>
                        <td colspan="3">
                            <asp:Label ID="lblAgent" runat="server" meta:resourcekey="lblAgentResource1" Visible="false"></asp:Label>
                            <uc1:UC_ChoiceList ID="choicelistAgent" runat="server" ChioceType="User" IsAllowEdit="false" />
                            <div style="display: none">
                                <uc2:UC_ChoiceListMobile runat="server" ID="choicelistAgentM" ChoiceType="User" IsAllowEdit="false" />
                            </div>
                        </td>
                        </tr>

                    </table>
                </td>
            </tr>
        </table>
        <table>
            <tr>
                <td>
                    <asp:CustomValidator ID="cvMissingInfo" runat="server" ErrorMessage="申請者無員工編號或公司統一編號資訊" Display="Dynamic" EnableTheming="True" meta:resourcekey="cvMissingInfoResource1"></asp:CustomValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:CustomValidator ID="cvCheckDeleteLeaveData" Display="Dynamic" runat="server" ErrorMessage="CustomValidator" meta:resourcekey="cvCheckDeleteLeaveDataResource1"></asp:CustomValidator>
                </td>
            </tr>
        </table>
        <asp:HiddenField ID="hfAllowModify" runat="server" />

        <asp:HiddenField ID="hfIsSendValue" runat="server" />
        <asp:HiddenField ID="hfLeaveGuid" runat="server" />
        <asp:HiddenField ID="hfApplicantGuid" runat="server" />
        <asp:HiddenField ID="hfStartTime" runat="server" />
        <asp:HiddenField ID="hfEndTime" runat="server" />
        <asp:HiddenField ID="hfApplicantEmployeeNo" runat="server" />
        <asp:HiddenField ID="hfApplicantCompanyUnifiedId" runat="server" />
        <asp:Label ID="lblFieldValue" runat="server" Visible="False" meta:resourcekey="lblFieldValueResource1"></asp:Label>
    </ContentTemplate>
</asp:UpdatePanel>

<asp:Label ID="lblErrorLeaveNbr" runat="server" Text="請選擇請假時間" Style="display: none" ForeColor="Red" meta:resourcekey="lblErrorLeaveNbrResource1"></asp:Label>
<asp:Label ID="lblSelectMsg" runat="server" Text="請選擇" Visible="False" meta:resourcekey="lblSelectMsgResource1"></asp:Label>
<asp:Label ID="lblHasNoAuthority" runat="server" Text="無填寫權限" ForeColor="Red" Visible="False" meta:resourcekey="lblHasNoAuthorityResource1"></asp:Label>
<asp:Label ID="lblToolTipMsg" runat="server" Text="不允許修改(唯讀)" Visible="False" meta:resourcekey="lblToolTipMsgResource1"></asp:Label>
<asp:Label ID="lblFiller" CssClass="FillerVisible" runat="server" meta:resourcekey="lblFillerResource1"></asp:Label>
<asp:Label ID="lblModifier" runat="server" Visible="False" meta:resourcekey="lblModifierResource1"></asp:Label>
<asp:Label ID="lblMsgSigner" runat="server" Text="填寫者" Visible="False" meta:resourcekey="lblMsgSignerResource1"></asp:Label>
<asp:Label ID="lblMsgEditor" runat="server" Text="修改者" Visible="False" meta:resourcekey="lblMsgEditorResource1"></asp:Label>
<asp:Label ID="lblAuthorityMsg" runat="server" Text="具填寫權限人員" Visible="False" meta:resourcekey="lblAuthorityMsgResource1"></asp:Label>