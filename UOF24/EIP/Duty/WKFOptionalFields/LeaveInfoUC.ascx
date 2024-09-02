<%@ Control Language="C#" AutoEventWireup="true" Inherits="WKF_OptionalFields_LeaveInfoUC" Codebehind="LeaveInfoUC.ascx.cs" %>
<%@ Reference Control="~/WKF/FormManagement/VersionFieldUserControl/VersionFieldUC.ascx" %>

<script type="text/javascript">
    function CheckIfSelectLeaCode(source, arguments) {
        var obj = $('#<%=hfLeaveCode.ClientID%>').val();

        if (obj == "-NULL-")
            arguments.IsValid = false;
        else
            arguments.IsValid = true;

    }
    function btnCalControl() {
        var btn = $('#<%= rdbtnCal.ClientID %>');
        if (btn != null)
            btn.attr('disabled', true);

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
        if (dayhours != null) dayhours.val("0.0");
    }

    function LeaveV1NotSuport(sender, args) {
        args.IsValid = false;
    }

</script>


<asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <contenttemplate>
        <asp:CustomValidator ID="cvLeaveV1NotSuport" runat="server" ErrorMessage="此版的請假資訊已不支援使用，如要申請，請選擇V2版本。" Display="Dynamic" 
            ClientValidationFunction="LeaveV1NotSuport" meta:resourcekye="cvLeaveV1NotSuportResource1"></asp:CustomValidator>
        <table style="width: 500px" class="PopTable" cellpadding="0" cellspacing="0">            
            <tr>
                <td class="PopTableLeftTD" style="width:120px;" nowrap="nowrap">
                    <asp:Label ID="lblLeaveCode" runat="server" Text="假別" 
                        meta:resourcekey="lblLeaveCodeResource1"></asp:Label>
                </td>
                <td class="PopTableRightTD">
                    <asp:DropDownList ID="ddlLeaveCode" runat="server" AutoPostBack="True" 
                        OnSelectedIndexChanged="ddlLeaveCode_SelectedIndexChanged" 
                        onchange="btnCalControl();" meta:resourcekey="ddlLeaveCodeResource1" >                    
                    </asp:DropDownList>
                    <asp:Label ID="lblLeaveCodeView" runat="server" 
                        meta:resourcekey="lblLeaveCodeViewResource1"></asp:Label>
                    <asp:HyperLink ID="hlLeaveCode" runat="server" Target="_blank" Text="假別說明" 
                        meta:resourcekey="hlLeaveCodeResource1" ></asp:HyperLink><br />
                    <asp:CustomValidator ID="cusValiLeaCode" runat="server" ErrorMessage="假別必須選擇" ForeColor="Red"
                        Display="Dynamic" ClientValidationFunction="CheckIfSelectLeaCode" 
                        meta:resourcekey="cusValiLeaCodeResource1" ></asp:CustomValidator>
                    <asp:HiddenField ID="hfLeaveCode" runat="server" />
                </td>
            </tr>
            <tr>
                <td class="PopTableLeftTD" style="width:120px;" nowrap="nowrap">
                    <asp:Label ID="lblStartDate" runat="server" Text="請假時間(起)" 
                        meta:resourcekey="lblStartDateResource1"></asp:Label>
                </td>
                <td class="PopTableRightTD">
                    <table cellpadding="0" cellspacing="0">
                        <tr>
                            <td>
                                <telerik:RadDatePicker ID="rdStartDate" Runat="server" AutoPostBack="True" OnSelectedDateChanged="rdStartDate_SelectedDateChanged" meta:resourcekey="rdStartDateResource1">
                                    <DateInput AutoPostBack="True" dateformat="yyyy/M/d" displaydateformat="yyyy/M/d" >
                                    </DateInput>
                                    <ClientEvents OnDateSelected="btnCalControl" />
                                </telerik:RadDatePicker>
                            </td>
                            <td style="width: 5px;" align="center">
                            </td>
                            <td> 
                                <telerik:RadTimePicker ID="rdStartTime" Runat="server" Width="80px" meta:resourcekey="rdStartTimeResource1">                                 
                                    <ClientEvents OnDateSelected="ClearLea" />
                                </telerik:RadTimePicker>               
                            </td>
                        </tr>
                    </table>
                    <asp:Label ID="lblStartDateView" runat="server"  meta:resourcekey="lblStartDateViewResource1"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="PopTableLeftTD" style="width:120px;" nowrap="nowrap">
                    <asp:Label ID="lblEndDate" runat="server" Text="請假時間(訖)" 
                        meta:resourcekey="lblEndDateResource1"></asp:Label>
                </td>
                <td class="PopTableRightTD">
                    <table cellpadding="0" cellspacing="0">
                        <tr>
                            <td>
                                <telerik:RadDatePicker ID="rdEndDate" Runat="server" OnSelectedDateChanged="rdEndDate_SelectedDateChanged" AutoPostBack="True" meta:resourcekey="rdEndDateResource1">
                                    <DateInput AutoPostBack="True" dateformat="yyyy/M/d" displaydateformat="yyyy/M/d" >
                                    </DateInput>
                                    <ClientEvents OnDateSelected="btnCalControl" />
                                </telerik:RadDatePicker>
                            </td>
                            <td style="width: 5px;" align="center">
                            </td>
                            <td>
                                <telerik:RadTimePicker ID="rdEndTime" Runat="server"  Width="80px" meta:resourcekey="rdEndTimeResource1">
                                    <ClientEvents OnDateSelected="ClearLea" />
                                </telerik:RadTimePicker>               
                            </td>
                        </tr>
                    </table>
                    <asp:Label ID="lblEndDateView" runat="server" meta:resourcekey="lblEndDateViewResource1"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="PopTableLeftTD" style="width:120px;" nowrap="nowrap">
                    <asp:Label ID="lblLeaveTotal" runat="server" Text="請假時(天)數" meta:resourcekey="lblLeaveTotalResource1"></asp:Label>
                </td>
                <td class="PopTableRightTD">
                    <table cellpadding="0" cellspacing="1">
                        <tr>
                            <td style="width:79px">
                                <asp:Label ID="lblHour" runat="server" Text="0.0"  Visible="False" 
                                    meta:resourcekey="lblHourResource1"></asp:Label>
                                <asp:Label ID="lblHourUnit" runat="server" Text="時" Visible="False" 
                                    meta:resourcekey="lblHourUnitResource1"></asp:Label>
                                <asp:Label ID="lblDay" runat="server" Text="0.0" Visible="False" 
                                    meta:resourcekey="lblDayResource1"></asp:Label>
                                <asp:Label ID="lblDayUnit" runat="server" Text="天" Visible="False" 
                                    meta:resourcekey="lblDayUnitResource1"></asp:Label>
                                <asp:HiddenField ID="hfLeaveUnit" runat="server" />
                                <asp:HiddenField ID="hfLeaveDayHour" runat="server" />
                            </td>
                            <td>
                                <telerik:RadButton ID="rdbtnCal" runat="server" Text="計算" CausesValidation="False" OnClick="rdbtnCal_Click" meta:resourcekey="rdbtnCalResource1"></telerik:RadButton>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td class="PopTableLeftTD" style="width:120px;" nowrap="nowrap">
                    <asp:HiddenField ID="hfActualDateCheck" runat="server" />
                    <asp:Label ID="lblActualDate" runat="server" Text="實際發生日" meta:resourcekey="lblActualDateResource1"></asp:Label>
                </td>
                <td class="PopTableRightTD">
                    <telerik:RadDatePicker ID="rdActDate" Runat="server" SkinID="AllowEmpty" meta:resourcekey="rdActDateResource1">
                    </telerik:RadDatePicker>
                    <asp:Label ID="lblActualDateView" runat="server" meta:resourcekey="lblActualDateViewResource1"></asp:Label>
                </td>
            </tr>
            <tr id="trLD" runat="server">
                <td class="PopTableLeftTD" runat="server" style="width:120px;" nowrap="nowrap">
                    <asp:Label ID="lblLeaveDays" runat="server" Text="可用年休" meta:resourcekey="lblLeaveDaysResource1"></asp:Label>
                </td>
                <td class="PopTableRightTD" runat="server">
                    <asp:DropDownList ID="ddlLeaveDays" runat="server">
                    </asp:DropDownList>
                    <asp:Label ID="lblLeaveDaysView" runat="server"></asp:Label>
                    <asp:HiddenField ID="hfLeaveDaysRemaindays" runat="server" />
                    <asp:HiddenField ID="hfLeaveDaysYear" runat="server" />
                    <asp:HiddenField ID="hfLeaveDaysExtend" runat="server" />
                </td>
            </tr>
        </table>
        <asp:CustomValidator ID="CusVailError" runat="server" Display="Dynamic" ForeColor="Red" meta:resourcekey="CusVailErrorResource1"></asp:CustomValidator>
        <asp:CustomValidator ID="CusVailDateTimeErr" runat="server" Display="Dynamic" ForeColor="Red" meta:resourcekey="CusVailDateTimeErrResource1"></asp:CustomValidator>

    </contenttemplate>
