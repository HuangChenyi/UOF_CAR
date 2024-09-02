<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="SingleExchangeSectionInfoUC.ascx.cs" Inherits="Ede.Uof.Web.EIP.Duty.WKFOptionalFields104.SingleExchangeSectionInfoUC" %>
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

        // 調班類型
        var exchangeType = $("#<%=ddlExchangeType.ClientID%>").val();

        // 調班人員數量驗證
        var checkResult = CheckExchangeUserCount(source, args, exchangeType)
        if (!checkResult) {
            return;
        }

        // 班別檢查
        var checkSectionResult = CheckSection(source, args, exchangeType);
        if (!checkSectionResult) {
            return;
        }

        // 表單編號
        var docNbr = $('#<%=hfDocNbr.ClientID%>').val();

        if (exchangeType === 'Date') {
            var companyUnifiedId = $('#<%=lblCompanyUnifiedIdSingle.ClientID%>').text();
            var employeeNo = $('#<%=lblEmployeeNoSingle.ClientID%>').text();
            var date1 = $("#<%=lblExchangeDateSingle1.ClientID%>").text();
            var date2 = $("#<%=lblExchangeDateSingle2.ClientID%>").text();

            var sectionVal1 = $("#<%=lblSingleSectionVal1.ClientID%>").text();
            var sectionText1 = $("#<%=lblSingleSection1.ClientID%>").text();
            var sectionVal2 = $("#<%=lblSingleSectionVal2.ClientID%>").text();
            var sectionText2 = $("#<%=lblSingleSection2.ClientID%>").text();
            var sectionCode1 = $("#<%=lblSingleSectionCode1.ClientID%>").text();
            var sectionCode2 = $("#<%=lblSingleSectionCode2.ClientID%>").text();

            var obj = {
                docNbr: docNbr,
                exchangeType: 'Date',
                companyUnifiedId: companyUnifiedId,
                employeeNo1: employeeNo,
                employeeNo2: '',
                exchangeDate1: date1,
                exchangeDate2: date2,
                sectionCode1: sectionCode1,
                sectionCode2: sectionCode2
            };

            var jsonStr = JSON.stringify(obj);
            var checkData = [jsonStr];
            var result = $uof.pageMethod.syncUc("EIP/Duty/WKFOptionalFields104/SingleExchangeSectionInfoUC.ascx", "CheckExchangeSection", checkData);
            if (result != '') {
                source.innerHTML  = result;
                args.IsValid = false;
            }
        }
        else if (exchangeType === 'Person') {

            // 先檢查兩個人員是否屬於同公司
            var companyUnifiedId1 = $('#<%=lblCompanyUnifiedIdPerson1.ClientID%>').text();
            var companyUnifiedId2 = $('#<%=lblCompanyUnifiedIdPerson2.ClientID%>').text();
            if (companyUnifiedId1 !== companyUnifiedId2) {
                source.textContent = $("#<%=lblSameCompany.ClientID%>").text();
                args.IsValid = false;
                return;
            }

            var employeeNo1 = $('#<%=lblEmployeeNoPerson1.ClientID%>').text();
            var employeeNo2 = $('#<%=lblEmployeeNoPerson2.ClientID%>').text();

            var date = $("#<%=lblExchangeDatePerson.ClientID%>").text();

            var sectionVal1 = $("#<%=lblPersonSectionVal1.ClientID%>").text();
            var sectionText1 = $("#<%=lblPersonSection1.ClientID%>").text();
            var sectionVal2 = $("#<%=lblPersonSectionVal2.ClientID%>").text();
            var sectionText2 = $("#<%=lblPersonSection2.ClientID%>").text();
            var sectionCode1 = $("#<%=lblPersonSectionCode1.ClientID%>").text();
            var sectionCode2 = $("#<%=lblPersonSectionCode2.ClientID%>").text();

            var obj = {
                docNbr: docNbr,
                exchangeType: 'Person',
                companyUnifiedId: companyUnifiedId1,
                employeeNo1: employeeNo1,
                employeeNo2: employeeNo2,
                exchangeDate1: date,
                exchangeDate2: '',
                sectionCode1: sectionCode1,
                sectionCode2: sectionCode2
            };

            var jsonStr = JSON.stringify(obj);
            var checkData = [jsonStr];
            var result = $uof.pageMethod.syncUc("EIP/Duty/WKFOptionalFields104/SingleExchangeSectionInfoUC.ascx", "CheckExchangeSection", checkData);
            if (result != '') {
                source.innerHTML = result;
                args.IsValid = false;
            }
        }
    }

    /**
     * 調班人員數量驗證
     * @param source
     * @param args
     * @param exchangeType
     */
    function CheckExchangeUserCount(source, args, exchangeType) {
        var result = true;

        if (exchangeType === 'Date') {
            var choiceList = null;

            if ($("#<%=hfIsMobileUI.ClientID%>").val() === 'true') {
                choiceList = $("#mobileSingle > .Tokenize > .TokensContainer > li.Token");
            }
            else {
                choiceList = $("#<%=UC_ChoiceList_Single.ClientID%>_listViewBorder .UserSetItem");
            }

            if (choiceList.length === 0 && choiceList != null) {
                source.textContent = $("#<%=lblSelectRequired.ClientID%>").text();
                args.IsValid = false;
                result = false;
            }
            else if (choiceList.length >= 2 && choiceList != null){
                source.textContent = $("#<%=lblSelectOne.ClientID%>").text();
                args.IsValid = false;
                result = false;
            }
        }
        else if (exchangeType === 'Person') {
            var choiceList1 = null;
            var choiceList2 = null;

            if ($("#<%=hfIsMobileUI.ClientID%>").val() === 'true') {
                choiceList1 = $("#mobilePerson1 > .Tokenize > .TokensContainer > li.Token");
                choiceList2 = $("#mobilePerson2 > .Tokenize > .TokensContainer > li.Token");
            }
            else {
                choiceList1 = $("#<%=UC_ChoiceList_Person1.ClientID%>_listViewBorder .UserSetItem");
                choiceList2 = $("#<%=UC_ChoiceList_Person2.ClientID%>_listViewBorder .UserSetItem");
            }
            
            if (choiceList1.length === 0 && choiceList1 != null) {
                source.textContent = $("#<%=lblSelectRequired.ClientID%>").text();
                args.IsValid = false;
                result = false;
            }
            else if (choiceList1.length >= 2 && choiceList1 != null){
                source.textContent = $("#<%=lblSelectOne.ClientID%>").text();
                args.IsValid = false;
                result = false;
            }

            if (choiceList2.length === 0 && choiceList2 != null) {
                source.textContent = $("#<%=lblSelectRequired.ClientID%>").text();
                args.IsValid = false;
                result = false;
            }
            else if (choiceList2.length >= 2 && choiceList2 != null){
                source.textContent = $("#<%=lblSelectOne.ClientID%>").text();
                args.IsValid = false;
                result = false;
            }
        }

        return result;
    }

    /**
     *  檢查班別邏輯
     * @param source
     * @param args
     */
    function CheckSection(source, args, exchangeType) {
        var sectionVal1 = '';
        var sectionVal2 = '';
        var sectionCode1 = '';
        var sectionCode2 = '';
        var date1 = '';
        var date2 = '';
        var employeeNo1 = '';
        var employeeNo2 = '';
        var userGuid1 = '';
        var userGuid2 = '';
        var companyUnifiedId1 = '';
        var companyUnifiedId2 = '';


        if (exchangeType === 'Date') {
            sectionVal1 = $("#<%=lblSingleSectionVal1.ClientID%>").text();
            sectionVal2 = $("#<%=lblSingleSectionVal2.ClientID%>").text();
            sectionCode1 = $("#<%=lblSingleSectionCode1.ClientID%>").text();
            sectionCode2 = $("#<%=lblSingleSectionCode2.ClientID%>").text();
            date1 = $("#<%=lblExchangeDateSingle1.ClientID%>").text();
            date2 = $("#<%=lblExchangeDateSingle2.ClientID%>").text();
            employeeNo1 = $("#<%=lblEmployeeNoSingle.ClientID%>").text();
            employeeNo2 = $("#<%=lblEmployeeNoSingle.ClientID%>").text();
            userGuid1 = $("#<%=lblUserGuidSingle.ClientID%>").text();
            userGuid2 = $("#<%=lblUserGuidSingle.ClientID%>").text();
            companyUnifiedId1 = $("#<%=lblCompanyUnifiedIdSingle.ClientID%>").text();
            companyUnifiedId2 = $("#<%=lblCompanyUnifiedIdSingle.ClientID%>").text();
        }
        else if (exchangeType === 'Person') {
            sectionVal1 = $("#<%=lblPersonSectionVal1.ClientID%>").text();
            sectionVal2 = $("#<%=lblPersonSectionVal2.ClientID%>").text();
            sectionCode1 = $("#<%=lblPersonSectionCode1.ClientID%>").text();
            sectionCode2 = $("#<%=lblPersonSectionCode2.ClientID%>").text();
            date1 = $("#<%=lblExchangeDatePerson.ClientID%>").text();
            date2 = $("#<%=lblExchangeDatePerson.ClientID%>").text();
            employeeNo1 = $("#<%=lblEmployeeNoPerson1.ClientID%>").text();
            employeeNo2 = $("#<%=lblEmployeeNoPerson2.ClientID%>").text();
            userGuid1 = $("#<%=lblUserGuidPerson1.ClientID%>").text();
            userGuid2 = $("#<%=lblUserGuidPerson2.ClientID%>").text();
            companyUnifiedId1 = $("#<%=lblCompanyUnifiedIdPerson1.ClientID%>").text();
            companyUnifiedId2 = $("#<%=lblCompanyUnifiedIdPerson2.ClientID%>").text();
        }

        var result = true;

        // 檢查班別是否為空、錯誤、沒排班
        if (sectionVal1 == '' || sectionVal2 == '') {
            source.textContent = $("#<%=lblSectionEmpty.ClientID%>").text();
            args.IsValid = false;
            result = false;
        }
        else if (sectionVal1 == 'Error' || sectionVal2 == 'Error') {
            source.textContent = $("#<%=lblSectionError.ClientID%>").text();
            args.IsValid = false;
            result = false;
        }
        else if (sectionVal1 == 'None' || sectionVal2 == 'None') {
            source.textContent = $("#<%=lblSectionNone.ClientID%>").text();
            args.IsValid = false;
            result = false;
        }

        if(result == false) return result;

        // 判斷當前班別是否跟104所設定的一致
        checkData = [sectionVal1, sectionVal2, sectionCode1, sectionCode2, date1, date2, employeeNo1, employeeNo2, userGuid1, userGuid2, companyUnifiedId1, companyUnifiedId2];
        var result = $uof.pageMethod.syncUc("EIP/Duty/WKFOptionalFields104/SingleExchangeSectionInfoUC.ascx", "CheckSectionIdentical", checkData);
        var resultList = JSON.parse(result);

        var finalStr = '';
        var check1 = resultList[0];
        var check2 = resultList[1];
        if (check1 != '') {
            var errorMsg = $("#<%=lblNotIdentical.ClientID%>").text();
            finalStr += errorMsg.replace('{0}', check1).replace('{1}', date1) + '<br/>';
        }
        if (check2 != '') {
            var errorMsg = $("#<%=lblNotIdentical.ClientID%>").text();
            finalStr += errorMsg.replace('{0}', check2).replace('{1}', date2) + '<br/>';
        }

        if (finalStr != '') {
            source.innerHTML = finalStr;
            args.IsValid = false;
            result = false;
        }

        return result
    }

    /**
     * 檢查調班類型必填
     * @param source
     * @param args
     */
    function CheckExchangeType(source, args) {

        // 如果不支援調班單，則不用再多做此驗證
        if ($('#<%=hfIsAllowApply.ClientID%>').val() == 'false') {
            return;
        }

        var exchangeType = $("#<%=lblExchangeType.ClientID%>").text();
        if (exchangeType.trim() == '') {
            args.IsValid = false;
        }
        else {
            args.IsValid = true;
        }
    }

    /**
     * 檢查調班日期必填
     * @param source
     * @param args
     */
    function CheckExchageDate(source, args) {

        // 如果不支援調班單，則不用再多做此驗證
        if ($('#<%=hfIsAllowApply.ClientID%>').val() == 'false') {
            return;
        }

        var exchangeType = $("#<%=ddlExchangeType.ClientID%>").val();

        if (exchangeType === 'Date') {
            var date1 = $("#<%=lblExchangeDateSingle1.ClientID%>").text();
            var date2 = $("#<%=lblExchangeDateSingle2.ClientID%>").text();
            if (date1.trim() == '' || date2.trim() == '') {
                args.IsValid = false;
            }
            else {
                args.IsValid = true;
            }
        }
        else if (exchangeType === 'Person') {
            var date = $("#<%=lblExchangeDatePerson.ClientID%>").text();
            if (date.trim() == '') {
                args.IsValid = false;
            }
            else {
                args.IsValid = true;
            }
        }
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
        else {
            args.IsValid = true;
        }
    }
