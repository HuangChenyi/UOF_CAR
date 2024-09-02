<%@ Page Title="" Language="C#" MasterPageFile="~/Master/TwoColumn.master" AutoEventWireup="true" Inherits="EIP_Duty_Report_QueryDayRecordByManager" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" Codebehind="QueryDayRecordByManager.aspx.cs" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register Assembly="System.Web, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a" Namespace="System.Web.UI" TagPrefix="cc1" %>
<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>
<%@ Register Src="../../../Common/Organization/UC_DeptManagerTree.ascx" TagName="UC_DeptManagerTree" TagPrefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ScriptContentPlaceHolder" runat="Server">
    <script type="text/javascript">
        function CheckDateOverYear(sender, args) {
            var rdStartDate = $find("<%= RadToolBar1.ClientID %>").findItemByValue("startdate").findControl("rdStartDate").get_dateInput().get_selectedDate();
            var rdEndDate = $find("<%= RadToolBar1.ClientID %>").findItemByValue("enddate").findControl("rdEndDate").get_dateInput().get_selectedDate();
            //判斷查詢日期是否大於一年
            if (((Date.parse(rdEndDate).valueOf() - Date.parse(rdStartDate).valueOf()) / (1000 * 60 * 60 * 24)) >365) {
                args.IsValid = false;
            }
        }
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ToolbarContentPlaceHolder" runat="server"></asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="LeftContentPlaceHolder" runat="server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional" RenderMode="Inline">
        <ContentTemplate>
            <uc1:UC_DeptManagerTree ID="UC_DeptManagerTree1" runat="server" ShowDeptManagerTree="True" ShowSuperiorTree="True" DisplayActiveControl="true"/>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="RightContentPlaceHolder" runat="server">
    <table style="width: 100%;">
        <tr>
            <td>
                <telerik:RadToolBar ID="RadToolBar1" runat="server" Width="100%" OnButtonClick="RadToolBar1_OnButtonClick" meta:resourcekey="RadToolBar1Resource1" SingleClick="None">
                    <Items>
                        <telerik:RadToolBarButton meta:resourcekey="RadToolBarButtonResource1">
                            <ItemTemplate>
                                <asp:Label ID="queryDate" runat="server" Text="日期:" meta:resourcekey="queryDateResource1"></asp:Label>
                            </ItemTemplate>
                        </telerik:RadToolBarButton>
                        <telerik:RadToolBarButton runat="server" Value="startdate" meta:resourcekey="RadToolBarButtonResource2">
                            <ItemTemplate>
                                <telerik:RadDatePicker ID="rdStartDate" runat="server"  meta:resourcekey="rdStartDateResource1">
                                    <Calendar UseColumnHeadersAsSelectors="False" UseRowHeadersAsSelectors="False" Culture="zh-TW" EnableWeekends="True" FastNavigationNextText="&amp;lt;&amp;lt;">
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
                                    <DatePopupButton HoverImageUrl="" ImageUrl="" CssClass="" />
                                </telerik:RadDatePicker>
                                </igsch:WebDateChooser>
                            </ItemTemplate>
                        </telerik:RadToolBarButton>                        
                        <telerik:RadToolBarButton meta:resourcekey="RadToolBarButtonResource3">
                            <ItemTemplate>
                                <asp:Label ID="Label3" runat="server" Text="~" meta:resourcekey="Label3Resource1"></asp:Label>
                            </ItemTemplate>
                        </telerik:RadToolBarButton>
                        <telerik:RadToolBarButton runat="server" Value="enddate" meta:resourcekey="RadToolBarButtonResource4">
                            <ItemTemplate>
                                <telerik:RadDatePicker ID="rdEndDate" runat="server" meta:resourcekey="rdEndDateResource1">
                                    <Calendar UseColumnHeadersAsSelectors="False" UseRowHeadersAsSelectors="False" Culture="zh-TW" EnableWeekends="True" FastNavigationNextText="&amp;lt;&amp;lt;">
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
                                    <DatePopupButton HoverImageUrl="" ImageUrl="" CssClass="" />
                                </telerik:RadDatePicker>
                                </igsch:WebDateChooser>
                            </ItemTemplate>
                        </telerik:RadToolBarButton>                        
                        <telerik:RadToolBarButton IsSeparator="true" meta:resourcekey="RadToolBarButtonResource5"></telerik:RadToolBarButton>
                        <telerik:RadToolBarButton meta:resourcekey="RadToolBarButtonResource6">
                            <ItemTemplate>
                                <asp:Label ID="userName" runat="server" Text="人員姓名:" meta:resourcekey="userNameResource1"></asp:Label>
                            </ItemTemplate>
                        </telerik:RadToolBarButton>
                        <telerik:RadToolBarButton runat="server" Value="name" meta:resourcekey="RadToolBarButtonResource7">
                            <ItemTemplate>
                                <asp:TextBox ID="txtName" runat="server" Width="100px" meta:resourcekey="txtNameResource1"></asp:TextBox>
                            </ItemTemplate>
                        </telerik:RadToolBarButton>
                        <telerik:RadToolBarButton IsSeparator="true" meta:resourcekey="RadToolBarButtonResource8"></telerik:RadToolBarButton>
                        <telerik:RadToolBarButton runat="server" Value="subDept" meta:resourcekey="RadToolBarButtonResource9">
                            <ItemTemplate>
                                <asp:CheckBox ID="cbSubDept" runat="server" Text="包含子部門" meta:resourcekey="cbSubDeptResource1" />
                            </ItemTemplate>
                        </telerik:RadToolBarButton>
                        <telerik:RadToolBarButton IsSeparator="true" meta:resourcekey="RadToolBarButtonResource10"></telerik:RadToolBarButton>
                        <telerik:RadToolBarButton runat="server" Text="查詢" Value="Serach"
                            CheckedImageUrl="~/Common/Images/Icon/icon_m39.gif"
                            DisabledImageUrl="~/Common/Images/Icon/icon_m39.gif"
                            HoveredImageUrl="~/Common/Images/Icon/icon_m39.gif"
                            ImageUrl="~/Common/Images/Icon/icon_m39.gif"
                            meta:resourcekey="RadToolBarSerachResource1">
                        </telerik:RadToolBarButton>
                        <telerik:RadToolBarButton IsSeparator="true" meta:resourcekey="RadToolBarButtonResource11"></telerik:RadToolBarButton>
                        <telerik:RadToolBarButton meta:resourcekey="RadToolBarButtonResource11">
                            <ItemTemplate>
                                <asp:CustomValidator ID="cvDateOverYear" runat="server" ErrorMessage="查詢區間不可大於一年" Display="Dynamic" ClientValidationFunction="CheckDateOverYear" meta:resourcekey="cvDateOverYearResource1"></asp:CustomValidator>
                            </ItemTemplate>
                        </telerik:RadToolBarButton>
                    </Items>
                </telerik:RadToolBar>
            </td>
        </tr>
        <tr>
            <td>
                <asp:UpdatePanel ID="UpdatePanel5" runat="server" UpdateMode="Conditional" RenderMode="Inline">
                    <ContentTemplate>
                        <Fast:Grid ID="DayRecodGrid" runat="server" AutoGenerateCheckBoxColumn="False" AllowSorting="True"
                            AutoGenerateColumns="False" DataKeyOnClientWithCheckBox="False"
                            DefaultSortDirection="Ascending" DefaultSortColumnName="GROUP_NAME" EmptyDataText="沒有資料"
                            EnhancePager="True" KeepSelectedRows="False" PageSize="15"
                            AllowPaging="True" OnBeforeExport="DayRecodGrid_BeforeExport"
                            OnPageIndexChanging="DayRecodGrid_PageIndexChanging" OnRowDataBound="DayRecodGrid_RowDataBound"
                            Width="100%" meta:resourcekey="DayRecodGridResource1"
                            OnSorting="DayRecodGrid_Sorting" CustomDropDownListPage="False" SelectedRowColor="" UnSelectedRowColor="">
                            <EnhancePagerSettings ShowHeaderPager="True" FirstAltImageUrl="" FirstImageUrl="" LastAltImage="" LastImageUrl="" NextIAltImageUrl="" NextImageUrl="" PageInfoCssClass="" PageNumberCssClass="" PageNumberCurrentCssClass="" PageRedirectCssClass="" PreviousAltImageUrl="" PreviousImageUrl="" />
                            <ExportExcelSettings AllowExportToExcel="True" ExportType="DataSource" />
                            <Columns>
                                <asp:BoundField DataField="ACCOUNT" HeaderText="帳號" SortExpression="ACCOUNT" meta:resourcekey="BoundFieldResource8">
                                    <ItemStyle Width="100px" Wrap="False" />
                                    <HeaderStyle Wrap="False" />
                                </asp:BoundField>
                                <asp:TemplateField HeaderText="姓名" SortExpression="NAME" meta:resourcekey="TemplateFieldResource1">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="lbtnName" runat="server" Text='<%#: Eval("NAME") %>' meta:resourcekey="lbtnNameResource1"></asp:LinkButton>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Left" Width="150px" Wrap="False" />
                                </asp:TemplateField>
                                <asp:BoundField HeaderText="員工編號" DataField="EMPLOYEE_NO"
                                    SortExpression="EMPLOYEE_NO" meta:resourcekey="EmpnoBoundFieldResource">
                                    <ItemStyle Width="100px" Wrap="False" />
                                    <HeaderStyle Wrap="False" />
                                </asp:BoundField>
                                <asp:BoundField HeaderText="部門" DataField="GROUP_NAME"
                                    SortExpression="GROUP_NAME" meta:resourcekey="BoundFieldResource7">
                                    <ItemStyle Width="150px" Wrap="False" />
                                </asp:BoundField>                                
                                <asp:TemplateField HeaderText="歸屬日" SortExpression="BELONG_DATE" meta:resourcekey="TemplateFieldResource6">
                                    <ItemTemplate>
                                        <asp:Label ID="lblBelongDate" runat="server" Text='<%#: Bind("BELONG_DATE") %>' meta:resourcekey="lblBelongDateResource1"></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle Width="100px" Wrap="False" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="簽到" SortExpression="WORK_CLOCK_TIME_STRING" meta:resourcekey="TemplateFieldResource7">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox1" runat="server" Text='<%#: Bind("WORK_CLOCK_TIME_STRING") %>' meta:resourcekey="TextBox1Resource1"></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <table style="width: 80px" align="center">
                                            <tr>
                                                <td style="width: 5px;"></td>
                                                <td style="text-align: right; width: 50px; white-space: nowrap;">
                                                    <asp:Label ID="Label1" runat="server" Text='<%#: Bind("WORK_CLOCK_TIME_STRING") %>' meta:resourcekey="Label1Resource2"></asp:Label>
                                                </td>
                                                <td style="width: 5px;"></td>
                                                <td style="text-align: left; width: 15px; white-space: nowrap;">
                                                    <asp:ImageButton ID="imgWorkLocation" runat="server" Visible="False" ImageUrl="~/Common/Images/Icon/icon_m207.png" meta:resourcekey="imgWorkLocationResource1" />
                                                </td>
                                                <td style="width: 5px;"></td>
                                            </tr>
                                        </table>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" Width="80px" Wrap="False" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="簽退" SortExpression="OFF_CLOCK_TIME_STRING" meta:resourcekey="TemplateFieldResource8">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox2" runat="server" Text='<%#: Bind("OFF_CLOCK_TIME_STRING") %>' meta:resourcekey="TextBox2Resource1"></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <table style="width: 80px" align="center">
                                            <tr>
                                                <td style="width: 5px;"></td>
                                                <td style="text-align: right; width: 50px; white-space: nowrap;">
                                                    <asp:Label ID="Label2" runat="server" Text='<%#: Bind("OFF_CLOCK_TIME_STRING") %>' meta:resourcekey="Label2Resource1"></asp:Label>
                                                </td>
                                                <td style="width: 5px;"></td>
                                                <td style="text-align: left; width: 15px; white-space: nowrap;">
                                                    <asp:ImageButton ID="imgOffLocation" runat="server" Visible="False" ImageUrl="~/Common/Images/Icon/icon_m207.png" meta:resourcekey="imgOffLocationResource1" />
                                                </td>
                                                <td style="width: 5px;"></td>
                                            </tr>
                                        </table>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" Width="80px" Wrap="False" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="請假" meta:resourcekey="TemplateFieldResource2" SortExpression="LEAVE_TIME_STRING">
                                    <ItemTemplate>
                                        <asp:Label ID="lblLeave" runat="server" meta:resourcekey="lblLeaveResource1"></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle Wrap="False" Width="150px" />
                                    <ItemStyle Wrap="False" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="加班" meta:resourcekey="TemplateFieldResource3" SortExpression="OVERTIME_TIME_STRING">
                                    <ItemTemplate>
                                        <asp:Label ID="lblOvarTime" runat="server" meta:resourcekey="lblOvarTimeResource1"></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle Wrap="False" Width="150px" />
                                    <ItemStyle Wrap="False" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="出差" meta:resourcekey="TemplateFieldResource5" SortExpression="TRAVEL_TIME_STRING">
                                    <ItemTemplate>
                                        <asp:Label ID="lblTravel" runat="server" meta:resourcekey="lblTravelResource1"></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle Wrap="False" Width="150px" />
                                    <ItemStyle Wrap="False" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="狀態" meta:resourcekey="TemplateFieldResource4" SortExpression="STATUS">
                                    <ItemTemplate>
                                        <asp:Label ID="lblStatus" runat="server" meta:resourcekey="lblStatusResource1"></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle Wrap="False" HorizontalAlign="Center" Width="80px" />
                                </asp:TemplateField>
                            </Columns>
                        </Fast:Grid>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </td>
        </tr>
    </table>

    <asp:Label ID="lblNormal" runat="server" Text="正常" Visible="False" meta:resourcekey="lblNormalResource1"></asp:Label>
    <asp:Label ID="lblLate" runat="server" Text="遲到" Visible="False" meta:resourcekey="lblLateResource1"></asp:Label>
    <asp:Label ID="lblAbsent" runat="server" Text="曠職" Visible="False" meta:resourcekey="lblAbsentResource1"></asp:Label>
    <asp:Label ID="lblLateAndAnsent" runat="server" Text="遲到又曠職" Visible="False" meta:resourcekey="lblLateAndAnsentResource1"></asp:Label>
    <asp:Label ID="lblNoTimeTable" runat="server" Text="無班表" Visible="False" meta:resourcekey="lblNoTimeTableResource1"></asp:Label>
    <asp:Label runat="server" ID="lbYes" Text="是" Visible="False" meta:resourcekey="lbYesResource1"></asp:Label>
    <asp:Label runat="server" ID="lbNo" Text="否" Visible="False" meta:resourcekey="lbNoResource1"></asp:Label>
    <asp:Label runat="server" ID="lbConfirmDelete" Text="確定要刪除?" Visible="False" meta:resourcekey="lbConfirmDeleteResource1"></asp:Label>
    <asp:Label ID="lblKeyWordNeeded" runat="server" Text="請輸入關鍵字，確定要繼續搜尋？" Visible="False"
        meta:resourcekey="lblKeyWordNeededResource1"></asp:Label>
    <asp:Label ID="Label1" runat="server" Text="內部組織結構列表" meta:resourcekey="Label1Resource1" Visible="False"></asp:Label>
    <asp:Label ID="lblMapTitle" runat="server" Text="刷卡位置" Visible="False" meta:resourcekey="lblMapTitleResource1"></asp:Label>
    <asp:HiddenField ID="hfExport" runat="server" />
    <asp:Label ID="lblGridAccount" runat="server" Text="帳號" Visible="False" meta:resourcekey="lblGridAccountResource1"></asp:Label>
    <asp:Label ID="lblGridName" runat="server" Text="姓名" Visible="False" meta:resourcekey="lblGridNameResource1"></asp:Label>
    <asp:Label ID="lblGridEmployeeNo" runat="server" Text="員工編號" Visible="False" meta:resourcekey="lblGridEmployeeNoResource1"></asp:Label>
    <asp:Label ID="lblGridDept" runat="server" Text="部門" Visible="False" meta:resourcekey="lblGridDeptResource1"></asp:Label>
    <asp:Label ID="lblGridBelongDate" runat="server" Text="歸屬日" Visible="False" meta:resourcekey="lblGridBelongDateResource1"></asp:Label>
    <asp:Label ID="lblGridWork" runat="server" Text="簽到" Visible="False" meta:resourcekey="lblGridWorkResource1"></asp:Label>
    <asp:Label ID="lblGridOff" runat="server" Text="簽退" Visible="False" meta:resourcekey="lblGridOffResource1"></asp:Label>
    <asp:Label ID="lblGridLeave" runat="server" Text="請假" Visible="False" meta:resourcekey="lblGridLeaveResource1"></asp:Label>
    <asp:Label ID="lblGridOverTime" runat="server" Text="加班" Visible="False" meta:resourcekey="lblGridOverTimeResource1"></asp:Label>
    <asp:Label ID="lblGridTravel" runat="server" Text="出差" Visible="False" meta:resourcekey="lblGridTravelResource1"></asp:Label>
    <asp:Label ID="lblGridStatus" runat="server" Text="狀態" Visible="False" meta:resourcekey="lblGridStatusResource1"></asp:Label>
</asp:Content>
