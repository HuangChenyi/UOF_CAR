<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="TravelCancelInfoUC.ascx.cs" Inherits="Ede.Uof.Web.EIP.Duty.WKFOptionalFields104.TravelCancelInfoUC" %>
<%@ Register Src="../../../Common/ChoiceCenter/UC_ChoiceList.ascx" TagName="UC_ChoiceList" TagPrefix="uc1" %>
<%@ Register Src="~/Common/ChoiceCenter/UC_ChoiceListMobile.ascx" TagPrefix="uc2" TagName="UC_ChoiceListMobile" %>
<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>
<script type="text/javascript">
    function ValidateApplyM_<%=ClientID%>(source, arguments) {
        var applicantEmployeeNo = $("#<%=hfApplicantEmployeeNo.ClientID%>").val();
        var applicantCompanyUnifiedId = $("#<%=hfApplicantCompanyUnifiedId.ClientID%>").val();
        var tripId = $("#<%=hfTripId.ClientID %>").val(); //表單代碼
        var ddlMTravelList = $find('<%=ddlMTravelList.ClientID %>');
   
        if (tripId === '') {
            source.textContent = $('#<%=lblErrorLeaveNbr.ClientID%>').text();
            arguments.IsValid = false;
            return;
        }

        if ($("#<%=hfAllowModify.ClientID%>").val() === 'true' &&
            ddlMTravelList != null &&
            (ddlMTravelList.get_selectedItem().get_value() === '' || ddlMTravelList.get_selectedItem().get_value() == null)) {

            source.textContent = $('#<%=lblErrorLeaveNbr.ClientID%>').text();
            arguments.IsValid = false;
            return;
        }

        var data = [applicantCompanyUnifiedId, applicantEmployeeNo, tripId];
        var result = $uof.pageMethod.syncUc("EIP/Duty/WKFOptionalFields104/TravelCancelInfoUC.ascx", "ValidateApply", data);
        if (result !== '') {
            if (result === "@tripIdNotFound")
                source.textContent = $('#<%=lblTravelFormNotFound.ClientID%>').text();
            else
                source.textContent = result;
            arguments.IsValid = false;
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

    Sys.Application.add_load(function () {       
        Show104Setting_<%=ClientID%>();
    });

    function Show104Setting_<%=ClientID%>() {
        var showCashAdcance = "<%=showCashAdcance%>";
        if (showCashAdcance === 'false') {
            $("#trAdvanceCurrenyTitle").attr("style", "display:none");
            $("#trAdvanceCurreny").attr("style", "display:none");
            $("#trlblAdvanceAmountTitle").attr("style", "display:none");
            $("#trlblAdvanceAmount").attr("style", "display:none");
        }
    }
</script>
<asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>
        <table style="width: 700px">
            <tr>
                <td style="padding-left: 17px">
                    <asp:Label ID="Label1" runat="server" Text="出差時間" meta:resourcekey="Label1Resource1"></asp:Label>
                    <asp:Label ID="Label8" runat="server" Text="*" ForeColor="Red" meta:resourcekey="Label8Resource1"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <table>
                        <tr>
                            <td style="padding-left: 17px">
                                <telerik:RadDropDownList ID="ddlMTravelList" runat="server" OnSelectedIndexChanged="ddlMTravelList_SelectedIndexChanged" AutoPostBack="True"  EnableTheming="True" CausesValidation="False" meta:resourcekey="ddlMTravelListResource1"></telerik:RadDropDownList>
                                <asp:DropDownList ID="ddlTravelList" runat="server" OnSelectedIndexChanged="ddlTravelList_SelectedIndexChanged" style="display:none" meta:resourcekey="ddlTravelListResource1">
                                </asp:DropDownList>
                                <asp:Label ID="lblTravelTime" runat="server" Visible="False" meta:resourcekey="lblTravelTimeResource1"></asp:Label>
                                <asp:Label ID="lblTripId" runat="server" style="display:none"></asp:Label>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td style="padding-left: 17px; padding-top:10px">
                    <asp:Label ID="lblType" runat="server" Text="類別" meta:resourcekey="lblTypeResource1"></asp:Label>
                </td>
            </tr>
            <tr>
                <td style="padding-left:17px">
                    <asp:Label ID="lblTypeValue" runat="server" meta:resourcekey="lblTypeValueResource1"></asp:Label>
                </td>
            </tr>
            <tr id="trAdvanceCurrenyTitle">
                <td style="padding-left: 17px; padding-top:10px">
                    <asp:Label ID="lblAdvanceCurreny" runat="server" Text="預支幣別" meta:resourcekey="lblAdvanceCurrenyResource1"></asp:Label>
                </td>
            </tr>
            <tr id="trAdvanceCurreny">
                <td style="padding-left: 17px">
                    <asp:Label ID="lblAdvanceCurrenyValue" runat="server" meta:resourcekey="lblAdvanceCurrenyValueResource1"></asp:Label>
                </td>
            </tr>
            <tr id="trlblAdvanceAmountTitle">
                <td style="padding-left: 17px; padding-top:10px">
                    <asp:Label ID="lblAdvanceAmount" runat="server" Text="預支金額" meta:resourcekey="lblAdvanceAmountResource1"></asp:Label>
                </td>
            </tr>
            <tr id="trlblAdvanceAmount">
                <td style="padding-left: 17px">
                    <asp:Label ID="lblAdvanceAmountValue" runat="server" meta:resourcekey="lblAdvanceAmountValueResource1"></asp:Label>
                </td>
            </tr>
            <tr>
                <td style="padding-left: 17px; padding-top:10px">
                    <asp:Label ID="lblTravelDetail" runat="server" Text="出差行程資訊" meta:resourcekey="lblTravelDetailResource1"></asp:Label>
                </td>
            </tr>
            <tr>
                <td style="padding-left: 17px">
                    <Fast:Grid ID="Grid1" runat="server" AutoGenerateCheckBoxColumn="False" AutoGenerateColumns="False"  EnableTheming="True"
                        DataKeyOnClientWithCheckBox="False" DefaultSortDirection="Ascending"
                        EmptyDataText="沒有資料" EnhancePager="True"
                        KeepSelectedRows="False" OnRowDataBound="Grid1_RowDataBound" PageSize="15" CustomDropDownListPage="False" meta:resourcekey="Grid1Resource1" SelectedRowColor="" UnSelectedRowColor="">

                        <EnhancePagerSettings ShowHeaderPager="True" FirstAltImageUrl="" FirstImageUrl="" LastAltImage="" LastImageUrl="" NextIAltImageUrl="" NextImageUrl="" PageInfoCssClass="" PageNumberCssClass="" PageNumberCurrentCssClass="" PageRedirectCssClass="" PreviousAltImageUrl="" PreviousImageUrl="" />
                        <ExportExcelSettings
                            AllowExportToExcel="False" />
                        <Columns>
                            <asp:TemplateField HeaderText="啟程日期" meta:resourcekey="TemplateFieldResource1">
                                <ItemTemplate>
                                    <asp:Label ID="lblStartDate" runat="server" meta:resourcekey="lblStartDateResource1"></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle Wrap="False" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="啟程時間" meta:resourcekey="TemplateFieldResource2">
                                <ItemTemplate>
                                    <asp:Label ID="lblStartTime" runat="server" meta:resourcekey="lblStartTimeResource1"></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle Wrap="False" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="迄程日期" meta:resourcekey="TemplateFieldResource3">
                                <ItemTemplate>
                                    <asp:Label ID="lblEndDate" runat="server" meta:resourcekey="lblEndDateResource1"></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle Wrap="False" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="迄程時間" meta:resourcekey="TemplateFieldResource4">
                                <ItemTemplate>
                                    <asp:Label ID="lblEndTime" runat="server" meta:resourcekey="lblEndTimeResource1"></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle Wrap="False" />
                            </asp:TemplateField>
                            <asp:BoundField HeaderText="出發地點" DataField="START_BUSINESS_TRIP_SITE" meta:resourcekey="BoundFieldResource1" />
                            <asp:BoundField HeaderText="停留地點" DataField="END_BUSINESS_TRIP_SITE" meta:resourcekey="BoundFieldResource2" />
                        </Columns>
                    </Fast:Grid>
                    <asp:TextBox ID="txtDetail" runat="server" Visible="False" meta:resourcekey="txtDetailResource1"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td style="padding-left: 17px; padding-top:10px">
                    <asp:Label ID="lblAgent" runat="server" Text="職務代理人" meta:resourcekey="lblAgentResource1"></asp:Label>
                </td>
            </tr>
            <tr>
                <td style="padding-left: 17px">
                    <uc2:UC_ChoiceListMobile runat="server" ID="choicelistAgentM" ChoiceType="User" IsAllowEdit="false" />
                    <div style="display: none">
                        <uc1:UC_ChoiceList ID="choicelistAgent" runat="server" ChioceType="User" IsAllowEdit="false" />
                    </div>
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
                    <asp:CustomValidator ID="CustomValidator1" runat="server" Display="Dynamic" meta:resourcekey="CustomValidator1Resource1"></asp:CustomValidator>
                </td>
            </tr>
        </table>
<asp:Label ID="lblHasNoAuthority" runat="server" Text="無填寫權限" ForeColor="Red" Visible="False" meta:resourcekey="lblHasNoAuthorityResource1"></asp:Label>
<asp:Label ID="lblToolTipMsg" runat="server" Text="不允許修改(唯讀)" Visible="False" meta:resourcekey="lblToolTipMsgResource1"></asp:Label>
<asp:Label ID="lblFiller" CssClass="FillerVisible" runat="server" meta:resourcekey="lblFillerResource1"></asp:Label>
<asp:Label ID="lblModifier" runat="server" Visible="False" meta:resourcekey="lblModifierResource1"></asp:Label>
<asp:Label ID="lblMsgSigner" runat="server" Text="填寫者" Visible="False" meta:resourcekey="lblMsgSignerResource1"></asp:Label>
<asp:Label ID="lblMsgEditor" runat="server" Text="修改者" Visible="False" meta:resourcekey="lblMsgEditorResource1"></asp:Label>
<asp:Label ID="lblAuthorityMsg" runat="server" Text="具填寫權限人員" Visible="False" meta:resourcekey="lblAuthorityMsgResource1"></asp:Label>
<asp:Label ID="lblComfirm" runat="server" Text="確定要刪除?" Visible="False" meta:resourcekey="lblComfirmResource1"></asp:Label>
<asp:HiddenField ID="hfAllowModify" runat="server" />
<asp:HiddenField ID="hfApplicantEmployeeNo" runat="server" />
<asp:HiddenField ID="hfCompanyNo" runat="server" />
<asp:HiddenField ID="hfApplicantCompanyUnifiedId" runat="server" />
<asp:HiddenField ID="hfAgentName" runat="server" />
<asp:HiddenField ID="hfApplicant" runat="server" />
<asp:HiddenField ID="hfTripId" runat="server" />
<asp:HiddenField ID="hfStartDateTime" runat="server" />
<asp:HiddenField ID="hfEndDateTime" runat="server" />
<asp:HiddenField ID="hfTravelHourWithUnit" runat="server" />
<asp:HiddenField ID="hfTripArea" runat="server" />
<asp:CustomValidator ID="cvApply" runat="server" Display="Dynamic" EnableTheming="True" meta:resourcekey="cvApplyResource1"></asp:CustomValidator>
    </ContentTemplate>
</asp:UpdatePanel>
<asp:Label ID="lblTravelAbroad" runat="server" Text="國外出差" Visible="False" meta:resourcekey="lblTravelAbroadResource1"></asp:Label>
<asp:Label ID="lblTravelDomestic" runat="server" Text="國內出差" Visible="False" meta:resourcekey="lblTravelDomesticResource1"></asp:Label>
<asp:Label Visible="False" ID="lblStartDate" Text="啟程日期" runat="server" meta:resourcekey="lblStartDateResource2"></asp:Label>
<asp:Label Visible="False" ID="lblStartTime" Text="啟程時間" runat="server" meta:resourcekey="lblStartTimeResource2"></asp:Label>
<asp:Label Visible="False" ID="lblEndDate" Text="迄程日期" runat="server" meta:resourcekey="lblEndDateResource2"></asp:Label>
<asp:Label Visible="False" ID="lblEndTime" Text="迄程時間" runat="server" meta:resourcekey="lblEndTimeResource2"></asp:Label>
<asp:Label Visible="False" ID="lblDeparture" Text="出發地點" runat="server" meta:resourcekey="lblDepartureResource1"></asp:Label>
<asp:Label Visible="False" ID="lblDestination" Text="停留地點" runat="server" meta:resourcekey="lblDestinationResource1"></asp:Label>
<asp:Label Visible="False" ID="lblChooseTravelForm" Text="請選擇" runat="server" meta:resourcekey="lblChooseTravelFormResource1"></asp:Label>
<asp:Label style="display: none;" ID="lblTravelFormNotFound" Text="找無此出差單，請確認是否已銷單" runat="server" meta:resourcekey="lblTravelFormNotFoundResource1"></asp:Label>
<asp:Label ID="lblErrorLeaveNbr" runat="server" Text="請選擇出差時間" Style="display: none" ForeColor="Red" meta:resourcekey="lblErrorLeaveNbrResource1" ></asp:Label>
<asp:Label ID="lblDetailNoData" runat="server" Text="沒有資料" Visible="False" meta:resourcekey="lblDetailNoDataResource1"></asp:Label>
<asp:Label ID="lblDay" runat="server" Text="天" Visible="False" meta:resourcekey="lblDayResource1"></asp:Label>
<asp:Label ID="lblHour" runat="server" Text="小時" Visible="False" meta:resourcekey="lblHourResource1"></asp:Label>
<asp:Label ID="lblMin" runat="server" Text="分" Visible="False" meta:resourcekey="lblMinResource1"></asp:Label>
<asp:Label ID="lblTravelType0NoResource" runat="server" Text="國內出差" Visible="False"></asp:Label><%--不要幫我加多國語--%>
<asp:Label ID="lblTravelType1NoResource" runat="server" Text="國外出差" Visible="False"></asp:Label><%--不要幫我加多國語--%>