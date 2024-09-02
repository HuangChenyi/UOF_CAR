<%@ Page Title="" Language="C#" MasterPageFile="~/Master/TwoColumn.master" AutoEventWireup="true" CodeBehind="QueryPunchByUser.aspx.cs" Inherits="Ede.Uof.Web.HR104.Duty.Report.QueryPunchByUser" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" %>

<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Ede" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register Src="~/Common/Organization/UC_DeptManagerTree.ascx" TagPrefix="uc1" TagName="UC_DeptManagerTree" %>

<asp:Content ID="ScriptContent" ContentPlaceHolderID="ScriptContentPlaceHolder" runat="server">
    <script type="text/javascript">
        function CheckPunchDateOverYear(sender, args) {
            var rdBeginDate = $find("<%= rdBeginDate.ClientID %>").get_dateInput().get_selectedDate();
            var rdEndDate = $find("<%=rdEndDate.ClientID %>").get_dateInput().get_selectedDate();
            //判斷查詢日期是否大於一年
            if (((Date.parse(rdEndDate).valueOf() - Date.parse(rdBeginDate).valueOf()) / (1000 * 60 * 60 * 24)) > 365) {
                args.IsValid = false;
            }
        }
        function CheckHistoryDateOverYear(sender, args) {
            var rdBeginDate = $find("<%= rdPunchHistoryStart.ClientID %>").get_dateInput().get_selectedDate();
           var rdEndDate = $find("<%=rdPunchHistoryEnd.ClientID %>").get_dateInput().get_selectedDate();
            //判斷查詢日期是否大於一年
            if (((Date.parse(rdEndDate).valueOf() - Date.parse(rdBeginDate).valueOf()) / (1000 * 60 * 60 * 24)) > 365) {
                args.IsValid = false;
            }
        }

        function CheckOverAttendDateOverYear(sender, args) {
            var rdBeginDate = $find("<%=rdOverAttendBegin.ClientID %>").get_dateInput().get_selectedDate();
              var rdEndDate = $find("<%=rdOverAttendEnd.ClientID %>").get_dateInput().get_selectedDate();
            //判斷查詢日期是否大於一年
            if (((Date.parse(rdEndDate).valueOf() - Date.parse(rdBeginDate).valueOf()) / (1000 * 60 * 60 * 24)) > 365) {
                args.IsValid = false;
            }
        }

    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ToolbarContentPlaceHolder" runat="server">
