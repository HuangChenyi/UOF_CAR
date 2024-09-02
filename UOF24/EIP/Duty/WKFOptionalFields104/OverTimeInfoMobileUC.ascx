<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="OverTimeInfoUC.ascx.cs" Inherits="Ede.Uof.Web.EIP.Duty.WKFOptionalFields104.OverTimeInfoUC" %>
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
        var result = $uof.pageMethod.syncUc("EIP/Duty/WKFOptionalFields104/OverTimeInfoUC.ascx", "CalHours", data);
        
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
        $('input[type=checkbox][id*=<%=cblExcludeHours.ClientID%>]:checked').map(function () {
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
        $('input[type=checkbox][id*=<%=cblExcludeHours.ClientID%>]:checked').map(function() {
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
        var hours = $("#<%=txtHours.ClientID%>").val();

        if(error === '' && hours==='')
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
            $uof.pageMethod.syncUc("EIP/Duty/WKFOptionalFields104/OverTimeInfoUC.ascx", "UpdateStatus", data);
        }

        data = [applicantCompanyUnifiedId, applicantEmployeeNo, startDate, startTime, endDate, endTime, overTimeType, reason, mealAllowanceType, deductibleHours, punchCheck, hours];
        var result = $uof.pageMethod.syncUc("EIP/Duty/WKFOptionalFields104/OverTimeInfoUC.ascx", "ValidateApply", data);
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
        var result = $uof.pageMethod.syncUc("EIP/Duty/WKFOptionalFields104/TravelInfoUC.ascx", "ValidateMissingInfo", data);
        if (result === '') {
            arguments.IsValid = false;
            return;
        }
    }

    // 事由必填
    function CheckRemarkRequired(source, args) {
        var remark = $("#<%=txtRemark.ClientID%>");
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
        <table class="OvertimeTable104" style="width: 100%">
            <tr>
                <td style="white-space: nowrap">
                    <asp:Label ID="Label5" runat="server" Text="加班折換方式" meta:resourcekey="Label5Resource1"></asp:Label>
                    <asp:Label ID="Label9" runat="server" Text="*" ForeColor="Red" meta:resourcekey="Label9Resource1"></asp:Label>
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
                    <asp:Label ID="Label8" runat="server" Text="*" ForeColor="Red" meta:resourcekey="Label8Resource1"></asp:Label>
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
                    <asp:Label ID="Label10" runat="server" Text="*" ForeColor="Red" meta:resourcekey="Label10Resource1"></asp:Label>
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
                    <asp:Label ID="Label11" runat="server" Text="*" ForeColor="Red" meta:resourcekey="Label11Resource1"></asp:Label>
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
                    <asp:Label ID="Label12" runat="server" Text="*" ForeColor="Red" meta:resourcekey="Label12Resource1"></asp:Label>
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
            <tr style="white-space: nowrap">
                <td id="tdlblPunchCheck" runat="server">
                    <asp:Label ID="Label14" runat="server" Text="檢查刷卡資料" meta:resourcekey="Label14Resource1"></asp:Label>
                    <asp:Label ID="Label15" runat="server" Text="*" ForeColor="Red" meta:resourcekey="Label15Resource1"></asp:Label>
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
                    <asp:Label ID="Label13" runat="server" Text="*" ForeColor="Red" meta:resourcekey="Label13Resource1"></asp:Label>
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
                    <asp:Label ID="lblRemartTitleRequired" runat="server" ForeColor="Red" Text="*" Visible="false"></asp:Label>
                </td>
            </tr>
            <tr>
                <td colspan="3">
                    <asp:Label ID="lblRemark" runat="server" Visible="False" CssClass="labelMutiline" meta:resourcekey="lblRemarkResource1"></asp:Label>
                    <asp:TextBox ID="txtRemark" runat="server" Width="100%" TextMode="MultiLine" Rows="3" meta:resourcekey="txtRemarkResource1"></asp:TextBox>
                </td>
            </tr>

        </table>
        <table>
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
                    <asp:CustomValidator ID="cvRemark" runat="server" Display="Dynamic" EnableTheming="True" ForeColor="Red" ErrorMessage="事由不可空白" Visible="False" ClientValidationFunction="CheckRemarkRequired" meta:resourcekey="cvRemarkResource1"></asp:CustomValidator>
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
<asp:HiddenField ID="hfApplicantEmployeeNo" runat="server" />
<asp:HiddenField ID="hfApplicantCompanyUnifiedId" runat="server" />
<asp:HiddenField ID="hfApplicant" runat="server" />
<asp:HiddenField ID="hfFieldMode" runat="server" />
<asp:HiddenField ID="hfFormNumber" runat="server" />
<asp:HiddenField ID="hfOverTimeType" runat="server" />
<asp:HiddenField ID="hfCheckPunch" runat="server" />
