<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="FormReleaseApprovalFieldUC.ascx.cs" Inherits="Ede.Uof.Web.WKF.FormManagement.WKF_OptionalFields.FormReleaseApprovalFieldUC" %>

<%@ Reference Control="~/WKF/FormManagement/VersionFieldUserControl/VersionFieldUC.ascx" %>
<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>
<%@ Register Src="../../../Common/ChoiceCenter/UC_ChoiceList.ascx" TagName="UC_ChoiceList" TagPrefix="uc1" %>

<style type="text/css">
    .cssCenter {
        text-align: center !important;
    }

    .cssHidden {
        display: none;
    }

    .rdpWidth {
        width: 220px !important;
    }

    .cursor {
        cursor: pointer;
    }
</style>

<script type="text/javascript">

    Sys.Application.add_load(function () {
        CloseDialogWhenMobile();
        rbReleaseDateTimeChecked();
        rbAllowApplyPeriodSpecificDateChecked();
        rbFormSavePeriodChecked();
        rdpDisalbed();
    });

    function tbArchiveClientClicking(sender, args) {
        var value = args.get_item().get_value();

        if (value == "setup") {
            args.set_cancel(true);
            $uof.dialog.open2('~/WKF/FormManagement/SetupArchiveUser.aspx', args.get_item(), '', 600, 400,
                function () { return true; },
                { "FORM_ID": "<%=hfReleaseFormId.Value%>", "IsFrom": "AddForm", "ScriptId": "<%=hfScriptId.Value%>" })
        }
        else if (value == "delete") {
            if (confirm('<%=lblConfirmArchive.Text %>') == false) {
                args.set_cancel(true);
            }
        }
    }

    function tbReaderClientClicking(sender, args) {
        var value = args.get_item().get_value();

        if (value == "setup") {
            args.set_cancel(true);
            $uof.dialog.open2('~/WKF/FormManagement/SetupReaderUser.aspx', args.get_item(), '', 600, 400,
                function () { return true; },
                { "FORM_ID": "<%=hfReleaseFormId.Value%>", "IsFrom": "AddForm", "ScriptId": "<%=hfScriptId.Value%>" })
        }
        else if (value == "delete") {
            if (confirm('<%=lblConfirmReader.Text %>') == false) {
                args.set_cancel(true);
            }
        }
    }

    //App上不允許操作(含簽核、觀看)
    function CloseDialogWhenMobile() {

        var isMobile = '<%=MobileUI%>';
        var lblNotAllowMobileSignText = '<%=lblNotAllowMobileSign.Text%>';
        var allowMobileSign = '<%=hfAllowMobileSign.Value%>';
        var fieldMode = '<%=hfFieldMode.Value%>';
        var IsFromSignForm = '<%=hfIsFromSignForm.Value%>';
        
        if (isMobile === 'False')
            return;

        //APP簽核頁點表單進來fieldMode也會是View，多加一個參數IsFromSignForm以區分是簽核頁OR觀看頁
        if (fieldMode === 'View' && IsFromSignForm == 'true' && allowMobileSign === 'False')
        {
            $uof.dialog.close();
            return;
        }

        alert(lblNotAllowMobileSignText);
        $uof.dialog.close();
    }

    //發佈時間未選取預計發佈日期需反灰
    function rbReleaseDateTimeChecked() {

        var rbReleaseExpectSpecificDateTime = $("#<%= rbReleaseExpectSpecificDateTime.ClientID%>");
        var rdtpReleaseExpectSpecificDateTime = $find("<%= rdtpReleaseExpectSpecificDateTime.ClientID %>");

        if (rdtpReleaseExpectSpecificDateTime === null)
            return;

        if (rbReleaseExpectSpecificDateTime.is(":checked"))
            rdtpReleaseExpectSpecificDateTime.set_enabled(true);
        else
            rdtpReleaseExpectSpecificDateTime.set_enabled(false);
    }

    //允許申請期間未選取指定期間需反灰
    function rbAllowApplyPeriodSpecificDateChecked() {

        var rbAllowApplyPeriodSpecificDate = $("#<%= rbAllowApplyPeriodSpecificDate.ClientID%>");
        var rdpAllowApplyPeriodSpecificDateStart = $find("<%= rdpAllowApplyPeriodSpecificDateStart.ClientID %>");
        var rdpAllowApplyPeriodSpecificDateEnd = $find("<%= rdpAllowApplyPeriodSpecificDateEnd.ClientID %>");

        if (rdpAllowApplyPeriodSpecificDateStart === null || rdpAllowApplyPeriodSpecificDateEnd === null)
            return;

        if (rbAllowApplyPeriodSpecificDate.is(":checked")) {
            rdpAllowApplyPeriodSpecificDateStart.set_enabled(true);
            rdpAllowApplyPeriodSpecificDateEnd.set_enabled(true);
        }
        else {
            rdpAllowApplyPeriodSpecificDateStart.set_enabled(false);
            rdpAllowApplyPeriodSpecificDateEnd.set_enabled(false);
        }
    }

    //表單保存期限未選取保存年限需反灰
    function rbFormSavePeriodChecked() {

        var rbSavePeriodByYear = $("#<%= rbSavePeriodByYear.ClientID%>");
        var rntbSaveYear = $find("<%= rntbSaveYear.ClientID %>");

        if (rntbSaveYear === null)
            return;

        if (rbSavePeriodByYear.is(":checked")) 
            rntbSaveYear.enable();
        else 
            rntbSaveYear.disable();
    }

    //telerik日期、時間、數值元件後端反灰會失效，故改從前端
    function rdpDisalbed() {

        var fieldMode = '<%=hfFieldMode.Value%>';
        var rdtpReleaseExpectSpecificDateTime = $find("<%= rdtpReleaseExpectSpecificDateTime.ClientID %>");
        var rdpAllowApplyPeriodSpecificDateStart = $find("<%= rdpAllowApplyPeriodSpecificDateStart.ClientID %>");
        var rdpAllowApplyPeriodSpecificDateEnd = $find("<%= rdpAllowApplyPeriodSpecificDateEnd.ClientID %>");
        var GetFormConfigSettingValue = $uof.pageMethod.syncUc("/WKF/FormManagement/WKF_OptionalFields/FormReleaseApprovalFieldUC.ascx", "GetFormConfigSettingValue", ['NONE']);
        var rntbSaveYear = $find("<%= rntbSaveYear.ClientID %>");

        switch (fieldMode) {
            case 'Applicant':
            case 'ReturnApplicant':
                break;

            default:
                rdtpReleaseExpectSpecificDateTime.set_enabled(false);
                rdpAllowApplyPeriodSpecificDateStart.set_enabled(false);
                rdpAllowApplyPeriodSpecificDateEnd.set_enabled(false);
                rntbSaveYear.disable();
                break;
        }

        //已停用開關則強制Disabled日期時間元件
        if (GetFormConfigSettingValue === 'False') {
            rdtpReleaseExpectSpecificDateTime.set_enabled(false);
            rdpAllowApplyPeriodSpecificDateStart.set_enabled(false);
            rdpAllowApplyPeriodSpecificDateEnd.set_enabled(false);
            rntbSaveYear.disable();
        }
    }

    //驗證發佈審核單開關是否停用(申請)
    function cvFormSettingDisabledValidationApply_<%=ClientID%>(sender, args) {

        var fieldMode = '<%=hfFieldMode.Value%>';
        var hlSettingDisabledFocus = $("#<%= hlSettingDisabledFocus.ClientID%>");
        var GetFormConfigSettingValue = $uof.pageMethod.syncUc("/WKF/FormManagement/WKF_OptionalFields/FormReleaseApprovalFieldUC.ascx", "GetFormConfigSettingValue", ['NONE']);

        switch (fieldMode) {
            case 'Applicant':
            case 'ReturnApplicant':
                {
                    if (GetFormConfigSettingValue === 'False') {
                        args.IsValid = false;
                        hlSettingDisabledFocus.focus();
                    }
                    else
                        args.IsValid = true;
                }
                break;

            default:
                args.IsValid = true;
                break;
        }
    }

    //驗證發佈審核單開關是否停用(簽核)
    function cvFormSettingDisabledValidationSign_<%=ClientID%>(sender, args) {

        var fieldMode = '<%=hfFieldMode.Value%>';
        var hlSettingDisabledFocus = $("#<%= hlSettingDisabledFocus.ClientID%>");
        var GetFormConfigSettingValue = $uof.pageMethod.syncUc("/WKF/FormManagement/WKF_OptionalFields/FormReleaseApprovalFieldUC.ascx", "GetFormConfigSettingValue", ['NONE']);

        switch (fieldMode) {
            case 'Signin':
                {
                    if (GetFormConfigSettingValue === 'False') {
                        args.IsValid = false;
                        hlSettingDisabledFocus.focus();
                    }
                    else
                        args.IsValid = true;
                }
                break;

            default:
                args.IsValid = true;
                break;
        }
    }

    //驗證發佈審核單表單是否停用
    function cvFormCtrlDisalbedValidation_<%=ClientID%>(sender, args) {

        var hlFormCtrlDisalbedFocus = $("#<%= hlFormCtrlDisalbedFocus.ClientID%>");
        var GetFormCtrlValue = $uof.pageMethod.syncUc("/WKF/FormManagement/WKF_OptionalFields/FormReleaseApprovalFieldUC.ascx", "GetFormCtrlValue", ['ReleaseApprovalForm']);

        if (GetFormCtrlValue === 'True') {
            args.IsValid = false;
            hlFormCtrlDisalbedFocus.focus();
        }
        else
            args.IsValid = true;
    }
    
    //發佈時間不可早於申請時間
    function cvReleaseDateTimeLaterThanApplyDateTimeValidation_<%=ClientID%>(sender, args) {

        var fieldMode = '<%=hfFieldMode.Value%>';
        var rbReleaseExpectSpecificDateTimeChecked = $("#<%= rbReleaseExpectSpecificDateTime.ClientID%>").is(":checked");
        var rdtpReleaseExpectSpecificDateTime = $find("<%= rdtpReleaseExpectSpecificDateTime.ClientID %>");

        var releaseDateTime = rdtpReleaseExpectSpecificDateTime.get_dateInput().get_value();
        var nowDateTimeFromDb = $uof.pageMethod.syncUc("/WKF/FormManagement/WKF_OptionalFields/FormReleaseApprovalFieldUC.ascx", "GetNowDateTimeFromDb", "");

        var releaseDateTimeToDT = new Date(releaseDateTime);
        var nowDateTimeFromDbToDT = new Date(nowDateTimeFromDb);

        if (fieldMode === 'Applicant' && rbReleaseExpectSpecificDateTimeChecked && nowDateTimeFromDbToDT > releaseDateTimeToDT)
            args.IsValid = false;
        else
            args.IsValid = true;
    }

    //發佈時間必填
    function cvReleaseDateTimeValidation_<%=ClientID%>(sender, args) {

        var rbReleaseExpectSpecificDateTimeChecked = $("#<%= rbReleaseExpectSpecificDateTime.ClientID%>").is(":checked");
        var rdtpReleaseExpectSpecificDateTime = $find("<%= rdtpReleaseExpectSpecificDateTime.ClientID %>");

        if (rbReleaseExpectSpecificDateTimeChecked &&
            rdtpReleaseExpectSpecificDateTime != null &&
            rdtpReleaseExpectSpecificDateTime.get_dateInput().get_value() === '') {
            args.IsValid = false;
            rdtpReleaseExpectSpecificDateTime.get_dateInput().focus();
        }
        else
            args.IsValid = true;
    }

    //表單建立/改版原因驗證必填
    function cvFormRevisionReasonValidation_<%=ClientID%>(sender, args) {

        var txtFormRevisionReason = $("#<%= txtFormRevisionReason.ClientID%>");

        if (txtFormRevisionReason.val() === "") {
            args.IsValid = false;
            txtFormRevisionReason.focus();
        }
        else
            args.IsValid = true;
    }

    //允許申請期間驗證必填
    function cvAllowApplyPeriodCantEmptyValidation_<%=ClientID%>(sender, args) {

        var rbAllowApplyPeriodSpecificDateChecked = $("#<%= rbAllowApplyPeriodSpecificDate.ClientID%>").is(":checked");
        var rdpAllowApplyPeriodSpecificDateStart = $find("<%= rdpAllowApplyPeriodSpecificDateStart.ClientID %>");
        var rdpAllowApplyPeriodSpecificDateEnd = $find("<%= rdpAllowApplyPeriodSpecificDateEnd.ClientID %>");

        if (rbAllowApplyPeriodSpecificDateChecked &&
            ((rdpAllowApplyPeriodSpecificDateStart != null && rdpAllowApplyPeriodSpecificDateStart._validationInput.value === "") ||
             (rdpAllowApplyPeriodSpecificDateEnd != null && rdpAllowApplyPeriodSpecificDateEnd._validationInput.value === ""))) {
            args.IsValid = false;
            rdpAllowApplyPeriodSpecificDateEnd.get_dateInput().focus();
        }
        else
            args.IsValid = true;
    }

    //允許申請期間驗證迄日需大於起日
    function cvAllowApplyPeriodCheckEndDateValidation_<%=ClientID%>(sender, args) {

        var rbAllowApplyPeriodSpecificDateChecked = $("#<%= rbAllowApplyPeriodSpecificDate.ClientID%>").is(":checked");
        var rdpAllowApplyPeriodSpecificDateStart = $find("<%= rdpAllowApplyPeriodSpecificDateStart.ClientID %>");
        var rdpAllowApplyPeriodSpecificDateEnd = $find("<%= rdpAllowApplyPeriodSpecificDateEnd.ClientID %>");

        var startDate = rdpAllowApplyPeriodSpecificDateStart._validationInput.value;
        var endDate = rdpAllowApplyPeriodSpecificDateEnd._validationInput.value;

        if (rbAllowApplyPeriodSpecificDateChecked && endDate < startDate) {
            args.IsValid = false;
            rdpAllowApplyPeriodSpecificDateEnd.get_dateInput().focus();
        }
        else
            args.IsValid = true;
    }

    //表單保存期限驗證必填
    function cvFormSavePeriodValidation_<%=ClientID%>(sender, args) {

        var rbSavePeriodChecked = $("#<%=rbSavePeriodByYear.ClientID%>").is(":checked");
        var rntbSaveYear = $find("<%= rntbSaveYear.ClientID %>");

        if (rbSavePeriodChecked &&
            rntbSaveYear != null &&
            rntbSaveYear._validationText === "") {
            args.IsValid = false;
            rntbSaveYear.focus();
        }
        else
            args.IsValid = true;
    }

    //表單使用權限驗證必填
    function cvFormUseAuthorityValidation_<%=ClientID%>(sender, args) {

        var hlFormUseAuthorityFocus = $("#<%= hlFormUseAuthorityFocus.ClientID%>");
        var choiceListJson = $("#<%=UC_ChoiceListAuthority.ClientID%>_hiddenJSON").val().toString();

        if (choiceListJson === '{"UserSet":{"Element":[]}}' || choiceListJson === '') {
            args.IsValid = false;
            hlFormUseAuthorityFocus.focus();
        }
        else
            args.IsValid = true;
    }

    //表單所有版本狀態檢查是否有審核中OR待發佈
    function cvCheckFormAllVersionStatus_<%=ClientID%>(sender, args) {

        var formStatus = $uof.pageMethod.syncUc("/WKF/FormManagement/WKF_OptionalFields/FormReleaseApprovalFieldUC.ascx", "CheckFormAllVersionStatus", ['<%=hfReleaseFormId.Value%>', '<%=hfReleaseFormVerId.Value%>']);
        var fieldMode = '<%=hfFieldMode.Value%>';

        if (fieldMode === 'Applicant') {
            switch (formStatus) {
                case 'isApproval':
                    args.IsValid = false;
                    alert('<%=lblFormIsApproval.Text%>');
                    break;

                case 'isDynamicIssule':
                    args.IsValid = false;
                    alert('<%=lblFormWaitRelease.Text%>');
                    break;

                default:
                    args.IsValid = true;
            }
        }
    }

