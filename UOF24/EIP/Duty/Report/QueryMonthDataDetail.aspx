<%@ Page Title="每月休假/出缺勤統計" Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="EIP_Duty_Report_QueryMonthDataDetail" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" Codebehind="QueryMonthDataDetail.aspx.cs" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">



    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
        <ContentTemplate>
            <telerik:RadToolBar ID="RadToolBar1" runat="server" Width="100%" OnButtonClick="RadToolBar1_OnButtonClick" meta:resourcekey="RadToolBar1Resource1" SingleClick="None">
                <Items>
                    <telerik:RadToolBarButton runat="server" Text="查詢" Value="Serach"
                        CheckedImageUrl="~/Common/Images/Icon/icon_m39.gif"
                        DisabledImageUrl="~/Common/Images/Icon/icon_m39.gif"
                        HoveredImageUrl="~/Common/Images/Icon/icon_m39.gif"
                        ImageUrl="~/Common/Images/Icon/icon_m39.gif"
                        meta:resourcekey="RadToolBarSerachResource1">
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton IsSeparator="True" meta:resourcekey="RadToolBarButtonResource1" runat="server"></telerik:RadToolBarButton>
                </Items>
            </telerik:RadToolBar>
        </ContentTemplate>
    </asp:UpdatePanel>
    <table class="PopTable" style="width: 100%">
        <tr>
            <td style="width: 25%; white-space: nowrap;">
                <asp:Label ID="Label1" runat="server" Text="人員:"
                    meta:resourcekey="Label1Resource1"></asp:Label>
            </td>
            <td style="width: 25%; white-space: nowrap;">
                <asp:Label ID="lblName" runat="server" meta:resourcekey="lblNameResource1"></asp:Label>
            </td>
            <td style="width: 25%; white-space: nowrap;">
                <asp:Label ID="Label3" runat="server" Text="月份:"
                    meta:resourcekey="Label3Resource1"></asp:Label>
            </td>
            <td style="width: 25%; white-space: nowrap;">
                <asp:DropDownList ID="ddlYears" runat="server"
                    meta:resourcekey="ddlYearsResource1">
                </asp:DropDownList>
                <asp:Label ID="Label4" runat="server" Text="年"
                    meta:resourcekey="Label4Resource1"></asp:Label>
                <asp:DropDownList ID="ddlMonth" runat="server"
                    meta:resourcekey="ddlMonthResource1">
                </asp:DropDownList>
                <asp:Label ID="Label5" runat="server" Text="月"
                    meta:resourcekey="Label5Resource1"></asp:Label>
            </td>
        </tr>
    </table>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>

            <telerik:RadTabStrip ID="RadTabStrip1" runat="server" MultiPageID="RadMultiPage1" SelectedIndex="0" meta:resourcekey="RadTabStrip1Resource1">
                <Tabs>
                    <telerik:RadTab Text="統計" Value="Statistics" runat="server" meta:resourcekey="RadTabResource1" Selected="True"></telerik:RadTab>
                    <telerik:RadTab Text="遲到明細" Value="Late" runat="server" meta:resourcekey="RadTabResource2"></telerik:RadTab>
                    <telerik:RadTab Text="忘刷卡明細" Value="Forget" runat="server" meta:resourcekey="RadTabResource3"></telerik:RadTab>
                    <telerik:RadTab Text="曠職明細" Value="Absent" runat="server" meta:resourcekey="RadTabResource4"></telerik:RadTab>
                </Tabs>
            </telerik:RadTabStrip>

            <telerik:RadMultiPage ID="RadMultiPage1" runat="server" SelectedIndex="0" meta:resourcekey="RadMultiPage1Resource1">
                <telerik:RadPageView ID="RadPageView1" runat="server" meta:resourcekey="RadPageView1Resource1" Selected="True">
                    <Fast:Grid ID="Grid1" runat="server" AutoGenerateCheckBoxColumn="False"
                        AllowSorting="True" AutoGenerateColumns="False"
                        DataKeyOnClientWithCheckBox="False" DefaultSortDirection="Ascending"
                        EmptyDataText="沒有資料" EnhancePager="True"
                        KeepSelectedRows="False" PageSize="31" OnBeforeExport="Grid1_BeforeExport"
                        OnRowDataBound="Grid1_RowDataBound" Width="100%"
                        meta:resourcekey="Grid1Resource1" AllowPaging="True" CustomDropDownListPage="False" SelectedRowColor="" UnSelectedRowColor=""   >
                        <EnhancePagerSettings ShowHeaderPager="True" FirstAltImageUrl="" FirstImageUrl="" LastAltImage="" LastImageUrl="" NextIAltImageUrl="" NextImageUrl="" PageInfoCssClass="" PageNumberCssClass="" PageNumberCurrentCssClass="" PageRedirectCssClass="" PreviousAltImageUrl="" PreviousImageUrl=""></EnhancePagerSettings>

                        <ExportExcelSettings AllowExportToExcel="True" ExportType="DataSource"></ExportExcelSettings>
                        <Columns>
                            <asp:BoundField DataField="day" meta:resourcekey="BoundFieldResource1">
                                <HeaderStyle Wrap="False" Width="5%"></HeaderStyle>

                                <ItemStyle HorizontalAlign="Center"></ItemStyle>
                            </asp:BoundField>
                            <asp:BoundField DataField="DAY_OF_WEEK" HeaderText="星期"
                                meta:resourcekey="BoundFieldResource2">
                                <HeaderStyle Wrap="False" Width="5%"></HeaderStyle>

                                <ItemStyle HorizontalAlign="Center"></ItemStyle>
                            </asp:BoundField>
                            <asp:TemplateField HeaderText="簽到" meta:resourcekey="TemplateFieldResource1">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("WORK_CLOCK_TIME_STRING") %>' meta:resourcekey="TextBox1Resource1"></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <table style="width: 80px" align="center">
                                        <tr>
                                            <td style="width: 5px;"></td>
                                            <td style="text-align: right; width: 50px; white-space: nowrap;">
                                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("WORK_CLOCK_TIME_STRING") %>' meta:resourcekey="Label1Resource2"></asp:Label>
                                            </td>
                                            <td style="width: 5px;"></td>
                                            <td style="text-align: left; width: 15px; white-space: nowrap;">
                                                <asp:ImageButton ID="imgWorkLocation" runat="server" Visible="False" ImageUrl="~/Common/Images/Icon/icon_m207.png" meta:resourcekey="imgWorkLocationResource1" />
                                            </td>
                                            <td style="width: 5px;"></td>
                                        </tr>
                                    </table>
                                </ItemTemplate>
                                <HeaderStyle Width="10%" Wrap="False" />
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="簽退" meta:resourcekey="TemplateFieldResource2">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("OFF_CLOCK_TIME_STRING") %>' meta:resourcekey="TextBox2Resource1"></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <table style="width: 80px" align="center">
                                        <tr>
                                            <td style="width: 5px;"></td>
                                            <td style="text-align: right; width: 50px; white-space: nowrap;">
                                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("OFF_CLOCK_TIME_STRING") %>' meta:resourcekey="Label2Resource1"></asp:Label>
                                            </td>
                                            <td style="width: 5px;"></td>
                                            <td style="text-align: left; width: 15px; white-space: nowrap;">
                                                <asp:ImageButton ID="imgOffLocation" runat="server" Visible="False" ImageUrl="~/Common/Images/Icon/icon_m207.png" meta:resourcekey="imgOffLocationResource1" />
                                            </td>
                                            <td style="width: 5px;"></td>
                                        </tr>
                                    </table>
                                </ItemTemplate>
                                <HeaderStyle Width="10%" Wrap="False" />
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:TemplateField>
                            <asp:BoundField HeaderText="請假" HtmlEncode="False"
                                meta:resourcekey="BoundFieldResource5">
                                <HeaderStyle Wrap="False" Width="20%"></HeaderStyle>

                                <ItemStyle Wrap="False"></ItemStyle>
                            </asp:BoundField>
                            <asp:BoundField HeaderText="加班" HtmlEncode="False"
                                meta:resourcekey="BoundFieldResource6">
                                <HeaderStyle Wrap="False" Width="20%"></HeaderStyle>

                                <ItemStyle Wrap="False"></ItemStyle>
                            </asp:BoundField>
                            <asp:BoundField HeaderText="出差" meta:resourcekey="BoundFieldResource8">
                                <HeaderStyle Width="20%" Wrap="False" />
                                <ItemStyle Wrap="False" />
                            </asp:BoundField>
                            <asp:BoundField HeaderText="狀態" DataField="STATUS"
                                meta:resourcekey="BoundFieldResource7">
                                <HeaderStyle Wrap="False" Width="10%"></HeaderStyle>
                            </asp:BoundField>
                        </Columns>
                    </Fast:Grid>
                </telerik:RadPageView>
                <telerik:RadPageView ID="RadMultiPage2" runat="server" meta:resourcekey="RadMultiPage2Resource1">
                                        <Fast:Grid ID="gridLate" runat="server" AllowPaging="True" OnBeforeExport="gridLate_BeforeExport" Width="100%" OnSorting="gridLate_Sorting"
                                            OnPageIndexChanging="grid2_PageIndexChanging" AutoGenerateCheckBoxColumn="False" AutoGenerateColumns="False" AllowSorting="True"  DataKeyOnClientWithCheckBox="False" DefaultSortDirection="Ascending" EmptyDataText="No data found" EnhancePager="True" KeepSelectedRows="False" meta:resourcekey="gridLateResource1" PageSize="15" CustomDropDownListPage="False" SelectedRowColor="" UnSelectedRowColor=""  >
                                            <EnhancePagerSettings ShowHeaderPager="True" />
                         <ExportExcelSettings AllowExportToExcel="True" ExcelExportFileName="LateMinsDetail.xls" ></ExportExcelSettings>
                                            <Columns>
                            <asp:BoundField HeaderText="帳號" DataField="ACCOUNT" SortExpression="ACCOUNT"  meta:resourcekey="BoundFieldResource9" />
                            <asp:BoundField HeaderText="姓名" DataField="NAME"  SortExpression="NAME" meta:resourcekey="BoundFieldResource10" />
                            <asp:BoundField HeaderText="員工編號" DataField="EMPLOYEE_NO" SortExpression="EMPLOYEE_NO" meta:resourcekey="BoundFieldResource11" />
                            <asp:BoundField HeaderText="部門名稱" DataField="GROUP_NAME" SortExpression="GROUP_NAME" meta:resourcekey="BoundFieldResource12" />
                            <asp:BoundField HeaderText="遲到日期" DataField="LATE_DATE" SortExpression="LATE_DATE" DataFormatString="{0:yyyy/MM/dd}" meta:resourcekey="BoundFieldResource13" />
                            <asp:BoundField HeaderText="遲到分鐘數" DataField="LATE_MINS" SortExpression="LATE_MINS" DataFormatString="{0:N0}" meta:resourcekey="BoundFieldResource14" >

                                                <ItemStyle HorizontalAlign="Right" />
                                                </asp:BoundField>

                        </Columns>

                    </Fast:Grid>

                </telerik:RadPageView>
                <telerik:RadPageView ID="RadPageView3" runat="server" meta:resourcekey="RadPageView3Resource1">
                    <Fast:Grid ID="gridForget" runat="server" AllowPaging="True" OnBeforeExport="gridForget_BeforeExport" Width="100%" OnSorting="gridForget_Sorting"
                        OnPageIndexChanging="gridForget_PageIndexChanging" AutoGenerateCheckBoxColumn="False" AutoGenerateColumns="False" AllowSorting="True"  DataKeyOnClientWithCheckBox="False" DefaultSortDirection="Ascending" EmptyDataText="No data found" EnhancePager="True" KeepSelectedRows="False" meta:resourcekey="gridForgetResource1" PageSize="15" CustomDropDownListPage="False" SelectedRowColor="" UnSelectedRowColor=""  >
                         <EnhancePagerSettings ShowHeaderPager="True" />
                         <ExportExcelSettings AllowExportToExcel="True" ExcelExportFileName="ForgetDetail.xls"></ExportExcelSettings>
                        <Columns>
                            <asp:BoundField HeaderText="帳號" DataField="ACCOUNT" SortExpression="ACCOUNT" meta:resourcekey="BoundFieldResource15" />
                            <asp:BoundField HeaderText="姓名" DataField="NAME"   SortExpression="NAME" meta:resourcekey="BoundFieldResource16" />
                            <asp:BoundField HeaderText="員工編號" DataField="EMPLOYEE_NO"  SortExpression="EMPLOYEE_NO" meta:resourcekey="BoundFieldResource17" />
                            <asp:BoundField HeaderText="部門名稱" DataField="GROUP_NAME"  SortExpression="GROUP_NAME" meta:resourcekey="BoundFieldResource18" />
                            <asp:BoundField HeaderText="補刷卡日期" DataField="PUNCH_DATE"  SortExpression="PUNCH_DATE"  DataFormatString="{0:yyyy/MM/dd}" meta:resourcekey="BoundFieldResource19" />
                            <asp:BoundField HeaderText="上班忘刷卡" DataField="PUNCH_WORK"  SortExpression="PUNCH_WORK" meta:resourcekey="BoundFieldResource20" >
                            <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField HeaderText="下班忘刷卡" DataField="PUNCH_OFF" SortExpression="PUNCH_OFF" meta:resourcekey="BoundFieldResource21" >
                            <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                        </Columns>
                    </Fast:Grid>

                </telerik:RadPageView>
                <telerik:RadPageView ID="RadPageView4" runat="server" meta:resourcekey="RadPageView4Resource1">
                    <Fast:Grid ID="gridAbsent" runat="server" AllowPaging="True"  OnBeforeExport="gridAbsent_BeforeExport"  Width="100%" OnSorting="gridAbsent_Sorting"
                        OnPageIndexChanging="gridAbsent_PageIndexChanging" AutoGenerateCheckBoxColumn="False" AutoGenerateColumns="False" AllowSorting="True"  DataKeyOnClientWithCheckBox="False" DefaultSortDirection="Ascending" EmptyDataText="No data found" EnhancePager="True" KeepSelectedRows="False" meta:resourcekey="gridAbsentResource1" PageSize="15" CustomDropDownListPage="False" SelectedRowColor="" UnSelectedRowColor=""  >
                        <EnhancePagerSettings ShowHeaderPager="True" />
                        <ExportExcelSettings AllowExportToExcel="True" ExcelExportFileName="AbsentDetail.xls"></ExportExcelSettings>
                         <Columns>
                            <asp:BoundField HeaderText="帳號" DataField="ACCOUNT" SortExpression="ACCOUNT" meta:resourcekey="BoundFieldResource22" />
                            <asp:BoundField HeaderText="姓名" DataField="NAME"  SortExpression="NAME"  meta:resourcekey="BoundFieldResource23" />
                            <asp:BoundField HeaderText="員工編號" DataField="EMPLOYEE_NO"  SortExpression="EMPLOYEE_NO"  meta:resourcekey="BoundFieldResource24" />
                            <asp:BoundField HeaderText="部門名稱" DataField="GROUP_NAME"  SortExpression="GROUP_NAME"  meta:resourcekey="BoundFieldResource25" />
                            <asp:BoundField HeaderText="曠職日期" DataField="ABS_DATE"  SortExpression="ABS_DATE"  DataFormatString="{0:yyyy/MM/dd}" meta:resourcekey="BoundFieldResource26" />
                            <asp:BoundField HeaderText="曠職時數" DataField="ABS_HOURS"  SortExpression="ABS_HOURS"  DataFormatString="{0:N2}" meta:resourcekey="BoundFieldResource27" >

                             <ItemStyle HorizontalAlign="Right" />
                             </asp:BoundField>

                        </Columns>

                    </Fast:Grid>
                </telerik:RadPageView>
            </telerik:RadMultiPage>


        </ContentTemplate>
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="RadToolBar1"
                EventName="ButtonClick" />
        </Triggers>
    </asp:UpdatePanel>
    <asp:Label ID="lblMonday" runat="server" Text="一" Visible="False"
        meta:resourcekey="lblMondayResource1"></asp:Label>
    <asp:Label ID="lblTuesday" runat="server" Text="二" Visible="False"
        meta:resourcekey="lblTuesdayResource1"></asp:Label>
    <asp:Label ID="lblWednesday" runat="server" Text="三" Visible="False"
        meta:resourcekey="lblWednesdayResource1"></asp:Label>
    <asp:Label ID="lblThursday" runat="server" Text="四" Visible="False"
        meta:resourcekey="lblThursdayResource1"></asp:Label>
    <asp:Label ID="lblFriday" runat="server" Text="五" Visible="False"
        meta:resourcekey="lblFridayResource1"></asp:Label>
    <asp:Label ID="lblSaturday" runat="server" Text="六" Visible="False"
        meta:resourcekey="lblSaturdayResource1"></asp:Label>
    <asp:Label ID="lblSunday" runat="server" Text="日" Visible="False"
        meta:resourcekey="lblSundayResource1"></asp:Label>
    <asp:Label ID="lblNormal" runat="server" Text="正常" Visible="False"
        meta:resourcekey="lblNormalResource1"></asp:Label>
    <asp:Label ID="lblLate" runat="server" Text="遲到" Visible="False"
        meta:resourcekey="lblLateResource1"></asp:Label>
    <asp:Label ID="lblAbsent" runat="server" Text="曠職" Visible="False"
        meta:resourcekey="lblAbsentResource1"></asp:Label>
    <asp:Label ID="lblLateAndAnsent" runat="server" Text="遲到又曠職" Visible="False"
        meta:resourcekey="lblLateAndAnsentResource1"></asp:Label>
    <asp:Label ID="lblNoTimeTable" runat="server" Text="無班表" Visible="False"
        meta:resourcekey="lblNoTimeTableResource1"></asp:Label>
    <asp:Label ID="lblExport" runat="server" Text="匯出Excel" Visible="False" meta:resourcekey="lblExportResource1"></asp:Label>
    <asp:Label ID="lblAccount" runat="server" Text="({0})"  Visible="False" meta:resourcekey="lblAccountResource2" ></asp:Label>
    <asp:Label ID="lblMapTitle" runat="server" Text="刷卡位置" Visible="False" meta:resourcekey="lblMapTitleResource1"></asp:Label>
    <asp:HiddenField ID="hfExport" runat="server" />
    <asp:Label ID="lblGridWeekDay" runat="server" Text="星期" Visible="False" meta:resourcekey="lblGridWeekDayResource1"></asp:Label>
    <asp:Label ID="lblGridWork" runat="server" Text="簽到" Visible="False" meta:resourcekey="lblGridWorkResource1"></asp:Label>
    <asp:Label ID="lblGridOff" runat="server" Text="簽退" Visible="False" meta:resourcekey="lblGridOffResource1"></asp:Label>
    <asp:Label ID="lblGridLeave" runat="server" Text="請假" Visible="False" meta:resourcekey="lblGridLeaveResource1"></asp:Label>
    <asp:Label ID="lblGridOverTime" runat="server" Text="加班" Visible="False" meta:resourcekey="lblGridOverTimeResource1"></asp:Label>
    <asp:Label ID="lblGridTravel" runat="server" Text="出差" Visible="False" meta:resourcekey="lblGridTravelResource1"></asp:Label>
    <asp:Label ID="lblGridStatus" runat="server" Text="狀態" Visible="False" meta:resourcekey="lblGridStatusResource1"></asp:Label>
</asp:Content>

