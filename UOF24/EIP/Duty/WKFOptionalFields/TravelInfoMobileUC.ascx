<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="TravelInfoUC.ascx.cs" Inherits="WKFOptionalFields_TravelInfoUC" %>
<%@ Reference Control="~/WKF/FormManagement/VersionFieldUserControl/VersionFieldUC.ascx" %>
<%@ Register Src="../../../Common/ChoiceCenter/UC_ChoiceList.ascx" TagName="UC_ChoiceList" TagPrefix="uc1" %>
<%@ Register Src="~/Common/ChoiceCenter/UC_ChoiceListMobile.ascx" TagPrefix="uc1" TagName="UC_ChoiceListMobile" %>

<style>
    .fullWidth {
        width:100% !important;
    }
</style>
<script language="javascript" type="text/javascript">
    //修改出差時間時需清除時數，這樣才能正確的驗證時數是否為0.0或空值
    function ClearHour() {

        var lblRealHour = $('#<%=lblTotalHour.ClientID %>').text();

        if (lblRealHour !== null) {
            lblRealHour.innerHTML = '';
        }
    }

    //檢查時數是否為0.0或空值
    function CheckHours(source, args) {

        var lblRealHour = $('#<%=lblTotalHour.ClientID %>').text();

        if (lblRealHour !== null) {
            var hours = lblRealHour.innerHTML;

            if (hours === "0.0" || hours === "") {
                
                args.IsValid = false;
            }
            else {
                
                args.IsValid = true;

            }
        }
    }

    //檢查出差人員是否有相同的班表
    function CheckSameTimeTable(e, args) {
        
        if ($find('<%=rdStartDate.ClientID %>') == null || $find('<%=rdFinishDate.ClientID %>') == null)
            return;

        var allTravelUsers = $("#<%=hfAllUserValue.ClientID %>").val();
        var selected = $("#<%=UC_ChoiceListMobile.ClientID%>" + "_hiddenSelected").val();
        
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

        var startDate = $find('<%=rdStartDate.ClientID %>').get_selectedDate();
        if (startDate != null) startDate = startDate.format('yyyy/MM/dd');
        var finishDate = $find('<%=rdFinishDate.ClientID %>').get_selectedDate();
        if (finishDate != null) finishDate = finishDate.format('yyyy/MM/dd');

        var isTheSame;

        if (startDate == null || finishDate == null) return;
        var data = [allTravelUsers, startDate, finishDate];
        var isTheSame = $uof.pageMethod.syncUc("EIP/Duty/WKFOptionalFields/TravelInfoUC.ascx", "CheckSameTimeTable", data);

        if (isTheSame === "false") {
            args.IsValid = false;
        }
        else {
            args.IsValid = true;
        }
    }

    //檢查是否還未關帳
    function CheckTimeTableIsNotClosed(e, args) {

        if ($find('<%=rdStartDate.ClientID %>') == null)
            return;

        var isClosed;
        var allTravelUsers = $("#<%=hfAllUserValue.ClientID %>").val();
        var selected = $("#<%=UC_ChoiceListMobile.ClientID%>" + "_hiddenSelected").val();  //M選人元件沒有事件，所以要直接抓選人元件上的值
        
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

        var startDate = $find('<%=rdStartDate.ClientID %>').get_selectedDate();

        if (startDate != null) startDate = startDate.format('yyyy/MM/dd');        
        if (startDate == null) return;

        var data = [startDate, allTravelUsers];
        var isClosed = $uof.pageMethod.syncUc("EIP/Duty/WKFOptionalFields/TravelInfoUC.ascx", "CheckTimeTableIsNotClosed", data);
        
        if (isClosed === "false") {
            args.IsValid = false;
        }
        else {
            args.IsValid = true;
        }
    }

    //判斷是否有跟請假單或出差單重複申請
    function CheckIsLeaveOrTravel(e, args) {

        if ($find('<%=rdStartDate.ClientID %>') == null || $find('<%=rdFinishDate.ClientID %>') == null)
            return;

        var allTravelUsers = $("#<%=hfAllUserValue.ClientID %>").val();
        var selected = $("#<%=UC_ChoiceListMobile.ClientID%>" + "_hiddenSelected").val();
        
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

        var startDate = $find('<%=rdStartDate.ClientID %>').get_selectedDate();
        if (startDate != null)
            startDate = startDate.format('yyyy/MM/dd');

        var finishDate = $find('<%=rdFinishDate.ClientID %>').get_selectedDate();
        if (finishDate != null)
            finishDate = finishDate.format('yyyy/MM/dd');

        var taskID = $("#<%=hfTaskID.ClientID %>").val();
        var sameLeaveStr = "";
        var sameTravelStr = "";
        var alertStr = "";
        var re = new RegExp('\\{0\\}', 'gm');
        var startTime = $find("<%= rdStartTime.ClientID %>").get_selectedDate();
        if (startTime != null) startTime = startTime.format('HH:mm');

        var finishTime = $find("<%= rdEndTime.ClientID %>").get_selectedDate();
        if (finishTime != null) finishTime = finishTime.format('HH:mm');

        var lblSameForm = $("#<%=lblSameForm.ClientID %>");

        if (startDate == null || finishDate == null) return;

        var leavedata = [allTravelUsers, startDate + " " + startTime, finishDate + " " + finishTime];
        sameLeaveStr = $uof.pageMethod.syncUc("EIP/Duty/WKFOptionalFields/TravelInfoUC.ascx", "CheckIsLeave", leavedata);

        var traveldata = [allTravelUsers, taskID, startDate + " " + startTime, finishDate + " " + finishTime];
        sameTravelStr = $uof.pageMethod.syncUc("EIP/Duty/WKFOptionalFields/TravelInfoUC.ascx", "CheckIsTravel", traveldata);

        if (sameLeaveStr !== "" || sameTravelStr !== "") {            
            lblSameForm.css("display", "block");
            args.IsValid = false;
        }
        else {            
            lblSameForm.css("display", "none");
            args.IsValid = true;
        }
    }

    function CheckSameOffice(e, args) {

        var lblSameOffice = $("#<%=lblSameOffice.ClientID %>");
        var allTravelUsers = $("#<%=hfAllUserValue.ClientID %>").val();
        var selected = $("#<%=UC_ChoiceListMobile.ClientID%>" + "_hiddenSelected").val();  //M選人元件沒有事件，所以要直接抓選人元件上的值
        
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

        var checkData = [allTravelUsers];        
        var checkResult = $uof.pageMethod.syncUc("EIP/Duty/WKFOptionalFields/TravelInfoUC.ascx", "CheckSameOffice", checkData);
        
        if (checkResult == "true")
        {
            lblSameOffice.css("display", "none");
            args.IsValid = true;
        }
        else
        {
            lblSameOffice.css("display", "block");
            args.IsValid = false;
        }
    }

    function CaculatorHours(e, args) {

        if ($find('<%=rdStartDate.ClientID %>') == null || $find('<%=rdFinishDate.ClientID %>') == null)
            return;

        var allTravelUsers = $("#<%=hfAllUserValue.ClientID %>").val();
        var selected = $("#<%=UC_ChoiceListMobile.ClientID%>" + "_hiddenSelected").val();

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

        var startDate = $find('<%=rdStartDate.ClientID %>').get_selectedDate();
        if (startDate != null) startDate = startDate.format('yyyy/MM/dd');
        var finishDate = $find('<%=rdFinishDate.ClientID %>').get_selectedDate();
        if (finishDate != null) finishDate = finishDate.format('yyyy/MM/dd');

        var startTime = $find("<%= rdStartTime.ClientID %>").get_selectedDate();
        if (startTime != null) startTime = startTime.format('HH:mm');

        var finishTime = $find("<%= rdEndTime.ClientID %>").get_selectedDate();
        if (finishTime != null) finishTime = finishTime.format('HH:mm');

        if (startDate == null || finishDate == null) return;

        var data = [allTravelUsers, startDate, startTime, finishDate, finishTime];
        var hours = $uof.pageMethod.syncUc("EIP/Duty/WKFOptionalFields/TravelInfoUC.ascx", "GetCaculatorHours", data);

        var lblRealHour = $('#<%=lblTotalHour.ClientID %>').text();
        lblRealHour.innerHTML = hours;

        if (hours === "0" || hours === "") {
            args.IsValid = false;
        }
        else {
            args.IsValid = true;
        }
    }

    //檢查出差日期
    function CheckStartEndDate(e, args) {

        if ($find('<%=rdStartDate.ClientID %>') == null || $find('<%=rdFinishDate.ClientID %>') == null)
            return;

        var startDate = $find('<%=rdStartDate.ClientID %>').get_selectedDate();
        if (startDate != null) startDate = startDate.format('yyyy/MM/dd');
        var finishDate = $find('<%=rdFinishDate.ClientID %>').get_selectedDate();
        if (finishDate != null) finishDate = finishDate.format('yyyy/MM/dd');

        var startTime = $find("<%= rdStartTime.ClientID %>").get_selectedDate();
        if (startTime != null) startTime = startTime.format('HH:mm');

        var finishTime = $find("<%= rdEndTime.ClientID %>").get_selectedDate();
        if (finishTime != null) finishTime = finishTime.format('HH:mm');

        if (startDate == null || finishDate == null) return;

        var data = [startDate, startTime, finishDate, finishTime];
        var isPass = $uof.pageMethod.syncUc("EIP/Duty/WKFOptionalFields/TravelInfoUC.ascx", "CheckDate", data);
                
        if (isPass === "false") {
            e.textContent = $("#<%=lblEndBiggerThenStart.ClientID %>").text();
            args.IsValid = false;
            return;
        }
        else {
            args.IsValid = true;
        }
    }

    function CheckUsersSett(e, args) {

        var lblUsersSett = $("#<%=lblUsersSett.ClientID %>");
        var allTravelUsers = $("#<%=hfAllUserValue.ClientID %>").val();
        var selected = $("#<%=UC_ChoiceListMobile.ClientID%>" + "_hiddenSelected").val();  //M選人元件沒有事件，所以要直接抓選人元件上的值
        
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

        var startDate = $find('<%=rdStartDate.ClientID %>').get_selectedDate();
        if (startDate != null) startDate = startDate.format('yyyy/MM/dd');

        var data = [startDate, allTravelUsers];
        var sValue = $uof.pageMethod.syncUc("EIP/Duty/WKFOptionalFields/TravelInfoUC.ascx", "CheckUsersSett", data);
        
        if (sValue == "true") {
            lblUsersSett.css("display", "block");
            args.IsValid = false;
        }
        else
        {
            lblUsersSett.css("display", "none");
            args.IsValid = true;
        }
    }

    //出差人員不允許空白
    function CheckTravelUsers(source, args) {

        var allTravelUsers = $("#<%=hfAllUserValue.ClientID %>").val();
        var selected = $("#<%=UC_ChoiceListMobile.ClientID%>" + "_hiddenSelected").val();
        
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

        if (allTravelUsers === null || allTravelUsers === '[]') {
            args.IsValid = false;
        }
        else {
            args.IsValid = true;
        }
    }
    function OnValueChanging(sender, args) {
        if (args.get_newValue() == "") {
            args.set_newValue(args.get_oldValue());
        }
    }