</asp:Content>
<asp:Content ID="LeftContent" ContentPlaceHolderID="LeftContentPlaceHolder" runat="server">
    <asp:UpdatePanel ID="UpdatePanelForTree" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <uc1:UC_DeptManagerTree runat="server" ID="UC_DeptManagerTree" OnNodeOnClick="UC_DeptManagerTree_NodeOnClick" ShowDeptManagerTree="true" ShowDeptPersonalTree="true" ShowSuperiorTree="true" DisplayActiveControl="true" />
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
<asp:Content ID="RightContent" ContentPlaceHolderID="RightContentPlaceHolder" runat="server">
    <asp:UpdatePanel ID="upRightContent" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <telerik:RadTabStrip ID="rdTabs" runat="server" SelectedIndex="0" MultiPageID="rdMultiPage" OnTabClick="rdTabs_TabClick" CausesValidation="false" meta:resourcekey="rdTabsResource1">
                <Tabs>
                    <telerik:RadTab runat="server" Text="出勤記錄" PageViewID="punchRefView" Value="punchRefView" Selected="True" meta:resourcekey="punchRefViewResource1">
                    </telerik:RadTab>
                    <telerik:RadTab runat="server" Text="刷卡歷程" PageViewID="punchHistoryView" Value="punchHistoryView" meta:resourcekey="punchHistoryViewResource1">
                    </telerik:RadTab>
                    <telerik:RadTab runat="server" Text="超時出勤" PageViewID="overAttendView" Value="overAttendView" meta:resourcekey="overAttendViewResource1">
                    </telerik:RadTab>
                </Tabs>
            </telerik:RadTabStrip>
            <telerik:RadMultiPage ID="rdMultiPage" runat="server" SelectedIndex="0" meta:resourcekey="rdMultiPageResource1">
                <telerik:RadPageView ID="punchRefView" runat="server" Width="100%" meta:resourcekey="pageView1Resource1" Selected="True">
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                        <ContentTemplate>
                            <telerik:RadToolBar ID="radPunchRefToolBar" runat="server" Width="100%" SingleClick="None" OnButtonClick="radToolBar_ButtonClick" AutoPostBack="true">
                                <Items>
                                    <telerik:RadToolBarButton runat="server" Value="subDept">
                                        <ItemTemplate>
                                            <asp:CheckBox ID="cbSubDept" runat="server" Text="包含子部門" meta:resourcekey="cbSubDeptResource1" />
                                        </ItemTemplate>
                                    </telerik:RadToolBarButton>
                                    <telerik:RadToolBarButton IsSeparator="true"></telerik:RadToolBarButton>
                                    <telerik:RadToolBarButton runat="server" Text="查詢" Value="Serach"
                                        CheckedImageUrl="~/Common/Images/Icon/icon_m39.gif"
                                        DisabledImageUrl="~/Common/Images/Icon/icon_m39.gif"
                                        HoveredImageUrl="~/Common/Images/Icon/icon_m39.gif"
                                        ImageUrl="~/Common/Images/Icon/icon_m39.gif"
                                        meta:resourcekey="RadToolBarSerachResource1">
                                    </telerik:RadToolBarButton>
                                    <telerik:RadToolBarButton IsSeparator="true"></telerik:RadToolBarButton>
                                    <telerik:RadToolBarButton runat="server" Value="Vaild" meta:resourcekey="RadToolBarVaildButtonResource5">
                                        <ItemTemplate>
                                            <asp:CustomValidator ID="cvDateVaild" runat="server" ErrorMessage="日期(起)不可以晚於日期(訖)" meta:resourcekey="cvDateVaildResource1"></asp:CustomValidator>
                                        </ItemTemplate>
                                    </telerik:RadToolBarButton>
                                </Items>
                            </telerik:RadToolBar>
                            <table class="PopTable" style="width: 100%">
                                <tr>
                                    <td>
                                        <asp:Label ID="lblBeginDate" runat="server" Text="日期(起)" meta:resourcekey="lblBeginDateResource1"></asp:Label>
                                    </td>
                                    <td>
                                        <telerik:RadDatePicker ID="rdBeginDate" runat="server">
                                            <Calendar runat="server" UseColumnHeadersAsSelectors="False" UseRowHeadersAsSelectors="False" Culture="zh-TW" EnableWeekends="True" FastNavigationNextText="&amp;lt;&amp;lt;">
                                            </Calendar>
                                            <DateInput runat="server" LabelWidth="40%" DateFormat="yyyy/M/d" DisplayDateFormat="yyyy/M/d" Width="">
                                                <EmptyMessageStyle Resize="None" />
                                                <ReadOnlyStyle Resize="None" />
                                                <FocusedStyle Resize="None" />
                                                <DisabledStyle Resize="None" />
                                                <InvalidStyle Resize="None" />
                                                <HoveredStyle Resize="None" />
                                                <EnabledStyle Resize="None" />
                                            </DateInput>
                                            <DatePopupButton />
                                        </telerik:RadDatePicker>
                                        </igsch:WebDateChooser>
                                    </td>
                                    <td>
                                        <asp:Label ID="lblEndDate" runat="server" Text="日期(訖)" meta:resourcekey="lblEndDateResource1"></asp:Label>
                                    </td>
                                    <td style="white-space: nowrap">
                                        <telerik:RadDatePicker ID="rdEndDate" runat="server">
                                            <Calendar runat="server" UseColumnHeadersAsSelectors="False" UseRowHeadersAsSelectors="False" Culture="zh-TW" EnableWeekends="True" FastNavigationNextText="&amp;lt;&amp;lt;">
                                            </Calendar>
                                            <DateInput runat="server" LabelWidth="40%" DateFormat="yyyy/M/d" DisplayDateFormat="yyyy/M/d" Width="">
                                                <EmptyMessageStyle Resize="None" />
                                                <ReadOnlyStyle Resize="None" />
                                                <FocusedStyle Resize="None" />
                                                <DisabledStyle Resize="None" />
                                                <InvalidStyle Resize="None" />
                                                <HoveredStyle Resize="None" />
                                                <EnabledStyle Resize="None" />
                                            </DateInput>
                                            <DatePopupButton />
                                        </telerik:RadDatePicker>
                                        <asp:CustomValidator ID="cvDateOverYear" runat="server" ErrorMessage="查詢區間不可大於一年" Display="Dynamic" ClientValidationFunction="CheckPunchDateOverYear" meta:resourcekey="cvDateOverYearResource1"></asp:CustomValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="userName" runat="server" Text="人員" meta:resourcekey="lblEmployeeTitleResource1"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtName" runat="server"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:Label ID="lblStatus" runat="server" Text="狀態"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:CheckBoxList runat="server" ID="cblStatus" RepeatDirection="Horizontal">
                                            <asp:ListItem runat="server" Text="正常" Value="5" Selected="True" meta:resourcekey="listItem1Resource1"></asp:ListItem>
                                            <asp:ListItem runat="server" Text="應刷未刷" Value="0" Selected="True" meta:resourcekey="listItem2Resource1"></asp:ListItem>
                                            <asp:ListItem runat="server" Text="遲到" Value="1" Selected="True" meta:resourcekey="listItem3Resource1"></asp:ListItem>
                                            <asp:ListItem runat="server" Text="早退" Value="2" Selected="True" meta:resourcekey="listItem4Resource1"></asp:ListItem>
                                            <asp:ListItem runat="server" Text="曠職" Value="4" Selected="True" meta:resourcekey="listItem5Resource1"></asp:ListItem>
                                            <asp:ListItem runat="server" Text="空白(無班表)" Value="6" Selected="True" meta:resourcekey="listItem6Resource1"></asp:ListItem>
                                        </asp:CheckBoxList>
                                    </td>
                                </tr>
                            </table>
                            <Ede:Grid ID="grdPunch" runat="server" AutoGenerateCheckBoxColumn="False" AutoGenerateColumns="False" AllowSorting="True" OnPageIndexChanging="grdPunch_PageIndexChanging"
                                CustomDropDownListPage="False" DataKeyOnClientWithCheckBox="False" DefaultSortDirection="Ascending" DefaultSortColumnName="NAME,DATE" AllowPaging="True" OnSelectedIndexChanging="grdPunch_SelectedIndexChanging"
                                EmptyDataText="沒有資料" EnhancePager="True" KeepSelectedRows="False" PageSize="31" OnSorting="grdPunch_Sorting" OnBeforeExport="grdPunch_BeforeExport"
                                Width="100%" OnRowDataBound="grdPunch_RowDataBound" meta:resourcekey="grdPunchResource1">
                                <EnhancePagerSettings ShowHeaderPager="True"></EnhancePagerSettings>
                                <ExportExcelSettings AllowExportToExcel="True"></ExportExcelSettings>
                                <Columns>
                                    <asp:BoundField DataField="NAME" HeaderText="姓名" SortExpression="NAME" meta:resourcekey="BoundFieldNAMEResource1">
                                        <HeaderStyle Wrap="False" />
                                        <ItemStyle Wrap="False" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="EMPLOYEE_NO" HeaderText="員工編號" SortExpression="EMPLOYEE_NO" meta:resourcekey="BoundFieldEMPLOYEE_NOResource1">
                                        <HeaderStyle Wrap="False" />
                                        <ItemStyle Wrap="False" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="GroupName" HeaderText="申請部門" SortExpression="GroupName" meta:resourcekey="BoundFieldGroupNameResource1">
                                        <HeaderStyle Wrap="False" />
                                        <ItemStyle Wrap="False" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="DATE" HeaderText="日期" SortExpression="DATE" meta:resourcekey="TemplateFieldDateResource1" DataFormatString="{0:d}">
                                        <HeaderStyle Width="5%" Wrap="False" />
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="WEEK" HeaderText="星期" meta:resourcekey="TemplateFieldResource2">
                                        <HeaderStyle Width="5%" Wrap="False" />
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="WORK_TIME_STRING" HeaderText="應簽到" meta:resourcekey="BoundFieldResource1">
                                        <HeaderStyle Width="5%" Wrap="False" />
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="OFF_TIME_STRING" HeaderText="應簽退" meta:resourcekey="BoundFieldResource2">
                                        <HeaderStyle Width="5%" Wrap="False" />
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="WORK_CLOCK_TIME_STRING" HeaderText="實際簽到" meta:resourcekey="TemplateFieldResource3">
                                        <HeaderStyle Width="5%" Wrap="False" />
                                        <ItemStyle HorizontalAlign="Center" Wrap="False" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="OFF_CLOCK_TIME_STRING" HeaderText="實際簽退" meta:resourcekey="TemplateFieldResource4">
                                        <HeaderStyle Width="5%" Wrap="False" />
                                        <ItemStyle HorizontalAlign="Center" Wrap="False" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="LEAVE_TIME_STRING" HeaderText="請假" meta:resourcekey="TemplateFieldResource5">
                                        <HeaderStyle Width="20%" Wrap="False" />
                                        <ItemStyle Wrap="False" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="OVERTIME_TIME_STRING" HeaderText="加班" meta:resourcekey="TemplateFieldResource6">
                                        <HeaderStyle Width="20%" Wrap="False" />
                                        <ItemStyle Wrap="False" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="TRAVEL_TIME_STRING" HeaderText="出差" meta:resourcekey="TemplateFieldResource7">
                                        <HeaderStyle Width="20%" Wrap="False" />
                                        <ItemStyle Wrap="False" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="WORK_TIME_STATUS" HeaderText="狀態(上班)" meta:resourcekey="TemplateFieldResource8">
                                        <HeaderStyle Width="5%" Wrap="False" />
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="OFF_TIME_STATUS" HeaderText="狀態(下班)" meta:resourcekey="TemplateFieldResource9">
                                        <HeaderStyle Width="5%" Wrap="False" />
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:BoundField>
                                </Columns>
                            </Ede:Grid>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </telerik:RadPageView>
                <telerik:RadPageView ID="punchHistoryView" runat="server" Width="100%" meta:resourcekey="pageView2Resource1">
                    <asp:UpdatePanel ID="upPunchHistoryView" runat="server" UpdateMode="Conditional">
                        <ContentTemplate>
                            <telerik:RadToolBar ID="radPunchHistoryToolBar" runat="server" OnButtonClick="radPunchHistoryToolBar_ButtonClick" Width="100%" SingleClick="None">
                                <Items>
                                    <telerik:RadToolBarButton runat="server" Value="subDept" meta:resourcekey="RadToolBarsubDeptButtonResource2">
                                        <ItemTemplate>
                                            <asp:CheckBox ID="cbSubDept" runat="server" Text="包含子部門" meta:resourcekey="cbSubDeptResource2" />
                                        </ItemTemplate>
                                    </telerik:RadToolBarButton>
                                    <telerik:RadToolBarButton IsSeparator="True" runat="server">
                                    </telerik:RadToolBarButton>
                                    <telerik:RadToolBarButton runat="server" Text="查詢" Value="Search"
                                        CheckedImageUrl="~/Common/Images/Icon/icon_m39.gif" DisabledImageUrl="~/Common/Images/Icon/icon_m39.gif"
                                        HoveredImageUrl="~/Common/Images/Icon/icon_m39.gif" ImageUrl="~/Common/Images/Icon/icon_m39.gif" meta:resourcekey="RadSearchResources1">
                                    </telerik:RadToolBarButton>
                                    
                                    <telerik:RadToolBarButton IsSeparator="True" runat="server">
                                    </telerik:RadToolBarButton>
                                    <telerik:RadToolBarButton Value="Tip">
                                        <ItemTemplate>
                                            <%--padding-top→為了對齊前方ToolBarButton按鈕與文字 --%>
                                            <div id="divTip" style="padding-top: 5px">
                                                <asp:Label ID="lbl104PunchHistoryKeepTip" runat="server" Text="" ForeColor="Blue"></asp:Label>
                                            </div>
                                        </ItemTemplate>
                                    </telerik:RadToolBarButton>
                                    <telerik:RadToolBarButton runat="server" Value="Vaild" meta:resourcekey="RadToolBarVaildButtonResource5">
                                        <ItemTemplate>
                                            <asp:CustomValidator ID="cvDateVaild" runat="server" ErrorMessage="日期(起)不可以晚於日期(訖)" meta:resourcekey="cvDateVaildResource1"></asp:CustomValidator>
                                        </ItemTemplate>
                                    </telerik:RadToolBarButton>
                                </Items>
                            </telerik:RadToolBar>
                            <table class="PopTable" style="width: 100%">
                                <tr>
                                    <td style="width: 20%">
                                        <asp:Label ID="lblStartDateTitle" runat="server" Text="日期(起)" meta:resourcekey="lblStartDateTitleResource1"></asp:Label>
                                    </td>
                                    <td style="width: 30%">
                                        <telerik:RadDatePicker ID="rdPunchHistoryStart" runat="server">
                                            <Calendar Culture="zh-TW" EnableWeekends="True" FastNavigationNextText="&amp;lt;&amp;lt;" UseColumnHeadersAsSelectors="False" UseRowHeadersAsSelectors="False">
                                            </Calendar>
                                            <DateInput LabelWidth="40%" DateFormat="yyyy/M/d" DisplayDateFormat="yyyy/M/d" Width="">
                                                <EmptyMessageStyle Resize="None" />
                                                <ReadOnlyStyle Resize="None" />
                                                <FocusedStyle Resize="None" />
                                                <DisabledStyle Resize="None" />
                                                <InvalidStyle Resize="None" />
                                                <HoveredStyle Resize="None" />
                                                <EnabledStyle Resize="None" />
                                            </DateInput>
                                            <DatePopupButton />
                                        </telerik:RadDatePicker>
                                    </td>
                                    <td style="width: 20%">
                                        <asp:Label ID="lblEndDateTitle" runat="server" Text="日期(訖)" meta:resourcekey="lblEndDateTitleResource1"></asp:Label>
                                    </td>
                                    <td style="width: 30%; white-space: nowrap">
                                        <telerik:RadDatePicker ID="rdPunchHistoryEnd" runat="server">
                                            <Calendar Culture="zh-TW" EnableWeekends="True" FastNavigationNextText="&amp;lt;&amp;lt;" UseColumnHeadersAsSelectors="False" UseRowHeadersAsSelectors="False">
                                            </Calendar>
                                            <DateInput LabelWidth="40%" DateFormat="yyyy/M/d" DisplayDateFormat="yyyy/M/d" Width="">
                                                <EmptyMessageStyle Resize="None" />
                                                <ReadOnlyStyle Resize="None" />
                                                <FocusedStyle Resize="None" />
                                                <DisabledStyle Resize="None" />
                                                <InvalidStyle Resize="None" />
                                                <HoveredStyle Resize="None" />
                                                <EnabledStyle Resize="None" />
                                            </DateInput>
                                            <DatePopupButton />
                                        </telerik:RadDatePicker>
                                        <asp:CustomValidator ID="cvCheckHistoryDateOverYear" runat="server" ErrorMessage="查詢區間不可大於一年" Display="Dynamic" ClientValidationFunction="CheckHistoryDateOverYear" meta:resourcekey="cvDateOverYearResource1"></asp:CustomValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="lbltype" runat="server" Text="類型" meta:resourcekey="lbltypeResource1"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="ddlPunchType" runat="server" meta:resourcekey="ddlPunchTypeResource1">
                                            <asp:ListItem Text="全部" Value="All" meta:resourcekey="ListItemResource1"></asp:ListItem>
                                            <asp:ListItem Text="簽到" Value="Work" meta:resourcekey="ListItemResource2"></asp:ListItem>
                                            <asp:ListItem Text="簽退" Value="Off" meta:resourcekey="ListItemResource3"></asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                    <td>
                                        <asp:Label ID="lblPunchSource" runat="server" Text="來源" meta:resourcekey="lblPunchSourceResource1"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="ddlSource" runat="server" meta:resourcekey="ddlSourceResource1">
                                            <asp:ListItem Text="全部" Value="All" meta:resourcekey="ListItemAllResource1"></asp:ListItem>
                                            <asp:ListItem Text="APP" Value="APP" meta:resourcekey="ListItemAppResource1"></asp:ListItem>
                                            <asp:ListItem Text="線上刷卡" Value="Online" meta:resourcekey="ListItemOnlineResource1"></asp:ListItem>
                                            <asp:ListItem Text="外部匯入" Value="External" meta:resourcekey="ListItemExternalResource1"></asp:ListItem>
                                            <asp:ListItem Text="補刷卡單" Value="Manual" meta:resourcekey="ListItemManualResource1"></asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="1">
                                        <asp:Label ID="lblEmployeeTitle" runat="server" Text="人員" meta:resourcekey="lblEmployeeTitleResource1"></asp:Label>
                                    </td>
                                    <td colspan="3">
                                        <asp:TextBox ID="txtPunchHistoryUser" runat="server"></asp:TextBox>
                                    </td>
                                </tr>
                            </table>
                            <Ede:Grid ID="gridPunchHistory" runat="server" AllowPaging="True" AllowSorting="True" DefaultSortDirection="Ascending" DefaultSortColumnName="DEPARTMENT_NAME,EMPLOYEE_NO,STR_PUNCH_TIME"
                                AutoGenerateCheckBoxColumn="False" AutoGenerateColumns="False" DataKeyOnClientWithCheckBox="False" EmptyDataText="沒有資料" EnhancePager="True"
                                KeepSelectedRows="False" PageSize="15" Width="100%" CustomDropDownListPage="False" OnBeforeExport="gridPunchHistory_BeforeExport"
                                OnPageIndexChanging="gridPunchHistory_PageIndexChanging" OnRowDataBound="gridPunchHistory_RowDataBound" OnSorting="gridPunchHistory_Sorting" meta:resourcekey="gridPunchHistoryResource1" SelectedRowColor="" UnSelectedRowColor="">
                                <EnhancePagerSettings ShowHeaderPager="True" />
                                <ExportExcelSettings AllowExportToExcel="True" />
                                <Columns>
                                    <asp:BoundField HeaderText="姓名" DataField="NAME" SortExpression="NAME" meta:resourcekey="bfNameResource2">
                                        <ItemStyle Width="10%" Wrap="False" HorizontalAlign="Left" />
                                        <HeaderStyle Wrap="False" />
                                    </asp:BoundField>
                                    <asp:BoundField HeaderText="員工編號" DataField="EMPLOYEE_NO" SortExpression="EMPLOYEE_NO" meta:resourcekey="bfEmployeeResource3">
                                        <ItemStyle Width="10%" Wrap="False" HorizontalAlign="Left" />
                                        <HeaderStyle Wrap="False" />
                                    </asp:BoundField>
                                    <asp:BoundField HeaderText="部門" DataField="DEPARTMENT_NAME" SortExpression="DEPARTMENT_NAME" meta:resourcekey="bfDepartmentNameResource4">
                                        <ItemStyle Width="15%" Wrap="False" HorizontalAlign="Left" />
                                        <HeaderStyle Wrap="False" />
                                    </asp:BoundField>
                                    <asp:TemplateField HeaderText="刷卡時間" SortExpression="STR_PUNCH_TIME" meta:resourcekey="tfPunchTimeResource1">
                                        <ItemTemplate>
                                            <table style="width: 200px" align="center">
                                                <tr>
                                                    <td style="width: 5px;"></td>
                                                    <td style="text-align: right; white-space: nowrap;">
                                                        <asp:Label ID="lblPunchTime" runat="server" Text='<%#: Bind("STR_PUNCH_TIME") %>' meta:resourcekey="lblPunchTimeResource1"></asp:Label>
                                                    </td>
                                                    <td style="width: 5px;"></td>
                                                    <td style="text-align: left; white-space: nowrap;">
                                                        <div style="width: 15px;">
                                                            <asp:ImageButton ID="imgWorkLocation" runat="server" ImageUrl="~/Common/Images/Icon/icon_m207.png" Visible="False" meta:resourcekey="imgWorkLocationsResource1" />
                                                        </div>
                                                    </td>
                                                    <td style="width: 5px;"></td>
                                                </tr>
                                            </table>
                                        </ItemTemplate>
                                        <HeaderStyle Width="20%" />
                                        <ItemStyle HorizontalAlign="Center" Wrap="false" />
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="STR_PUNCH_TIME" HeaderText="刷卡時間" SortExpression="STR_PUNCH_TIME" meta:resourcekey="tfPunchTimeResource1">
                                        <HeaderStyle Width="15%" />
                                        <ItemStyle HorizontalAlign="Center" Wrap="false" />
                                    </asp:BoundField>
                                    <asp:BoundField HeaderText="類型" DataField="PUNCH_TYPE" SortExpression="PUNCH_TYPE" meta:resourcekey="bfPunchTypeResource5">
                                        <ItemStyle Width="10%" Wrap="False" HorizontalAlign="Center" />
                                        <HeaderStyle Wrap="False" />
                                    </asp:BoundField>
                                    <asp:BoundField HeaderText="來源" DataField="PUNCH_SOURCE" SortExpression="PUNCH_SOURCE" meta:resourcekey="bfPunchSourceResource6">
                                        <ItemStyle Width="10%" Wrap="False" HorizontalAlign="Center" />
                                        <HeaderStyle Wrap="False" />
                                    </asp:BoundField>
                                    <asp:TemplateField HeaderText="事由" meta:resourcekey="bfPunchReasonResource1">
                                        <ItemTemplate>
                                            <asp:Label ID="lblreason" runat="server" Text='<%# Bind("REASON") %>' meta:resourcekey="lblKeyWordResource1"></asp:Label>
                                        </ItemTemplate>
                                        <ItemStyle Width="15%" Wrap="False" HorizontalAlign="Left" />
                                        <HeaderStyle Wrap="False" />
                                    </asp:TemplateField>
                                </Columns>
                                <HeaderStyle Wrap="False" />
                            </Ede:Grid>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </telerik:RadPageView>
                <telerik:RadPageView ID="overAttendView" runat="server" Width="100%">
                    <asp:UpdatePanel ID="upOverAttend" runat="server" UpdateMode="Conditional">
                        <ContentTemplate>
                            <telerik:RadToolBar ID="radOverAttendToolBar" runat="server" Width="100%" SingleClick="None" OnButtonClick="radOverAttendToolBar_ButtonClick" AutoPostBack="true">
                                <Items>
                                    <telerik:RadToolBarButton runat="server" Value="subDept">
                                        <ItemTemplate>
                                            <asp:CheckBox ID="cbSubDept" runat="server" Text="包含子部門" meta:resourcekey="cbSubDeptResource1" />
                                        </ItemTemplate>
                                    </telerik:RadToolBarButton>
                                    <telerik:RadToolBarButton IsSeparator="true"></telerik:RadToolBarButton>
                                    <telerik:RadToolBarButton runat="server" Text="查詢" Value="Serach"
                                        CheckedImageUrl="~/Common/Images/Icon/icon_m39.gif"
                                        DisabledImageUrl="~/Common/Images/Icon/icon_m39.gif"
                                        HoveredImageUrl="~/Common/Images/Icon/icon_m39.gif"
                                        ImageUrl="~/Common/Images/Icon/icon_m39.gif"
                                        meta:resourcekey="RadToolBarSerachResource1">
                                    </telerik:RadToolBarButton>
                                    <telerik:RadToolBarButton IsSeparator="true"></telerik:RadToolBarButton>
                                    <telerik:RadToolBarButton runat="server" Value="Vaild" meta:resourcekey="RadToolBarVaildButtonResource5">
                                        <ItemTemplate>
                                            <asp:CustomValidator ID="cvDateVaild" runat="server" ErrorMessage="日期(起)不可以晚於日期(訖)" meta:resourcekey="cvDateVaildResource1"></asp:CustomValidator>
                                        </ItemTemplate>
                                    </telerik:RadToolBarButton>
                                </Items>
                            </telerik:RadToolBar>
                            <table class="PopTable" style="width: 100%">
                                <tr>
                                    <td>
                                        <asp:Label ID="Label1" runat="server" Text="日期(起)" meta:resourcekey="lblBeginDateResource1"></asp:Label>
                                    </td>
                                    <td>
                                        <telerik:RadDatePicker ID="rdOverAttendBegin" runat="server">
                                            <Calendar runat="server" UseColumnHeadersAsSelectors="False" UseRowHeadersAsSelectors="False" Culture="zh-TW" EnableWeekends="True" FastNavigationNextText="&amp;lt;&amp;lt;">
                                            </Calendar>
                                            <DateInput runat="server" LabelWidth="40%" DateFormat="yyyy/M/d" DisplayDateFormat="yyyy/M/d" Width="">
                                                <EmptyMessageStyle Resize="None" />
                                                <ReadOnlyStyle Resize="None" />
                                                <FocusedStyle Resize="None" />
                                                <DisabledStyle Resize="None" />
                                                <InvalidStyle Resize="None" />
                                                <HoveredStyle Resize="None" />
                                                <EnabledStyle Resize="None" />
                                            </DateInput>
                                            <DatePopupButton />
                                        </telerik:RadDatePicker>
                                        </igsch:WebDateChooser>
                                    </td>
                                    <td>
                                        <asp:Label ID="Label2" runat="server" Text="日期(訖)" meta:resourcekey="lblEndDateResource1"></asp:Label>
                                    </td>
                                    <td style="white-space: nowrap">
                                        <telerik:RadDatePicker ID="rdOverAttendEnd" runat="server">
                                            <Calendar runat="server" UseColumnHeadersAsSelectors="False" UseRowHeadersAsSelectors="False" Culture="zh-TW" EnableWeekends="True" FastNavigationNextText="&amp;lt;&amp;lt;">
                                            </Calendar>
                                            <DateInput runat="server" LabelWidth="40%" DateFormat="yyyy/M/d" DisplayDateFormat="yyyy/M/d" Width="">
                                                <EmptyMessageStyle Resize="None" />
                                                <ReadOnlyStyle Resize="None" />
                                                <FocusedStyle Resize="None" />
                                                <DisabledStyle Resize="None" />
                                                <InvalidStyle Resize="None" />
                                                <HoveredStyle Resize="None" />
                                                <EnabledStyle Resize="None" />
                                            </DateInput>
                                            <DatePopupButton />
                                        </telerik:RadDatePicker>
                                        <asp:CustomValidator ID="cvOverAttendDateOverYear" runat="server" ErrorMessage="查詢區間不可大於一年" Display="Dynamic" ClientValidationFunction="CheckOverAttendDateOverYear" meta:resourcekey="cvDateOverYearResource1"></asp:CustomValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="Label3" runat="server" Text="人員"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtOverAttendUser" runat="server"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:Label ID="lblOverAttrndStatus" runat="server" Text="狀態" meta:resourcekey="lblOverAttrndStatusResource1"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="ddOverAttendStatus" runat="server">
                                            <asp:ListItem Text="全部" Value="All" meta:resourcekey="ddOverAttendItemAllResource1"></asp:ListItem>
                                            <asp:ListItem Text="未回報" Value="0" meta:resourcekey="ddOverAttendItemNotResource1"></asp:ListItem>
                                            <asp:ListItem Text="回報中" Value="2" meta:resourcekey="ddOverAttendItemProResource1"></asp:ListItem>
                                            <asp:ListItem Text="已回報" Value="1" meta:resourcekey="ddOverAttendItemRepResource1"></asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                            </table>
                            <Ede:Grid ID="gridOverAttend" runat="server" AutoGenerateCheckBoxColumn="False" AutoGenerateColumns="False" AllowSorting="True" OnRowDataBound="gridOverAttend_RowDataBound" OnBeforeExport="gridOverAttend_BeforeExport"
                                CustomDropDownListPage="False" DataKeyOnClientWithCheckBox="False" DefaultSortDirection="Ascending" DefaultSortColumnName="DEPARTMENT_CNAME,EMPLOYEE_NO,EMPLOYEE_CNAME ,WORK_DATE ,WORK_CARD_TYPE" AllowPaging="True"
                                EmptyDataText="沒有資料" EnhancePager="True" KeepSelectedRows="False" PageSize="31" OnSorting="gridOverAttend_Sorting" OnPageIndexChanging="gridOverAttend_PageIndexChanging"
                                Width="100%">
                                <EnhancePagerSettings ShowHeaderPager="True"></EnhancePagerSettings>
                                <ExportExcelSettings AllowExportToExcel="True"></ExportExcelSettings>
                                <Columns>
                                    <asp:BoundField DataField="EMPLOYEE_CNAME" HeaderText="姓名" SortExpression="EMPLOYEE_CNAME" meta:resourcekey="gridOverAttendNAMEResource1">
                                        <HeaderStyle Wrap="False" />
                                        <ItemStyle Wrap="False" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="EMPLOYEE_NO" HeaderText="員工編號" SortExpression="EMPLOYEE_NO" meta:resourcekey="gridOverAttendEmpNOResource1">
                                        <HeaderStyle Wrap="False" />
                                        <ItemStyle Wrap="False" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="DEPARTMENT_CNAME" HeaderText="申請部門" SortExpression="DEPARTMENT_CNAME" meta:resourcekey="gridOverAttendDepResource1">
                                        <HeaderStyle Wrap="False" />
                                        <ItemStyle Wrap="False" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="WORK_DATE" HeaderText="日期" SortExpression="WORK_DATE" meta:resourcekey="gridOverAttendDateResource1" DataFormatString="{0:d}">
                                        <HeaderStyle Wrap="False" />
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:BoundField>
                                    <asp:TemplateField HeaderText="上班/下班" SortExpression="WORK_CARD_TYPE" meta:resourcekey="gridOverAttendWorkResource1">
                                        <ItemTemplate>
                                            <asp:Label ID="lblCardDataType" runat="server"></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle Wrap="False" />
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="WORK_CARD_DATE_STRING" HeaderText="應刷卡" meta:resourcekey="gridOverAttendWorkCardResource1">
                                        <HeaderStyle Wrap="False" />
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="CARD_DATA_DATE_STRING" HeaderText="實際刷卡" meta:resourcekey="gridOverAttendWorkCardDateResource1">
                                        <HeaderStyle Wrap="False" />
                                        <ItemStyle HorizontalAlign="Center" Wrap="False" />
                                    </asp:BoundField>
                                    <asp:TemplateField HeaderText="狀態" SortExpression="CARD_DATA_ACTION" meta:resourcekey="gridOverAttendWorkCardActionResource1">
                                        <ItemTemplate>
                                            <asp:Label ID="lblCardDataAction" runat="server"></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle Wrap="False" />
                                        <ItemStyle HorizontalAlign="Center" Wrap="False" />
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="WORKFLOW_NO" HeaderText="表單單號" meta:resourcekey="gridOverAttendDocNbrResource1">
                                        <HeaderStyle Width="15%" Wrap="False" />
                                        <ItemStyle HorizontalAlign="Center" Wrap="False" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="REASON" HeaderText="超時原因" meta:resourcekey="gridOverAttendReasonDateResource1">
                                        <HeaderStyle Width="30%" Wrap="False" />
                                        <ItemStyle HorizontalAlign="Left" Wrap="True" />
                                    </asp:BoundField>
                                </Columns>
                            </Ede:Grid>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </telerik:RadPageView>
            </telerik:RadMultiPage>
        </ContentTemplate>
    </asp:UpdatePanel>
    <asp:Label ID="lblMonday" runat="server" Text="一" Visible="False" meta:resourcekey="lblMondayResource1"></asp:Label>
    <asp:Label ID="lblTuesday" runat="server" Text="二" Visible="False" meta:resourcekey="lblTuesdayResource1"></asp:Label>
    <asp:Label ID="lblWednesday" runat="server" Text="三" Visible="False" meta:resourcekey="lblWednesdayResource1"></asp:Label>
    <asp:Label ID="lblThursday" runat="server" Text="四" Visible="False" meta:resourcekey="lblThursdayResource1"></asp:Label>
    <asp:Label ID="lblFriday" runat="server" Text="五" Visible="False" meta:resourcekey="lblFridayResource1"></asp:Label>
    <asp:Label ID="lblSaturday" runat="server" Text="六" Visible="False" meta:resourcekey="lblSaturdayResource1"></asp:Label>
    <asp:Label ID="lblSunday" runat="server" Text="日" Visible="False" meta:resourcekey="lblSundayResource1"></asp:Label>
    <asp:Label ID="lblNornal" runat="server" Text="正常" Visible="False" meta:resourcekey="lblNornalResource1"></asp:Label>
    <asp:Label ID="lblCardDataCode0" runat="server" Text="應刷未刷" Visible="False" meta:resourcekey="lblCardDataCode0Resource1"></asp:Label>
    <asp:Label ID="lblCardDataCode1" runat="server" Text="遲到" Visible="False" meta:resourcekey="lblCardDataCode1Resource1"></asp:Label>
    <asp:Label ID="lblCardDataCode2" runat="server" Text="早退" Visible="False" meta:resourcekey="lblCardDataCode2Resource1"></asp:Label>
    <asp:Label ID="lblCardDataCode4" runat="server" Text="曠職" Visible="False" meta:resourcekey="lblCardDataCode4Resource1"></asp:Label>
    <asp:Label ID="lblBlank" runat="server" Text="空白(無班表)" Visible="False" meta:resourcekey="lblBlankResource1"></asp:Label>
    <asp:Label ID="lblLeftTitle" runat="server" Text="內部組織結構列表" Visible="False" meta:resourcekey="lblLeftTitleResource1"></asp:Label>
    <asp:Label ID="lblMapTitle" runat="server" Text="刷卡位置" Visible="False" meta:resourcekey="lblMapTitleResource1"></asp:Label>
    <asp:Label ID="lbl104PunchHistoryKeep3Months" runat="server" Text="*刷卡歷程只保留3個月" Visible="False" meta:resourcekey="lbl104PunchHistoryKeep3MonthsResource1"></asp:Label>
    <asp:Label ID="lbl104PunchHistoryKeep6Months" runat="server" Text="*刷卡歷程只保留6個月" Visible="False" meta:resourcekey="lbl104PunchHistoryKeep6MonthsResource1"></asp:Label>
    <asp:Label ID="lbl104PunchHistoryKeep12Months" runat="server" Text="*刷卡歷程只保留12個月" Visible="False" meta:resourcekey="lbl104PunchHistoryKeep12MonthsResource1"></asp:Label>

    <asp:Label ID="lblReport" runat="server" Text="已回報" Visible="False" meta:resourcekey="lblReportResource1"></asp:Label>
    <asp:Label ID="lblUnReport" runat="server" Text="未回報" Visible="False" meta:resourcekey="lblUnReportResource1"></asp:Label>
    <asp:Label ID="lblProcess" runat="server" Text="回報中" Visible="False" meta:resourcekey="lblProcessResource1"></asp:Label>
    <asp:Label ID="lblPunchIn" runat="server" Text="上班" Visible="False" meta:resourcekey="lblPunchInResource1"></asp:Label>
    <asp:Label ID="lblPunchOut" runat="server" Text="下班" Visible="False" meta:resourcekey="lblPunchOutResource1"></asp:Label>

    <asp:HiddenField ID="hfCurrentUser" runat="server" />
    <asp:HiddenField ID="hfCurrentCulture" runat="server" />
    <asp:HiddenField ID="hfPunchHistoryExport" runat="server" />
</asp:Content>
