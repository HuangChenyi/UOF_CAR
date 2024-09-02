<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="TravelInfoUC.ascx.cs" Inherits="Ede.Uof.Web.EIP.Duty.WKFOptionalFields104.TravelInfoUC" %>
<%@ Register Src="~/Common/ChoiceCenter/UC_ChoiceList.ascx" TagPrefix="uc1" TagName="UC_ChoiceList" %>
<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>
<%@ Register Src="~/Common/ChoiceCenter/UC_ChoiceListMobile.ascx" TagPrefix="uc2" TagName="UC_ChoiceListMobile" %>

<style>
    .TravelTable104 > tbody > tr:nth-child(even) > td {
        padding-left: 10px;
        padding-bottom: 15px;
    }

    .TravelTable104 > tbody > tr:nth-child(odd) > td {
        padding-left: 10px;
        padding-bottom: 5px;
    }

    .labelMutiline {
        white-space: pre-wrap;
    }
</style>

<script>
    function ValidateApply_<%=ClientID%>(source, arguments) {
        var startDate = $find("<%=rdStartDate.ClientID%>").get_dateInput().get_value();
        var endDate = $find("<%=rdEndDate.ClientID%>").get_dateInput().get_value();
        var startTime = $find("<%=rdStartTime.ClientID%>").get_dateInput().get_value();
        var endTime = $find("<%=rdEndTime.ClientID%>").get_dateInput().get_value();
        var applicantEmployeeNo = $("#<%=hfApplicantEmployeeNo.ClientID%>").val();
        var applicantCompanyUnifiedId = $("#<%=hfApplicantCompanyUnifiedId.ClientID%>").val();
        var reason = $("#<%=txtReason.ClientID%>").val();
        var leaCode = $("#<%= rblTravelType.ClientID %> input:checked").val();
        var currencyCode = $find("<%=rddlCurrency.ClientID%>").get_selectedItem().get_value();
        var cashAdvance = $find("<%=txtCashAdvance.ClientID%>").get_value();
        var currencyError = $("#<%=hfCurrencyError.ClientID%>").val(); // 104介接不完全，缺少資料
        var details = $("#<%=txtDetail.ClientID%>").val();
        var agentMobile = $("#<%=UC_ChoiceListMobile.ClientID%>_hiddenSelected").val();
        if (currencyCode === '' || currencyCode === null) {
            currencyCode = "NTD";
        }

        var agnetJSON = '';
        var isAgentRangeSetting = $("#<%= hfIsAgentRangeSetting.ClientID %>").val();

        // 職務代理人的選人範圍，是否為"申請者個人設定中的代理人"
        if (isAgentRangeSetting.toLowerCase() == 'true') {
            agnetJSON = $('#<%=hfAgentXML.ClientID %>').val();
        }
        else {
            if (typeof agentMobile !== "undefined" && agentMobile !== "") {
                var selectedArray = agentMobile.split(",");
                var array = new Array(selectedArray.length);

                for (var i = 0; i < selectedArray.length; i++) {
                    array[i] = selectedArray[i].split("|")[1];
                }
                agnetJSON = $uof.json.toString(array);
            }
        }

        if ($("#<%=hfFieldMode.ClientID%>").val() === "ReturnApplicant" || $("#<%=hfFieldMode.ClientID%>").val() === "Signin") {
            var docnbr = ['<%=taskObj != null ? taskObj.FormNumber : ""%>'];
            $uof.pageMethod.syncUc("EIP/Duty/WKFOptionalFields104/TravelInfoUC.ascx", "UpdateStatus", docnbr);
        }

        // 沒有公司統編或員編就不跑其他驗證
        if (applicantEmployeeNo === '' || applicantCompanyUnifiedId === '' || leaCode=== undefined || leaCode === null) {
            return;
        }

        // 104介接不完全，缺少資料
        if (currencyError.toLowerCase() === 'false') {
            source.textContent = $('#<%=lblNotFoundView.ClientID %>').text()
            arguments.IsValid = false;
            return;
        }

        var data = [applicantCompanyUnifiedId, applicantEmployeeNo, agnetJSON, reason, leaCode, startDate, startTime, endDate, endTime, currencyCode, cashAdvance.toString(), details, 'true', isAgentRangeSetting];
        var result = $uof.pageMethod.syncUc("EIP/Duty/WKFOptionalFields104/TravelInfoUC.ascx", "ValidateApply", data);
        if (result !== '') {
            source.textContent = result;
            arguments.IsValid = false;
            return;
        }
    }

    //驗證代理人必填
    function ValidateAgent_<%=ClientID%>(source, arguments) {
        var is_Mark = "<%=lblMark.Visible%>";
        var isAgentRangeSetting = $("#<%= hfIsAgentRangeSetting.ClientID %>").val();

        if (isAgentRangeSetting.toLowerCase() == 'true' && $('#<%=hfIsAgentUnavailable.ClientID %>').val().toLowerCase() == 'true') {
            arguments.IsValid = false;
            return;
        }

        if (is_Mark.toLowerCase() === 'true') {

            // 職務代理人的選人範圍，是否為"申請者個人設定中的代理人"
            if (isAgentRangeSetting.toLowerCase() == 'true') {
                var agentXML = $('#<%=hfAgentXML.ClientID %>').val();
                if (agentXML === '') {
                    arguments.IsValid = false;
                    return;
                }
            }
            else {
                var agentMobile = $("#<%=UC_ChoiceListMobile.ClientID%>_hiddenSelected").val();
                if (agentMobile !== "") {
                    var selectedArray = agentMobile.split(",");
                    if (selectedArray.length === 0) {
                        arguments.IsValid = false;
                        return;
                    }
                } else {
                    arguments.IsValid = false;
                    return;
                }
            }
        }
    }

    // 職務代理人不可選申請者
    function VaildateAgentNotSelf_<%=ClientID%>(source, arguments) {
        var applicantGuid = $("#<%=hfApplicant.ClientID%>").val();
        var allTravelUsers = $("#<%=hfAllUserValue.ClientID %>").val();
        var isAgentRangeSetting = $("#<%= hfIsAgentRangeSetting.ClientID %>").val();

        if (isAgentRangeSetting.toLowerCase() != 'true') {
            var selected = $("#<%=UC_ChoiceListMobile.ClientID%>_hiddenSelected").val();
            if (selected !== "") {
                var selectedArray = selected.split(",");
                var array = new Array(selectedArray.length);
                for (var i = 0; i < selectedArray.length; i++) {
                    array[i] = selectedArray[i].split("|")[1];
                }
                allTravelUsers = $uof.json.toString(array);
            }
            else
                allTravelUsers = "[]";

            if (allTravelUsers === '' || allTravelUsers === "[]") return;

            var data = [allTravelUsers, applicantGuid];
            var result = $uof.pageMethod.syncUc("EIP/Duty/WKFOptionalFields104/TravelInfoUC.ascx", "CheckAgentNotSelf", data);
            if (result === 'true') {
                source.textContent = $("#<%=lblIncludeApplyUser.ClientID %>").text();
                arguments.IsValid = false;
                return;
            }
        }
        else {
            arguments.IsValid = true;
            return;
        }
    }

    // 驗證代理人帳號是否有效
    function ValidateAgentAccount_<%=ClientID%>(source, arguments) {

        var allTravelUsers = '';

        // 職務代理人的選人範圍，是否為"申請者個人設定中的代理人"
        var isAgentRangeSetting = $("#<%= hfIsAgentRangeSetting.ClientID %>").val();
        if (isAgentRangeSetting.toLowerCase() == 'true') {
            allTravelUsers = $('#<%=hfAgentXML.ClientID %>').val();
        }
        else {
            var selected = $("#<%=UC_ChoiceListMobile.ClientID%>_hiddenSelected").val();
            if (selected !== "") {
                var selectedArray = selected.split(",");
                var array = new Array(selectedArray.length);
                for (var i = 0; i < selectedArray.length; i++) {
                    array[i] = selectedArray[i].split("|")[1];
                }
                allTravelUsers = $uof.json.toString(array);
            }
            else
                allTravelUsers = "[]";
        }

        if (allTravelUsers === '' || allTravelUsers === "[]") return;

        var data = [allTravelUsers, isAgentRangeSetting];
        var result = $uof.pageMethod.syncUc("EIP/Duty/WKFOptionalFields104/TravelInfoUC.ascx", "ValidateAgentAccount", data);

        if (result != '') {
            var errMsgAgent = result + $('#<%=lblErrMsg1.ClientID %>').text();
            source.textContent = errMsgAgent;
            arguments.IsValid = false;
            return;
        }
    }

    // 檢查申請者有沒有員工編號及公司統編
    function ValidateMissingInfo_<%=ClientID%>(source, arguments) {
        var applicant = $("#<%=hfApplicant.ClientID%>").val();
        var data = [applicant]
        var result = $uof.pageMethod.syncUc("EIP/Duty/WKFOptionalFields104/TravelInfoUC.ascx", "ValidateMissingInfo", data);
        if (result === 'false') {
            arguments.IsValid = false;
            return;
        }
    }

    //出差類別必填
    function ValidateTravelClass_<%=ClientID%>(source, arguments) {
      var leaCode = $("#<%= rblTravelType.ClientID %> input:checked").val();
      if (leaCode === undefined || leaCode === null) {
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
            $("#trCurrencyAdcance").attr("style", "display:none");
            $("#trCurrency").attr("style", "display:none");
            $("#trCash").attr("style", "display:none");
            $("#trCashAdcance").attr("style", "display:none");               
        }
    }

    // 事由必填
    function CheckRemarkRequired(source, args) {
        var remark = $("#<%=txtReason.ClientID%>");
        if (remark && remark.val().trim()==="") {
            args.IsValid = false;
        }
        else {
            args.IsValid = true;
        }
    }
