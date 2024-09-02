<%@ Control Language="C#" AutoEventWireup="true" Inherits="WKF_OptionalFields_RenewPunchInfoUCV2" CodeBehind="RenewPunchInfoUCV2.ascx.cs" %>
<%@ Reference Control="~/WKF/FormManagement/VersionFieldUserControl/VersionFieldUC.ascx" %>

<style type="text/css">
    .style1 {
        width: 100%;
    }

    .style2 {
        width: 80px;
        height: 20px;
    }

    .style3 {
        height: 20px;
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


    function CheckUnlock(source, arguments) {
        var applicantGuid = $("#<%=hfApplicantGuid.ClientID %>").val();
        var Contrl = '<%=rdBelongDate.ClientID%>';
        var obj = $find(Contrl).get_selectedDate();
        if (obj != null) {
            obj = obj.format('yyyy/MM/dd');
        }
        else {            
            return;
        }        
        var data = [obj, applicantGuid];
        var result = $uof.pageMethod.syncUc("EIP/Duty/WKFOptionalFields/RenewPunchInfoUCV2.ascx", "IsUnlock", data);
        if (result == 'true') {
            arguments.IsValid = true;
        }
        else {
            arguments.IsValid = false;
        }
    }

    function CheckTime(source, arguments) {
        var applicantGuid = $("#<%=hfApplicantGuid.ClientID %>").val();
        var rbClearPunch = $('#<%=rbClearPunch.ClientID%>').prop("checked") ? true : false;
        if (rbClearPunch == true) return;

        var cbWork = $('#<%=cbWorkPunch.ClientID%>').prop("checked") ? true : false;
        var cbOff = $('#<%=cbOffPunch.ClientID%>').prop("checked") ? true : false;
        if (cbWork == false && cbOff == false) return;

        var offTime = '<%=rdOffTime.ClientID%>';
        var offTimeObj = $find(offTime).get_selectedDate();
        if (offTimeObj != null) offTimeObj = offTimeObj.format('HH:mm');

        var Date = '<%=rdOffDate.ClientID%>';
        var DateObj = $find(Date).get_selectedDate();
        if (DateObj != null) DateObj = DateObj.format('yyyy/MM/dd');

        if (DateObj == null || offTimeObj == null) return;

        var data = [offTimeObj, DateObj, applicantGuid];
        var result = $uof.pageMethod.syncUc("EIP/Duty/WKFOptionalFields/RenewPunchInfoUCV2.ascx", "CompareTime", data);
        if (result == 'true') {
            arguments.IsValid = true;
        }
        else {
            arguments.IsValid = false;
        }
    }

    function CheckTime1(source, arguments) {
        var applicantGuid = $("#<%=hfApplicantGuid.ClientID %>").val();
        var rbClearPunch = $('#<%=rbClearPunch.ClientID%>').prop("checked") ? true : false;
        if (rbClearPunch == true) return;

        var cbWork = $('#<%=cbWorkPunch.ClientID%>').prop("checked") ? true : false;
        var cbOff = $('#<%=cbOffPunch.ClientID%>').prop("checked") ? true : false;
        if (cbWork == false && cbOff == false) return;

        var workTime = '<%=rdWorkTime.ClientID%>';
        var workTimeObj = $find(workTime).get_selectedDate();
        if (workTimeObj != null) workTimeObj = workTimeObj.format('HH:mm');

        var Date = '<%=rdWorkDate.ClientID%>';
        var DateObj = $find(Date).get_selectedDate();
        if (DateObj != null) DateObj = DateObj.format('yyyy/MM/dd');

        if (DateObj == null || workTime == null) return;

        var data = [workTimeObj, DateObj, applicantGuid];
        var result = $uof.pageMethod.syncUc("EIP/Duty/WKFOptionalFields/RenewPunchInfoUCV2.ascx", "CompareTime", data);
        if (result == 'true') {
            arguments.IsValid = true;
        }
        else {
            arguments.IsValid = false;
        }
    }

    function CheckDate(source, arguments) {

        var rbClearPunch = $('#<%=rbClearPunch.ClientID%>').attr("checked") ? true : false;
        if (rbClearPunch) return;

        var applicantGuid = $("#<%=hfApplicantGuid.ClientID %>").val();
        var Contrl = '<%=rdBelongDate.ClientID%>';
        var obj = $find(Contrl).get_selectedDate();
        if (obj != null) {
            obj = obj.format('yyyy/MM/dd');
        }
        else {
            return;
        }

        var data = [obj, applicantGuid];
        var result = $uof.pageMethod.syncUc("EIP/Duty/WKFOptionalFields/RenewPunchInfoUCV2.ascx", "CompareDate", data);
        if (result == 'true') {
            arguments.IsValid = true;
        }
        else {
            arguments.IsValid = false;
        }
    }

    function CheckRenewType(source, arguments) {

        var cbWork = $('#<%=cbWorkPunch.ClientID%>').prop("checked") ? true : false;
        var cbOff = $('#<%=cbOffPunch.ClientID%>').prop("checked") ? true : false;
        var rbRenewPunch = $('#<%=rbRenewPunch.ClientID%>').prop("checked") ? true : false;
        if (rbRenewPunch == true) {
            if (cbWork == false && cbOff == false) {
                arguments.IsValid = false;
            }
            else {
                arguments.IsValid = true;
            }
        }
    }

    //與現有資料比較上班時間不能比下班時間大
    function CheckPunchTimeWork(source, arguments) {
        var applicantGuid = $("#<%=hfApplicantGuid.ClientID %>").val();
        var belongDateObj = $find('<%=rdBelongDate.ClientID%>').get_selectedDate();
        if (belongDateObj != null) {
            belongDateObj = belongDateObj.format('yyyy/MM/dd');
        }
        else {
            return;
        }

        var Date = '<%=rdWorkDate.ClientID%>';
        var DateObj = $find(Date).get_selectedDate();
        if (DateObj != null) DateObj = DateObj.format('yyyy/MM/dd');

        var cbWork = $('#<%=cbWorkPunch.ClientID%>').prop("checked") ? true : false;
        var cbOff = $('#<%=cbOffPunch.ClientID%>').prop("checked") ? true : false;
        var rbRenewPunch = $('#<%=rbRenewPunch.ClientID%>').prop("checked") ? true : false;

        var workTime = '<%=rdWorkTime.ClientID%>';
        var workTimeObj = $find(workTime).get_selectedDate();
        if (workTimeObj != null) workTimeObj = workTimeObj.format('HH:mm');

        var offTime = '<%=rdOffTime.ClientID%>';
        var offTimeObj = $find(offTime).get_selectedDate();
        if (offTimeObj != null) offTimeObj = offTimeObj.format('HH:mm');

        var result = "false";
        if (rbRenewPunch == true) {
            //上下都刷本身有判斷大小了，所以只有單一的才要跟資料比
            if (cbWork == true && cbOff == false) {
                var data = [applicantGuid, DateObj, workTimeObj, "work", belongDateObj];
                result = $uof.pageMethod.syncUc("EIP/Duty/WKFOptionalFields/RenewPunchInfoUCV2.ascx", "CheckIFPunchTimeWorkOff", data);
            }
        }

        if (result == 'false') {
            arguments.IsValid = true;
        }
        else {
            arguments.IsValid = false;
        }
    }

    //與現有資料比較上班時間不能比下班時間大
    function CheckPunchTimeOff(source, arguments) {
        var applicantGuid = $("#<%=hfApplicantGuid.ClientID %>").val();
        var belongDateObj = $find('<%=rdBelongDate.ClientID%>').get_selectedDate();
        if (belongDateObj != null) {
            belongDateObj = belongDateObj.format('yyyy/MM/dd');
        }
        else {
            return;
        }

        var Date = '<%=rdOffDate.ClientID%>';
        var DateObj = $find(Date).get_selectedDate();
        if (DateObj != null) DateObj = DateObj.format('yyyy/MM/dd');

        var cbWork = $('#<%=cbWorkPunch.ClientID%>').prop("checked") ? true : false;
        var cbOff = $('#<%=cbOffPunch.ClientID%>').prop("checked") ? true : false;
        var rbRenewPunch = $('#<%=rbRenewPunch.ClientID%>').prop("checked") ? true : false;

        var workTime = '<%=rdWorkTime.ClientID%>';
        var workTimeObj = $find(workTime).get_selectedDate();
        if (workTimeObj != null) workTimeObj = workTimeObj.format('HH:mm');

        var offTime = '<%=rdOffTime.ClientID%>';
        var offTimeObj = $find(offTime).get_selectedDate();
        if (offTimeObj != null) offTimeObj = offTimeObj.format('HH:mm');

        var result = "false";
        if (rbRenewPunch == true) {
            //上下都刷本身有判斷大小了，所以只有單一的才要跟資料比
            if (cbOff == true && cbWork == false) {
                var data = [applicantGuid, DateObj, offTimeObj, "off", belongDateObj];
                result = $uof.pageMethod.syncUc("EIP/Duty/WKFOptionalFields/RenewPunchInfoUCV2.ascx", "CheckIFPunchTimeWorkOff", data);
            }
        }

        if (result == 'false') {
            arguments.IsValid = true;
        }
        else {
            arguments.IsValid = false;
        }
    }

    function CheckPunchTime(source, arguments) {

        var workTime = '<%=rdWorkTime.ClientID%>';
        var offTime = '<%=rdOffTime.ClientID%>';

        var workTimeObj = $find(workTime).get_selectedDate();
        if (workTimeObj != null) workTimeObj = workTimeObj.format('HH:mm');

        var offTimeObj = $find(offTime).get_selectedDate();
        if (offTimeObj != null) offTimeObj = offTimeObj.format('HH:mm');

        var workDate = '<%=rdWorkDate.ClientID%>';
        var workDateObj = $find(workDate).get_selectedDate();
        if (workDateObj != null) workDateObj = workDateObj.format('yyyy/MM/dd');

        var offDate = '<%=rdOffDate.ClientID%>';
        var offDateObj = $find(offDate).get_selectedDate();
        if (offDateObj != null) offDateObj = offDateObj.format('yyyy/MM/dd');

        if (workTimeObj != null && offTimeObj != null && workDateObj != null && offDateObj != null) {
            var data = [workDateObj, workTimeObj, offDateObj, offTimeObj];
            var result = $uof.pageMethod.syncUc("EIP/Duty/WKFOptionalFields/RenewPunchInfoUCV2.ascx", "CompareActualDate", data);
            if (result == 'true') {
                arguments.IsValid = true;
            }
            else {
                arguments.IsValid = false;
            }
        }
    }

    function CheckWorkBelong(source, arguments) {

        var belongDate = '<%=rdBelongDate.ClientID%>';
        var belongDateObj = $find(belongDate).get_selectedDate();
        if (belongDateObj != null) {
            belongDateObj = belongDateObj.format('yyyy/MM/dd');
        }
        else {
            return;
        }

        var workDate = '<%=rdWorkDate.ClientID%>';
        var workDateObj = $find(workDate).get_selectedDate();
        if (workDateObj != null) workDateObj = workDateObj.format('yyyy/MM/dd');

        if (belongDateObj != null && workDateObj != null) {
            var data = [belongDateObj, workDateObj, 'work'];
            var result = $uof.pageMethod.syncUc("EIP/Duty/WKFOptionalFields/RenewPunchInfoUCV2.ascx", "CompareBelongAndActual", data);
            if (result == 'true') {
                arguments.IsValid = true;
            }
            else {
                arguments.IsValid = false;
            }
        }
    }

    function CheckOffBelong(source, arguments) {

        var belongDate = '<%=rdBelongDate.ClientID%>';
        var belongDateObj = $find(belongDate).get_selectedDate();
        if (belongDateObj != null) {
            belongDateObj = belongDateObj.format('yyyy/MM/dd');
        }
        else {
            return;
        }

        var offDate = '<%=rdOffDate.ClientID%>';
        var offDateObj = $find(offDate).get_selectedDate();
        if (offDateObj != null) offDateObj = offDateObj.format('yyyy/MM/dd');

        if (belongDateObj != null && offDateObj != null) {
            var data = [belongDateObj, offDateObj, 'off'];
            var result = $uof.pageMethod.syncUc("EIP/Duty/WKFOptionalFields/RenewPunchInfoUCV2.ascx", "CompareBelongAndActual", data);
            if (result == 'true') {
                arguments.IsValid = true;
            }
            else {
                arguments.IsValid = false;
            }
        }
    }


    function ChangeBelong() {
        var belongDate = $find("<%=rdBelongDate.ClientID%>")
        var workDate = $find("<%=rdWorkDate.ClientID%>");
        var offDate = $find("<%=rdOffDate.ClientID%>");

        var cbWork = $('#<%=cbWorkPunch.ClientID%>').prop("checked") ? true : false;
        var cbOff = $('#<%=cbOffPunch.ClientID%>').prop("checked") ? true : false;

        if (cbWork == true) {
            belongDate.set_selectedDate(workDate.get_selectedDate());
        }
        else if (cbOff == true) {
            belongDate.set_selectedDate(offDate.get_selectedDate());
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
        <asp:Panel ID="Panel1" runat="server" meta:resourcekey="Panel1Resource1">
            <table class="PopTable" cellpadding="0" cellspacing="0" style="width: 500px">
                <tr class="trTimeZone">
                    <td class="popTableLeftTD" style="white-space: nowrap;">
                        <asp:Label ID="Label9" runat="server"  Text="歸屬地點時區" meta:resourcekey="Label9Resource1"></asp:Label>
                    </td>
                    <td class="popTableRightTD" colspan="3">
                        <asp:Label ID="lblOfficePlace" runat="server" Text=""></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td rowspan="2" class="PopTableLeftTD" nowrap="nowrap" style="width: 15%">
                        <asp:Label ID="Label3" runat="server" ForeColor="Red" Text="*" meta:resourcekey="Label3Resource1"></asp:Label>
                        <asp:Label ID="Label2" runat="server" Text="補刷卡狀態" meta:resourcekey="Label2Resource1"></asp:Label>
                    </td>
                    <td class="PopTableRightTD" style="width: 85%">
                        <table class="style1">
                            <tr>
                                <td rowspan="2" style="width: 60px; white-space: nowrap; vertical-align: middle;">
                                    <asp:RadioButton ID="rbRenewPunch" runat="server" AutoPostBack="True" GroupName="Type"
                                        OnCheckedChanged="rbRenewPunch_CheckedChanged1" Text="補刷卡" meta:resourcekey="rbRenewPunchResource1" />
                                </td>
                                <td style="width: 80px; white-space: nowrap;">
                                    <asp:CheckBox ID="cbWorkPunch" runat="server" AutoPostBack="True" OnCheckedChanged="cbWorkPunch_CheckedChanged1"
                                        Text="補上班卡" meta:resourcekey="cbWorkPunchResource1" />
                                </td>
                                <td>
                                    <table class="style1">
                                        <tr>
                                            <td>
                                                <telerik:RadDatePicker ID="rdWorkDate" runat="server" SkinID="AllowEmpty" EnableTheming="true" meta:resourcekey="rdWorkDateResource1">
                                                    
                                                </telerik:RadDatePicker>
                                            </td>
                                            <td style="width: 5px;" align="center"></td>
                                            <td>
                                                <telerik:RadTimePicker ID="rdWorkTime" runat="server" SkinID="AllowEmpty" Width="100px" EnableTheming="true" meta:resourcekey="rdWorkTimeResource1">
                                                </telerik:RadTimePicker>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                                <td style="white-space: nowrap;">
                                    <asp:RequiredFieldValidator ID="rfvWorkDate" runat="server" Display="Dynamic" ErrorMessage="請輸入日期" ForeColor="Red" ControlToValidate="rdWorkDate" meta:resourcekey="rfvWorkDateResource1"></asp:RequiredFieldValidator>
                                    <br />
                                    <asp:RequiredFieldValidator ID="rfvWorkTime" runat="server" ControlToValidate="rdWorkTime" Display="Dynamic" ForeColor="Red" ErrorMessage="請輸入時間" meta:resourcekey="rfvWorkTimeResource1"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td class="style2" style="width: 80px; white-space: nowrap;">
                                    <asp:CheckBox ID="cbOffPunch" runat="server" AutoPostBack="True" OnCheckedChanged="cbOffPunch_CheckedChanged1" Text="補下班卡" meta:resourcekey="cbOffPunchResource1" />
                                </td>
                                <td class="style3">
                                    <table class="style1">
                                        <tr>
                                            <td>
                                                <telerik:RadDatePicker ID="rdOffDate" runat="server" SkinID="AllowEmpty" EnableTheming="true" meta:resourcekey="rdOffDateResource1">
                                                    
                                                </telerik:RadDatePicker>
                                            </td>
                                            <td style="width: 5px;" align="center"></td>
                                            <td>
                                                <telerik:RadTimePicker ID="rdOffTime" runat="server" SkinID="AllowEmpty" Width="100px" EnableTheming="true" meta:resourcekey="rdOffTimeResource1">
                                                </telerik:RadTimePicker>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                                <td style="white-space: nowrap;">
                                    <asp:RequiredFieldValidator ID="rfvOffDate" runat="server" ControlToValidate="rdOffDate" ForeColor="Red" Display="Dynamic" ErrorMessage="請輸入日期" meta:resourcekey="rfvOffDateResource1"></asp:RequiredFieldValidator>
                                    <br />
                                    <asp:RequiredFieldValidator ID="rfvOffTime" runat="server" ControlToValidate="rdOffTime" ForeColor="Red" Display="Dynamic" ErrorMessage="請輸入時間" meta:resourcekey="rfvOffTimeResource1"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                        </table>
                        <table cellpadding="0" cellspacing="0">
                            <tr>
                                <td>
                                    <asp:CustomValidator ID="cvRenewMessage" runat="server" ClientValidationFunction="CheckRenewType" ForeColor="Red" Display="Dynamic" ErrorMessage="補上下班卡至少須選擇一個" meta:resourcekey="cvRenewMessageResource1"></asp:CustomValidator>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:CustomValidator ID="cvRenewTime1" runat="server" ClientValidationFunction="CheckTime1" Display="Dynamic" ForeColor="Red" ErrorMessage="補上班卡時間不可晚於當日系統時間" meta:resourcekey="cvRenewTime1Resource1"></asp:CustomValidator>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:CustomValidator ID="cvRenewTime" runat="server" ClientValidationFunction="CheckTime" Display="Dynamic" ForeColor="Red" ErrorMessage="補下班卡時間不可晚於當日系統時間" meta:resourcekey="cvRenewTimeResource1"></asp:CustomValidator>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:CustomValidator ID="cvErrorTime" runat="server" ClientValidationFunction="CheckPunchTime" Display="Dynamic" ForeColor="Red" ErrorMessage="補上班卡時間不可晚於補下班卡時間" meta:resourcekey="cvErrorTimeResource1"></asp:CustomValidator>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:CustomValidator ID="cvCheckWorkData" runat="server" ClientValidationFunction="CheckPunchTimeWork" Display="Dynamic" ForeColor="Red" ErrorMessage="補上班卡時間不可比已刷下班卡時間晚" meta:resourcekey="cvCheckWorkDataResource1"></asp:CustomValidator>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:CustomValidator ID="cvCheckOffData" runat="server" ClientValidationFunction="CheckPunchTimeOff" Display="Dynamic" ForeColor="Red" ErrorMessage="補下班卡時間不可比已刷上班卡時間早" meta:resourcekey="cvCheckOffDataResource1"></asp:CustomValidator>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:CustomValidator ID="cvCheckWorkBelong" runat="server" ClientValidationFunction="CheckWorkBelong" Display="Dynamic" ForeColor="Red" ErrorMessage="補上班卡日期範圍需為歸屬日期前後一天內" meta:resourcekey="cvCheckWorkBelongResource1"></asp:CustomValidator>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:CustomValidator ID="cvCheckOffBelong" runat="server" ClientValidationFunction="CheckOffBelong" Display="Dynamic" ForeColor="Red" ErrorMessage="補下班卡日期範圍需為歸屬日期前後一天內" meta:resourcekey="cvCheckOffBelongResource1"></asp:CustomValidator>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td class="PopTableRightTD" style="text-align: left">
                        <asp:RadioButton ID="rbClearPunch" runat="server" AutoPostBack="True" GroupName="Type"
                            OnCheckedChanged="rbClearPunch_CheckedChanged1" Style="text-align: right" Text="清空當日刷卡資料"
                            meta:resourcekey="rbClearPunchResource1" />
                    </td>
                </tr>
                <tr>
                    <td class="PopTableLeftTD" nowrap="nowrap" style="width: 15%">
                        <asp:Label ID="Label4" runat="server" ForeColor="Red" Text="*" meta:resourcekey="Label4Resource1"></asp:Label>
                        <asp:Label ID="Label1" runat="server" Text="歸屬日期" meta:resourcekey="Label1Resource1"></asp:Label>
                    </td>
                    <td class="PopTableRightTD" style="width: 85%">
                        <table cellpadding="1" cellspacing="1">
                            <tr>
                                <td>
                                    <telerik:RadDatePicker ID="rdBelongDate" runat="server" AutoPostBack="true" EnableTheming="true" OnSelectedDateChanged="rdBelongDate_SelectedDateChanged" meta:resourcekey="rdBelongDateResource1">
                                    </telerik:RadDatePicker>
                                </td>
                                <td class="PopTableRightTD">
                                    <asp:RequiredFieldValidator ID="rfBelongDate" runat="server" ErrorMessage="請選擇歸屬日期<br />" ForeColor="Red" ControlToValidate="rdBelongDate" Display="Dynamic" meta:resourceKey="rfBelongDateResource1"></asp:RequiredFieldValidator>
                                    <asp:CustomValidator ID="cvRenewDate" runat="server" ClientValidationFunction="CheckDate" ForeColor="Red" Display="Dynamic" ErrorMessage="補刷卡日期不可晚於系統日期<br />" meta:resourcekey="cvRenewDateResource1"></asp:CustomValidator>
                                    <asp:CustomValidator ID="cvUnlock" runat="server" ClientValidationFunction="CheckUnlock" ForeColor="Red" Display="Dynamic" ErrorMessage="該日期已被鎖單" meta:resourcekey="cvUnlockResource1"></asp:CustomValidator>
                                </td>
                                <td>
                                    <asp:Label ID="Label7" runat="server" Text="　" meta:resourcekey="Label7Resource1"></asp:Label>
                                </td>
                                <td>
                                    <asp:LinkButton ID="lbtnUserReport" runat="server" Text="出缺勤資訊" meta:resourcekey="lbtnUserReportResource1"></asp:LinkButton>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </asp:Panel>
        <asp:Panel ID="Panel2" runat="server" Visible="False" meta:resourcekey="Panel2Resource1">
            <table class="PopTable" cellpadding="0" cellspacing="1" style="width: 300px">
                <tr class="trTimeZone">
                    <td class="popTableLeftTD">
                        <asp:Label ID="Label10" runat="server"  Text="歸屬地點" meta:resourcekey="Label9Resource1"></asp:Label>
                    </td>
                    <td class="popTableRightTD" colspan="3">
                        <asp:Label ID="lblOfficePlace2" runat="server" Text=""></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="PopTableLeftTD" nowrap="nowrap" style="width: 15%">
                        <asp:Label ID="Label6" runat="server" Text="補刷卡狀態" meta:resourcekey="Label6Resource1"></asp:Label>
                    </td>
                    <td class="PopTableRightTD" style="width: 85%">
                        <asp:Label ID="lblStatus" runat="server" meta:resourcekey="lblStatusResource1"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="PopTableLeftTD" nowrap="nowrap" style="width: 15%">
                        <asp:Label ID="Label5" runat="server" Text="歸屬日期" meta:resourcekey="Label5Resource1"></asp:Label>
                    </td>
                    <td class="PopTableRightTD">
                        <asp:Label ID="lblDate" runat="server" meta:resourcekey="lblDateResource1"></asp:Label>
                        <asp:Label ID="Label8" runat="server" Text="　" meta:resourcekey="Label8Resource1"></asp:Label>
                        <asp:LinkButton ID="lbtnUserReportForView" runat="server" Text="出缺勤資訊" meta:resourcekey="lbtnUserReportForViewResource1"></asp:LinkButton>
                    </td>
                </tr>
            </table>
        </asp:Panel>
    </ContentTemplate>
</asp:UpdatePanel>
<asp:HiddenField runat="server" ID="hfApplicantGuid"></asp:HiddenField>
<asp:HiddenField runat="server" ID="hfTimeZoneEnable"></asp:HiddenField>
<asp:LinkButton ID="lnk_Edit" runat="server" OnClick="lnk_Edit_Click" Visible="False" CausesValidation="False" meta:resourcekey="lnk_EditResource1">[修改]</asp:LinkButton>
<asp:LinkButton ID="lnk_Cannel" runat="server" OnClick="lnk_Cannel_Click" Visible="False" CausesValidation="False" meta:resourcekey="lnk_CannelResource1">[取消]</asp:LinkButton>
<asp:LinkButton ID="lnk_Submit" runat="server" OnClick="lnk_Submit_Click" Visible="False" CausesValidation="False" meta:resourcekey="lnk_SubmitResource1">[確定]</asp:LinkButton>
<asp:Label ID="lblHasNoAuthority" runat="server" Text="無填寫權限" ForeColor="Red" Visible="False" meta:resourcekey="lblHasNoAuthorityResource1"></asp:Label>
<asp:Label ID="lblToolTipMsg" runat="server" Text="不允許修改(唯讀)" Visible="False" meta:resourcekey="lblToolTipMsgResource1"></asp:Label>
<asp:Label ID="lblFiller" CssClass="FillerVisible" runat="server" meta:resourcekey="lblFillerResource1"></asp:Label>
<asp:Label ID="lblModifier" runat="server" Visible="False" meta:resourcekey="lblModifierResource1"></asp:Label>
<asp:Label ID="lblMsgSigner" runat="server" Text="填寫者" Visible="False" meta:resourcekey="lblMsgSignerResource1"></asp:Label>
<asp:Label ID="lblMsgEditor" runat="server" Text="修改者" Visible="False" meta:resourcekey="lblMsgEditorResource1"></asp:Label>
<asp:Label ID="lblAuthorityMsg" runat="server" Text="具填寫權限人員" Visible="False" meta:resourcekey="lblAuthorityMsgResource1"></asp:Label>