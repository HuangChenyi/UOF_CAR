<%@ Control Language="C#" AutoEventWireup="true" Inherits="WKF_OptionalFields_RenewPunchInfoUC" Codebehind="RenewPunchInfoUC.ascx.cs" %>
<%@ Reference Control="~/WKF/FormManagement/VersionFieldUserControl/VersionFieldUC.ascx" %>
<%@ Register Assembly="System.Web.Extensions, Version=1.0.61025.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI" TagPrefix="asp" %>
<style type="text/css">
    .style1
    {
        width: 100%;
    }

    .style2
    {
        width: 80px;
        height: 20px;
    }

    .style3
    {
        height: 20px;
    }
</style>
<script type="text/javascript">
    function CheckUnlock(source, arguments) {
        var Contrl = '<%=rdDate.ClientID%>';
        var obj = $find(Contrl).get_selectedDate();
        if (obj != null) obj = obj.format('yyyy/MM/dd');
        var applicantGuid = $("#<%=hfApplicantGuid.ClientID %>").val();

        var data = [obj, applicantGuid];
        var result = $uof.pageMethod.syncUc("EIP/Duty/WKFOptionalFields/RenewPunchInfoUC.ascx", "IsUnlock", data);
        if (result == 'true') {
            arguments.IsValid = true;
        }
        else {
            arguments.IsValid = false;
        }
    }

    function CheckTime(source, arguments) {
        var offTime = '<%=rdOffTime.ClientID%>';
        var offTimeObj = $find(offTime).get_selectedDate();
        if (offTimeObj != null) offTimeObj = offTimeObj.format('HH:mm');

        var Date = '<%=rdDate.ClientID%>';
        var DateObj = $find(Date).get_selectedDate();
        if (DateObj != null) DateObj = DateObj.format('yyyy/MM/dd');

        if (DateObj == null || offTimeObj == null) return;

        var data = [offTimeObj, DateObj];
        var result = $uof.pageMethod.syncUc("EIP/Duty/WKFOptionalFields/RenewPunchInfoUC.ascx", "CompareTime", data);
        if (result == 'true') {
            arguments.IsValid = true;
        }
        else {
            arguments.IsValid = false;
        }
    }

    function CheckTime1(source, arguments) {

        var workTime = '<%=rdWorkTime.ClientID%>';
        var workTimeObj = $find(workTime).get_selectedDate();
        if (workTimeObj != null) workTimeObj = workTimeObj.format('HH:mm');

        var Date = '<%=rdDate.ClientID%>';
        var DateObj = $find(Date).get_selectedDate();
        if (DateObj != null) DateObj = DateObj.format('yyyy/MM/dd');

        if (DateObj == null || workTime == null) return;

        var data = [workTimeObj, DateObj];
        var result = $uof.pageMethod.syncUc("EIP/Duty/WKFOptionalFields/RenewPunchInfoUC.ascx", "CompareTime", data);
        if (result == 'true') {
            arguments.IsValid = true;
        }
        else {
            arguments.IsValid = false;
        }
    }

    function CheckDate(source, arguments) {

        var Contrl = '<%=rdDate.ClientID%>';
        var obj = $find(Contrl).get_selectedDate();
        if (obj != null) obj = obj.format('yyyy/MM/dd');

        var data = [obj];
        var result = $uof.pageMethod.syncUc("EIP/Duty/WKFOptionalFields/RenewPunchInfoUC.ascx", "CompareDate", data);
        if (result == 'true') {
            arguments.IsValid = true;
        }
        else {
            arguments.IsValid = false;
        }
    }

    function CheckPunchTime(source, arguments) {

        var workTime = '<%=rdWorkTime.ClientID%>';
        var workTimeObj = $find(workTime).get_selectedDate();
        if (workTimeObj != null) workTimeObj = workTimeObj.format('HH:mm');

        var offTime = '<%=rdOffTime.ClientID%>';
        var offTimeObj = $find(offTime).get_selectedDate();
        if (offTimeObj != null) offTimeObj = offTimeObj.format('HH:mm');

        if (workTimeObj != null && offTimeObj != null) {
            if (workTimeObj > offTimeObj) {
                arguments.IsValid = false;
            }
            else {
                arguments.IsValid = true;
            }
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
        var Date = '<%=rdDate.ClientID%>';
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
                var data = [applicantGuid, DateObj, workTimeObj, "work"];
                result = $uof.pageMethod.syncUc("EIP/Duty/WKFOptionalFields/RenewPunchInfoUC.ascx", "CheckIFPunchTimeWorkOff", data);
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
        var Date = '<%=rdDate.ClientID%>';
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
                var data = [applicantGuid, DateObj, offTimeObj, "off"];
                result = $uof.pageMethod.syncUc("EIP/Duty/WKFOptionalFields/RenewPunchInfoUC.ascx", "CheckIFPunchTimeWorkOff", data);
            }
        }

        if (result == 'false') {
            arguments.IsValid = true;
        }
        else {
            arguments.IsValid = false;
        }
    }
