<%@ Page Title="" Language="C#" MasterPageFile="~/Master/DefaultMasterPage.master" AutoEventWireup="true" CodeBehind="QueryBatchOvertimeDefault.aspx.cs" Inherits="Ede.Uof.Web.HR104.Duty.Report.QueryBatchOvertimeDefault" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" %>

<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Ede" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script type="text/javascript">
        Sys.Application.add_load(RadioClick);

        function RadioClick() {
            var rbApplyTime = $("#<%= rbApplyTime.ClientID %>")
            var rbOvertimeStart = $("#<%= rbOvertimeStart.ClientID %>")

            var radDateApplyTimeStart = $find('<%=radDateApplyTimeStart.ClientID %>');
            var radDateApplyTimeEnd = $find('<%=radDateApplyTimeEnd.ClientID %>');
            var radDateOvertimeStart = $find('<%=radDateOvertimeStart.ClientID %>');
            var radDateOvertimeEnd = $find('<%=radDateOvertimeEnd.ClientID %>');

            if (rbApplyTime.is(':checked')) {

                radDateApplyTimeStart.get_dateInput().enable();
                radDateApplyTimeEnd.get_dateInput().enable();
                radDateApplyTimeStart.set_enabled(true);
                radDateApplyTimeEnd.set_enabled(true);

                radDateOvertimeStart.get_dateInput().disable();
                radDateOvertimeEnd.get_dateInput().disable();
                radDateOvertimeStart.set_enabled(false);
                radDateOvertimeEnd.set_enabled(false);
            }
            else if (rbOvertimeStart.is(':checked')) {

                radDateApplyTimeStart.get_dateInput().disable();
                radDateApplyTimeEnd.get_dateInput().disable();
                radDateApplyTimeStart.set_enabled(false);
                radDateApplyTimeEnd.set_enabled(false);

                radDateOvertimeStart.get_dateInput().enable();
                radDateOvertimeEnd.get_dateInput().enable();
                radDateOvertimeStart.set_enabled(true);
                radDateOvertimeEnd.set_enabled(true);
            }
        }

        function OnValueChanging(sender, args) {
            if (args.get_newValue() == "0") {
                args.set_newValue(0);
            }
            else if (args.get_newValue() == "" || isNaN(args.get_newValue())) {
                args.set_newValue(args.get_oldValue());
            }
        }

    </script>

    <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <telerik:RadToolBar ID="RadToolBar1" runat="server" Width="100%" SingleClick="None" OnButtonClick="RadToolBar1_ButtonClick" meta:resourcekey="RadToolBar1Resource1">
                <Items>
                    <telerik:RadToolBarButton runat="server" Text="查詢" Value="Search"
                        CheckedImageUrl="~/Common/Images/Icon/icon_m39.gif" DisabledImageUrl="~/Common/Images/Icon/icon_m39.gif"
                        HoveredImageUrl="~/Common/Images/Icon/icon_m39.gif" ImageUrl="~/Common/Images/Icon/icon_m39.gif" meta:resourcekey="RadToolBarButtonResource1">
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton IsSeparator="True" runat="server" meta:resourcekey="RadToolBarButtonResource2"></telerik:RadToolBarButton>
                </Items>
            </telerik:RadToolBar>
            <table class="PopTable" style="width: 100%">
                <tr>
                    <td>
                        <asp:Label ID="lblQuery" runat="server" Text="查詢區間" meta:resourcekey="lblQueryResource1"></asp:Label>
                    </td>
                    <td colspan="3">
                        <asp:RadioButton ID="rbApplyTime" runat="server" Text="依申請時間" GroupName="rdBtnDate" OnClick="RadioClick()" meta:resourcekey="rbApplyTimeResource1" />
                        <telerik:RadDatePicker ID="radDateApplyTimeStart" runat="server" OnValueChanging="OnValueChanging" meta:resourcekey="radDateApplyTimeStartResource1">
                            <Calendar Culture="zh-TW" EnableWeekends="True" FastNavigationNextText="&amp;lt;&amp;lt;" UseColumnHeadersAsSelectors="False" UseRowHeadersAsSelectors="False">
                            </Calendar>
                            <DateInput DateFormat="yyyy/M/d" DisplayDateFormat="yyyy/M/d" LabelWidth="64px" Width="">
                                <EmptyMessageStyle Resize="None" />
                                <ReadOnlyStyle Resize="None" />
                                <FocusedStyle Resize="None" />
                                <DisabledStyle Resize="None" />
                                <InvalidStyle Resize="None" />
                                <HoveredStyle Resize="None" />
                                <EnabledStyle Resize="None" />
                            </DateInput>
                            <DatePopupButton CssClass="" HoverImageUrl="" ImageUrl="" />
                        </telerik:RadDatePicker>
                        <asp:Label ID="lblicon" runat="server" Text="~" meta:resourcekey="lbliconResource1"></asp:Label>
                        <telerik:RadDatePicker ID="radDateApplyTimeEnd" runat="server" OnValueChanging="OnValueChanging" meta:resourcekey="radDateApplyTimeEndResource1">
                            <Calendar Culture="zh-TW" EnableWeekends="True" FastNavigationNextText="&amp;lt;&amp;lt;" UseColumnHeadersAsSelectors="False" UseRowHeadersAsSelectors="False">
                            </Calendar>
                            <DateInput DateFormat="yyyy/M/d" DisplayDateFormat="yyyy/M/d" LabelWidth="64px" Width="">
                                <EmptyMessageStyle Resize="None" />
                                <ReadOnlyStyle Resize="None" />
                                <FocusedStyle Resize="None" />
                                <DisabledStyle Resize="None" />
                                <InvalidStyle Resize="None" />
                                <HoveredStyle Resize="None" />
                                <EnabledStyle Resize="None" />
                            </DateInput>
                            <DatePopupButton CssClass="" HoverImageUrl="" ImageUrl="" />
                        </telerik:RadDatePicker>
                        <br />
                        <asp:RadioButton ID="rbOvertimeStart" runat="server" Text="依加班時間" GroupName="rdBtnDate" OnClick="RadioClick()" meta:resourcekey="rbOvertimeStartResource1" />
                        <telerik:RadDatePicker ID="radDateOvertimeStart" runat="server" OnValueChanging="OnValueChanging" meta:resourcekey="radDateOvertimeStartResource1">
                            <Calendar Culture="zh-TW" EnableWeekends="True" FastNavigationNextText="&amp;lt;&amp;lt;" UseColumnHeadersAsSelectors="False" UseRowHeadersAsSelectors="False">
                            </Calendar>
                            <DateInput DateFormat="yyyy/M/d" DisplayDateFormat="yyyy/M/d" LabelWidth="64px" Width="">
                                <EmptyMessageStyle Resize="None" />
                                <ReadOnlyStyle Resize="None" />
                                <FocusedStyle Resize="None" />
                                <DisabledStyle Resize="None" />
                                <InvalidStyle Resize="None" />
                                <HoveredStyle Resize="None" />
                                <EnabledStyle Resize="None" />
                            </DateInput>
                            <DatePopupButton CssClass="" HoverImageUrl="" ImageUrl="" />
                        </telerik:RadDatePicker>
                        <asp:Label ID="lblicon2" runat="server" Text="~" meta:resourcekey="lblicon2Resource1"></asp:Label>
                        <telerik:RadDatePicker ID="radDateOvertimeEnd" runat="server" OnValueChanging="OnValueChanging" meta:resourcekey="radDateOvertimeEndResource1">
                            <Calendar Culture="zh-TW" EnableWeekends="True" FastNavigationNextText="&amp;lt;&amp;lt;" UseColumnHeadersAsSelectors="False" UseRowHeadersAsSelectors="False">
                            </Calendar>
                            <DateInput DateFormat="yyyy/M/d" DisplayDateFormat="yyyy/M/d" LabelWidth="64px" Width="">
                                <EmptyMessageStyle Resize="None" />
                                <ReadOnlyStyle Resize="None" />
                                <FocusedStyle Resize="None" />
                                <DisabledStyle Resize="None" />
                                <InvalidStyle Resize="None" />
                                <HoveredStyle Resize="None" />
                                <EnabledStyle Resize="None" />
                            </DateInput>
                            <DatePopupButton CssClass="" HoverImageUrl="" ImageUrl="" />
                        </telerik:RadDatePicker>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblKeyWord" runat="server" Text="關鍵字" meta:resourcekey="lblKeyWordResource1"></asp:Label>
                    </td>
                    <td >
                        <asp:TextBox ID="txtKeyWord" runat="server" meta:resourcekey="txtKeyWordResource1" />
                         <asp:Label ID="lblNotice" runat="server" Text="*可依申請人員編、姓名及表單編號查詢" ForeColor="Blue" meta:resourcekey="lblNoticeResource1"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="lblDocStatus" runat="server" Text="表單狀態" meta:resourcekey="lblDocStatusResource1"></asp:Label>
                    </td>
                    <td>
                        <asp:CheckBoxList ID="cblFormStatus" runat="server" RepeatDirection="Horizontal" style="white-space:nowrap;" meta:resourcekey="cblFormStatusResource1">
                            <asp:ListItem Text="處理中" Value="Signing" Selected="True" meta:resourcekey="ListItemResource1"></asp:ListItem>
                            <asp:ListItem Text="通過" Value="Adopt" Selected="True" meta:resourcekey="ListItemResource2"></asp:ListItem>
                            <asp:ListItem Text="否決" Value="Reject" Selected="True" meta:resourcekey="ListItemResource3"></asp:ListItem>
                            <asp:ListItem Text="作廢" Value="Cancel" Selected="True" meta:resourcekey="ListItemResource4"></asp:ListItem>
                        </asp:CheckBoxList>
                    </td>
                </tr>
            </table>
            <Ede:Grid ID="grdBatchOverTime" Width="100%" AutoGenerateCheckBoxColumn="False" AutoGenerateColumns="False" runat="server" DataKeyOnClientWithCheckBox="False"
                EmptyDataText="沒有資料" KeepSelectedRows="False" AllowPaging="True" AllowSorting="True" PageSize="15" CustomDropDownListPage="False" EnhancePager="True"
                OnRowDataBound="grdBatchOverTime_RowDataBound" OnBeforeExport="grdBatchOverTime_BeforeExport" OnSorting="grdBatchOverTime_Sorting"
                OnPageIndexChanging="grdBatchOverTime_PageIndexChanging" DefaultSortDirection="Descending" DefaultSortColumnName="DOC_NBR" meta:resourcekey="grdBatchOverTimeResource1" SelectedRowColor="" UnSelectedRowColor="">
                <EnhancePagerSettings ShowHeaderPager="True" FirstAltImageUrl="" FirstImageUrl="" LastAltImage="" LastImageUrl="" NextIAltImageUrl="" NextImageUrl="" PageInfoCssClass="" PageNumberCssClass="" PageNumberCurrentCssClass="" PageRedirectCssClass="" PreviousAltImageUrl="" PreviousImageUrl=""/>
                <ExportExcelSettings AllowExportToExcel="True" />
                <Columns>
                    <asp:TemplateField HeaderText="申請人" SortExpression="GROUP_NAME" meta:resourcekey="TemplateFieldResource1">
                        <ItemTemplate>
                            <asp:Label ID="lblApplyUser" runat="server" meta:resourcekey="lblApplyUserResource1"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField HeaderText="申請時間" DataField="BEGIN_TIME" SortExpression="BEGIN_TIME" DataFormatString="{0:yyyy/MM/dd HH:mm}" meta:resourcekey="BoundFieldResource1"></asp:BoundField>
                    <asp:BoundField HeaderText="結案時間" DataField="END_TIME" SortExpression="END_TIME" DataFormatString="{0:yyyy/MM/dd HH:mm}" meta:resourcekey="BoundFieldResource2"></asp:BoundField>
                    <asp:TemplateField HeaderText="表單編號" SortExpression="DOC_NBR" meta:resourcekey="TemplateFieldResource2">
                        <ItemTemplate>
                            <asp:LinkButton ID="lbtnDocNbr" runat="server" Text='<%# Eval("DOC_NBR") %>' meta:resourcekey="lbtnDocNbrResource1"></asp:LinkButton>
                        </ItemTemplate>
                        <HeaderStyle Wrap="False" />
                        <ItemStyle Wrap="False" HorizontalAlign="Center" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="表單狀態" SortExpression="STATUS" meta:resourcekey="TemplateFieldResource3">
                        <ItemTemplate>
                            <asp:Label ID="lblformStatus" runat="server" meta:resourcekey="lblformStatusResource1"></asp:Label>
                        </ItemTemplate>
                         <HeaderStyle Wrap="False" />
                        <ItemStyle Wrap="False" HorizontalAlign="Center" />
                    </asp:TemplateField>
