<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="OverTimeWorkInfoUC.ascx.cs" Inherits="Ede.Uof.Web.EIP.Duty.WKFOptionalFields.OverTimeWorkInfoUC" %>
<%@ Reference Control="~/WKF/FormManagement/VersionFieldUserControl/VersionFieldUC.ascx" %>
<%@ Register Src="../../../Common/ChoiceCenter/UC_ChoiceList.ascx" TagName="UC_ChoiceList" TagPrefix="uc1" %>
<%@ Register Src="~/Common/ChoiceCenter/UC_ChoiceListMobile.ascx" TagPrefix="uc1" TagName="UC_ChoiceListMobile" %>

<style>
    .fullWidth {
        width:100% !important;
    }
</style>

<script type="text/javascript">

    //修改內容設定flag
    function onExpValueChanged() {

        //這樣寫日期元件才不會postback
        var rdStartDate = $find("<%= rdStartDate.ClientID %>");
        rdStartDate.get_dateInput().set_autoPostBack(false);
        rdStartDate.set_selectedDate($find("<%=rdExpStartDate.ClientID%>").get_selectedDate());
        //rdStartDate.get_dateInput().set_autoPostBack(true);

        var rdStartTime = $find("<%= rdStartTime.ClientID %>");
        rdStartTime.get_dateInput().set_autoPostBack(false);
        rdStartTime.set_selectedDate($find("<%=rdExpStartTime.ClientID%>").get_selectedDate());
        //rdStartTime.get_dateInput().set_autoPostBack(true);        

        var rdEndDate = $find("<%= rdEndDate.ClientID %>");
        rdEndDate.get_dateInput().set_autoPostBack(false);
        rdEndDate.set_selectedDate($find("<%=rdExpEndDate.ClientID%>").get_selectedDate());
        //rdEndDate.get_dateInput().set_autoPostBack(true);

        var rdEndTime = $find("<%= rdEndTime.ClientID %>");
        rdEndTime.get_dateInput().set_autoPostBack(false);
        rdEndTime.set_selectedDate($find("<%=rdExpEndTime.ClientID%>").get_selectedDate());
        //rdEndTime.get_dateInput().set_autoPostBack(true);

        var rblExpEatHour = $('#<%= rblExpEatHours.ClientID  %>');
        var rblActEatHour = $('#<%= rblActEatHours.ClientID  %>');
        //用餐時數為垂直排列
        for (i = 0; i < rblExpEatHour[0].rows.length; i++) {
            if (rblExpEatHour[0].rows[i].cells[0].childNodes[0].checked == true)
                rblActEatHour[0].rows[i].cells[0].childNodes[0].checked = true;
        }
        //用餐時數為水平排列
        //for (i = 0; i < rblExpEatHour[0].rows[0].cells.length; i++) {
        //    if (rblExpEatHour[0].rows[0].cells[i].childNodes[0].checked == true)
        //        rblActEatHour[0].rows[0].cells[i].childNodes[0].checked = true;
        //}

        var expHours = $('#<%= lblExpHours.ClientID%>');
        var actWorkHours = $('#<%= lblActWorkHours.ClientID%>');
        var actHours = $('#<%= lblActHours.ClientID%>');
        var rnbActHours = $find("<%=rnbActHours.ClientID%>");    

        if (expHours != null) {
            expHours.html("0");
        }

        if (actWorkHours != null) {
            actWorkHours.html("0");
        }

        if (actHours != null) {
            actHours.html("0");
        }

        if (rnbActHours != null) {
            rnbActHours.set_value(0);
        }
    }

    function onActValueChanged() {

        var actWorkHours = $('#<%= lblActWorkHours.ClientID%>');
        var actHours = $('#<%= lblActHours.ClientID%>');
        var rnbActHours = $find("<%=rnbActHours.ClientID%>");

        if (actWorkHours != null) {
            actWorkHours.html("0");
        }

        if (actHours != null) {
            actHours.html("0");
        }

        if (rnbActHours != null) {
            rnbActHours.set_value(0);
        }
    }

    function CheckOverTimeUsers(e, args) {

        var ovtType = $("input[id^='<% =rblOvertimeType.ClientID %>']:checked").val();
        var allUsers = $('#<%= hfPreViewTimeTableUsers.ClientID  %>').val();

        var selected = $("#<%=UC_ChoiceListMobile.ClientID%>" + "_hiddenSelected").val();

        if (typeof selected !== "undefined" && selected !== "") {
            var selectedArray = selected.split(",");
            var array = new Array(selectedArray.length);

            for (var i = 0; i < selectedArray.length; i++) {
                array[i] = selectedArray[i].split("|")[1];
            }
            allUsers = $uof.json.toString(array);
        }
        else if (typeof selected === "undefined" && ovtType === "0") {
            var array = new Array(1);
            array[0] = '<%=base.ApplicantGuid%>';
            allUsers = $uof.json.toString(array);
        }
        else
            allUsers = "";

    if (ovtType == "1") {
        if (allUsers === "") {
            args.IsValid = false;
        }
        else {
            args.IsValid = true;
        }
    }
}