</script>
<asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>
        <table class="PopTable" style="width: 100%">
            <tr>
                <td style="white-space: nowrap">
                    <asp:Label ID="Label2" runat="server" Text="*" ForeColor="Red" meta:resourcekey="Label2Resource1"></asp:Label>
                    <asp:Label ID="Label1" runat="server" Text="調班類型" meta:resourcekey="Label1Resource1"></asp:Label>
                </td>
                <td colspan="3">
                    <asp:DropDownList ID="ddlExchangeType" OnSelectedIndexChanged="ddlExchangeType_SelectedIndexChanged" AutoPostBack="True" runat="server" meta:resourcekey="ddlExchangeTypeResource1">
                        <asp:ListItem Text="不同日期互調" Value="Date" Selected="True" meta:resourcekey="ListItemResource1"></asp:ListItem>
                        <asp:ListItem Text="與他人調班" Value="Person" meta:resourcekey="ListItemResource2"></asp:ListItem>
                    </asp:DropDownList>
                    <asp:Label ID="lblExchangeType" runat="server" meta:resourcekey="lblExchangeTypeResource1"></asp:Label>
                </td>
            </tr>

            <asp:Panel ID="pnlDate" runat="server" meta:resourcekey="pnlDateResource1">
                <tr>
                    <td style="white-space: nowrap">
                        <asp:Label ID="Label3" runat="server" Text="*" ForeColor="Red" meta:resourcekey="Label3Resource1"></asp:Label>
                        <asp:Label ID="Label4" runat="server" Text="調班人員" meta:resourcekey="Label4Resource1"></asp:Label>
                    </td>
                    <td colspan="3">
                        <div style="display:none;">
                            <uc2:UC_ChoiceListMobile runat="server" ID="UC_ChoiceListMobile_Single" ChioceType="User"/>
                        </div>
                        <uc1:UC_ChoiceList runat="server" ID="UC_ChoiceList_Single" ChioceType="All" ShowEmployee="true" ShowMember="false" DefaultTab="Employee"/>
                        <asp:Label ID="lblSelectOneSingle" runat="server" ForeColor="Red" meta:resourcekey="lblSelectOneSingleResource1"></asp:Label>
                        <asp:Label ID="lblCompanyUnifiedIdSingle" runat="server" CssClass="cssHidden" meta:resourcekey="lblCompanyUnifiedIdSingleResource1"></asp:Label>
                        <asp:Label ID="lblEmployeeNoSingle" runat="server" CssClass="cssHidden" meta:resourcekey="lblEmployeeNoSingleResource1"></asp:Label>
                        <asp:Label ID="lblUserGuidSingle" runat="server" CssClass="cssHidden" meta:resourcekey="lblUserGuidSingleResource1"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td style="white-space: nowrap">
                        <asp:Label ID="Label6" runat="server" Text="*" ForeColor="Red" meta:resourcekey="Label6Resource1"></asp:Label>
                        <asp:Label ID="Label5" runat="server" Text="調班日期(1)" meta:resourcekey="Label5Resource1"></asp:Label>
                    </td>
                    <td style="width:25%">
                        <telerik:RadDatePicker ID="rdpExchangeDateSingle1" OnSelectedDateChanged="rdpExchangeDateSingle1_SelectedDateChanged" AutoPostBack="True" runat="server"  meta:resourcekey="rdpExchangeDateSingle1Resource1">
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
                        <asp:Label ID="lblExchangeDateSingle1" runat="server" meta:resourcekey="lblExchangeDateSingle1Resource1"></asp:Label>
                    </td>
                    <td style="white-space: nowrap">
                        <asp:Label ID="Label7" runat="server" Text="班別(1)" meta:resourcekey="Label7Resource1"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="lblSingleSection1" runat="server" meta:resourcekey="lblSingleSection1Resource1"></asp:Label>
                        <asp:Label ID="lblSingleSectionVal1" runat="server" CssClass="cssHidden" meta:resourcekey="lblSingleSectionVal1Resource1"></asp:Label>
                        <asp:Label ID="lblSingleSectionCode1" runat="server" CssClass="cssHidden" meta:resourcekey="lblSingleSectionCode1Resource1"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td style="white-space: nowrap">
                        <asp:Label ID="Label9" runat="server" Text="*" ForeColor="Red" meta:resourcekey="Label9Resource1"></asp:Label>
                        <asp:Label ID="Label10" runat="server" Text="調班日期(2)" meta:resourcekey="Label10Resource1"></asp:Label>
                    </td>
                    <td style="width:25%">
                        <telerik:RadDatePicker ID="rdpExchangeDateSingle2" OnSelectedDateChanged="rdpExchangeDateSingle2_SelectedDateChanged" AutoPostBack="True" runat="server"  meta:resourcekey="rdpExchangeDateSingle2Resource1">
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
                        <asp:Label ID="lblExchangeDateSingle2" runat="server" meta:resourcekey="lblExchangeDateSingle2Resource1"></asp:Label>
                    </td>
                    <td style="white-space: nowrap">
                        <asp:Label ID="Label12" runat="server" Text="班別(2)" meta:resourcekey="Label12Resource1"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="lblSingleSection2" runat="server" meta:resourcekey="lblSingleSection2Resource1"></asp:Label>
                        <asp:Label ID="lblSingleSectionVal2" runat="server" CssClass="cssHidden" meta:resourcekey="lblSingleSectionVal2Resource1"></asp:Label>
                        <asp:Label ID="lblSingleSectionCode2" runat="server" CssClass="cssHidden" meta:resourcekey="lblSingleSectionCode2Resource1"></asp:Label>
                    </td>
                </tr>
            </asp:Panel>

            <asp:Panel ID="pnlPerson" runat="server" Visible="False" meta:resourcekey="pnlPersonResource1">
                <tr>
                    <td style="white-space: nowrap">
                        <asp:Label ID="Label13" runat="server" Text="*" ForeColor="Red" meta:resourcekey="Label13Resource1"></asp:Label>
                        <asp:Label ID="Label14" runat="server" Text="調班日期" meta:resourcekey="Label14Resource1"></asp:Label>
                    </td>
                    <td colspan="3">
                        <telerik:RadDatePicker ID="rdpExchangeDatePerson" OnSelectedDateChanged="rdpExchangeDatePerson_SelectedDateChanged" AutoPostBack="True" runat="server"  meta:resourcekey="rdpExchangeDatePersonResource1">
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
                        <asp:Label ID="lblExchangeDatePerson" runat="server" meta:resourcekey="lblExchangeDatePersonResource1"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td style="white-space: nowrap">
                        <asp:Label ID="Label15" runat="server" Text="*" ForeColor="Red" meta:resourcekey="Label15Resource1"></asp:Label>
                        <asp:Label ID="Label16" runat="server" Text="調班人員(1)" meta:resourcekey="Label16Resource1"></asp:Label>
                    </td>
                    <td style="width:25%">
                        <div style="display:none;">
                            <uc2:UC_ChoiceListMobile runat="server" ID="UC_ChoiceListMobile_Person1" ChioceType="User"/>
                        </div>
                        <uc1:UC_ChoiceList runat="server" ID="UC_ChoiceList_Person1" ChioceType="All" ShowEmployee="true" ShowMember="false" DefaultTab="Employee" />
                        <asp:Label ID="lblSelectOnePerson1" runat="server" ForeColor="Red" meta:resourcekey="lblSelectOnePerson1Resource1"></asp:Label>
                        <asp:Label ID="lblCompanyUnifiedIdPerson1" runat="server" CssClass="cssHidden" meta:resourcekey="lblCompanyUnifiedIdPerson1Resource1"></asp:Label>
                        <asp:Label ID="lblEmployeeNoPerson1" runat="server" CssClass="cssHidden" meta:resourcekey="lblEmployeeNoPerson1Resource1"></asp:Label>
                        <asp:Label ID="lblUserGuidPerson1" runat="server" CssClass="cssHidden" meta:resourcekey="lblUserGuidPerson1Resource1"></asp:Label>
                    </td>
                    <td style="white-space: nowrap">
                        <asp:Label ID="Label18" runat="server" Text="班別(1)" meta:resourcekey="Label18Resource1"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="lblPersonSection1" runat="server" meta:resourcekey="lblPersonSection1Resource1"></asp:Label>
                        <asp:Label ID="lblPersonSectionVal1" runat="server" CssClass="cssHidden" meta:resourcekey="lblPersonSectionVal1Resource1"></asp:Label>
                        <asp:Label ID="lblPersonSectionCode1" runat="server" CssClass="cssHidden" meta:resourcekey="lblPersonSectionCode1Resource1"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td style="white-space: nowrap">
                        <asp:Label ID="Label20" runat="server" Text="*" ForeColor="Red" meta:resourcekey="Label20Resource1"></asp:Label>
                        <asp:Label ID="Label21" runat="server" Text="調班人員(2)" meta:resourcekey="Label21Resource1"></asp:Label>
                    </td>
                    <td style="width:25%">
                        <div style="display:none;">
                            <uc2:UC_ChoiceListMobile runat="server" ID="UC_ChoiceListMobile_Person2" ChioceType="User"/>
                        </div>
                        <uc1:UC_ChoiceList runat="server" ID="UC_ChoiceList_Person2" ChioceType="All" ShowEmployee="true" ShowMember="false" DefaultTab="Employee" />
                        <asp:Label ID="lblSelectOnePerson2" runat="server" ForeColor="Red" meta:resourcekey="lblSelectOnePerson2Resource1"></asp:Label>
                        <asp:Label ID="lblCompanyUnifiedIdPerson2" runat="server" CssClass="cssHidden" meta:resourcekey="lblCompanyUnifiedIdPerson2Resource1"></asp:Label>
                        <asp:Label ID="lblEmployeeNoPerson2" runat="server" CssClass="cssHidden" meta:resourcekey="lblEmployeeNoPerson2Resource1"></asp:Label>
                        <asp:Label ID="lblUserGuidPerson2" runat="server" CssClass="cssHidden" meta:resourcekey="lblUserGuidPerson2Resource1"></asp:Label>
                    </td>
                    <td style="white-space: nowrap">
                        <asp:Label ID="Label23" runat="server" Text="班別(2)" meta:resourcekey="Label23Resource1"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="lblPersonSection2" runat="server" meta:resourcekey="lblPersonSection2Resource1"></asp:Label>
                        <asp:Label ID="lblPersonSectionVal2" runat="server" CssClass="cssHidden" meta:resourcekey="lblPersonSectionVal2Resource1"></asp:Label>
                        <asp:Label ID="lblPersonSectionCode2" runat="server" CssClass="cssHidden" meta:resourcekey="lblPersonSectionCode2Resource1"></asp:Label>
                    </td>
                </tr>
            </asp:Panel>

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
                    <asp:CustomValidator ID="cvExchangeType" runat="server" Display="Dynamic" ForeColor="Red" ErrorMessage="調班類型不可為空" ClientValidationFunction="CheckExchangeType" meta:resourcekey="cvExchangeTypeResource1"></asp:CustomValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:CustomValidator ID="cvDate" runat="server" Display="Dynamic" ForeColor="Red" ErrorMessage="調班日期不可為空" ClientValidationFunction="CheckExchageDate" meta:resourcekey="cvDateResource1"></asp:CustomValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:CustomValidator ID="cvRemark" runat="server" Display="Dynamic" ForeColor="Red" ErrorMessage="事由不可空白" ClientValidationFunction="CheckRemarkRequired" meta:resourcekey="cvRemarkResource1"></asp:CustomValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:CustomValidator ID="cvExchangeSection" runat="server" Display="Dynamic" ForeColor="Red" ClientValidationFunction="CheckExchangeSection" meta:resourcekey="cvExchangeSectionResource1"></asp:CustomValidator>
                </td>
            </tr>
        </table>
    </ContentTemplate>