</asp:UpdatePanel>
<asp:Label ID="lblHasNoAuthority" runat="server" Text="無填寫權限" ForeColor="Red" Visible="False" meta:resourcekey="lblHasNoAuthorityResource1"></asp:Label>
<asp:Label ID="lblToolTipMsg" runat="server" Text="不允許修改(唯讀)" Visible="False" meta:resourcekey="lblToolTipMsgResource1"></asp:Label>            
<asp:Label ID="lblFiller" CssClass="FillerVisible" runat="server" meta:resourcekey="lblFillerResource1"></asp:Label>
<asp:Label ID="lblModifier" runat="server" Visible="False" meta:resourcekey="lblModifierResource1"></asp:Label>
<asp:Label ID="lblMsgSigner" runat="server" Text="填寫者" Visible="False" meta:resourcekey="lblMsgSignerResource1"></asp:Label>            
<asp:Label ID="lblMsgEditor" runat="server" Text="修改者" Visible="False" meta:resourcekey="lblMsgEditorResource1"></asp:Label>
<asp:Label ID="lblAuthorityMsg" runat="server" Text="具填寫權限人員" Visible="False" meta:resourcekey="lblAuthorityMsgResource1"></asp:Label>
<asp:Label ID="lblFieldValue" runat="server" Visible="False" meta:resourcekey="lblFieldValueResource1"></asp:Label>
<asp:HiddenField ID="hfIsSendValue" runat="server" />
<asp:HiddenField ID="hfApplicantUser" runat="server" />
<asp:HiddenField ID="hfAgentUser" runat="server" />
<asp:Label ID="lblMustSelect" runat="server" Text="請選擇" Visible="False" meta:resourcekey="lblMustSelectResource1"></asp:Label>
<asp:Label ID="lblLeaveCodeErr" runat="server" Text="取得可請假假別時異常，請洽管理員" Visible="False" meta:resourcekey="lblLeaveCodeErrResource1"></asp:Label>
<asp:Label ID="lblApplicantErr" runat="server" Text="無法確認申請者，無法申請" Visible="False" meta:resourcekey="lblApplicantErrResource1"></asp:Label>
<asp:Label ID="lblStartBigerEndErr" runat="server" Text="請假時間(起)不可晚於請假時間(訖)" Visible="False" meta:resourcekey="lblStartBigerEndErrResource1"></asp:Label>
<asp:Label ID="lblIsNotWorkDayErr" runat="server" Text="請假時間必須為上班日" Visible="False" meta:resourcekey="lblIsNotWorkDayErrResource1"></asp:Label>
<asp:Label ID="lblStartTimeEarlyWorkTimeETErr" runat="server" Text="請假時間(起)要晚於、等於請假日期(起)的個人班表最早彈性上班時間" Visible="False" meta:resourcekey="lblStartTimeEarlyWorkTimeETErrResource1"></asp:Label>
<asp:Label ID="lblEndTimieLastOffTimeLTErr" runat="server" Text="請假日期(訖)要早於、等於請假日期(訖)的個人班表最晚彈性下班時間" Visible="False" meta:resourcekey="lblEndTimieLastOffTimeLTErrResource1"></asp:Label>
<asp:Label ID="lblStartTimeEarlyWorkTimeErr" runat="server" Text="請假時間(起)要晚於、等於請假日期(起)的個人班表上班時間" Visible="False" meta:resourcekey="lblStartTimeEarlyWorkTimeErrResource1"></asp:Label>
<asp:Label ID="lblEndTimeLastOffTimeErr" runat="server" Text="請假日期(訖)要早於、等於請假日期(訖)的個人班表下班時間" Visible="False" meta:resourcekey="lblEndTimeLastOffTimeErrResource1"></asp:Label>
<asp:Label ID="lblCrossYearErr" runat="server" Text="請假時間(起)(訖)需在同一年度" Visible="False" meta:resourcekey="lblCrossYearErrResource1"></asp:Label>
<asp:Label ID="lblStartTimeMatchWorkTimeErr" runat="server" Text="請假時間(起)要等於個人班表上班時間" Visible="False" meta:resourcekey="lblStartTimeMatchWorkTimeErrResource1"></asp:Label>
<asp:Label ID="lblCannotFindLeaveCode" runat="server" Text="找不到假別" Visible="False" meta:resourcekey="lblCannotFindLeaveCodeResource1"></asp:Label>
<asp:Label ID="lblCannotFindSetting" runat="server" Text="找不到工時設定" Visible="False" meta:resourcekey="lblCannotFindSettingResource1"></asp:Label>
<asp:Label ID="lblNotMinUnit" runat="server" Text="不符合假別的最小請假單位要求" Visible="False" meta:resourcekey="lblNotMinUnitResource1"></asp:Label>
<asp:Label ID="lblNoLeaveDays" runat="server" Text="沒有可用年休" Visible="False" meta:resourcekey="lblNoLeaveDaysResource1"></asp:Label>
<asp:Label ID="lblLeaveDaysShow" runat="server" Text="餘{0}天 ({1}~{2})" Visible="False" meta:resourcekey="lblLeaveDaysShowResource1"></asp:Label>
<asp:Label ID="lblLeaveHourssShow" runat="server" Text="餘{0}小時 ({1}~{2})" Visible="False" meta:resourcekey="lblLeaveHourssShowResource1"></asp:Label>
<asp:Label ID="lblLeaveCodeMiss" runat="server" Text="選擇假別已被修改或移除，請洽管理員" Visible="False" meta:resourcekey="lblLeaveCodeMissResource1"></asp:Label>
<asp:Label ID="lblLeaveCodeNotSelect" runat="server" Text="假別必須選擇" Visible="False" meta:resourcekey="lblLeaveCodeNotSelectResource1"></asp:Label>