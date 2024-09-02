<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="OverTimeInfoAdvUC.ascx.cs" Inherits="Ede.Uof.Web.EIP.Duty.WKFOptionalFields104.OverTimeInfoAdvUC" %>
<style>
    .OvertimeTable104 > tbody > tr:nth-child(even) > td {
        padding-left : 10px;
        padding-bottom: 15px;
    }

    .OvertimeTable104 > tbody > tr:nth-child(odd) > td {
        padding-left : 10px;
        padding-bottom : 5px;
    }
    .labelMutiline {
      white-space:pre-wrap;
    }
</style>
<script>
    Sys.Application.add_load(function () {
        AddChangeEvent_<%=ClientID%>();

        if ($("#<%=hfFieldMode.ClientID%>").val() === "Design" || typeof $("#<%=hfFieldMode.ClientID%>").val() == 'undefined') {
            return;
        }

        var applicantEmployeeNo = $("#<%=hfApplicantEmployeeNo.ClientID%>").val();
        var applicantCompanyUnifiedId = $("#<%=hfApplicantCompanyUnifiedId.ClientID%>").val();
        if (applicantEmployeeNo === '' || applicantCompanyUnifiedId === '') {
            return;
        }
    });

    function AddChangeEvent_<%=ClientID%>() {
        // 預計折換方式
        $('input[type=radio][id*=<%=rblOverTimeTypeAdv.ClientID%>]').on('change', function () {
            ClearHoursAdv_<%=ClientID%>();
            ClearHours_<%=ClientID%>();
        });

        // 預計扣除時數
        $('input[type=checkbox][id*=<%=cblExcludeHoursAdv.ClientID%>]').on('change', function () {
            ClearHoursAdv_<%=ClientID%>();
            ClearHours_<%=ClientID%>();
        });

        $('input[type=checkbox][id*=<%=cblExcludeHours.ClientID%>]').on('change', function () {
            ClearHours_<%=ClientID%>();
        });

        $('input[type=radio][id*=<%=rblOverTimeType.ClientID%>]').on('change', function () {
            ClearHours_<%=ClientID%>();
        });
    }

    function ClearHours_<%=ClientID%>()
    {
        $("#<%=lblHours.ClientID%>").text('');
        $("#<%=txtHours.ClientID%>").val('');
        $("#<%=txtUnit.ClientID%>").val('');
        $("#<%=txtError.ClientID%>").val('');
        $("#<%=txtError.ClientID%>").hide();
    }

    function OnDateSelected_<%=ClientID%>(sender, eventArgs) {
        ClearHours_<%=ClientID%>();
    }

    function CalBtnClick_<%=ClientID%>(sender, args)
    {
        CalOverTimeHours_<%=ClientID%>();
    }

    function CalOverTimeHours_<%=ClientID%>()
    {
        var unit = '';
        var hours = '';
        var hoursResult = '';
        var arrayResult;
        var startDate = $find("<%=rdStartDate.ClientID%>").get_dateInput().get_value();
        var endDate = $find("<%=rdEndDate.ClientID%>").get_dateInput().get_value();
        var startTime = $find("<%=rdStartTime.ClientID%>").get_dateInput().get_value();
        var endTime = $find("<%=rdEndTime.ClientID%>").get_dateInput().get_value();
        var deductibleHours = CalExcludeHours_<%=ClientID%>();
        var applicantEmployeeNo = $("#<%=hfApplicantEmployeeNo.ClientID%>").val();
        var applicantCompanyUnifiedId = $("#<%=hfApplicantCompanyUnifiedId.ClientID%>").val();

        //沒有公司統編或員編就不跑其他驗證
        var applicantEmployeeNo = $("#<%=hfApplicantEmployeeNo.ClientID%>").val();
        var applicantCompanyUnifiedId = $("#<%=hfApplicantCompanyUnifiedId.ClientID%>").val();

        if (applicantEmployeeNo === '' || applicantCompanyUnifiedId === '') {
            return;
        }

        var data = [applicantCompanyUnifiedId, applicantEmployeeNo, startDate, startTime, endDate, endTime, deductibleHours];
        var result = $uof.pageMethod.syncUc("EIP/Duty/WKFOptionalFields104/OverTimeInfoAdvUC.ascx", "CalHours", data);
        
        if (result !== "") {
            arrayResult = result.split('|');
            if (arrayResult.length > 0) {
                if (arrayResult[0] === arrayResult[1] && arrayResult[1] === arrayResult[2] && arrayResult[2] === arrayResult[0]) {
                    if (arrayResult[0] === "HRError") {
                        $("#<%=txtError.ClientID%>").val($("#<%=lblNotFoundSP.ClientID%>").text());
                    } else {
                        $("#<%=txtError.ClientID%>").val(arrayResult[0]);                    
                    }
                    $("#<%=lblHours.ClientID%>").text('');
                    $("#<%=txtHours.ClientID%>").val('');
                    $("#<%=txtUnit.ClientID%>").val('');
                    $("#<%=txtError.ClientID%>").show();
                }
                else {
                    $("#<%=lblHours.ClientID%>").text(arrayResult[0]);
                    $("#<%=txtHours.ClientID%>").val(arrayResult[1]);
                    $("#<%=txtUnit.ClientID%>").val(arrayResult[2]);
                    $("#<%=txtError.ClientID%>").val('');
                    $("#<%=txtError.ClientID%>").hide();
                }
                
            }
            else {
                $("#<%=lblHours.ClientID%>").text('');
                $("#<%=txtHours.ClientID%>").val('');
                $("#<%=txtUnit.ClientID%>").val('');
                $("#<%=txtError.ClientID%>").val(result);
                $("#<%=txtError.ClientID%>").show();
            }
        }
    }

    function CheckExcludeHours(source, args) {
        var totalHours = 0;
        $("#<%=cblExcludeHours.ClientID%> input:checked").map(function () {
            return totalHours += parseInt($(this).val().split('|')[1], 10);
        });
        if (totalHours === 0) {
            args.IsValid = false;
            return;
        }
    }

    function CalExcludeHours_<%=ClientID%>()
    {
        var totalHours = 0;
        $("#<%=cblExcludeHours.ClientID%> input:checked").map(function() {
            return totalHours += parseInt($(this).val().split('|')[1], 10);
        });

        return totalHours;
    }

    function ValidateHours_<%=ClientID%>(source, arguments) {
        //沒有公司統編或員編就不跑其他驗證
        var applicantEmployeeNo = $("#<%=hfApplicantEmployeeNo.ClientID%>").val();
        var applicantCompanyUnifiedId = $("#<%=hfApplicantCompanyUnifiedId.ClientID%>").val();

        if (applicantEmployeeNo === '' || applicantCompanyUnifiedId === '') {
            return;
        }

        var error = $("#<%=txtError.ClientID%>").val();
        var hoursAdv = $("#<%=txtHoursAdv.ClientID%>").val();    
        var hours = $("#<%=txtHours.ClientID%>").val();

        if(error === '' && (hours==='' || hoursAdv===''))
        {
            arguments.IsValid = false;
            return;
        }
    }

    function ValidateApply_<%=ClientID%>(source, arguments) {
        var startDate = $find("<%=rdStartDate.ClientID%>").get_dateInput().get_value();
        var endDate = $find("<%=rdEndDate.ClientID%>").get_dateInput().get_value();
        var startTime = $find("<%=rdStartTime.ClientID%>").get_dateInput().get_value();
        var endTime = $find("<%=rdEndTime.ClientID%>").get_dateInput().get_value();
        var deductibleHours = CalExcludeHours_<%=ClientID%>();
        var applicantEmployeeNo = $("#<%=hfApplicantEmployeeNo.ClientID%>").val();
        var applicantCompanyUnifiedId = $("#<%=hfApplicantCompanyUnifiedId.ClientID%>").val();
        var punchCheck = $("#<%= rblPunchCheck.ClientID %> input:checked").val();
        var overTimeType = $("#<%= rblOverTimeType.ClientID %> input:checked").val();
        var reason = $("#<%=txtRemark.ClientID %>").val();
        var mealAllowanceType = $("#<%= rblMealAllowance.ClientID %> input:checked").val();

        var tmpfieldMode = $("#<%=hfFieldMode.ClientID%>").val();
        var needApplyAdv = $("#<%=hfNeedApplyAdv.ClientID%>").val();

        // 申請時須檢查預計加班時間範圍
        if (needApplyAdv == "true" && tmpfieldMode == "Applicant") {

            // 預計加班時間範圍不可晚於申請時間
            var nowDateTimeFromDb = $uof.pageMethod.syncUc("EIP/Duty/WKFOptionalFields104/OverTimeInfoAdvUC.ascx", "GetNowDateTimeFromDb", "");
            var beginStartTime = new Date(nowDateTimeFromDb);
            var startDateAdv = $find("<%=rdStartDateAdv.ClientID%>").get_dateInput().get_value();
            var endDateAdv = $find("<%=rdEndDateAdv.ClientID%>").get_dateInput().get_value();
            var startTimeAdv = $find("<%=rdStartTimeAdv.ClientID%>").get_dateInput().get_value();
            var endTimeAdv = $find("<%=rdEndTimeAdv.ClientID%>").get_dateInput().get_value();
            var tmpStartTimeAdv = new Date(startDateAdv + ' ' + startTimeAdv);
            var tmpEndTimeAdv = new Date(endDateAdv + ' ' + endTimeAdv);

            if (beginStartTime > tmpStartTimeAdv || beginStartTime > tmpEndTimeAdv) {
                $("#<%=txtError.ClientID%>").val($("#<%=lblInvalidRangeTimeAdv.ClientID%>").text());
                $("#<%=txtError.ClientID%>").show();
                arguments.IsValid = false;
                return;
            }
        }

        //沒有公司統編或員編就不跑其他驗證
        var applicantEmployeeNo = $("#<%=hfApplicantEmployeeNo.ClientID%>").val();
        var applicantCompanyUnifiedId = $("#<%=hfApplicantCompanyUnifiedId.ClientID%>").val();

        if (applicantEmployeeNo === '' || applicantCompanyUnifiedId === '') {
            return;
        }

        var hours = $("#<%=txtHours.ClientID%>").val();
        if (hours === '') {
            arguments.IsValid = false;
            return;
        }

        var data = [$("#<%=hfFormNumber.ClientID%>").val()];
        if ($("#<%=hfFieldMode.ClientID%>").val() == "ReturnApplicant" || $("#<%=hfFieldMode.ClientID%>").val() === "Signin")
        {
            $uof.pageMethod.syncUc("EIP/Duty/WKFOptionalFields104/OverTimeInfoAdvUC.ascx", "UpdateStatus", data);
        }

        data = [applicantCompanyUnifiedId, applicantEmployeeNo, startDate, startTime, endDate, endTime, overTimeType, reason, mealAllowanceType, deductibleHours, punchCheck, hours];
        var result = $uof.pageMethod.syncUc("EIP/Duty/WKFOptionalFields104/OverTimeInfoAdvUC.ascx", "ValidateApply", data);
        if(result !== '')
        {
            arrayResult = result.split('|');
            if (arrayResult.length > 0) {
                if (arrayResult[0] === arrayResult[1] && arrayResult[1] === arrayResult[2] && arrayResult[2] === arrayResult[0])
                {
                    $("#<%=txtError.ClientID%>").val(arrayResult[0]);
                    $("#<%=txtError.ClientID%>").show();
                    arguments.IsValid = false;
                    return;
                }
            }

            source.textContent = result;
            arguments.IsValid = false;
            return;
        }
    }

    function ValidateMissingInfo_<%=ClientID%>(source, arguments) {
        var applicant = $("#<%=hfApplicant.ClientID%>").val();
        var data = [applicant]
        var result = $uof.pageMethod.syncUc("EIP/Duty/WKFOptionalFields104/OverTimeInfoAdvUC.ascx", "ValidateMissingInfo", data);
        if (result === '') {
            arguments.IsValid = false;
            return;
        }
    }

    function ClearHoursAdv_<%=ClientID%>()
    {
        $("#<%=lblHoursAdv.ClientID%>").text('');
        $("#<%=txtHoursAdv.ClientID%>").val('');
        $("#<%=txtUnitAdv.ClientID%>").val('');
        $("#<%=txtError.ClientID%>").val('');
        $("#<%=txtError.ClientID%>").hide();
    }

    function OnDateSelectedAdv_<%=ClientID%>(sender, eventArgs) {
        ClearHoursAdv_<%=ClientID%>();
        ClearHours_<%=ClientID%>();
    }

    function CheckExcludeHoursAdv(source, args) {
        var totalHoursAdv = 0;
        $('input[type=checkbox][id*=<%=cblExcludeHoursAdv.ClientID%>]:checked').map(function () {
            return totalHoursAdv += parseInt($(this).val().split('|')[1], 10);
        });
        if (totalHoursAdv === 0) {
            args.IsValid = false;
            return;
        }
    }

    function CalBtnClickAdv_<%=ClientID%>(sender, args)
    {
        CalOverTimeHoursAdv_<%=ClientID%>();
    }

    function CalOverTimeHoursAdv_<%=ClientID%>()
    {
        var arrayResult;
        var overTimeTypeAdv = $("#<%= rblOverTimeTypeAdv.ClientID %> input:checked").val();
        var startDateAdv = $find("<%=rdStartDateAdv.ClientID%>").get_dateInput().get_value();
        var endDateAdv = $find("<%=rdEndDateAdv.ClientID%>").get_dateInput().get_value();
        var startTimeAdv = $find("<%=rdStartTimeAdv.ClientID%>").get_dateInput().get_value();
        var endTimeAdv = $find("<%=rdEndTimeAdv.ClientID%>").get_dateInput().get_value();
        var deductibleHoursAdv = CalExcludeHoursAdv_<%=ClientID%>();
        var applicantEmployeeNo = $("#<%=hfApplicantEmployeeNo.ClientID%>").val();
        var applicantCompanyUnifiedId = $("#<%=hfApplicantCompanyUnifiedId.ClientID%>").val();

        // 預計加班時間範圍不可晚於申請時間
        // 申請者或退回申請者有異動資料按計算時, 須檢查預計加班時間範圍
        var tmpfieldMode = $("#<%=hfFieldMode.ClientID%>").val();
        var needApplyAdv = $("#<%=hfNeedApplyAdv.ClientID%>").val();
        if (needApplyAdv == "true" && (tmpfieldMode == "Applicant" || tmpfieldMode == "ReturnApplicant")) {

            // 預計加班時間範圍不可晚於申請時間
            var nowDateTimeFromDb = $uof.pageMethod.syncUc("EIP/Duty/WKFOptionalFields104/OverTimeInfoAdvUC.ascx", "GetNowDateTimeFromDb", "");
            var beginStartTime = new Date(nowDateTimeFromDb);

            if (tmpfieldMode == "ReturnApplicant") {
                beginStartTime = new Date($("#<%=hfTaskBeginTime.ClientID%>").val());
            }

            var startDateAdv = $find("<%=rdStartDateAdv.ClientID%>").get_dateInput().get_value();
            var endDateAdv = $find("<%=rdEndDateAdv.ClientID%>").get_dateInput().get_value();
            var startTimeAdv = $find("<%=rdStartTimeAdv.ClientID%>").get_dateInput().get_value();
            var endTimeAdv = $find("<%=rdEndTimeAdv.ClientID%>").get_dateInput().get_value();
            var tmpStartTimeAdv = new Date(startDateAdv + ' ' + startTimeAdv);
            var tmpEndTimeAdv = new Date(endDateAdv + ' ' + endTimeAdv);

            if (beginStartTime > tmpStartTimeAdv || beginStartTime > tmpEndTimeAdv) {
                $("#<%=txtError.ClientID%>").val($("#<%=lblInvalidRangeTimeAdv.ClientID%>").text());
                $("#<%=txtError.ClientID%>").show();
                return;
            }
        }

        // 退回申請者按計算時, 必須重設定預計加班資訊同步到實際加班資訊
        var tmpfieldMode = $("#<%=hfFieldMode.ClientID%>").val();
        if (tmpfieldMode == "ReturnApplicant") {
            var overTimeType = $("#<%= rblOverTimeType.ClientID %> input:checked").val();
            var startDate = $find("<%=rdStartDate.ClientID%>").get_dateInput().get_value();
            var endDate = $find("<%=rdEndDate.ClientID%>").get_dateInput().get_value();
            var startTime = $find("<%=rdStartTime.ClientID%>").get_dateInput().get_value();
            var endTime = $find("<%=rdEndTime.ClientID%>").get_dateInput().get_value();
            var deductibleHours = CalExcludeHours_<%=ClientID%>();
            if (overTimeTypeAdv != overTimeType || startDateAdv != startDate || endDateAdv != endDate || startTimeAdv != startTime ||
                endTimeAdv != endTime || deductibleHoursAdv != deductibleHours) {
                $("#<%=txtError.ClientID%>").val($("#<%=lblNeedResetInfo.ClientID%>").text());
                $("#<%=txtError.ClientID%>").show();
                return;
            }
        }

        //沒有公司統編或員編就不跑其他驗證
        var applicantEmployeeNo = $("#<%=hfApplicantEmployeeNo.ClientID%>").val();
        var applicantCompanyUnifiedId = $("#<%=hfApplicantCompanyUnifiedId.ClientID%>").val();

         if (applicantEmployeeNo === '' || applicantCompanyUnifiedId === '') {
             return;
         }
      
        var data = [applicantCompanyUnifiedId, applicantEmployeeNo, startDateAdv, startTimeAdv, endDateAdv, endTimeAdv, deductibleHoursAdv];
        var result = $uof.pageMethod.syncUc("EIP/Duty/WKFOptionalFields104/OverTimeInfoAdvUC.ascx", "CalHours", data);

        if (result !== "") {
            arrayResult = result.split('|');
            if (arrayResult.length > 0) {
                if (arrayResult[0] === arrayResult[1] && arrayResult[1] === arrayResult[2] && arrayResult[2] === arrayResult[0])
                {
                    if (arrayResult[0] === "HRError") {
                        $("#<%=txtError.ClientID%>").val($("#<%=lblNotFoundSP.ClientID%>").text());
                    } else {
                        $("#<%=txtError.ClientID%>").val(arrayResult[0]);                    
                    }
                    $("#<%=lblHoursAdv.ClientID%>").text('');
                    $("#<%=txtHoursAdv.ClientID%>").val('');
                    $("#<%=txtUnitAdv.ClientID%>").val('');
                    $("#<%=lblHours.ClientID%>").text('');
                    $("#<%=txtHours.ClientID%>").val('');
                    $("#<%=txtUnit.ClientID%>").val('');
                    $("#<%=txtError.ClientID%>").show();
                }
                else {
                    $("#<%=lblHoursAdv.ClientID%>").text(arrayResult[0]);
                    $("#<%=txtHoursAdv.ClientID%>").val(arrayResult[1]);
                    $("#<%=txtUnitAdv.ClientID%>").val(arrayResult[2]);
                    $("#<%=lblHours.ClientID%>").text(arrayResult[0]);
                    $("#<%=txtHours.ClientID%>").val(arrayResult[1]);
                    $("#<%=txtUnit.ClientID%>").val(arrayResult[2]);
                    $("#<%=txtError.ClientID%>").val('');
                    $("#<%=txtError.ClientID%>").hide();
                }
                
            }
            else {
                $("#<%=lblHoursAdv.ClientID%>").text('');
                $("#<%=txtHoursAdv.ClientID%>").val('');
                $("#<%=txtUnitAdv.ClientID%>").val('');
                $("#<%=lblHours.ClientID%>").text('');
                $("#<%=txtHours.ClientID%>").val('');
                $("#<%=txtUnit.ClientID%>").val('');
                $("#<%=txtError.ClientID%>").val(result);
                $("#<%=txtError.ClientID%>").show();
            }
        }
    }

    function CalExcludeHoursAdv_<%=ClientID%>()
    {
        var totalHoursAdv = 0;
        $("#<%=cblExcludeHoursAdv.ClientID%> input:checked").map(function() {
            return totalHoursAdv += parseInt($(this).val().split('|')[1], 10);
        });

        return totalHoursAdv;
    }

    function cvDateRangeValid_<%=ClientID%>(source, args) {
        var startDateAdv = $find("<%=rdStartDateAdv.ClientID%>").get_dateInput().get_value();
        var startTimeAdv = $find("<%=rdStartTimeAdv.ClientID%>").get_dateInput().get_value();
        var endDateAdv = $find("<%=rdEndDateAdv.ClientID%>").get_dateInput().get_value();
        var endTimeAdv = $find("<%=rdEndTimeAdv.ClientID%>").get_dateInput().get_value();
        var startDate = $find("<%=rdStartDate.ClientID%>").get_dateInput().get_value();
        var startTime = $find("<%=rdStartTime.ClientID%>").get_dateInput().get_value();
        var endDate = $find("<%=rdEndDate.ClientID%>").get_dateInput().get_value();
        var endTime = $find("<%=rdEndTime.ClientID%>").get_dateInput().get_value();

        //驗證實際加班起訖要在預計加班範圍內
        var timeValidData = [startDateAdv, startTimeAdv, endDateAdv, endTimeAdv, startDate, startTime, endDate, endTime]; 
        var result = $uof.pageMethod.syncUc("EIP/Duty/WKFOptionalFields104/OverTimeInfoAdvUC.ascx", "ValidateTimeRange", timeValidData);
        if (result !== '') {
            args.IsValid = false;
            return;
        }
    }

    function CopyRemark(sender) {
        //20210225 tony:mobile上可以直接JQuery給值成功 就不走後端了
        var downRemark = $("#<%=txtRemark.ClientID%>");

        downRemark.val(sender.value);
        downRemark.text(sender.value);
    }

    function CheckRemarkEmpty(sender, args) {
        var remark = $("#<%=txtRemark.ClientID%>");
        if (remark && remark.val().trim() == '') {
            args.IsValid = false;
        }
        else {
            args.IsValid = true;
        }
    }
