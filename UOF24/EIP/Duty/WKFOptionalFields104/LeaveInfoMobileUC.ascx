<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="LeaveInfoUC.ascx.cs" Inherits="Ede.Uof.Web.EIP.Duty.WKFOptionalFields104.LeaveInfoUC" %>
<%@ Register Src="~/Common/ChoiceCenter/UC_ChoiceList.ascx" TagPrefix="uc1" TagName="UC_ChoiceList" %>
<%@ Register Src="~/Common/ChoiceCenter/UC_ChoiceListMobile.ascx" TagPrefix="uc2" TagName="UC_ChoiceListMobile" %>


<style>
    .LeaveTable104 > tbody > tr:nth-child(even) > td {
        padding-left : 10px;
        padding-bottom: 15px;
    }

    .LeaveTable104 > tbody > tr:nth-child(odd) > td {
        padding-left : 10px;
        padding-bottom : 5px;
    }

    .labelMutiline {
      white-space:pre-wrap;
    }
</style>
<script>
    Sys.Application.add_load(function () {
        if ($("#<%=hfFieldMode.ClientID%>").val() === "Design" || typeof $("#<%=hfFieldMode.ClientID%>").val() === 'undefined') {
            return;
        }

        var applicantEmployeeNo = $("#<%=hfApplicantEmployeeNo.ClientID%>").val();
        var applicantCompanyNo = $("#<%=hfApplicantCompanyNo.ClientID%>").val();
        if (applicantEmployeeNo === '' || applicantCompanyNo === '') {
            return;
        }

        AddChangeEvent_<%=ClientID%>();
        CheckEventDate_<%=ClientID%>();
    });

    function AddChangeEvent_<%=ClientID%>() {
        $('#<%=ddlLeaveCode.ClientID%>').on('change', function () {
            ClearHours_<%=ClientID%>();
            CheckEventDate_<%=ClientID%>();
        });
    }

    function OnDateSelected_<%=ClientID%>(sender, eventArgs) {
        ClearHours_<%=ClientID%>();
    }

    function ClearHours_<%=ClientID%>()
    {
        $("#<%=lblHours.ClientID%>").text('');
        $("#<%=txtHours.ClientID%>").val('');
        $("#<%=txtUnit.ClientID%>").val('');
        $("#<%=txtError.ClientID%>").val('');
        $("#<%=txtError.ClientID%>").hide();
    }

    function CalLeaveHours_<%=ClientID%>() {
        var arrayResult;
        var startDate = $find("<%=rdStartDate.ClientID%>").get_dateInput().get_value();
        var endDate = $find("<%=rdEndDate.ClientID%>").get_dateInput().get_value();
        var startTime = $find("<%=rdStartTime.ClientID%>").get_dateInput().get_value();
        var endTime = $find("<%=rdEndTime.ClientID%>").get_dateInput().get_value();
        var applicantEmployeeNo = $("#<%=hfApplicantEmployeeNo.ClientID%>").val();
        var applicantCompanyNo = $("#<%=hfApplicantCompanyNo.ClientID%>").val();
        var leaCode = $("#<%=ddlLeaveCode.ClientID%>").val();
        
        if (leaCode == null || leaCode === "") return;
        //沒有公司統編或員編就不跑其他驗證
        if (applicantEmployeeNo === '' || applicantCompanyNo === '') {
            return;
        }
        var data = [applicantCompanyNo, applicantEmployeeNo, startDate, startTime, endDate, endTime, leaCode];
        var result = $uof.pageMethod.syncUc("EIP/Duty/WKFOptionalFields104/LeaveInfoUC.ascx", "CalHours", data);

        if (result !== "") {
            arrayResult = result.split('|');
            if (arrayResult.length > 0) {
                if (arrayResult[0] === arrayResult[1] && arrayResult[1] === arrayResult[2] && arrayResult[2] === arrayResult[0])
                {
                    $("#<%=lblHours.ClientID%>").text('');
                    $("#<%=txtHours.ClientID%>").val('');
                    $("#<%=txtUnit.ClientID%>").val('');
                    $("#<%=txtError.ClientID%>").val(arrayResult[0]);
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

    function CheckEventDate_<%=ClientID%>(){
        var applicantEmployeeNo = $("#<%=hfApplicantEmployeeNo.ClientID%>").val();
        var applicantCompanyNo = $("#<%=hfApplicantCompanyNo.ClientID%>").val();
        var leaCode = $("#<%=ddlLeaveCode.ClientID%>").val();

        if (leaCode == null || leaCode === "") {
            leaCode = $("#<%=hfLeaveCode.ClientID%>").val();
        } else {
            $("#<%=hfLeaveCode.ClientID%>").val(leaCode);
        }
        if (leaCode == null || leaCode === "") {
            $("#tdlblEventDate").hide();
            $("#tdEventDate").hide();
            $("#tdHours").attr("colspan", "3");
            $("#<%=lblEventDateStar.ClientID%>").hide();            
            return "";
        }
        //沒有公司統編或員編就不跑其他驗證     
        if (applicantEmployeeNo === '' || applicantCompanyNo === '') {
            return;
        }
        var data = [applicantCompanyNo, applicantEmployeeNo, leaCode];
        var result = $uof.pageMethod.syncUc("EIP/Duty/WKFOptionalFields104/LeaveInfoUC.ascx", "CheckEventDate", data);

        if (result === "true") {
            $("#tdlblEventDate").show();
            $("#tdEventDate").show();
            $("#tdHours").removeAttr("colspan");
            $("#<%=lblEventDateStar.ClientID%>").show();
        }
        else {
            $("#tdlblEventDate").hide();
            $("#tdEventDate").hide();
            $("#tdHours").attr("colspan", "3");
            $("#<%=lblEventDateStar.ClientID%>").hide();
        }
        return result;
    }

    function ValidateHours_<%=ClientID%>(source, arguments) {
        var error = $("#<%=txtError.ClientID%>").val();
        var hours = $("#<%=txtHours.ClientID%>").val();
        //沒有公司統編或員編就不跑其他驗證
        var applicantEmployeeNo = $("#<%=hfApplicantEmployeeNo.ClientID%>").val();
        var applicantCompanyNo = $("#<%=hfApplicantCompanyNo.ClientID%>").val();
        if (applicantEmployeeNo === '' || applicantCompanyNo === '') {
            return;
        }

        if(error === '' && hours ==='')
        {
            arguments.IsValid = false;
            return;
        }
    }

    function CheckSelectLeaveCode(source, args) {
        var leaCode = $("#<%=ddlLeaveCode.ClientID%>").val();
        var hleaCode = $("#<%=hfLeaveCode.ClientID%>").val(); 
        //沒有公司統編或員編就不跑其他驗證
        var applicantEmployeeNo = $("#<%=hfApplicantEmployeeNo.ClientID%>").val();
        var applicantCompanyNo = $("#<%=hfApplicantCompanyNo.ClientID%>").val();
        if (applicantEmployeeNo === '' || applicantCompanyNo === '') {
            return;
        }
        if (leaCode === "" || leaCode === null)
        {
            args.IsValid = false;
            return;
        }
        else if (hleaCode === "" || hleaCode === null) {
            args.IsValid = false;
            return;
        }
    }

    function ValidateApply_<%=ClientID%>(source, arguments) {

        var startDate = $find("<%=rdStartDate.ClientID%>").get_dateInput().get_value();
        var endDate = $find("<%=rdEndDate.ClientID%>").get_dateInput().get_value();
        var startTime = $find("<%=rdStartTime.ClientID%>").get_dateInput().get_value();
        var endTime = $find("<%=rdEndTime.ClientID%>").get_dateInput().get_value();
        var eventDate = $find("<%=rdEventDate.ClientID%>").get_dateInput().get_value();
        var applicantEmployeeNo = $("#<%=hfApplicantEmployeeNo.ClientID%>").val();
        var applicantCompanyNo = $("#<%=hfApplicantCompanyNo.ClientID%>").val();
        var reason = $("#<%=txtReason.ClientID%>").val();
        var leaCode = $("#<%=ddlLeaveCode.ClientID%>").val();
        var agnetJSON = '';
        var agentMobile = $("#<%=UC_ChoiceListMobile.ClientID%>_hiddenSelected").val();
        
        var result = '';

        var data = [$("#<%=hfFormNumber.ClientID%>").val()];
        var totalHour = $("#<%=txtHours.ClientID%>").val();

        if (leaCode == null || leaCode === "") return "";

        if ($("#<%=hfFieldMode.ClientID%>").val() === "ReturnApplicant" || $("#<%=hfFieldMode.ClientID%>").val() === "Signin")
        {
            $uof.pageMethod.syncUc("EIP/Duty/WKFOptionalFields104/LeaveInfoUC.ascx", "UpdateStatus", data);
        }

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

        //沒有公司統編或員編就不跑其他驗證
        if (applicantEmployeeNo === '' || applicantCompanyNo === '') {
            return;
        }

        data = [applicantCompanyNo, applicantEmployeeNo, agnetJSON, startDate, startTime, endDate, endTime, leaCode, reason, eventDate, 'true', totalHour, isAgentRangeSetting];
        result = $uof.pageMethod.syncUc("EIP/Duty/WKFOptionalFields104/LeaveInfoUC.ascx", "ValidateApply", data);
        
        if(result !== '')
        {
            source.textContent = result;
            arguments.IsValid = false;
            return;
        }
    }


    //驗證代理人必填
    function ValidateAgent_<%=ClientID%>(source, arguments) {


        var agnetJSON;
        var is_Mark = "<%=lblMark.Visible%>";
        var agentMobile = $("#<%=UC_ChoiceListMobile.ClientID%>_hiddenSelected").val();

        var isAgentRangeSetting = $("#<%= hfIsAgentRangeSetting.ClientID %>").val();

        // 職務代理人的選人範圍，是否為"申請者個人設定中的代理人"
        if (isAgentRangeSetting.toLowerCase() == 'true') {

            if ($('#<%=hfIsAgentUnavailable.ClientID %>').val().toLowerCase() == 'true') {
                arguments.IsValid = false;
                return;
            }

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

        var data = [is_Mark, agnetJSON, 'Mobile', isAgentRangeSetting];

        var result = $uof.pageMethod.syncUc("EIP/Duty/WKFOptionalFields104/LeaveInfoUC.ascx", "ValidateAgent", data);

        if (result === '') {
            arguments.IsValid = false;
            return;
        }
    }

    //驗證代理人帳號是否無效
    function ValidateAgentAccount_<%=ClientID%>(source, arguments) {
        var agnetJSON;
        lblAgent = $('#<%=lblAgent.ClientID %>').text();
        lblErrMsg1 = $('#<%=lblErrMsg1.ClientID %>').text();
        var cvRequiredAgentAccount = $("#<%=cvRequiredAgentAccount.ClientID %>");

        var isAgentRangeSetting = $("#<%= hfIsAgentRangeSetting.ClientID %>").val();

        // 職務代理人的選人範圍，是否為"申請者個人設定中的代理人"
        if (isAgentRangeSetting.toLowerCase() == 'true') {
            agnetJSON = $('#<%=hfAgentXML.ClientID %>').val();
        }
        else {
            var agentMobile = $("#<%=UC_ChoiceListMobile.ClientID%>_hiddenSelected").val().toString();
            if (typeof agentMobile !== "undefined" && agentMobile !== "") {
                var selectedArray = agentMobile.split(",");
                var array = new Array(selectedArray.length);

                for (var i = 0; i < selectedArray.length; i++) {
                    array[i] = selectedArray[i].split("|")[1];
                }
                agnetJSON = $uof.json.toString(array);
            }
        }

        var data = [agnetJSON, 'Mobile', isAgentRangeSetting];

        var result = $uof.pageMethod.syncUc("EIP/Duty/WKFOptionalFields104/LeaveInfoUC.ascx", "ValidateAgentAccount", data);

        if (result != '') {
            var errMsgAgent = "";
            errMsgAgent = result + lblErrMsg1;
            cvRequiredAgentAccount.text(errMsgAgent);
            arguments.IsValid = false;
            return;
        }
    }

    //驗證代理人是否包含自己
    function ValidateIncludeApplyUser_<%=ClientID%>(source, arguments) {

        var isAgentRangeSetting = $("#<%= hfIsAgentRangeSetting.ClientID %>").val();

        // 職務代理人的選人範圍，是否不為"申請者個人設定中的代理人"
        if (isAgentRangeSetting.toLowerCase() != 'true') {
            var agnetJSON;
            var applicantGuid = $("#<%=hfApplicant.ClientID%>").val();
            lblIncludeApplyUser = $('#<%=lblIncludeApplyUser.ClientID %>').text();
            var cvIsInculdeApplyUser = $("#<%=cvIsInculdeApplyUser.ClientID %>");
            var agentMobile = $("#<%=UC_ChoiceListMobile.ClientID%>_hiddenSelected").val().toString();
            if (typeof agentMobile !== "undefined" && agentMobile !== "") {
                var selectedArray = agentMobile.split(",");
                var array = new Array(selectedArray.length);

                for (var i = 0; i < selectedArray.length; i++) {
                    array[i] = selectedArray[i].split("|")[1];
                }
                agnetJSON = $uof.json.toString(array);
            }
            var data = [agnetJSON, 'Mobile', applicantGuid ];

            var result = $uof.pageMethod.syncUc("EIP/Duty/WKFOptionalFields104/LeaveInfoUC.ascx", "IsIncludeApplyUser", data);

            if (result == '') {
                var errMsgAgent = "";
                errMsgAgent = lblIncludeApplyUser;
                cvIsInculdeApplyUser.text(errMsgAgent);
                arguments.IsValid = false;
                return;
            }
        }
        else {
            arguments.IsValid = true;
            return;
        }
    }

    //驗證是否超過申請期限
    function ValidateLeaveLimit_<%=ClientID%>(source, arguments) {
        lblLeaveBefore = $('#<%=lblLeaveBefore.ClientID %>').text();
        lblLeaveAfter = $('#<%=lblLeaveAfter.ClientID %>').text();
        lblLimitBeforeErrMsg = $('#<%=lblLimitBeforeErrMsg.ClientID %>').text();
        lblLimitAfterErrMsg = $('#<%=lblLimitAfterErrMsg.ClientID %>').text();
        var fieldMode = $("#<%= hfFieldMode.ClientID %>").val();
        var applyDate = $("#<%= hfApplyDate.ClientID %>").val();
        var startDate = $find("<%=rdStartDate.ClientID%>").get_dateInput().get_value();
        var endDate = $find("<%=rdEndDate.ClientID%>").get_dateInput().get_value();
        var cvLeaveLimit = $("#<%=cvLeaveLimit.ClientID %>");
        var data = [startDate, endDate, fieldMode, applyDate];
        var limitErrMsg = "";
        var result = $uof.pageMethod.syncUc("EIP/Duty/WKFOptionalFields104/LeaveInfoUC.ascx", "ValidateLeaveLimit", data);
        if (result != '') {
            var resultArray = result.split(",");

            if (resultArray[0] == 'BeforeLimitErr') {
                limitErrMsg = lblLeaveBefore + resultArray[1] + lblLimitBeforeErrMsg;
                cvLeaveLimit.text(limitErrMsg);
                arguments.IsValid = false;
                return;
            }
            else if (resultArray[0] == 'AfterLimitErr') {
                limitErrMsg = lblLeaveAfter + resultArray[1] + lblLimitAfterErrMsg;
                cvLeaveLimit.text(limitErrMsg);
                arguments.IsValid = false;
                return;
            }
        }
    }

    function ValidateMissingInfo_<%=ClientID%>(source, arguments) {
        var applicant = $("#<%=hfApplicant.ClientID%>").val();
        var data = [applicant]
        var result = $uof.pageMethod.syncUc("EIP/Duty/WKFOptionalFields104/LeaveInfoUC.ascx", "ValidateMissingInfo", data);
        if (result === '') {
            arguments.IsValid = false;
            return;
        }
    }

    function CalBtnClick_<%=ClientID%>(sender, args)
    {
        CalLeaveHours_<%=ClientID%>();
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
<asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>
        <%--style="width:100% 會讓畫面出現scrollBar--%>
        <table class="LeaveTable104" style="width: 99%">
            <tr>
                <td style="white-space: nowrap">
                    <asp:Label ID="Label1" runat="server" Text="假別" meta:resourcekey="Label1Resource1"></asp:Label>
                    <asp:Label ID="Label8" runat="server" Text="*" ForeColor="Red" meta:resourcekey="Label8Resource1"></asp:Label>                    
                </td>
                <td align="right" style="white-space: nowrap">
                    <asp:LinkButton ID="lbtnUserLeaveData" runat="server" Text="可休假餘額" meta:resourcekey="lbtnUserLeaveDataResource1"></asp:LinkButton>
                </td>
            </tr>
            <tr>
                <td colspan="2" style="white-space: nowrap">
                    <table style="width: 100%">
                        <tr>
                            <td>
                                <asp:Label ID="lblLeaveCode" runat="server" Visible="False" meta:resourcekey="lblLeaveCodeResource1"></asp:Label>
                                <asp:DropDownList ID="ddlLeaveCode" Width="99%" runat="server" EnableTheming="True" meta:resourcekey="ddlLeaveCodeResource1">
                                </asp:DropDownList>
                                <asp:HiddenField ID="hfLeaveCode" runat="server" />
                               
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                 <asp:Label ID="lblUnavailable" runat="server" Text="選擇假別已不適用，請通知管理員至104系統中檢查相關設定" Visible="false" ForeColor="Blue" meta:resourcekey="lblUnavailableResource1"></asp:Label>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td colspan="2" style="white-space: nowrap">
                    <asp:Label ID="Label2" runat="server" Text="請假時間(起)" meta:resourcekey="Label2Resource1"></asp:Label>
                    <asp:Label ID="Label9" runat="server" Text="*" ForeColor="Red" meta:resourcekey="Label9Resource1"></asp:Label>
                </td>
            </tr>
            <tr>
                <td colspan="2">
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
                <td colspan="2" style="white-space: nowrap">
                    <asp:Label ID="Label3" runat="server" Text="請假時間(訖)" meta:resourcekey="Label3Resource1"></asp:Label>
                    <asp:Label ID="Label10" runat="server" Text="*" ForeColor="Red" meta:resourcekey="Label10Resource1"></asp:Label>
                </td>
            </tr>
            <tr>
                <td colspan="2">
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
            <tr id="tdlblEventDate" style="white-space: nowrap">
                <td colspan="2">
                    <asp:Label ID="Label5" runat="server" Text="事件發生日" meta:resourcekey="Label5Resource1"></asp:Label>
                    <asp:Label ID="lblEventDateStar" runat="server" Text="*" ForeColor="Red" Style="display: none" meta:resourcekey="lblEventDateStarResource1"></asp:Label>
                </td>
            </tr>
            <tr id="tdEventDate">
                <td colspan="2">
                    <asp:Label ID="lblEventDate" runat="server" meta:resourcekey="lblEventDateResource1"></asp:Label>
                    <telerik:RadDatePicker ID="rdEventDate" runat="server" EnableTheming="True" meta:resourcekey="rdEventDateResource1">
                    </telerik:RadDatePicker>
                </td>
            </tr>
            <tr>
                <td colspan="2" style="white-space: nowrap">
                    <asp:Label ID="Label4" runat="server" Text="請假時(天)數" meta:resourcekey="Label4Resource1"></asp:Label>
                    <asp:Label ID="Label11" runat="server" Text="*" ForeColor="Red" meta:resourcekey="Label11Resource1"></asp:Label>
                </td>
            </tr>
            <tr>
                <td colspan="2" >
                    <table>
                        <tr>
                            <td>
                                <asp:Label ID="lblHours" runat="server" meta:resourcekey="lblHoursResource1"></asp:Label>
                                <asp:TextBox ID="txtHours" runat="server" Style="display: none" meta:resourcekey="txtHoursResource1"></asp:TextBox>
                                <asp:TextBox ID="txtUnit" runat="server" Style="display: none" meta:resourcekey="txtUnitResource1"></asp:TextBox>
                            </td>
                            <td>
                                <telerik:RadButton ID="rdbtnCal" CausesValidation="False" OnClientClicked="CalBtnClick" runat="server" Text="計算" AutoPostBack="False" meta:resourcekey="rdbtnCalResource1">
                                </telerik:RadButton>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td colspan="2" style="white-space: nowrap">
                    <asp:Label ID="Label7" runat="server" Text="事由" meta:resourcekey="Label7Resource1"></asp:Label>
                    <asp:Label ID="lblRemartTitleRequired" runat="server" ForeColor="Red" Text="*" Visible="false"></asp:Label>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:Label ID="lblReason" runat="server" CssClass="labelMutiline" Visible="False" meta:resourcekey="lblReasonResource1"></asp:Label>
                    <asp:TextBox ID="txtReason" runat="server" Width="100%" TextMode="MultiLine" Rows="3" meta:resourcekey="txtReasonResource1"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td colspan="2" style="white-space: nowrap">
                    <asp:Label ID="lblAgent" runat="server" Text="職務代理人" meta:resourcekey="lblAgentResource1"></asp:Label>
                    <asp:Label ID="lblMark" runat="server" Text="*" ForeColor="Red" Visible="False" meta:resourcekey="lblMarkResource1"></asp:Label>
                    <asp:CustomValidator ID="cvRequiredAgent" runat="server" ErrorMessage="不允許空白" ForeColor="Red" Display="Dynamic" meta:resourcekey="cvRequiredAgentResource1"></asp:CustomValidator>  
                    <asp:CustomValidator ID="cvRequiredAgentAccount" runat="server"  ForeColor="Red" Display="Dynamic" EnableTheming="True" meta:resourcekey="cvRequiredAgentAccountResource1" ></asp:CustomValidator>
                    <asp:Label runat="server" ID="lblAgentAccount" ForeColor="Blue" Visible="false"></asp:Label>
                </td>             
            </tr>
            <tr>
                <td colspan="2">
                    <uc2:UC_ChoiceListMobile runat="server" ID="UC_ChoiceListMobile" ChioceType="User" />
                    <div style="display: none">
                        <uc1:UC_ChoiceList runat="server" ID="UC_ChoiceList" ChioceType="User" />
                    </div>

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
                    <asp:CustomValidator ID="cvShowLeaveCodeError" runat="server" Display="Dynamic" meta:resourcekey="cvShowLeaveCodeErrorResource1"></asp:CustomValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:CustomValidator ID="cvMissingInfo" runat="server" ErrorMessage="申請者無員工編號或公司統一編號資訊" Display="Dynamic" EnableTheming="True" Co meta:resourcekey="cvMissingInfoResource1"></asp:CustomValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:CustomValidator ID="cvCheckSelectLeaveCode" runat="server" ErrorMessage="請選擇假別" Display="Dynamic" ForeColor="Red" ClientValidationFunction="CheckSelectLeaveCode" SetFocusOnError="True" meta:resourcekey="cvCheckSelectLeaveCodeResource1"></asp:CustomValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:CustomValidator ID="cvCal" runat="server" ErrorMessage="請計算請假時(天)數" Display="Dynamic" EnableTheming="True" meta:resourcekey="cvCalResource1"></asp:CustomValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:CustomValidator ID="cvRemark" runat="server" Display="Dynamic" EnableTheming="True" ForeColor="Red" ErrorMessage="事由不可空白" Visible="False" ClientValidationFunction="CheckRemarkRequired" meta:resourcekey="cvRemarkResource1"></asp:CustomValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:TextBox ID="txtError" runat="server" Style="display: none; width: 300px; border-width: 0;" ForeColor="Red" meta:resourcekey="txtErrorResource1"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:CustomValidator ID="cvApply" runat="server" Display="Dynamic" EnableTheming="True" meta:resourcekey="cvApplyResource1"></asp:CustomValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:CustomValidator ID="cvLeaveLimit" runat="server" Display="Dynamic" EnableTheming="True" meta:resourcekey="cvLeaveLimit" ></asp:CustomValidator>
                </td>
            </tr>
            <tr>
                <td>
                   <asp:CustomValidator ID="cvIsInculdeApplyUser" runat="server"  ForeColor="Red" Display="Dynamic" meta:resourcekey="cvIsInculdeApplyUserResource1" ></asp:CustomValidator>
                </td>
            </tr>
        </table>

        <asp:HiddenField ID="hfAgentRange" runat="server" />
        <asp:HiddenField ID="hfIsAgentRangeSetting" runat="server" Value="false"/>
        <asp:HiddenField ID="hfIsAgentUnavailable" runat="server" Value="false"/>
        <asp:HiddenField ID="hfBaseApplicantGroupId" runat="server" Value=""/>

    </ContentTemplate>
</asp:UpdatePanel>
<asp:Label ID="lblSelect" runat="server" Text="請選擇" Visible="False" meta:resourcekey="lblSelectResource1" ></asp:Label>
<asp:Label ID="lblCal" runat="server" Text="請先計算請假時(天)數" Visible="False" meta:resourcekey="lblCalResource1" ></asp:Label>
<asp:Label ID="lblHasNoAuthority" runat="server" Text="無填寫權限" ForeColor="Red" Visible="False" meta:resourcekey="lblHasNoAuthorityResource1"></asp:Label>
<asp:Label ID="lblToolTipMsg" runat="server" Text="不允許修改(唯讀)" Visible="False" meta:resourcekey="lblToolTipMsgResource1"></asp:Label>            
<asp:Label ID="lblFiller" CssClass="FillerVisible" runat="server" meta:resourcekey="lblFillerResource1"></asp:Label>
<asp:Label ID="lblModifier" runat="server" Visible="False" meta:resourcekey="lblModifierResource1"></asp:Label>
<asp:Label ID="lblMsgSigner" runat="server" Text="填寫者" Visible="False" meta:resourcekey="lblMsgSignerResource1"></asp:Label>            
<asp:Label ID="lblMsgEditor" runat="server" Text="修改者" Visible="False" meta:resourcekey="lblMsgEditorResource1"></asp:Label>
<asp:Label ID="lblAuthorityMsg" runat="server" Text="具填寫權限人員" Visible="False" meta:resourcekey="lblAuthorityMsgResource1"></asp:Label>
<asp:Label ID="lblLeaveBefore" runat="server" Text="需於請假開始日期前" Style="display: none" meta:resourcekey="lblLeaveBeforeResource1"></asp:Label>
<asp:Label ID="lblLeaveAfter" runat="server" Text="需於請假結束日期後" Style="display: none" meta:resourcekey="lblLeaveAfterResource1"></asp:Label>
<asp:Label ID="lblLimitBeforeErrMsg" runat="server" Text="日提出申請，已超出申請期限" Style="display: none" meta:resourcekey="lblLimitBeforeErrMsgResource1"></asp:Label>
<asp:Label ID="lblLimitAfterErrMsg" runat="server" Text="日提出申請，已超出申請期限" Style="display: none" meta:resourcekey="lblLimitAfterErrMsgResource1"></asp:Label>
<asp:Label ID="lblErrMsg1" runat="server" Text="帳號已停用，請重新選擇職務代理人。" Style="display: none" meta:resourcekey="lblErrMsg1Resource1"></asp:Label>
<asp:Label ID="lblPauseMsg" runat="server" Text="帳號已停用。" Visible="false" meta:resourcekey="lblPauseMsgResource1"></asp:Label>
<asp:Label ID="lblIncludeApplyUser" runat="server" Text="職務代理人與申請者不可相同" Style="display: none" meta:resourcekey="llblIncludeApplyUserResource1"></asp:Label>
<asp:HiddenField ID="hfApplicantEmployeeNo" runat="server" />
<asp:HiddenField ID="hfApplicantCompanyNo" runat="server" />
<asp:HiddenField ID="hfApplicant" runat="server" />
<asp:HiddenField ID="hfFieldMode" runat="server" />
<asp:HiddenField ID="hfFormNumber" runat="server" />
<asp:HiddenField ID="hfApplyDate" runat="server" />

