<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="LeaveInfoUCV2.ascx.cs" Inherits="WKF_OptionalFields_LeaveInfoUCV2" %>
<%@ Reference Control="~/WKF/FormManagement/VersionFieldUserControl/VersionFieldUC.ascx" %>

<style>
    .fullWidth {
        width:100% !important;
    }
</style>

<script type="text/javascript">
    Sys.Application.add_load(function () {
        var timeZoneEnable = $("#<%=hfTimeZoneEnable.ClientID%>").val();
        if (timeZoneEnable === "true") {
            $(".trTimeZone").show();
        }
        else {
            $(".trTimeZone").hide();
        }
    });

    function btnCalControl() {
        var btn = $('#<%= rdbtnCal.ClientID %>');

        if (btn != null)
            btn.prop("disabled", true);

        //變更假別時先將驗證元件清空
        var chkOtherLea = $("#<%=cvOtherLeave.ClientID %>");
        var chkNotFindLev = $("#<%=cvNotFindLev.ClientID %>");
        var chkStartEndDate = $("#<%=cvStartBiggerThenEnd.ClientID %>");
        chkOtherLea.css("display", "none");
        chkNotFindLev.css("display", "none");
        chkStartEndDate.css("display", "none");

    }

    function ClearCheck() {
        //變更假別時先將驗證元件清空
        var chkOtherLea = $("#<%=cvOtherLeave.ClientID %>");
        var chkNotFindLev = $("#<%=cvNotFindLev.ClientID %>");
        var chkStartEndDate = $("#<%=cvStartBiggerThenEnd.ClientID %>");
        chkOtherLea.css("display", "none");
        chkNotFindLev.css("display", "none");
        chkStartEndDate.css("display", "none");
    }

    function ClearLea() {
        var hours = $('#<%=lblHour.ClientID %>');
        var days = $('#<%= lblDay.ClientID%>');
        var leaunit = $('#<%= hfLeaveUnit.ClientID%>');
        var hourunit = $('#<%= lblHourUnit.ClientID%>');
        var dayunit = $('#<%= lblDayUnit.ClientID%>');
        var dayhours = $('#<%= hfLeaveDayHour.ClientID%>');

        if (hours != null) {
            hours.val("0.0");
            hours.css("display", "none");
        }
        if (days != null) {
            days.val("0.0");
            days.css("display", "none");
        }
        if (leaunit != null) leaunit.val("");
        if (hourunit != null) hourunit.css("display", "none");
        if (dayunit != null) dayunit.css("display", "none");
        if (dayhours != null) dayhours.val("");
    }

    function CheckActualDate(source, args) {

        if ($find("<%=rdActualDate.ClientID%>") == null) return;
        var hf = $('#<%=hfActualDateCheck.ClientID%>').val();
        var actualDate = $find("<%=rdActualDate.ClientID%>").get_selectedDate();

        if (hf == "Y" && (actualDate == "" || actualDate == null || actualDate == "undefined")) {
            args.IsValid = false;
            return;
        }
    }

    function CheckIfSelectLeaCode(source, arguments) {
        var obj = $('#<%=hfLeaveCode.ClientID%>');

        if ($uof.tool.htmlDecode(obj.val()) == "-NULL-") {
            arguments.IsValid = false;
            return;
        }
    }

    //檢查時間
    function CheckStartEndDate(source, args) {
        if ($find("<%= rdStartDate.ClientID %>") == null || $find("<%= rdEndDate.ClientID %>") == null) return;
        var startDate = $find("<%= rdStartDate.ClientID %>").get_selectedDate();
        if (startDate != null) startDate = startDate.format('yyyy/MM/dd');

        var endDate = $find("<%= rdEndDate.ClientID %>").get_selectedDate();
        if (endDate != null) endDate = endDate.format('yyyy/MM/dd');

        var startTime = $find("<%= rdStartTime.ClientID %>").get_selectedDate();
        if (startTime != null) startTime = startTime.format('HH:mm');

        var endTime = $find("<%= rdEndTime.ClientID %>").get_selectedDate();
        if (endTime != null) endTime = endTime.format('HH:mm');

        if (endDate != null && startDate != null) {
            var data = [startDate, startTime, endDate, endTime];
            var result = $uof.pageMethod.syncUc("EIP/Duty/WKFOptionalFields/LeaveInfoUCV2.ascx", "CheckStartEndDate", data);
            if (result == "false") {

                source.textContent = $("#<%=lblStartBigerEndErr.ClientID %>").text();
                args.IsValid = false;
            }
        }
    }

    //是否超過有效申請日
    function CheckNotInRange(source, args) {
        if ($find('<%=rdActualDate.ClientID %>') == null || $find("<%= rdStartDate.ClientID %>") == null || $find("<%= rdEndDate.ClientID %>") == null) return;
        var applicantGuid = $("#<%=hfApplicantGuid.ClientID %>").val();
        var levCode = $uof.tool.htmlDecode($('#<%=hfLeaveCode.ClientID%>').val());

        var actualDate = $find('<%=rdActualDate.ClientID %>').get_selectedDate();
        if (actualDate != null) actualDate = actualDate.format('yyyy/MM/dd');

        var startDate = $find("<%= rdStartDate.ClientID %>").get_selectedDate();
        if (startDate != null) startDate = startDate.format('yyyy/MM/dd');

        var endDate = $find("<%= rdEndDate.ClientID %>").get_selectedDate();
        if (endDate != null) endDate = endDate.format('yyyy/MM/dd');

        var startTime = $find("<%= rdStartTime.ClientID %>").get_selectedDate();
        if (startTime != null) startTime = startTime.format('HH:mm');

        var endTime = $find("<%= rdEndTime.ClientID %>").get_selectedDate();
        if (endTime != null) endTime = endTime.format('HH:mm');

        var exception = $('#<%=cbException.ClientID %>').is(":checked");
        var result = "true";

        var oldStartDate = $("#<%= hfLeaveStartDate.ClientID %>").val();
        var oldEndDate = $("#<%= hfLeaveEndDate.ClientID %>").val();
        var fieldMode = $("#<%= hfFieldMode.ClientID %>").val();
        var taskID = $("#<%=hfTaskID.ClientID %>").val(); //表單代碼
        if (exception != true) {
            if (startDate != null && endDate != null && actualDate != null) {
                var data = [applicantGuid, actualDate, startDate, startTime, endDate, endTime, levCode, oldStartDate, oldEndDate, fieldMode, taskID];
                result = $uof.pageMethod.syncUc("EIP/Duty/WKFOptionalFields/LeaveInfoUCV2.ascx", "CheckIfBetweenRange", data);
            }

            if (startDate != null) {
                var data = [applicantGuid, startDate, startTime, endDate, endTime, levCode, fieldMode, taskID];
                if (result === "true")
                    result = $uof.pageMethod.syncUc("EIP/Duty/WKFOptionalFields/LeaveInfoUCV2.ascx", "CheckIfApplyRange", data);

            }
        }


        if (result === "false")
            args.IsValid = false;
    }

    //請假日期期間差勤結算已鎖定或關帳，不能申請
    function CheckLock(source, args) {
        if ($find("<%= rdStartDate.ClientID %>") == null) return;
        var startDate = $find("<%= rdStartDate.ClientID %>").get_selectedDate();
        if (startDate != null) startDate = startDate.format('yyyy/MM/dd');

        var startTime = $find("<%= rdStartTime.ClientID %>").get_selectedDate();
        if (startTime != null) startTime = startTime.format('HH:mm');
        var applicantGuid = $("#<%=hfApplicantGuid.ClientID %>").val();

        if (startDate == null) return;
        var data = [startDate, startTime, applicantGuid];
        var result = $uof.pageMethod.syncUc("EIP/Duty/WKFOptionalFields/LeaveInfoUCV2.ascx", "CheckDutyLock", data);
        if (result === "false")
            args.IsValid = false;
    }

    //找不到假別
    function CheckNotFindLev(source, args) {
        if ($find("<%= rdStartDate.ClientID %>") == null || $find("<%= rdEndDate.ClientID %>") == null) return;

        var applicantGuid = $("#<%=hfApplicantGuid.ClientID %>").val();
        var leaveCode = $uof.tool.htmlDecode($('#<%=hfLeaveCode.ClientID%>').val());
        var leaveUnit = $('#<%=hfLeaveUnit.ClientID%>').val();
        var hours = $("#<%=lblHour.ClientID %>").text();
        var days = $("#<%=lblDay.ClientID %>").text();

        var startDate = $find("<%= rdStartDate.ClientID %>").get_selectedDate();
        if (startDate != null) startDate = startDate.format('yyyy/MM/dd');
        var endDate = $find("<%= rdEndDate.ClientID %>").get_selectedDate();
        if (endDate != null) endDate = endDate.format('yyyy/MM/dd');

        var startTime = $find("<%= rdStartTime.ClientID %>").get_selectedDate();
        if (startTime != null) startTime = startTime.format('HH:mm');

        var endTime = $find("<%= rdEndTime.ClientID %>").get_selectedDate();
        if (endTime != null) endTime = endTime.format('HH:mm');

        if (startDate == null || endDate == null) return;
        var data = [startDate, startTime, endDate, endTime];

        var ckbFlexible = $("#<%= ckbIsFlexible.ClientID %>")

        var isF = "false";
        if (ckbFlexible != null && ckbFlexible.is(":checked"))
            isF = "true";

        if (leaveCode != "-NULL-") {
            var isCheckDate = $uof.pageMethod.syncUc("EIP/Duty/WKFOptionalFields/LeaveInfoUCV2.ascx", "CheckStartEndDate", data);
            if (isCheckDate == "true") {

                var leadata = [applicantGuid, leaveCode, startDate, startTime, endDate, endTime, leaveUnit, days, hours, isF];
                var isPass = $uof.pageMethod.syncUc("EIP/Duty/WKFOptionalFields/LeaveInfoUCV2.ascx", "CheckNotFindLeave", leadata);

                if (isPass === "CanNotFindLeave") {
                    source.textContent = $("#<%=lblCannotFindLeaveCode.ClientID %>").text();
                    args.IsValid = false;
                    return;
                }
                else if (isPass === "CanNotFindWorkHourSetting") {
                    source.textContent = $("#<%=lblCannotFindSetting.ClientID %>").text();
                    args.IsValid = false;
                    return;
                }
                else if (isPass === "HoursNotEmpty") {
                    source.textContent = $("#<%=lblHoursDaysEmpty.ClientID %>").text();
                    args.IsValid = false;
                    return;
                }
                else if (isPass === "DateTimeErr") {
                    source.textContent = $("#<%=lblNoWorkDate.ClientID %>").text();
                    args.IsValid = false;
                    return;
                }
                else if (isPass === "ClickCalBtn") {
                    source.textContent = $("#<%=lblClickButton.ClientID %>").text();
                        args.IsValid = false;
                        return;
                    }
                    else if (isPass === "true") {
                        args.IsValid = true;
                    }
}
}
}

