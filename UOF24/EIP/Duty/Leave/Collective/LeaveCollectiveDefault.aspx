<%@ Page Title="" Language="C#" MasterPageFile="~/Master/DefaultMasterPage.master" AutoEventWireup="true" Inherits="EIP_Duty_Leave_Collective_LeaveCollectiveDefault" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" CodeBehind="LeaveCollectiveDefault.aspx.cs" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>
<%@ Register Src="../../../../Common/ChoiceCenter/UC_ChoiceList.ascx" TagName="UC_ChoiceList" TagPrefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <style type="text/css">
        .RightAligned {
            text-align: right;
        }
    </style>
    <script type="text/javascript">
        function OnValueChanging(sender, args) {

            if (new String(args.get_newValue()) == "" && new String(args.get_newValue()) != "0") {
                args.set_newValue(args.get_oldValue());
            }
        }
    </script>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <telerik:RadToolBar ID="RadToolBar1" runat="server" Width="100%"
                OnButtonClick="RadToolBar1_OnButtonClick" Style="margin-bottom: 0" meta:resourcekey="RadToolBar1Resource1" SingleClick="None">
                <Items>
                    <telerik:RadToolBarButton runat="server" Text="查詢" Value="Query"
                        CheckedImageUrl="~/Common/Images/Icon/icon_m39.gif"
                        DisabledImageUrl="~/Common/Images/Icon/icon_m39.gif"
                        HoveredImageUrl="~/Common/Images/Icon/icon_m39.gif"
                        ImageUrl="~/Common/Images/Icon/icon_m39.gif"
                        meta:resourcekey="RadToolBarQueryResource1">
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton IsSeparator="True" runat="server" meta:resourcekey="RadToolBarButtonResource1"></telerik:RadToolBarButton>
                    <telerik:RadToolBarButton runat="server" Text="產生明細" Value="GenerateLeaveDetail" 
                        CheckedImageUrl="~/Common/Images/Icon/icon_m08.gif"
                        DisabledImageUrl="~/Common/Images/Icon/icon_m08.gif"
                        HoveredImageUrl="~/Common/Images/Icon/icon_m08.gif"
                        ImageUrl="~/Common/Images/Icon/icon_m08.gif"
                        meta:resourcekey="RadToolBarDetailResource1">
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton IsSeparator="True" runat="server" meta:resourcekey="RadToolBarButtonResource2"></telerik:RadToolBarButton>
                    <telerik:RadToolBarButton runat="server" meta:resourcekey="RadToolBarButtonResource3">
                        <ItemTemplate>
                            <asp:Label ID="Label6" runat="server" Text="*查詢時，只會依照扣假日期起訖及事由為條件查詢" CssClass="SizeMemo" meta:resourcekey="Label6Resource1"></asp:Label>
                        </ItemTemplate>
                    </telerik:RadToolBarButton>
                </Items>
            </telerik:RadToolBar>
            <table class="PopTable">
                <tr>
                    <td style="width: 10%; white-space: nowrap">
                        <asp:Label ID="Label1" runat="server" Text="*" ForeColor="Red"
                            meta:resourcekey="Label1Resource1"></asp:Label>
                        <asp:Label ID="lblStrTime" runat="server" Text="時間(起)"
                            meta:resourcekey="lblStrTimeResource1"></asp:Label>
                    </td>
                    <td>
                        <table>
                            <tr>
                                <td>
                                    <telerik:RadDatePicker ID="rdStrDate" runat="server" AutoPostBack="True" meta:resourcekey="rdStrDateResource1" OnSelectedDateChanged="rdStrDate_SelectedDateChanged">
                                    </telerik:RadDatePicker>
                                </td>
                                <td>&nbsp;</td>
                                <td>
                                    <telerik:RadTimePicker ID="rdStrTime" runat="server" Width="80px" AutoPostBack="True" meta:resourcekey="rdStrTimeResource1" OnSelectedDateChanged="rdStrTime_SelectedDateChanged">
                                    </telerik:RadTimePicker>
                                </td>
                                <td>
                                    <asp:CustomValidator ID="cvStr" runat="server" meta:resourcekey="cvStrResource1"></asp:CustomValidator>
                                </td>
                            </tr>
                        </table>
                    </td>
                    <td style="width: 10%; white-space: nowrap">
                        <asp:Label ID="Label2" runat="server" Text="*" ForeColor="Red"
                            meta:resourcekey="Label2Resource1"></asp:Label>
                        <asp:Label ID="lblEndTime" runat="server" Text="時間(訖)"
                            meta:resourcekey="lblEndTimeResource1"></asp:Label>
                    </td>
                    <td style="width: 40%">
                        <table>
                            <tr>
                                <td>
                                    <telerik:RadDatePicker ID="rdEndDate" runat="server" meta:resourcekey="rdEndDateResource1">
                                    </telerik:RadDatePicker>
                                </td>
                                <td>&nbsp;</td>
                                <td>
                                    <telerik:RadTimePicker ID="rdEndTime" runat="server" Width="80px" meta:resourcekey="rdEndTimeResource1">
                                    </telerik:RadTimePicker>
                                </td>
                                <td>
                                    <asp:CustomValidator ID="cvEnd" runat="server" meta:resourcekey="cvEndResource1"></asp:CustomValidator>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td style="width: 10%; white-space: nowrap">
                        <asp:Label ID="Label3" runat="server" Text="*" ForeColor="Red"
                            meta:resourcekey="Label3Resource1"></asp:Label>
                        <asp:Label ID="lblMember" runat="server" Text="人員"
                            meta:resourcekey="lblMemberResource1"></asp:Label>
                    </td>
                    <td style="white-space: nowrap">
                        <table>
                            <tr>
                                <td>
                                    <uc1:UC_ChoiceList ID="UC_ChoiceList1" runat="server" ShowMember="False"
                                        ExpandToUser="True" TreeHeight="100" TreeWidth="250" />
                                </td>
                                <td>
                                    <asp:CustomValidator ID="cvMember" runat="server" ErrorMessage="請選擇人員" ForeColor="Red" Display="Dynamic"
                                        meta:resourcekey="cvMemberResource1"></asp:CustomValidator>

                                    <asp:CustomValidator ID="cvCheckSameDept" runat="server" ErrorMessage="扣假人員所屬部門的假別設定需相同" ForeColor="Red" Display="Dynamic"
                                        meta:resourcekey="cvCheckSameDeptResource1"></asp:CustomValidator>
                                </td>
                            </tr>
                        </table>
                        <asp:HiddenField ID="hfUsers" runat="server" />
                    </td>

                    <td style="width: 10%; white-space: nowrap">
                        <asp:Label ID="lblReson0" runat="server" Text="事由"
                            meta:resourcekey="lblReson0Resource1"></asp:Label>
                    </td>
                    <td>

                        <asp:TextBox ID="txtReson" runat="server" MaxLength="255" Width="100%"
                            meta:resourcekey="txtResonResource1"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td style="width: 10%; white-space: nowrap">
                        <asp:Label ID="Label5" runat="server" ForeColor="Red" Text="*" meta:resourcekey="Label5Resource1"></asp:Label>
                        <asp:Label ID="lblLeaveCode" runat="server" Text="假別天數" meta:resourcekey="lblLeaveCodeResource1"></asp:Label>
                    </td>

                    <td style="border-right-style: none">
                        <table>
                            <tr>
                                <td>
                                    <asp:DropDownList ID="ddlLeaveCode" runat="server" AutoPostBack="True" Enabled="False"
                                        OnSelectedIndexChanged="ddlLeaveCode_SelectedIndexChanged"
                                        meta:resourcekey="ddlLeaveCodeResource1">
                                    </asp:DropDownList>
                                </td>
                                <td style="padding: 0px 3px 0px 3px">
                                    <telerik:RadNumericTextBox ID="rdHr" runat="server" Enabled="False" OnTextChanged="rdHr_TextChanged" CssClass="RightAligned" Width="80px" DataType="System.Decimal" Culture="zh-TW" DbValueFactor="1" LabelCssClass="" LabelWidth="64px" meta:resourcekey="rdHrResource1">
                                        <NegativeStyle Resize="None" />
                                        <NumberFormat DecimalDigits="1" ZeroPattern="n" />
                                        <EmptyMessageStyle Resize="None" />
                                        <ReadOnlyStyle Resize="None" />
                                        <FocusedStyle Resize="None" />
                                        <DisabledStyle Resize="None" />
                                        <InvalidStyle Resize="None" />
                                        <HoveredStyle Resize="None" />
                                        <EnabledStyle Resize="None" />
                                    </telerik:RadNumericTextBox>
                                </td>
                                <td>
                                    <asp:Label ID="lblTime" runat="server" Visible="False"
                                        meta:resourcekey="lblTimeResource1"></asp:Label>
                                </td>
                                <td>&nbsp;
                                </td>
                                <td>
                                    <table style="width: 100%">
                                        <tr>
                                            <td style="white-space: nowrap">
                                                <asp:CustomValidator ID="cvLeaveCode" runat="server" ErrorMessage="請選擇假別" ForeColor="Red" Display="Dynamic"
                                                    meta:resourcekey="cvLeaveCodeResource1"></asp:CustomValidator>

                                            </td>
                                            <td>&nbsp;
                                            </td>
                                            <td style="width: 56px">
                                                <asp:CustomValidator ID="cvTime" runat="server" ForeColor="Red" Display="Dynamic"
                                                    meta:resourcekey="cvTimeResource1"></asp:CustomValidator>
                                            </td>
                                        </tr>

                                    </table>
                                </td>
                            </tr>
                        </table>
                    </td>
                    <td colspan="2" class="PopTableRightTD" style="text-align: left; border-left-style: none">
                        <asp:TextBox ID="tbFault" runat="server" Height="120px" Width="485px" TextMode="MultiLine"
                            Visible="False" ReadOnly="True" meta:resourcekey="tbFaultResource1"></asp:TextBox>
                        <asp:CustomValidator ID="cvFault" runat="server" Display="None" meta:resourcekey="cvFaultResource1"></asp:CustomValidator>
                    </td>
                </tr>
            </table>

            <Fast:Grid ID="Grid1" runat="server" DataKeyNames="COLLECTIVE_GUID"
                AutoGenerateColumns="False"
                DataKeyOnClientWithCheckBox="False" AllowSorting="True"
                AutoGenerateCheckBoxColumn="False" DefaultSortDirection="Descending"
                EmptyDataText="沒有資料" EnhancePager="True"
                KeepSelectedRows="False" PageSize="15"
                OnRowDataBound="Grid1_RowDataBound" Width="100%"
                AllowPaging="True" DefaultSortColumnName="CREATER_DATE"
                OnPageIndexChanging="Grid1_PageIndexChanging"
                meta:resourcekey="Grid1Resource1" OnSorting="Grid1_Sorting" CustomDropDownListPage="False" SelectedRowColor="" UnSelectedRowColor="">
                <EnhancePagerSettings ShowHeaderPager="True" FirstAltImageUrl="" FirstImageUrl="" LastAltImage="" LastImageUrl="" NextIAltImageUrl="" NextImageUrl="" PageInfoCssClass="" PageNumberCssClass="" PageNumberCurrentCssClass="" PageRedirectCssClass="" PreviousAltImageUrl="" PreviousImageUrl="" />
                <ExportExcelSettings AllowExportToExcel="False" />
                <Columns>
                    <asp:TemplateField HeaderText="產生時間" SortExpression="CREATER_DATE" meta:resourcekey="TemplateFieldResource4">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("CREATER_DATE") %>' meta:resourcekey="TextBox1Resource1"></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblCreateDate" runat="server" Text='<%# Bind("CREATER_DATE") %>' meta:resourcekey="lblCreateDateResource1"></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle Width="15%" Wrap="False" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="處理人員" SortExpression="CREATOR" meta:resourcekey="TemplateFieldResource1">
                        <ItemTemplate>
                            <asp:LinkButton ID="lbtnMember" runat="server"
                                meta:resourcekey="lbtnMemberResource1"></asp:LinkButton>
                        </ItemTemplate>
                        <HeaderStyle Width="15%" Wrap="False" />
                    </asp:TemplateField>
                    <asp:BoundField HeaderText="事由" DataField="REMARK" SortExpression="REMARK"
                        meta:resourcekey="BoundFieldResource2">
                        <HeaderStyle Width="25%" />
                    </asp:BoundField>
                    <asp:BoundField DataField="LEA_NAME" HeaderText="假別" SortExpression="LEA_NAME"
                        meta:resourcekey="BoundFieldResource3">
                        <HeaderStyle Width="8%" />
                    </asp:BoundField>
                    <asp:TemplateField HeaderText="天(時)數" SortExpression="TOTAL_HOURS" meta:resourcekey="TemplateFieldResource2">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox2" runat="server" meta:resourcekey="TextBox2Resource1"></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblHour" runat="server" meta:resourcekey="lblHourResource1"></asp:Label>
                            <asp:Label ID="lblUnit" runat="server" meta:resourcekey="lblUnitResource1"></asp:Label>
                        </ItemTemplate>
                        <ItemStyle Width="8%" />
                    </asp:TemplateField>
                    <asp:BoundField HeaderText="筆數" DataField="DETAIL_COUNT" SortExpression="DETAIL_COUNT"
                        meta:resourcekey="BoundFieldResource4">
                        <HeaderStyle Width="5%" Wrap="False" />
                        <ItemStyle HorizontalAlign="Right" />
                    </asp:BoundField>
                    <asp:TemplateField HeaderText="確定時間" SortExpression="USE_DATETIME" meta:resourcekey="TemplateFieldResource5">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("USE_DATETIME") %>' meta:resourcekey="TextBox3Resource1"></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblUseDateTime" runat="server" Text='<%# Bind("USE_DATETIME") %>' meta:resourcekey="lblUseDateTimeResource1"></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle Width="15%" Wrap="False" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="操作" meta:resourcekey="TemplateFieldResource3">
                        <ItemTemplate>
                            <asp:LinkButton ID="lbtnDetail" runat="server" Text="查看明細"
                                OnClick="lbtnDetail_Click" meta:resourcekey="lbtnDetailResource1"></asp:LinkButton>
                        </ItemTemplate>
                        <HeaderStyle Width="10%" Wrap="False" />
                        <ItemStyle Wrap="False" />
                    </asp:TemplateField>
                    <asp:BoundField DataField="TOTAL_HOURS" Visible="False" meta:resourcekey="BoundFieldResource6"></asp:BoundField>
                </Columns>
            </Fast:Grid>
            <asp:HiddenField ID="hidQuery" runat="server" />
        </ContentTemplate>
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="RadToolBar1" EventName="ButtonClick" />
            <asp:AsyncPostBackTrigger ControlID="rdHr" EventName="TextChanged" />
        </Triggers>
    </asp:UpdatePanel>
    <div style="display: none">
        <asp:Label ID="lblDay" runat="server" Text="天" Visible="False" meta:resourcekey="lblDayResource1"></asp:Label>
        <asp:Label ID="lblHr" runat="server" Text="小時" Visible="False" meta:resourcekey="lblHrResource1"></asp:Label>
        <asp:Label ID="lblerrStr" runat="server" Text="請輸入扣假時間(起)" Visible="False" meta:resourcekey="lblerrStrResource1"></asp:Label>
        <asp:Label ID="lblerrEnd" runat="server" Text="請輸入扣假時間(訖)" Visible="False" meta:resourcekey="lblerrEndResource1"></asp:Label>
        <asp:Label ID="lblerrEarly" runat="server" Text="扣假時間(起)不能晚於扣假時間(訖)" Visible="False" meta:resourcekey="lblerrEarlyResource1"></asp:Label>
        <asp:Label ID="lblerrLate" runat="server" Text="扣假時間(訖)不能早於扣假時間(起)" Visible="False" meta:resourcekey="lblerrLateResource1"></asp:Label>
        <asp:Label ID="lblHrZero" runat="server" Text="請假時數必須大於0" Visible="False" meta:resourcekey="lblHrZeroResource1"></asp:Label>
        <asp:Label ID="lblSelect" runat="server" Text="請選擇" Visible="False" meta:resourcekey="lblSelectResource1"></asp:Label>
        <asp:Label ID="lblerrSameTime" runat="server" Text="扣假時間起訖相同" Visible="False" meta:resourcekey="lblerrSameTimeResource1"></asp:Label>
        <asp:Label ID="lblerrBlank" runat="server" Text="時數不可空白" Visible="False" meta:resourcekey="lblerrBlankResource1"></asp:Label>
        <asp:Label ID="lblStageStatusLock" runat="server" Text="請假時間差勤結算已鎖單或關帳" Visible="False" meta:resourcekey="lblStageStatusLockResource1"></asp:Label>
        <asp:Label ID="lblLeaveTimeRepect" runat="server" Text="{0}的扣假時間與請假時間重疊" Visible="False" meta:resourcekey="lblLeaveTimeRepectResource1"></asp:Label>
        <asp:Label ID="lblOveRepect" runat="server" Text="{0}的扣假時間與加班時間重疊" Visible="False" meta:resourcekey="lblOveRepectResource1"></asp:Label>
        <asp:Label ID="lblTraRepect" runat="server" Text="{0}的扣假時間與出差時間重疊" Visible="False" meta:resourcekey="lblTraRepectResource1"></asp:Label>
        <asp:Label ID="lblCollectiveRepect" runat="server" Text="{0}已產生過扣假資訊" Visible="False" meta:resourcekey="lblCollectiveRepectResource1"></asp:Label>
        <asp:Label ID="lblLeaveDayLack" runat="server" Text="下列人員{0}餘額不足:{1}" Visible="False" meta:resourcekey="lblLeaveDayLackResource1"></asp:Label>
        <asp:Label ID="lblNoLeaveCode" runat="server" Text="下列人員所屬部門無啟用該假別:{0}" Visible="False" meta:resourcekey="lblNoLeaveCodeResource1"></asp:Label>
        <asp:Label ID="lblDayZero" runat="server" Text="請假天數必須大於0" meta:resourcekey="lblDayZeroResource1"></asp:Label>
        <asp:Label ID="lblDeleteConfirm" runat="server" Text="確定要刪除?" meta:resourcekey="lblDeleteConfirmResource1"></asp:Label>
        <asp:Label ID="lblSettErrorMsg" runat="server" Text="下列人員差勤結算類別不同，無法同時進行批次扣假。" Visible="False" meta:resourcekey="lblSettErrorMsgResource1"></asp:Label>
        <asp:Label ID="lblSameOfficeMsg" runat="server" Text="下列人員歸屬地點不同，無法同時進行批次扣假。" Visible="False" meta:resourcekey="lblSameOfficeMsgResource1"></asp:Label>
        <asp:Label ID="lblLeaveNotInRange" runat="server" Text="下列人員請假時間(訖)已超過可用年休使用期限:{0}" Visible="False" meta:resourcekey="lblLeaveNotInRangeResource1"></asp:Label>
        <asp:Label ID="lblProbationErrorMsg" runat="server" Text="下列人員未滿足該假別的到職限制或無設定到職日，無法申請" Visible="False" meta:resourcekey="lblProbationErrorMsgResource1"></asp:Label>
        <asp:Label ID="lblNoLeaveCodeLimit" runat="server" Text="下列人員未符合此假別的申請及性別限制，無法申請" Visible="False" meta:resourcekey="lblNoLeaveCodeLimitResource1"></asp:Label>
        <asp:HiddenField ID="hfCurrentUser" runat="server" />
    </div>
</asp:Content>