<%@ Page Title="" Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" CodeBehind="LeaveBatchInfoDetail.aspx.cs" Inherits="Ede.Uof.Web.HR104.Duty.Form.LeaveBatchInfoDetail" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        .ul {
            border-bottom: 1px dotted silver
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

        function pageLoad(sender, arguments) {
            //!isPostBack
            if (!arguments._isPartialLoad) {
               var curwindow = $uof.dialog.getOpener();
               var pd;
               if (curwindow) {
                   pd = curwindow.document;
               }
               else if (typeof (dialogArguments) != "undefined") {
                   pd = dialogArgument.document;
               }
                if (pd) {
                   $("#<%= hfLeaveInfoDt.ClientID %>").val($("#<%=Request["leaveInfoList"] %>", pd).val());
               }
               $("#<%=btnPostBack.ClientID%>").click();
            }
        }

        function UpdateLeaveInfoList(){
            var curwindow = $uof.dialog.getOpener();
            var pd;
            if (curwindow) {
                pd = curwindow.document;
            }
            else if (typeof (dialogArguments) != "undefined") {
                pd = dialogArgument.document;
            }       
            $("#<%=Request["leaveInfoList"]%>", pd).val($("#<%=hfLeaveInfoDt.ClientID%>").val());
        }

        function AddChangeEvent_<%=ClientID%>() {
            $('#<%=ddlLeaveCode.ClientID%>').on('change', function () {
                ClearHours_<%=ClientID%>();
                CheckEventDate_<%=ClientID%>();
            });
        }

        function OnDateSelected_<%=ClientID%>(sender, eventArgs) {
            ClearHours_<%=ClientID%>();
        }

        function ClearHours_<%=ClientID%>() {
            $("#<%=lblHours.ClientID%>").text('');
            $("#<%=txtHours.ClientID%>").val('');
            $("#<%=txtUnit.ClientID%>").val('');
            $("#<%=txtError.ClientID%>").val('');
            $("#<%=txtError.ClientID%>").hide();
        }

        function ValidateMissingInfo_<%=ClientID%>(source, arguments) {
            var applicant = $("#<%=hfApplicant.ClientID%>").val();
            var data = [applicant]
            var result = $uof.pageMethod.sync("ValidateMissingInfo", data);
            if (result === '') {
                arguments.IsValid = false;
                return;
            }
        }

        function CheckEventDate_<%=ClientID%>() {
            var applicantEmployeeNo = $("#<%=hfApplicantEmployeeNo.ClientID%>").val();
            var applicantCompanyNo = $("#<%=hfApplicantCompanyNo.ClientID%>").val();
            var leaCode = $("#<%=ddlLeaveCode.ClientID%>").val();
            if (leaCode == null || leaCode === "") {
                leaCode = $("#<%=hfLeaveCode.ClientID%>").val();
            } else {
                $("#<%=hfLeaveCode.ClientID%>").val(leaCode);
            }

            if (leaCode == null || leaCode === "") {
                $("#<%=trEventDate.ClientID%>").hide();
                return "";
            }

            //沒有公司統編或員編就不跑其他驗證
            if (applicantEmployeeNo === '' || applicantCompanyNo === '') {
                return;
            }
            var data = [applicantCompanyNo, applicantEmployeeNo, leaCode];
            var result = $uof.pageMethod.sync("CheckEventDate", data);
            if (result === "true") {
                $("#<%=trEventDate.ClientID%>").show();
            }
            else {
                $("#<%=trEventDate.ClientID%>").hide();
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

        //驗證是否超過申請期限
        function ValidateLeaveLimit_<%=ClientID%>(source, arguments) {
            lblLeaveBefore = $('#<%=lblLeaveBefore.ClientID %>').text();
            lblLeaveAfter = $('#<%=lblLeaveAfter.ClientID %>').text();
            lblLimitBeforeErrMsg = $('#<%=lblLimitBeforeErrMsg.ClientID %>').text();
            lblLimitAfterErrMsg = $('#<%=lblLimitAfterErrMsg.ClientID %>').text();
            var startDate = $find("<%=rdStartDate.ClientID%>").get_dateInput().get_value();
            var endDate = $find("<%=rdEndDate.ClientID%>").get_dateInput().get_value();
            var fieldMode = $("#<%= hfFieldMode.ClientID %>").val(); 
            var applyDate = $("#<%= hfApplyDate.ClientID %>").val();

            var cvLeaveLimit = $("#<%=cvLeaveLimit.ClientID %>");
            var data = [startDate, endDate, fieldMode, applyDate];
            var limitErrMsg = "";
            var result = $uof.pageMethod.sync("ValidateLeaveLimit", data);
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


        function CheckSelectLeaveCode(source, arguments) {
            var leaCode = $("#<%=ddlLeaveCode.ClientID%>").val();
            var hleaCode = $("#<%=hfLeaveCode.ClientID%>").val();
            //沒有公司統編或員編就不跑其他驗證
            var applicantEmployeeNo = $("#<%=hfApplicantEmployeeNo.ClientID%>").val();
            var applicantCompanyNo = $("#<%=hfApplicantCompanyNo.ClientID%>").val();
            if (applicantEmployeeNo === '' || applicantCompanyNo === '') {
                return;
            }

            if (leaCode === "" || leaCode === null) {
                arguments.IsValid = false;
                return;
            }
            else if (hleaCode === "" || hleaCode === null) {
                arguments.IsValid = false;
                return;
            }
        }

        function CalBtnClick_<%=ClientID%>(sender, arguments) {
            CalLeaveHours_<%=ClientID%>();
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
            var result = $uof.pageMethod.sync("CalHours", data);

            if (result !== "") {
                arrayResult = result.split('|');
                if (arrayResult.length > 0) {
                    if (arrayResult[0] === arrayResult[1] && arrayResult[1] === arrayResult[2] && arrayResult[2] === arrayResult[0]) {
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

        function CheckOverlapping_<%=ClientID%>(source, arguments) {
            var applicantEmployeeNo = $("#<%=hfApplicantEmployeeNo.ClientID%>").val();
            var applicantCompanyNo = $("#<%=hfApplicantCompanyNo.ClientID%>").val();
            var leaCode = $("#<%=ddlLeaveCode.ClientID%>").val();
            var startDate = $find("<%=rdStartDate.ClientID%>").get_dateInput().get_value();
            var endDate = $find("<%=rdEndDate.ClientID%>").get_dateInput().get_value();
            var startTime = $find("<%=rdStartTime.ClientID%>").get_dateInput().get_value();
            var endTime = $find("<%=rdEndTime.ClientID%>").get_dateInput().get_value();
            var leaveInfoDt = $("#<%=hfLeaveInfoDt.ClientID%>").val();
            var leaveGuid = $("#<%=hfLeaveGuid.ClientID%>").val();
            if (leaCode == null || leaCode === "") return "";
            //沒有公司統編或員編就不跑其他驗證
            if (applicantEmployeeNo === '' || applicantCompanyNo === '') {
                return;
            }
            var data = [applicantCompanyNo, applicantEmployeeNo, startDate, startTime, endDate, endTime, leaveInfoDt, leaveGuid];
            var result = $uof.pageMethod.sync("CheckOverlapping", data);
            if (result !== '') {
                arguments.IsValid = false;
                return;
            }
        }

        function CheckContinuous_<%=ClientID%>(source, arguments) {
            var applicantEmployeeNo = $("#<%=hfApplicantEmployeeNo.ClientID%>").val();
            var applicantCompanyNo = $("#<%=hfApplicantCompanyNo.ClientID%>").val();
            var leaCode = $("#<%=ddlLeaveCode.ClientID%>").val();
            var startDate = $find("<%=rdStartDate.ClientID%>").get_dateInput().get_value();
            var endDate = $find("<%=rdEndDate.ClientID%>").get_dateInput().get_value();
            var startTime = $find("<%=rdStartTime.ClientID%>").get_dateInput().get_value();
            var endTime = $find("<%=rdEndTime.ClientID%>").get_dateInput().get_value();
            var leaveInfoDt = $("#<%=hfLeaveInfoDt.ClientID%>").val();
            var leaveGuid = $("#<%=hfLeaveGuid.ClientID%>").val();
            if (leaCode == null || leaCode === "") return "";
            //沒有公司統編或員編就不跑其他驗證
            if (applicantEmployeeNo === '' || applicantCompanyNo === '') {
                return;
            }
            var data = [applicantCompanyNo, applicantEmployeeNo, startDate, startTime, endDate, endTime, leaveInfoDt,leaveGuid];
            var result = $uof.pageMethod.sync("CheckContinuous", data);
            if (result !== '') {
                arguments.IsValid = false;
                return false;
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
            var reason = '';
            var leaCode = $("#<%=ddlLeaveCode.ClientID%>").val();
            var agnetJSON = '';
            var result = '';
            var data = [$("#<%=hfFormNumber.ClientID%>").val()];
            var totalHour = $("#<%=txtHours.ClientID%>").val();

            if (leaCode == null || leaCode === "") return "";

            if ($("#<%=hfFieldMode.ClientID%>").val() === "ReturnApplicant" || $("#<%=hfFieldMode.ClientID%>").val() === "Signin")
            {
                $uof.pageMethod.sync("UpdateStatus", data);
            }
           //沒有公司統編或員編就不跑其他驗證
            if (applicantEmployeeNo === '' || applicantCompanyNo === '') {
                return;
            }
            data = [applicantCompanyNo, applicantEmployeeNo, agnetJSON, startDate, startTime, endDate, endTime, leaCode, reason, eventDate, 'false', totalHour];
            result = $uof.pageMethod.sync("ValidateApply", data);
        
            if(result !== '')
            {
                source.textContent = result;
                arguments.IsValid = false;
                return;
            }
        }
    </script>

    <table width="100%" class="PopTable" cellspacing="1">
        <tr>
            <td align="center" class="PopTableHeader">
                <center>
                    <asp:Label ID="lblDataGridTitle" runat="server" Text="新增明細子欄位" meta:resourcekey="lblDataGridTitleResource1"></asp:Label>
                </center>
            </td>
        </tr>
    </table>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <table width="100%">
                <tr>
                    <td>
                        <table border="0" cellpadding="0" cellspacing="0" width="100%">
                            <tr runat="server" id="trDetailIndex">
                                <td width="18" runat="server"></td>
                                <td style="text-align: right" runat="server">
                                    <asp:Label ID="lblDetailCountName" runat="server" Font-Bold="True" Text="項次:" meta:resourcekey="lblDetailCountNameResource1"></asp:Label>
                                    <asp:Label ID="lblIndex" runat="server" Font-Bold="True"></asp:Label>
                                </td>
                                <td width="18" runat="server"></td>
                            </tr>
                            <tr>
                                <td style="height: 27px">&nbsp;</td>
                                <td style="height: 27px" valign="top">&nbsp;
                            <asp:Table ID="tbleave" runat="server" BorderWidth="0px" CellPadding="2" Width="100%">
                                <asp:TableRow runat="server">
                                    <asp:TableCell ColumnSpan="2" CssClass="d" HorizontalAlign="Left" Width="15%" runat="server">
                                        <asp:Image ID="Image1" runat="server" meta:resourcekey="Image1Resource1" />
                                        <asp:Label ID="Label6" runat="server" Text="假別與時間" CssClass="i" meta:resourcekey="Label6Resource1"></asp:Label>
                                    </asp:TableCell>
                                </asp:TableRow>
                                <asp:TableRow runat="server">
                                    <asp:TableCell Style="white-space: nowrap" HorizontalAlign="Right" Width="15%" CssClass="ul" runat="server">
                                        <asp:Label ID="Label8" runat="server" Text="*" ForeColor="Red" meta:resourcekey="Label8Resource1"></asp:Label>
                                        <asp:Label ID="Label1" runat="server" Text="假別：" meta:resourcekey="Label1Resource1"></asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell ColumnSpan="3" HorizontalAlign="Left" CssClass="ul" runat="server">
                                        <table>
                                            <tr>
                                                <td>
                                                    <asp:Label ID="lblLeaveCode" runat="server" Visible="False" meta:resourcekey="lblLeaveCodeResource1"></asp:Label>
                                                    <asp:DropDownList ID="ddlLeaveCode" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlLeaveCode_SelectedIndexChanged" meta:resourcekey="ddlLeaveCodeResource1"></asp:DropDownList>
                                                    <asp:HiddenField ID="hfLeaveCode" runat="server" />
                                                    &nbsp;&nbsp;
                                                    <asp:LinkButton ID="lbtnUserLeaveData" runat="server" Text="可休假餘額" meta:resourcekey="lbtnUserLeaveDataResource1"></asp:LinkButton>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="3">
                                                    <asp:Label ID="lblUnavailable" runat="server" Text="選擇假別已不適用，請通知管理員至104系統中檢查相關設定" Visible="False" ForeColor="Blue" meta:resourcekey="lblUnavailableResource1"></asp:Label>
                                                </td>
                                            </tr>
                                        </table>
                                    </asp:TableCell>
                                </asp:TableRow>
                                <asp:TableRow runat="server">
                                    <asp:TableCell Style="white-space: nowrap" HorizontalAlign="Right" Width="15%" CssClass="ul" runat="server">
                                        <asp:Label ID="Label9" runat="server" Text="*" ForeColor="Red" meta:resourcekey="Label9Resource1"></asp:Label>
                                        <asp:Label ID="Label2" runat="server" Text="請假時間(起)：" meta:resourcekey="Label2Resource1"></asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell ColumnSpan="3" HorizontalAlign="Left" CssClass="ul" runat="server">
                                        <table>
                                            <tr>
                                                <td>
                                                    <telerik:RadDatePicker ID="rdStartDate" runat="server" OnSelectedDateChanged="rdStartDate_SelectedDateChanged" AutoPostBack="True" meta:resourcekey="rdStartDateResource1"></telerik:RadDatePicker>
                                                </td>
                                                <td>
                                                    <asp:Label ID="lblStartDate" runat="server" Visible="False" meta:resourcekey="lblStartDateResource1"></asp:Label>
                                                    <telerik:RadTimePicker ID="rdStartTime" runat="server" meta:resourcekey="rdStartTimeResource1"></telerik:RadTimePicker>
                                                </td>
                                            </tr>
                                        </table>
                                    </asp:TableCell>
                                </asp:TableRow>
                                <asp:TableRow runat="server">
                                    <asp:TableCell Style="white-space: nowrap" HorizontalAlign="Right" Width="15%" CssClass="ul" runat="server">
                                        <asp:Label ID="Label10" runat="server" Text="*" ForeColor="Red" meta:resourcekey="Label10Resource1"></asp:Label>
                                        <asp:Label ID="Label3" runat="server" Text="請假時間(訖)：" meta:resourcekey="Label3Resource1"></asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell ColumnSpan="3" HorizontalAlign="Left" CssClass="ul" runat="server">
                                        <table>
                                            <tr>
                                                <td>
                                                    <telerik:RadDatePicker ID="rdEndDate" runat="server" meta:resourcekey="rdEndDateResource1"></telerik:RadDatePicker>
                                                </td>
                                                <td>
                                                    <asp:Label ID="lblEndDate" runat="server" Visible="False" meta:resourcekey="lblEndDateResource1"></asp:Label>
                                                    <telerik:RadTimePicker ID="rdEndTime" runat="server" meta:resourcekey="rdEndTimeResource1"></telerik:RadTimePicker>
                                                </td>
                                            </tr>
                                        </table>
                                    </asp:TableCell>
                                </asp:TableRow>
                                <asp:TableRow ID="trEventDate" runat="server">
                                    <asp:TableCell ID="tdlblEventDate" Style="white-space: nowrap" HorizontalAlign="Right" Width="15%" CssClass="ul" runat="server">
                                        <asp:Label ID="lblEventDateStar" runat="server" Text="*" ForeColor="Red" meta:resourcekey="lblEventDateStarResource1"></asp:Label>
                                        <asp:Label ID="Label5" runat="server" Text="事件發生日：" meta:resourcekey="Label5Resource1"></asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell ID="tdEventDate"  ColumnSpan="3" HorizontalAlign="Left" CssClass="ul" runat="server">
                                        <asp:Label ID="lblEventDate" runat="server" meta:resourcekey="lblEventDateResource2"></asp:Label>
                                    <telerik:RadDatePicker ID="rdEventDate" runat="server" meta:resourcekey="rdEventDateResource1"></telerik:RadDatePicker>
                                </asp:TableCell>
                                </asp:TableRow>
                                <asp:TableRow runat="server">
                                    <asp:TableCell Style="white-space: nowrap" HorizontalAlign="Right" Width="15%" CssClass="ul" runat="server">
                                        <asp:Label ID="Label11" runat="server" Text="*" ForeColor="Red" meta:resourcekey="Label11Resource1"></asp:Label>
                                    <asp:Label ID="Label4" runat="server" Text="請假時(天)數：" meta:resourcekey="Label4Resource1"></asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell ID="tdHours" ColumnSpan="3" HorizontalAlign="Left" CssClass="ul" runat="server">
                                        <table>
                                            <tr>
                                                <td>
                                                    <asp:Label ID="lblHours" runat="server" meta:resourcekey="lblHoursResource1"></asp:Label>
                                                    <asp:TextBox ID="txtHours" runat="server" Style="display: none" meta:resourcekey="txtHoursResource1"></asp:TextBox>
                                                    <asp:TextBox ID="txtUnit" runat="server" Style="display: none" meta:resourcekey="txtUnitResource1"></asp:TextBox>
                                                </td>
                                                <td>
                                                    <telerik:RadButton ID="rdbtnCal" CausesValidation="False" OnClientClicked="CalBtnClick" runat="server" Text="計算" AutoPostBack="False" meta:resourcekey="rdbtnCalResource1"></telerik:RadButton>
                                                </td>
                                            </tr>
                                        </table>
                                    </asp:TableCell>
                                </asp:TableRow>
                            </asp:Table>
                            <table>
                                <tr>
                                    <td>
                                        <asp:CustomValidator ID="cvShowLeaveCodeError" runat="server" Display="Dynamic" meta:resourcekey="cvShowLeaveCodeErrorResource1"></asp:CustomValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:CustomValidator ID="cvMissingInfo" runat="server" ErrorMessage="申請者無員工編號或公司統一編號資訊" Display="Dynamic" meta:resourcekey="cvMissingInfoResource1"></asp:CustomValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:CustomValidator ID="cvCheckSelectLeaveCode" runat="server" ErrorMessage="請選擇假別" Display="Dynamic" ClientValidationFunction="CheckSelectLeaveCode" meta:resourcekey="cvCheckSelectLeaveCodeResource1"></asp:CustomValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:CustomValidator ID="cvCal" runat="server" ErrorMessage="請計算請假時(天)數" Display="Dynamic" meta:resourcekey="cvCalResource1"></asp:CustomValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:TextBox ID="txtError" runat="server" Style="display: none; width: 300px; border-width: 0;" ForeColor="Red" meta:resourcekey="txtErrorResource1"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:CustomValidator ID="cvCheckOverlapping" runat="server" ErrorMessage="請假時間重疊，請重新設定" Display="Dynamic" meta:resourcekey="cvCheckOverlappingResource1"></asp:CustomValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:CustomValidator ID="cvCheckContinuous" runat="server" ErrorMessage="請假時間需連續，請重新設定" Display="Dynamic" meta:resourcekey="cvCheckContinuousResource1"></asp:CustomValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:CustomValidator ID="cvApply" runat="server" Display="Dynamic" meta:resourcekey="cvApplyResource1"></asp:CustomValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:CustomValidator ID="cvLeaveLimit" runat="server" Display="Dynamic" meta:resourcekey="cvLeaveLimitResource1"></asp:CustomValidator>
                                    </td>
                                </tr>
                            </table>
                                    <br />
                                    <br />
                                    <asp:LinkButton ID="lbtnClear" CausesValidation="False" runat="server" Font-Underline="True" OnClick="lbtnClear_Click" Text="清空資料" meta:resourcekey="lbtnClearResource1" />
                                </td>
                            </tr>
                            <tr>
                                <td style="height: 27px"></td>
                                <td style="height: 27px;" align="right" valign="bottom"></td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>            
            <asp:Button ID="btnClearHours" runat="server" Text="Button" style="display:none" OnClick="btnClearHours_Click" CausesValidation="False" meta:resourcekey="btnClearHoursResource1" />
            <asp:Button ID="btnPostBack" runat="server" Text="Button" style="display:none" OnClick="btnPostBack_Click" CausesValidation="False" meta:resourcekey="btnPostBackResource1" />
        </ContentTemplate>
    </asp:UpdatePanel>

    <asp:Label ID="lblSelect" runat="server" Text="請選擇" Visible="False" meta:resourcekey="lblSelectResource1"></asp:Label>
    <asp:Label ID="lblMsgSigner" runat="server" Text="填寫者" Visible="False" meta:resourcekey="lblMsgSignerResource1"></asp:Label>
    <asp:Label ID="lblLeaveBefore" runat="server" Text="需於請假開始日期前" Style="display: none" meta:resourcekey="lblLeaveBeforeResource1"></asp:Label>
    <asp:Label ID="lblLeaveAfter" runat="server" Text="需於請假結束日期後" Style="display: none" meta:resourcekey="lblLeaveAfterResource1"></asp:Label>
    <asp:Label ID="lblLimitBeforeErrMsg" runat="server" Text="日提出申請，已超出申請期限" Style="display: none" meta:resourcekey="lblLimitBeforeErrMsgResource1"></asp:Label>
    <asp:Label ID="lblLimitAfterErrMsg" runat="server" Text="日提出申請，已超出申請期限" Style="display: none" meta:resourcekey="lblLimitAfterErrMsgResource1"></asp:Label>
    <asp:HiddenField ID="hidPostBack" runat="server" />
    <asp:HiddenField ID="hfApplicantEmployeeNo" runat="server" />
    <asp:HiddenField ID="hfApplicantCompanyNo" runat="server" />
    <asp:HiddenField ID="hfApplicant" runat="server" />
    <asp:HiddenField ID="hfFieldMode" runat="server" />
    <asp:HiddenField ID="hfFormNumber" runat="server" />
    <asp:HiddenField ID="hfApplyDate" runat="server" />
    <asp:HiddenField ID="hfLeaveInfoDt" runat="server" />
    <asp:HiddenField ID="hfLeaveGuid" runat="server" />
</asp:Content>