//判斷年休、補休、公益、彈休是否有足扣可抵扣的假
function CheckOtherLeave(source, args) {
    var leaveCode = $uof.tool.htmlDecode($('#<%=hfLeaveCode.ClientID%>').val());
        if (leaveCode != "-NULL-") {

            if ($find("<%= rdStartDate.ClientID %>") == null || $find("<%= rdEndDate.ClientID %>") == null) return;
            var applicantGuid = $("#<%=hfApplicantGuid.ClientID %>").val();
            var leaveUnit = $('#<%=hfLeaveUnit.ClientID%>').val();
            var hours = $("#<%=lblHour.ClientID %>").text();
            var days = $("#<%=lblDay.ClientID %>").text();

            var startDate = $find("<%= rdStartDate.ClientID %>").get_selectedDate();
            if (startDate != null) startDate = startDate.format('yyyy/MM/dd');

            var endDate = $find("<%= rdEndDate.ClientID %>").get_selectedDate();
            if (endDate != null) endDate = endDate.format('yyyy/MM/dd');

            var startTime = $find("<%= rdStartTime.ClientID %>").get_selectedDate();
            if (startTime != null) startTime = startTime.format('HH:mm');

            var endTime = $find("<%= rdEndTime.ClientID %>").get_selectedDate();
            if (endTime != null) endTime = endTime.format('HH:mm');

            var selected = '';
            var isYearLeave = false;  //判斷是否為特休假
            if (leaveCode == "YearLeave") {
                selected = $find("<%= ddlLeaveDays2.ClientID %>").get_selectedItem().get_value();  //如果是，再去抓ddlLeaveDays2，不然js會找不到該元件
                isYearLeave = true;
            }

            var usedYear = '';
            var usedExtend = '';

            if (startDate == null || endDate == null) return;
            if (leaveUnit == null || leaveUnit == "") return;
            if (leaveUnit == "Day" && days == null) return;
            if (leaveUnit == "Hour" && hours == null) return;

            if (typeof (selected) != "undefined" && isYearLeave) {
                usedYear = selected.split('@')[0]; //年休-年度
                usedExtend = selected.split('@')[1]; //年休-延展次數
            }

            var formDocNbr = $("#<%=hfFormDocNbr.ClientID %>").val(); //表單編號
            var taskID = $("#<%=hfTaskID.ClientID %>").val(); //表單代碼

            var leaRepeatApply = $("#<%=hfLeaRepeatApply.ClientID %>").val();

            var diffTaskID = '';
            var diffExpand = $('#<%= rdbtnActualExpend.ClientID %>');

            if (diffExpand.is(":checked"))
            {
                diffTaskID = $find("<%= ddlLeaDiff.ClientID %>").get_selectedItem().get_value();
            }

            var data = [applicantGuid, leaveCode, leaveUnit, hours, days, usedYear, usedExtend, formDocNbr, taskID, startDate, startTime, endDate, endTime, diffTaskID, leaRepeatApply];
            var isPass = $uof.pageMethod.syncUc("EIP/Duty/WKFOptionalFields/LeaveInfoUCV2.ascx", "CheckOtherLeavePass", data);

            if (isPass === "NoYearLeave") {//年休
                source.textContent = $("#<%=lblNoYear.ClientID %>").text();
                args.IsValid = false;
                return;
            }
            else if (isPass === "NoTimeOffLeave") {//補休
                source.textContent = $("#<%=lblNoTimeOff.ClientID %>").text();
                args.IsValid = false;
                return;
            }
            else if (isPass === "NoCharityLeave") {//公益
                source.textContent = $("#<%=lblNoCharity.ClientID %>").text();
                args.IsValid = false;
                return;
            }
            else if (isPass === "NoScalableLeave") {//彈休
                source.textContent = $("#<%=lblNoScalable.ClientID %>").text();
                args.IsValid = false;
                return;
            }
            else if (isPass === "NoDays") {//可休天數不足
                source.textContent = $("#<%=lblNoDays.ClientID %>").text();
                args.IsValid = false;
                return;
            }
            else if (isPass === "NoHours") { //可休時數不足
                source.textContent = $("#<%=lblNoHours.ClientID %>").text();
                    args.IsValid = false;
                    return;
                }
                else if (isPass === "true") {
                    args.IsValid = true;
                }
}
}