function CheckMaxExpHours(e, args) {

    var ovtType = $("input[id^='<% =rblOvertimeType.ClientID %>']:checked").val();
    if (ovtType == "0") {
        var startDate = $find("<%=rdExpStartDate.ClientID%>").get_selectedDate();
            if (startDate != null) startDate = startDate.format('yyyy/MM/dd');

            var endDate = $find("<%=rdExpEndDate.ClientID%>").get_selectedDate();
            if (endDate != null) endDate = endDate.format('yyyy/MM/dd');

            var rblEatHour = $("input[id^='<% =rblExpEatHours.ClientID %>']:checked").val();
            var overtimeHour = $('#<%= lblExpHours.ClientID  %>').text();

            var startTime = $find("<%= rdExpStartTime.ClientID %>").get_selectedDate();
            if (startTime != null) startTime = startTime.format('HH:mm');

            var endTime = $find("<%= rdExpEndTime.ClientID %>").get_selectedDate();
            if (endTime != null) endTime = endTime.format('HH:mm');

            if (startDate == null || endDate == null) return;

            var startDateTime = startDate + " " + startTime;
            var endDateTime = endDate + " " + endTime;

            var eatHour;
            eatHour = rblEatHour;

            var data = [startDateTime, endDateTime, eatHour];
            var sValue = $uof.pageMethod.syncUc("EIP/Duty/WKFOptionalFields/OverTimeWorkInfoUC.ascx", "CheckHours", data);
            if (overtimeHour !== null && overtimeHour > sValue) {
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

    function CheckSameOffice(e, args) {
        var ovtType = $("input[id^='<% =rblOvertimeType.ClientID %>']:checked").val();
        var allUsers = $('#<%= hfPreViewTimeTableUsers.ClientID  %>').val();

        var selected = $("#<%=UC_ChoiceListMobile.ClientID%>" + "_hiddenSelected").val();

        if (typeof selected !== "undefined" && selected !== "") {
            var selectedArray = selected.split(",");
            var array = new Array(selectedArray.length);

            for (var i = 0; i < selectedArray.length; i++) {
                array[i] = selectedArray[i].split("|")[1];
            }
            allUsers = $uof.json.toString(array);
        }
        else if (typeof selected === "undefined" && ovtType === "0") {
            var array = new Array(1);
            array[0] = '<%=base.ApplicantGuid%>';
            allUsers = $uof.json.toString(array);
        }
        else
            allUsers = "";

        if (ovtType == "1") {
            
            if (allUsers === "")
            {
                args.IsValid = true;
                return;
            }

            var checkData = [allUsers];
            var checkResult = $uof.pageMethod.syncUc("EIP/Duty/WKFOptionalFields/OverTimeWorkInfoUC.ascx", "CheckSameOffice", checkData);
            if (checkResult == "true")
            {
                args.IsValid = true;
            }
            else
            {
                $("#<%=lbtnErrorInfo.ClientID%>").css("display", "");
                args.IsValid = false;
            }
        }
        else { args.IsValid = true; }
    }

    function CheckMaxActHours(e, args) {

        var ovtType = $("input[id^='<% =rblOvertimeType.ClientID %>']:checked").val();
        var startDate = $find("<%=rdStartDate.ClientID%>").get_selectedDate();
        if (startDate != null) startDate = startDate.format('yyyy/MM/dd');

        var endDate = $find("<%=rdEndDate.ClientID%>").get_selectedDate();
        if (endDate != null) endDate = endDate.format('yyyy/MM/dd');

        var startTime = $find("<%= rdStartTime.ClientID %>").get_selectedDate();
        if (startTime != null) startTime = startTime.format('HH:mm');

        var endTime = $find("<%= rdEndTime.ClientID %>").get_selectedDate();
        if (endTime != null) endTime = endTime.format('HH:mm');

        var rblEatHour = $("input[id^='<% =rblActEatHours.ClientID %>']:checked").val();
        var overtimeHour = $('#<%= lblActWorkHours.ClientID  %>').text();

        if (startDate == null || endDate == null) return;

        var startDateTime = startDate + " " + startTime;
        var endDateTime = endDate + " " + endTime;

        var eatHour;
        eatHour = rblEatHour;


        var data = [startDateTime, endDateTime, eatHour];
        var sValue = $uof.pageMethod.syncUc("EIP/Duty/WKFOptionalFields/OverTimeWorkInfoUC.ascx", "CheckHours", data);
        if (overtimeHour !== null && overtimeHour > sValue) {
            args.IsValid = false;
        }
        else {
            args.IsValid = true;
        }
    }

    function CheckActOvertimeHour(e, args) {
        var wnumActHours = $('#<%= lblActWorkHours.ClientID  %>').text();
        if (wnumActHours > 0) {
            args.IsValid = true;
        }
        else {
            args.IsValid = false;
        }
    }

    function CheckExpOvertimeHour(e, args) {

        var ovtType = $("input[id^='<% =rblOvertimeType.ClientID %>']:checked").val();
        if (ovtType == "0") {
            var wnumExpHours = $('#<%= lblExpHours.ClientID  %>').text();

            if (wnumExpHours > 0) {
                args.IsValid = true;
            }
            else {
                args.IsValid = false;
            }
        }
        else {
            args.IsValid = true;
        }
    }

    function CheckUsersSett(e, args) {
        
        var ovtType = $("input[id^='<% =rblOvertimeType.ClientID %>']:checked").val();
        var belnogDate = $('#<%= rddlBelongDate.ClientID  %> option:selected');
        var allUsers = $('#<%= hfPreViewTimeTableUsers.ClientID  %>').val();

        var selected = $("#<%=UC_ChoiceListMobile.ClientID%>" + "_hiddenSelected").val();

        if (typeof selected !== "undefined" && selected !== "") {
            var selectedArray = selected.split(",");
            var array = new Array(selectedArray.length);

            for (var i = 0; i < selectedArray.length; i++) {
                array[i] = selectedArray[i].split("|")[1];
            }
            allUsers = $uof.json.toString(array);
        }
        else if (typeof selected === "undefined" && ovtType === "0") {
            var array = new Array(1);
            array[0] = '<%=base.ApplicantGuid%>';
            allUsers = $uof.json.toString(array);
        }
        else
            allUsers = "";

        var type;
        if (ovtType === "1") {
            var data = [belnogDate.val(), allUsers];
            var sValue = $uof.pageMethod.syncUc("EIP/Duty/WKFOptionalFields/OverTimeWorkInfoUC.ascx", "CheckUsersSett", data);
            if (sValue == "true") {

                $("#<%=lbtnErrorInfo.ClientID%>").css("display", "");
                args.IsValid = false;
            }
        }
    }

    function CheckIsClose(e, args) {

        var belongDate = $find('<%= rddlBelongDate.ClientID %>');
        var ovtType = $("input[id^='<% =rblOvertimeType.ClientID %>']:checked").val();
        var type;
        var allUsers = $('#<%= hfPreViewTimeTableUsers.ClientID  %>').val();
        var selected = $("#<%=UC_ChoiceListMobile.ClientID%>" + "_hiddenSelected").val();

        if (typeof selected !== "undefined" && selected !== "") {
            var selectedArray = selected.split(",");
            var array = new Array(selectedArray.length);

            for (var i = 0; i < selectedArray.length; i++) {
                array[i] = selectedArray[i].split("|")[1];
            }
            allUsers = $uof.json.toString(array);
        }
        else if (typeof selected === "undefined" && ovtType === "0") {
            var array = new Array(1);
            array[0] = '<%=base.ApplicantGuid%>';
            allUsers = $uof.json.toString(array);
        }
        else
            allUsers = "";

        if (belongDate != null) {
            var data = [belongDate.get_selectedItem().get_value(), "<%=m_Applicant%>", allUsers, type];
            var sBool = $uof.pageMethod.syncUc("EIP/Duty/WKFOptionalFields/OverTimeWorkInfoUC.ascx", "CheckIsClose", data);
            if (sBool == "false") {
                args.IsValid = false;
            }
        }
    }

    function CheckTimeTable(e, args) {

        var allUsers = $('#<%= hfPreViewTimeTableUsers.ClientID  %>').val();
        var ovtType = $("input[id^='<% =rblOvertimeType.ClientID %>']:checked").val();
        var belongDate = $find('<%= rddlBelongDate.ClientID %>').get_selectedItem().get_value();
        var selected = $("#<%=UC_ChoiceListMobile.ClientID%>" + "_hiddenSelected").val();

        //處理從M選人元件上抓來的值
        if (typeof selected !== "undefined" && selected !== "") {
            var selectedArray = selected.split(",");
            var array = new Array(selectedArray.length);

            for (var i = 0; i < selectedArray.length; i++) {
                array[i] = selectedArray[i].split("|")[1];
            }
            allUsers = $uof.json.toString(array);
        }
        else if (typeof selected === "undefined" && ovtType === "0") {
            var array = new Array(1);
            array[0] = '<%=base.ApplicantGuid%>';
            users = $uof.json.toString(array);
        }
        else
            allUsers = "";

        if (allUsers === "") {
            return;
        }

        //集體加班要去判斷是否為同一班表
        if (ovtType == "1") {
            var data = [allUsers, belongDate];
            var sBool = $uof.pageMethod.syncUc("EIP/Duty/WKFOptionalFields/OverTimeWorkInfoUC.ascx", "CheckTimeTable", data);
            if (sBool == "false") {
                args.IsValid = false;
            }
        }
    }

    function CheckDoubleOTForm(e, args) {

        var taskID = "<%=m_TaskID%>";
        var ovtType = $("input[id^='<% =rblOvertimeType.ClientID %>']:checked").val();
        var type;
        var startDate;
        var startTime;
        var users;

        var endDate;
        var endTime;

        var startDateTime;
        var endDateTime;

        if (ovtType == "0" && taskID === "") {
            startDate = $find("<%=rdExpStartDate.ClientID%>").get_selectedDate();
            if (startDate != null) startDate = startDate.format('yyyy/MM/dd');

            endDate = $find("<%=rdExpEndDate.ClientID%>").get_selectedDate();
            if (endDate != null) endDate = endDate.format('yyyy/MM/dd');

            startTime = $find("<%= rdExpStartTime.ClientID %>").get_selectedDate();
            if (startTime != null) startTime = startTime.format('HH:mm');

            endTime = $find("<%= rdExpEndTime.ClientID %>").get_selectedDate();
            if (endTime != null) endTime = endTime.format('HH:mm');

        }
        else {
            startDate = $find("<%=rdStartDate.ClientID%>").get_selectedDate();
            if (startDate != null) startDate = startDate.format('yyyy/MM/dd');

            endDate = $find("<%=rdEndDate.ClientID%>").get_selectedDate();
            if (endDate != null) endDate = endDate.format('yyyy/MM/dd');

            startTime = $find("<%= rdStartTime.ClientID %>").get_selectedDate();
            if (startTime != null) startTime = startTime.format('HH:mm');

            endTime = $find("<%= rdEndTime.ClientID %>").get_selectedDate();
            if (endTime != null) endTime = endTime.format('HH:mm');
        }
        if (startDate == null || endDate == null) return;

        startDateTime = startDate + " " + startTime;
        endDateTime = endDate + " " + endTime;

        $('#<%= hfStartDate.ClientID  %>').val(startDateTime);
        $('#<%= hfEndDate.ClientID  %>').val(endDateTime);

        if (ovtType == "0") {
            type = "0";
        }
        else {
            type = "1";
        }

        //m版沒有辦法重新給值，直接抓Mobile選人元件上的值
        var selected = $("#<%=UC_ChoiceListMobile.ClientID%>" + "_hiddenSelected").val();

        if (typeof selected !== "undefined" && selected !== "") {
            var selectedArray = selected.split(",");
            var array = new Array(selectedArray.length);

            for (var i = 0; i < selectedArray.length; i++) {
                array[i] = selectedArray[i].split("|")[1];
            }
            users = $uof.json.toString(array);
        }
        else if (typeof selected === "undefined" && type === "0") {
            var array = new Array(1);
            array[0] = '<%=base.ApplicantGuid%>';
            users = $uof.json.toString(array);
        }
        else
            users = "";


    var data = ["<%=m_Applicant%>", taskID, users, type, startDateTime, endDateTime];
        var sValue = $uof.pageMethod.syncUc("EIP/Duty/WKFOptionalFields/OverTimeWorkInfoUC.ascx", "CheckIsRepet", data);
        if (sValue != "" && sValue != null) {
            if (type === "0") {

            }
            else {
                $("#<%=lbtnErrorInfo.ClientID%>").css("display", "");
            }
            args.IsValid = false;
        }
    }

    function CheckDoubleLeaveForm(e, args) {

        var taskID = "<%=m_TaskID%>";
        var ovtType = $("input[id^='<% =rblOvertimeType.ClientID %>']:checked").val();
        var type;
        var startDate;
        var startTime;
        var users;

        var endDate;
        var endTime;

        var startDateTime;
        var endDateTime;

        if (ovtType === "0" && taskID === "") {
            startDate = $find("<%=rdExpStartDate.ClientID%>").get_selectedDate();
            if (startDate != null) startDate = startDate.format('yyyy/MM/dd');

            endDate = $find("<%=rdExpEndDate.ClientID%>").get_selectedDate();
            if (endDate != null) endDate = endDate.format('yyyy/MM/dd');

            startTime = $find("<%= rdExpStartTime.ClientID %>").get_selectedDate();
            if (startTime != null) startTime = startTime.format('HH:mm');

            endTime = $find("<%= rdExpEndTime.ClientID %>").get_selectedDate();
            if (endTime != null) endTime = endTime.format('HH:mm');
        }
        else {
            startDate = $find("<%=rdStartDate.ClientID%>").get_selectedDate();
            if (startDate != null) startDate = startDate.format('yyyy/MM/dd');

            endDate = $find("<%=rdEndDate.ClientID%>").get_selectedDate();
            if (endDate != null) endDate = endDate.format('yyyy/MM/dd');

            startTime = $find("<%= rdStartTime.ClientID %>").get_selectedDate();
            if (startTime != null) startTime = startTime.format('HH:mm');

            endTime = $find("<%= rdEndTime.ClientID %>").get_selectedDate();
            if (endTime != null) endTime = endTime.format('HH:mm');
        }

        if (startDate == null || endDate == null) return;

        startDateTime = startDate + " " + startTime;
        endDateTime = endDate + " " + endTime;

        $('#<%= hfStartDate.ClientID  %>').val(startDateTime);
        $('#<%= hfEndDate.ClientID  %>').val(endDateTime);

        if (ovtType === "0") {
            type = "0";
        }
        else {
            type = "1";
        }

        //m版沒有辦法重新給值，直接抓Mobile選人元件上的值
        var selected = $("#<%=UC_ChoiceListMobile.ClientID%>" + "_hiddenSelected").val();

        if (typeof selected !== 'undefined' && selected !== "") {
            var selectedArray = selected.split(",");
            var array = new Array(selectedArray.length);

            for (var i = 0; i < selectedArray.length; i++) {
                array[i] = selectedArray[i].split("|")[1];
            }
            users = $uof.json.toString(array);
        }
        else if (typeof selected === "undefined" && type === "0") {
            var array = new Array(1);
            array[0] = '<%=base.ApplicantGuid%>';
            users = $uof.json.toString(array);
        }
        else
            users = "";

    var data = ["<%=m_Applicant%>", taskID, users, type, startDateTime, endDateTime];
        var sValue = $uof.pageMethod.syncUc("EIP/Duty/WKFOptionalFields/OverTimeWorkInfoUC.ascx", "CheckLeaveForm", data);
        if (sValue != "" && sValue != null) {
            if (type === "0") {

            }
            else {
                $("#<%=lbtnErrorInfo.ClientID%>").css("display", "");
            }
            args.IsValid = false;
        }
    }

    function OpenCountedDialog(sender) {
        var users = '<%= hfPreViewTimeTableUsers.ClientID  %>';
        var taskId = "<%=m_TaskID%>";
        var rddlbelnogDate = $find('<%= rddlBelongDate.ClientID %>');
        var lblbelnogDate = $('#<%= lblBelongDate.ClientID  %>').text();
        var belnogDate;
        var workType = $('#<%= hfWorkType.ClientID  %>').val();
        var rnbActHours = $find("<%=rnbActHours.ClientID%>");
        var actHours = $('#<%= lblActHours.ClientID  %>').text();
        if (rnbActHours) {
            actHours = rnbActHours.get_value();
        }
        if (rddlbelnogDate != null) {
            belnogDate = rddlbelnogDate.get_selectedItem().get_value();
        }
        else {
            belnogDate = lblbelnogDate;
        }

        $uof.dialog.open2("~/EIP/Duty/WKFOptionalFields/CountedUpperLimit.aspx", sender, '<%= lblCountedTitle.Text  %>', 1024, 800,
            function () { return false }, {
                "Applicant": "<%=m_Applicant%>",
                "Users": users,
                "TaskId": taskId,
                "BelongDate": belnogDate,
                "WorkType": workType,
                "ActHours": actHours
            });
    }

    function OpenDialog(sender) {
        var taskId = "<%=m_TaskID%>";
        var startDate = $('#<%= hfStartDate.ClientID  %>').val();
        var endDate = $('#<%= hfEndDate.ClientID  %>').val();
        var users = '<%= hfErrorSelectUsers.ClientID  %>';
        var rddlbelnogDate = $find('<%= rddlBelongDate.ClientID %>');
        var lblbelnogDate = $('#<%= lblBelongDate.ClientID  %>').text();
        var belnogDate;
        var holidayType = $('#<%= hfHolidayType.ClientID  %>').val();
        var overTimeUsers = '<%= hfPreViewTimeTableUsers.ClientID  %>';
        var workType = $('#<%= hfWorkType.ClientID  %>').val();
        var rnbActHours = $find("<%=rnbActHours.ClientID%>");
        var actHours = $('#<%= lblActHours.ClientID  %>').text();
        var overTimeType = '<%= hfOverTimeType.ClientID  %>';
        if (rnbActHours) {
            actHours = rnbActHours.get_value();
        }
        var showOverTimeSetting = $('#<%= hfShowOverTimeSetting.ClientID  %>').val();
        var showOverLimitUsers = $('#<%= hfShowOverLimitUsers.ClientID  %>').val();
        if (rddlbelnogDate != null) {
            belnogDate = rddlbelnogDate.get_selectedItem().get_value();
        }
        else {
            belnogDate = lblbelnogDate;
        }

        $uof.dialog.open2("~/EIP/Duty/WKFOptionalFields/ErrorInfo.aspx", sender, '', 800, 600,
            function () { return false }, {
                "StartDate": startDate,
                "Users": users,
                "BelongDate": belnogDate,
                "EndDate": endDate,
                "TaskId": taskId,
                "HolidayType": holidayType,
                "OverTimeUsers": overTimeUsers,
                "WorkType": workType,
                "ActHours": actHours,
                "ShowOverTimeSetting": showOverTimeSetting,
                "ShowOverLimitUsers": showOverLimitUsers,
                "OverTimeType": overTimeType
            });
    }

    function openDialogResult(returnValue) {

        return false;
    }

    function OnValueChanging(sender, args) {

        if (args.get_newValue() == "") {
            args.set_newValue(args.get_oldValue());
        }
    }

    function CheckHolidayType(e, args) {
        var ovtType = $("input[id^='<% =rblOvertimeType.ClientID %>']:checked").val();
        var holidayType = $('#<%= hfHolidayType.ClientID  %>').val();

        if (ovtType == "1") {
            //集體加班, 有選人, 加班類型不一樣
            var users = $('#<%= hfPreViewTimeTableUsers.ClientID  %>').val();
            if (users != "" && holidayType == "") {
                args.IsValid = false;
            }
        }        
    }

    function CheckSingleHolidayType(e, args) {
        var ovtType = $("input[id^='<% =rblOvertimeType.ClientID %>']:checked").val();
        var holidayType = $('#<%= hfHolidayType.ClientID  %>').val();

        if (ovtType == "0" && holidayType == "") {            
            args.IsValid = false;
        }        
    }

    function CheckAllowOverTime(e, args) {        
        var ovtType = $("input[id^='<% =rblOvertimeType.ClientID %>']:checked").val();
        var holidayType = $('#<%= hfHolidayType.ClientID  %>').val();
        var data = ["<%=m_Applicant%>", $('#<%= hfPreViewTimeTableUsers.ClientID  %>').val(), ovtType, holidayType];
        var returnValue = $uof.pageMethod.syncUc("EIP/Duty/WKFOptionalFields/OverTimeWorkInfoUC.ascx", "CheckAllowOverTime", data);
        if (returnValue == "false"){
            args.IsValid = false;
        }
    }

    function CheckSameSetupHours(e, args) {
        var ovtType = $("input[id^='<% =rblOvertimeType.ClientID %>']:checked").val();        

        if (ovtType == "1") {
            //集體加班, 有選人, 點過計算鈕得到狀態為false
            var users = $('#<%= hfPreViewTimeTableUsers.ClientID  %>').val();
            var sameSetupHours = $('#<%= hfSameSetupHours.ClientID  %>').val();

            if (users != "" && sameSetupHours == "false") {
                args.IsValid = false;
            }
        }
    }

    function CheckActHours(e, args) {
        var ovtType = $("input[id^='<% =rblOvertimeType.ClientID %>']:checked").val();
        var users = $('#<%= hfPreViewTimeTableUsers.ClientID  %>').val();
        var rnbActHours = $find("<%=rnbActHours.ClientID%>");
        var actHours = $('#<%= lblActHours.ClientID  %>').text();
        if (rnbActHours) {
            actHours = rnbActHours.get_value();
        }
        var sameSetupHours = $('#<%= hfSameSetupHours.ClientID  %>').val();
        
        if (actHours > 0) {//有計算出核銷時數
            args.IsValid = true;
        }
        else {
            if (ovtType == "0") {
                args.IsValid = false;
            }
            if (ovtType == "1") {
                //集體加班:有選人, 核銷時數0, 尚未按過計算按鈕確認是否核銷時數設定相同
                if (users != "" && actHours == "0" && sameSetupHours == "") {
                    args.IsValid = false;
                }
            }
        }
    }

    //選擇給付方式驗證
    function CheckChangeType(e, args) {
        var holidayType = $('#<%= hfHolidayType.ClientID  %>').val();
        var hfChangeType = $('#<%= hfChangeType.ClientID  %>').val();
        var changeType = $("input[id^='<% =rblChangeType.ClientID %>']:checked").val();        

        //有加班類型且沒選到給付方式
        if (holidayType && !changeType) {
            args.IsValid = false;
        }
    }

    //相同給付方式驗證
    function CheckSameChangeType(e, args) {
        var users = $('#<%= hfPreViewTimeTableUsers.ClientID  %>').val();
        var holidayType = $('#<%= hfHolidayType.ClientID  %>').val();    
        
        var data = [$('#<%= hfPreViewTimeTableUsers.ClientID  %>').val(), holidayType];
        var returnValue = $uof.pageMethod.syncUc("EIP/Duty/WKFOptionalFields/OverTimeWorkInfoUC.ascx", "CheckSameChangeType", data);
        if (returnValue == "false"){
            args.IsValid = false;
        }
    }

    //可在Javascript中使用如同C#中的string.format (對jQuery String的擴充方法)
    //使用方式 : var fullName = 'Hello. My name is {0} {1}.'.format('FirstName', 'LastName');
    String.prototype.format = function () {
        var txt = this.toString();
        for (var i = 0; i < arguments.length; i++) {
            var exp = getStringFormatPlaceHolderRegEx(i);
            txt = txt.replace(exp, (arguments[i] == null ? "" : arguments[i]));
        }
        return cleanStringFormatResult(txt);
    }
    //讓輸入的字串可以包含{}
    function getStringFormatPlaceHolderRegEx(placeHolderIndex) {
        return new RegExp('({)?\\{' + placeHolderIndex + '\\}(?!})', 'gm')
    }
    //當format格式有多餘的position時，就不會將多餘的position輸出
    //ex:
    // var fullName = 'Hello. My name is {0} {1} {2}.'.format('firstName', 'lastName');
    // 輸出的 fullName 為 'firstName lastName', 而不會是 'firstName lastName {2}'
    function cleanStringFormatResult(txt) {
        if (txt == null) return "";
        return txt.replace(getStringFormatPlaceHolderRegEx("\\d+"), "");
    }

    function CheckDayLimit(e, args) {
        var ovtType = $("input[id^='<% =rblOvertimeType.ClientID %>']:checked").val();
        var hfWorkType = $('#<%= hfWorkType.ClientID  %>').val();
        if (ovtType == "0" && hfWorkType !== "") {
            var rddlbelnogDate = $find('<%= rddlBelongDate.ClientID %>');
            var lblbelnogDate = $('#<%= lblBelongDate.ClientID  %>').text();
            var belnogDate;
            var rnbActHours = $find("<%=rnbActHours.ClientID%>");
            var actHours = $('#<%= lblActHours.ClientID  %>').text();
            var errorMsg = $('#<%= lblErrLimitMsg2.ClientID  %>').text();
            var lblWDay = $('#<%= lblWDay.ClientID  %>').text();
            var lblHDay = $('#<%= lblHDay.ClientID  %>').text();
            var lblRejectOT = $('#<%= lblRejectOT.ClientID  %>').text();
            var lblMoreThanLawHoursMsg = $('#<%= lblMoreThanLawHoursMsg.ClientID  %>');
            var hfIsDayValid = $('#<%= hfIsDayValid.ClientID  %>');
            if (rnbActHours) {
                actHours = rnbActHours.get_value().toString();
            }

            if (rddlbelnogDate != null) {
                belnogDate = rddlbelnogDate.get_selectedItem().get_value();
            }
            else {
                belnogDate = lblbelnogDate;
            }
            var data = ["<%=m_Applicant%>", belnogDate, "<%=m_TaskID%>", hfWorkType, actHours, "day"];
            var returnValue = $uof.pageMethod.syncUc("EIP/Duty/WKFOptionalFields/OverTimeWorkInfoUC.ascx", "CheckOvertimeHours", data);
            var arr = returnValue.split('/');
            if (arr.length >= 5) {
                $("#<%= hfIsCounted.ClientID %>").val("true");
                $("#<%= lbtnCountedUpperLimitIndividual.ClientID %>").css("display", "");

                //超時不可加班
                if (arr[0].toLowerCase() === "true" && arr[1].toLowerCase() === "true") {
                    lblMoreThanLawHoursMsg.css("display", "none");
                    lblMoreThanLawHoursMsg.text("");
                    //判斷平日假日
                    if (arr[4].toLowerCase() === "true") {
                        e.innerText = errorMsg.format(lblHDay, arr[2], arr[3], lblRejectOT);
                        args.IsValid = false;
                    }
                    else {
                        e.innerText = errorMsg.format(lblWDay, arr[2], arr[3], lblRejectOT);
                        args.IsValid = false;
                    }
                }
                //當日超時仍可加班
                else if (arr[0].toLowerCase() === "false" && arr[1].toLowerCase() === "true") {
                    lblMoreThanLawHoursMsg.css("display", "");
                    //判斷平日假日
                    if (arr[4].toLowerCase() === "true")
                        lblMoreThanLawHoursMsg.text(errorMsg.format(lblHDay, arr[2], arr[3], ""));
                    else
                        lblMoreThanLawHoursMsg.text(errorMsg.format(lblWDay, arr[2], arr[3], ""));

                    hfIsDayValid.val(lblMoreThanLawHoursMsg.text());
                }
                else {
                    lblMoreThanLawHoursMsg.css("display", "none");
                    lblMoreThanLawHoursMsg.text("");
                }
            }
        }
    }

    function CheckMonthLimit(e, args) {
        var ovtType = $("input[id^='<% =rblOvertimeType.ClientID %>']:checked").val();
        var hfWorkType = $('#<%= hfWorkType.ClientID  %>').val();
        if (ovtType == "0" && hfWorkType !== "") {
            var rddlbelnogDate = $find('<%= rddlBelongDate.ClientID %>');
            var lblbelnogDate = $('#<%= lblBelongDate.ClientID  %>').text();
            var belnogDate;
            var rnbActHours = $find("<%=rnbActHours.ClientID%>");
            var actHours = $('#<%= lblActHours.ClientID  %>').text();
            var errorMsg = $('#<%= lblErrLimitMsg1.ClientID  %>').text();
            var lblEveryMonth = $('#<%= lblEveryMonth.ClientID  %>').text();
            var lblRejectOT = $('#<%= lblRejectOT.ClientID  %>').text();
            var hfIsMonthValid = $('#<%= hfIsMonthValid.ClientID  %>');
            var lblMoreThanLawHoursMsg2 = $('#<%= lblMoreThanLawHoursMsg2.ClientID  %>');

            if (rnbActHours) {
                actHours = rnbActHours.get_value().toString();
            }

            if (rddlbelnogDate != null) {
                belnogDate = rddlbelnogDate.get_selectedItem().get_value();
            }
            else {
                belnogDate = lblbelnogDate;
            }
            var data = ["<%=m_Applicant%>", belnogDate, "<%=m_TaskID%>", hfWorkType, actHours, "month"];
            var returnValue = $uof.pageMethod.syncUc("EIP/Duty/WKFOptionalFields/OverTimeWorkInfoUC.ascx", "CheckOvertimeHours", data);
            var arr = returnValue.split('/');
            if (arr.length >= 4) {
                //當月超時不可加班
                if (arr[0].toLowerCase() === "true" && arr[1].toLowerCase() === "true") {
                    lblMoreThanLawHoursMsg2.css("display", "none");
                    lblMoreThanLawHoursMsg2.text("");
                    e.innerText = errorMsg.format(lblEveryMonth, arr[2], arr[3], lblRejectOT);
                    args.IsValid = false;
                }
                //當月超時仍可加班
                else if (arr[0].toLowerCase() === "false" && arr[1].toLowerCase() === "true") {
                    lblMoreThanLawHoursMsg2.css("display", "");
                    lblMoreThanLawHoursMsg2.text(errorMsg.format(lblEveryMonth, arr[2], arr[3], ""));
                    hfIsMonthValid.val(lblMoreThanLawHoursMsg2.text());
                }
                else {
                    lblMoreThanLawHoursMsg2.css("display", "none");
                    lblMoreThanLawHoursMsg2.text("");
                }
            }
        }
    }

    function CheckSeasonLimit(e, args) {
        var ovtType = $("input[id^='<% =rblOvertimeType.ClientID %>']:checked").val();
        var hfWorkType = $('#<%= hfWorkType.ClientID  %>').val();
        if (ovtType == "0" && hfWorkType !== "") {
            var rddlbelnogDate = $find('<%= rddlBelongDate.ClientID %>');
            var lblbelnogDate = $('#<%= lblBelongDate.ClientID  %>').text();
            var belnogDate;
            var rnbActHours = $find("<%=rnbActHours.ClientID%>");
            var actHours = $('#<%= lblActHours.ClientID  %>').text();
            var errorMsg = $('#<%= lblErrLimitMsg1.ClientID  %>').text();
            var lblSeason = $('#<%= lblSeason.ClientID  %>').text();
            var lblRejectOT = $('#<%= lblRejectOT.ClientID  %>').text();
            var lblMoreThanLawHoursMsg3 = $('#<%= lblMoreThanLawHoursMsg3.ClientID  %>');
            var hfIsSeasonValid = $('#<%= hfIsSeasonValid.ClientID  %>');

            if (rnbActHours) {
                actHours = rnbActHours.get_value().toString();
            }

            if (rddlbelnogDate != null) {
                belnogDate = rddlbelnogDate.get_selectedItem().get_value();
            }
            else {
                belnogDate = lblbelnogDate;
            }
            var data = ["<%=m_Applicant%>", belnogDate, "<%=m_TaskID%>", hfWorkType, actHours, "season"];
            var returnValue = $uof.pageMethod.syncUc("EIP/Duty/WKFOptionalFields/OverTimeWorkInfoUC.ascx", "CheckOvertimeHours", data);
            var arr = returnValue.split('/');
            if (arr.length >= 4) {
                //當季超時不可加班
                if (arr[0].toLowerCase() === "true" && arr[1].toLowerCase() === "true") {
                    lblMoreThanLawHoursMsg3.css("display", "none");
                    lblMoreThanLawHoursMsg3.text("");
                    e.innerText = errorMsg.format(lblSeason, arr[2], arr[3], lblRejectOT);
                    args.IsValid = false;
                }
                //當季超時仍可加班
                else if (arr[0].toLowerCase() === "false" && arr[1].toLowerCase() === "true") {
                    lblMoreThanLawHoursMsg3.css("display", "");
                    lblMoreThanLawHoursMsg3.text($('#<%= lblErrLimitMsg1.ClientID  %>').text().format(lblSeason, arr[2], arr[3], ""));
                    hfIsSeasonValid.val(lblMoreThanLawHoursMsg3.text());
                }
                else {
                    lblMoreThanLawHoursMsg3.css("display", "none");
                    lblMoreThanLawHoursMsg3.text("");
                }
            }
        }
    }


    function CheckUsersOverTime(e, args) {
        var ovtType = $("input[id^='<% =rblOvertimeType.ClientID %>']:checked").val();
        if (ovtType == "1") {
            var users = $('#<%= hfPreViewTimeTableUsers.ClientID  %>').val();
            var rddlbelnogDate = $find('<%= rddlBelongDate.ClientID %>');
            var lblbelnogDate = $('#<%= lblBelongDate.ClientID  %>').text();
            var belnogDate;
            var hfWorkType = $('#<%= hfWorkType.ClientID  %>').val();
            var rnbActHours = $find("<%=rnbActHours.ClientID%>");
            var actHours = $('#<%= lblActHours.ClientID  %>').text();

            if (rnbActHours) {
                actHours = rnbActHours.get_value().toString();
            }

            if (rddlbelnogDate != null) {
                belnogDate = rddlbelnogDate.get_selectedItem().get_value();
            }
            else {
                belnogDate = lblbelnogDate;
            }

            startDate = $find("<%=rdStartDate.ClientID%>").get_selectedDate();
            if (startDate != null) startDate = startDate.format('yyyy/MM/dd');

            endDate = $find("<%=rdEndDate.ClientID%>").get_selectedDate();
            if (endDate != null) endDate = endDate.format('yyyy/MM/dd');

            startTime = $find("<%= rdStartTime.ClientID %>").get_selectedDate();
            if (startTime != null) startTime = startTime.format('HH:mm');

            endTime = $find("<%= rdEndTime.ClientID %>").get_selectedDate();
            if (endTime != null) endTime = endTime.format('HH:mm');

            if (startDate == null || endDate == null) return;

            startDateTime = startDate + " " + startTime;
            endDateTime = endDate + " " + endTime;

            $('#<%= hfStartDate.ClientID  %>').val(startDateTime);
            $('#<%= hfEndDate.ClientID  %>').val(endDateTime);

            var data = [users, belnogDate, "<%=m_TaskID%>", hfWorkType, actHours];
            var returnValue = $uof.pageMethod.syncUc("EIP/Duty/WKFOptionalFields/OverTimeWorkInfoUC.ascx", "CheckUsersOverTime", data);
            if (returnValue === "false") {
                $("#<%= lbtnErrorInfo.ClientID %>").css("display", "");
                $('#<%= hfShowOverTimeSetting.ClientID  %>').val("true");
                args.IsValid = false;
            }
            else {
                $('#<%= hfShowOverTimeSetting.ClientID  %>').val("false");
            }
        }
    }

    function CheckOverLimit(e, args) {
        var ovtType = $("input[id^='<% =rblOvertimeType.ClientID %>']:checked").val();
        var hfWorkType = $('#<%= hfWorkType.ClientID  %>').val();
        if (ovtType == "1" && hfWorkType !== "") {
            var users = $('#<%= hfPreViewTimeTableUsers.ClientID  %>').val();
            var rddlbelnogDate = $find('<%= rddlBelongDate.ClientID %>');
            var lblbelnogDate = $('#<%= lblBelongDate.ClientID  %>').text();
            var belnogDate;
            var rnbActHours = $find("<%=rnbActHours.ClientID%>");
            var actHours = $('#<%= lblActHours.ClientID  %>').text();
            if (rnbActHours) {
                actHours = rnbActHours.get_value().toString();
            }

            if (rddlbelnogDate != null) {
                belnogDate = rddlbelnogDate.get_selectedItem().get_value();
            }
            else {
                belnogDate = lblbelnogDate;
            }

            startDate = $find("<%=rdStartDate.ClientID%>").get_selectedDate();
            if (startDate != null) startDate = startDate.format('yyyy/MM/dd');

            endDate = $find("<%=rdEndDate.ClientID%>").get_selectedDate();
            if (endDate != null) endDate = endDate.format('yyyy/MM/dd');

            startTime = $find("<%= rdStartTime.ClientID %>").get_selectedDate();
            if (startTime != null) startTime = startTime.format('HH:mm');

            endTime = $find("<%= rdEndTime.ClientID %>").get_selectedDate();
            if (endTime != null) endTime = endTime.format('HH:mm');

            if (startDate == null || endDate == null) return;

            startDateTime = startDate + " " + startTime;
            endDateTime = endDate + " " + endTime;

            $('#<%= hfStartDate.ClientID  %>').val(startDateTime);
            $('#<%= hfEndDate.ClientID  %>').val(endDateTime);

            var data = [users, belnogDate, "<%=m_TaskID%>", hfWorkType, actHours];
            var result = $uof.pageMethod.syncUc("EIP/Duty/WKFOptionalFields/OverTimeWorkInfoUC.ascx", "CheckOverLimit", data);
            var info = result.split('/');
            if (info.length >= 2) {
                if (info[2] === "true") {
                    $("#<%= lbtnCountedUpperLimit.ClientID %>").css("display", "");
                    $("#<%= hfIsCounted.ClientID %>").val("true");
                }
                else {
                    $("#<%= hfIsCounted.ClientID %>").val("false");
                }

                if (info[1] === "true") {
                    $("#<%= lblSomeOverLimit.ClientID %>").css("display", "");
                    $("#<%= lbtnMoreInfo.ClientID %>").css("display", "");
                    $("#<%= hfIsWarningShow.ClientID %>").val("true");
                }
                else {
                    $("#<%= lblSomeOverLimit.ClientID %>").css("display", "none");
                    $("#<%= lbtnMoreInfo.ClientID %>").css("display", "none");
                    $("#<%= hfIsWarningShow.ClientID %>").val("false");
                }

                if (info[0] === "false") {
                    $("#<%= hfShowOverLimitUsers.ClientID %>").val("true");
                    $("#<%= lbtnErrorInfo.ClientID %>").css("display", "");
                    args.IsValid = false;
                }
            }
            else {
                $("#<%= lbtnCountedUpperLimit.ClientID %>").css("display", "");
                $("#<%= lblSomeOverLimit.ClientID %>").css("display", "none");
                $("#<%= lbtnMoreInfo.ClientID %>").css("display", "none");
                $("#<%= hfIsWarningShow.ClientID %>").val("false");
            }
        }
    }

</script>

<asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>
        <table style="width: 97%">
            <tr>
                <td colspan="2">
                    <asp:LinkButton ID="LinkButton1" runat="server" OnClick="lnk_Edit_Click" Visible="False"
                        CausesValidation="False" meta:resourcekey="lnk_EditResource1" Text="[修改]"></asp:LinkButton>
                    <asp:LinkButton ID="LinkButton2" runat="server" OnClick="lnk_Cannel_Click" Visible="False"
                        CausesValidation="False" meta:resourcekey="lnk_CannelResource1" Text="[取消]"></asp:LinkButton>
                    <asp:LinkButton ID="LinkButton3" runat="server" OnClick="lnk_Submit_Click" Visible="False"
                        CausesValidation="False" meta:resourcekey="lnk_SubmitResource1" Text="[確定]"></asp:LinkButton>
                </td>
            </tr>
            <tr class="trTimeZone">
                <td style="padding-left:17px">
                    <asp:Label ID="Label3" runat="server" Text="歸屬地點時區" meta:resourcekey="Label3Resource1"></asp:Label>
                </td>
            </tr>
            <tr class="trTimeZone">
                <td style="padding-left:17px" colspan="2">
                    <asp:Label ID="lblOfficePlace" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td style="padding-left: 17px;padding-top: 10px" colspan="2">
                    <asp:Label ID="Label10" runat="server" meta:resourcekey="Label10Resource1" Text="加班來源"></asp:Label>
                    &nbsp
                    <asp:Label ID="Label23" runat="server" Font-Bold="True" ForeColor="Red" Height="19px" meta:resourcekey="Label23Resource1" Text="※加班以單日為主"></asp:Label>
                </td>
            </tr>
            <tr>
                <td style="padding-left: 17px; width: 220px">
                    <asp:RadioButtonList ID="rblOvertimeSource" runat="server" RepeatDirection="Horizontal" AutoPostBack="True" meta:resourcekey="rblOvertimeSourceResource1"
                        OnSelectedIndexChanged="rblOvertimeSource_SelectedIndexChanged">
                        <asp:ListItem meta:resourcekey="ListItemResource1" Selected="True" Text="一般加班" Value="0"></asp:ListItem>
                        <asp:ListItem meta:resourcekey="ListItemResource2" Text="出差加班" Value="1"></asp:ListItem>
                    </asp:RadioButtonList>
                    <asp:Label ID="lblOvertimeSource" runat="server" meta:resourcekey="lblOvertimeSourceResource1" Visible="False"></asp:Label>
                </td>
            </tr>
            <tr>
                <td style="padding-left: 17px; padding-top: 10px">
                    <asp:Label ID="Label20" runat="server" Text="加班類別" meta:resourcekey="Label20Resource1"></asp:Label>
                </td>
            </tr>
            <tr>
                <td style="padding-left: 17px">
                    <asp:RadioButtonList ID="rblOvertimeType" runat="server" RepeatDirection="Horizontal" AutoPostBack="True" meta:resourcekey="rblOvertimeTypeResource1"
                        OnSelectedIndexChanged="rblOvertimeType_SelectedIndexChanged">
                        <asp:ListItem Text="個人加班" Value="0" Selected="True" meta:resourcekey="ListItemResource3"></asp:ListItem>
                        <asp:ListItem Text="集體加班" Value="1" meta:resourcekey="ListItemResource4"></asp:ListItem>
                    </asp:RadioButtonList>
                    <asp:Label ID="lblOvertimeType" runat="server" Visible="False" meta:resourcekey="lblOvertimeTypeResource1"></asp:Label>
                </td>
                <td style="padding-top: 2px">
                    <div style="display: none">
                        <asp:LinkButton ID="lbtnUserReport" runat="server" Text="出缺勤資訊" CausesValidation="False" meta:resourcekey="lbtnUserReportResource1"></asp:LinkButton>
                    </div>
                </td>
                <td style="padding-top: 2px">
                    <div>
                        <asp:LinkButton ID="lbtnCountedUpperLimitIndividual" runat="server" Text="已計入上限時數" OnClientClick="OpenCountedDialog(this); return false;"
                                                CausesValidation="False" Style="display: none" meta:resourcekey="lbtnCountedUpperLimitResource1"></asp:LinkButton>
                    </div>
                </td>
            </tr>
            <asp:Panel ID="pnlPersons" runat="server" meta:resourcekey="pnlPersonsResource1">
                <tr>
                    <td style="padding-left: 17px; padding-top: 10px" colspan="2">
                        <asp:Label ID="Label21" runat="server" Text="加班人員" meta:resourcekey="Label21Resource1"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td style="padding-left: 20px; padding-top: 5px" colspan="2">
                        <div>
                            <asp:LinkButton ID="lbtnPreviewTimeTable" runat="server" Text="預覽班表" CausesValidation="False"
                                OnClick="lbtnPreviewTimeTable_Click" meta:resourcekey="lbtnPreviewTimeTableResource1" style="display:none"></asp:LinkButton>
                            <asp:LinkButton ID="lbtnCountedUpperLimit" runat="server" Text="已計入上限時數" onclientclick="OpenCountedDialog(this); return false;" 
                                CausesValidation="False" style="display:none" meta:resourcekey="lbtnCountedUpperLimitResource1"></asp:LinkButton>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td style="padding-left: 17px; width: 100%" colspan="2">
                        <div style="display: none">
                            <uc1:UC_ChoiceList ID="UC_ChoiceList1" runat="server" ChioceType="All" ExpandToUser="True" ShowMember="False" />
                        </div>
                        <uc1:UC_ChoiceListMobile runat="server" ID="UC_ChoiceListMobile" />
                    </td>
                </tr>
            </asp:Panel>
            <asp:Panel ID="pnlExp" runat="server" meta:resourcekey="pnlExpResource1">
                <tr>
                    <td style="padding-left: 17px; padding-top: 10px" colspan="2">
                        <asp:Label ID="Label2" runat="server" Text="預計加班時間(起)" meta:resourcekey="Label2Resource1"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td style="padding-left: 17px; padding-bottom: 8px" colspan="2">
                        <telerik:RadDatePicker ID="rdExpStartDate" runat="server" AutoPostBack="True" Width="100%" EnableTheming="true"
                            OnSelectedDateChanged="rdExpStartDate_SelectedDateChanged" meta:resourcekey="rdExpStartDateResource1">
                            <ClientEvents OnDateSelected="onExpValueChanged" />
                        </telerik:RadDatePicker>
                        <asp:Label ID="lblExpStartDate" runat="server" Visible="False" meta:resourcekey="lblExpStartDateResource1"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td style="padding-left: 17px" colspan="2">
                        <telerik:RadTimePicker ID="rdExpStartTime" runat="server" Width="100%" EnableTheming="true" CssClass="fullWidth">
                            <ClientEvents OnDateSelected="onExpValueChanged" />
                        </telerik:RadTimePicker>
                    </td>
                </tr>
                <tr>
                    <td style="padding-left: 17px; padding-top: 10px" colspan="2">
                        <asp:Label ID="Label4" runat="server" meta:resourcekey="Label4Resource1" Text="預計加班時間(訖)"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td style="padding-left: 17px; padding-bottom: 8px" colspan="2">
                        <telerik:RadDatePicker ID="rdExpEndDate" runat="server" AutoPostBack="false" Width="100%" EnableTheming="true" meta:resourcekey="rdExpEndDateResource1">
                            <ClientEvents OnDateSelected="onExpValueChanged" />
                        </telerik:RadDatePicker>
                        <asp:Label ID="lblExpEndDate" runat="server" Visible="False" meta:resourcekey="lblExpEndDateResource1"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td style="padding-left: 17px" colspan="2">
                        <telerik:RadTimePicker ID="rdExpEndTime" runat="server" Width="100%" EnableTheming="true" CssClass="fullWidth">
                            <ClientEvents OnDateSelected="onExpValueChanged" />
                        </telerik:RadTimePicker>
                    </td>
                </tr>
                <tr>
                    <td style="padding-left: 17px; padding-top: 10px" colspan="2">
                        <asp:Label ID="Label22" runat="server" Text="預計用餐/休息時數" meta:resourcekey="Label22Resource1"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td style="padding-left: 17px" colspan="2">
                        <asp:RadioButtonList ID="rblExpEatHours" runat="server"
                            RepeatDirection="Vertical" onClick="onExpValueChanged()"
                            meta:resourcekey="rblExpEatHoursResource1">
                            <asp:ListItem Text="0小時" Value="0" Selected="True" meta:resourcekey="ListItemResource65"></asp:ListItem>
                            <asp:ListItem Text="0.5小時" Value="0.5" meta:resourcekey="ListItemResource66"></asp:ListItem>
                            <asp:ListItem Text="1小時" Value="1" meta:resourcekey="ListItemResource67"></asp:ListItem>
                            <asp:ListItem Text="1.5小時" Value="1.5" meta:resourcekey="ListItemResource68"></asp:ListItem>
                            <asp:ListItem Text="2小時" Value="2" meta:resourcekey="ListItemResource69"></asp:ListItem>
                        </asp:RadioButtonList>
                        <asp:Label ID="lblExpEatHours" runat="server" Visible="False"
                            meta:resourcekey="lblExpEatHoursResource1"></asp:Label>
                        <asp:Label ID="lblShowExpEatHours" runat="server" Text="時" Visible="False"
                            meta:resourcekey="lblShowExpEatHoursResource1"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td style="padding-left: 17px; padding-top: 5px" colspan="2">
                        <asp:Label ID="Label6" runat="server" Text="預計加班時數" meta:resourcekey="Label6Resource1"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td style="padding-left: 17px" colspan="2">
                        <telerik:RadButton ID="rdbtnExpCal" OnClick="rdbtnExpCal_Click" CausesValidation="False" runat="server" Text="計算" Width="70px"
                            meta:resourcekey="rdbtnExpCalResource1">
                        </telerik:RadButton>
                        <asp:Label ID="lblExpHours" runat="server" meta:resourcekey="lblExpHoursResource1"></asp:Label>
                        <asp:Label ID="Label7" runat="server" Text="時" meta:resourcekey="Label7Resource1"></asp:Label>
                    </td>
                </tr>
            </asp:Panel>
            <tr>
                <td style="padding-left: 17px; padding-top: 20px" colspan="2">
                    <asp:Label ID="Label9" runat="server" Text="實際加班時間(起)" meta:resourcekey="Label9Resource1"></asp:Label>
                </td>
            </tr>
            <tr>
                <td style="padding-left: 17px; padding-bottom: 8px" colspan="2">
                    <telerik:RadDatePicker ID="rdStartDate" runat="server" AutoPostBack="True" Width="100%" EnableTheming="true"
                        OnSelectedDateChanged="rdStartDate_SelectedDateChanged" meta:resourcekey="rdStartDateResource1">
                        <Calendar UseColumnHeadersAsSelectors="False" UseRowHeadersAsSelectors="False"></Calendar>
                        <DateInput AutoPostBack="True" LabelWidth="40%" Width="" ClientEvents-OnValueChanging="OnValueChanging"></DateInput>
                        <DatePopupButton HoverImageUrl="" ImageUrl="" CssClass="" />
                        <ClientEvents OnDateSelected="onActValueChanged" />
                    </telerik:RadDatePicker>
                    <asp:Label ID="lblActStartDate" runat="server" Visible="False" meta:resourcekey="lblActStartDateResource1"></asp:Label>
                </td>
            </tr>
            <tr>
                <td style="padding-left: 17px" colspan="2">
                    <telerik:RadTimePicker ID="rdStartTime" runat="server" Width="100%" EnableTheming="true" CssClass="fullWidth">
                        <ClientEvents OnDateSelected="onActValueChanged" />
                    </telerik:RadTimePicker>
                </td>
            </tr>
            <tr>
                <td style="padding-left: 17px; padding-top: 10px" colspan="2">
                    <asp:Label ID="Label13" runat="server" Text="實際加班時間(訖)" meta:resourcekey="Label13Resource1"></asp:Label>
                </td>
            </tr>
            <tr>
                <td style="padding-left: 17px; padding-bottom: 8px" colspan="2">
                    <telerik:RadDatePicker ID="rdEndDate" runat="server" AutoPostBack="false" Width="100%" EnableTheming="true" meta:resourcekey="rdEndDateResource1">
                        <Calendar UseColumnHeadersAsSelectors="False" UseRowHeadersAsSelectors="False">
                        </Calendar>
                        <DateInput AutoPostBack="True" LabelWidth="40%" Width="" ClientEvents-OnValueChanging="OnValueChanging">
                        </DateInput>
                        <DatePopupButton HoverImageUrl="" ImageUrl="" CssClass="" />
                        <ClientEvents OnDateSelected="onActValueChanged" />
                    </telerik:RadDatePicker>
                    <asp:Label ID="lblActEndDate" runat="server" Visible="False" meta:resourcekey="lblActEndDateResource1"></asp:Label>
                </td>
            </tr>
            <tr>
                <td style="padding-left: 17px" colspan="2">
                    <telerik:RadTimePicker ID="rdEndTime" runat="server" Width="100%" EnableTheming="true" CssClass="fullWidth">
                        <ClientEvents OnDateSelected="onActValueChanged" />
                    </telerik:RadTimePicker>
                </td>
            </tr>
            <tr>
                <td style="padding-left: 17px; padding-top: 10px" colspan="2">
                    <asp:Label ID="Label1" runat="server" Text="實際用餐/休息時數" meta:resourcekey="Label1Resource1"></asp:Label>
                </td>
            </tr>
            <tr>
                <td style="padding-left: 17px" colspan="2">
                    <asp:RadioButtonList ID="rblActEatHours" runat="server" onClick="ClearLea()"
                        RepeatDirection="Vertical" meta:resourcekey="rblActEatHoursResource1">
                        <asp:ListItem Text="0小時" Value="0" Selected="True" meta:resourcekey="ListItemResource128"></asp:ListItem>
                        <asp:ListItem Text="0.5小時" Value="0.5" meta:resourcekey="ListItemResource129"></asp:ListItem>
                        <asp:ListItem Text="1小時" Value="1" meta:resourcekey="ListItemResource130"></asp:ListItem>
                        <asp:ListItem Text="1.5小時" Value="1.5" meta:resourcekey="ListItemResource131"></asp:ListItem>
                        <asp:ListItem Text="2小時" Value="2" meta:resourcekey="ListItemResource132"></asp:ListItem>
                    </asp:RadioButtonList>
                    <asp:Label ID="lblActEatHours" runat="server" Visible="False"
                        meta:resourcekey="lblActEatHoursResource1"></asp:Label>
                    <asp:Label ID="lblShowActEatHours" runat="server" Text="時" Visible="False"
                        meta:resourcekey="lblShowActEatHoursResource1"></asp:Label>
                </td>
            </tr>
            <tr>
                <td style="padding-left: 17px; padding-top: 5px" colspan="2">
                    <asp:Label ID="Label15" runat="server" Text="實際加班時數" meta:resourcekey="Label15Resource1"></asp:Label>
                </td>
            </tr>
            <tr>
                <td style="padding-left: 17px; padding-bottom: 5px" colspan="2">
                    <telerik:RadButton ID="rbtnActCal" runat="server" CausesValidation="False" Text="計算" Width="70px"
                        OnClick="rbtnActCal_Click" meta:resourcekey="rbtnActCalResource1">
                    </telerik:RadButton>
                    <asp:Label ID="lblActWorkHours" runat="server" meta:resourcekey="lblActWorkHoursResource1"></asp:Label>
                    <asp:Label ID="Label16" runat="server" meta:resourcekey="Label16Resource1" Text="時"></asp:Label>
                </td>
            </tr>
            <tr>
                <td style="padding-left: 17px; padding-top: 15px" colspan="2">
                    <asp:Label ID="Label8" runat="server" Text="歸屬日" meta:resourcekey="Label8Resource1"></asp:Label>
                </td>
            </tr>
            <tr>
                <td style="padding-left: 17px" colspan="2">
                    <telerik:RadDropDownList ID="rddlBelongDate" runat="server" EnableTheming="true"
                        AutoPostBack="true" OnSelectedIndexChanged="rddlBelongDate_SelectedIndexChanged" CausesValidation="false" meta:resourcekey="rddlBelongDateResource1">
                    </telerik:RadDropDownList>
                    <asp:Label ID="lblBelongDate" runat="server" Visible="False" meta:resourcekey="lblBelongDateResource1"></asp:Label>
                </td>
            </tr>
            <tr>
                <td style="padding-left: 17px; padding-top: 15px" colspan="2">
                    <asp:Label ID="lblActHoursTitle" runat="server" Text="核銷時數" meta:resourcekey="lblActHoursTitleResource1"></asp:Label>
                </td>
            </tr>
            <tr>
                <td style="padding-left: 17px" colspan="2">
                    <telerik:RadNumericTextBox ID="rnbActHours" runat="server" NumberFormat-DecimalDigits="1" Width="40px" Visible="false"></telerik:RadNumericTextBox>
                    <asp:Label ID="lblActHours" runat="server" meta:resourcekey="lblActHoursResource1"></asp:Label>
                    <asp:Label ID="lblActHoursUnit" runat="server" Text="時" meta:resourcekey="lblActHoursUnitResource1"></asp:Label>
                    <asp:HiddenField runat="server" ID="hfSameSetupHours"></asp:HiddenField>
                </td>
            </tr>
            <tr>
                <td style="padding-left: 17px; padding-top: 15px" colspan="2">
                    <asp:Label ID="lblWorkTypeTitle" runat="server" Text="加班類型" meta:resourcekey="lblWorkTypeTitleResource1"></asp:Label>
                    <asp:Label ID="Label5" runat="server" meta:resourcekey="lblWorkTypeResourcekey1"></asp:Label>
                </td>
            </tr>
            <tr>
                <td style="padding-left: 17px" colspan="2">
                    <asp:HiddenField ID="hfWorkType" runat="server" />
                    <asp:HiddenField ID="hfHolidayType" runat="server" />
                    <asp:Label ID="lblWorkType" runat="server" meta:resourcekey="lblWorkTypeResourcekey1"></asp:Label>
                </td>
            </tr>
            <tr>
                <td style="padding-left: 17px; padding-top: 15px" colspan="2">
                    <asp:Label ID="lblOTType" runat="server" Text="給付方式" meta:resourcekey="lblOTTypeResource1"></asp:Label>
                </td>
            </tr>
            <tr>
                <td style="padding-left: 17px" colspan="2">
                    <asp:RadioButtonList ID="rblChangeType" runat="server" RepeatDirection="Horizontal" meta:resourcekey="rblChangeTypeResource1">
                        <asp:ListItem Text="轉補休" Value="TimeOff" meta:resourcekey="ListItemTimeOffResource1"></asp:ListItem>
                        <asp:ListItem Text="轉費用" Value="Payment" meta:resourcekey="ListItemPaymentResourc1"></asp:ListItem>
                        <asp:ListItem Text="轉補休及費用" Value="Both" meta:resourcekey="ListItemBothResource1"></asp:ListItem>
                    </asp:RadioButtonList>
                    <asp:Label ID="lblChangeType" runat="server" Visible="false" meta:resourcekey="lblChangeTypeResourcekey1"></asp:Label>
                    <asp:HiddenField ID="hfChangeType" runat="server" />
                </td>
            </tr>

            <tr>
                <td style="padding-left: 17px" colspan="2">
                    <asp:Label ID="lblMoreThanLawHoursMsg" runat="server" ForeColor="Blue" Style="display: none" meta:resourcekey="lblMoreThanLawHoursMsgResource1"></asp:Label>
                </td>
            </tr>
            <tr>
                <td style="padding-left: 17px" colspan="2">
                    <asp:Label ID="lblMoreThanLawHoursMsg2" runat="server" ForeColor="Blue" Style="display: none" meta:resourcekey="lblMoreThanLawHoursMsg2Resource1"></asp:Label>
                </td>
            </tr>
            <tr>
                <td style="padding-left: 17px" colspan="2">
                    <asp:Label ID="lblMoreThanLawHoursMsg3" runat="server" ForeColor="Blue" Style="display: none" meta:resourcekey="lblMoreThanLawHoursMsg3Resource1"></asp:Label>
                </td>
            </tr>
            <tr>
                <td style="padding-left: 17px" colspan="2">
                    <asp:Label ID="lblSomeOverLimit" runat="server" style="display:none" ForeColor="Blue" Text="部分人員加班時數已超出上限" meta:resourcekey="lblSomeOverLimitResource1"></asp:Label>
                </td>
            </tr>
            <tr>
                <td style="padding-left: 17px" colspan="2">
                    <asp:LinkButton ID="lbtnMoreInfo" runat="server" Text="詳細資訊" CausesValidation="False" 
                onclientclick="OpenCountedDialog(this); return false;" style="display:none" meta:resourcekey="lbtnMoreInfoResource1"></asp:LinkButton>
                </td>
            </tr>            
            <asp:Label ID="lblSameOverTimeMsg" runat="server" Visible="false" ForeColor="Blue"></asp:Label>
        </table>

        <%-- 驗證元件 --%>
        <table style="width: 97%" cellpadding="0" cellspacing="0">
            <tr>
                <td style="padding-left: 17px">
                    <asp:CustomValidator ID="cvOvertimeUsers" runat="server" Display="Dynamic" ForeColor="Red" ErrorMessage="請選擇加班人員" Visible="False" EnableTheming="true"
                        ClientValidationFunction="CheckOverTimeUsers" meta:resourcekey="cvOvertimeUsersResource1"></asp:CustomValidator>
                </td>
            </tr>
            <tr>
                <td style="padding-left: 17px">
                    <asp:CustomValidator ID="cvTimeTable" runat="server" ErrorMessage="加班人員須為同一班表" Visible="False" Display="Dynamic" ForeColor="Red" EnableTheming="true"
                        ClientValidationFunction="CheckTimeTable" meta:resourcekey="cvTimeTableResource1"></asp:CustomValidator>
                </td>
            </tr>
            <tr>
                <td style="padding-left: 17px">
                    <asp:CustomValidator ID="cvSingleHolidayType" runat="server" ErrorMessage="請設定加班類型" Display="Dynamic" ForeColor="Red" EnableTheming="true"
                        ClientValidationFunction="CheckSingleHolidayType" meta:resourcekey="cvCheckSingleHolidayTypeResource1"></asp:CustomValidator>
                </td>
            </tr>
            <tr>
                <td style="padding-left: 17px">
                    <asp:CustomValidator ID="cvSameTimeZone" runat="server" ClientValidationFunction="CheckSameOffice" ErrorMessage="加班人員須為同一歸屬地點" Display="Dynamic" ForeColor="Red" meta:resourcekey="cvSameTimeZoneResource1" ></asp:CustomValidator>
                </td>
            </tr>
            <tr>
                <td style="padding-left: 17px">
                    <asp:CustomValidator ID="cvCheckUsersSett" runat="server" ClientValidationFunction="CheckUsersSett" ForeColor="Red"
                        ErrorMessage="加班人員須為同一差勤結算類別" Display="Dynamic" Visible="False" 
                        meta:resourcekey="cvCheckUsersSettResource1"></asp:CustomValidator>
                </td>
            </tr>
            <tr>
                <td style="padding-left: 17px">
                    <asp:CustomValidator ID="cValidExpHour" runat="server" Display="Dynamic" ErrorMessage="預計加班時數不可為0或空白(請記得按下計算鈕)" ForeColor="Red" EnableTheming="true"
                        ClientValidationFunction="CheckExpOvertimeHour" meta:resourcekey="cValidExpHourResource1"></asp:CustomValidator>
                </td>
            </tr>
            <tr>
                <td style="padding-left: 17px">
                    <asp:CustomValidator ID="cValidActHour" runat="server" Display="Dynamic" ErrorMessage="實際加班時數不可為0或空白(請記得按下計算鈕)" ForeColor="Red" EnableTheming="true"
                        ClientValidationFunction="CheckActOvertimeHour" meta:resourcekey="cValidActHourResource1"></asp:CustomValidator>
                </td>
            </tr>
            <tr>
                <td style="padding-left: 17px">
                    <asp:CustomValidator ID="cvCheckActHours" runat="server" ForeColor="Red" EnableTheming="true"
                        ErrorMessage="核銷時數不可為0或空白(請記得按下計算按鈕)" Display="Dynamic" ClientValidationFunction="CheckActHours" meta:resourcekey="cvCheckActHoursResource1"></asp:CustomValidator>
                </td>
            </tr>
            <tr>
                <td style="padding-left: 17px">
                    <asp:CustomValidator ID="cvMaxExpHours" runat="server" ErrorMessage="預計加班時數不可大於預計加班時間(訖) - 預計加班時間(起) - 預計用餐時數" Visible="False" Display="Dynamic" ForeColor="Red" EnableTheming="true"
                        ClientValidationFunction="CheckMaxExpHours" meta:resourcekey="cvMaxExpHoursResource1"></asp:CustomValidator>
                </td>
            </tr>
            <tr>
                <td style="padding-left: 17px">
                    <asp:CustomValidator ID="cvMaxActHours" runat="server" Display="Dynamic" ErrorMessage="實際加班時數不可大於實際加班時間(訖) - 實際加班時間(起) - 實際用餐時數" Visible="False" ForeColor="Red" EnableTheming="true"
                        ClientValidationFunction="CheckMaxActHours" meta:resourcekey="cvMaxActHoursResource1"></asp:CustomValidator>
                </td>
            </tr>
            <tr>
                <td style="padding-left: 17px">
                    <asp:CustomValidator ID="cvClosed" runat="server" ErrorMessage="歸屬日為已鎖單或已關帳月份不允許申請" Display="Dynamic" Visible="False" ForeColor="Red" EnableTheming="true"
                        ClientValidationFunction="CheckIsClose" meta:resourcekey="cvClosedResource1"></asp:CustomValidator>
                </td>
            </tr>
            <tr>
                <td style="padding-left: 17px">
                    <asp:CustomValidator ID="cvDoubleLeaveForm" runat="server" ErrorMessage="加班時間與請假時間重疊" Display="Dynamic" Visible="False" ForeColor="Red" EnableTheming="true"
                        ClientValidationFunction="CheckDoubleLeaveForm" meta:resourcekey="cvDoubleLeaveFormResource1"></asp:CustomValidator>
                </td>
            </tr>
            <tr>
                <td style="padding-left: 17px">
                    <asp:CustomValidator ID="cvDoubleLeaveFormUsers" runat="server" ErrorMessage="所選擇加班人員的加班時間與請假時間重疊" Visible="False" Display="Dynamic" ForeColor="Red" EnableTheming="true"
                        ClientValidationFunction="CheckDoubleLeaveForm" meta:resourcekey="cvDoubleLeaveFormUsersResource1"></asp:CustomValidator>
                </td>
            </tr>
            <tr>
                <td style="padding-left: 17px">
                    <asp:CustomValidator ID="cvDoubleOTForm" runat="server" ErrorMessage="加班時間與其他加班單時間重疊" Display="Dynamic" Visible="False" ForeColor="Red" EnableTheming="true"
                        ClientValidationFunction="CheckDoubleOTForm" meta:resourcekey="cvDoubleOTFormResource1"></asp:CustomValidator>
                </td>
            </tr>
            <tr>
                <td style="padding-left: 17px">
                    <asp:CustomValidator ID="cvDoubleOTFormUsers" runat="server" ErrorMessage="所選擇加班人員的加班時間與其他加班單時間重疊" Visible="False" Display="Dynamic" ForeColor="Red" EnableTheming="true"
                        ClientValidationFunction="CheckDoubleOTForm" meta:resourcekey="cvDoubleOTFormUsersResource1"></asp:CustomValidator>
                </td>
            </tr>            
            <tr>
                <td style="padding-left: 17px">
                    <asp:CustomValidator ID="cvAllowOverTime" runat="server" ForeColor="Red" EnableTheming="true"
                        ErrorMessage="此加班類型不允許加班" Display="Dynamic" ClientValidationFunction="CheckAllowOverTime"  meta:resourcekey="cvAllowOverTimeResource1"></asp:CustomValidator>
                </td>
            </tr>
            <tr>
                <td style="padding-left: 17px">
                    <asp:CustomValidator ID="cvSameSetupHours" runat="server" ForeColor="Red" EnableTheming="true"
                        ErrorMessage="加班人員使用的加班時數算法需為相同" Display="Dynamic" ClientValidationFunction="CheckSameSetupHours" meta:resourcekey="cvSameSetupHoursResource1"></asp:CustomValidator>
                </td>
            </tr>
            <tr>
                <td style="padding-left: 17px">
                    <asp:CustomValidator ID="cvCheckHolidayType" runat="server" ForeColor="Red" EnableTheming="true"
                        ErrorMessage="加班人員須為相同加班類型" Display="Dynamic" ClientValidationFunction="CheckHolidayType" meta:resourcekey="cvCheckHolidayTypeResource1"></asp:CustomValidator>
                </td>
            </tr>
            <tr>
                <td style="padding-left: 17px">
                    <asp:CustomValidator ID="cvSameChangeType" runat="server" ForeColor="Red" EnableTheming="true"
                        ErrorMessage="加班人員須為相同給付方式" Display="Dynamic" ClientValidationFunction="CheckSameChangeType" meta:resourcekey="cvSameChangeTypeResource1"></asp:CustomValidator>
                </td>
            </tr>
            <tr>
                <td style="padding-left: 17px">
                    <asp:CustomValidator ID="cvChangeType" runat="server" ForeColor="Red" EnableTheming="true"
                        ErrorMessage="請選擇給付方式" Display="Dynamic" ClientValidationFunction="CheckChangeType" meta:resourcekey="rfChangeTypeResource1"></asp:CustomValidator>
                </td>
            </tr>
            <tr>
                <td style="padding-left: 17px">
                    <asp:CustomValidator ID="cvCheckDayLimit" runat="server" Display="Dynamic" ForeColor="Red" EnableTheming="true"
                        ClientValidationFunction="CheckDayLimit" meta:resourcekey="cvCheckDayLimitResource1"></asp:CustomValidator>
                </td>
            </tr>
            <tr>
                <td style="padding-left: 17px">
                    <asp:CustomValidator ID="cvCheckMonthLimit" runat="server" Display="Dynamic" ForeColor="Red" EnableTheming="true"
                        ClientValidationFunction="CheckMonthLimit" meta:resourcekey="cvCheckMonthLimitResource1"></asp:CustomValidator>
                </td>
            </tr>
            <tr>
                <td style="padding-left: 17px">
                    <asp:CustomValidator ID="cvCheckSeasonLimit" runat="server" Display="Dynamic" ForeColor="Red" EnableTheming="true"
                        ClientValidationFunction="CheckSeasonLimit" meta:resourcekey="cvCheckSeasonLimitResource1"></asp:CustomValidator>
                </td>
            </tr>
            <tr>
                <td style="padding-left: 17px">
                    <asp:CustomValidator ID="cvCheckUsersOverTime" runat="server" Display="Dynamic" ForeColor="Red" EnableTheming="true"
                        ClientValidationFunction="CheckUsersOverTime" ErrorMessage="加班人員加班上限控制設定需相同"
                        meta:resourcekey="cvCheckUsersOverTimeResource1"></asp:CustomValidator>
                </td>
            </tr>
            <tr>
                <td style="padding-left: 17px">
                    <asp:CustomValidator ID="cvIsOverLimit" runat="server" Display="Dynamic" ForeColor="Red" EnableTheming="true"
                        ClientValidationFunction="CheckOverLimit" ErrorMessage="部分人員加班時數已超出上限，無法申請加班"
                        meta:resourcekey="cvIsOverLimitResource1"></asp:CustomValidator>
                </td>
            </tr>
            <tr>
                <td style="padding-left: 17px">
                    <div>
                        <asp:LinkButton ID="lbtnErrorInfo" runat="server" Text="點此查看詳細錯誤資訊" CausesValidation="False" Style="display: none"
                            OnClientClick="OpenDialog(this); return false;" meta:resourcekey="lbtnErrorInfoResource1"></asp:LinkButton>
                    </div>
                </td>
            </tr>
        </table>
        <br />
        <asp:HiddenField ID="hfPreViewTimeTableUsers" runat="server" />
        <asp:HiddenField ID="hfErrorSelectUsers" runat="server" />
        <asp:HiddenField ID="hfStartDate" runat="server" />
        <asp:HiddenField ID="hfEndDate" runat="server" />
        <asp:HiddenField ID="hfUsers" runat="server" />
        <asp:HiddenField ID="hfIsSeasonValid" runat="server" />
        <asp:HiddenField ID="hfIsMonthValid" runat="server" />
        <asp:HiddenField ID="hfIsDayValid" runat="server" />
        <asp:HiddenField ID="hfIsCounted" runat="server" value="false" />
        <asp:HiddenField ID="hfIsWarningShow" runat="server" />
        <asp:HiddenField ID="hfShowOverTimeSetting" runat="server" value="false" />
        <asp:HiddenField ID="hfShowOverLimitUsers" runat="server" value="false" />
        <asp:HiddenField ID="hfOverTimeType" runat="server" Value="3.0"/>
    </ContentTemplate>
</asp:UpdatePanel>



<asp:TextBox ID="txtIsCheckPunch" runat="server" Style="display: none" Text="0" meta:resourcekey="txtIsCheckPunchResource1"></asp:TextBox>
<asp:Label ID="lblOvertimeMsg" runat="server" ForeColor="Red" Text="加班時間與刷卡時間不符，請再次確認" Visible="False" meta:resourcekey="lblOvertimeMsgResource1"></asp:Label>
<asp:TextBox ID="txtExpCal" runat="server" Style="display: none" meta:resourcekey="txtExpCalResource1"></asp:TextBox>
<asp:Label ID="lblSexM" runat="server" Text="男性" Visible="False" meta:resourcekey="lblSexMResource1"></asp:Label>
<asp:Label ID="lblSexF" runat="server" Text="女性" Visible="False" meta:resourcekey="lblSexFResource1"></asp:Label>
<asp:HiddenField ID="hfMode" runat="server" />
<asp:Label ID="lblHasNoAuthority" runat="server" Text="無填寫權限" ForeColor="Red" Visible="False" meta:resourcekey="lblHasNoAuthorityResource1"></asp:Label>
<asp:Label ID="lblToolTipMsg" runat="server" Text="不允許修改(唯讀)" Visible="False" meta:resourcekey="lblToolTipMsgResource1"></asp:Label>        
<asp:Label ID="lblFiller" CssClass="FillerVisible" runat="server" meta:resourcekey="lblFillerResource1"></asp:Label>
<asp:Label ID="lblModifier" runat="server" Visible="False" meta:resourcekey="lblModifierResource1"></asp:Label>
<asp:Label ID="lblMsgSigner" runat="server" Text="填寫者" Visible="False" meta:resourcekey="lblMsgSignerResource1"></asp:Label>            
<asp:Label ID="lblMsgEditor" runat="server" Text="修改者" Visible="False" meta:resourcekey="lblMsgEditorResource1"></asp:Label>
<asp:Label ID="lblAuthorityMsg" runat="server" Text="具填寫權限人員" Visible="False" meta:resourcekey="lblAuthorityMsgResource1"></asp:Label>
<asp:Label ID="lblDay" runat="server" Text="當日" Visible="False" meta:resourcekey="lblDayResource1"></asp:Label>
<asp:Label ID="lblMonth" runat="server" Text="當月" Visible="False" meta:resourcekey="lblMonthResource1"></asp:Label>
<asp:Label ID="lblHour" runat="server" Text="小時" Visible="False" meta:resourcekey="lblHourResource1"></asp:Label>
<asp:Label ID="lblWorkTypeWorkDay" runat="server" Text="工作日" Visible="False" meta:resourcekey="lblWorkTypeWorkDayResource1"></asp:Label>
<asp:Label ID="lblWorkTypeDayoff" runat="server" Text="休息日" Visible="False" meta:resourcekey="lblWorkTypeDayoffResource1"></asp:Label>
<asp:Label ID="lblWorkTypeRoutine" runat="server" Text="例假日" Visible="False" meta:resourcekey="lblWorkTypeRoutineResource1"></asp:Label>
<asp:Label ID="lblWorkTypeOrgHoliday" runat="server" Text="國定假日" Visible="False" meta:resourcekey="lblWorkTypeOrgHolidayResource1"></asp:Label>
<asp:Label ID="lblSameOverTimeTempMsg" runat="server" Visible="false" Text="{0}已申請同一歸屬日{1}的加班，實際加班時數為{2}小時，核銷時數為{3}小時<br>" meta:resourcekye="lblSameOverTimeTempMsgResource1"></asp:Label>
<asp:Label ID="lblTypeMiss" runat="server" Text="選擇給付方式已被修改或移除，請洽系統管理員" style=" display:none;" ForeColor="Red"  meta:resourcekye="lblTypeMissResource1"></asp:Label>
<asp:Label ID="lblWDay" runat="server" Text="平日" style="display:none" meta:resourcekey="lblWDayResource1"></asp:Label>
<asp:Label ID="lblHDay" runat="server" Text="假日" style="display:none" meta:resourcekey="lblHDayResource1"></asp:Label>
<asp:Label ID="lblEveryMonth" runat="server" Text="每月" style="display:none" meta:resourcekey="lblEveryMonthResource1"></asp:Label>
<asp:Label ID="lblSeason" runat="server" Text="每季" style="display:none" meta:resourcekey="lblSeasonResource1"></asp:Label>
<asp:Label ID="lblErrLimitMsg1" runat="server" Text="{0}加班上限{1}小時，目前累計加班已達{2}小時{3}。" style="display:none" meta:resourcekey="lblErrLimitMsg1Resource1"></asp:Label>
<asp:Label ID="lblErrLimitMsg2" runat="server" Text="{0}加班上限{1}小時，此加班日期累計加班已達{2}小時{3}。" style="display:none" meta:resourcekey="lblErrLimitMsg2Resource1"></asp:Label>
<asp:Label ID="lblRejectOT" runat="server" Text="，無法申請加班" style="display:none" meta:resourcekey="lblRejectOTResource1"></asp:Label>
<asp:Label ID="lblOverLimit" runat="server" Text="已超出{0}上限" style="display:none" meta:resourcekey="lblOverLimitResource1"></asp:Label>
<asp:Label ID="lblCountedTitle" runat="server" Text="已計入上限時數" style="display:none" meta:resourcekey="lblCountedTitleResource1"></asp:Label>
<asp:HiddenField runat="server" ID="hfTimeZoneEnable"></asp:HiddenField>