</asp:UpdatePanel>

<asp:HiddenField ID="hfApplicantGuid" runat="server" />
<asp:HiddenField ID="hfApplicantEmployeeNo" runat="server" />
<asp:HiddenField ID="hfApplicantCompanyUnifiedId" runat="server" />
<asp:HiddenField ID="hfApplicantGroupId" runat="server" />
<asp:HiddenField ID="hfDocNbr" runat="server"/>
<asp:HiddenField ID="hfIsMobileUI" runat="server" />
<asp:HiddenField ID="hfIsAllowApply" runat="server"/>

<asp:Label ID="lblEmpty" runat="server" Text="空班" CssClass="cssHidden" meta:resourcekey="lblEmptyResource1"></asp:Label>
<asp:Label ID="lblFestival" runat="server" Text="節日" CssClass="cssHidden" meta:resourcekey="lblFestivalResource1"></asp:Label>
<asp:Label ID="lblHoliday" runat="server" Text="例假日" CssClass="cssHidden" meta:resourcekey="lblHolidayResource1"></asp:Label>
<asp:Label ID="lblOffday" runat="server" Text="假日/休息日" CssClass="cssHidden" meta:resourcekey="lblOffdayResource1"></asp:Label>
<asp:Label ID="lblNone" runat="server" Text="沒排班" CssClass="cssHidden" meta:resourcekey="lblNoneResource1"></asp:Label>