</script>
<asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>
<asp:Label ID="lblOverTimeInfoAdvTitle" runat="server" Text="預計加班資訊" style="font-weight:bold;text-decoration:underline;" meta:resourcekey="lblOverTimeInfoAdvTitleResource1"></asp:Label>        
        <table class="OvertimeTable104" style="width: 100%">
            <tr>
                <td style="white-space: nowrap">
                    <asp:Label ID="Label18" runat="server" Text="加班折換方式" meta:resourcekey="Label5Resource1"></asp:Label>
                </td>
            </tr>
            <tr>
                <td id="td1" runat="server" colspan="3">
                    <asp:RadioButtonList ID="rblOverTimeTypeAdv" runat="server" AutoPostBack="True" OnSelectedIndexChanged="rblOverTimeTypeAdv_SelectedIndexChanged" meta:resourcekey="rblAdvOverTimeTypeResource1">
                        <asp:ListItem Text="轉加班費" Value="Payment" meta:resourcekey="ListItemResource1" ></asp:ListItem>
                        <asp:ListItem Text="轉補休" Value="TimeOff" meta:resourcekey="ListItemResource2"></asp:ListItem>
                    </asp:RadioButtonList>
                    <asp:Label ID="lblOverTimeTypeAdv" runat="server" Visible="False" meta:resourcekey="lblOverTimeTypeAdvResource1"></asp:Label>
                </td>
            </tr>
            <tr>
                <td style="white-space: nowrap">
                    <asp:Label ID="lblOverTimeStartAdvTitle" runat="server" Text="加班時間(起)" meta:resourcekey="Label1Resource1"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <table>
                        <tr>
                            <td>
                                <telerik:RadDatePicker ID="rdStartDateAdv" runat="server" AutoPostBack="True" EnableTheming="True" OnSelectedDateChanged="rdStartDateAdv_SelectedDateChanged" meta:resourcekey="rdStartDateResource1">
                                </telerik:RadDatePicker>
                            </td>
                            <td>
                                <asp:Label ID="lblStartDateAdv" runat="server" Visible="False" meta:resourcekey="lblStartDateResource1"></asp:Label>
                                <telerik:RadTimePicker ID="rdStartTimeAdv" runat="server" AutoPostBack="True" EnableTheming="True" OnSelectedDateChanged="rdStartDateTimeAdv_SelectedDateChanged" meta:resourcekey="rdStartTimeResource1">
                                </telerik:RadTimePicker>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td style="white-space: nowrap">
                    <asp:Label ID="lblOverTimeEndAdvTitle" runat="server" Text="加班時間(訖)" meta:resourcekey="Label2Resource1"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <table>
                        <tr>
                            <td>
                                <telerik:RadDatePicker ID="rdEndDateAdv" runat="server" AutoPostBack="True" EnableTheming="True" OnSelectedDateChanged="rdStartDateTimeAdv_SelectedDateChanged" meta:resourcekey="rdEndDateResource1">
                                </telerik:RadDatePicker>
                            </td>
                            <td>
                                <asp:Label ID="lblEndDateAdv" runat="server" Visible="False" meta:resourcekey="lblEndDateResource1"></asp:Label>
                                <telerik:RadTimePicker ID="rdEndTimeAdv" runat="server" AutoPostBack="True" EnableTheming="True" OnSelectedDateChanged="rdStartDateTimeAdv_SelectedDateChanged" meta:resourcekey="rdEndTimeResource1">
                                </telerik:RadTimePicker>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td id="tdlblExcludeHoursAdv" style="white-space: nowrap" runat="server">
                    <asp:Label ID="Label30" runat="server" Text="扣除時數" meta:resourcekey="Label4Resource1"></asp:Label>
                </td>
            </tr>
            <tr>
                <td id="tdExcludeHoursAdv" runat="server">
                    <asp:CheckBoxList ID="cblExcludeHoursAdv" runat="server" AutoPostBack="true" OnSelectedIndexChanged="cblExcludeHoursAdv_SelectedIndexChanged" meta:resourcekey="cblExcludeHoursResource1">
                        <asp:ListItem Text="午餐" Value="Lunch|1" meta:resourcekey="ListItemResource5" ></asp:ListItem>
                        <asp:ListItem Text="晚餐" Value="Dinner|2" meta:resourcekey="ListItemResource6" ></asp:ListItem>
                        <asp:ListItem Text="宵夜" Value="Supper|4" meta:resourcekey="ListItemResource7" ></asp:ListItem>
                        <asp:ListItem Text="其他" Value="Other|8" meta:resourcekey="ListItemResource8" ></asp:ListItem>
                    </asp:CheckBoxList>
                    <asp:Label ID="lblExcludeHoursAdv" runat="server" Visible="False" meta:resourcekey="lblExcludeHoursResource1"></asp:Label>
                    <asp:CustomValidator ID="cvCheckExcludeHoursAdv" runat="server" Display="Dynamic" ClientValidationFunction="CheckExcludeHoursAdv" ErrorMessage="請選擇扣除時數" ForeColor="Red" meta:resourcekey="cvCheckExcludeHoursResource1"></asp:CustomValidator>
                </td>
            </tr>
            <tr>
                <td style="white-space: nowrap">
                    <asp:Label ID="Label36" runat="server" Text="加班時數" meta:resourcekey="Label3Resource1"></asp:Label>
                </td>
            </tr>
            <tr>
                <td colspan="3">
                    <asp:Label ID="lblHoursAdv" runat="server" meta:resourcekey="lblHoursResource1"></asp:Label>
                    <asp:TextBox ID="txtHoursAdv" runat="server" Style="display: none" meta:resourcekey="txtHoursResource1"></asp:TextBox>
                    <asp:TextBox ID="txtUnitAdv" runat="server" Style="display: none" meta:resourcekey="txtUnitResource1"></asp:TextBox>
                    <telerik:RadButton ID="rbtnCalAdv" runat="server" CausesValidation="False" Text="計算" AutoPostBack="False" meta:resourcekey="rbtnCalResource1">
                    </telerik:RadButton>
                </td>
            </tr>
            <tr>
                <td style="white-space: nowrap">
                    <asp:Label ID="Label38" runat="server" Text="事由" meta:resourcekey="Label7Resource1"></asp:Label>
                    <asp:Label ID="lblRemarkAdvRequired" runat="server" Text="*" ForeColor="Red" Visible="false"></asp:Label>
                </td>
            </tr>
            <tr>
                <td colspan="3">
                    <asp:Label ID="lblRemarkAdv" runat="server" Visible="False" CssClass="labelMutiline"  meta:resourcekey="lblRemarkResource1"></asp:Label>
                    <telerik:RadTextBox ID="txtRemarkAdv2" runat="server" Width="100%" OnTextChanged="txtRemarkAdv2_TextChanged" TextMode="MultiLine"
                        Rows="3" AutoPostBack="true" meta:resourcekey="txtRemarkResource1"></telerik:RadTextBox>
                    <asp:RequiredFieldValidator ID="cvRemarkAdv" Display="Dynamic" ForeColor="Red" runat="server"
                        ErrorMessage="不可空白" ControlToValidate="txtRemarkAdv2" Visible="false" meta:resourcekey="cvRemarkAdvResource1"></asp:RequiredFieldValidator>
                </td>
            </tr>
        </table>
        <br />

        <asp:Label ID="lblOverTimeInfoTitle" runat="server" Text="實際加班資訊" style="font-weight:bold;text-decoration:underline;" meta:resourcekey="lblOverTimeInfoTitleResource1"></asp:Label>        
        <table class="OvertimeTable104" style="width: 100%">
            <tr>
                <td style="white-space: nowrap">
                    <asp:Label ID="Label5" runat="server" Text="加班折換方式" meta:resourcekey="Label5Resource1"></asp:Label>
                </td>
            </tr>
            <tr>
                <td id="tdOverTimeType" runat="server">
                    <asp:RadioButtonList ID="rblOverTimeType" runat="server" AutoPostBack="True" OnSelectedIndexChanged="rblOverTimeType_SelectedIndexChanged" meta:resourcekey="rblOverTimeTypeResource1">
                        <asp:ListItem Text="轉加班費" Value="Payment" meta:resourcekey="ListItemResource1" ></asp:ListItem>
                        <asp:ListItem Text="轉補休" Value="TimeOff" meta:resourcekey="ListItemResource2"></asp:ListItem>
                    </asp:RadioButtonList>
                    <asp:Label ID="lblOverTimeType" runat="server" Visible="False" meta:resourcekey="lblOverTimeTypeResource1"></asp:Label>
                </td>
            </tr>
            <tr style="white-space: nowrap">
                <td id="tdlblMealAllowance" runat="server">
                    <asp:Label ID="Label6" runat="server" Text="支領誤餐費" meta:resourcekey="Label6Resource1"></asp:Label>
                </td>
            </tr>
            <tr>
                <td id="tdMealAllowance" runat="server">
                    <asp:RadioButtonList ID="rblMealAllowance" runat="server" meta:resourcekey="rblMealAllowanceResource1">
                        <asp:ListItem Text="依HR系統誤餐費設定" Value="Yes" meta:resourcekey="ListItemResource3" ></asp:ListItem>
                        <asp:ListItem Text="不支領" Value="No" meta:resourcekey="ListItemResource4"></asp:ListItem>
                    </asp:RadioButtonList>
                    <asp:Label ID="lblMealAllowance" runat="server" Visible="False" meta:resourcekey="lblMealAllowanceResource1"></asp:Label>
                </td>
            </tr>
            <tr>
                <td style="white-space: nowrap">
                    <asp:Label ID="Label1" runat="server" Text="加班時間(起)" meta:resourcekey="Label1Resource1"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <table>
                        <tr>
                            <td>
                                <telerik:RadDatePicker ID="rdStartDate" runat="server" AutoPostBack="True" EnableTheming="True" OnSelectedDateChanged="rdStartDate_SelectedDateChanged" meta:resourcekey="rdStartDateResource1">
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
                    <asp:Label ID="Label2" runat="server" Text="加班時間(訖)" meta:resourcekey="Label2Resource1"></asp:Label>
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
            <tr style="white-space: nowrap">
                <td id="tdlblExcludeHours" runat="server">
                    <asp:Label ID="Label4" runat="server" Text="扣除時數" meta:resourcekey="Label4Resource1"></asp:Label>
                </td>
            </tr>
            <tr>
                <td id="tdExcludeHours"  runat="server">
                    <asp:CheckBoxList ID="cblExcludeHours" runat="server" meta:resourcekey="cblExcludeHoursResource1">
                        <asp:ListItem Text="午餐" Value="Lunch|1" meta:resourcekey="ListItemResource5" ></asp:ListItem>
                        <asp:ListItem Text="晚餐" Value="Dinner|2" meta:resourcekey="ListItemResource6" ></asp:ListItem>
                        <asp:ListItem Text="宵夜" Value="Supper|4" meta:resourcekey="ListItemResource7" ></asp:ListItem>
                        <asp:ListItem Text="其他" Value="Other|8" meta:resourcekey="ListItemResource8" ></asp:ListItem>
                    </asp:CheckBoxList>
                    <asp:Label ID="lblExcludeHours" runat="server" Visible="False" meta:resourcekey="lblExcludeHoursResource1"></asp:Label>
                    <asp:CustomValidator ID="cvCheckExcludeHours" runat="server" Display="Dynamic" ClientValidationFunction="CheckExcludeHours" ErrorMessage="請選擇扣除時數" ForeColor="Red" meta:resourcekey="cvCheckExcludeHoursResource1"></asp:CustomValidator>
                </td>
            </tr>
            <tr style="white-space: nowrap;">
                <td id="tdlblPunchCheck" runat="server">
                    <asp:Label ID="Label14" runat="server" Text="檢查刷卡資料" meta:resourcekey="Label14Resource1"></asp:Label>
                </td>
            </tr>
            <tr>
                <td id="tdPunchCheck" runat="server">
                    <asp:Label ID="lblPunchCheck" runat="server" Visible="False" meta:resourcekey="lblPunchCheckResource1"></asp:Label>
                    <asp:RadioButtonList ID="rblPunchCheck" runat="server" meta:resourcekey="rblPunchCheckResource1">
                        <asp:ListItem Text="依HR系統加班刷卡核對設定" Value="Yes" meta:resourcekey="ListItemResource9"></asp:ListItem>
                        <asp:ListItem Text="不需檢查" Value="No" meta:resourcekey="ListItemResource10" ></asp:ListItem>
                    </asp:RadioButtonList>
                </td>
            </tr>
            <tr>
                <td style="white-space: nowrap">
                    <asp:Label ID="Label3" runat="server" Text="加班時數" meta:resourcekey="Label3Resource1"></asp:Label>
                </td>
            </tr>
            <tr>
                <td colspan="3">
                    <asp:Label ID="lblHours" runat="server" meta:resourcekey="lblHoursResource1"></asp:Label>
                    <asp:TextBox ID="txtHours" runat="server" Style="display: none" meta:resourcekey="txtHoursResource1"></asp:TextBox>
                    <asp:TextBox ID="txtUnit" runat="server" Style="display: none" meta:resourcekey="txtUnitResource1"></asp:TextBox>
                    <telerik:RadButton ID="rbtnCal" runat="server" CausesValidation="False" Text="計算" AutoPostBack="False" meta:resourcekey="rbtnCalResource1">
                    </telerik:RadButton>
                </td>
            </tr>
            <tr>
                <td style="white-space: nowrap">
                    <asp:Label ID="Label7" runat="server" Text="事由" meta:resourcekey="Label7Resource1"></asp:Label>
                    <asp:Label ID="lblRemarkRequired" runat="server" Text="*" ForeColor="Red" Visible="false"></asp:Label>
                </td>
            </tr>
            <tr>
                <td colspan="3">
                    <asp:Label ID="lblRemark" runat="server" Visible="False" CssClass="labelMutiline" meta:resourcekey="lblRemarkResource1"></asp:Label>
                    <asp:TextBox ID="txtRemark" runat="server" Width="100%" TextMode="MultiLine" Rows="3" meta:resourcekey="txtRemarkResource1"></asp:TextBox>
                    <asp:CustomValidator runat="server" ID="cvRemark" Display="Dynamic" ForeColor="Red" ErrorMessage="不可空白" ClientValidationFunction="CheckRemarkEmpty" Visible="false" meta:resourcekey="cvRemarkResource1"></asp:CustomValidator>
                </td>
            </tr>

        </table>
        <table>
            <tr>
                <td>
                    <asp:Label runat="server" ID="lblReturnApplicantMemo" Text="因表單被退回申請者站點，已將加班資訊恢復為申請時所填內容，請檢視加班資訊後再送出。" CssClass="SizeMemo" Visible="false" meta:resourcekey="lblReturnApplicantMemoResource1"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:CustomValidator ID="cvMissingInfo" runat="server" ErrorMessage="申請者無員工編號或公司統一編號資訊" Display="Dynamic" EnableTheming="True" meta:resourcekey="cvMissingInfoResource1"></asp:CustomValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:CustomValidator ID="cvCal" runat="server" ErrorMessage="請先計算加班時數" Display="Dynamic" EnableTheming="True" meta:resourcekey="cvCalResource1"></asp:CustomValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:CustomValidator ID="cvDateRange" runat="server" Display="Dynamic" EnableTheming="True" ErrorMessage="實際加班時段需在預計加班時間範圍內" ForeColor="Red" meta:resourcekey="cvDateRangeResource1"></asp:CustomValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:TextBox ID="txtError" runat="server" Style="display: none; width: 300px; border-width: 0;" ForeColor="Red" ReadOnly="True" meta:resourcekey="txtErrorResource1"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:CustomValidator ID="cvApply" runat="server" Display="Dynamic" EnableTheming="True" meta:resourcekey="cvApplyResource1"></asp:CustomValidator>
                </td>
            </tr>
        </table>

        <asp:HiddenField ID="hfOverTimeRangeInAdvRange" runat="server" />
        <asp:HiddenField ID="hfShowPunchCheck" runat="server" />
        <asp:HiddenField ID="hfRemarkRequired" runat="server" />
        <asp:HiddenField ID="hfNeedApplyAdv" runat="server" />
        <asp:HiddenField ID="hfAfterApplyerSign" runat="server" />
    </ContentTemplate>