//判斷與其他單子重複(請假、出差、加班)
function CheckRpLeave(source, args) {
    var leaveCode = $uof.tool.htmlDecode($('#<%=hfLeaveCode.ClientID%>').val());
        if (leaveCode != "-NULL-") {
            if ($find("<%= rdStartDate.ClientID %>") == null || $find("<%= rdEndDate.ClientID %>") == null) return;
            var applicantGuid = $("#<%=hfApplicantGuid.ClientID %>").val();
            var startDate = $find("<%= rdStartDate.ClientID %>").get_selectedDate();
            if (startDate != null) startDate = startDate.format('yyyy/MM/dd');

            var endDate = $find("<%= rdEndDate.ClientID %>").get_selectedDate();
            if (endDate != null) endDate = endDate.format('yyyy/MM/dd');

            var startTime = $find("<%= rdStartTime.ClientID %>").get_selectedDate();
            if (startTime != null) startTime = startTime.format('HH:mm');

            var endTime = $find("<%= rdEndTime.ClientID %>").get_selectedDate();
            if (endTime != null) endTime = endTime.format('HH:mm');

            var formDocNbr = $("#<%=hfFormDocNbr.ClientID %>").val(); //表單編號
            var taskID = $("#<%=hfTaskID.ClientID %>").val(); //表單代碼

            if (startDate == null || endDate == null) return;

            var data = [applicantGuid, formDocNbr, taskID, startDate, startTime, endDate, endTime];
            var isPass = $uof.pageMethod.syncUc("EIP/Duty/WKFOptionalFields/LeaveInfoUCV2.ascx", "CheckRepeatLeave", data);

            if (isPass === "RepeatLeave") {//請假時間重複
                source.textContent = $("#<%=lblRepeatLeave.ClientID %>").text();
                args.IsValid = false;
                return;
            }
            else if (isPass === "RepeatTravel") { //請假時間與出差時間重複
                source.textContent = $("#<%=lblRepeatTravel.ClientID %>").text();
                args.IsValid = false;
                return;
            }
            else if (isPass === "RepeatOverTime") { //請假時間與加班時間重複
                source.textContent = $("#<%=lblRepeatOverTime.ClientID %>").text();
                    args.IsValid = false;
                    return;
                }
                else if (isPass === "true") {
                    args.IsValid = true;
                }
    }
}
    function CheckRepeatTimes(source, args) {

        var taskID = $("#<%=hfTaskID.ClientID %>").val(); //表單代碼
        var leaveCode = $uof.tool.htmlDecode($('#<%=hfLeaveCode.ClientID%>').val());
        var startDate = $find("<%= rdActualDate.ClientID %>").get_selectedDate();
        if (startDate != null) {
            startDate = startDate.format('yyyy/MM/dd');

            //是否為接續
            var diffTaskID = '';
            var diffExpand = $('#<%= rdbtnActualExpend.ClientID %>');

            if (diffExpand.is(":checked")) {
                diffTaskID = $find("<%= ddlLeaDiff.ClientID %>").get_selectedItem().get_value();
            }

            if (leaveCode != "-NULL-" && diffTaskID === '') {
                var applicantGuid = $("#<%=hfApplicantGuid.ClientID %>").val();
                var data = [applicantGuid, leaveCode, startDate, taskID];
                var isPass = $uof.pageMethod.syncUc("EIP/Duty/WKFOptionalFields/LeaveInfoUCV2.ascx", "CheckRepeatTimes", data);
                if (isPass != null && isPass != '') {
                    source.textContent = $("#<%=lblOverRepeatTimesMsg0.ClientID %>").text() + isPass + $("#<%=lblOverRepeatTimesMsg1.ClientID %>").text() + $("#<%=lblOverRepeatTimesMsg2.ClientID %>").text();
                    args.IsValid = false;
                    return;
                }
            }
        }
    }

    function CheckDiffMinUnit(source, args) {

        var leaveCode = $uof.tool.htmlDecode($('#<%=hfLeaveCode.ClientID%>').val());
        var leaveUnit = $('#<%=hfLeaveUnit.ClientID%>').val();
        //是否為接續
        var diffTaskID = '';
        var diffExpand = $('#<%= rdbtnActualExpend.ClientID %>');

        if (diffExpand.is(":checked")) {
            diffTaskID = $find("<%= ddlLeaDiff.ClientID %>").get_selectedItem().get_value();
        }

        if (leaveCode != "-NULL-" && diffTaskID != '') {
            var data = [diffTaskID, leaveUnit];
            var isPass = $uof.pageMethod.syncUc("EIP/Duty/WKFOptionalFields/LeaveInfoUCV2.ascx", "CheckDiffMinUnit", data);

            if (isPass === "false") {
                args.IsValid = false;
                return;
            }
        }
    }


    function CheckProbation(source,args)
    {
        var leaveCode = $uof.tool.htmlDecode($('#<%=hfLeaveCode.ClientID%>').val());
        var startDate = $find("<%= rdStartDate.ClientID %>");        

        var applicantGuid = $("#<%=hfApplicantGuid.ClientID %>").val();

        if (leaveCode != "-NULL-") {

            if (startDate == null) {
                return;
            }
            else {
                var startDateVlaue = startDate.get_selectedDate().format('yyyy/MM/dd');

                var data = [applicantGuid, leaveCode, startDateVlaue];
                var isPass = $uof.pageMethod.syncUc("EIP/Duty/WKFOptionalFields/LeaveInfoUCV2.ascx", "CheckProbation", data);

                if (isPass === "N") {
                    args.IsValid = false;
                    return;
                }
            }

        }
    }

    function CheckYearLeaveInRange(source, args) {
        var leaveCode = $uof.tool.htmlDecode($('#<%=hfLeaveCode.ClientID%>').val());
        var startDate = $find("<%= rdStartDate.ClientID %>");
        var endDate = $find("<%= rdEndDate.ClientID %>");

        var applicantGuid = $("#<%=hfApplicantGuid.ClientID %>").val();

        if (leaveCode != "-NULL-" && leaveCode == "YearLeave") {
            if (startDate == null || endDate == null ) {
                return;
            }
            else
            {
                var startDateVlaue = startDate.get_selectedDate().format('yyyy/MM/dd');
                var endDateVlaue = endDate.get_selectedDate().format('yyyy/MM/dd');
                var data = [applicantGuid, startDateVlaue, endDateVlaue];
                var isPass = $uof.pageMethod.syncUc("EIP/Duty/WKFOptionalFields/LeaveInfoUCV2.ascx", "CheckYearLeaveInRange", data);
                if (isPass === "false") {
                    args.IsValid = false;
                    return;
                }
            }
        }
    }
