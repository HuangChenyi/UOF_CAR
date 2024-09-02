<%@ Control Language="C#" AutoEventWireup="true" Inherits="WKFOptionalFields_OverTimeInfoUC" Codebehind="OverTimeInfoUC.ascx.cs" %>
<%@ Reference Control="~/WKF/FormManagement/VersionFieldUserControl/VersionFieldUC.ascx" %>
<%@ Register src="../../../Common/ChoiceCenter/UC_ChoiceList.ascx" tagname="UC_ChoiceList" tagprefix="uc1" %>
<%@ Register Src="~/Common/ChoiceCenter/UC_ChoiceListMobile.ascx" TagPrefix="uc1" TagName="UC_ChoiceListMobile" %>


<script type="text/javascript">
    Sys.Application.add_load(function () {
        var timeZoneEnable = $("#<%=hfTimeZoneEnable.ClientID%>").val();
        if (timeZoneEnable === "true") {
            $(".trTimeZone").show();
        }
        else {
            $(".trTimeZone").hide();
        }

        $("#<%=rblOvertimeType.ClientID%> input[type='radio']").on("click", function () {
            var selectedValue = $(this).val();
            if (selectedValue == 1)
                $(".trTimeZone").hide();
            else
                $(".trTimeZone").show();
        });
    });

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

        for (i = 0; i < rblExpEatHour[0].rows[0].cells.length; i++) {
            if (rblExpEatHour[0].rows[0].cells[i].childNodes[0].checked == true)
                rblActEatHour[0].rows[0].cells[i].childNodes[0].checked = true;
        }
      
        var expHours = $('#<%= lblExpHours.ClientID%>');
        var actHours = $('#<%= lblActHours.ClientID%>');

        if (expHours != null) {
            expHours.html("0");
        }

        if (actHours != null) {
            actHours.html("0");
        }
    }

    function onActValueChanged() {
        var actHours = $('#<%= lblActHours.ClientID%>');

        if (actHours != null) {
            actHours.html("0");
        }
    }

    function CheckOverTimeUsers(e, args) {
        var ovtType = $("input[id^='<% =rblOvertimeType.ClientID %>']:checked").val();
        if (ovtType == "1") {
            if ($('#<%= hfPreViewTimeTableUsers.ClientID  %>').val() === "") {
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
            var sValue = $uof.pageMethod.syncUc("EIP/Duty/WKFOptionalFields/OverTimeInfoUC.ascx", "CheckHours", data);
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
        if (ovtType == "1") {
            var users = $('#<%= hfPreViewTimeTableUsers.ClientID  %>').val();
            if (users === "")
            {
                args.IsValid = true;
                return;
            }

            var checkData = [users];
            var checkResult = $uof.pageMethod.syncUc("EIP/Duty/WKFOptionalFields/OverTimeInfoUC.ascx", "CheckSameOffice", checkData);
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
        var overtimeHour = $('#<%= lblActHours.ClientID  %>').text();

        if (startDate == null || endDate == null) return;

        var startDateTime = startDate + " " + startTime;
        var endDateTime = endDate + " " + endTime;

        var eatHour;
        eatHour = rblEatHour;


        var data = [startDateTime, endDateTime, eatHour];
        var sValue = $uof.pageMethod.syncUc("EIP/Duty/WKFOptionalFields/OverTimeInfoUC.ascx", "CheckHours", data);
        if (overtimeHour !== null && overtimeHour > sValue) {
            args.IsValid = false;
        }
        else {
            args.IsValid = true;
        }
    }

    function CheckActOvertimeHour(e, args) {

        var wnumActHours = $('#<%= lblActHours.ClientID  %>').text();
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
        var belnogDate = $find('<%= rddlBelongDate.ClientID %>');
        var users = $('#<%= hfPreViewTimeTableUsers.ClientID  %>').val();
        var type;
        if (ovtType === "1") {
            var data = [belnogDate.get_selectedItem().get_value(), users];
            var sValue = $uof.pageMethod.syncUc("EIP/Duty/WKFOptionalFields/OverTimeInfoUC.ascx", "CheckUsersSett", data);
            if (sValue == "true") {

                $("#<%=lbtnErrorInfo.ClientID%>").css("display", "");
                args.IsValid = false;
            }
        }
    }

    function CheckIsClose(e, args) {        
        var belnogDate = $find('<%= rddlBelongDate.ClientID %>');
        var users = $('#<%= hfPreViewTimeTableUsers.ClientID  %>').val();
        var ovtType = $("input[id^='<% =rblOvertimeType.ClientID %>']:checked").val();
        var type;

        if (ovtType === "0") {
            type = "0";
        }
        else {
            type = "1";
        }
        
        if (belnogDate != null) {
            var data = [belnogDate.get_selectedItem().get_value(), "<%=m_Applicant%>", users, type];
            var sBool = $uof.pageMethod.syncUc("EIP/Duty/WKFOptionalFields/OverTimeInfoUC.ascx", "CheckIsClose", data);
            if (sBool == "false") {
                args.IsValid = false;
            }
        }
    }

    function CheckTimeTable(e, args) {
        var users = $('#<%= hfPreViewTimeTableUsers.ClientID  %>').val();
        var ovtType = $("input[id^='<% =rblOvertimeType.ClientID %>']:checked").val();
        var belongDate = $find('<%= rddlBelongDate.ClientID %>').get_selectedItem().get_value();

        if (users === "") {
            return;
        }
        
        if (ovtType == "1") {
            var data = [users, belongDate];
            var sBool = $uof.pageMethod.syncUc("EIP/Duty/WKFOptionalFields/OverTimeInfoUC.ascx", "CheckTimeTable", data);
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

        var data = ["<%=m_Applicant%>", taskID, $('#<%= hfPreViewTimeTableUsers.ClientID  %>').val(), type, startDateTime, endDateTime];
        var sValue = $uof.pageMethod.syncUc("EIP/Duty/WKFOptionalFields/OverTimeInfoUC.ascx", "CheckIsRepet", data);
        if (sValue != "" && sValue != null) {
            if (type === "0") {

            }
            else {
                $("#<%=lbtnErrorInfo.ClientID%>").css("display","");
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

        var data = ["<%=m_Applicant%>", taskID, $('#<%= hfPreViewTimeTableUsers.ClientID  %>').val(), type, startDateTime, endDateTime];
        var sValue = $uof.pageMethod.syncUc("EIP/Duty/WKFOptionalFields/OverTimeInfoUC.ascx", "CheckLeaveForm", data);
        if (sValue != "" && sValue != null) {
            if (type === "0") {

            }
            else {
                $("#<%=lbtnErrorInfo.ClientID%>").css("display","");
            }
            args.IsValid = false;
        }
    }   

    function OpenDialog(sender) {
        var taskId = "<%=m_TaskID%>";
        var startDate = $('#<%= hfStartDate.ClientID  %>').val();
        var endDate = $('#<%= hfEndDate.ClientID  %>').val();
        var users = '<%= hfErrorSelectUsers.ClientID  %>';
        var overTimeType = '<%= hfOverTimeType.ClientID  %>';
        var belnogDate = $find('<%= rddlBelongDate.ClientID %>').get_selectedItem().get_value();
        console.log(startDate);
        $uof.dialog.open2("~/EIP/Duty/WKFOptionalFields/ErrorInfo.aspx", sender, '', 400, 600,
            function () { return false }, { "StartDate": startDate, "Users": users, "BelongDate": belnogDate, "EndDate": endDate, "TaskId": taskId, "OverTimeType": overTimeType });
    }

    function OnValueChanging(sender, args) {
        if (args.get_newValue() == "") {
            args.set_newValue(args.get_oldValue());
        }
    }
    
</script>
<table>
    <tr>
        <td style="white-space:nowrap">
            <asp:LinkButton ID="LinkButton1" runat="server" OnClick="lnk_Edit_Click" Visible="False"
                CausesValidation="False" meta:resourcekey="lnk_EditResource1" Text="[修改]"></asp:LinkButton>
            <asp:LinkButton ID="LinkButton2" runat="server" OnClick="lnk_Cannel_Click" Visible="False"
                CausesValidation="False" meta:resourcekey="lnk_CannelResource1" Text="[取消]"></asp:LinkButton>
            <asp:LinkButton ID="LinkButton3" runat="server" OnClick="lnk_Submit_Click" Visible="False"
                CausesValidation="False" meta:resourcekey="lnk_SubmitResource1" Text="[確定]"></asp:LinkButton>
        </td>
        <td>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <asp:Label ID="lblMoreThanLawHoursMsg" runat="server" Visible="false" ForeColor="Blue" Text="{0}員工每日/每月加班總時數不得超過{1}，此員工{2}累積加班已達{3}(含本次)。" meta:resourcekey="lblMoreThanLawHoursMsgResource1"></asp:Label>
                    <asp:Label ID="lbltempMsg" runat="server" Visible="false" ForeColor="Blue" Text="{0}員工每日/每月加班總時數不得超過{1}，此員工{2}累積加班已達{3}(含本次)。" meta:resourcekey="lblMoreThanLawHoursMsgResource1"></asp:Label>

                    <table class="PopTable" style="width: 800px">
                        <tr class="trTimeZone">
                            <td class="popTableLeftTD" runat="server" style="white-space:nowrap">
                                 <asp:Label ID="Label3" runat="server"  Text="歸屬地點時區" meta:resourcekey="Label3Resource1"></asp:Label>
                            </td>
                            <td class="popTableRightTD" colspan="3" runat="server">
                                <asp:Label ID="lblOfficePlace" runat="server" ></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="popTableLeftTD"  style="white-space:nowrap">
                                <asp:Label ID="Label10" runat="server" meta:resourcekey="Label10Resource1" Text="加班來源"></asp:Label>
                            </td>
                            <td class="popTableRightTD" colspan="3"  style="white-space:nowrap">
                                <table border="1" cellpadding="1" cellspacing="1">
                                    <tr>
                                        <td>
                                            <asp:RadioButtonList ID="rblOvertimeSource" runat="server" AutoPostBack="True" meta:resourcekey="rblOvertimeSourceResource1" onselectedindexchanged="rblOvertimeSource_SelectedIndexChanged" RepeatDirection="Horizontal">
                                                <asp:ListItem meta:resourcekey="ListItemResource1" Selected="True" Text="一般加班" Value="0"></asp:ListItem>
                                                <asp:ListItem meta:resourcekey="ListItemResource2" Text="出差加班" Value="1"></asp:ListItem>
                                            </asp:RadioButtonList>
                                        </td>
                                        <td align="center" style="width: 5px;"></td>
                                        <td>
                                            <asp:Label ID="lblOvertimeSource" runat="server" meta:resourcekey="lblOvertimeSourceResource1" Visible="False"></asp:Label>
                                            <asp:Label ID="Label23" runat="server" Font-Bold="True" ForeColor="Red" Height="19px" meta:resourcekey="Label23Resource1" Text="※加班以單日為主"></asp:Label>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                            
                        </tr>
                        <tr>
                            <td class="popTableLeftTD" style="white-space: nowrap">
                                <asp:Label ID="Label20" runat="server" Text="加班類別"
                                    meta:resourcekey="Label20Resource1"></asp:Label>
                            </td>
                            <td colspan="3">
                                <table style="white-space: nowrap; text-wrap: none;">
                                    <tr>

                                        <td style="white-space: nowrap">
                                            <asp:RadioButtonList ID="rblOvertimeType" runat="server" RepeatDirection="Horizontal"
                                                OnSelectedIndexChanged="rblOvertimeType_SelectedIndexChanged"
                                                AutoPostBack="True" meta:resourcekey="rblOvertimeTypeResource1">
                                                <asp:ListItem Text="個人加班" Value="0" Selected="True"
                                                    meta:resourcekey="ListItemResource3"></asp:ListItem>
                                                <asp:ListItem Text="集體加班" Value="1" meta:resourcekey="ListItemResource4"></asp:ListItem>
                                            </asp:RadioButtonList>
                                            <asp:Label ID="lblOvertimeType" runat="server" Visible="False"
                                                meta:resourcekey="lblOvertimeTypeResource1"></asp:Label>
                                        </td>
                                        <td style="width:30px"></td>
                                        <td style="padding: 0px 3px 0px 3px; white-space: nowrap; text-wrap: none;">
                                            <asp:LinkButton ID="lbtnUserReport" runat="server" Text="出缺勤資訊"
                                                CausesValidation="False" meta:resourcekey="lbtnUserReportResource1"></asp:LinkButton>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <asp:Panel ID="pnlPersons" runat="server" 
                            meta:resourcekey="pnlPersonsResource1">
                            <tr>
                                <td class="popTableLeftTD">
                                    <asp:Label ID="Label21" runat="server" Text="加班人員" 
                                        meta:resourcekey="Label21Resource1"></asp:Label>
                                </td>
                                <td colspan="3" class="popTableRightTD">
                                    <table>
                                        <tr>
                                            <td>
                                                <uc1:UC_ChoiceList ID="UC_ChoiceList1" runat="server" ChioceType="All" ExpandToUser="True" ShowMember="False"/>
                                                <div style="display: none">
                                                    <uc1:UC_ChoiceListMobile runat="server" ID="UC_ChoiceListMobile" />
                                                </div>
                                            </td>
                                            <td style="vertical-align: top; white-space:nowrap;">
                                                <asp:LinkButton ID="lbtnPreviewTimeTable" runat="server" Text="預覽班表" OnClick="lbtnPreviewTimeTable_Click"
                                                    CausesValidation="False" meta:resourcekey="lbtnPreviewTimeTableResource1"></asp:LinkButton>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </asp:Panel>
                        <asp:Panel ID="pnlExp" runat="server" meta:resourcekey="pnlExpResource1">
                            <tr>
                                <td class="popTableLeftTD"  style="white-space:nowrap">
                                    <asp:Label ID="Label2" runat="server" Text="預計加班時間(起)" meta:resourcekey="Label2Resource1"></asp:Label>
                                </td>
                                <td class="popTableRightTD" style="width: 250px">
                                    <table>
                                        <tr>
                                            <td>
                                                <telerik:RadDatePicker ID="rdExpStartDate" runat="server" AutoPostBack="True" OnSelectedDateChanged="rdExpStartDate_SelectedDateChanged" meta:resourcekey="rdExpStartDateResource1">
                                                    <ClientEvents OnDateSelected="onExpValueChanged"/>
                                                </telerik:RadDatePicker>
                                            </td>
                                            <td>                                                
                                                <asp:Label ID="lblExpStartDate" runat="server" Visible="False" meta:resourcekey="lblExpStartDateResource1"></asp:Label>
                                                <telerik:RadTimePicker ID="rdExpStartTime" runat="server">
                                                    <ClientEvents OnDateSelected="onExpValueChanged"/>
                                                </telerik:RadTimePicker>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                                <td class="popTableLeftTD"  style="white-space:nowrap">
                                    <asp:Label ID="Label4" runat="server" meta:resourcekey="Label4Resource1" Text="預計加班時間(訖)"></asp:Label>
                                </td>
                                <td class="popTableRightTD" style="width: 250px">
                                    <table>
                                        <tr>
                                            <td>
                                                <telerik:RadDatePicker ID="rdExpEndDate" runat="server" AutoPostBack="false"  meta:resourcekey="rdExpEndDateResource1">
                                                    <ClientEvents OnDateSelected="onExpValueChanged"/>
                                                </telerik:RadDatePicker>                                              
                                            </td>
                                            <td>
                                                <asp:Label ID="lblExpEndDate" runat="server" Visible="False" meta:resourcekey="lblExpEndDateResource1"></asp:Label>
                                                <telerik:RadTimePicker ID="rdExpEndTime" runat="server">
                                                     <ClientEvents OnDateSelected="onExpValueChanged"/>
                                                </telerik:RadTimePicker>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td class="popTableLeftTD"  style="white-space:nowrap">
                                    <asp:Label ID="Label22" runat="server" Text="預計用餐/休息時數" 
                                        meta:resourcekey="Label22Resource1"></asp:Label>
                                </td>
                                <td class="popTableRightTD" style=" white-space:nowrap;">
                                    <asp:RadioButtonList ID="rblExpEatHours" runat="server" 
                                        RepeatDirection="Horizontal" onClick="onExpValueChanged()" 
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
                                <td class="popTableLeftTD" style="white-space:nowrap;">
                                    <asp:Label ID="Label6" runat="server"  Text="預計加班時數" 
                                        meta:resourcekey="Label6Resource1"></asp:Label>
                                </td>
                                <td class="popTableRightTD">
                                    <asp:Label ID="lblExpHours" runat="server" 
                                        meta:resourcekey="lblExpHoursResource1"></asp:Label>
                                    <asp:Label ID="Label7" runat="server"  Text="時" 
                                        meta:resourcekey="Label7Resource1"></asp:Label>
                                    <telerik:RadButton ID="rdbtnExpCal" OnClick="rdbtnExpCal_Click" CausesValidation="False" runat="server" Text="計算" meta:resourcekey="rdbtnExpCalResource1"></telerik:RadButton>
                                </td>
                            </tr>
                        </asp:Panel>
                        <tr>
                            <td class="popTableLeftTD"  style="white-space:nowrap">
                                <asp:Label ID="Label9" runat="server" Text="實際加班時間(起)" 
                                    meta:resourcekey="Label9Resource1"></asp:Label>
                            </td>
                            <td class="PopTableRightTD">
                                <table>
                                    <tr>
                                        <td>
                                            <telerik:RadDatePicker ID="rdStartDate" runat="server"  AutoPostBack="True" OnSelectedDateChanged="rdStartDate_SelectedDateChanged" meta:resourcekey="rdStartDateResource1">
                                                <Calendar UseColumnHeadersAsSelectors="False" UseRowHeadersAsSelectors="False">
                                                </Calendar>
                                                <DateInput AutoPostBack="True"  LabelWidth="40%" Width="" ClientEvents-OnValueChanging="OnValueChanging">
                                                </DateInput>
                                                <DatePopupButton HoverImageUrl="" ImageUrl="" CssClass="" />
                                                <ClientEvents OnDateSelected="onActValueChanged"/>
                                            </telerik:RadDatePicker>
                                        </td>
                                        <td>
                                            <asp:Label ID="lblActStartDate" runat="server" Visible="False" meta:resourcekey="lblActStartDateResource1"></asp:Label>
                                            <telerik:RadTimePicker ID="rdStartTime" runat="server">
                                                <ClientEvents OnDateSelected="onActValueChanged"/>
                                            </telerik:RadTimePicker>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                            <td class="popTableLeftTD"  style="white-space:nowrap">
                                <asp:Label ID="Label13" runat="server" Text="實際加班時間(訖)" 
                                    meta:resourcekey="Label13Resource1"></asp:Label>
                            </td>
                            <td class="PopTableRightTD">
                                <table>
                                    <tr>
                                        <td>
                                            <telerik:RadDatePicker ID="rdEndDate" runat="server" AutoPostBack="false" meta:resourcekey="rdEndDateResource1">
                                                <Calendar UseColumnHeadersAsSelectors="False" UseRowHeadersAsSelectors="False">
                                                </Calendar>
                                                <DateInput AutoPostBack="True"  LabelWidth="40%" Width="" ClientEvents-OnValueChanging="OnValueChanging">
                                                </DateInput>
                                                <DatePopupButton HoverImageUrl="" ImageUrl="" CssClass="" />
                                                <ClientEvents OnDateSelected="onActValueChanged"/>
                                            </telerik:RadDatePicker>
                                        </td>
                                        <td>
                                            <asp:Label ID="lblActEndDate" runat="server" Visible="False" meta:resourcekey="lblActEndDateResource1"></asp:Label>
                                            <telerik:RadTimePicker ID="rdEndTime" runat="server">
                                                <ClientEvents OnDateSelected="onActValueChanged"/>
                                            </telerik:RadTimePicker>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td class="popTableLeftTD"  style="white-space:nowrap">
                                <asp:Label ID="Label1" runat="server" Text="實際用餐/休息時數" 
                                    meta:resourcekey="Label1Resource1"></asp:Label>
                            </td>
                            <td class="PopTableRightTD" style=" white-space:nowrap;">
                                <asp:RadioButtonList ID="rblActEatHours" runat="server" onClick="ClearLea()"
                                    RepeatDirection="Horizontal" meta:resourcekey="rblActEatHoursResource1">
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
                            <td class="popTableLeftTD"  style="white-space:nowrap">
                                <asp:Label ID="Label15" runat="server" Text="實際加班時數" 
                                    meta:resourcekey="Label15Resource1"></asp:Label>
                            </td>
                            <td class="PopTableRightTD">
                                <asp:Label ID="lblActHours" runat="server" 
                                    meta:resourcekey="lblActHoursResource1" ></asp:Label>
                                <asp:Label ID="Label16" runat="server" meta:resourcekey="Label16Resource1" Text="時"></asp:Label>
                                <telerik:RadButton ID="rbtnActCal" runat="server" CausesValidation="False" Text="計算" OnClick="rbtnActCal_Click" meta:resourcekey="rbtnActCalResource1">
                                </telerik:RadButton>
                            </td>
                        </tr>
                        <tr>
                            <td class="popTableLeftTD"  style="white-space:nowrap">
                                <asp:Label ID="Label8" runat="server" Text="歸屬日" 
                                    meta:resourcekey="Label8Resource1"></asp:Label>
                            </td>
                            <td class="PopTableRightTD" colspan="3">
                                <telerik:RadDropDownList ID="rddlBelongDate" runat="server" 
                                    AutoPostBack="true" OnSelectedIndexChanged="rddlBelongDate_SelectedIndexChanged" CausesValidation="false" meta:resourcekey="rddlBelongDateResource1">
                                </telerik:RadDropDownList>
                                <asp:Label ID="lblBelongDate" runat="server" Visible="False" 
                                    meta:resourcekey="lblBelongDateResource1"></asp:Label>
                            </td>
                        </tr>
                    </table>
                    <table cellpadding="0" cellspacing="0">
                        <tr>
                            <td>
                                <asp:CustomValidator ID="cvOvertimeUsers" runat="server" ClientValidationFunction="CheckOverTimeUsers" Display="Dynamic" ErrorMessage="請選擇加班人員" meta:resourcekey="cvOvertimeUsersResource1" Visible="False"></asp:CustomValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:CustomValidator ID="cvTimeTable" runat="server" ErrorMessage="加班人員須為同一班表" 
                                    Visible="False" Display="Dynamic" ClientValidationFunction="CheckTimeTable" 
                                    meta:resourcekey="cvTimeTableResource1"></asp:CustomValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:CustomValidator ID="cvSameTimeZone" runat="server" ClientValidationFunction="CheckSameOffice" ErrorMessage="加班人員須為同一歸屬地點" Display="Dynamic" meta:resourcekey="cvSameTimeZoneResource1" ></asp:CustomValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:CustomValidator ID="cvCheckUsersSett" runat="server" ClientValidationFunction="CheckUsersSett"
                                    ErrorMessage="加班人員須為同一差勤結算類別" Display="Dynamic" Visible="False" 
                                    meta:resourcekey="cvCheckUsersSettResource1"></asp:CustomValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:CustomValidator ID="cValidExpHour" runat="server" ClientValidationFunction="CheckExpOvertimeHour"
                                    Display="Dynamic" ErrorMessage="預計加班時數不可為0或空白(請記得按下計算鈕)" 
                                    meta:resourcekey="cValidExpHourResource1"></asp:CustomValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:CustomValidator ID="cValidActHour" runat="server" ClientValidationFunction="CheckActOvertimeHour"
                                    Display="Dynamic" ErrorMessage="實際加班時數不可為0或空白(請記得按下計算鈕)" 
                                    meta:resourcekey="cValidActHourResource1"></asp:CustomValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:CustomValidator ID="cvMaxExpHours" runat="server" 
                                    ErrorMessage="預計加班時數不可大於預計加班時間(訖) - 預計加班時間(起) - 預計用餐時數" Visible="False" 
                                    Display="Dynamic" ClientValidationFunction="CheckMaxExpHours" 
                                    meta:resourcekey="cvMaxExpHoursResource1"></asp:CustomValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:CustomValidator ID="cvMaxActHours" runat="server" 
                                    ErrorMessage="實際加班時數不可大於實際加班時間(訖) - 實際加班時間(起) - 實際用餐時數" Visible="False" 
                                    Display="Dynamic" ClientValidationFunction="CheckMaxActHours" 
                                    meta:resourcekey="cvMaxActHoursResource1"></asp:CustomValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:CustomValidator ID="cvClosed" runat="server" ClientValidationFunction="CheckIsClose"
                                    ErrorMessage="歸屬日為已鎖單或已關帳月份不允許申請" Display="Dynamic" Visible="False" 
                                    meta:resourcekey="cvClosedResource1"></asp:CustomValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:CustomValidator ID="cvDoubleLeaveForm" runat="server" ClientValidationFunction="CheckDoubleLeaveForm"
                                    ErrorMessage="加班時間與請假時間重疊" Display="Dynamic" Visible="False" 
                                    meta:resourcekey="cvDoubleLeaveFormResource1"></asp:CustomValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:CustomValidator ID="cvDoubleLeaveFormUsers" runat="server" 
                                    ErrorMessage="所選擇加班人員的加班時間與請假時間重疊" Visible="False" Display="Dynamic"
                                    ClientValidationFunction="CheckDoubleLeaveForm" 
                                    meta:resourcekey="cvDoubleLeaveFormUsersResource1"></asp:CustomValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:CustomValidator ID="cvDoubleOTForm" runat="server" ClientValidationFunction="CheckDoubleOTForm"
                                    ErrorMessage="加班時間與其他加班單時間重疊" Display="Dynamic" Visible="False" 
                                    meta:resourcekey="cvDoubleOTFormResource1"></asp:CustomValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:CustomValidator ID="cvDoubleOTFormUsers" runat="server" 
                                    ErrorMessage="所選擇加班人員的加班時間與其他加班單時間重疊" Visible="False" Display="Dynamic"
                                    ClientValidationFunction="CheckDoubleOTForm" 
                                    meta:resourcekey="cvDoubleOTFormUsersResource1"></asp:CustomValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:LinkButton ID="lbtnErrorInfo" runat="server" Text="點此查看詳細錯誤資訊" 
                                    CausesValidation="False" style="display:none" 
                                    onclientclick="OpenDialog(this); return false;" 
                                    meta:resourcekey="lbtnErrorInfoResource1"></asp:LinkButton>
                            </td>
                        </tr>
                    </table>
                    <asp:HiddenField ID="hfPreViewTimeTableUsers" runat="server" />
                    <asp:HiddenField ID="hfErrorSelectUsers" runat="server" />
                    <asp:HiddenField ID="hfOverTimeType" runat="server" Value="2.0"/>
                    <asp:HiddenField ID="hfStartDate" runat="server" />
                    <asp:HiddenField ID="hfEndDate" runat="server" />
                </ContentTemplate>
            </asp:UpdatePanel>
        </td>
    </tr>
</table>

<asp:TextBox ID="txtIsCheckPunch" runat="server" style="display:none" Text="0" meta:resourcekey="txtIsCheckPunchResource1"></asp:TextBox>
<asp:Label ID="lblOvertimeMsg" runat="server" ForeColor="Red" Text="加班時間與刷卡時間不符，請再次確認" Visible="False" meta:resourcekey="lblOvertimeMsgResource1"></asp:Label>
<asp:TextBox ID="txtExpCal" runat="server" style="display:none" meta:resourcekey="txtExpCalResource1"></asp:TextBox>
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
<asp:HiddenField runat="server" ID="hfTimeZoneEnable"></asp:HiddenField>