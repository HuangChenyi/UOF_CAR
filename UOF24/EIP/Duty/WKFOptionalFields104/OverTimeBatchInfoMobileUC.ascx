<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="OverTimeBatchInfoUC.ascx.cs" Inherits="Ede.Uof.Web.EIP.Duty.WKFOptionalFields104.OverTimeBatchInfoUC" %>
<%@ Register Src="~/Common/ChoiceCenter/UC_ChoiceList.ascx" TagPrefix="uc1" TagName="UC_ChoiceList" %>
<%@ Register Src="~/Common/ChoiceCenter/UC_ChoiceListMobile.ascx" TagPrefix="uc1" TagName="UC_ChoiceListMobile" %>

<style>
    .OvertimeTable104 > tbody > tr:nth-child(even) > td {
        padding-left: 10px;
        padding-bottom: 15px;
    }

    .OvertimeTable104 > tbody > tr:nth-child(odd) > td {
        padding-left: 10px;
        padding-bottom: 5px;
    }
    
    .labelMutiline {
      white-space:pre-wrap;
    }
</style>

<script type="text/javascript">
    function showBlockUI() {
        $.blockUI({
            message: '<asp:Image ID="imgLoading" runat="server" ImageUrl="~/Common/Images/loading.gif" />&nbsp;&nbsp;<span style="font-family:verdana;">Loading...</span>',
            overlayCSS: { backgroundColor: '#000', opacity: 0.5, cursor: 'wait' },
            css: { color: '#FFF', backgroundColor: '#999', border: '3px solid #ccc' },
        });
    }

    Sys.Application.add_load(function () {
        AddChangeEvent_<%=ClientID%>();

        if ($("#<%=hfFieldMode.ClientID%>").val() === "Design" || typeof $("#<%=hfFieldMode.ClientID%>").val() == 'undefined') {
            return;
        }

        var hfPassUsers = $("#<%=hfPassUsers.ClientID%>").val();

        if (hfPassUsers !== '' && hfPassUsers !== '[]') {
            $("#<%=lbtnPassInfo.ClientID%>").css("display", "");
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

    function ClearHours_<%=ClientID%>() {
        $("#<%=lblHours.ClientID%>").text('');
        $("#<%=txtHours.ClientID%>").val('');
        $("#<%=txtUnit.ClientID%>").val('');
        $("#<%=txtError.ClientID%>").val('');
        $("#<%=txtError.ClientID%>").hide();
        $('#<%= hfPassResult.ClientID  %>').val('');
        $('#<%= hfPassUsers.ClientID  %>').val('');
        $('#<%= hfResult.ClientID  %>').val('');
        $('#<%= hfCalcPass.ClientID  %>').val('');

        $("#<%=lbtnPassInfo.ClientID%>").css("display", "none");
        $("#<%=lbtnApplyDetail.ClientID%>").css("display", "none");
        $("#<%=lblErrorMsg.ClientID%>").css("display", "none");
        $("#<%=lblCalMessage.ClientID%>").css("display", "");
    }

    function OnDateSelected_<%=ClientID%>(sender, eventArgs) {
        ClearHours_<%=ClientID%>();
    }

    function CheckDate(source, args) {
        var rdStartDate = $find("<%=rdStartDate.ClientID%>");
         var rdStartTime = $find("<%=rdStartTime.ClientID%>");
        var rdEndDate = $find("<%=rdEndDate.ClientID%>");
        var rdEndTime = $find("<%=rdEndTime.ClientID%>");
        if (rdStartDate == null && rdStartTime == null && rdEndDate == null && rdEndTime == null) return;

        //時間起
        var rdStartDate = rdStartDate.get_dateInput().get_value();
        var rdStartTime = rdStartTime.get_dateInput().get_value();
        var sdate = new Date(rdStartDate + ' ' + rdStartTime).format('yyyy/MM/dd HH:mm');
        //時間訖
        var rdEndDate = rdEndDate.get_dateInput().get_value();
        var rdEndTime = rdEndTime.get_dateInput().get_value();
        var edate = new Date(rdEndDate + ' ' + rdEndTime).format('yyyy/MM/dd HH:mm');

        if (sdate >= edate) {
            args.IsValid = false;
        } else {
            args.IsValid = true;
        }
     }

    function CheckUsersEmpty(source, args) {
        var selected = $("#<%=UC_ChoiceListMobile.ClientID%>" + "_hiddenSelected").val();

        if (typeof selected === "undefined" || selected === "") {
            args.IsValid = false;
            $("#<%=lbtnApplyDetail.ClientID%>").css("display", "none");
            $("#<%=lblCalMessage.ClientID%>").css("display", "");
        } else {
            args.IsValid = true;
        }
    }

    function CalExcludeHours(source, args) {
        var totalHours = 0;
        $('input[type=checkbox][id*=<%=cblExcludeHours.ClientID%>]:checked').map(function () {
            return totalHours += parseInt($(this).val().split('|')[1], 10);
        });

        if (totalHours === 0) {
            args.IsValid = false;
            return;
        }
    }

    function ValidateMissingInfo_<%=ClientID%>(source, arguments) {
        var applicantEmployeeNo = $("#<%=hfApplicantEmployeeNo.ClientID%>").val();
        var applicantCompanyUnifiedId = $("#<%=hfApplicantCompanyUnifiedId.ClientID%>").val();

        if (applicantEmployeeNo === '' || applicantCompanyUnifiedId === '') {
            arguments.IsValid = false;
            return;
        }
    }

    function OpenErrorDialog(sender) {
        $uof.dialog.open2("~/HR104/Duty/Report/ErrorInfo.aspx",
            sender,
            '<%=lblErrorDialogTitle.Text%>',
            0,
            0,
            function () { return false },
            {
                "PassUsers": '',
                "ErrorUsers": '<%= hfErrorUsers.ClientID  %>'
            });
    }

    function OpenPassDialog(sender) {
        $uof.dialog.open2("~/HR104/Duty/Report/ErrorInfo.aspx",
            sender,
            '<%=lblCalInfoDialogTitle.Text%>',
            0,
            0,
            function () { return false },
            {
                "PassUsers": '<%= hfPassUsers.ClientID  %>',
                "ErrorUsers": ''
            });
    }

    // 事由必填
    function CheckRemarkRequired(source, args) {
        var remark = $("#<%=txtRemark.ClientID%>").val();
        if (typeof remark != "undefined" && remark.trim() == "") {
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
                    <asp:Label ID="Label17" runat="server" Text="加班人員" meta:resourcekey="Label17Resource1"></asp:Label>
                    <asp:Label ID="Label16" runat="server" ForeColor="Red" Text="*" meta:resourcekey="Label16Resource1"></asp:Label>
                </td>
            </tr>
            <tr>
                <td colspan="3">
                    <uc1:UC_ChoiceList ID="UC_ChoiceList1" runat="server" ChioceType="All" ExpandToUser="True" ShowMember="False" />
                    <uc1:UC_ChoiceListMobile runat="server" ID="UC_ChoiceListMobile" ChioceType="User"/>
                    <asp:CustomValidator ID="cvCheckUsers" runat="server" Display="Dynamic" ClientValidationFunction="CheckUsersEmpty" ErrorMessage="請選擇加班人員" ForeColor="Red" meta:resourcekey="cvCheckUsersResource1"></asp:CustomValidator>
                </td>
            </tr>
            <tr>
                <td style="white-space: nowrap">
                    <asp:Label ID="Label5" runat="server" Text="加班折換方式" meta:resourcekey="Label5Resource1"></asp:Label>
                    <asp:Label ID="Label9" runat="server" ForeColor="Red" Text="*" meta:resourcekey="Label9Resource1"></asp:Label>
                </td>
            </tr>
            <tr>
                <td id="tdOverTimeType" runat="server">
                    <asp:RadioButtonList ID="rblOverTimeType" runat="server" RepeatDirection="Vertical" AutoPostBack="true" OnSelectedIndexChanged="rblOverTimeType_SelectedIndexChanged" meta:resourcekey="rblOverTimeTypeResource1">
                        <asp:ListItem Text="轉加班費" Value="Payment" meta:resourcekey="ListItemResource1"></asp:ListItem>
                        <asp:ListItem Text="轉補休" Value="TimeOff" meta:resourcekey="ListItemResource2"></asp:ListItem>
                    </asp:RadioButtonList>
                    <asp:Label ID="lblOverTimeType" runat="server" Visible="False" meta:resourcekey="lblOverTimeTypeResource1"></asp:Label>
                </td>
            </tr>
            <tr>
                <td id="tdlblMealAllowance" style="white-space: nowrap" runat="server">
                    <asp:Label ID="Label6" runat="server" Text="支領誤餐費" meta:resourcekey="Label6Resource1"></asp:Label>
                    <asp:Label ID="Label8" runat="server" ForeColor="Red" Text="*" meta:resourcekey="Label8Resource1"></asp:Label>
                </td>
            </tr>
            <tr>
                <td id="tdMealAllowance" runat="server">
                    <asp:RadioButtonList ID="rblMealAllowance" runat="server" RepeatDirection="Vertical" meta:resourcekey="rblMealAllowanceResource1">
                        <asp:ListItem Text="依HR系統誤餐費設定" Value="Yes" meta:resourcekey="ListItemResource3"></asp:ListItem>
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
                                <telerik:RadDatePicker ID="rdStartDate" runat="server" EnableTheming="true" AutoPostBack="True" OnSelectedDateChanged="rdStartDate_SelectedDateChanged" meta:resourcekey="rdStartDateResource1">
                                </telerik:RadDatePicker>
                            </td>
                            <td>
                                <asp:Label ID="lblStartDate" runat="server" Visible="False" meta:resourcekey="lblStartDateResource1"></asp:Label>
                                <telerik:RadTimePicker ID="rdStartTime" runat="server" CssClass="fullWidth" EnableTheming="True" meta:resourcekey="rdStartTimeResource1">
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
                                <telerik:RadDatePicker ID="rdEndDate" EnableTheming="true" runat="server" meta:resourcekey="rdEndDateResource1">
                                </telerik:RadDatePicker>
                            </td>
                            <td>
                                <asp:Label ID="lblEndDate" runat="server" Visible="False" meta:resourcekey="lblEndDateResource1"></asp:Label>
                                <telerik:RadTimePicker ID="rdEndTime" runat="server" EnableTheming="True" CssClass="fullWidth" meta:resourcekey="rdEndTimeResource1">
                                </telerik:RadTimePicker>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td id="tdlblExcludeHours" style="white-space: nowrap" runat="server">
                    <asp:Label ID="Label4" runat="server" Text="扣除時數" meta:resourcekey="Label4Resource1"></asp:Label>
                    <asp:Label ID="Label12" runat="server" Text="*" ForeColor="Red" meta:resourcekey="Label12Resource1"></asp:Label>
                </td>
            </tr>
            <tr>
                <td id="tdExcludeHours" runat="server">
                    <asp:CheckBoxList ID="cblExcludeHours" runat="server" RepeatDirection="Vertical" meta:resourcekey="cblExcludeHoursResource1">
                        <asp:ListItem Text="午餐" Value="Lunch|1" meta:resourcekey="ListItemResource5" ></asp:ListItem>
                        <asp:ListItem Text="晚餐" Value="Dinner|2" meta:resourcekey="ListItemResource6" ></asp:ListItem>
                        <asp:ListItem Text="宵夜" Value="Supper|4" meta:resourcekey="ListItemResource7" ></asp:ListItem>
                        <asp:ListItem Text="其他" Value="Other|8" meta:resourcekey="ListItemResource8" ></asp:ListItem>
                    </asp:CheckBoxList>
                    <asp:Label ID="lblExcludeHours" runat="server" Visible="False" meta:resourcekey="lblExcludeHoursResource1"></asp:Label>
                    <asp:CustomValidator ID="cvApply" runat="server" Display="Dynamic" ClientValidationFunction="CalExcludeHours" ErrorMessage="請選擇扣除時數" ForeColor="Red" meta:resourcekey="cvApplyResource1"></asp:CustomValidator>
                </td>
            </tr>
            <tr>
                <td id="tdlblPunchCheck" style="white-space: nowrap" runat="server">
                    <asp:Label ID="Label14" runat="server" Text="檢查刷卡資料" meta:resourcekey="Label14Resource1"></asp:Label>
                    <asp:Label ID="Label15" runat="server" Text="*" ForeColor="Red" meta:resourcekey="Label15Resource1"></asp:Label>
                </td>
            </tr>
            <tr>
                <td id="tdPunchCheck" runat="server">
                    <asp:Label ID="lblPunchCheck" runat="server" Visible="False" meta:resourcekey="lblPunchCheckResource1"></asp:Label>
                    <asp:RadioButtonList ID="rblPunchCheck" runat="server" RepeatDirection="Vertical" meta:resourcekey="rblPunchCheckResource1">
                        <asp:ListItem Text="依HR系統加班刷卡核對設定" Value="Yes" meta:resourcekey="ListItemResource9"></asp:ListItem>
                        <asp:ListItem Text="不需檢查" Value="No" meta:resourcekey="ListItemResource10" ></asp:ListItem>
                    </asp:RadioButtonList>
                </td>
            </tr>
            <tr>
                <td style="white-space: nowrap">
                    <asp:Label ID="Label3" runat="server" Text="加班時數" meta:resourcekey="Label3Resource1"></asp:Label>
                    <asp:Label ID="Label13" runat="server" Visible="False" Text="*" ForeColor="Red" meta:resourcekey="Label13Resource1"></asp:Label>
                </td>
            </tr>
            <tr>
                <td colspan="3">
                    <asp:LinkButton ID="lbtnApplyDetail" runat="server" style="display:none;" Text ="詳細資訊" meta:resourcekey="lbtnApplyDetailResource1"></asp:LinkButton>
                    <asp:Label ID="lblCalMessage" runat="server" style="display:none;" Text="表單送出後才會依104系統的設定來計算和顯示個人實際加班時數" ForeColor="Blue" meta:resourcekey="lblCalMessageResource1"></asp:Label>
                    <asp:Label ID="lblErrorMsg" runat="server" Text="所有加班人員均無法申請加班" style="display:none;" ForeColor="Red" meta:resourcekey="lblErrorMsgResource1"></asp:Label>
                    <asp:Label ID="lblHours" runat="server" meta:resourcekey="lblHoursResource1"></asp:Label>
                    <asp:TextBox ID="txtHours" runat="server" Style="display: none" meta:resourcekey="txtHoursResource1"></asp:TextBox>
                    <asp:TextBox ID="txtUnit" runat="server" Style="display: none" meta:resourcekey="txtUnitResource1"></asp:TextBox>
                    <telerik:RadButton ID="rbtnCal" runat="server" Visible="False" CausesValidation="False" Text="計算" AutoPostBack="False" meta:resourcekey="rbtnCalResource1">
                    </telerik:RadButton>
                    <asp:LinkButton ID="lbtnPassInfo" runat="server" Text="時數明細"
                                    Style="display: none"
                                    OnClientClick="OpenPassDialog(this); return false;" meta:resourcekey="lbtnPassInfoResource1"></asp:LinkButton>
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
                    <asp:CustomValidator ID="cvCheckDate" runat="server" ErrorMessage="日期錯誤:輸入之結束日期(時間) 小於 開始日期(時間),請重新申請表單,謝謝!!" ClientValidationFunction="CheckDate" EnableTheming="True"  Display="Dynamic" meta:resourcekey="cvCheckDateResource1"></asp:CustomValidator>
                    <asp:CustomValidator ID="cvMissingInfo" runat="server" ErrorMessage="無員工編號或公司統一編號資訊" Display="Dynamic" EnableTheming="True" Visible="False" meta:resourcekey="cvMissingInfoResource1"></asp:CustomValidator>
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
                    <asp:TextBox ID="txtError" runat="server" Style="display: none; width: 300px; border-width: 0;" ForeColor="Red" meta:resourcekey="txtErrorResource1"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblErrorInfoCalc" runat="server" Text="部分人員無法計算時數" Style="display: none" ForeColor="Red" meta:resourcekey="lblErrorInfoCalcResource1"></asp:Label>
                    <asp:Label ID="lblErrorInfoSend" runat="server" Text="部分人員無法申請加班" Style="display: none" ForeColor="Red" meta:resourcekey="lblErrorInfoSendResource1"></asp:Label>
                    <asp:LinkButton ID="lbtnErrorInfo" runat="server" Text="詳細資訊"
                        CausesValidation="False" Style="display: none"
                        OnClientClick="OpenErrorDialog(this); return false;" meta:resourcekey="lbtnErrorInfoResource1"></asp:LinkButton>
                </td>
            </tr>
        </table>
        <asp:HiddenField ID="hfApplicantEmployeeNo" Value="" runat="server" />
        <asp:HiddenField ID="hfApplicantCompanyUnifiedId" Value="" runat="server" />
        <asp:HiddenField ID="hfApplicant" Value="" runat="server" />
        <asp:HiddenField ID="hfFieldMode" Value="" runat="server" />
        <asp:HiddenField ID="hfFormNumber" Value="" runat="server" />
        <asp:HiddenField ID="hfOverTimeType" Value="" runat="server" />
        <asp:HiddenField ID="hfCheckPunch" Value="" runat="server" />
        <asp:HiddenField ID="hfPreViewTimeTableUsers" runat="server" />
        <asp:HiddenField ID="hfPassUsers" runat="server" />
        <asp:HiddenField ID="hfErrorUsers" runat="server" />
        <asp:HiddenField ID="hfPassResult" runat="server" />
        <asp:HiddenField ID="hfResult" runat="server" />
        <asp:HiddenField ID="hfExcludeHours" runat="server" Value ="0" />
        <asp:HiddenField ID="hfCalcPass" runat="server" Value="" />
        <asp:HiddenField ID="hfMealAllowance" runat="server" />
        <asp:HiddenField ID="hfPunchCheck" runat="server" />

        <asp:Label ID="lblHasNoAuthority" runat="server" Text="無填寫權限" ForeColor="Red" Visible="False" meta:resourcekey="lblHasNoAuthorityResource1"></asp:Label>
        <asp:Label ID="lblToolTipMsg" runat="server" Text="不允許修改(唯讀)" Visible="False" meta:resourcekey="lblToolTipMsgResource1"></asp:Label>
        <asp:Label ID="lblFiller" CssClass="FillerVisible" runat="server" meta:resourcekey="lblFillerResource1"></asp:Label>
        <asp:Label ID="lblModifier" runat="server" Visible="False" meta:resourcekey="lblModifierResource1"></asp:Label>
        <asp:Label ID="lblMsgSigner" runat="server" Text="填寫者" Visible="False" meta:resourcekey="lblMsgSignerResource1"></asp:Label>
        <asp:Label ID="lblMsgEditor" runat="server" Text="修改者" Visible="False" meta:resourcekey="lblMsgEditorResource1"></asp:Label>
        <asp:Label ID="lblAuthorityMsg" runat="server" Text="具填寫權限人員" Visible="False" meta:resourcekey="lblAuthorityMsgResource1"></asp:Label>
        <asp:Label ID="lblNotFoundSP" runat="server" Text="計算時發生問題，請回報系統管理員。" Style="display: none;" meta:resourcekey="lblNotFoundSPResource1"></asp:Label>
        <asp:Label ID="lblErrorDialogTitle" runat="server" Text="詳細錯誤訊息" Visible="False" meta:resourcekey="lblErrorDialogTitleResource1"></asp:Label>
        <asp:Label ID="lblCalInfoDialogTitle" runat="server" Text="加班時數明細" Visible="False" meta:resourcekey="lblCalInfoDialogTitleResource1"></asp:Label>
        <asp:Label ID="lblPlsReferContent" runat="server" Text="請參考表單內容時數明細" Visible="False" meta:resourcekey="lblPlsReferContentResource1"></asp:Label>
        <asp:Label ID="lblMissingInfo" runat="server" Text="無員工編號或公司統一編號資訊" Visible="False" meta:resourcekey="lblMissingInfoResource1"></asp:Label>
        <asp:Label ID="lblDetailTitle" runat="server" Text="申請明細" Visible="False" meta:resourcekey="lblDetailTitleResource1"></asp:Label>
    </ContentTemplate>
</asp:UpdatePanel>
