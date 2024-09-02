<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UC_OverTimeParameter.ascx.cs" Inherits="EIP_Duty_Configuration_OverTime_UC_OverTimeParameter" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<script id="OverTimeParamJS" type="text/javascript">
    Sys.Application.add_load(function () {
        SetEnableWorkDayOT();
        SetEnableDayoffOT();
        SetEnableRoutineOT();
        SetEnableHolidayOT();
    });

    function OnValueChanging(sender, args) {
        if (args.get_newValue() === "" || isNaN(args.get_newValue())) {
            args.set_newValue(args.get_oldValue());
        }
    }

    function Setting_chbParentParmSetting_Click() {
        var toolbarbutton = $find("<%=parmSettingToolBar.ClientID%>").findItemByValue("useParent");
        var settingCheckBox = $telerik.findElement(toolbarbutton.get_element(), ("chbParentParmSetting"));
        if (settingCheckBox.checked) {
            if (!confirm('<%=lbConfirmCheckBox.Text%>'))
                settingCheckBox.checked = false;
            return false;
        }
    }

    function CheckInputDays(sender, args) {
        var rbTimeOffdays = $("#<%=rbTimeOffdays.ClientID%>");
        var rnTimeOff = $find("<%=rnTimeOff.ClientID%>").get_value();
        if (rbTimeOffdays.is(":checked")) {
            if (rnTimeOff === "") {
                args.IsValid = false;
            }
        }
    }

    function CheckMHourIsEmpty(e, args) {
        var m_MDay = $find("<%=rdMaleOTHour.ClientID%>").get_value();
        var m_SDay = $find("<%=rdMaleSeasonOTHour.ClientID%>").get_value();
        var m_WDay = $find("<%=rdMaleOTHourWDay.ClientID%>").get_value();
        var m_HDay = $find("<%=rdMaleOTHourHDay.ClientID%>").get_value();

        if (m_MDay === '' || m_SDay === '' || m_WDay === '' || m_HDay === '') {
            args.IsValid = false;
            return;
        }
    }

    function CheckFHourIsEmpty(e, args) {
        var f_MDay = $find("<%=rdFemaleOTHour.ClientID%>").get_value();
        var f_SDay = $find("<%=rdFemaleSeasonOTHour.ClientID%>").get_value();
        var f_WDay = $find("<%=rdFemaleOTHourWDay.ClientID%>").get_value();
        var f_HDay = $find("<%=rdFemaleOTHourHDay.ClientID%>").get_value();

        if (f_MDay === '' || f_SDay === '' || f_WDay === '' || f_HDay === '') {
            args.IsValid = false;
            return;
        }
    }

    function TimeOffCheckedChanged() {

        var rbTimeOffBySystem = $("#<%=rbTimeOffBySystem.ClientID %>");
        var rbTimeOffdays = $("#<%=rbTimeOffdays.ClientID %>");
        var rbTimeOffNoneAssign = $("#<%=rbTimeOffNoneAssign.ClientID %>");
        var rbTimeOffAssignRange = $("#<%=rbTimeOffAssignRange.ClientID %>");
        var rbTimeOffAnnualLeave = $("#<%=rbTimeOffAnnualLeave.ClientID %>");
        var rnTimeOff = $find("<%= rnTimeOff.ClientID %>");
        var ddlTimeOffMonth = $("#<%=ddlTimeOffMonth.ClientID %>");
        var ddlTimeOffDay = $("#<%=ddlTimeOffDay.ClientID %>");
        var ddlTimeOffNoneAssignMonth = $("#<%=ddlTimeOffNoneAssignMonth.ClientID %>");
        var ddlTimeOffNoneAssignDay = $("#<%=ddlTimeOffNoneAssignDay.ClientID %>");
        var ddlTimeOffAssignRange = $("#<%=ddlTimeOffAssignRange.ClientID %>");
        var ddlTimeOffAssignMonth = $("#<%=ddlTimeOffAssignMonth.ClientID %>");
        var ddlTimeOffAssignDay = $("#<%=ddlTimeOffAssignDay.ClientID %>");
        var ddlTimeOffAnnualLeave = $("#<%=ddlTimeOffAnnualLeave.ClientID %>");
        var cbIsByYearLeaveExpiryDate = $("#<%=cbIsByYearLeaveExpiryDate.ClientID %>");

        if (rbTimeOffBySystem.is(":checked")) {
            rnTimeOff.disable();
            ddlTimeOffMonth.prop('disabled', true);
            ddlTimeOffDay.prop('disabled', true);
            ddlTimeOffNoneAssignMonth.prop('disabled', true);
            ddlTimeOffNoneAssignDay.prop('disabled', true);
            ddlTimeOffAssignRange.prop('disabled', true);
            ddlTimeOffAssignMonth.prop('disabled', true);
            ddlTimeOffAssignDay.prop('disabled', true);
            ddlTimeOffAnnualLeave.prop('disabled', true);
            cbIsByYearLeaveExpiryDate.prop('disabled', true);
            cbIsByYearLeaveExpiryDate.prop("checked", false);
        }

        if (rbTimeOffdays.is(":checked")) {
            rnTimeOff.enable();
            ddlTimeOffMonth.prop('disabled', true);
            ddlTimeOffDay.prop('disabled', true);
            ddlTimeOffNoneAssignMonth.prop('disabled', true);
            ddlTimeOffNoneAssignDay.prop('disabled', true);
            ddlTimeOffAssignRange.prop('disabled', true);
            ddlTimeOffAssignMonth.prop('disabled', true);
            ddlTimeOffAssignDay.prop('disabled', true);
            ddlTimeOffAnnualLeave.prop('disabled', true);
            cbIsByYearLeaveExpiryDate.prop('disabled', false);
        }

        if (rbTimeOffNoneAssign.is(":checked")) {
            rnTimeOff.disable();
            ddlTimeOffMonth.prop('disabled', true);
            ddlTimeOffDay.prop('disabled', true);
            ddlTimeOffNoneAssignMonth.prop('disabled', false);
            ddlTimeOffNoneAssignDay.prop('disabled', false);
            ddlTimeOffAssignRange.prop('disabled', true);
            ddlTimeOffAssignMonth.prop('disabled', true);
            ddlTimeOffAssignDay.prop('disabled', true);
            ddlTimeOffAnnualLeave.prop('disabled', true);
            cbIsByYearLeaveExpiryDate.prop('disabled', false);
        }

        if (rbTimeOffAssignRange.is(":checked")) {
            rnTimeOff.disable();
            ddlTimeOffMonth.prop('disabled', true);
            ddlTimeOffDay.prop('disabled', true);
            ddlTimeOffNoneAssignMonth.prop('disabled', true);
            ddlTimeOffNoneAssignDay.prop('disabled', true);
            ddlTimeOffAssignRange.prop('disabled', false);
            ddlTimeOffAssignMonth.prop('disabled', false);
            ddlTimeOffAssignDay.prop('disabled', false);
            ddlTimeOffAnnualLeave.prop('disabled', true);
            cbIsByYearLeaveExpiryDate.prop('disabled', false);
        }

        if (rbTimeOffAnnualLeave.is(":checked")) {
            rnTimeOff.disable();
            ddlTimeOffMonth.prop('disabled', true);
            ddlTimeOffDay.prop('disabled', true);
            ddlTimeOffNoneAssignMonth.prop('disabled', true);
            ddlTimeOffNoneAssignDay.prop('disabled', true);
            ddlTimeOffAssignRange.prop('disabled', true);
            ddlTimeOffAssignMonth.prop('disabled', true);
            ddlTimeOffAssignDay.prop('disabled', true);
            ddlTimeOffAnnualLeave.prop('disabled', false);

            if (ddlTimeOffAnnualLeave.find('option:selected').val() == "ExpiryDate") {
                cbIsByYearLeaveExpiryDate.prop('disabled', true);
                cbIsByYearLeaveExpiryDate.prop("checked", false);
            } else {
                cbIsByYearLeaveExpiryDate.prop('disabled', false);
            }
        }
    }

    function TimeOffAnnualLeaveSelecedChanged() {
        var ddlTimeOffAnnualLeave = $("#<%=ddlTimeOffAnnualLeave.ClientID %>");
        var cbIsByYearLeaveExpiryDate = $("#<%=cbIsByYearLeaveExpiryDate.ClientID %>");
        if (ddlTimeOffAnnualLeave.find('option:selected').val() == "ExpiryDate") {
            cbIsByYearLeaveExpiryDate.prop('disabled', true);
            cbIsByYearLeaveExpiryDate.prop("checked", false);
        } else {
            cbIsByYearLeaveExpiryDate.prop('disabled', false);
        }
    }

    function TimeOffAssignSelecedChanged() {
        var culture = ("<%=Ede.Uof.EIP.SystemInfo.Current.Culture %>");
        var timeOffAssignRange = $("#<%=ddlTimeOffAssignRange.ClientID %>");
        var timeOffAssignMonth = $("#<%=ddlTimeOffAssignMonth.ClientID %>");
        var timeOffAssignDay = $("#<%=ddlTimeOffAssignDay.ClientID %>");
        var year;
        var month = parseInt(timeOffAssignMonth.find('option:selected').val());
        if (timeOffAssignRange.find('option:selected').val() == "Current") {
            year = new Date().getFullYear();
        } else {
            year = new Date().getFullYear() + 1;
        }
        var days = new Date(year, month, 0).getDate();
        timeOffAssignDay.empty();
        for (var i = 1; i <= days; i++) {
            if (culture == "zh-TW" || culture == "zh-CN") {
                timeOffAssignDay.append($('<option></option>').val(i).text(i + " <%= lblDay.Text%>"));
            } else {
                timeOffAssignDay.append($('<option></option>').val(i).text(i));
            }
        }
    }

    function SetEnableWorkDayOT() {
        var toolbarbutton = $find("<%=parmSettingToolBar.ClientID%>").findItemByValue("useParent");
        var settingCheckBox = $telerik.findElement(toolbarbutton.get_element(), ("chbParentParmSetting"));

        var bothcheck = $('#<%=cbWorkDayOTBoth.ClientID %>').is(":checked");
        var timeoff = $('#<%=cbWorkDayTimeoff.ClientID %>');
        var payment = $('#<%=cbWorkDayPayment.ClientID %>');

        if (!settingCheckBox.checked) {
            if (bothcheck == true) {
                timeoff.prop("checked", false);
                payment.prop("checked", false);
            }
        }
    }

    function SetWorkDayOTCheck() {
        var toolbarbutton = $find("<%=parmSettingToolBar.ClientID%>").findItemByValue("useParent");
        var settingCheckBox = $telerik.findElement(toolbarbutton.get_element(), ("chbParentParmSetting"));

        var both = $('#<%=cbWorkDayOTBoth.ClientID %>');
        var timeoffcheck = $('#<%=cbWorkDayTimeoff.ClientID %>').is(":checked");
        var paymentcheck = $('#<%=cbWorkDayPayment.ClientID %>').is(":checked");

        if (!settingCheckBox.checked) {
            if (timeoffcheck == true || paymentcheck == true) {
                both.prop("checked", false);
            }
        }
    }

    function CheckWorkDayChangeType(sender, args) {
        var overTimeCheck = $('#<%=cbOverTimeWorkDay.ClientID %>').is(":checked");//可加班
        var timeoffCheck = $('#<%=cbWorkDayTimeoff.ClientID %>').is(":checked");//轉補休
        var paymentCheck = $('#<%=cbWorkDayPayment.ClientID %>').is(":checked");//轉費用
        var bothCheck = $('#<%=cbWorkDayOTBoth.ClientID %>').is(":checked");//轉補休及費用

        if (overTimeCheck == true) {
            if (timeoffCheck == false && paymentCheck == false && bothCheck == false) {
                $('#<%=cbWorkDayTimeoff.ClientID %>').focus();
                args.IsValid = false;
            }
            else {
                args.IsValid = true;
            }
        }
        else {
            args.IsValid = true;
        }
    }

    function SetDayoffOTCheck() {
        var toolbarbutton = $find("<%=parmSettingToolBar.ClientID%>").findItemByValue("useParent");
        var settingCheckBox = $telerik.findElement(toolbarbutton.get_element(), ("chbParentParmSetting"));

        var both = $('#<%=cbDayoffOTBoth.ClientID %>');
        var timeoffcheck = $('#<%=cbDayoffTimeoff.ClientID %>').is(":checked");
        var paymentcheck = $('#<%=cbDayoffPayment.ClientID %>').is(":checked");

        if (!settingCheckBox.checked) {
            if (timeoffcheck == true || paymentcheck == true) {
                both.prop("checked", false);
            }
        }
    }

    function SetEnableDayoffOT() {
        var toolbarbutton = $find("<%=parmSettingToolBar.ClientID%>").findItemByValue("useParent");
        var settingCheckBox = $telerik.findElement(toolbarbutton.get_element(), ("chbParentParmSetting"));

        var bothcheck = $('#<%=cbDayoffOTBoth.ClientID %>').is(":checked");
        var timeoff = $('#<%=cbDayoffTimeoff.ClientID %>');
        var payment = $('#<%=cbDayoffPayment.ClientID %>');

        if (!settingCheckBox.checked) {
            if (bothcheck == true) {
                timeoff.prop("checked", false);
                payment.prop("checked", false);
            }
        }
    }

    function CheckDayoffChangeType(sender, args) {
        var overTimeCheck = $('#<%=cbOverTimeDayoff.ClientID %>').is(":checked");//可加班
        var timeoffCheck = $('#<%=cbDayoffTimeoff.ClientID %>').is(":checked");//轉補休
        var paymentCheck = $('#<%=cbDayoffPayment.ClientID %>').is(":checked");//轉費用
        var bothCheck = $('#<%=cbDayoffOTBoth.ClientID %>').is(":checked");//轉補休及費用

        if (overTimeCheck == true) {
            if (timeoffCheck == false && paymentCheck == false && bothCheck == false) {
                $('#<%=cbDayoffTimeoff.ClientID %>').focus();
                args.IsValid = false;
            }
            else {
                args.IsValid = true;
            }
        }
        else {
            args.IsValid = true;
        }
    }

    function SetRoutineOTCheck() {
        var toolbarbutton = $find("<%=parmSettingToolBar.ClientID%>").findItemByValue("useParent");
        var settingCheckBox = $telerik.findElement(toolbarbutton.get_element(), ("chbParentParmSetting"));
        var both = $('#<%=cbRoutineOTBoth.ClientID %>');
        var timeoffcheck = $('#<%=cbRoutineTimeoff.ClientID %>').is(":checked");
        var paymentcheck = $('#<%=cbRoutinePayment.ClientID %>').is(":checked");

        if (!settingCheckBox.checked) {
            if (timeoffcheck == true || paymentcheck == true) {
                both.prop("checked", false);
            }
        }
    }

    function SetEnableRoutineOT() {
        var toolbarbutton = $find("<%=parmSettingToolBar.ClientID%>").findItemByValue("useParent");
        var settingCheckBox = $telerik.findElement(toolbarbutton.get_element(), ("chbParentParmSetting"));
        var bothcheck = $('#<%=cbRoutineOTBoth.ClientID %>').is(":checked");
        var timeoff = $('#<%=cbRoutineTimeoff.ClientID %>');
        var payment = $('#<%=cbRoutinePayment.ClientID %>');

        if (!settingCheckBox.checked) {
            if (bothcheck == true) {
                timeoff.prop("checked", false);
                payment.prop("checked", false);
            }
        }
    }

    function CheckRoutineChangeType(sender, args) {
        var overTimeCheck = $('#<%=cbOverTimeRoutine.ClientID %>').is(":checked");//可加班
        var timeoffCheck = $('#<%=cbRoutineTimeoff.ClientID %>').is(":checked");//轉補休
        var paymentCheck = $('#<%=cbRoutinePayment.ClientID %>').is(":checked");//轉費用
        var bothCheck = $('#<%=cbRoutineOTBoth.ClientID %>').is(":checked");//轉補休及費用

        if (overTimeCheck == true) {
            if (timeoffCheck == false && paymentCheck == false && bothCheck == false) {
                $('#<%=cbRoutineTimeoff.ClientID %>').focus();
                args.IsValid = false;
            }
            else {
                args.IsValid = true;
            }
        }
        else {
            args.IsValid = true;
        }
    }

    function SetHolidayOTCheck() {
        var toolbarbutton = $find("<%=parmSettingToolBar.ClientID%>").findItemByValue("useParent");
        var settingCheckBox = $telerik.findElement(toolbarbutton.get_element(), ("chbParentParmSetting"));
        var both = $('#<%=cbHolidayOTBoth.ClientID %>');
        var timeoffcheck = $('#<%=cbHolidayTimeoff.ClientID %>').is(":checked");
        var paymentcheck = $('#<%=cbHolidayPayment.ClientID %>').is(":checked");

        if (!settingCheckBox.checked) {
            if (timeoffcheck == true || paymentcheck == true) {
                both.prop("checked", false);
            }
        }
    }

    function SetEnableHolidayOT() {
        var toolbarbutton = $find("<%=parmSettingToolBar.ClientID%>").findItemByValue("useParent");
        var settingCheckBox = $telerik.findElement(toolbarbutton.get_element(), ("chbParentParmSetting"));
        var bothcheck = $('#<%=cbHolidayOTBoth.ClientID %>').is(":checked");
        var timeoff = $('#<%=cbHolidayTimeoff.ClientID %>');
        var payment = $('#<%=cbHolidayPayment.ClientID %>');

        if (!settingCheckBox.checked) {
            if (bothcheck == true) {
                timeoff.prop("checked", false);
                payment.prop("checked", false);
            }
        }
    }

    function CheckHolidayChangeType(sender, args) {
        var overTimeCheck = $('#<%=cbOverTimeHoliday.ClientID %>').is(":checked");//可加班
        var timeoffCheck = $('#<%=cbHolidayTimeoff.ClientID %>').is(":checked");//轉補休
        var paymentCheck = $('#<%=cbHolidayPayment.ClientID %>').is(":checked");//轉費用
        var bothCheck = $('#<%=cbHolidayOTBoth.ClientID %>').is(":checked");//轉補休及費用

        if (overTimeCheck == true) {
            if (timeoffCheck == false && paymentCheck == false && bothCheck == false) {
                $('#<%=cbHolidayTimeoff.ClientID %>').focus();
                args.IsValid = false;
            }
            else {
                args.IsValid = true;
            }
        }
        else {
            args.IsValid = true;
        }
    }

    function MonthlyStartDateChanged() {
        var monthlyStartDate = $("#<%=ddlMonthlyStartDate.ClientID %>");
        var firstQuarterStartDay = $("#<%=txtFirstQuarterStartDay.ClientID %>");
        firstQuarterStartDay.val(monthlyStartDate.find('option:selected').text());
    }

    function WorkDayCheckedChanged() {
        var overTimeWorkDayAll = $("#<%=rbOverTimeWorkDayAll.ClientID %>");
        var overTimeWorkDayPeriod = $("#<%=rbOverTimeWorkDayPeriod.ClientID %>");
        var overTimeWorkDayNone = $("#<%=rbOverTimeWorkDayNone.ClientID %>");
        var overTimeWorkDayFrom = $find("<%= rnOverTimeWorkDayFrom.ClientID %>");
        var overTimeWorkDayTo = $find("<%=rnOverTimeWorkDayTo.ClientID %>");
        if (overTimeWorkDayAll.is(":checked") || overTimeWorkDayNone.is(":checked")) {
            overTimeWorkDayFrom.disable();
            overTimeWorkDayTo.disable();
        }

        if (overTimeWorkDayPeriod.is(":checked")) {
            overTimeWorkDayFrom.enable();
            overTimeWorkDayTo.enable();
        }
    }

    function DayoffCheckedChanged(){
        var overTimeDayoffAll = $("#<%=rbOverTimeDayoffAll.ClientID %>");
        var overTimeDayoffPeriod = $("#<%=rbOverTimeDayoffPeriod.ClientID %>");
        var overTimeDayoffNone = $("#<%=rbOverTimeDayoffNone.ClientID %>");
        var overTimeDayoffFrom = $find("<%=rnOverTimeDayoffFrom.ClientID %>");
        var overTimeDayoffTo = $find("<%=rnOverTimeDayoffTo.ClientID %>");
        if (overTimeDayoffAll.is(":checked") || overTimeDayoffNone.is(":checked")) {
            overTimeDayoffFrom.disable();
            overTimeDayoffTo.disable();
        }

        if (overTimeDayoffPeriod.is(":checked")) {
            overTimeDayoffFrom.enable();
            overTimeDayoffTo.enable();
        }
    }

    function RoutineCheckedChanged() {
        var overTimeRoutineAll = $("#<%=rbOverTimeRoutineAll.ClientID %>");
        var overTimeRoutinePeriod = $("#<%=rbOverTimeRoutinePeriod.ClientID %>");
        var overTimeRoutineNone = $("#<%=rbOverTimeRoutineNone.ClientID %>");
        var overTimeRoutineFrom = $find("<%=rnOverTimeRoutineFrom.ClientID %>");
        var overTimeRoutineTo = $find("<%=rnOverTimeRoutineTo.ClientID %>");
        if (overTimeRoutineAll.is(":checked") || overTimeRoutineNone.is(":checked")) {
            overTimeRoutineFrom.disable();
            overTimeRoutineTo.disable();
        }

        if (overTimeRoutinePeriod.is(":checked")) {
            overTimeRoutineFrom.enable();
            overTimeRoutineTo.enable();
        }
    }

    function HolidayCheckedChanged() {
        var overTimeHolidayAll = $("#<%=rbOverTimeHolidayAll.ClientID %>");
        var overTimeHolidayPeriod = $("#<%=rbOverTimeHolidayPeriod.ClientID %>");
        var overTimeHolidayNone = $("#<%=rbOverTimeHolidayNone.ClientID %>");
        var overTimeHolidayFrom = $find("<%=rnOverTimeHolidayFrom.ClientID %>");
        var overTimeHolidayTo = $find("<%=rnOverTimeHolidayTo.ClientID %>");
        if (overTimeHolidayAll.is(":checked") || overTimeHolidayNone.is(":checked")) {
            overTimeHolidayFrom.disable();
            overTimeHolidayTo.disable();
        }

        if (overTimeHolidayPeriod.is(":checked")) {
            overTimeHolidayFrom.enable();
            overTimeHolidayTo.enable();
        }
    }

    function CheckWorkDayInputHours(sender, args) {
        var overTimeWorkDayPeriod = $("#<%=rbOverTimeWorkDayPeriod.ClientID%>");
        var overTimeWorkDayFrom = $find("<%=rnOverTimeWorkDayFrom.ClientID%>").get_value();
        var overTimeWorkDayTo = $find("<%=rnOverTimeWorkDayTo.ClientID %>").get_value();
        if (overTimeWorkDayPeriod.is(":checked")) {
            if (overTimeWorkDayFrom === "" || overTimeWorkDayTo === "") {
                if (overTimeWorkDayFrom === "")
                    $find("<%=rnOverTimeWorkDayFrom.ClientID%>").focus();
                if (overTimeWorkDayTo === "")
                    $find("<%=rnOverTimeWorkDayTo.ClientID%>").focus();
                args.IsValid = false;
            }
        }
    }

    function CheckDayoffInputHours(sender, args) {
        var overTimeDayoffPeriod = $("#<%=rbOverTimeDayoffPeriod.ClientID %>");
        var overTimeDayoffFrom = $find("<%=rnOverTimeDayoffFrom.ClientID %>").get_value();
        var overTimeDayoffTo = $find("<%=rnOverTimeDayoffTo.ClientID %>").get_value();
        if (overTimeDayoffPeriod.is(":checked")) {
            if (overTimeDayoffFrom === "" || overTimeDayoffTo === "") {
                if (overTimeDayoffFrom === "")
                    $find("<%=rnOverTimeDayoffFrom.ClientID %>").focus();
                if (overTimeDayoffTo === "")
                    $find("<%=rnOverTimeDayoffTo.ClientID %>").focus();
                args.IsValid = false;
            }
        }
    }
    function CheckRoutineInputHours(sender, args) {
        var overTimeRoutinePeriod = $("#<%=rbOverTimeRoutinePeriod.ClientID %>");
        var overTimeRoutineFrom = $find("<%=rnOverTimeRoutineFrom.ClientID %>").get_value();
        var overTimeRoutineTo = $find("<%=rnOverTimeRoutineTo.ClientID %>").get_value();
        if (overTimeRoutinePeriod.is(":checked")) {
            if (overTimeRoutineFrom === "" || overTimeRoutineTo === "") {
                if (overTimeRoutineFrom === "")
                    $find("<%=rnOverTimeRoutineFrom.ClientID %>").focus();
                if (overTimeRoutineTo === "")
                    $find("<%=rnOverTimeRoutineTo.ClientID %>").focus();
                args.IsValid = false;
            }
        }
    }
    function CheckHolidayInputHours(sender, args) {
        var overTimeHolidayPeriod = $("#<%=rbOverTimeHolidayPeriod.ClientID%>");
        var overTimeHolidayFrom = $find("<%=rnOverTimeHolidayFrom.ClientID%>").get_value();
        var overTimeHolidayTo = $find("<%=rnOverTimeHolidayTo.ClientID %>").get_value();
        if (overTimeHolidayPeriod.is(":checked")) {
            if (overTimeHolidayFrom === "" || overTimeHolidayTo === "") {
                if (overTimeHolidayFrom === "")
                    $find("<%=rnOverTimeHolidayFrom.ClientID%>").focus();
                if (overTimeHolidayTo === "")
                    $find("<%=rnOverTimeHolidayTo.ClientID%>").focus();
                args.IsValid = false;
            }
        }
    }