</script>
<asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>
        <asp:Panel ID="Panel1" runat="server" meta:resourcekey="Panel1Resource1">
            <table class="PopTable" cellpadding="0" cellspacing="1" style="width: 100%">
                <tr>
                    <td class="PopTableLeftTD" nowrap="nowrap" style="width: 15%">
                        <asp:Label ID="Label4" runat="server" ForeColor="Red" Text="*" meta:resourcekey="Label4Resource1"></asp:Label>
                        <asp:Label ID="Label1" runat="server" Text="日期" meta:resourcekey="Label1Resource1"></asp:Label>
                    </td>
                    <td class="PopTableRightTD" style="width: 85%">
                        <table cellpadding="1" cellspacing="1">
                            <tr>
                                <td>
                                    <telerik:RadDatePicker ID="rdDate" runat="server" meta:resourcekey="rdDateResource1">
                                    </telerik:RadDatePicker>
                                </td>
                                <td class="PopTableRightTD">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="rdDate"
                                        Display="Dynamic" ErrorMessage="請選擇日期" meta:resourcekey="RequiredFieldValidator1Resource1"></asp:RequiredFieldValidator>
                                    <asp:CustomValidator ID="cvRenewDate" runat="server" ClientValidationFunction="CheckDate"
                                        ControlToValidate="rdDate" Display="Dynamic" ErrorMessage="補刷卡日期不可晚於系統日期" meta:resourcekey="cvRenewDateResource1"></asp:CustomValidator>
                                    <asp:CustomValidator ID="cvUnlock" runat="server" ClientValidationFunction="CheckUnlock"
                                        Display="Dynamic" ErrorMessage="該日期已被鎖單" meta:resourcekey="cvUnlockResource1"></asp:CustomValidator>
                                </td>
                            </tr>
                        </table>
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
                                                <telerik:RadTimePicker ID="rdWorkTime" runat="server" Width="80px" SkinID="AllowEmpty" meta:resourcekey="rdWorkTimeResource1">
                                                </telerik:RadTimePicker>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                                <td>
                                    <asp:RequiredFieldValidator ID="rfvWorkTime" runat="server" ControlToValidate="rdWorkTime" Display="Dynamic" ErrorMessage="請輸入時間" meta:resourcekey="rfvWorkTimeResource1"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td class="style2" style="width: 80px; white-space: nowrap;">
                                    <asp:CheckBox ID="cbOffPunch" runat="server" AutoPostBack="True" OnCheckedChanged="cbOffPunch_CheckedChanged1"
                                        Text="補下班卡" meta:resourcekey="cbOffPunchResource1" />
                                </td>
                                <td class="style3">
                                    <table class="style1">
                                        <tr>
                                            <td>
                                                <telerik:RadTimePicker ID="rdOffTime" runat="server" Width="80px" SkinID="AllowEmpty" meta:resourcekey="rdOffTimeResource1">
                                                </telerik:RadTimePicker>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                                <td>
                                    <asp:RequiredFieldValidator ID="rfvOffTime" runat="server" ControlToValidate="rdOffTime"
                                        Display="Dynamic" ErrorMessage="請輸入時間" meta:resourcekey="rfvOffTimeResource1"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                        </table>
                        <table cellpadding="0" cellspacing="0">
                            <tr>
                                <td>
                                    <asp:CustomValidator ID="cvRenewMessage" runat="server" ClientValidationFunction="CheckRenewType"
                                        Display="Dynamic" ErrorMessage="補上下班卡至少須選擇一個" meta:resourcekey="cvRenewMessageResource1"></asp:CustomValidator>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:CustomValidator ID="cvRenewTime1" runat="server" ClientValidationFunction="CheckTime1"
                                        Display="Dynamic" ErrorMessage="補上班卡時間不可晚於當日系統時間" meta:resourcekey="cvRenewTime1Resource1"></asp:CustomValidator>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:CustomValidator ID="cvRenewTime" runat="server" ClientValidationFunction="CheckTime"
                                        Display="Dynamic" ErrorMessage="補下班卡時間不可晚於當日系統時間" meta:resourcekey="cvRenewTimeResource1"></asp:CustomValidator>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:CustomValidator ID="cvErrorTime" runat="server" ClientValidationFunction="CheckPunchTime"
                                        Display="Dynamic" ErrorMessage="補上班卡時間不可晚於補下班卡時間" meta:resourcekey="cvErrorTimeResource1"></asp:CustomValidator>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:CustomValidator ID="cvCheckWorkData" runat="server" ClientValidationFunction="CheckPunchTimeWork"
                                        Display="Dynamic" ErrorMessage="補上班卡時間不可比已刷下班卡時間晚" meta:resourcekey="cvCheckWorkDataResource1"></asp:CustomValidator>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:CustomValidator ID="cvCheckOffData" runat="server" ClientValidationFunction="CheckPunchTimeOff"
                                        Display="Dynamic" ErrorMessage="補下班卡時間不可比已刷上班卡時間早" meta:resourcekey="cvCheckOffDataResource1"></asp:CustomValidator>
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
            </table>
        </asp:Panel>
        <asp:Panel ID="Panel2" runat="server" Visible="False" meta:resourcekey="Panel2Resource1">
            <table class="PopTable" cellpadding="0" cellspacing="1" style="width: 100%">
                <tr>
                    <td class="PopTableLeftTD" nowrap="nowrap" style="width: 15%">
                        <asp:Label ID="Label5" runat="server" Text="日期" meta:resourcekey="Label5Resource1"></asp:Label>
                    </td>
                    <td class="PopTableRightTD" style="width: 85%">
                        <asp:Label ID="lblDate" runat="server" meta:resourcekey="lblDateResource1"></asp:Label>
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
            </table>
        </asp:Panel>
    </ContentTemplate>
