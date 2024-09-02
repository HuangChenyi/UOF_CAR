<%@ Page Title="新增明細" Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" CodeBehind="OverTimeBatchInfoAdvEdit.aspx.cs" Inherits="Ede.Uof.Web.HR104.Duty.Form.OverTimeBatchInfoAdvEdit" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" %>

<%@ Register Src="~/Common/ChoiceCenter/UC_ChoiceList.ascx" TagPrefix="uc1" TagName="UC_ChoiceList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        .ul {
            border-bottom: 1px dotted silver
        }
    </style>

    <script type="text/javascript">
        Sys.Application.add_load(function () {
            if ($('#<%=hfPostBack.ClientID%>').val() != 'True') return;
            $('#<%=hfPostBack.ClientID%>').val('False');

            var curwindow = $uof.dialog.getOpener();
            var pd;
            if (curwindow) {
                pd = curwindow.document;
            } else if (typeof (dialogArguments) != "undefined") {
                pd = dialogArguments.document;
            }

            if (pd) {
                var listItems = $uof.tool.htmlDecode('<%=System.Web.Security.AntiXss.AntiXssEncoder.HtmlEncode(Request.QueryString["listClientId"],true)%>');
                var hfVal = $("#" + listItems, pd).val();
                $("#<%=hfListItem.ClientID%>").val(hfVal);


                //帶入修改項目
                var mode = $uof.tool.htmlDecode('<%=System.Web.Security.AntiXss.AntiXssEncoder.HtmlEncode(Request.QueryString["mode"],true)%>');
                if (mode == "Modify") {
                    var resultItems = $uof.tool.htmlDecode('<%=System.Web.Security.AntiXss.AntiXssEncoder.HtmlEncode(Request.QueryString["listPriorCheckResultId"],true)%>');
                    var hfResultVal = $("#" + resultItems, pd).val();
                    $("#<%=hfPriorCheckResult.ClientID%>").val(hfResultVal);
                    $("#<%=btnPostBack.ClientID%>").click();
                }
            }
        });

        //請選擇人員
        function CheckUsersEmpty(source, args) {
            var mode = $uof.tool.htmlDecode('<%=System.Web.Security.AntiXss.AntiXssEncoder.HtmlEncode(Request.QueryString["mode"],true)%>');
            if (mode == "Add") {
                var allUsers = $("#<%=hfPreViewTimeTableUsers.ClientID %>").val();
                if (allUsers === null || allUsers === '[]' || allUsers === '') {
                    args.IsValid = false;
                }
                else {
                    args.IsValid = true;
                }
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

        //請選擇扣除時數
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
    </script>

    <asp:UpdatePanel runat="server" ID="UpdatePanelOverTimeBatchInfoAdvEdit">
        <ContentTemplate>
            <table width="100%" class="PopTable" cellspacing="1">
                <tr>
                    <td align="center" class="PopTableHeader">
                        <center>
                            <asp:Label ID="lblDataGridTitle" runat="server" Text="新增明細子欄位" meta:resourcekey="lblDataGridTitleResource1"></asp:Label>
                        </center>
                    </td>
                </tr>
            </table>

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
                        <asp:Table ID="Table1" runat="server" BorderWidth="0px" CellPadding="2" Width="100%">
                            <asp:TableRow Style="padding-bottom: 5px;" runat="server">
                                <asp:TableCell ColumnSpan="2" CssClass="d" HorizontalAlign="Left" Width="15%" Style="padding-bottom: 5px;" runat="server">
                                    <asp:Image ID="Image1" runat="server" ImageUrl="~/App_Themes/DefaultTheme/images/icon01.gif" meta:resourcekey="Image1Resource1" />
                                    <asp:Label ID="lblOvertimeInfoTitle" runat="server" Text="加班資訊" CssClass="i" meta:resourcekey="lblOvertimeInfoTitleResource1"></asp:Label>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow runat="server">
                                <asp:TableCell Style="white-space: nowrap" HorizontalAlign="Right" Width="15%" CssClass="ul" runat="server">
                                    <asp:Label ID="Label1" runat="server" ForeColor="Red" Text="*" meta:resourcekey="Label9Resource1"></asp:Label>
                                    <asp:Label runat="server" ID="lblUsersTitle" Text="加班人員：" meta:resourcekey="lblUsersTitleResource1"></asp:Label>
                                </asp:TableCell>
                                <asp:TableCell ColumnSpan="3" HorizontalAlign="Left" CssClass="ul" runat="server">
                                    <uc1:UC_ChoiceList runat="server" ID="UC_ChoiceList" ExpandToUser="true" ShowMember="false" IsAllowEdit="false" />
                                    <asp:CustomValidator ID="cvCheckUsers" runat="server" Display="Dynamic" ClientValidationFunction="CheckUsersEmpty" ErrorMessage="請選擇加班人員" ForeColor="Red" meta:resourcekey="cvCheckUsersResource1"></asp:CustomValidator>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow runat="server">
                                <asp:TableCell Style="white-space: nowrap" HorizontalAlign="Right" Width="15%" CssClass="ul" runat="server">
                                    <asp:Label ID="Label2" runat="server" ForeColor="Red" Text="*" meta:resourcekey="Label9Resource1"></asp:Label>
                                    <asp:Label runat="server" ID="lblOTTypeTitle" Text="加班折換方式：" meta:resourcekey="lblOTTypeTitleResource1"></asp:Label>
                                </asp:TableCell>
                                <asp:TableCell ColumnSpan="3" HorizontalAlign="Left" CssClass="ul" runat="server">
                                    <asp:RadioButtonList ID="rblOverTimeType" runat="server" RepeatDirection="Horizontal" AutoPostBack="True" OnSelectedIndexChanged="ValueChanged" meta:resourcekey="rblOverTimeTypeResource1">
                                        <asp:ListItem Text="轉加班費" Value="Payment" meta:resourcekey="rblOverTimeTypePaymentResource1"></asp:ListItem>
                                        <asp:ListItem Text="轉補休" Value="TimeOff" meta:resourcekey="rblOverTimeTypeTimeOffResource1"></asp:ListItem>
                                    </asp:RadioButtonList>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow runat="server" ID="tRowMealAllowance">
                                <asp:TableCell Style="white-space: nowrap" HorizontalAlign="Right" Width="15%" CssClass="ul" runat="server">
                                    <asp:Label ID="Label3" runat="server" ForeColor="Red" Text="*" meta:resourcekey="Label9Resource1"></asp:Label>
                                    <asp:Label runat="server" ID="lblMealAllowanceTitle" Text="支領誤餐費：" meta:resourcekey="lblMealAllowanceTitleResource1"></asp:Label>
                                </asp:TableCell>
                                <asp:TableCell ColumnSpan="3" HorizontalAlign="Left" CssClass="ul" runat="server">
                                    <asp:RadioButtonList ID="rblMealAllowance" runat="server" RepeatDirection="Horizontal" AutoPostBack="True" OnSelectedIndexChanged="ValueChanged" meta:resourcekey="rblMealAllowanceResource1">
                                        <asp:ListItem Text="依HR系統誤餐費設定" Value="Yes" meta:resourcekey="rblMealAllowanceYesResource1"></asp:ListItem>
                                        <asp:ListItem Text="不支領" Value="No" meta:resourcekey="rblMealAllowanceNoResource1"></asp:ListItem>
                                    </asp:RadioButtonList>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow runat="server">
                                <asp:TableCell Style="white-space: nowrap" HorizontalAlign="Right" Width="15%" CssClass="ul" runat="server">
                                    <asp:Label ID="Label4" runat="server" ForeColor="Red" Text="*" meta:resourcekey="Label9Resource1"></asp:Label>
                                    <asp:Label runat="server" ID="lblStartTimeTitle" Text="加班時間(起)：" meta:resourcekey="lblStartTimeTitleResource1"></asp:Label>
                                </asp:TableCell>
                                <asp:TableCell ColumnSpan="3" HorizontalAlign="Left" CssClass="ul" runat="server">
                                    <table>
                                        <tr>
                                            <td>
                                                <telerik:RadDatePicker ID="rdStartDate" runat="server" AutoPostBack="True" OnSelectedDateChanged="rdStartDate_SelectedDateChanged" meta:resourcekey="rdStartDateResource1">
                                                </telerik:RadDatePicker>
                                            </td>
                                            <td>
                                                <telerik:RadTimePicker ID="rdStartTime" runat="server" AutoPostBack="True" OnSelectedDateChanged="SelectedDateChanged" meta:resourcekey="rdStartTimeResource1">
                                                </telerik:RadTimePicker>
                                            </td>
                                        </tr>
                                    </table>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow runat="server">
                                <asp:TableCell Style="white-space: nowrap" HorizontalAlign="Right" Width="15%" CssClass="ul" runat="server">
                                    <asp:Label ID="Label5" runat="server" ForeColor="Red" Text="*" meta:resourcekey="Label9Resource1"></asp:Label>
                                    <asp:Label runat="server" ID="lblEndTimeTitle" Text="加班時間(訖)：" meta:resourcekey="lblEndTimeTitleResource1"></asp:Label>
                                </asp:TableCell>
                                <asp:TableCell ColumnSpan="3" HorizontalAlign="Left" CssClass="ul" runat="server">
                                    <table>
                                        <tr>
                                            <td>
                                                <telerik:RadDatePicker ID="rdEndDate" runat="server" AutoPostBack="True" OnSelectedDateChanged="SelectedDateChanged" meta:resourcekey="rdEndDateResource1">
                                                </telerik:RadDatePicker>
                                            </td>
                                            <td>
                                                <telerik:RadTimePicker ID="rdEndTime" runat="server" AutoPostBack="True" OnSelectedDateChanged="SelectedDateChanged" meta:resourcekey="rdEndTimeResource1">
                                                </telerik:RadTimePicker>
                                            </td>
                                        </tr>
                                    </table>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow runat="server" ID="tRowExcludeHours">
                                <asp:TableCell Style="white-space: nowrap" HorizontalAlign="Right" Width="15%" CssClass="ul" runat="server">
                                    <asp:Label ID="Label6" runat="server" ForeColor="Red" Text="*" meta:resourcekey="Label9Resource1"></asp:Label>
                                    <asp:Label runat="server" ID="lblExcludeHours" Text="扣除時數：" meta:resourcekey="lblExcludeHoursResource1"></asp:Label>
                                </asp:TableCell>
                                <asp:TableCell ColumnSpan="3" HorizontalAlign="Left" CssClass="ul" runat="server">
                                    <asp:CheckBoxList ID="cblExcludeHours" runat="server" RepeatDirection="Horizontal" AutoPostBack="True" OnSelectedIndexChanged="ValueChanged" meta:resourcekey="cblExcludeHoursResource1">
                                        <asp:ListItem Text="午餐" Value="Lunch|1" meta:resourcekey="cblExcludeHoursLunchResource1"></asp:ListItem>
                                        <asp:ListItem Text="晚餐" Value="Dinner|2" meta:resourcekey="cblExcludeHoursDinnerResource1"></asp:ListItem>
                                        <asp:ListItem Text="宵夜" Value="Supper|4" meta:resourcekey="cblExcludeHoursSupperResource1"></asp:ListItem>
                                        <asp:ListItem Text="其他" Value="Other|8" meta:resourcekey="cblExcludeHoursOtherResource1"></asp:ListItem>
                                    </asp:CheckBoxList>
                                    <asp:CustomValidator ID="cvExcludeHours" runat="server" Display="Dynamic" ClientValidationFunction="CalExcludeHours" ErrorMessage="請選擇扣除時數" ForeColor="Red" meta:resourcekey="cvExcludeHoursResource1"></asp:CustomValidator>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow runat="server" ID="tRowPunchCheck">
                                <asp:TableCell Style="white-space: nowrap" HorizontalAlign="Right" Width="15%" CssClass="ul" runat="server">
                                    <asp:Label ID="Label7" runat="server" ForeColor="Red" Text="*" meta:resourcekey="Label9Resource1"></asp:Label>
                                    <asp:Label runat="server" ID="lblPunchCheckTitle" Text="刷卡資料：" meta:resourcekey="lblPunchCheckTitleResource1"></asp:Label>
                                </asp:TableCell>
                                <asp:TableCell ColumnSpan="3" HorizontalAlign="Left" CssClass="ul" runat="server">
                                    <asp:RadioButtonList ID="rblPunchCheck" runat="server" RepeatDirection="Horizontal" AutoPostBack="True" OnSelectedIndexChanged="ValueChanged" meta:resourcekey="rblPunchCheckResource1">
                                        <asp:ListItem Text="依HR系統加班刷卡核對設定" Value="Yes" meta:resourcekey="rblPunchCheckYesResource1"></asp:ListItem>
                                        <asp:ListItem Text="不需檢查" Value="No" meta:resourcekey="rblPunchCheckNoResource1"></asp:ListItem>
                                    </asp:RadioButtonList>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow runat="server">
                                <asp:TableCell Style="white-space: nowrap" HorizontalAlign="Right" Width="15%" CssClass="ul" runat="server">
                                    <asp:Label runat="server" ID="lblCalResultTitle" Text="加班時數：" meta:resourcekey="lblCalResultTitleResource1"></asp:Label>
                                </asp:TableCell>
                                <asp:TableCell ColumnSpan="3" HorizontalAlign="Left" CssClass="ul" runat="server">
                                    <asp:Label ID="lblCalResult" runat="server" Visible="false" meta:resourcekey="lblHoursResource1"></asp:Label>
                                    <asp:Label ID="lblCalResultMessage" runat="server" Text="待計算" Visible="false" meta:resourcekey="lblCalResultMessageResource2"></asp:Label>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow runat="server">
                                <asp:TableCell Style="white-space: nowrap" HorizontalAlign="Right" Width="15%" CssClass="ul" runat="server">
                                    <asp:Label ID="lblRemartTitleRequired" runat="server" ForeColor="Red" Text="*" Visible="false" meta:resourcekey="Label9Resource1"></asp:Label>
                                    <asp:Label runat="server" ID="lblRemarkTitle" Text="事由：" meta:resourcekey="lblRemarkTitleResource1"></asp:Label>
                                </asp:TableCell>
                                <asp:TableCell ColumnSpan="3" HorizontalAlign="Left" CssClass="ul" runat="server">
                                    <asp:TextBox ID="txtRemark" runat="server" Width="90%" TextMode="MultiLine" Rows="3" meta:resourcekey="txtRemarkResource1"></asp:TextBox>

                                    <br />
                                    <asp:CustomValidator runat="server" ID="cvRemark" Display="Dynamic" ForeColor="Red" ErrorMessage="不可空白" Visible="False" ClientValidationFunction="CheckRemarkRequired" meta:resourcekey="cvRemarkResource1"></asp:CustomValidator>
                                </asp:TableCell>
                            </asp:TableRow>
                        </asp:Table>
                        <br />
                    </td>
                </tr>
                <tr>
                    <td colspan="2" style="padding-left: 18px;">
                        <asp:Label runat="server" ID="lblUserErrorMsg" ForeColor="Red" meta:resourcekey="lblUserErrorMsgResource1"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" style="padding-left: 18px;">
                        <asp:CustomValidator ID="cvCheckDate" runat="server" ErrorMessage="日期錯誤:輸入之結束日期(時間) 小於 開始日期(時間),請重新填寫,謝謝!!" ClientValidationFunction="CheckDate" Display="Dynamic" Visible="False" meta:resourcekey="cvCheckDateResource1"></asp:CustomValidator>
                    </td>
                </tr>
                <tr>
                    <td style="height: 27px">&nbsp;</td>
                    <td>
                        <asp:LinkButton ID="lbtnClear" CausesValidation="False" runat="server" Font-Underline="True" OnClick="lbtnClear_Click" Text="清空資料" meta:resourcekey="lbtnClearResource1" />
                    </td>
                </tr>
                <tr>
                    <td style="height: 27px"></td>
                    <td style="height: 27px;" align="right" valign="bottom"></td>
                </tr>
            </table>

            <div style="display: none;">
                <asp:HiddenField ID="hfPostBack" runat="server" Value="True" />
                <asp:Button runat="server" ID="btnPostBack" OnClick="btnPostBack_Click" CausesValidation="false" meta:resourcekey="btnPostBackResource1" />
                <asp:HiddenField ID="hfPreViewTimeTableUsers" runat="server" />
                <asp:HiddenField ID="hfListItem" runat="server" />
                <asp:HiddenField ID="hfNewListItem" runat="server" />
                <asp:HiddenField ID="hfPriorCheckResult" runat="server" />
            </div>

        </ContentTemplate>
    </asp:UpdatePanel>

    <asp:Label runat="server" ID="lblOverTimeInfoRepeatMsg" Visible="False" Text="{0}，加班時段重複，請修正重複的加班資料。" meta:resourcekey="lblOverTimeInfoRepeatMsgResource1"></asp:Label>
</asp:Content>