</script>
<style type="text/css">
    .RightAligned {
        text-align: right;
    }
</style>
<telerik:RadToolBar ID="parmSettingToolBar" runat="server" Width="100%" OnButtonClick="parmSettingToolBar_ButtonClick" SingleClick="None" meta:resourcekey="parmSettingToolBarResource1">
    <Items>
        <telerik:RadToolBarButton runat="server" Value="useParent" meta:resourcekey="RadToolBarButtonResource1">
            <ItemTemplate>
                <asp:CheckBox ID="chbParentParmSetting" runat="server" Text="使用上一部門設定" AutoPostBack="True"
                    OnCheckedChanged="chbParentParmSetting_CheckedChanged" onClick="Setting_chbParentParmSetting_Click()" meta:resourcekey="chbParentParmSettingResource1" />
            </ItemTemplate>
        </telerik:RadToolBarButton>
        <telerik:RadToolBarButton IsSeparator="True" meta:resourcekey="RadToolBarButtonResource2"></telerik:RadToolBarButton>
        <telerik:RadToolBarButton runat="server" Text="儲存" Value="Save" ValidationGroup="vgCheckInputDays"
            CheckedImageUrl="~/Common/Images/Icon/icon_m01.png"
            DisabledImageUrl="~/Common/Images/Icon/icon_m01.png"
            HoveredImageUrl="~/Common/Images/Icon/icon_m01.png"
            ImageUrl="~/Common/Images/Icon/icon_m01.png" meta:resourcekey="RadToolBarButtonResource3">
        </telerik:RadToolBarButton>
        <telerik:RadToolBarButton IsSeparator="true" meta:resourcekey="RadToolBarButtonResource4"></telerik:RadToolBarButton>
    </Items>