</asp:UpdatePanel>
<asp:HiddenField ID="hfApplicantGuid" runat="server" />
<asp:LinkButton ID="lnk_Edit" runat="server" OnClick="lnk_Edit_Click" Visible="False" CausesValidation="False" meta:resourcekey="lnk_EditResource1" Text="[修改]"></asp:LinkButton>
<asp:LinkButton ID="lnk_Cannel" runat="server" OnClick="lnk_Cannel_Click" Visible="False" CausesValidation="False" meta:resourcekey="lnk_CannelResource1" Text="[取消]"></asp:LinkButton>
<asp:LinkButton ID="lnk_Submit" runat="server" OnClick="lnk_Submit_Click" Visible="False" CausesValidation="False" meta:resourcekey="lnk_SubmitResource1" Text="[確定]"></asp:LinkButton>
<asp:Label ID="lblHasNoAuthority" runat="server" Text="無填寫權限" ForeColor="Red" Visible="False" meta:resourcekey="lblHasNoAuthorityResource1"></asp:Label>
<asp:Label ID="lblToolTipMsg" runat="server" Text="不允許修改(唯讀)" Visible="False" meta:resourcekey="lblToolTipMsgResource1"></asp:Label>
<asp:Label ID="lblFiller" CssClass="FillerVisible" runat="server" meta:resourcekey="lblFillerResource1"></asp:Label>
<asp:Label ID="lblModifier" runat="server" Visible="False" meta:resourcekey="lblModifierResource1"></asp:Label>
<asp:Label ID="lblMsgSigner" runat="server" Text="填寫者" Visible="False" meta:resourcekey="lblMsgSignerResource1"></asp:Label>
<asp:Label ID="lblMsgEditor" runat="server" Text="修改者" Visible="False" meta:resourcekey="lblMsgEditorResource1"></asp:Label>
<asp:Label ID="lblAuthorityMsg" runat="server" Text="具填寫權限人員" Visible="False" meta:resourcekey="lblAuthorityMsgResource1"></asp:Label>