</script>

<asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>
        
        <asp:CustomValidator ID="cvFormSettingDisabledForApply" runat="server" Display="Dynamic" 
            ErrorMessage="已關閉表單審核功能，無法申請。" meta:resourcekey="cvFormSettingDisabledForApplyResource1">
        </asp:CustomValidator>
                
        <asp:CustomValidator ID="cvFormSettingDisabledForSign" runat="server" Display="Dynamic" 
            ErrorMessage="已關閉表單審核功能，不允許簽核，請洽系統管理員處理。" meta:resourcekey="cvFormSettingDisabledForSignResource1">
        </asp:CustomValidator>

        <asp:HyperLink ID="hlSettingDisabledFocus" NavigateUrl="#" runat="server" />
              
        <asp:CustomValidator ID="cvFormCtrlDisalbed" runat="server" Display="Dynamic" 
           ErrorMessage="未啟用表單發佈審核單，無法申請，請洽電子簽核管理員。" meta:resourcekey="cvFormCtrlDisalbedResource1">
        </asp:CustomValidator>

        <asp:HyperLink ID="hlFormCtrlDisalbedFocus" NavigateUrl="#" runat="server" />

        <asp:CustomValidator ID="cvCheckFormAllVersionStatus" runat="server" Display="Dynamic" ErrorMessage=""></asp:CustomValidator>

        <table style="width: 1000px">
            <tr>
                <td>
                    <table class="PopTable" cellspacing="0" width="100%">
                        <tr>
                            <td colspan="4" class="cssCenter PopTableHeader">
                                <asp:Label ID="lblFormInformationTitle" runat="server" Text="表單資訊" meta:resourcekey="lblFormInformationTitleResource1"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td style="white-space: nowrap;">
                                <asp:Label ID="lblFormCategoryNameTitle" runat="server" Text="表單類別" meta:resourcekey="lblFormCategoryNameTitleResource1"></asp:Label>
                            </td>
                            <td>
                                <asp:Label ID="lblFormCategoryName" runat="server" meta:resourcekey="lblFormCategoryNameResource1"></asp:Label>
                            </td>
                            <td style="white-space: nowrap;">
                                <asp:Label ID="lblFormVersionTitle" runat="server" Text="表單版本" meta:resourcekey="lblFormVersionTitleResource1"></asp:Label>
                            </td>
                            <td>
                                <asp:Label ID="lblFormVersion" runat="server" meta:resourcekey="lblFormVersionResource1"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td style="white-space: nowrap;">
                                <asp:Label ID="lblFormNameTitle" runat="server" Text="表單名稱" meta:resourcekey="lblFormNameTitleResource1"></asp:Label>
                            </td>
                            <td colspan="3">
                                <asp:Label ID="lblFormName" runat="server" meta:resourcekey="lblFormNameResource1"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td style="white-space: nowrap;">
                                <asp:Label ID="lblStarTip" runat="server" Text="*" ForeColor="Red" meta:resourcekey="lblStarTipResource1"></asp:Label>
                                <asp:Label ID="lblReleaseDateTimeTitle" runat="server" Text="發佈時間" meta:resourcekey="lblReleaseDateTimeTitleResource1"></asp:Label>
                            </td>
                            <td colspan="3">
                                <asp:Panel ID="pnlReleaseDateTime" runat="server" meta:resourcekey="pnlReleaseDateTimeResource1">

                                    <asp:RadioButton ID="rbReleaseExpectSpecificDateTime" runat="server" Text="預計發佈日期" 
                                        onclick="rbReleaseDateTimeChecked()" GroupName="rbReleaseDateTime" meta:resourcekey="rbReleaseExpectSpecificDateTimeResource1" />

                                    <telerik:RadDateTimePicker ID="rdtpReleaseExpectSpecificDateTime" runat="server" CssClass="rdpWidth"></telerik:RadDateTimePicker>
                                                          
                                    <asp:CustomValidator ID="cvReleaseDateTimeLaterThanApplyDateTime" runat="server" Display="Dynamic" 
                                        ErrorMessage="預計發佈時間不可早於申請時間" meta:resourcekey="cvReleaseDateTimeLaterThanApplyDateTimeResource1" >
                                    </asp:CustomValidator>

                                    <asp:CustomValidator ID="cvReleaseDateTime" runat="server" Display="Dynamic" ErrorMessage="請輸入發佈日期"
                                        meta:resourcekey="cvReleaseDateTimeResource1">
                                    </asp:CustomValidator>
                                    <br />
                                    <asp:RadioButton ID="rbReleaseAfterApproval" runat="server" Text="審核後立即發佈" GroupName="rbReleaseDateTime"
                                        onclick="rbReleaseDateTimeChecked()" meta:resourcekey="rbReleaseAfterApprovalResource1" />
                                </asp:Panel>
                            </td>
                        </tr>
                        <tr>
                            <td style="white-space: nowrap;">
                                <asp:Label ID="lblStarTip2" runat="server" Text="*" ForeColor="Red" meta:resourcekey="lblStarTip2Resource1"></asp:Label>
                                <asp:Label ID="lblFormRevisionReasonTitle" runat="server" Text="表單建立/改版原因" meta:resourcekey="lblFormRevisionReasonTitleResource1"></asp:Label>
                            </td>
                            <td colspan="3">
                                <asp:TextBox ID="txtFormRevisionReason" runat="server" Width="100%" TextMode="MultiLine" Height="60px" meta:resourcekey="txtFormRevisionReasonResource1"></asp:TextBox>
                                <asp:Label ID="lblFormRevisionReason" runat="server" meta:resourcekey="lblFormRevisionReasonResource1"></asp:Label>

                                <asp:CustomValidator ID="cvFormRevisionReason" runat="server" Display="Dynamic"
                                    ErrorMessage="請輸入表單建立/改版原因" meta:resourcekey="cvFormRevisionReasonResource1">
                                </asp:CustomValidator>
                            </td>
                        </tr>
                        <tr>
                            <td style="white-space: nowrap;">
                                <asp:Label ID="lblFormContentTitle" runat="server" Text="表單內容" meta:resourcekey="lblFormContentTitleResource1"></asp:Label>
                            </td>
                            <td>
                                <asp:HyperLink ID="hlFormContent" runat="server" Text="版面預覽" ForeColor="Blue" CssClass="cursor" meta:resourcekey="hlFormContentResource1"></asp:HyperLink>
                            </td>
                            <td style="white-space: nowrap;">
                                <asp:Label ID="lblFormViewFlowTitle" runat="server" Text="表單流程" meta:resourcekey="lblFormViewFlowTitleResource1"></asp:Label>
                            </td>
                            <td>
                                <asp:HyperLink ID="hlFormViewFlow" runat="server" Text="觀看流程" ForeColor="Blue" CssClass="cursor" meta:resourcekey="hlFormViewFlowResource1"></asp:HyperLink>
                            </td>
                        </tr>
                        <tr>
                            <td style="white-space: nowrap;">
                                <asp:Label ID="lblFlowVerificationTitle" runat="server" Text="流程驗證" meta:resourcekey="lblFlowVerificationTitleResource1"></asp:Label>
                            </td>
                            <td>
                                <asp:HyperLink ID="hlFlowVerification" runat="server" Text="進行驗證" ForeColor="Blue" CssClass="cursor" meta:resourcekey="hlFlowVerificationResource1"></asp:HyperLink>
                            </td>
                            <td style="white-space: nowrap;">
                                <asp:Label ID="lblFlowVerificationReportTitle" runat="server" Text="流程驗證報表" meta:resourcekey="lblFlowVerificationReportTitleResource1"></asp:Label>
                            </td>
                            <td>
                                <asp:HyperLink ID="hlFlowVerificationReport" runat="server" Text="下載" ForeColor="Blue" CssClass="cursor" meta:resourcekey="hlFlowVerificationReportResource1"></asp:HyperLink>
                            </td>
                        </tr>
                        <tr>
                            <td style="white-space: nowrap;">
                                <asp:Label ID="lblStarTip3" runat="server" Text="*" ForeColor="Red" meta:resourcekey="lblStarTip3Resource1"></asp:Label>
                                <asp:Label ID="lblAllowApplyPeriodTitle" runat="server" Text="允許申請期間" meta:resourcekey="lblAllowApplyPeriodTitleResource1"></asp:Label>
                            </td>
                            <td colspan="3">
                                <asp:Panel ID="pnlAllowApplyPeriod" runat="server" meta:resourcekey="pnlAllowApplyPeriodResource1">
                                    <asp:RadioButton ID="rbAllowApplyPeriodNoLimit" runat="server" Text="不限制" GroupName="rbAllowApplyPeriod"
                                       onclick="rbAllowApplyPeriodSpecificDateChecked()" meta:resourcekey="rbAllowApplyPeriodNoLimitResource1" />
                                    <br />
                                    <asp:RadioButton ID="rbAllowApplyPeriodSpecificDate" runat="server" Text="指定期間" GroupName="rbAllowApplyPeriod"
                                       onclick="rbAllowApplyPeriodSpecificDateChecked()" meta:resourcekey="rbAllowApplyPeriodSpecificDateResource1" />

                                    <telerik:RadDatePicker ID="rdpAllowApplyPeriodSpecificDateStart" runat="server"></telerik:RadDatePicker>
                        
                                    <telerik:RadDatePicker ID="rdpAllowApplyPeriodSpecificDateEnd" runat="server"></telerik:RadDatePicker>
                                    
                                    <asp:CustomValidator ID="cvAllowApplyPeriodCantEmpty" runat="server" Display="Dynamic" ClientValidationFunction="cvAllowApplyPeriodCantEmptyValidation"
                                        ErrorMessage="請輸入指定期間" meta:resourcekey="cvAllowApplyPeriodCantEmptyResource1">
                                    </asp:CustomValidator>
                                                                        
                                    <asp:CustomValidator ID="cvAllowApplyPeriodCheckEndDate" runat="server" Display="Dynamic" ClientValidationFunction="cvAllowApplyPeriodCheckEndDateValidation"
                                        ErrorMessage="開始日期不可晚於結束日期" meta:resourcekey="cvAllowApplyPeriodCheckEndDateResource1">
                                    </asp:CustomValidator>
                                </asp:Panel>

                                <asp:Label ID="lblAllowApplyDateTip" runat="server" ForeColor="Blue" meta:resourcekey="lblAllowApplyDateTipResource1"
                                    Text="*指定期間設定為2022/01/01~2022/01/31，使用者只能於2022/01/01 00:00~2022/01/31 23:59 申請此張表單。" >
                                </asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td style="white-space: nowrap;">
                                <asp:Label ID="lblStarTip4" runat="server" Text="*" ForeColor="Red" meta:resourcekey="lblStarTip4Resource1"></asp:Label>
                                <asp:Label ID="lblFormSavePeriodTitle" runat="server" Text="表單保存期限" meta:resourcekey="lblFormSavePeriodTitleResource1"></asp:Label>
                            </td>
                            <td colspan="3">
                                <asp:Panel ID="pnlSavePeriod" runat="server" meta:resourcekey="pnlSavePeriodResource1">
                                    <asp:RadioButton ID="rbSaveNoLimit" runat="server" Text="永遠保留" GroupName="rbFormSavePeriod"
                                      onclick="rbFormSavePeriodChecked()" meta:resourcekey="rbSaveNoLimitResource1"  />
                                    <br />
                                    <asp:RadioButton ID="rbSavePeriodByYear" runat="server" Text="保存" GroupName="rbFormSavePeriod"
                                      onclick="rbFormSavePeriodChecked()" meta:resourcekey="rbSavePeriodByYearResource1" />

                                    <telerik:RadNumericTextBox ID="rntbSaveYear" runat="server" Width="35px" Value="1"
                                        MinValue="1" MaxValue="99" NumberFormat-AllowRounding="false" >
                                    </telerik:RadNumericTextBox>

                                    <asp:Label ID="lblSaveYearTitle" runat="server" Text="年" meta:resourcekey="lblSaveYearTitleResource1"></asp:Label>
                                    
                                    <asp:CustomValidator ID="cvFormSavePeriod" runat="server" Display="Dynamic"
                                        ErrorMessage="請輸入保存年限" meta:resourcekey="cvFormSavePeriodResource1">
                                    </asp:CustomValidator>
                                    
                                    <asp:Label ID="lblSaveYearRangeTip" runat="server" ForeColor="Blue" Text="*輸入範圍為1~99" meta:resourcekey="lblSaveYearRangeTipResource1"></asp:Label>
                                </asp:Panel>

                                <asp:Label ID="lblFormSaveLimitPeriodTip" runat="server" ForeColor="Blue"
                                    Text="*保存期限設定為1年，2023/01/01執行排程後，會自動刪除2021/12/31 23:59(含)前已結案的表單及相關附件。" meta:resourcekey="lblFormSaveLimitPeriodTipResource1">
                                </asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="4" class="cssCenter PopTableHeader">
                                <asp:Label ID="lblStar6Tip" runat="server" Text="*" ForeColor="Red" meta:resourcekey="lblStar6TipResource1"></asp:Label>
                                <asp:Label ID="lblFormUserAuthorityTitle" runat="server" Text="表單人員權限" meta:resourcekey="lblFormUserAuthorityTitleResource1"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td style="white-space: nowrap;">
                                <asp:Label ID="lblStar7Tip" runat="server" Text="*" ForeColor="Red" meta:resourcekey="lblStar7TipResource1"></asp:Label>
                                <asp:Label ID="lblFormUseAuthorityTitle" runat="server" Text="表單使用權限" meta:resourcekey="lblFormUseAuthorityTitleResource1"></asp:Label>
                            </td>
                            <td colspan="3">
                                <uc1:UC_ChoiceList ID="UC_ChoiceListAuthority" runat="server" TreeHeight="100px" ShowMember="True" ExpandToUser="false" />
                                <asp:CustomValidator ID="cvFormUseAuthority" runat="server" Display="Dynamic"
                                    ErrorMessage="請選擇表單使用權限" meta:resourcekey="cvFormUseAuthorityResource1">
                                </asp:CustomValidator>
                                <asp:HyperLink ID="hlFormUseAuthorityFocus" NavigateUrl="#" runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td style="white-space: nowrap;">
                                <asp:Label ID="lblFormManagerTitle" runat="server" Text="表單負責人" meta:resourcekey="lblFormManagerTitleResource1"></asp:Label>
                            </td>
                            <td colspan="3">
                                <uc1:UC_ChoiceList ID="UC_ChoiceListManager" runat="server" TreeHeight="100px" ShowMember="False" ExpandToUser="false" />
                            </td>
                        </tr>
                        <tr>
                            <td style="white-space: nowrap;">
                                <asp:Label ID="lblFilingHandlerTitle" runat="server" Text="歸檔處理者" meta:resourcekey="lblFilingHandlerTitleResource1"></asp:Label>
                            </td>
                            <td colspan="3">
                                <asp:UpdatePanel ID="updatePanelArchive" runat="server" UpdateMode="Conditional">
                                    <ContentTemplate>
                                        <table style="width: 100%">
                                            <tr>
                                                <telerik:RadToolBar ID="tbArchive" runat="server" Width="100%"
                                                    OnButtonClick="tbArchive_ButtonClick" OnClientButtonClicking="tbArchiveClientClicking" meta:resourcekey="tbArchiveResource1">
                                                    <Items>
                                                        <telerik:RadToolBarButton Value="setup" runat="server" Text="新增歸檔人員" ImageUrl="~/Common/Images/Icon/icon_m51.gif" meta:resourcekey="RadToolBarButtonResource1" CausesValidation="False" ></telerik:RadToolBarButton>
                                                        <telerik:RadToolBarButton Value="separator1" runat="server" IsSeparator="True" meta:resourcekey="RadToolBarButtonResource2" ></telerik:RadToolBarButton>
                                                        <telerik:RadToolBarButton Value="delete" runat="server" Text="刪除" ImageUrl="~/Common/Images/Icon/icon_m46.gif" meta:resourcekey="RadToolBarButtonResource3" CausesValidation="False" ></telerik:RadToolBarButton>
                                                        <telerik:RadToolBarButton Value="separator2" runat="server" IsSeparator="True" meta:resourcekey="RadToolBarButtonResource4" ></telerik:RadToolBarButton>
                                                        <telerik:RadToolBarButton Value="eliminate" runat="server" >
                                                            <ItemTemplate>
                                                                <asp:CheckBox ID="cbEliminateFiler" runat="server" Text="歸檔者匯出表單結果不受表單欄位觀看權限控制" meta:resourcekey="cbEliminateFilerResource1" />
                                                            </ItemTemplate>
                                                        </telerik:RadToolBarButton>
                                                        <telerik:RadToolBarButton runat="server" IsSeparator="True" meta:resourcekey="RadToolBarButtonResource6"></telerik:RadToolBarButton>
                                                    </Items>
                                                </telerik:RadToolBar>
                                            </tr>
                                            <tr>
                                                <td style="width: 100%">
                                                    <Fast:Grid ID="gridArchive" runat="server" Width="100%"
                                                        AllowSorting="True"
                                                        AutoGenerateCheckBoxColumn="True"
                                                        AutoGenerateColumns="False"
                                                        CustomDropDownListPage="False"
                                                        DataKeyNames="ARCHIVE_RM_ID"
                                                        DataKeyOnClientWithCheckBox="False"
                                                        DefaultSortDirection="Ascending"
                                                        EnhancePager="True"
                                                        EmptyDataText="No data found"
                                                        KeepSelectedRows="False"
                                                        OnRowCommand="gridArchive_RowCommand"
                                                        OnRowDataBound="gridArchive_RowDataBound"
                                                        PageSize="15"
                                                        SelectedRowColor=""
                                                        UnSelectedRowColor="" meta:resourcekey="gridArchiveResource1">
                                                        <EnhancePagerSettings ShowHeaderPager="True" />
                                                        <ExportExcelSettings AllowExportToExcel="False" />
                                                        <Columns>
                                                            <asp:BoundField DataField="ARCHIVE_RM_ID" Visible="False" meta:resourcekey="BoundFieldResource1" />
                                                            <asp:TemplateField HeaderText="歸檔人員" meta:resourcekey="TemplateFieldResource2">
                                                                <ItemTemplate>
                                                                    <uc1:UC_ChoiceList ID="choiceArchive" runat="server" ChioceType="User" IsAllowEdit="false" />
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="可查詢部門" meta:resourcekey="TemplateFieldResource1">
                                                                <ItemTemplate>
                                                                    <uc1:UC_ChoiceList ID="choiceDept" runat="server" ChioceType="Group" IsAllowEdit="false" />
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="操作" meta:resourcekey="TemplateFieldResource3">
                                                                <ItemTemplate>
                                                                    <asp:LinkButton ID="lbtnEdit" runat="server" Text="編輯" CausesValidation="False" meta:resourcekey="btnEditResource1" ></asp:LinkButton>
                                                                </ItemTemplate>
                                                                <ItemStyle HorizontalAlign="Center" Wrap="False" />
                                                            </asp:TemplateField>
                                                        </Columns>
                                                    </Fast:Grid>
                                                </td>
                                            </tr>
                                        </table>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </td>
                        </tr>
                        <tr>
                            <td style="white-space: nowrap;">
                                <asp:Label ID="lblFormReaderTitle" runat="server" Text="表單查閱者" meta:resourcekey="lblFormReaderTitleResource1"></asp:Label>
                            </td>
                            <td colspan="3">
                                <asp:UpdatePanel ID="updatePanelReader" runat="server" UpdateMode="Conditional">
                                    <ContentTemplate>
                                        <table style="width: 100%">
                                            <tr>
                                                <telerik:RadToolBar ID="tbReader" runat="server" Width="100%"
                                                    OnButtonClick="tbReader_ButtonClick" OnClientButtonClicking="tbReaderClientClicking" meta:resourcekey="tbReaderResource1">
                                                    <Items>
                                                        <telerik:RadToolBarButton Value="setup" runat="server" Text="新增表單查閱者" ImageUrl="~/Common/Images/Icon/icon_m51.gif" CausesValidation="False" meta:resourcekey="RadToolBarButtonResource5" ></telerik:RadToolBarButton>
                                                        <telerik:RadToolBarButton Value="separator1" runat="server" IsSeparator="True" meta:resourcekey="RadToolBarButtonResource6" ></telerik:RadToolBarButton>
                                                        <telerik:RadToolBarButton Value="delete" runat="server" Text="刪除" ImageUrl="~/Common/Images/Icon/icon_m46.gif" CausesValidation="False" meta:resourcekey="RadToolBarButtonResource7" ></telerik:RadToolBarButton>
                                                        <telerik:RadToolBarButton Value="separator2" runat="server" IsSeparator="True" meta:resourcekey="RadToolBarButtonResource8" ></telerik:RadToolBarButton>
                                                    </Items>
                                                </telerik:RadToolBar>
                                            </tr>
                                            <tr>
                                                <td style="width: 100%">
                                                    <Fast:Grid ID="gridReader" runat="server" Width="100%"
                                                        AllowSorting="True"
                                                        AutoGenerateCheckBoxColumn="True"
                                                        AutoGenerateColumns="False"
                                                        CustomDropDownListPage="False"
                                                        DataKeyNames="READER_RM_ID"
                                                        DataKeyOnClientWithCheckBox="False"
                                                        DefaultSortDirection="Ascending"
                                                        EnhancePager="True"
                                                        EmptyDataText="No data found"
                                                        KeepSelectedRows="False"
                                                        OnRowCommand="gridReader_RowCommand"
                                                        OnRowDataBound="gridReader_RowDataBound"
                                                        PageSize="15">
                                                        <EnhancePagerSettings ShowHeaderPager="True" />
                                                        <ExportExcelSettings AllowExportToExcel="False" />
                                                        <Columns>
                                                            <asp:BoundField DataField="READER_RM_ID" Visible="False" meta:resourcekey="BoundFieldResource2" />
                                                            <asp:TemplateField HeaderText="表單查閱者" meta:resourcekey="TemplateFieldResource4">
                                                                <ItemTemplate>
                                                                    <uc1:UC_ChoiceList ID="choiceListReader" runat="server" ChioceType="User" IsAllowEdit="false" />
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="可查詢部門" meta:resourcekey="TemplateFieldResource1">
                                                                <ItemTemplate>
                                                                    <uc1:UC_ChoiceList ID="choiceDeptReader" runat="server" ChioceType="Group" IsAllowEdit="false" />
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="操作" meta:resourcekey="TemplateFieldResource3">
                                                                <ItemTemplate>
                                                                    <asp:LinkButton ID="lbtnEditReader" runat="server" Text="編輯" CausesValidation="False" meta:resourcekey="btnEditResource1"></asp:LinkButton>
                                                                </ItemTemplate>
                                                                <ItemStyle HorizontalAlign="Center" Wrap="False" />
                                                            </asp:TemplateField>
                                                        </Columns>
                                                    </Fast:Grid>
                                                </td>
                                            </tr>
                                        </table>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </ContentTemplate>