</script>

<asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>
        <table style="width: 97%">
            <tr id="officeTr" runat="server">
                <td>
                    <table>
                        <tr>
                            <td style="padding-left: 17px; padding-top: 5px; white-space: nowrap">
                                <asp:Label ID="Label3" runat="server" Text="歸屬地點時區" meta:resourcekey="Label3Resource1"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td style="padding-left: 17px;">
                                <asp:Label ID="lblOfficePlace" runat="server" Text=""></asp:Label>
                            </td>
                        </tr>
                    </table>
                </td>                
            </tr>
            <tr>
                <td style="padding-left: 17px; padding-top: 8px">
                    <asp:Label ID="lblTravelUsers" runat="server" Text="出差人員" meta:resourcekey="lblTravelUsersResource1"></asp:Label>
                </td>
                <td style="padding-top: 10px; text-align: right">
                    <div style="display: none">
                        <asp:LinkButton ID="lbtnPreviewTimeTable" runat="server" Text="預覽班表" CausesValidation="False" meta:resourcekey="lbtnPreviewTimeTableResource1"></asp:LinkButton>
                        &nbsp
                    <asp:Panel ID="PnlUserReport" runat="server">
                        <asp:LinkButton ID="lbtnUserReport" Text="出缺勤資訊" runat="server" meta:resourcekey="lbtnUserReportResource1"></asp:LinkButton>
                    </asp:Panel>
                    </div>
                </td>
            </tr>
            <tr>
                <td style="padding-left: 17px" colspan="2">
                    <div style="display: none">
                        <uc1:UC_ChoiceList ID="UC_ChoiceList1" runat="server" ShowMember="False" />
                    </div>
                    <uc1:UC_ChoiceListMobile runat="server" ID="UC_ChoiceListMobile" />
                    <asp:Label ID="Label4" runat="server" Visible="False" meta:resourcekey="Label4Resource1"></asp:Label>
                    <asp:HiddenField ID="hfAllUserValue" runat="server" />
                    <asp:HiddenField ID="hfUsers" runat="server" />
                </td>
            </tr>
            <tr>
                <td style="padding-left: 17px" colspan="2">
                    <asp:CustomValidator ID="cvCheckTravelUsers" runat="server" ErrorMessage="不允許空白" Display="Dynamic" ForeColor="Red" EnableTheming="true"
                        ClientValidationFunction="CheckTravelUsers" meta:resourcekey="cvCheckTravelUsersResource1">
                    </asp:CustomValidator>
                </td>
            </tr>
            <tr>
                <td style="padding-left: 17px; padding-top: 8px" colspan="2">
                    <asp:Label ID="lblStratTime" runat="server" Text="出差時間(起)" meta:resourcekey="lblStratTimeResource1"></asp:Label>
                </td>
            </tr>
            <tr>
                <td style="padding-left: 17px; padding-bottom: 8px" colspan="2">
                    <asp:Label ID="lblDisplayStartDate" runat="server" Visible="False" meta:resourcekey="lblDisplayStartDateResource1"></asp:Label>
                    <telerik:RadDatePicker ID="rdStartDate" runat="server" AutoPostBack="True" Width="100%" EnableTheming="true"
                        OnSelectedDateChanged="rdStartDate_SelectedDateChanged" meta:resourcekey="rdStartDateResource1">
                    </telerik:RadDatePicker>
                </td>
            </tr>
            <tr>
                <td style="padding-left: 17px" colspan="2">
                    <telerik:RadTimePicker ID="rdStartTime" runat="server" Width="100%" EnableTheming="true" CssClass="fullWidth">
                        <ClientEvents OnDateSelected="ClearHour" />
                    </telerik:RadTimePicker>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:CheckBox ID="ckbIsFlexible" runat="server" Text="首日依彈性最晚下班時間計算" Visible="false" AutoPostBack="true" meta:resourcekey="ckbIsFlexibleResource1" />
                    <asp:HiddenField ID="hfCalLeaRule" runat="server" />
                </td>
            </tr>
            <tr>
                <td style="padding-left: 17px; padding-top: 10px" colspan="2">
                    <asp:Label ID="lblFinishTime" runat="server" Text="出差時間(訖)" meta:resourcekey="lblFinishTimeResource1"></asp:Label>
                </td>
            </tr>
            <tr>
                <td style="padding-left: 17px; padding-bottom: 8px" colspan="2">
                    <asp:Label ID="lblDisplayFinishDate" runat="server" Visible="False" meta:resourcekey="lblDisplayFinishDateResource1"></asp:Label>
                    <telerik:RadDatePicker ID="rdFinishDate" runat="server" AutoPostBack="True" Width="100%" EnableTheming="true"
                        OnSelectedDateChanged="rdFinishDate_SelectedDateChanged" meta:resourcekey="rdFinishDateResource1">
                    </telerik:RadDatePicker>
                </td>
            </tr>
            <tr>
                <td style="padding-left: 17px" colspan="2">
                    <telerik:RadTimePicker ID="rdEndTime" runat="server" Width="100%" EnableTheming="true" CssClass="fullWidth">
                        <ClientEvents OnDateSelected="ClearHour" />
                    </telerik:RadTimePicker>
                </td>
            </tr>
            <tr style="display: none">
                <td style="padding-left: 17px; padding-top: 10px" colspan="2">
                    <asp:Label ID="lblHours" runat="server" Text="出差時數" meta:resourcekey="lblHoursResource1"></asp:Label>
                </td>
            </tr>
            <tr style="display: none">
                <td style="padding-left: 15px; padding-top: 5px" colspan="2">
                    <telerik:RadButton ID="rdbtnCaculator" CausesValidation="False" runat="server" Text="計算" Width="70px"
                        OnClick="rdbtnCaculator_Click" meta:resourcekey="rdbtnCaculatorResource1">
                    </telerik:RadButton>
                    &nbsp
                    <asp:Label ID="lblTotalHour" runat="server" meta:resourcekey="lblTotalHourResource1"></asp:Label>
                    <asp:Label ID="lblHour" runat="server" Text="時" meta:resourcekey="lblHourResource1"></asp:Label>
                </td>
            </tr>
        </table>

        <%-- 驗證元件 --%>
        <table style="width: 97%" cellpadding="0" cellspacing="0" border="0">
            <tr>
                <td style="padding-left: 17px; padding-top:1px">
                    <asp:RequiredFieldValidator ID="rfvStartDate" runat="server" ErrorMessage="出差時間(起)不可為空白" ForeColor="Red" EnableTheming="true" Display="Dynamic" ControlToValidate="rdStartDate" meta:resourcekey="rfvStartDateResource1"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td style="padding-left: 17px; padding-top:1px">
                    <asp:RequiredFieldValidator ID="rfvFinishDate" runat="server" ErrorMessage="出差時間(訖)不可為空白" ForeColor="Red" EnableTheming="true" Display="Dynamic" ControlToValidate="rdFinishDate" meta:resourcekey="rfvFinishDateResource1"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td style="padding-left: 17px; padding-top:1px">
                    <asp:CustomValidator ID="cvEndBiggerThenStart" runat="server" ClientValidationFunction="CheckStartEndDate" Display="Dynamic" ForeColor="Red" EnableTheming="true" meta:resourcekey="cvEndBiggerThenStartResource1"></asp:CustomValidator>
                </td>
            </tr>
            <tr>
                <td style="padding-left: 17px; padding-top:1px">
                    <asp:CustomValidator ID="cvCheckSameTimeTable" runat="server" ErrorMessage="出差人員於出差區間為不同上班時段或尚未排定班表" ForeColor="Red" EnableTheming="true" SetFocusOnError="True" Display="Dynamic" ClientValidationFunction="CheckSameTimeTable" meta:resourcekey="cvCheckSameTimeTableResource1"></asp:CustomValidator>
                </td>
            </tr>
            <tr>
                <td style="padding-left: 17px; padding-top:1px">
                    <asp:CustomValidator ID="cvTimeTableIsClosed" runat="server" ErrorMessage="出差日期期間差勤結算已鎖定或關帳，不能申請" Display="Dynamic" ForeColor="Red" EnableTheming="true" ClientValidationFunction="CheckTimeTableIsNotClosed" meta:resourcekey="cvTimeTableIsClosedResource1"></asp:CustomValidator>
                </td>
            </tr>
            <tr>
                <td style="padding-left: 17px; padding-top:1px">
                    <asp:CustomValidator ID="cvSameForm" runat="server" ClientValidationFunction="CheckIsLeaveOrTravel" Display="Dynamic" ForeColor="Red" EnableTheming="true" meta:resourcekey="cvSameFormResource1"></asp:CustomValidator>
                </td>
            </tr>
            <tr>
                <td style="padding-left: 17px; padding-top:1px; display:none">
                    <asp:LinkButton ID="lbtnSameForm" runat="server" Text="請點此查看與其他表單衝突的出差人員" Style="display: none; color: Red" meta:resourcekey="lbtnSameFormResource1"></asp:LinkButton>
                </td>
                <td style="padding-left: 17px; padding-top: 1px;">
                    <asp:Label ID="lblSameForm" runat="server" Text="出差人員與其他表單衝突" Style="display: none; color: Red" meta:resourcekey="lblSameFormResource1" ></asp:Label>
                </td>
            </tr>
            <tr>
                <td style="padding-left: 17px; padding-top: 1px; display:none"><%--為PC的元件，所以不顯示--%>
                    <asp:LinkButton ID="lbtnSameOffice" runat="server" Text="請點此查看不同歸屬地點的出差人員" style="display:none; color:Red" meta:resourcekey="lbtnSameOfficeResource1"></asp:LinkButton>
                    <asp:CustomValidator ID="cvSameTimeZone" runat="server" ClientValidationFunction="CheckSameOffice" Display="Dynamic" meta:resourcekey="cvSameTimeZoneResource1"></asp:CustomValidator>
                </td>
                <td style="padding-left: 17px; padding-top: 1px;">
                    <asp:Label ID="lblSameOffice" runat="server" Text="出差人員為不同歸屬地點" Style="display: none; color: Red" meta:resourcekey="lblSameOfficeResource1" ></asp:Label>
                </td>
            </tr>
            <tr>
                <td style="padding-left: 17px; padding-top: 1px; display:none"><%--為PC的元件，所以不顯示--%>
                    <asp:LinkButton ID="lbtnUsersSett" runat="server" Text="請點此查看不同結算類別的出差人員" style="display:none; color:Red" meta:resourcekey="lbtnUsersSettResource1"></asp:LinkButton>
                    <asp:CustomValidator ID="cvCheckUsersSett" runat="server" ClientValidationFunction="CheckUsersSett" Display="Dynamic"  meta:resourcekey="cvCheckUsersSettResource1"></asp:CustomValidator>
                </td>
                <td style="padding-left: 17px; padding-top: 1px;">
                    <asp:Label ID="lblUsersSett" runat="server" Text="出差人員為不同結算類別" Style="display: none; color: Red" meta:resourcekey="lblUsersSettResource1" ></asp:Label>
                </td>
            </tr>
            <tr>
                <td style="padding-left: 17px; padding-top:1px">
                    <asp:CustomValidator ID="cvHoursEmpty" runat="server" Display="Dynamic" ForeColor="Red" EnableTheming="true" ErrorMessage="請確認出差起訖的區間，是否有設定班表，或是否有包含工作時間。" meta:resourcekey="cvHoursEmptyResource1"></asp:CustomValidator>
                    <asp:CustomValidator ID="cvCheckNoSetting" runat="server" ErrorMessage="找不到工時設定" Display="Dynamic" ForeColor="Red" EnableTheming="true" meta:resourcekey="cvCheckNoSettingResource1"></asp:CustomValidator>
                </td>
            </tr>
        </table>
    </ContentTemplate>
