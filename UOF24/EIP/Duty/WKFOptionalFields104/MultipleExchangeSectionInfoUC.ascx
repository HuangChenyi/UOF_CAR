<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="MultipleExchangeSectionInfoUC.ascx.cs" Inherits="Ede.Uof.Web.EIP.Duty.WKFOptionalFields104.MultipleExchangeSectionInfoUC" %>
<%@ Reference Control="~/WKF/FormManagement/VersionFieldUserControl/VersionFieldUC.ascx" %>

<%@ Register Src="../../../Common/ChoiceCenter/UC_ChoiceList.ascx" TagPrefix="uc1" TagName="UC_ChoiceList" %>
<%@ Register Src="~/Common/ChoiceCenter/UC_ChoiceListMobile.ascx" TagPrefix="uc2" TagName="UC_ChoiceListMobile" %>

<style type="text/css">
    .cssHidden{
        display: none;
    }

    .labelMutiline {
      white-space:pre-wrap;
    }
</style>

<script type="text/javascript">

    function CheckExchangeSection(source, args) {

        // 判斷是否支援調班單
        if ($('#<%=hfIsAllowApply.ClientID%>').val() == 'false') {
            source.textContent = $("#<%=lblNotAllowApply.ClientID%>").text();
            args.IsValid = false;
            return;
        }

        // 調班人員驗證
        var checkExchangeUser = CheckExchangeUser(source, args);
        if (!checkExchangeUser) {
            return;
        }

        // 異動後班別必填
        var checkSectionRequired = CheckSectionRequired(source, args);
        if (!checkSectionRequired) {
            return;
        }

        // 檢查調班日期必填 & 起訖大小比較
        var checkDate = CheckDateRequired(source, args);
        if (!checkDate) {
            return;
        }

        // 104 store procedure 驗證 & Uof在途驗證
        var check104 = CheckExchangeSectionLogic(source, args);
        if (!check104) {
            return;
        }
    }

    /**
     * 調班人員驗證
     * @param source
     * @param args
     */
    function CheckExchangeUser(source, args) {
        var result = true;
        var choiceList = null;

        if ($("#<%=hfIsMobileUI.ClientID%>").val() === 'true') {
            choiceList = $("#choiceListMobile > .Tokenize > .TokensContainer > li.Token");
        }
        else {
            choiceList = $("#<%=UC_ChoiceList.ClientID%>_listViewBorder .UserSetItem");
        }

        if (choiceList.length === 0 && choiceList != null) {
            source.textContent = $("#<%=lblSelectRequired.ClientID%>").text();
            args.IsValid = false;
            result = false;
        }

        if (choiceList.length > 0 && choiceList != null && $("#<%=lblSameCompany.ClientID%>").text().trim() != '') {
            source.textContent = $("#<%=lblMustSameCompany.ClientID%>").text();
            args.IsValid = false;
            result = false;
        }

        return result;
    }

    /**
     * 異動後班別必填驗證
     * @param source
     * @param args
     */
    function CheckSectionRequired(source, args) {
        var result = true;

        var sectionCode = $("#<%=ddlSection.ClientID%>").val();
        if (sectionCode === 'select') {
            source.textContent = $("#<%=lblSectionRequired.ClientID%>").text();
            args.IsValid = false;
            result = false;
        }

        return result;
    }

    /**
     * 檢查調班日期必填 & 起訖大小比較
     * @param source
     * @param args
     */
    function CheckDateRequired(source, args) {
        var startDateStr = $("#<%=lblExchangeStartDate.ClientID%>").text();
        var endDateStr = $("#<%=lblExchangeEndDate.ClientID%>").text();
        var startDate = new Date(startDateStr);
        var endDate = new Date(endDateStr);

        if (startDateStr.trim() == '' || endDateStr.trim() == '') {
            source.textContent = $("#<%=lblDateRequired.ClientID%>").text();
            args.IsValid = false;
            return false;
        }

        if (startDate > endDate) {
            source.textContent = $("#<%=lblDateRangeError.ClientID%>").text();
            args.IsValid = false;
            return false;
        }

        return true;
    }

    /**
     * 104 store procedure 驗證 & Uof在途驗證
     * @param source
     * @param args
     */
    function CheckExchangeSectionLogic(source, args) {

        var result = true;
        var map = {};

        var userGuidStr = $("#<%=hfUserGuidList.ClientID%>").val();
        if (userGuidStr != '') {

            var companyUnifiedId = $("#<%=hfExchangeCompanyUnifiedId.ClientID%>").val();
            var sectionCode = $("#<%=ddlSection.ClientID%>").val();
            var startDate = $("#<%=lblExchangeStartDate.ClientID%>").text();
            var endDate = $("#<%=lblExchangeEndDate.ClientID%>").text();
            var docNbr = $('#<%=hfDocNbr.ClientID%>').val();

            var userGuidList = JSON.parse(userGuidStr);

            for (var i = 0; i < userGuidList.length; i++) {
                var errorList = [];
                var userGuid = userGuidList[i];
                var checkData = [companyUnifiedId, userGuid, sectionCode, startDate, endDate, docNbr];

                // 104檢查
                var result = $uof.pageMethod.syncUc("EIP/Duty/WKFOptionalFields104/MultipleExchangeSectionInfoUC.ascx", "Check104ExchangeSection", checkData);
                if (result != '') {
                    errorList.push(result);
                }

                // uof在途檢查
                var exchangingResult = $uof.pageMethod.syncUc("EIP/Duty/WKFOptionalFields104/MultipleExchangeSectionInfoUC.ascx", "CheckUofExchanging", checkData);
                if (exchangingResult != '') {
                    errorList.push(exchangingResult);
                }

                if (errorList.length > 0) {
                    map[userGuid] = errorList;
                }
            }
        }

        if (Object.keys(map).length > 0) {
            $("#<%=hfErrorInfo.ClientID%>").val(JSON.stringify(map));
            var test = $("#<%=hfErrorInfo.ClientID%>").val();
            $("#<%=lbtnErrorInfo.ClientID%>").css('display', '');
            source.textContent = '';
            args.IsValid = false;
            result = false;
        }
        else {
            $("#<%=hfErrorInfo.ClientID%>").val('');
            $("#<%=lbtnErrorInfo.ClientID%>").css('display', 'none');
        }

        return result;
    }

    /**
     * 事由必填
     * @param source
     * @param args
     */
    function CheckRemarkRequired(source, args) {

        // 如果不支援調班單，則不用再多做此驗證
        if ($('#<%=hfIsAllowApply.ClientID%>').val() == 'false') {
            return;
        }

        var remark = $("#<%=txtRemark.ClientID%>");
        if (remark && remark.val().trim()==="") {
            args.IsValid = false;
        }
    }

    function OpenErrorInfo() {

        var errorInfoObj = "<%=hfErrorInfo.ClientID %>";
        var isMobileUI = $("#<%=hfIsMobileUI.ClientID%>").val();

        var param = {
            "errorInfo": errorInfoObj,
            "isMobileUI": isMobileUI
        }


        if ($("#<%=hfIsMobileUI.ClientID%>").val() === 'true') {
            $uof.dialog.open2("~/HR104/Duty/Report/MultipleExchangeSectionErrorInfoMobile.aspx", "", $("#<%=lblErrorInfoTitle.ClientID%>").text(), 1080, 800, openErrorInfoDialogResult, param);
        }
        else {
            $uof.dialog.open2("~/HR104/Duty/Report/MultipleExchangeSectionErrorInfo.aspx", "", $("#<%=lblErrorInfoTitle.ClientID%>").text(), 1080, 800, openErrorInfoDialogResult, param);
        }
    }

    function openErrorInfoDialogResult(returnValue) {
        if (typeof (returnValue) == 'undefined' || returnValue == null) {
            return false;
        }
        else {
            return true;
        }
    }