</asp:UpdatePanel>

<asp:Label ID="lblFiller" CssClass="FillerVisible" runat="server" ></asp:Label>
<asp:Label ID="lblModifier" runat="server" Visible="False" ></asp:Label>
<asp:Label ID="lblMsgSigner" runat="server" Text="填寫者" Visible="False" meta:resourcekey="lblMsgSignerResource1"></asp:Label>
<asp:Label ID="lblMsgEditor" runat="server" Text="修改者" Visible="False" meta:resourcekey="lblMsgEditorResource1"></asp:Label>
<asp:Label ID="lblAuthorityMsg" runat="server" Text="具填寫權限人員" Visible="False" meta:resourcekey="lblAuthorityMsgResource1"></asp:Label>

<asp:Label ID="lblConfirmArchive" runat="server" Text="是否要刪除歸檔處理者" Visible="False" meta:resourcekey="lblConfirmArchiveResource1"></asp:Label>
<asp:Label ID="lblConfirmReader" runat="server" Text="是否要刪除表單查閱者" Visible="False" meta:resourcekey="lblConfirmReaderResource1"></asp:Label>
<asp:Label ID="lblNotAllowMobileSign" runat="server" Text="此表單不允許在行動裝置操作" Visible="False" meta:resourcekey="lblNotAllowMobileSignResource1"></asp:Label>
<asp:Label ID="lblFormIsApproval" runat="server" Text="表單審核中，不可重複送審。" Visible="False" meta:resourcekey="lblFormIsApprovalResource1"></asp:Label>
<asp:Label ID="lblFormWaitRelease" runat="server" Text="表單待發佈中，不可重複送審。" Visible="False" meta:resourcekey="lblFormWaitReleaseResource1"></asp:Label>

<asp:HiddenField ID="hfReleaseFormId" runat="server" />
<asp:HiddenField ID="hfReleaseFormVerId" runat="server" />
<asp:HiddenField ID="hfReleaseFormVersionIsDeleted" runat="server" />
<asp:HiddenField ID="hfReleaseFormFlowId" runat="server" />
<asp:HiddenField ID="hfReleaseType" runat="server" />

<asp:HiddenField ID="hfFormVersionId" runat="server" />
<asp:HiddenField ID="hfScriptId" runat="server" />
<asp:HiddenField ID="hfFieldMode" runat="server" />
<asp:HiddenField ID="hfAllowMobileSign" runat="server" />
<asp:HiddenField ID="hfIsFromSignForm" runat="server" />
<asp:HiddenField ID="hfTaskId" runat="server" />