<asp:Label ID="lblSelectOne" runat="server" Text="只能選擇一位調班人員" CssClass="cssHidden" meta:resourcekey="lblSelectOneResource1"></asp:Label>
<asp:Label ID="lblSelectRequired" runat="server" Text="必須選擇調班人員" CssClass="cssHidden" meta:resourcekey="lblSelectRequiredResource1"></asp:Label>
<asp:Label ID="lblSectionEmpty" runat="server" Text="班別不可為空" CssClass="cssHidden" meta:resourcekey="lblSectionEmptyResource1"></asp:Label>
<asp:Label ID="lblSectionError" runat="server" Text="班別有誤" CssClass="cssHidden" meta:resourcekey="lblSectionErrorResource1"></asp:Label>
<asp:Label ID="lblSectionNone" runat="server" Text="班別為沒排班，不可進行調班" CssClass="cssHidden" meta:resourcekey="lblSectionNoneResource1"></asp:Label>
<asp:Label ID="lblSameCompany" runat="server" Text="兩位調班人員必須屬於同公司"  CssClass="cssHidden" meta:resourcekey="lblSameCompanyResource1"></asp:Label>
<asp:Label ID="lblStillExchanging" runat="server" Text="員工編號為{0}的人員，日期{1}尚有簽核中的調班單。" CssClass="cssHidden" meta:resourcekey="lblStillExchangingResource1"></asp:Label>
<asp:Label ID="lblNotIdentical" runat="server" Text="{0}於{1}的班別已被變更，請洽系統管理員。" CssClass="cssHidden" meta:resourcekey="lblNotIdenticalResource1"></asp:Label>
<asp:Label ID="lblNotAllowApply" runat="server" Text="不允許申請此張表單，請洽系統管理員。" CssClass="cssHidden" meta:resourcekey="lblNotAllowApplyResource1"></asp:Label>

<asp:Label ID="lblFiller" CssClass="FillerVisible" runat="server" meta:resourcekey="lblFillerResource1"></asp:Label>
<asp:Label ID="lblHasNoAuthority" runat="server" Text="無填寫權限" ForeColor="Red" Visible="False" meta:resourcekey="lblHasNoAuthorityResource1"></asp:Label>
<asp:Label ID="lblToolTipMsg" runat="server" Text="不允許修改(唯讀)" Visible="False" meta:resourcekey="lblToolTipMsgResource1"></asp:Label>
<asp:Label ID="lblModifier" runat="server" Visible="False" meta:resourcekey="lblModifierResource1"></asp:Label>
<asp:Label ID="lblMsgSigner" runat="server" Text="填寫者" Visible="False" meta:resourcekey="lblMsgSignerResource1"></asp:Label>
<asp:Label ID="lblMsgEditor" runat="server" Text="修改者" Visible="False" meta:resourcekey="lblMsgEditorResource1"></asp:Label>
<asp:Label ID="lblAuthorityMsg" runat="server" Text="具填寫權限人員" Visible="False" meta:resourcekey="lblAuthorityMsgResource1"></asp:Label>