</script>

<asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>
        <table style="width:97%">
            <tr class="trTimeZone">
                <td style="padding-left:17px ;white-space: nowrap">
                    <asp:Label ID="Label1" runat="server" Text="歸屬地點時區" meta:resourcekey="Label1Resource1"></asp:Label>
                </td>
            </tr>
            <tr class="trTimeZone">
                <td style="padding-left:17px" colspan="2">
                    <asp:Label ID="lblApplicantTimeZone" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td style="padding-left: 17px; padding-top:10px">
                    <asp:Label ID="lblLeaveCode" runat="server" Text="假別" meta:resourcekey="lblLeaveCodeResource1"></asp:Label>
                </td>
                <td style="padding-top:10px; text-align:right">
                    <div style="display:none">
                    <asp:HyperLink ID="hlLeaveCode" runat="server" Target="_blank" Text="假別說明" meta:resourcekey="hlLeaveCodeResource1"></asp:HyperLink>
                    &nbsp
                    <asp:LinkButton ID="lbtnUserLeaveData" runat="server" Text="可休假餘額" CausesValidation="False" meta:resourcekey="lbtnUserLeaveDataResource1"></asp:LinkButton>
                    &nbsp
                    <asp:LinkButton ID="lbtnUserReport" runat="server" Text="出缺勤資訊" CausesValidation="False" meta:resourcekey="lbtnUserReportResource1"></asp:LinkButton>
                        </div>
                </td>
            </tr>
            <tr>
                <td style="padding-left:17px" colspan="2">
                    <telerik:RadDropDownList ID="ddlLeaveCode2" runat="server" OnSelectedIndexChanged="ddlLeaveCode2_SelectedIndexChanged"
                        EnableTheming="true"
                        AutoPostBack="true" CausesValidation="false" meta:resourcekey="ddlLeaveCode2Resource1">
                    </telerik:RadDropDownList>
                    <asp:Label ID="lblLeaveCodeView" runat="server" meta:resourcekey="lblLeaveCodeViewResource1"></asp:Label>
                    <br/>
                    <asp:Label ID="lblLeaveCodeMiss" runat="server" Text="選擇假別已被修改或移除，請洽管理員" Visible="false" ForeColor="Blue" meta:resourcekey="lblLeaveCodeMissResource1"></asp:Label>
                </td>
            </tr>
            <tr>
                <td style="padding-left:17px" colspan="2">
                    <asp:CustomValidator ID="cusValiLeaCode" runat="server" ErrorMessage="假別必須選擇" Display="Dynamic" ForeColor="Red" EnableTheming="true"                        
                        ClientValidationFunction="CheckIfSelectLeaCode" meta:resourcekey="cusValiLeaCodeResource1"></asp:CustomValidator>
                    <asp:HiddenField ID="hfLeaveCode" runat="server" />
                </td>
            </tr>
            <tr>
                <td style="padding-left:17px; padding-top:10px" colspan="2">
                    <asp:Label ID="lblStartDate" runat="server" Text="請假時間(起)" meta:resourcekey="lblStartDateResource1"></asp:Label>
                </td>
            </tr>
            <tr>
                <td style="padding-left:17px; padding-bottom:8px" colspan="2">
                    <telerik:RadDatePicker ID="rdStartDate" runat="server" AutoPostBack="True" Width="100%" EnableTheming="true"
                        OnSelectedDateChanged="rdStartDate_SelectedDateChanged" meta:resourcekey="rdStartDateResource1">
                        <ClientEvents OnDateSelected="btnCalControl" />
                    </telerik:RadDatePicker>
                    <asp:Label ID="lblStartDateView" runat="server" meta:resourcekey="lblStartDateViewResource1"></asp:Label>
                </td>
            </tr>
            <tr>
                <td style="padding-left:17px; width:100%" colspan="2">
                    <telerik:RadTimePicker ID="rdStartTime" runat="server" EnableTheming="true" Width="100%" CssClass="fullWidth"
                        OnSelectedDateChanged="rdStartTime_SelectedDateChanged" AutoPostBack="True">
                        <ClientEvents OnDateSelected="btnCalControl" />
                    </telerik:RadTimePicker>
                </td>
            </tr>
            <tr>
                <td style="padding-left:17px" colspan="2">
                    <asp:CheckBox ID="chbAllDay" runat="server" Text="整天" Visible="False" meta:resourcekey="chbAllDayResource1" />
                </td>
            </tr>
            <tr>
                <td style="padding-left:17px; padding-top:10px" colspan="2">
                    <asp:Label ID="lblEndDate" runat="server" Text="請假時間(訖)" meta:resourcekey="lblEndDateResource1"></asp:Label>
                </td>
            </tr>
            <tr>
                <td style="padding-left:17px; padding-bottom:8px" colspan="2">
                    <telerik:RadDatePicker ID="rdEndDate" runat="server" Width="100%" AutoPostBack="True" EnableTheming="true"
                        OnSelectedDateChanged="rdEndDate_SelectedDateChanged" meta:resourcekey="rdEndDateResource1">
                        <ClientEvents OnDateSelected="btnCalControl" />
                    </telerik:RadDatePicker>
                    <asp:Label ID="lblEndDateView" runat="server" meta:resourcekey="lblEndDateViewResource1"></asp:Label>
                </td>
            </tr>
            <tr>
                <td style="padding-left:17px" colspan="2">
                    <telerik:RadTimePicker ID="rdEndTime" runat="server" EnableTheming="true" Width="100%" AutoPostBack="True" CssClass="fullWidth"
                        OnSelectedDateChanged="rdEndTime_SelectedDateChanged">
                        <ClientEvents OnDateSelected="btnCalControl" />
                    </telerik:RadTimePicker>
                </td>
            </tr>
            <tr>
                <td style="padding-left:17px; padding-top:10px" colspan="2">
                    <asp:Label ID="lblLeaveTotal" runat="server" Text="請假時(天)數" meta:resourcekey="lblLeaveTotalResource1"></asp:Label>
                </td>
            </tr>
            <tr>
                <td style="padding-left: 13px; padding-top: 5px">
                    <telerik:RadButton ID="rdbtnCal" CausesValidation="False" runat="server" Text="計算" Width="70px"
                        OnClientClicked="ClearCheck" OnClick="rdbtnCal_Click" meta:resourcekey="rdbtnCalResource1">
                    </telerik:RadButton>
                    &nbsp
                    <asp:Label ID="lblHour" runat="server" Text="0" Visible="False" meta:resourcekey="lblHourResource1"></asp:Label>
                    <asp:Label ID="lblHourUnit" runat="server" Text="時" Visible="False" meta:resourcekey="lblHourUnitResource1"></asp:Label>
                    <asp:Label ID="lblDay" runat="server" Text="0" Visible="False" meta:resourcekey="lblDayResource1"></asp:Label>
                    <asp:Label ID="lblDayUnit" runat="server" Text="天" Visible="False" meta:resourcekey="lblDayUnitResource1"></asp:Label>
                    <asp:HiddenField ID="hfLeaveUnit" runat="server" />
                    <asp:HiddenField ID="hfLeaveDayHour" runat="server" />
                </td>
            </tr>
            <tr>
                <td style="padding-left: 13px; padding-top: 5px">
                    <asp:CheckBox ID="ckbIsFlexible" runat="server" Text="首日依彈性最晚下班時間計算" Visible="false" AutoPostBack="true"  OnCheckedChanged="ckbIsFlexible_Click" meta:resourcekey="ckbIsFlexibleResource1"/>
                    <asp:HiddenField ID="hfCalLeaRule" runat="server" />
                </td>
            </tr>
            <tr>
                <td style="padding-left:17px; padding-top:10px" colspan="2">
                    <asp:Label ID="lblMsgStar" runat="server" Text="*" ForeColor="Red" Visible="False" meta:resourcekey="lblMsgStarResource1"></asp:Label>
                    <asp:Label ID="lblActualDate" runat="server" Text="實際發生日" meta:resourcekey="lblActualDateResource1"></asp:Label>
                </td>
            </tr>
            <tr>
                <td style="padding-left: 17px" colspan="2">
                    <table style="width: 100%;">
                        <tr id="trFirstTime" runat="server">
                            <td colspan="2" runat="server">
                                <asp:RadioButton ID="rdbtnActualFirst" runat="server" Text="新申請" GroupName="actual" AutoPostBack="True" OnCheckedChanged="rdbtnActualFirst_CheckedChanged"
                                    meta:resourcekey="rdbtnActualFirstResource1" />
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <telerik:RadDatePicker ID="rdActualDate" SkinID="AllowEmpty" runat="server" EnableTheming="true" meta:resourcekey="rdActualDateResource4">
                                </telerik:RadDatePicker>
                                <asp:Label ID="lblActualDateView" runat="server" meta:resourcekey="lblActualDateViewResource1"></asp:Label>
                            </td>
                        </tr>
                        <tr id="trSameEvent" runat="server">
                            <td colspan="2" runat="server">
                                <asp:RadioButton ID="rdbtnActualExpend" runat="server" Text="同一事件" GroupName="actual" AutoPostBack="True" OnCheckedChanged="rdbtnActualExpend_CheckedChanged" 
                                    meta:resourcekey="rdbtnActualExpendResource1" />
                            </td>
                        </tr>
                        <tr id="trDiff" runat="server">
                            <td runat="server">
                                <asp:Label ID="lblDiffTitle" runat="server" Text="餘額記錄:" meta:resourcekey="lblDiffTitleResource1"></asp:Label>
                                <telerik:RadDropDownList ID="ddlLeaDiff" runat="server"></telerik:RadDropDownList>
                                <asp:Label ID="lblDiffView" runat="server"></asp:Label>
                            </td>
                            <td runat="server"></td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td style="padding-left:17px" colspan="2">
                    <asp:CustomValidator ID="CusVailActualDate" runat="server" Display="Dynamic" ErrorMessage="實際發生日必須填寫" EnableTheming="true"
                        ClientValidationFunction="CheckActualDate" ForeColor="Red" meta:resourcekey="CusVailActualDateResource1"></asp:CustomValidator>
                </td>
            </tr>
            <tr id="trLD" runat="server">                
                <td style="padding-left:17px; padding-top:10px" colspan="2">
                    <table style="width:100%">
                        <tr>
                            <td id="Td1" runat="server">
                                <asp:Label ID="lblLeaveDays" runat="server" Text="可用年休"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td id="Td2" runat="server">
                                <telerik:RadDropDownList ID="ddlLeaveDays2" runat="server" EnableTheming="true"></telerik:RadDropDownList>
                                <asp:Label ID="lblLeaveDaysView" runat="server"></asp:Label>
                                <asp:HiddenField ID="hfLeaveDaysRemaindays" runat="server" />
                                <asp:HiddenField ID="hfLeaveDaysYear" runat="server" />
                                <asp:HiddenField ID="hfLeaveDaysExtend" runat="server" />
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr id="trException" runat="server">
                <td style="padding-left:17px; padding-top:10px" colspan="2">
                    <asp:CheckBox ID="cbException" Text="特殊情況" runat="server" meta:resourcekey="cbExceptionResource1"></asp:CheckBox><br />
                    <asp:Label ID="lblExceptionMemo" runat="server" CssClass="SizeMemo" Text=" *勾選後，不進行可請假間距及申請時間限制的驗證。" meta:resourcekey="lblExceptionMemoResource1"></asp:Label>
                </td>
            </tr>
            <tr>
                <td style="padding-left:17px" colspan="2">
                    <asp:CustomValidator ID="CusVailError" runat="server" Display="Dynamic" ForeColor="Red" EnableTheming="true" meta:resourcekey="CusVailErrorResource1"></asp:CustomValidator>
                    <asp:CustomValidator ID="CusVailDateTimeErr" runat="server" Display="Dynamic" ForeColor="Red" EnableTheming="true" meta:resourcekey="CusVailDateTimeErrResource1"></asp:CustomValidator>
                </td>
            </tr>
        </table>

        <%-- 驗證元件 --%>
        <table style="width:97%" cellpadding="0" cellspacing="0" border="0">
            <tr>
                <td style="padding-left:17px">
                    <asp:CustomValidator ID="cvApplicant" runat="server" Visible="False" ErrorMessage="無法確認申請者" ForeColor="Red" EnableTheming="true" Display="Dynamic" meta:resourcekey="cvApplicantResource1"></asp:CustomValidator>
                </td>
            </tr>
            <tr>
                <td style="padding-left:17px">
                    <asp:CustomValidator ID="cvStartBiggerThenEnd" runat="server" ForeColor="Red" EnableTheming="true" Display="Dynamic" ValidateEmptyText="true" ClientValidationFunction="CheckStartEndDate" meta:resourcekey="cvStartBiggerThenEndResource1"></asp:CustomValidator>
                </td>
            </tr>
            <tr>
                <td style="padding-left:17px">
                    <asp:CustomValidator ID="cvStartEndSameYear" runat="server" ErrorMessage="請假時間(起)(訖)需在同一年度" ForeColor="Red" EnableTheming="true" Display="Dynamic" meta:resourcekey="cvStartEndSameYearResource1"></asp:CustomValidator>
                </td>
            </tr>
            <tr>
                <td style="padding-left:17px">
                    <asp:CustomValidator ID="cvNotInRange" runat="server" ErrorMessage="已超過有效申請日" ForeColor="Red" EnableTheming="true" Display="Dynamic" ClientValidationFunction="CheckNotInRange" meta:resourcekey="cvNotInRangeResource1"></asp:CustomValidator>
                </td>
            </tr>
            <tr>
                <td style="padding-left:17px">
                    <asp:CustomValidator ID="cvLock" runat="server" ErrorMessage="請假日期期間差勤結算已鎖定或關帳，不能申請" ForeColor="Red" EnableTheming="true" Display="Dynamic" ClientValidationFunction="CheckLock" meta:resourcekey="cvLockResource1"></asp:CustomValidator>
                </td>
            </tr>
            <tr>
                <td style="padding-left:17px">
                    <asp:CustomValidator ID="cvDateError" runat="server" ErrorMessage="請假日期時間異常" ForeColor="Red" EnableTheming="true" Display="Dynamic" meta:resourcekey="cvDateErrorResource1"></asp:CustomValidator>
                </td>
            </tr>
            <tr>
                <td style="padding-left:17px">
                    <asp:CustomValidator ID="cvCheckRepeatTimes" runat="server" ForeColor="Red" Display="Dynamic" ClientValidationFunction="CheckRepeatTimes" meta:resourcekey="cvCheckRepeatTimesResource1"></asp:CustomValidator>
                </td>
            </tr>
            <tr>
                <td style="padding-left:17px">
                    <asp:CustomValidator ID="cvNotFindLev" runat="server" ForeColor="Red" EnableTheming="true" Display="Dynamic" ClientValidationFunction="CheckNotFindLev" meta:resourcekey="cvNotFindLevResource1"></asp:CustomValidator>
                </td>
            </tr>
            <tr>
                <td style="padding-left:17px">
                    <asp:CustomValidator ID="cvOtherLeave" runat="server" ForeColor="Red" EnableTheming="true" Display="Dynamic" ClientValidationFunction="CheckOtherLeave" meta:resourcekey="cvOtherLeaveResource1"></asp:CustomValidator>
                </td>
            </tr>
            <tr>
                <td style="padding-left:17px">
                    <asp:CustomValidator ID="cvRepeat" runat="server" ForeColor="Red" EnableTheming="true" Display="Dynamic" ClientValidationFunction="CheckRpLeave" meta:resourcekey="cvRepeatResource1"></asp:CustomValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:CustomValidator ID="cvCheckDiffMinUnit" runat="server" ForeColor="Red" ErrorMessage="所選擇的餘額記錄與目前假別單位不符，不允許使用" Display="Dynamic" ClientValidationFunction="CheckDiffMinUnit" meta:resourcekey="cvCheckDiffMinUnitResource1"></asp:CustomValidator>
                </td>
            </tr>
            <tr>
                <td style="padding-left:17px">
                    <asp:CustomValidator ID="cvCheckProbation" runat="server" ForeColor="Red" ErrorMessage="未滿足該假別的到職限制或無設定到職日，無法申請" Display="Dynamic" ClientValidationFunction="CheckProbation" meta:resourcekey="cvCheckProbationResource1"></asp:CustomValidator>
                </td>
            </tr>
            <tr>
                 <td>
                     <asp:CustomValidator ID="cvCheckYearLeaveInRange" runat="server" ForeColor="Red" ErrorMessage="請假時間(訖)已超過可用年休使用期限" Display="Dynamic" ClientValidationFunction="CheckYearLeaveInRange" meta:resourcekey="cvCheckYearLeaveInRangeResource1"></asp:CustomValidator>
                 </td>
            </tr>
        </table>
    <asp:HiddenField ID="hfApplicantUser" runat="server" />
    <asp:HiddenField ID="hfIsSendValue" runat="server" />
    <asp:HiddenField ID="hfFormDocNbr" runat="server" />
    <asp:HiddenField ID="hfTaskID" runat="server" />
    <asp:HiddenField ID="hfApplicantGuid" runat="server" />
    <asp:HiddenField ID="hfLeaveStartDate" runat="server" />
    <asp:HiddenField ID="hfLeaveEndDate" runat="server" />
    <asp:HiddenField ID="hfFieldMode" runat="server" />
    <asp:HiddenField runat="server" ID="hfTimeZoneEnable"></asp:HiddenField>
    <asp:HiddenField ID="hfLeaRepeatApply" runat="server" Value="false"/>
    <asp:HiddenField ID="hfOrginaldiffTaskID" runat="server" />
    <asp:HiddenField ID="hfOrginaldiffType" runat="server" />
    <asp:HiddenField ID="hfOrgindiffRemine" runat="server" />
    <asp:HiddenField ID="hfDiffStartDueDate" runat="server" />
    <asp:HiddenField ID="hfDiffEndDueDate" runat="server" />
    <asp:HiddenField ID="hfHasModify" runat="server" />
    <asp:HiddenField ID="hfActualDateCheck" runat="server" />
    <asp:Label ID="lblFieldValue" runat="server" Style="display: none;" meta:resourcekey="lblFieldValueResource1"></asp:Label>
    </ContentTemplate>