</script>

<asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>
        <table class="PopTable" style="width: 100%">
            <tr>
                <td>
                    <asp:Label ID="Label1" runat="server" Text="*" ForeColor="Red" meta:resourcekey="Label1Resource1"></asp:Label>
                    <asp:Label ID="Label2" runat="server" Text="調班人員" meta:resourcekey="Label2Resource1"></asp:Label>
                </td>
                <td colspan="3">
                    <div style="display:none;">
                        <uc2:UC_ChoiceListMobile runat="server" ID="UC_ChoiceListMobile" ChioceType="User"/>
                    </div>
                    <uc1:UC_ChoiceList runat="server" ID="UC_ChoiceList" ChioceType="All" ShowEmployee="true" ShowMember="false" DefaultTab="Employee"/>
                    <asp:Label ID="lblSameCompany" runat="server" ForeColor="Red" meta:resourcekey="lblSameCompanyResource1"></asp:Label>
                    <asp:HiddenField ID="hfUserGuidList" runat="server" />
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label3" runat="server" Text="*" ForeColor="Red" meta:resourcekey="Label3Resource1"></asp:Label>
                    <asp:Label ID="Label4" runat="server" Text="調班日期(起)" meta:resourcekey="Label4Resource1"></asp:Label>
                </td>
                <td>
                    <telerik:RadDatePicker ID="rdpExchangeStartDate" OnSelectedDateChanged="rdpExchangeStartDate_SelectedDateChanged" AutoPostBack="True" runat="server"  meta:resourcekey="rdpExchangeStartDateResource1">
                        <Calendar Culture="zh-TW" EnableWeekends="True" FastNavigationNextText="&amp;lt;&amp;lt;" UseColumnHeadersAsSelectors="False" UseRowHeadersAsSelectors="False">
                        </Calendar>
                        <DateInput AutoPostBack="True" DateFormat="yyyy/M/d" DisplayDateFormat="yyyy/M/d" LabelWidth="64px" Width="">
                            <EmptyMessageStyle Resize="None" />
                            <ReadOnlyStyle Resize="None" />
                            <FocusedStyle Resize="None" />
                            <DisabledStyle Resize="None" />
                            <InvalidStyle Resize="None" />
                            <HoveredStyle Resize="None" />
                            <EnabledStyle Resize="None" />
                        </DateInput>
                        <DatePopupButton CssClass="" HoverImageUrl="" ImageUrl="" />
                    </telerik:RadDatePicker>
                    <asp:Label ID="lblExchangeStartDate" runat="server" meta:resourcekey="lblExchangeStartDateResource1" ></asp:Label>
                </td>
                <td>
                    <asp:Label ID="Label5" runat="server" Text="*" ForeColor="Red" meta:resourcekey="Label5Resource1"></asp:Label>
                    <asp:Label ID="Label6" runat="server" Text="調班日期(訖)" meta:resourcekey="Label6Resource1"></asp:Label>
                </td>
                <td>
                    <telerik:RadDatePicker ID="rdpExchangeEndDate" OnSelectedDateChanged="rdpExchangeEndDate_SelectedDateChanged" AutoPostBack="True" runat="server"  meta:resourcekey="rdpExchangeEndDateResource1">
                        <Calendar Culture="zh-TW" EnableWeekends="True" FastNavigationNextText="&amp;lt;&amp;lt;" UseColumnHeadersAsSelectors="False" UseRowHeadersAsSelectors="False">
                        </Calendar>
                        <DateInput AutoPostBack="True" DateFormat="yyyy/M/d" DisplayDateFormat="yyyy/M/d" LabelWidth="64px" Width="">
                            <EmptyMessageStyle Resize="None" />
                            <ReadOnlyStyle Resize="None" />
                            <FocusedStyle Resize="None" />
                            <DisabledStyle Resize="None" />
                            <InvalidStyle Resize="None" />
                            <HoveredStyle Resize="None" />
                            <EnabledStyle Resize="None" />
                        </DateInput>
                        <DatePopupButton CssClass="" HoverImageUrl="" ImageUrl="" />
                    </telerik:RadDatePicker>
                    <asp:Label ID="lblExchangeEndDate" runat="server" meta:resourcekey="lblExchangeEndDateResource1" ></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label7" runat="server" Text="*" ForeColor="Red" meta:resourcekey="Label7Resource1"></asp:Label>
                    <asp:Label ID="Label9" runat="server" Text="異動後班別" meta:resourcekey="Label9Resource1"></asp:Label>
                </td>
                <td colspan="3">
                    <asp:DropDownList ID="ddlSection" OnSelectedIndexChanged="ddlSection_SelectedIndexChanged" AutoPostBack="True" runat="server" Width="250px" meta:resourcekey="ddlSectionResource1"></asp:DropDownList>
                    <asp:Label ID="lblSectionVal" runat="server" CssClass="cssHidden" meta:resourcekey="lblSectionValResource1"></asp:Label>
                    <asp:Label ID="lblSectionText" runat="server" meta:resourcekey="lblSectionTextResource1"></asp:Label>
                    <br />
                    <asp:Label ID="lblSectionNotExist" runat="server" Text="選擇班別已不適用，請通知管理員至104系統中檢查相關設定" ForeColor="Blue" Visible="False" meta:resourcekey="lblSectionNotExistResource1"></asp:Label>
                </td>
            </tr>
            <tr>
                <td style="white-space: nowrap">
                    <asp:Label ID="lblRemarkTitleRequired" runat="server" Text="*" ForeColor="Red" meta:resourcekey="lblRemarkTitleRequiredResource1"></asp:Label>
                    <asp:Label ID="Label8" runat="server" Text="事由" meta:resourcekey="Label8Resource1"></asp:Label>
                </td>
                <td colspan="3">
                    <asp:TextBox ID="txtRemark" runat="server" Width="100%" TextMode="MultiLine" Rows="3" meta:resourcekey="txtRemarkResource1"></asp:TextBox>
                    <asp:Label ID="lblRemark" CssClass="labelMutiline" runat="server" meta:resourcekey="lblRemarkResource1"></asp:Label>
                </td>
            </tr>
        </table>

        <table>
            <tr>
                <td>
                    <asp:LinkButton ID="lbtnErrorInfo" Text="點此查看錯誤資訊" ForeColor="Blue" OnClientClick="javascript:OpenErrorInfo(); return false;" CausesValidation="False" style="display: none;" runat="server" meta:resourcekey="lbtnErrorInfoResource1"></asp:LinkButton>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:CustomValidator ID="cvExchangeSection" runat="server" Display="Dynamic" ForeColor="Red" ClientValidationFunction="CheckExchangeSection" meta:resourcekey="cvExchangeSectionResource1"></asp:CustomValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:CustomValidator ID="cvRemark" runat="server" Display="Dynamic" ForeColor="Red" ErrorMessage="事由不可空白" ClientValidationFunction="CheckRemarkRequired" meta:resourcekey="cvRemarkResource1"></asp:CustomValidator>
                </td>
            </tr>
        </table>

        <asp:HiddenField ID="hfExchangeCompanyId" runat="server" />
        <asp:HiddenField ID="hfExchangeCompanyUnifiedId" runat="server" />
        <asp:HiddenField ID="hfErrorInfo" runat="server"/>
    </ContentTemplate>