</asp:UpdatePanel>

<asp:Label ID="lblHasNoAuthority" runat="server" Text="無填寫權限" ForeColor="Red" Visible="False" meta:resourcekey="lblHasNoAuthorityResource1"></asp:Label>
<asp:Label ID="lblToolTipMsg" runat="server" Text="不允許修改(唯讀)" Visible="False" meta:resourcekey="lblToolTipMsgResource1"></asp:Label>
<asp:Label ID="lblFiller" CssClass="FillerVisible" runat="server" meta:resourcekey="lblFillerResource1"></asp:Label>
<asp:Label ID="lblModifier" runat="server" Visible="False" meta:resourcekey="lblModifierResource1"></asp:Label>
<asp:Label ID="lblMsgSigner" runat="server" Text="填寫者" Visible="False" meta:resourcekey="lblMsgSignerResource1"></asp:Label>
<asp:Label ID="lblMsgEditor" runat="server" Text="修改者" Visible="False" meta:resourcekey="lblMsgEditorResource1"></asp:Label>
<asp:Label ID="lblAuthorityMsg" runat="server" Text="具填寫權限人員" Visible="False" meta:resourcekey="lblAuthorityMsgResource1"></asp:Label>
<asp:Label ID="lblNotFoundSP" runat="server" Text="計算時發生問題，請回報系統管理員。" style="display: none;" meta:resourcekey="lblNotFoundSPResource1" ></asp:Label>
<asp:Label ID="lblNeedResetInfo" runat="server" Text="加班資訊不一致，請重新調整預計加班資訊。" style="display: none;" meta:resourcekey="lblNeedResetInfoResource1" ></asp:Label>
<asp:Label ID="lblInvalidRangeTimeAdv" runat="server" Text="預計加班時間範圍需晚於申請時間" style="display: none;" meta:resourcekey="lblInvalidRangeTimeAdvResource1" ></asp:Label>
<asp:HiddenField ID="hfApplicantEmployeeNo" runat="server" />
<asp:HiddenField ID="hfApplicantCompanyUnifiedId" runat="server" />
<asp:HiddenField ID="hfApplicant" runat="server" />
<asp:HiddenField ID="hfFieldMode" runat="server" />
<asp:HiddenField ID="hfFormNumber" runat="server" />
<asp:HiddenField ID="hfOverTimeType" runat="server" />
<asp:HiddenField ID="hfCheckPunch" runat="server" />
<asp:HiddenField ID="hfTaskBeginTime" runat="server" />