</asp:UpdatePanel>
<asp:Label ID="lblMustSelect" runat="server" Text="請選擇" Style="display: none;" meta:resourcekey="lblMustSelectResource1"></asp:Label>
<asp:Label ID="lblLeaveDaysShow" runat="server" Text="餘{0}天 ({1}~{2})" Style="display: none;" meta:resourcekey="lblLeaveDaysShowResource1"></asp:Label>
<asp:Label ID="lblLeaveHourssShow" runat="server" Text="餘{0}小時 ({1}~{2})" Style="display: none;" meta:resourcekey="lblLeaveHourssShowResource1"></asp:Label>
<asp:Label ID="lblNoLeaveDays" runat="server" Text="沒有可用年休" Style="display: none;" meta:resourcekey="lblNoLeaveDaysResource1"></asp:Label>
<asp:Label ID="lblLeaveCodeNotSelect" runat="server" Text="假別必須選擇" Style="display: none;" meta:resourcekey="lblLeaveCodeNotSelectResource1"></asp:Label>
<asp:Label ID="lblStartBigerEndErr" runat="server" Text="請假時間(起)不可晚於請假時間(訖)" Style="display: none;" meta:resourcekey="lblStartBigerEndErrResource1"></asp:Label>
<asp:Label ID="lblIsNotWorkDayErr" runat="server" Text="請假時間必須為上班日" Style="display: none;" meta:resourcekey="lblIsNotWorkDayErrResource1"></asp:Label>
<asp:Label ID="lblCrossYearErr" runat="server" Text="請假時間(起)(訖)需在同一年度" Style="display: none;" meta:resourcekey="lblCrossYearErrResource1"></asp:Label>
<asp:Label ID="lblStartTimeMatchWorkTimeErr" runat="server" Text="請假時間(起)要等於個人班表上班時間" Style="display: none;" meta:resourcekey="lblStartTimeMatchWorkTimeErrResource1"></asp:Label>
<asp:Label ID="lblCannotFindLeaveCode" runat="server" Text="找不到假別" Style="display: none;" meta:resourcekey="lblCannotFindLeaveCodeResource1"></asp:Label>
<asp:Label ID="lblCannotFindSetting" runat="server" Text="找不到工時設定" Style="display: none;" meta:resourcekey="lblCannotFindSettingResource1"></asp:Label>
<asp:Label ID="lblNotMinUnit" runat="server" Text="不符合假別的最小請假單位要求" Visible="False" meta:resourcekey="lblNotMinUnitResource1"></asp:Label>
<asp:Label ID="lblTitleUserLevData" runat="server" Text="可休假餘額查詢" Visible="False" meta:resourcekey="lblTitleUserLevDataResource1"></asp:Label>
<asp:Label ID="lblNoWorkDate" runat="server" Text="請確認請假起訖的區間，是否有設定班表，或是否有包含工作時間。" Style="display: none;" meta:resourcekey="lblNoWorkDateResource1"></asp:Label>
<asp:Label ID="lblHoursDaysEmpty" runat="server" Text="時(天)數不可為0或空白(請記得按下計算鈕)" Style="display: none;" meta:resourcekey="lblHoursDaysEmptyResource1"></asp:Label>
<asp:Label ID="lblClickButton" runat="server" Text="請記得按下計算鈕" Style="display: none;" meta:resourcekey="lblClickButtonResource1"></asp:Label>
<asp:Label ID="lblNoYear" runat="server" Text="沒有足夠可抵扣的年休假" Style="display: none;" meta:resourcekey="lblNoYearResource1"></asp:Label>
<asp:Label ID="lblNoTimeOff" runat="server" Text="沒有足夠可抵扣的補休假" Style="display: none;" meta:resourcekey="lblNoTimeOffResource1"></asp:Label>
<asp:Label ID="lblNoScalable" runat="server" Text="沒有足夠可抵扣的彈休假" Style="display: none;" meta:resourcekey="lblNoScalableResource1"></asp:Label>
<asp:Label ID="lblNoCharity" runat="server" Text="沒有足夠可抵扣的公益假" Style="display: none;" meta:resourcekey="lblNoCharityResource1"></asp:Label>
<asp:Label ID="lblNoDays" runat="server" Text="可休天數不足" Style="display: none;" meta:resourcekey="lblNoDaysResource1"></asp:Label>
<asp:Label ID="lblNoHours" runat="server" Text="可休時數不足" Style="display: none;" meta:resourcekey="lblNoHoursResource1"></asp:Label>
<asp:Label ID="lblRepeatLeave" runat="server" Text="請假時間重複" Style="display: none;" meta:resourcekey="lblRepeatLeaveResource1"></asp:Label>
<asp:Label ID="lblRepeatTravel" runat="server" Text="請假時間與出差時間重複" Style="display: none;" meta:resourcekey="lblRepeatTravelResource1"></asp:Label>
<asp:Label ID="lblRepeatOverTime" runat="server" Text="請假時間與加班時間重複" Style="display: none;" meta:resourcekey="lblRepeatOverTimeResource1"></asp:Label>
<asp:Label ID="lblNoLeaInfo" runat="server" Text="無法找到請假相關資訊，表單異常" Style="display: none;" meta:resourcekey="lblNoLeaInfoResource1"></asp:Label>
<asp:Label ID="lblStartEmpty" runat="server" Text="請假時間(起)不可為空白" Style="display: none;" meta:resourcekey="lblStartEmptyResource1"></asp:Label>
<asp:Label ID="lblEndEmpty" runat="server" Text="請假時間(訖)不可為空白" Style="display: none;" meta:resourcekey="lblEndEmptyResource1"></asp:Label>
<asp:Label ID="lblOverRepeatTimes" runat="server" Text="Label"  style=" display:none;" meta:resourcekey="lblOverRepeatTimesResource1"></asp:Label>
<asp:Label ID="lblOverRepeatTimesMsg0" runat="server" Text="可申請次數為" style=" display:none;" meta:resourcekey="lblOverRepeatTimesMsg0Resource1"></asp:Label>
<asp:Label ID="lblOverRepeatTimesMsg1" runat="server" Text="次"  style=" display:none;" meta:resourcekey="lblOverRepeatTimesMsg1Resource1"></asp:Label>
<asp:Label ID="lblOverRepeatTimesMsg2" runat="server" Text="，不允許申請"  style=" display:none;" meta:resourcekey="lblOverRepeatTimesMsg2Resource1"></asp:Label>
<asp:Label ID="lblHasNoAuthority" runat="server" Text="無填寫權限" ForeColor="Red" Visible="False" meta:resourcekey="lblHasNoAuthorityResource1"></asp:Label>
<asp:Label ID="lblToolTipMsg" runat="server" Text="不允許修改(唯讀)" Visible="False" meta:resourcekey="lblToolTipMsgResource1"></asp:Label>
<asp:Label ID="lblFiller" CssClass="FillerVisible" runat="server" meta:resourcekey="lblFillerResource1"></asp:Label>
<asp:Label ID="lblModifier" runat="server" Visible="False" meta:resourcekey="lblModifierResource1"></asp:Label>
<asp:Label ID="lblMsgSigner" runat="server" Text="填寫者" Visible="False" meta:resourcekey="lblMsgSignerResource1"></asp:Label>
<asp:Label ID="lblMsgEditor" runat="server" Text="修改者" Visible="False" meta:resourcekey="lblMsgEditorResource1"></asp:Label>
<asp:Label ID="lblAuthorityMsg" runat="server" Text="具填寫權限人員" Visible="False" meta:resourcekey="lblAuthorityMsgResource1"></asp:Label>
<asp:Label ID="lblLevDiffMsg" runat="server" Text="{0}(餘{1}{2}，{3}~{4})" Visible="False" meta:resourcekey="lblLevDiffMsgResource1"></asp:Label>