</asp:UpdatePanel>

<asp:HiddenField ID="hfApplicantGuid" runat="server" />
<asp:HiddenField ID="hfApplicantEmployeeNo" runat="server" />
<asp:HiddenField ID="hfApplicantCompanyUnifiedId" runat="server" />
<asp:HiddenField ID="hfApplicantGroupId" runat="server" />
<asp:HiddenField ID="hfDocNbr" runat="server"/>
<asp:HiddenField ID="hfIsMobileUI" runat="server" />
<asp:HiddenField ID="hfAllowModify" runat="server" />
<asp:HiddenField ID="hfIsAudit" runat="server" />
<asp:HiddenField ID="hfIsAllowApply" runat="server"/>

<asp:Label ID="lblSelect" runat="server" Text="請選擇" CssClass="cssHidden" meta:resourcekey="lblSelectResource1"></asp:Label>
<asp:Label ID="lblErrorInfoTitle" runat="server" Text="錯誤訊息" CssClass="cssHidden" meta:resourcekey="lblErrorInfoTitleResource1"></asp:Label>

<asp:Label ID="lblMustSameCompany" runat="server" Text="所有調班人員必須皆為同一間公司" CssClass="cssHidden" meta:resourcekey="lblMustSameCompanyResource1"></asp:Label>
<asp:Label ID="lblSelectRequired" runat="server" Text="必須選擇調班人員" CssClass="cssHidden" meta:resourcekey="lblSelectRequiredResource1"></asp:Label>
<asp:Label ID="lblSectionRequired" runat="server" Text="請選擇異動後班別" CssClass="cssHidden" meta:resourcekey="lblSectionRequiredResource1"></asp:Label>
<asp:Label ID="lblDateRequired" runat="server" Text="調班日期不可為空"  CssClass="cssHidden" meta:resourcekey="lblDateRequiredResource1"></asp:Label>
<asp:Label ID="lblDateRangeError" runat="server" Text="調班日期(起)不可晚於調班日期(訖)"  CssClass="cssHidden" meta:resourcekey="lblDateRangeErrorResource1"></asp:Label>
<asp:Label ID="lblNotAllowApply" runat="server" Text="不允許申請此張表單，請洽系統管理員。" CssClass="cssHidden" meta:resourcekey="lblNotAllowApplyResource1"></asp:Label>

<asp:Label ID="lblFiller" CssClass="FillerVisible" runat="server" meta:resourcekey="lblFillerResource1"></asp:Label>
<asp:Label ID="lblHasNoAuthority" runat="server" Text="無填寫權限" ForeColor="Red" Visible="False" meta:resourcekey="lblHasNoAuthorityResource1"></asp:Label>
<asp:Label ID="lblToolTipMsg" runat="server" Text="不允許修改(唯讀)" Visible="False" meta:resourcekey="lblToolTipMsgResource1"></asp:Label>
<asp:Label ID="lblModifier" runat="server" Visible="False" meta:resourcekey="lblModifierResource1"></asp:Label>
<asp:Label ID="lblMsgSigner" runat="server" Text="填寫者" Visible="False" meta:resourcekey="lblMsgSignerResource1"></asp:Label>
<asp:Label ID="lblMsgEditor" runat="server" Text="修改者" Visible="False" meta:resourcekey="lblMsgEditorResource1"></asp:Label>
<asp:Label ID="lblAuthorityMsg" runat="server" Text="具填寫權限人員" Visible="False" meta:resourcekey="lblAuthorityMsgResource1"></asp:Label>