</asp:UpdatePanel>

<asp:HiddenField ID="hfIsSendValue" runat="server" />
<asp:HiddenField ID="hfOverTimeType" runat="server" Value="travel"/>
<asp:Label ID="lblFieldValue" runat="server" Text="" Visible="false"></asp:Label>
<asp:Label ID="lblEndDateDmpty" runat="server" Text="出差時間(訖)不可為空白" Style="display: none;" meta:resourcekey="lblEndDateDmptyResource1"></asp:Label>
<asp:Label ID="lblEndBiggerThenStart" runat="server" Text="出差時間(起)不可晚於出差時間(訖)" Style="display: none;" meta:resourcekey="lblEndBiggerThenStartResource1"></asp:Label>
<asp:Label ID="lblHasNoAuthority" runat="server" Text="無填寫權限" ForeColor="Red" Visible="False" meta:resourcekey="lblHasNoAuthorityResource1"></asp:Label>
<asp:Label ID="lblToolTipMsg" runat="server" Text="不允許修改(唯讀)" Visible="False" meta:resourcekey="lblToolTipMsgResource1"></asp:Label>
<asp:Label ID="lblFiller" CssClass="FillerVisible" runat="server" meta:resourcekey="lblFillerResource1"></asp:Label>
<asp:Label ID="lblModifier" runat="server" Visible="False" meta:resourcekey="lblModifierResource1"></asp:Label>
<asp:Label ID="lblMsgSigner" runat="server" Text="填寫者" Visible="False" meta:resourcekey="lblMsgSignerResource1"></asp:Label>
<asp:Label ID="lblMsgEditor" runat="server" Text="修改者" Visible="False" meta:resourcekey="lblMsgEditorResource1"></asp:Label>
<asp:Label ID="lblAuthorityMsg" runat="server" Text="具填寫權限人員" Visible="False" meta:resourcekey="lblAuthorityMsgResource1"></asp:Label>
<asp:Label ID="lblTravelDisplay" runat="server" Text="出差" Visible="False" meta:resourcekey="lblTravelDisplayResource1"></asp:Label>
<asp:HiddenField ID="hfTaskID" runat="server" />