</telerik:RadToolBar>

<table width="100%" class="PopTable">
    <tr>
        <td>
            <span style="color: #ff0000">*</span><asp:Label ID="Label36" runat="server" Text="加班計算週期" meta:resourcekey="Label36Resource1"></asp:Label>
        </td>
        <td>
            <table>
                <tr>
                    <td>
                        <asp:Label ID="Label34" runat="server" Text="每月起始日" meta:resourcekey="Label34Resource1"></asp:Label>
                        <asp:DropDownList ID="ddlMonthlyStartDate" runat="server" onchange="MonthlyStartDateChanged()" meta:resourcekey="ddlMonthlyStartDateResource1"></asp:DropDownList>
                        <asp:Label ID="Label37" runat="server" Text="若設定為25日，則計算週期為25日至次月24日，若當月無應對日期則以最接近日為主" ForeColor="Blue" meta:resourcekey="Label37Resource1"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label35" runat="server" Text="第一季起始日" meta:resourcekey="Label35Resource1"></asp:Label>
                        <asp:DropDownList ID="ddlFirstQuarterStartMonth" runat="server" meta:resourcekey="ddlFirstQuarterStartMonthResource1"></asp:DropDownList>
                        <asp:TextBox ID="txtFirstQuarterStartDay" runat="server" Enabled="False" Width="50px" meta:resourcekey="txtFirstQuarterStartDayResource1"></asp:TextBox>
                        <asp:Label ID="Label38" runat="server" Text="若設定為1月10日，則第一季為1/10~4/9，第二季為4/10~7/9，依此類推" ForeColor="Blue" meta:resourcekey="Label38Resource1"></asp:Label>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td style="white-space: nowrap;">
            <span style="color: #ff0000">*</span><asp:Label ID="Label3" runat="server"
                Text="男性加班時數上限" meta:resourcekey="Label3Resource1"></asp:Label>
        </td>
        <td style="white-space: nowrap;">
            <table>
                <tr>
                    <td>
                        <asp:Label ID="Label9" runat="server" Text="每月:" meta:resourcekey="Label9Resource1"></asp:Label>
                    </td>
                    <td>
                        <telerik:RadNumericTextBox ID="rdMaleOTHour" runat="server" Value="0" MinValue="0" MaxValue="999.9" MaxLength="5" Width="100px" CssClass="RightAligned" DataType="System.Decimal" Culture="zh-TW" DbValueFactor="1" LabelWidth="40px" meta:resourcekey="rdMaleOTHourResource1">
                            <ClientEvents OnValueChanging="OnValueChanging" />
                        </telerik:RadNumericTextBox>
                    </td>
                    <td>
                        <asp:Label ID="Label2" runat="server" Text="小時" meta:resourcekey="Label2Resource1"></asp:Label>
                    </td>
                    <td style="width: 30px;"></td>
                    <td>
                        <asp:Label ID="Label16" runat="server" Text="每季:" meta:resourcekey="Label16Resource1"></asp:Label>
                    </td>
                    <td>
                        <telerik:RadNumericTextBox ID="rdMaleSeasonOTHour" runat="server" CssClass="RightAligned" Value="0" MinValue="0" Width="100px" MaxValue="999.9" MaxLength="5" DataType="System.Decimal" Culture="zh-TW" DbValueFactor="1" LabelWidth="40px" meta:resourcekey="rdMaleSeasonOTHourResource1">
                            <ClientEvents OnValueChanging="OnValueChanging" />
                        </telerik:RadNumericTextBox>
                    </td>
                    <td>
                        <asp:Label ID="Label28" runat="server" Text="小時" meta:resourcekey="Label28Resource1"></asp:Label>
                    </td>
                    <td style="width: 30px;"></td>
                    <td>
                        <asp:Label ID="Label11" runat="server" Text="平日每日:" meta:resourcekey="Label11Resource1"></asp:Label>
                    </td>
                    <td>
                        <telerik:RadNumericTextBox ID="rdMaleOTHourWDay" runat="server" CssClass="RightAligned" Value="0" MinValue="0" Width="100px" MaxValue="999.9" MaxLength="5" DataType="System.Decimal" Culture="zh-TW" DbValueFactor="1" LabelWidth="40px" meta:resourcekey="rdMaleOTHourWDayResource1">
                            <ClientEvents OnValueChanging="OnValueChanging" />
                        </telerik:RadNumericTextBox>
                    </td>
                    <td>
                        <asp:Label ID="Label12" runat="server" Text="小時" meta:resourcekey="Label12Resource1"></asp:Label>
                    </td>
                    <td style="width: 30px;"></td>
                    <td>
                        <asp:Label ID="Label20" runat="server" Text="假日每日:" meta:resourcekey="Label20Resource1"></asp:Label>
                    </td>
                    <td>
                        <telerik:RadNumericTextBox ID="rdMaleOTHourHDay" runat="server" CssClass="RightAligned" Value="0" MinValue="0" Width="100px" MaxValue="999.9" MaxLength="5" DataType="System.Decimal" Culture="zh-TW" DbValueFactor="1" LabelWidth="40px" meta:resourcekey="rdMaleOTHourHDayResource1">
                            <ClientEvents OnValueChanging="OnValueChanging" />
                        </telerik:RadNumericTextBox>
                    </td>
                    <td>
                        <asp:Label ID="Label21" runat="server" Text="小時" meta:resourcekey="Label21Resource1"></asp:Label>
                    </td>
                    <td style="width: 30px;"></td>
                    <td>
                        <asp:CustomValidator ID="cvCheckMHourIsEmpty" runat="server" ErrorMessage="時數上限不可為空白" Display="Dynamic" ClientValidationFunction="CheckMHourIsEmpty" ValidationGroup="vgCheckInputDays" meta:resourcekey="cvCheckMHourIsEmptyResource1"></asp:CustomValidator>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td>
            <span style="color: #ff0000">*</span><asp:Label ID="Label5" runat="server" Text="女性加班時數上限" meta:resourcekey="Label5Resource1"></asp:Label>
        </td>
        <td>
            <table>
                <tr>
                    <td>
                        <asp:Label ID="Label17" runat="server" Text="每月:" meta:resourcekey="Label17Resource1"></asp:Label>
                    </td>
                    <td>
                        <telerik:RadNumericTextBox ID="rdFemaleOTHour" runat="server" CssClass="RightAligned" Value="0" MinValue="0" Width="100px" MaxValue="999.9" MaxLength="5" DataType="System.Decimal" Culture="zh-TW" DbValueFactor="1" LabelWidth="40px" meta:resourcekey="rdFemaleOTHourResource1">
                            <ClientEvents OnValueChanging="OnValueChanging" />
                        </telerik:RadNumericTextBox>
                    </td>
                    <td>
                        <asp:Label ID="Label15" runat="server" Text="小時" meta:resourcekey="Label15Resource1"></asp:Label>
                    </td>
                    <td style="width: 30px;"></td>
                    <td>
                        <asp:Label ID="Label29" runat="server" Text="每季:" meta:resourcekey="Label29Resource1"></asp:Label>
                    </td>
                    <td>
                        <telerik:RadNumericTextBox ID="rdFemaleSeasonOTHour" runat="server" CssClass="RightAligned" Value="0" MinValue="0" Width="100px" MaxValue="999.9" MaxLength="5" DataType="System.Decimal" Culture="zh-TW" DbValueFactor="1" LabelWidth="40px" meta:resourcekey="rdFemaleSeasonOTHourResource1">
                            <ClientEvents OnValueChanging="OnValueChanging" />
                        </telerik:RadNumericTextBox>
                    </td>
                    <td>
                        <asp:Label ID="Label30" runat="server" Text="小時" meta:resourcekey="Label30Resource1"></asp:Label>
                    </td>
                    <td style="width: 30px;"></td>
                    <td>
                        <asp:Label ID="Label18" runat="server" Text="平日每日:" meta:resourcekey="Label18Resource1"></asp:Label>
                    </td>
                    <td>
                        <telerik:RadNumericTextBox ID="rdFemaleOTHourWDay" runat="server" CssClass="RightAligned" Value="0" MinValue="0" Width="100px" MaxValue="999.9" MaxLength="5" DataType="System.Decimal" Culture="zh-TW" DbValueFactor="1" LabelWidth="40px" meta:resourcekey="rdFemaleOTHourWDayResource1">
                            <ClientEvents OnValueChanging="OnValueChanging" />
                        </telerik:RadNumericTextBox>
                    </td>
                    <td>
                        <asp:Label ID="Label19" runat="server" Text="小時" meta:resourcekey="Label19Resource1"></asp:Label>
                    </td>
                    <td style="width: 30px;"></td>
                    <td>
                        <asp:Label ID="Label22" runat="server" Text="假日每日:" meta:resourcekey="Label22Resource1"></asp:Label>
                    </td>
                    <td>
                        <telerik:RadNumericTextBox ID="rdFemaleOTHourHDay" runat="server" CssClass="RightAligned" Value="0" MinValue="0" Width="100px" MaxValue="999.9" MaxLength="5" DataType="System.Decimal" Culture="zh-TW" DbValueFactor="1" LabelWidth="40px" meta:resourcekey="rdFemaleOTHourHDayResource1">
                            <ClientEvents OnValueChanging="OnValueChanging" />
                        </telerik:RadNumericTextBox>
                    </td>
                    <td>
                        <asp:Label ID="Label23" runat="server" Text="小時" meta:resourcekey="Label23Resource1"></asp:Label>
                    </td>
                    <td style="width: 30px;"></td>
                    <td>
                        <asp:CustomValidator ID="cvCheckFHourIsEmpty" runat="server" ErrorMessage="時數上限不可為空白" Display="Dynamic" ClientValidationFunction="CheckFHourIsEmpty" ValidationGroup="vgCheckInputDays" meta:resourcekey="cvCheckFHourIsEmptyResource1"></asp:CustomValidator>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td>
            <asp:Label ID="Label31" runat="server" Text="加班上限控制" meta:resourcekey="Label31Resource1"></asp:Label>
        </td>
        <td>
            <table>
                <tr>
                    <td>
                        <asp:CheckBox ID="cbOTUpperLimit" runat="server" Text="每月" meta:resourcekey="cbOTUpperLimitResource1" />&nbsp;&nbsp;
                    </td>
                    <td>
                        <asp:CheckBox ID="cbOTUpperLimitSeason" runat="server" Text="每季" meta:resourcekey="cbOTUpperLimitSeasonResource1" />&nbsp;&nbsp;
                    </td>
                    <td>
                        <asp:CheckBox ID="cbOTUpperLimitWDay" runat="server" Text="平日" meta:resourcekey="cbOTUpperLimitWDayResource1" />&nbsp;&nbsp;
                    </td>
                    <td>
                        <asp:CheckBox ID="cbOTUpperLimitHDay" runat="server" Text="假日" meta:resourcekey="cbOTUpperLimitHDayResource1" />&nbsp;&nbsp;
                    </td>
                    <td>
                        <asp:Label ID="Label32" runat="server" Text="加班時數累計超出上限時無法申請加班" meta:resourcekey="Label32Resource1"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td colspan="5">
                        <asp:Label ID="Label33" runat="server" Text="未勾選項目表示當加班時數累計超出上限時會顯示提示訊息，但仍可申請加班" ForeColor="Blue" meta:resourcekey="Label33Resource1"></asp:Label>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td>
            <span style="color: #ff0000">*</span><asp:Label ID="lblTimeOffTitle" runat="server" Text="補休假可用期限" meta:resourcekey="lblTimeOffTitleResource1"></asp:Label>
        </td>
        <td>
            <table style="text-align: left;">
                <tr>
                    <td>
                        <asp:RadioButton ID="rbTimeOffBySystem" runat="server" GroupName="TimeOffSelect" onclick="TimeOffCheckedChanged()" meta:resourcekey="rbTimeOffBySystemResource1" />
                    </td>
                    <td colspan="4">
                        <asp:Label ID="lblTimeOffBySystem" runat="server" Text="依系統設定" meta:resourcekey="lblTimeOffBySystemResource1"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:RadioButton ID="rbTimeOffdays" runat="server" GroupName="TimeOffSelect" onclick="TimeOffCheckedChanged()" meta:resourcekey="rbTimeOffdaysResource1" />
                    </td>
                    <td>
                        <asp:Label ID="lblTimeOffAfter" runat="server" Text="加班日起" meta:resourcekey="lblTimeOffAfterResource1"></asp:Label>
                    </td>
                    <td>
                        <telerik:RadNumericTextBox ID="rnTimeOff" MaxLength="4" MinValue="1" MaxValue="9999"
                            Width="50px" runat="server" DataType="System.Decimal" Culture="zh-TW"
                            DbValueFactor="1" LabelWidth="64px" meta:resourcekey="rnTimeOffResource1">
                            <NegativeStyle Resize="None" />
                            <NumberFormat DecimalDigits="0" ZeroPattern="n" />
                            <ClientEvents OnValueChanging="OnValueChanging" />
                            <EmptyMessageStyle Resize="None" />
                            <ReadOnlyStyle Resize="None" />
                            <FocusedStyle Resize="None" />
                            <DisabledStyle Resize="None" />
                            <InvalidStyle Resize="None" />
                            <HoveredStyle Resize="None" />
                            <EnabledStyle HorizontalAlign="Right" Resize="None" />
                        </telerik:RadNumericTextBox>
                    </td>
                    <td style="text-align: left">
                        <asp:Label ID="lblTimeOffDay" runat="server" Text="天" meta:resourcekey="lblTimeOffDayResource1"></asp:Label>
                        <asp:Label ID="Label103" runat="server" Text="輸入範圍為1~9999" ForeColor="Blue" meta:resourcekey="Label103Resource1"></asp:Label>
                    </td>
                    <td>
                        <asp:CustomValidator ID="cvCheckInputDays" runat="server" ErrorMessage="請輸入天數" Display="Dynamic" ClientValidationFunction="CheckInputDays" ValidationGroup="vgCheckInputDays" meta:resourcekey="cvCheckInputDaysResource1"></asp:CustomValidator>
                    </td>
                </tr>
            </table>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <table style="text-align: left; display: none;">
                        <tr>
                            <td>
                                <asp:RadioButton ID="rbTimeOffdate" runat="server" GroupName="TimeOffSelect" meta:resourcekey="rbTimeOffdateResource1" />
                            </td>
                            <td>
                                <asp:Label ID="lblTimeOffEnd" runat="server" Text="截止日" meta:resourcekey="lblTimeOffEndResource1"></asp:Label>
                            </td>
                            <td>
                                <asp:UpdatePanel ID="UpdatePanel13" runat="server">
                                    <ContentTemplate>
                                        <asp:DropDownList ID="ddlTimeOffMonth" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlTimeOffMonth_SelectedIndexChanged" meta:resourcekey="ddlTimeOffMonthResource1"></asp:DropDownList>
                                        <asp:DropDownList ID="ddlTimeOffDay" runat="server" meta:resourcekey="ddlTimeOffDayResource1"></asp:DropDownList>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </td>
                        </tr>
                    </table>
                </ContentTemplate>
            </asp:UpdatePanel>
            <table style="white-space: nowrap">
                <tr>
                    <td>
                        <asp:RadioButton ID="rbTimeOffAssignRange" runat="server" GroupName="TimeOffSelect" onclick="TimeOffCheckedChanged()" meta:resourcekey="rbTimeOffAssignRangeResource1" />
                    </td>
                    <td>
                        <asp:Label ID="Label105" runat="server" Text="加班日" meta:resourcekey="Label105Resource1"></asp:Label>
                    </td>
                    <td>
                        <asp:UpdatePanel ID="UpdatePanel24" runat="server">
                            <ContentTemplate>
                                <asp:DropDownList ID="ddlTimeOffAssignRange" runat="server" onchange="TimeOffAssignSelecedChanged()" meta:resourcekey="ddlTimeOffAssignRangeResource1">
                                    <asp:ListItem Selected="True" Text="當年度" Value="Current" meta:resourcekey="ListItemResource1"></asp:ListItem>
                                    <asp:ListItem Text="次年度" Value="Next" meta:resourcekey="ListItemResource2"></asp:ListItem>
                                </asp:DropDownList>
                                <asp:DropDownList ID="ddlTimeOffAssignMonth" runat="server" onchange="TimeOffAssignSelecedChanged()" meta:resourcekey="ddlTimeOffAssignMonthResource1"></asp:DropDownList>
                                <asp:DropDownList ID="ddlTimeOffAssignDay" runat="server" meta:resourcekey="ddlTimeOffAssignDayResource1"></asp:DropDownList>
                            </ContentTemplate>
                            <Triggers>
                            </Triggers>
                        </asp:UpdatePanel>
                    </td>
                </tr>
            </table>
            <table style="white-space: nowrap">
                <tr>
                    <td>
                        <asp:RadioButton ID="rbTimeOffNoneAssign" runat="server" GroupName="TimeOffSelect" onclick="TimeOffCheckedChanged()" meta:resourcekey="rbTimeOffNoneAssignResource1" />
                    </td>
                    <td>
                        <asp:Label ID="lblTimeOffAfter2" runat="server" Text="加班日起" meta:resourcekey="lblTimeOffAfter2Resource1"></asp:Label>
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlTimeOffNoneAssignMonth" runat="server" meta:resourcekey="ddlTimeOffNoneAssignMonthResource1">
                            <asp:ListItem Selected="True" Text="當月" Value="0" meta:resourcekey="ListItemResource3"></asp:ListItem>
                            <asp:ListItem Text="次月" Value="1" meta:resourcekey="ListItemResource4"></asp:ListItem>
                            <asp:ListItem Text="2個月後" Value="2" meta:resourcekey="ListItemResource5"></asp:ListItem>
                            <asp:ListItem Text="3個月後" Value="3" meta:resourcekey="ListItemResource6"></asp:ListItem>
                            <asp:ListItem Text="4個月後" Value="4" meta:resourcekey="ListItemResource7"></asp:ListItem>
                            <asp:ListItem Text="5個月後" Value="5" meta:resourcekey="ListItemResource8"></asp:ListItem>
                            <asp:ListItem Text="6個月後" Value="6" meta:resourcekey="ListItemResource9"></asp:ListItem>
                            <asp:ListItem Text="7個月後" Value="7" meta:resourcekey="ListItemResource10"></asp:ListItem>
                            <asp:ListItem Text="8個月後" Value="8" meta:resourcekey="ListItemResource11"></asp:ListItem>
                            <asp:ListItem Text="9個月後" Value="9" meta:resourcekey="ListItemResource12"></asp:ListItem>
                            <asp:ListItem Text="10個月後" Value="10" meta:resourcekey="ListItemResource13"></asp:ListItem>
                            <asp:ListItem Text="11個月後" Value="11" meta:resourcekey="ListItemResource14"></asp:ListItem>
                            <asp:ListItem Text="12個月後" Value="12" meta:resourcekey="ListItemResource15"></asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlTimeOffNoneAssignDay" runat="server" meta:resourcekey="ddlTimeOffNoneAssignDayResource1"></asp:DropDownList>
                    </td>
                    <td>
                        <asp:Label ID="Label104" runat="server" Text="若該月份沒有所設定的日期，則以最後一日為主" ForeColor="Blue" meta:resourcekey="Label104Resource1"></asp:Label>
                    </td>
                </tr>
            </table>
            <table style="white-space: nowrap">
                <tr>
                    <td>
                        <asp:RadioButton ID="rbTimeOffAnnualLeave" runat="server" GroupName="TimeOffSelect" onclick="TimeOffCheckedChanged()" meta:resourcekey="rbTimeOffAnnualLeaveResource1" />
                    </td>
                    <td>
                        <asp:Label ID="Label106" runat="server" Text="加班日起至" meta:resourcekey="Label106Resource1"></asp:Label>
                    </td>
                    <td>
                        <asp:UpdatePanel ID="UpdatePanel26" runat="server">
                            <ContentTemplate>
                                <asp:DropDownList ID="ddlTimeOffAnnualLeave" runat="server" onchange="TimeOffAnnualLeaveSelecedChanged()" meta:resourcekey="ddlTimeOffAnnualLeaveResource1">
                                    <asp:ListItem Selected="True" Text="年休到期日" Value="ExpiryDate" meta:resourcekey="ListItemResource16"></asp:ListItem>
                                    <asp:ListItem Text="到職日前一日" Value="BeginningDate" meta:resourcekey="ListItemResource17"></asp:ListItem>
                                </asp:DropDownList>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </td>
                </tr>
            </table>
            <table style="white-space: nowrap">
                <tr>
                    <td>
                        <asp:CheckBox ID="cbIsByYearLeaveExpiryDate" runat="server" Text="補休假可用期限晚於年休到期日時，依年休到期日為主" meta:resourcekey="cbIsByYearLeaveExpiryDateResource1" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:LinkButton ID="lbtnTimeOffExample" runat="server" Text="範例說明" meta:resourcekey="lbtnTimeOffExampleResource1"></asp:LinkButton>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td>
            <asp:Label ID="Label24" runat="server" Text="工作日" meta:resourcekey="Label24Resource1"></asp:Label>
        </td>
        <td>
            <table>
                <tr>
                    <td>
                        <asp:CheckBox ID="cbOverTimeWorkDay" runat="server" Text="可加班" meta:resourcekey="cbOverTimeWorkDayResource1"/>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label1" runat="server" Text="給付方式:" meta:resourcekey="Label1Resource1"></asp:Label>&nbsp;&nbsp;
                    </td>
                    <td>
                        <asp:CheckBox ID="cbWorkDayTimeoff" runat="server" Text="轉補休" onclick="SetWorkDayOTCheck()" meta:resourcekey="cbWorkDayTimeoffResource1"/>&nbsp;&nbsp;&nbsp;
                        <asp:CheckBox ID="cbWorkDayPayment" runat="server" Text="轉費用" onclick="SetWorkDayOTCheck()" meta:resourcekey="cbWorkDayPaymentResource1"/>&nbsp;&nbsp;&nbsp;
                        <asp:CheckBox ID="cbWorkDayOTBoth" runat="server" Text="轉補休及費用" onclick="SetEnableWorkDayOT()" meta:resourcekey="cbWorkDayOTBothResource1"/>
                        <asp:CustomValidator ID="cvWorkDayChangeType" runat="server" ErrorMessage="請勾選給付方式" Display="Dynamic" ClientValidationFunction="CheckWorkDayChangeType" ValidationGroup="vgCheckInputDays" meta:resourcekey="cvWorkDayChangeTypeResource1"></asp:CustomValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label4" runat="server" Text="加班時數:" meta:resourcekey="Label4Resource1"></asp:Label>&nbsp;&nbsp;
                    </td>
                    <td>
                        <table>
                            <tr>
                                <td>
                                    <asp:RadioButton ID="rbOverTimeWorkDayAll" runat="server" GroupName="OverTimeWorkDay" Text="所有時數均計入每月加班時數上限" onclick="WorkDayCheckedChanged()" meta:resourcekey="rbOverTimeWorkDayAllResource1" />
                                </td>                                
                            </tr>
                            <tr>
                                <td>
                                    <asp:RadioButton ID="rbOverTimeWorkDayPeriod" runat="server" GroupName="OverTimeWorkDay" onclick="WorkDayCheckedChanged()" meta:resourcekey="rbOverTimeWorkDayPeriodResource1" />
                                    <asp:Label ID="lblOverTimeWorkDayPeriod1" runat="server" Text="第" meta:resourcekey="lblOverTimeWorkDayPeriod1Resource1"></asp:Label>
                                    <telerik:RadNumericTextBox ID="rnOverTimeWorkDayFrom" runat="server" MaxLength="3" MinValue="0" MaxValue="24" NumberFormat-DecimalDigits="1"
                                        Width="50px" DataType="System.Decimal" Culture="zh-TW" DbValueFactor="1" LabelWidth="20px" meta:resourcekey="rnOverTimeWorkDayFromResource1">
                                        <ClientEvents OnValueChanging="OnValueChanging" />
                                    </telerik:RadNumericTextBox>
                                    <asp:Label ID="lblOverTimeWorkDayPeriod2" runat="server" Text="小時(不含)" meta:resourcekey="lblOverTimeWorkDayPeriod2Resource1"></asp:Label>                                    
                                    <asp:Label ID="Label44" runat="server" Text="~" meta:resourcekey="Label44Resource1"></asp:Label>
                                    <telerik:RadNumericTextBox ID="rnOverTimeWorkDayTo" runat="server" MaxLength="3" MinValue="0" MaxValue="24" NumberFormat-DecimalDigits="1"
                                        Width="50px" DataType="System.Decimal" Culture="zh-TW" DbValueFactor="1" LabelWidth="20px" meta:resourcekey="rnOverTimeWorkDayToResource1">
                                        <ClientEvents OnValueChanging="OnValueChanging" />
                                    </telerik:RadNumericTextBox>
                                    <asp:Label ID="lblOverTimeWorkDayPeriod3" runat="server" Text="小時(含)" meta:resourcekey="lblOverTimeWorkDayPeriod3Resource1"></asp:Label>
                                    <asp:Label ID="lblOverTimeWorkDayPeriod4" runat="server" Text="計入每月加班時數上限" meta:resourcekey="lblOverTimeWorkDayPeriod4Resource1"></asp:Label>
                                    <asp:CustomValidator ID="cvCheckWorkDayInputHours" runat="server" ErrorMessage="請輸入時數" Display="Dynamic" ClientValidationFunction="CheckWorkDayInputHours" ValidationGroup="vgCheckInputDays" meta:resourcekey="cvCheckWorkDayInputHoursResource1"></asp:CustomValidator>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:RadioButton ID="rbOverTimeWorkDayNone" runat="server" GroupName="OverTimeWorkDay" Text="所有時數均不計入每月加班時數上限" onclick="WorkDayCheckedChanged()" meta:resourcekey="rbOverTimeWorkDayNoneResource1" />
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td>
            <asp:Label ID="Label25" runat="server" Text="休息日" meta:resourcekey="Label25Resource1"></asp:Label>
        </td>
        <td>
            <table>
                <tr>
                    <td>
                        <asp:CheckBox ID="cbOverTimeDayoff" runat="server" Text="可加班" meta:resourcekey="cbOverTimeDayoffResource1"/>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label6" runat="server" Text="給付方式:" meta:resourcekey="Label6Resource1"></asp:Label>&nbsp;&nbsp;
                    </td>
                    <td>
                        <asp:CheckBox ID="cbDayoffTimeoff" runat="server" Text="轉補休" onclick="SetDayoffOTCheck()" meta:resourcekey="cbDayoffTimeoffResource1" />&nbsp;&nbsp;&nbsp;
                        <asp:CheckBox ID="cbDayoffPayment" runat="server" Text="轉費用" onclick="SetDayoffOTCheck()" meta:resourcekey="cbDayoffPaymentResource1" />&nbsp;&nbsp;&nbsp;
                        <asp:CheckBox ID="cbDayoffOTBoth" runat="server" Text="轉補休及費用" onclick="SetEnableDayoffOT()" meta:resourcekey="cbDayoffOTBothResource1"/>
                        <asp:CustomValidator ID="cvDayoffChangeType" runat="server" ErrorMessage="請勾選給付方式" Display="Dynamic" ClientValidationFunction="CheckDayoffChangeType" ValidationGroup="vgCheckInputDays"  meta:resourcekey="cvDayoffChangeTypeResource1"></asp:CustomValidator>                    
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label7" runat="server" Text="加班時數:" meta:resourcekey="Label7Resource1"></asp:Label>&nbsp;&nbsp;
                    </td>
                    <td>
                        <table>
                            <tr>
                                <td>
                                    <asp:RadioButton ID="rbOverTimeDayoffAll" runat="server" GroupName="OverTimeDayoff" Text="所有時數均計入每月加班時數上限" onclick="DayoffCheckedChanged()" meta:resourcekey="rbOverTimeDayoffAllResource1"/>
                                </td>                                
                            </tr>
                            <tr>
                                <td>
                                    <asp:RadioButton ID="rbOverTimeDayoffPeriod" runat="server" GroupName="OverTimeDayoff" onclick="DayoffCheckedChanged()" meta:resourcekey="rbOverTimeDayoffPeriodResource1"/>
                                    <asp:Label ID="lblOverTimeDayoffPeriod1" runat="server" Text="第" meta:resourcekey="lblOverTimeDayoffPeriod1Resource1"></asp:Label>
                                    <telerik:RadNumericTextBox ID="rnOverTimeDayoffFrom" runat="server" MaxLength="3" MinValue="0" MaxValue="24" NumberFormat-DecimalDigits="1"
                                        Width="50px" DataType="System.Decimal" Culture="zh-TW" DbValueFactor="1" LabelWidth="20px" meta:resourcekey="rnOverTimeDayoffFromResource1">
                                        <ClientEvents OnValueChanging="OnValueChanging" />
                                    </telerik:RadNumericTextBox>
                                    <asp:Label ID="lblOverTimeDayoffPeriod2" runat="server" Text="小時(不含)" meta:resourcekey="lblOverTimeDayoffPeriod2Resource1"></asp:Label>                                    
                                    <asp:Label ID="Label42" runat="server" Text="~" meta:resourcekey="Label42Resource1"></asp:Label>
                                    <telerik:RadNumericTextBox ID="rnOverTimeDayoffTo" runat="server" MaxLength="3" MinValue="0" MaxValue="24" NumberFormat-DecimalDigits="1"
                                        Width="50px" DataType="System.Decimal" Culture="zh-TW" DbValueFactor="1" LabelWidth="20px" meta:resourcekey="rnOverTimeDayoffToResource1">
                                        <ClientEvents OnValueChanging="OnValueChanging" />
                                    </telerik:RadNumericTextBox>
                                    <asp:Label ID="lblOverTimeDayoffPeriod3" runat="server" Text="小時(含)" meta:resourcekey="lblOverTimeDayoffPeriod3Resource1"></asp:Label>
                                    <asp:Label ID="lblOverTimeDayoffPeriod4" runat="server" Text="計入每月加班時數上限" meta:resourcekey="lblOverTimeDayoffPeriod4Resource1"></asp:Label>
                                    <asp:CustomValidator ID="cvCheckDayoffInputHours" runat="server" ErrorMessage="請輸入時數" Display="Dynamic" ClientValidationFunction="CheckDayoffInputHours" ValidationGroup="vgCheckInputDays" meta:resourcekey="cvCheckDayoffInputHoursResource1"></asp:CustomValidator>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:RadioButton ID="rbOverTimeDayoffNone" runat="server" GroupName="OverTimeDayoff" Text="所有時數均不計入每月加班時數上限" onclick="DayoffCheckedChanged()" meta:resourcekey="rbOverTimeDayoffNoneResource1"/>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td>
            <asp:Label ID="Label26" runat="server" Text="例假日" meta:resourcekey="Label26Resource1"></asp:Label>
        </td>
        <td>
            <table>
                <tr>
                    <td>
                        <asp:CheckBox ID="cbOverTimeRoutine" runat="server" Text="可加班" meta:resourcekey="cbOverTimeRoutineResource1"/>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label8" runat="server" Text="給付方式:" meta:resourcekey="Label8Resource1"></asp:Label>&nbsp;&nbsp;
                    </td>
                    <td>
                        <asp:CheckBox ID="cbRoutineTimeoff" runat="server" Text="轉補休" onclick="SetRoutineOTCheck()" meta:resourcekey="cbRoutineTimeoffResource1" />&nbsp;&nbsp;&nbsp;
                        <asp:CheckBox ID="cbRoutinePayment" runat="server" Text="轉費用" onclick="SetRoutineOTCheck()" meta:resourcekey="cbRoutinePaymentResource1" />&nbsp;&nbsp;&nbsp;
                        <asp:CheckBox ID="cbRoutineOTBoth" runat="server" Text="轉補休及費用" onclick="SetEnableRoutineOT()" meta:resourcekey="cbRoutineOTBothResource1"/>
                        <asp:CustomValidator ID="cvRoutineChangeType" runat="server" ErrorMessage="請勾選給付方式" Display="Dynamic" ClientValidationFunction="CheckRoutineChangeType" ValidationGroup="vgCheckInputDays" meta:resourcekey="cvRoutineChangeTypeResource1"></asp:CustomValidator>                    
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label10" runat="server" Text="加班時數:" meta:resourcekey="Label10Resource1"></asp:Label>&nbsp;&nbsp;
                    </td>
                    <td>
                        <table>
                            <tr>
                                <td>
                                    <asp:RadioButton ID="rbOverTimeRoutineAll" runat="server" GroupName="OverTimeRoutine" Text="所有時數均計入每月加班時數上限" onclick="RoutineCheckedChanged()" meta:resourcekey="rbOverTimeRoutineAllResource1"/>
                                </td>                                
                            </tr>
                            <tr>
                                <td>
                                    <asp:RadioButton ID="rbOverTimeRoutinePeriod" runat="server" GroupName="OverTimeRoutine" onclick="RoutineCheckedChanged()" meta:resourcekey="rbOverTimeRoutinePeriodResource1"/>
                                    <asp:Label ID="lblOverTimeRoutinePeriod1" runat="server" Text="第" meta:resourcekey="lblOverTimeRoutinePeriod1Resource1"></asp:Label>
                                    <telerik:RadNumericTextBox ID="rnOverTimeRoutineFrom" runat="server" MaxLength="3" MinValue="0" MaxValue="24" NumberFormat-DecimalDigits="1"
                                        Width="50px" DataType="System.Decimal" Culture="zh-TW" DbValueFactor="1" LabelWidth="20px" meta:resourcekey="rnOverTimeRoutineFromResource1">
                                        <ClientEvents OnValueChanging="OnValueChanging" />
                                    </telerik:RadNumericTextBox>
                                    <asp:Label ID="lblOverTimeRoutinePeriod2" runat="server" Text="小時(不含)" meta:resourcekey="lblOverTimeRoutinePeriod2Resource1"></asp:Label>                                    
                                    <asp:Label ID="Label43" runat="server" Text="~" meta:resourcekey="Label43Resource1"></asp:Label>
                                    <telerik:RadNumericTextBox ID="rnOverTimeRoutineTo" runat="server" MaxLength="3" MinValue="0" MaxValue="24" NumberFormat-DecimalDigits="1"
                                        Width="50px" DataType="System.Decimal" Culture="zh-TW" DbValueFactor="1" LabelWidth="20px" meta:resourcekey="rnOverTimeRoutineToResource1">
                                        <ClientEvents OnValueChanging="OnValueChanging" />
                                    </telerik:RadNumericTextBox>
                                    <asp:Label ID="lblOverTimeRoutinePeriod3" runat="server" Text="小時(含)" meta:resourcekey="lblOverTimeRoutinePeriod3Resource1"></asp:Label>
                                    <asp:Label ID="lblOverTimeRoutinePeriod4" runat="server" Text="計入每月加班時數上限" meta:resourcekey="lblOverTimeRoutinePeriod4Resource1"></asp:Label>
                                    <asp:CustomValidator ID="cvCheckRoutineInputHours" runat="server" ErrorMessage="請輸入時數" Display="Dynamic" ClientValidationFunction="CheckRoutineInputHours" ValidationGroup="vgCheckInputDays" meta:resourcekey="cvCheckRoutineInputHoursResource1"></asp:CustomValidator>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:RadioButton ID="rbOverTimeRoutineNone" runat="server" GroupName="OverTimeRoutine" Text="所有時數均不計入每月加班時數上限" onclick="RoutineCheckedChanged()" meta:resourcekey="rbOverTimeRoutineNoneResource1"/>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td>
            <asp:Label ID="Label27" runat="server" Text="國定假日" meta:resourcekey="Label27Resource1"></asp:Label>
        </td>
        <td>
            <table>
                <tr>
                    <td>
                        <asp:CheckBox ID="cbOverTimeHoliday" runat="server" Text="可加班" meta:resourcekey="cbOverTimeHolidayResource1"/>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label13" runat="server" Text="給付方式:" meta:resourcekey="Label13Resource1"></asp:Label>&nbsp;&nbsp;
                    </td>
                    <td>
                        <asp:CheckBox ID="cbHolidayTimeoff" runat="server" Text="轉補休" onclick="SetHolidayOTCheck()" meta:resourcekey="cbHolidayTimeoffResource1" />&nbsp;&nbsp;&nbsp;
                        <asp:CheckBox ID="cbHolidayPayment" runat="server" Text="轉費用" onclick="SetHolidayOTCheck()" meta:resourcekey="cbHolidayPaymentResource1" />&nbsp;&nbsp;&nbsp;
                        <asp:CheckBox ID="cbHolidayOTBoth" runat="server" Text="轉補休及費用" onclick="SetEnableHolidayOT()" meta:resourcekey="cbHolidayOTBothResource1"/>
                        <asp:CustomValidator ID="cvHolidayChangeType" runat="server" ErrorMessage="請勾選給付方式" Display="Dynamic" ClientValidationFunction="CheckHolidayChangeType" ValidationGroup="vgCheckInputDays" meta:resourcekey="cvHolidayChangeTypeResource1"></asp:CustomValidator>                    
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label14" runat="server" Text="加班時數:" meta:resourcekey="Label14Resource1"></asp:Label>&nbsp;&nbsp;
                    </td>
                    <td>
                        <table>
                            <tr>
                                <td>
                                    <asp:RadioButton ID="rbOverTimeHolidayAll" runat="server" GroupName="OverTimeHoliday" Text="所有時數均計入每月加班時數上限" onclick="HolidayCheckedChanged()" meta:resourcekey="rbOverTimeHolidayAllResource1"/>
                                </td>                                
                            </tr>
                            <tr>
                                <td>
                                    <asp:RadioButton ID="rbOverTimeHolidayPeriod" runat="server" GroupName="OverTimeHoliday" onclick="HolidayCheckedChanged()" meta:resourcekey="rbOverTimeHolidayPeriodResource1"/>
                                    <asp:Label ID="lblOverTimeHolidayPeriod1" runat="server" Text="第" meta:resourcekey="lblOverTimeHolidayPeriod1Resource1"></asp:Label>
                                    <telerik:RadNumericTextBox ID="rnOverTimeHolidayFrom" runat="server" MaxLength="3" MinValue="0" MaxValue="24" NumberFormat-DecimalDigits="1"
                                        Width="50px" DataType="System.Decimal" Culture="zh-TW" DbValueFactor="1" LabelWidth="20px" meta:resourcekey="rnOverTimeHolidayFromResource1">
                                        <ClientEvents OnValueChanging="OnValueChanging" />
                                    </telerik:RadNumericTextBox>
                                    <asp:Label ID="lblOverTimeHolidayPeriod2" runat="server" Text="小時(不含)" meta:resourcekey="lblOverTimeHolidayPeriod2Resource1"></asp:Label>                                    
                                    <asp:Label ID="Label45" runat="server" Text="~" meta:resourcekey="Label45Resource1"></asp:Label>
                                    <telerik:RadNumericTextBox ID="rnOverTimeHolidayTo" runat="server" MaxLength="3" MinValue="0" MaxValue="24" NumberFormat-DecimalDigits="1"
                                        Width="50px" DataType="System.Decimal" Culture="zh-TW" DbValueFactor="1" LabelWidth="20px" meta:resourcekey="rnOverTimeHolidayToResource1">
                                        <ClientEvents OnValueChanging="OnValueChanging" />
                                    </telerik:RadNumericTextBox>
                                    <asp:Label ID="lblOverTimeHolidayPeriod3" runat="server" Text="小時(含)" meta:resourcekey="lblOverTimeHolidayPeriod3Resource1"></asp:Label>
                                    <asp:Label ID="lblOverTimeHolidayPeriod4" runat="server" Text="計入每月加班時數上限" meta:resourcekey="lblOverTimeHolidayPeriod4Resource1"></asp:Label>
                                    <asp:CustomValidator ID="cvCheckHolidayInputHours" runat="server" ErrorMessage="請輸入時數" Display="Dynamic" ClientValidationFunction="CheckHolidayInputHours" ValidationGroup="vgCheckInputDays" meta:resourcekey="cvCheckHolidayInputHoursResource1"></asp:CustomValidator>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:RadioButton ID="rbOverTimeHolidayNone" runat="server" GroupName="OverTimeHoliday" Text="所有時數均不計入每月加班時數上限" onclick="HolidayCheckedChanged()" meta:resourcekey="rbOverTimeHolidayNoneResource1"/>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td>
            <asp:Label ID="Label39" runat="server" Text="說明" meta:resourcekey="Label39Resource1"></asp:Label>
        </td>
        <td>
            <table>
                <tr>
                    <td>
                        <asp:Label ID="Label41" runat="server" Text="允許加班時至少需設定一種給付方式，而所勾選的項目會顯示於加班單3.0的欄位中供申請者選擇，若加班能同時轉補休又轉費用，請勾選「轉補休及費用」選項。" ForeColor="Blue" meta:resourcekey="Label41Resource1"></asp:Label>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>

<asp:Label ID="lblDay" runat="server" Text="日" Visible="False" meta:resourcekey="lblDayResource1"></asp:Label>
<asp:Label ID="lblMonth" runat="server" Text="月" Visible="False" meta:resourcekey="lblMonthResource1"></asp:Label>
<asp:Label runat="server" ID="lblTimeOffExampleTitle" Text="補休假可用期限範例說明" Visible="False" meta:resourcekey="lblTimeOffExampleTitleResource1"></asp:Label>
<asp:Label ID="lbConfirmCheckBox" runat="server" Text="確定要使用上一部門設定?     \r\n注意:確認後會刪除此部門所有的自訂資料!!" Visible="False" meta:resourcekey="lbConfirmCheckBoxResource1"></asp:Label>
<asp:HiddenField ID="hfUserGuid" runat="server" />
<asp:HiddenField ID="hfIsDDLselect" runat="server" Value="false" />