</script>
<asp:UpdatePanel ID="UpdatePanel2" runat="server">
    <ContentTemplate>
        <table class="TravelTable104" style="width: 100%">
            <tr>
                <td style="white-space: nowrap">
                    <asp:Label ID="Label5" runat="server" Text="出差類別" meta:resourcekey="Label5Resource1"></asp:Label>
                    <asp:Label ID="lblStar" runat="server" Text="*" Visible="true" ForeColor="Red"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblTravelType" runat="server" Visible="False" meta:resourcekey="lblTravelTypeResource1"></asp:Label>
                    <asp:RadioButtonList ID="rblTravelType" runat="server" RepeatDirection="Horizontal" meta:resourcekey="rblTravelTypeResource1" RepeatLayout="Flow">
                        <asp:ListItem Text="國內出差" Value="S0013-1" meta:resourcekey="ListItemResource1"></asp:ListItem>
                        <asp:ListItem Text="國外出差" Value="S0013-2" meta:resourcekey="ListItemResource2"></asp:ListItem>
                    </asp:RadioButtonList> 
                    &nbsp;&nbsp;
                    <asp:CustomValidator ID="cvTravelClass" runat="server" ErrorMessage="請選擇出差類別" ForeColor="Red" Display="Dynamic" meta:resourcekey="cvTravelClassResource1"></asp:CustomValidator>                         
                </td>
            </tr>
            <tr>
                <td style="white-space: nowrap">
                    <asp:Label ID="Label1" runat="server" Text="預計出差時間(起)" meta:resourcekey="Label1Resource1"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <table>
                        <tr>
                            <td>
                                <telerik:RadDatePicker ID="rdStartDate" runat="server" AutoPostBack="True" OnSelectedDateChanged="rdStartDate_SelectedDateChanged" EnableTheming="True" meta:resourcekey="rdStartDateResource1">
                                </telerik:RadDatePicker>
                            </td>
                            <td>
                                <asp:Label ID="lblStartDate" runat="server" Visible="False" meta:resourcekey="lblStartDateResource1"></asp:Label>
                                <telerik:RadTimePicker ID="rdStartTime" runat="server" EnableTheming="True" meta:resourcekey="rdStartTimeResource1">
                                </telerik:RadTimePicker>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td style="white-space: nowrap">
                    <asp:Label ID="Label2" runat="server" Text="預計出差時間(訖)" meta:resourcekey="Label2Resource1"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <table>
                        <tr>
                            <td>
                                <telerik:RadDatePicker ID="rdEndDate" runat="server" EnableTheming="True" meta:resourcekey="rdEndDateResource1">
                                </telerik:RadDatePicker>
                            </td>
                            <td>
                                <asp:Label ID="lblEndDate" runat="server" Visible="False" meta:resourcekey="lblEndDateResource1"></asp:Label>
                                <telerik:RadTimePicker ID="rdEndTime" runat="server" EnableTheming="True" meta:resourcekey="rdEndTimeResource1">
                                </telerik:RadTimePicker>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
                <tr id="trCurrencyAdcance">
                    <td style="white-space: nowrap">
                        <asp:Label ID="Label6" runat="server" Text="預支幣別" meta:resourcekey="Label6Resource1"></asp:Label>
                    </td>
                </tr>
                <tr id="trCurrency">
                    <td>
                        <asp:Label ID="lblCurrency" runat="server" Visible="False" meta:resourcekey="lblCurrencyResource1"></asp:Label>
                        <asp:DropDownList ID="ddlCurrency" runat="server" style="display:none;" EnableTheming="True" meta:resourcekey="ddlCurrencyResource1"></asp:DropDownList>
                        <telerik:RadDropDownList ID="rddlCurrency" runat="server" EnableTheming="True" meta:resourcekey="rddlCurrencyResource1"></telerik:RadDropDownList>
                    </td>

                </tr>
                <tr id="trCash">
                    <td style="white-space: nowrap">
                        <asp:Label ID="Label7" runat="server" Text="預支金額" meta:resourcekey="Label7Resource1"></asp:Label>
                    </td>
                </tr>
                <tr id="trCashAdcance">
                    <td>
                        <asp:Label ID="lblCashAdcance" runat="server" Visible="False" meta:resourcekey="lblCashAdcanceResource1"></asp:Label>
                        <telerik:RadNumericTextBox ID="txtCashAdvance" runat="server" Width="115px" MinValue="0" EnableTheming="True" DbValueFactor="1" LabelCssClass="" LabelWidth="64px" meta:resourcekey="txtCashAdvanceResource1">
                            <NumberFormat ZeroPattern="n" AllowRounding="False"></NumberFormat>
                        </telerik:RadNumericTextBox>
                    </td>
                </tr>
            <tr>
                <td style="white-space: nowrap">
                    <asp:Label ID="Label3" runat="server" Text="事由" meta:resourcekey="Label3Resource1"></asp:Label>
                    <asp:Label ID="lblRemartTitleRequired" runat="server" ForeColor="Red" Text="*" Visible="false"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblReason" runat="server" Visible="False" CssClass="labelMutiline" meta:resourcekey="lblReasonResource1"></asp:Label>
                    <asp:TextBox ID="txtReason" runat="server" MaxLength="100" Width="100%" TextMode="MultiLine" Rows="3" meta:resourcekey="txtReasonResource1"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td style="white-space: nowrap">
                    <asp:Label ID="Label9" runat="server" Text="行程資訊" meta:resourcekey="Label9Resource1"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <table>
                        <tr>
                            <td>
                                <telerik:RadButton ID="rdbtnAddDetail" runat="server" Text="新增明細" CausesValidation="False" OnClick="rdbtnAddDetail_Click" EnableTheming="True" meta:resourcekey="rdbtnAddDetailResource1"></telerik:RadButton>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:UpdatePanel ID="updatepanel1" runat="server">
                                    <ContentTemplate>
                                        <Fast:Grid ID="Grid1" runat="server" AutoGenerateCheckBoxColumn="False" AutoGenerateColumns="False"
                                            DataKeyOnClientWithCheckBox="False" DefaultSortDirection="Ascending"
                                            EmptyDataText="沒有資料" EnhancePager="True" EnableTheming="True"
                                            KeepSelectedRows="False" OnRowCommand="Grid1_RowCommand"
                                            OnRowDataBound="Grid1_RowDataBound" PageSize="15" OnRowDeleting="Grid1_RowDeleting" Width="100%" CustomDropDownListPage="False" meta:resourcekey="Grid1Resource1" SelectedRowColor="" UnSelectedRowColor="">

                                            <EnhancePagerSettings ShowHeaderPager="True" FirstAltImageUrl="" FirstImageUrl="" LastAltImage="" LastImageUrl="" NextIAltImageUrl="" NextImageUrl="" PageInfoCssClass="" PageNumberCssClass="" PageNumberCurrentCssClass="" PageRedirectCssClass="" PreviousAltImageUrl="" PreviousImageUrl="" />
                                            <ExportExcelSettings
                                                AllowExportToExcel="False" />
                                            <Columns>
                                                <asp:TemplateField HeaderText="操作" meta:resourcekey="TemplateFieldResource1">
                                                    <ItemTemplate>
                                                        <asp:LinkButton ID="lbtnModify" CommandName="Modify" runat="server" Text="修改" CausesValidation="False" meta:resourcekey="lbtnModifyResource1"></asp:LinkButton>
                                                        <asp:LinkButton ID="lbtnDelete" CommandName="Delete" runat="server" Text="刪除" CausesValidation="False" meta:resourcekey="lbtnDeleteResource1"></asp:LinkButton>
                                                    </ItemTemplate>
                                                    <HeaderStyle Wrap="False" />
                                                    <ItemStyle Wrap="False" />
                                                </asp:TemplateField>
                                                <asp:BoundField HeaderText="啟程日期" DataField="startDate" meta:resourcekey="BoundFieldResource1" />
                                                <asp:BoundField HeaderText="啟程時間" DataField="startTime" meta:resourcekey="BoundFieldResource2" />
                                                <asp:BoundField HeaderText="迄程日期" DataField="endDate" meta:resourcekey="BoundFieldResource3" />
                                                <asp:BoundField HeaderText="迄程時間" DataField="endTime" meta:resourcekey="BoundFieldResource4" />
                                                <asp:TemplateField HeaderText="出發地點" meta:resourcekey="TemplateFieldResource2">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblDepature" runat="server" meta:resourcekey="lblDepatureResource1"></asp:Label>
                                                    </ItemTemplate>
                                                    <HeaderStyle Wrap="False" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="停留地點" meta:resourcekey="TemplateFieldResource3">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblDestination" runat="server" meta:resourcekey="lblDestinationResource1"></asp:Label>
                                                    </ItemTemplate>
                                                    <HeaderStyle Wrap="False" />
                                                </asp:TemplateField>
                                            </Columns>
                                        </Fast:Grid>
                                        <asp:TextBox ID="txtDetail" runat="server" Style="display: none" meta:resourcekey="txtDetailResource1"></asp:TextBox>
                                    </ContentTemplate>
                                    <Triggers>
                                        <asp:AsyncPostBackTrigger ControlID="rdbtnAddDetail" EventName="Click" />
                                    </Triggers>
                                </asp:UpdatePanel>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td style="white-space: nowrap">
                    <asp:Label ID="lblAgent" runat="server" Text="職務代理人" meta:resourcekey="lblAgentResource1"></asp:Label>
                    <asp:Label ID="lblMark" runat="server" Text="*" ForeColor="Red" Visible="False" meta:resourcekey="lblMarkResource1"></asp:Label>
                    <asp:CustomValidator ID="cvRequiredAgent" runat="server" ErrorMessage="不允許空白" ForeColor="Red" Display="Dynamic" meta:resourcekey="cvRequiredAgentResource1"></asp:CustomValidator>
                    <asp:CustomValidator ID="cvRequiredAgentAccount" runat="server" ForeColor="Red" Display="Dynamic" meta:resourcekey="cvRequiredAgentAccountResource1"></asp:CustomValidator>
                    <asp:Label runat="server" ID="lblAgentAccount" ForeColor="Blue" Visible="false"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <div style="display: none">
                        <uc1:UC_ChoiceList runat="server" ID="UC_ChoiceList" ChioceType="User" />
                    </div>
                    <uc2:UC_ChoiceListMobile runat="server" ID="UC_ChoiceListMobile" ChioceType="User" />

                    <asp:Panel ID="pnlAgentSetting" runat="server">
                        <asp:DropDownList ID="ddlAgent" OnSelectedIndexChanged="ddlAgent_SelectedIndexChanged" AutoPostBack="True" CausesValidation="False" runat="server"></asp:DropDownList>
                        <asp:Label ID="lblAgentText" runat="server"></asp:Label>
                        <br />
                        <asp:Label ID="lblAgentReselect" Text="選取的職務代理人已不存在，需重選代理人。" Visible="false" ForeColor="Blue" runat="server" meta:resourcekey="lblAgentReselectResource1"></asp:Label>
                        <asp:Label ID="lblAgentUnavailable" Text="選取的職務代理人已不存在，需重選代理人。" Visible="false" ForeColor="Blue" runat="server" meta:resourcekey="lblAgentUnavailableResource1"></asp:Label>
                        <asp:HiddenField ID="hfAgentXML" runat="server" />
                    </asp:Panel>
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
                    <asp:CustomValidator ID="cvRemark" runat="server" Display="Dynamic" EnableTheming="True" ForeColor="Red" ErrorMessage="事由不可空白" Visible="False" ClientValidationFunction="CheckRemarkRequired" meta:resourcekey="cvRemarkResource1"></asp:CustomValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:CustomValidator ID="cvApply" runat="server" Display="Dynamic" EnableTheming="True" meta:resourcekey="cvApplyResource1"></asp:CustomValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:CustomValidator ID="cvIsInculdeApplyUser" runat="server" ForeColor="Red" Display="Dynamic" meta:resourcekey="cvIsInculdeApplyUserResource1"></asp:CustomValidator>
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
        <asp:Label ID="lblStartDateText" runat="server" Text="啟程日期" Visible="False" meta:resourcekey="lblStartDateTextResource1"></asp:Label>
        <asp:Label ID="lblStartTimeText" runat="server" Text="啟程時間" Visible="False" meta:resourcekey="lblStartTimeTextResource1"></asp:Label>
        <asp:Label ID="lblEndDateText" runat="server" Text="迄程日期" Visible="False" meta:resourcekey="lblEndDateTextResource1"></asp:Label>
        <asp:Label ID="lblEndTimeText" runat="server" Text="迄程時間" Visible="False" meta:resourcekey="lblEndTimeTextResource1"></asp:Label>
        <asp:Label ID="lblDepatureText" runat="server" Text="出發地點" Visible="False" meta:resourcekey="lblDepatureTextResource1"></asp:Label>
        <asp:Label ID="lblDestinationText" runat="server" Text="停留地點" Visible="False" meta:resourcekey="lblDestinationTextResource1"></asp:Label>
        <asp:Label ID="lblDetailNoData" runat="server" Text="沒有資料" Visible="False" meta:resourcekey="lblDetailNoDataResource1"></asp:Label>
        <asp:Label ID="lblErrMsg1" runat="server" Text="帳號已停用，請重新選擇職務代理人。" Style="display: none" meta:resourcekey="lblErrMsg1Resource1"></asp:Label>
        <asp:Label ID="lblPauseMsg" runat="server" Text="帳號已停用。" Visible="false" meta:resourcekey="lblPauseMsgResource1"></asp:Label>
        <asp:Label ID="lblIncludeApplyUser" runat="server" Text="職務代理人與申請者不可相同" Style="display: none" meta:resourcekey="llblIncludeApplyUserResource1"></asp:Label>
        <asp:Label ID="lblNotFoundView" runat="server" Text="取得資料發生問題，請回報系統管理員。" Style="display: none" meta:resourcekey="lblNotFoundViewResource1"></asp:Label>
        <asp:Label ID="lblTravelType0NoResource" runat="server" Text="國內出差" Visible="False"></asp:Label><%--不要幫我加多國語--%>
        <asp:Label ID="lblTravelType1NoResource" runat="server" Text="國外出差" Visible="False"></asp:Label><%--不要幫我加多國語--%>
        <asp:Label ID="lblSelect" runat="server" Text="請選擇" Visible="False"  meta:resourcekey="lblSelectResource1"></asp:Label>
        
        
        <asp:HiddenField ID="hfApplicantEmployeeNo" runat="server" />
        <asp:HiddenField ID="hfApplicantCompanyUnifiedId" runat="server" />
        <asp:HiddenField ID="hfApplicant" runat="server" />
        <asp:HiddenField ID="hfFieldMode" runat="server" />
        <asp:HiddenField ID="hfAllUserValue" runat="server" />        
        <asp:HiddenField ID="hfCurrencyError" runat="server" Value="true"/>
        <asp:HiddenField ID="hfAgentRange" runat="server"/>
        <asp:HiddenField ID="hfIsAgentRangeSetting" runat="server" Value="false"/>
        <asp:HiddenField ID="hfIsAgentUnavailable" runat="server" Value="false"/>
        <asp:HiddenField ID="hfBaseApplicantGroupId" runat="server" Value=""/>

    </ContentTemplate>
</asp:UpdatePanel>