<%--                    <asp:TemplateField HeaderText="排程狀態" SortExpression="TRIGGER_STATUS" meta:resourcekey="TemplateFieldResource5" >
                        <ItemTemplate>
                            <asp:LinkButton ID="lbtntriggerStatus" runat="server"  meta:resourcekey="lbtntriggerStatusResource1"></asp:LinkButton>
                        </ItemTemplate>
                         <HeaderStyle Wrap="False" />
                        <ItemStyle Wrap="False" HorizontalAlign="Center" />
                    </asp:TemplateField>--%>
                    <asp:TemplateField HeaderText="加班時間(起)" SortExpression="ACTUAL_START_TIME" meta:resourcekey="BoundFieldResource3">
                        <ItemTemplate>
                            <asp:Label ID="lblStartTime" runat="server" meta:resourcekey="lblStartTimeResource1"></asp:Label>
                        </ItemTemplate>
                         <HeaderStyle Wrap="False" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="加班時間(訖)" SortExpression="ACTUAL_END_TIME" meta:resourcekey="BoundFieldResource4">
                        <ItemTemplate>
                            <asp:Label ID="lblEndTime" runat="server" meta:resourcekey="lblEndTimeResource1"></asp:Label>
                        </ItemTemplate>
                         <HeaderStyle Wrap="False" />
                    </asp:TemplateField>
                     <asp:BoundField HeaderText="申請人數" DataField="USER_COUNT" SortExpression="USER_COUNT" meta:resourcekey="BoundFieldResource7">
                         <HeaderStyle Wrap="False" />
                        <ItemStyle Wrap="False" HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:BoundField HeaderText="成功人數" DataField="PASS" SortExpression="PASS" meta:resourcekey="BoundFieldResource5">
                         <HeaderStyle Wrap="False" />
                        <ItemStyle Wrap="False" HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:BoundField HeaderText="失敗人數" DataField="FAIL" SortExpression="FAIL" meta:resourcekey="BoundFieldResource6">
                         <HeaderStyle Wrap="False" />
                        <ItemStyle Wrap="False" HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:TemplateField HeaderText="資訊" meta:resourcekey="TemplateFieldResource4">
                        <ItemTemplate>
                            <asp:LinkButton ID="lbtnApplyDetail" runat="server" Text="明細" meta:resourcekey="lbtnApplyDetailResource1"></asp:LinkButton>
                            &nbsp;&nbsp;
                            <asp:LinkButton ID="lbtntriggerStatus" runat="server" Text="排程"   meta:resourcekey="lbtntriggerStatusResource1"></asp:LinkButton>
                        </ItemTemplate>
                         <HeaderStyle Wrap="False" Width="120px" HorizontalAlign="Center"/>
                        <ItemStyle Wrap="False" HorizontalAlign="Center" />
                    </asp:TemplateField>
                </Columns>
            </Ede:Grid>
        </ContentTemplate>
    </asp:UpdatePanel>
    <asp:HiddenField ID="hfCurrentUser" runat="server" />   
    <asp:HiddenField ID="hfPrintStatus" runat="server" />
    <asp:Label ID="lblSigning" runat="server" Text="處理中" Visible="False" meta:resourcekey="lblSigningResource1"></asp:Label>
    <asp:Label ID="lblAdopt" runat="server" Text="通過" Visible="False" meta:resourcekey="lblAdoptResource1"></asp:Label>
    <asp:Label ID="lblReject" runat="server" Text="否決" Visible="False" meta:resourcekey="lblRejectResource1"></asp:Label>
    <asp:Label ID="lblCancel" runat="server" Text="作廢" Visible="False" meta:resourcekey="lblCancelResource1"></asp:Label>
    <asp:Label ID="lblOverTimeBatchAdv" runat="server" Text="多時段" Visible="False" meta:resourcekey="lblOverTimeBatchAdvResource1"></asp:Label>

    <asp:Label ID="lblformSTART_FORM" runat="server" Text="起單" Visible="False" meta:resourcekey="lblformSTART_FORMResource1" ></asp:Label>
    <asp:Label ID="lblformEND_FORM" runat="server" Text="結案" Visible="False" meta:resourcekey="lblformEND_FORMResource1" ></asp:Label>
    <asp:Label ID="lblformCHANGE_FORM" runat="server" Text="狀態變更" Visible="False" meta:resourcekey="lblformCHANGE_FORMResource1" ></asp:Label>
    <asp:Label ID="lblformSIGN_FORM" runat="server" Text="簽核中" Visible="False" meta:resourcekey="lblformSIGN_FORMResource1" ></asp:Label>
    <asp:Label ID="lblformSITE_FORM" runat="server" Text="站點" Visible="False" meta:resourcekey="lblformSITE_FORMResource1" ></asp:Label>
    <asp:Label ID="lblformGETBACK_FORM" runat="server" Text="取回" Visible="False" meta:resourcekey="lblformGETBACK_FORMResource1" ></asp:Label>
    <asp:Label ID="lblformEND_SUB_FLOW" runat="server" Text="副流程結束" Visible="False" meta:resourcekey="lblformEND_SUB_FLOWResource1" ></asp:Label>

    <asp:Label ID="lbltaskStandby" runat="server" Text="等待中" Visible="False" meta:resourcekey="lbltaskStandbyResource1" ></asp:Label>
    <asp:Label ID="lbltaskExecuting" runat="server" Text="執行中" Visible="False" meta:resourcekey="lbltaskExecutingResource1" ></asp:Label>
    <asp:Label ID="lbltaskSuccess" runat="server" Text="成功" Visible="False" meta:resourcekey="lbltaskSuccessResource1" ></asp:Label>
    <asp:Label ID="lbltaskFail" runat="server" Text="失敗" Visible="False" meta:resourcekey="lbltaskFailResource1" ></asp:Label>
</asp:Content>
