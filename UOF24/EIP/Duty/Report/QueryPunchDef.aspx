<%@ Page Title="" Language="C#" MasterPageFile="~/Master/TwoColumn.master" AutoEventWireup="true" CodeBehind="QueryPunchDef.aspx.cs" Inherits="Ede.Uof.Web.EIP.Duty.Report.QueryPunchDef" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" %>

<%@ Register Src="~/Common/Organization/UC_DeptManagerTree.ascx" TagPrefix="uc1" TagName="UC_DeptManagerTree" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Ede" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ScriptContentPlaceHolder" runat="server">
      <script type="text/javascript">
        function CheckPunchDateOverYear(sender, args) {
            var rdBeginDate = $find("<%= rdStart.ClientID %>").get_dateInput().get_selectedDate();
            var rdEndDate = $find("<%=rdEnd.ClientID %>").get_dateInput().get_selectedDate();          
            //判斷查詢日期是否大於一年
            if (((Date.parse(rdEndDate).valueOf() - Date.parse(rdBeginDate).valueOf()) / (1000 * 60 * 60 * 24)) >365) {
                args.IsValid = false;
            }
         }    
       function CheckHistoryDateOverYear(sender, args) {
            var rdBeginDate = $find("<%= rdPunchHistoryStart.ClientID %>").get_dateInput().get_selectedDate();
            var rdEndDate = $find("<%=rdPunchHistoryEnd.ClientID %>").get_dateInput().get_selectedDate();          
            //判斷查詢日期是否大於一年
            if (((Date.parse(rdEndDate).valueOf() - Date.parse(rdBeginDate).valueOf()) / (1000 * 60 * 60 * 24)) >365) {
                args.IsValid = false;
            }
         }       
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ToolbarContentPlaceHolder" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="LeftContentPlaceHolder" runat="server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <uc1:UC_DeptManagerTree runat="server" ID="UC_DeptManagerTree" ShowDeptManagerTree="True" ShowDeptPersonalTree="True" ShowSuperiorTree="True" DisplayActiveControl="true" />
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="RightContentPlaceHolder" runat="server">
    <telerik:RadTabStrip ID="rdTabs" runat="server" SelectedIndex="0" MultiPageID="rdMultiPage" OnTabClick="rdTabs_TabClick" CausesValidation="false" meta:resourcekey="rdTabsResource1">
        <Tabs>
            <telerik:RadTab runat="server" Text="出勤記錄" PageViewID="punchRefView" Value="punchRefView" Selected="True" meta:resourcekey="punchRefViewResource1">
            </telerik:RadTab>
            <telerik:RadTab runat="server" Text="刷卡歷程" PageViewID="punchHistoryView" Value="punchHistoryView" meta:resourcekey="punchHistoryViewResource1">
            </telerik:RadTab>
        </Tabs>
    </telerik:RadTabStrip>
    <telerik:RadMultiPage ID="rdMultiPage" runat="server" SelectedIndex="0" meta:resourcekey="rdMultiPageResource1">
        <telerik:RadPageView ID="punchRefView" runat="server" Width="100%" meta:resourcekey="pageView1Resource1" Selected="True">
            <asp:UpdatePanel ID="upPunchRef" runat="server" UpdateMode="Conditional">
                <ContentTemplate>
                    <telerik:RadToolBar ID="radPunchRefToolBar" runat="server" OnButtonClick="radPunchRefToolBar_OnButtonClick" Width="100%" SingleClick="None">
                        <Items>
                            <telerik:RadToolBarButton runat="server" Value="subDept" meta:resourcekey="RadToolBarButtonResource1">
                                <ItemTemplate>
                                    <asp:CheckBox ID="cbSubDept" runat="server" Text="包含子部門" meta:resourcekey="cbSubDeptResource1" />
                                </ItemTemplate>
                            </telerik:RadToolBarButton>
                            <telerik:RadToolBarButton IsSeparator="True" runat="server" meta:resourcekey="RadToolBarButtonResource2">
                            </telerik:RadToolBarButton>
                            <telerik:RadToolBarButton runat="server" Text="查詢" Value="Search" meta:resourcekey="RadToolBarButtonResource3"
                                CheckedImageUrl="~/Common/Images/Icon/icon_m39.gif" DisabledImageUrl="~/Common/Images/Icon/icon_m39.gif" 
                                HoveredImageUrl="~/Common/Images/Icon/icon_m39.gif" ImageUrl="~/Common/Images/Icon/icon_m39.gif">                      
                            </telerik:RadToolBarButton>
                            <telerik:RadToolBarButton IsSeparator="True" runat="server" meta:resourcekey="RadToolBarButtonResource4">
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
                                <asp:Label ID="Label5" runat="server" Text="日期(起)" meta:resourcekey="Label5Resource1"></asp:Label>
                            </td>
                            <td style="width: 30%">
                                <telerik:RadDatePicker ID="rdStart" runat="server" meta:resourcekey="rdStartResource1">
                                    <DateInput LabelWidth="40%" DateFormat="yyyy/M/d" DisplayDateFormat="yyyy/M/d" Width="">
                                    </DateInput>
                                    <DatePopupButton CssClass="" HoverImageUrl="" ImageUrl="" />
                                </telerik:RadDatePicker>
                            </td>
                            <td style="width: 20%">
                                <asp:Label ID="Label7" runat="server" Text="日期(訖)" meta:resourcekey="Label7Resource1"></asp:Label>
                            </td>
                            <td style="width: 30% ; white-space:nowrap">
                                <telerik:RadDatePicker ID="rdEnd" runat="server" meta:resourcekey="rdEndResource1">
                                    <DateInput LabelWidth="40%" DateFormat="yyyy/M/d" DisplayDateFormat="yyyy/M/d" Width="">
                                    </DateInput>
                                    <DatePopupButton CssClass="" HoverImageUrl="" ImageUrl="" />
                                </telerik:RadDatePicker>
                                <asp:CustomValidator ID="cvDateOverYear" runat="server" ErrorMessage="查詢區間不可大於一年" Display="Dynamic" ClientValidationFunction="CheckPunchDateOverYear" meta:resourcekey="cvDateOverYearResource1"></asp:CustomValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="Label6" runat="server" Text="人員" meta:resourcekey="Label6Resource1"></asp:Label>
                            </td>
                            <td colspan="3">
                                <asp:TextBox ID="txtUser" runat="server" meta:resourcekey="txtUserResource1"></asp:TextBox>
                            </td>
                        </tr>
                    </table>
                    <Ede:Grid ID="punchGrid" runat="server" AllowPaging="True" AllowSorting="True" DefaultSortDirection="Ascending" DefaultSortColumnName="GROUP_NAME,GROUP_NAME,ACCOUNT,EMPLOYEE_NO,NAME,BELONG_DATE" AutoGenerateCheckBoxColumn="False" AutoGenerateColumns="False" DataKeyOnClientWithCheckBox="False" EmptyDataText="沒有資料" EnhancePager="True" KeepSelectedRows="False" PageSize="15" Width="100%" CustomDropDownListPage="False" SelectedRowColor="" UnSelectedRowColor="" OnBeforeExport="punchGrid_BeforeExport" OnPageIndexChanging="punchGrid_PageIndexChanging" OnRowDataBound="punchGrid_RowDataBound" OnSorting="punchGrid_Sorting" meta:resourcekey="punchGridResource1">
                        <EnhancePagerSettings ShowHeaderPager="True" FirstAltImageUrl="" FirstImageUrl="" LastAltImage="" LastImageUrl="" NextIAltImageUrl="" NextImageUrl="" PageInfoCssClass="" PageNumberCssClass="" PageNumberCurrentCssClass="" PageRedirectCssClass="" PreviousAltImageUrl="" PreviousImageUrl="" />
                        <ExportExcelSettings AllowExportToExcel="True" />
                        <Columns>
                            <asp:BoundField HeaderText="帳號" DataField="ACCOUNT" SortExpression="ACCOUNT" meta:resourcekey="BoundFieldResource1">
                                <ItemStyle Width="100px" Wrap="False" />
                                <HeaderStyle Wrap="False" />
                            </asp:BoundField>
                            <asp:TemplateField HeaderText="姓名" SortExpression="NAME" meta:resourcekey="TemplateFieldResource1">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("NAME") %>' meta:resourcekey="TextBox5Resource1"></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblName" runat="server" Text='<%#: Eval("NAME") %>' meta:resourcekey="lblNameResource1"></asp:Label>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Left" Width="100px" Wrap="False" />
                            </asp:TemplateField>
                            <asp:BoundField HeaderText="員工編號" DataField="EMPLOYEE_NO" SortExpression="EMPLOYEE_NO" meta:resourcekey="BoundFieldResource2">
                                <ItemStyle Width="100px" Wrap="False" />
                                <HeaderStyle Wrap="False" />
                            </asp:BoundField>
                            <asp:TemplateField HeaderText="部門" SortExpression="GROUP_NAME" meta:resourcekey="TemplateFieldResource2">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("GROUP_NAME") %>' meta:resourcekey="TextBox6Resource1"></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblGroupName" runat="server" Text='<%#: Bind("GROUP_NAME") %>' meta:resourcekey="lblGroupNameResource1"></asp:Label>
                                </ItemTemplate>
                                <ItemStyle Width="150px" Wrap="False" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="歸屬日" SortExpression="BELONG_DATE" meta:resourcekey="TemplateFieldResource3">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("BELONG_DATE") %>' meta:resourcekey="TextBox2Resource1"></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblBelongDate" runat="server" Text='<%# Bind("BELONG_DATE") %>' meta:resourcekey="lblBelongDateResource1"></asp:Label>
                                </ItemTemplate>
                                <ItemStyle Width="100px" Wrap="False" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="星期" meta:resourcekey="TemplateFieldResource4">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox1" runat="server" meta:resourcekey="TextBox1Resource1"></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblDayOfWeek" runat="server" meta:resourcekey="lblDayOfWeekResource1"></asp:Label>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" Width="20px" Wrap="False" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="簽到" meta:resourcekey="TemplateFieldResource5">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("WORK_CLOCK_TIME") %>' meta:resourcekey="TextBox3Resource1"></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblWorkClockTime" runat="server" Text='<%# Bind("WORK_CLOCK_TIME") %>' meta:resourcekey="lblWorkClockTimeResource1"></asp:Label>
                                    <asp:ImageButton ID="imgWorkLocation" runat="server" Visible="False" ImageUrl="~/Common/Images/Icon/icon_m207.png" meta:resourcekey="imgWorkLocationResource1" />
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" Width="100px" Wrap="False" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="簽退" meta:resourcekey="TemplateFieldResource6">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("OFF_CLOCK_TIME") %>' meta:resourcekey="TextBox4Resource1"></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblOffClockTime" runat="server" Text='<%# Bind("OFF_CLOCK_TIME") %>' meta:resourcekey="lblOffClockTimeResource1"></asp:Label>
                                    <asp:ImageButton ID="imgOffLocation" runat="server" Visible="False" ImageUrl="~/Common/Images/Icon/icon_m207.png" meta:resourcekey="imgOffLocationResource1" />
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" Width="100px" Wrap="False" />
                            </asp:TemplateField>
                        </Columns>
                        <HeaderStyle Wrap="False" />
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
                                                <asp:Label ID="lblPunchHistoryKeepTip" runat="server" Text="" ForeColor="Blue"></asp:Label>
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
                                <telerik:RadDatePicker ID="rdPunchHistoryStart" runat="server" >
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
                            <td style="width: 30% ; white-space:nowrap">
                                <telerik:RadDatePicker ID="rdPunchHistoryEnd" runat="server" >
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
                    <Ede:Grid ID="gridPunchHistory" runat="server" AllowPaging="True" AllowSorting="True" DefaultSortDirection="Ascending" DefaultSortColumnName="DEPARTMENT_NAME,ACCOUNT,STR_PUNCH_TIME"
                        AutoGenerateCheckBoxColumn="False" AutoGenerateColumns="False" DataKeyOnClientWithCheckBox="False" EmptyDataText="沒有資料" EnhancePager="True"
                        KeepSelectedRows="False" PageSize="15" Width="100%" CustomDropDownListPage="False" OnBeforeExport="gridPunchHistory_BeforeExport"
                        OnPageIndexChanging="gridPunchHistory_PageIndexChanging" OnRowDataBound="gridPunchHistory_RowDataBound" OnSorting="gridPunchHistory_Sorting" meta:resourcekey="gridPunchHistoryResource1" SelectedRowColor="" UnSelectedRowColor="">
                        <EnhancePagerSettings ShowHeaderPager="True" />
                        <ExportExcelSettings AllowExportToExcel="True" />
                        <Columns>
                            <asp:BoundField HeaderText="帳號" DataField="ACCOUNT" SortExpression="ACCOUNT" meta:resourcekey="bfAccountResource1">
                                <ItemStyle Width="10%" Wrap="False" HorizontalAlign="Left" />
                                <HeaderStyle Wrap="False" />
                            </asp:BoundField>
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
                                <HeaderStyle Width="15%" />
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
    </telerik:RadMultiPage>

    <asp:Label ID="lblTreeTitle" runat="server" Text="內部組織結構列表" Visible="False" meta:resourcekey="lblTreeTitleResource1"></asp:Label>
    <asp:Label ID="lblMonday" runat="server" Text="一" Visible="False" meta:resourcekey="lblMondayResource1"></asp:Label>
    <asp:Label ID="lblTuesday" runat="server" Text="二" Visible="False" meta:resourcekey="lblTuesdayResource1"></asp:Label>
    <asp:Label ID="lblWednesday" runat="server" Text="三" Visible="False" meta:resourcekey="lblWednesdayResource1"></asp:Label>
    <asp:Label ID="lblThursday" runat="server" Text="四" Visible="False" meta:resourcekey="lblThursdayResource1"></asp:Label>
    <asp:Label ID="lblFriday" runat="server" Text="五" Visible="False" meta:resourcekey="lblFridayResource1"></asp:Label>
    <asp:Label ID="lblSaturday" runat="server" Text="六" Visible="False" meta:resourcekey="lblSaturdayResource1"></asp:Label>
    <asp:Label ID="lblSunday" runat="server" Text="日" Visible="False" meta:resourcekey="lblSundayResource1"></asp:Label>
    <asp:Label ID="lblMapTitle" runat="server" Text="刷卡位置" Visible="False" meta:resourcekey="lblMapTitleResource1"></asp:Label>
    <asp:Label ID="lblPunchHistoryKeep3Months" runat="server" Text="*刷卡歷程只保留3個月" Visible="False" meta:resourcekey="lblPunchHistoryKeep3MonthsResource1"></asp:Label>
    <asp:Label ID="lblPunchHistoryKeep6Months" runat="server" Text="*刷卡歷程只保留6個月" Visible="False" meta:resourcekey="lblPunchHistoryKeep6MonthsResource1"></asp:Label>
    <asp:Label ID="lblPunchHistoryKeep12Months" runat="server" Text="*刷卡歷程只保留12個月" Visible="False" meta:resourcekey="lblPunchHistoryKeep12MonthsResource1"></asp:Label>
    <asp:HiddenField ID="hfCurrentUser" runat="server" />
    <asp:HiddenField ID="hfCurrentCulture" runat="server" />
    <asp:HiddenField ID="hfPunchRefExport" runat="server" />
    <asp:HiddenField ID="hfPunchHistoryExport" runat="server" />
</asp:Content>
