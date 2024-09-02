<%@ Page Title="" Language="C#" MasterPageFile="~/Master/DefaultMasterPage.master" AutoEventWireup="true" Inherits="EIP_Duty_Report_QueryMonthDataByUser" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" Codebehind="QueryMonthDataByUser.aspx.cs" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register assembly="System.Web, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a" namespace="System.Web.UI" tagprefix="cc1" %>
<%@ Register assembly="System.Web, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a" namespace="System.Web.UI.HtmlControls" tagprefix="cc2" %>
<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
        <ContentTemplate>
            <table style="width:100%;">
                <tr>
                    <td>
                        <telerik:RadToolBar ID="RadToolBar1" runat="server" Width="100%" OnButtonClick="RadToolBar1_OnButtonClick" meta:resourcekey="RadToolBar1Resource1" SingleClick="None">
                            <Items>
                                <telerik:RadToolBarButton runat="server" Value="time" meta:resourcekey="RadToolBarButtonResource1">
                                    <ItemTemplate>
                                        <table id="Table1" style="width: 100%;" runat="server">
                                            <tr id="Tr1" runat="server">
                                                <td id="Td1" runat="server">
                                                    <asp:Label ID="Label2" runat="server" Text="查詢時間:" meta:resourcekey="Label2Resource1"></asp:Label>
                                                </td>
                                                <td id="Td2" runat="server">
                                                    <telerik:RadDatePicker ID="rdpStartDate" runat="server" >
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
                                                <td id="Td4" runat="server">
                                                    <telerik:RadDatePicker ID="rdpEndDate" runat="server" >
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
                                        </table>
                                    </ItemTemplate>
                                </telerik:RadToolBarButton>
                                <telerik:RadToolBarButton IsSeparator="True" runat="server" meta:resourcekey="RadToolBarButtonResource2"></telerik:RadToolBarButton>
                                <telerik:RadToolBarButton runat="server" Value="Expand" meta:resourcekey="RadToolBarButtonResource3">
                                    <ItemTemplate>
                                        <asp:CheckBox runat="server" ID="cbxExpand" Checked="True" Text="只顯示可用假別" meta:resourcekey="cbxExpandResource1"></asp:CheckBox>
                                    </ItemTemplate>
                                </telerik:RadToolBarButton>
                                <telerik:RadToolBarButton IsSeparator="True" runat="server" meta:resourcekey="RadToolBarButtonResource4"></telerik:RadToolBarButton>
                                <telerik:RadToolBarButton runat="server" Text="查詢" Value="Query"
                                    CheckedImageUrl="~/Common/Images/Icon/icon_m39.gif"
                                    DisabledImageUrl="~/Common/Images/Icon/icon_m39.gif"
                                    HoveredImageUrl="~/Common/Images/Icon/icon_m39.gif"
                                    ImageUrl="~/Common/Images/Icon/icon_m39.gif"
                                    meta:resourcekey="RadToolBarQueryResource1">
                                </telerik:RadToolBarButton>
                                <telerik:RadToolBarButton IsSeparator="True" runat="server" meta:resourcekey="RadToolBarButtonResource5"></telerik:RadToolBarButton>
                            </Items>
                        </telerik:RadToolBar>
                        <asp:CustomValidator ID="CustomValidator1" runat="server" ForeColor="Red" ErrorMessage="起的時間不可晚於訖的時間" Display="Dynamic" meta:resourcekey="CustomValidator1Resource1"></asp:CustomValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                    <Fast:Grid ID="DutyGrid" runat="server" AllowPaging="True" AllowSorting="True" 
                                        AutoGenerateCheckBoxColumn="False" 
                                         
                                        DataKeyOnClientWithCheckBox="False" DefaultSortDirection="Ascending" 
                                        EmptyDataText="沒有資料" EnhancePager="True" 
                                        meta:resourcekey="gridItemResource1" PageSize="15"  
                                         Width="100%" KeepSelectedRows="False" 
                                        AutoGenerateColumns="False" 
                            onbeforeexport="DutyGrid_BeforeExport" 
                            onpageindexchanging="DutyGrid_PageIndexChanging" 
                            onrowdatabound="DutyGrid_RowDataBound" onsorting="DutyGrid_Sorting" CustomDropDownListPage="False" SelectedRowColor="" UnSelectedRowColor=""   >
                                        <EnhancePagerSettings ShowHeaderPager="True" FirstAltImageUrl="" FirstImageUrl="" LastAltImage="" LastImageUrl="" NextIAltImageUrl="" NextImageUrl="" PageInfoCssClass="" PageNumberCssClass="" PageNumberCurrentCssClass="" PageRedirectCssClass="" PreviousAltImageUrl="" PreviousImageUrl="" />
                                        <ExportExcelSettings AllowExportToExcel="True" />
                        <Columns>                       
                                                            <asp:TemplateField HeaderText="帳號" meta:resourcekey="TemplateFieldResource2">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="lbtnlink" runat="server" Text='<%# Bind("USER_GUID") %>'
                                            meta:resourcekey="lbtnlinkResource1"></asp:LinkButton>
                                    </ItemTemplate>
                                    <HeaderStyle Wrap="False" />
                                    <ItemStyle Wrap="False" />
                                </asp:TemplateField>  
                                 <asp:TemplateField HeaderText="姓名" meta:resourcekey="TemplateFieldResource1">
                                    <ItemTemplate>
                                        <asp:Label ID="lblName" runat="server" meta:resourcekey="lblNameResource1"></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle Wrap="False" />
                                    <ItemStyle Wrap="False" />
                                </asp:TemplateField>                       
                        </Columns>
                </Fast:Grid>
                    </td>
                </tr>
            </table>
        </ContentTemplate>
    </asp:UpdatePanel>

    <asp:Label ID="lblLateMins" runat="server" Text="遲到分鐘數" Visible="False" meta:resourcekey="lblLateMinsResource1"></asp:Label>
    <asp:Label ID="lblWoverTime" runat="server" Text="工作日加班時數" Visible="False" meta:resourcekey="lblWoverTimeResource1"></asp:Label>
    <asp:Label ID="lblHoverTime" runat="server" Text="休息日加班時數" Visible="False" meta:resourcekey="lblHoverTimeResource1"></asp:Label>
    <asp:Label ID="lblRoverTime" runat="server" Text="例假日加班時數" Visible="False" meta:resourcekey="lblRoverTimeResource1"></asp:Label>
    <asp:Label ID="lblOoverTime" runat="server" Text="國定假日加班時數" Visible="False" meta:resourcekey="lblOoverTimeResource1"></asp:Label>
    <asp:Label ID="lblForget" runat="server" Text="忘刷卡次數" Visible="False" meta:resourcekey="lblForgetResource1"></asp:Label>
    <asp:Label ID="lblDayCount" runat="server" Text="日數" Visible = "False" meta:resourcekey="lblDayCountResource1"></asp:Label>
    <asp:Label ID="lblHrCount" runat="server" Text="時數" Visible = "False" meta:resourcekey="lblHrCountResource1"></asp:Label>
    <asp:Label ID="lblUserName" runat="server" Text="姓名" Visible = "False" meta:resourcekey="lblUserNameResource1"></asp:Label>
    <asp:Label ID="lblDeptName" runat="server" Text="部門名稱" Visible = "False" meta:resourcekey="lblDeptNameResource1"></asp:Label>
    <asp:Label ID="lblLate" runat="server" Text="遲到次數" Visible = "False" meta:resourcekey="lblLateResource1"></asp:Label>
    <asp:Label ID="lblAbsent" runat="server" Text="曠職時數" Visible = "False" meta:resourcekey="lblAbsentResource1"></asp:Label>
    <asp:Label ID="lblOvertime" runat="server" Text="加班轉費用時數" Visible = "False" meta:resourcekey="lblOvertimeResource1"></asp:Label>
    <asp:Label ID="lblOvertimeT" runat="server" Text="加班轉補休時數" Visible = "False" meta:resourcekey="lblOverTimeTResource1"></asp:Label>
    <asp:Label ID="lblTravel" runat="server" Text="出差時數" Visible = "False"  meta:resourcekey="lblTravelResource1"></asp:Label>
    <asp:Label ID="lblExpWork" runat="server" Text="應出勤時數" Visible="False" meta:resourcekey="lblExpWorkResource1"></asp:Label>
    <asp:Label ID="lblPunWork" runat="server" Text="刷卡出勤時數" Visible="False" meta:resourcekey="lblPunWorkResource1"></asp:Label>
        <asp:Label ID="lblAccount" runat="server" Text="帳號" Visible="False" meta:resourcekey="lblAccountResource1"></asp:Label>
    <asp:Label ID="lblHour" runat="server" Text="時" Visible="False" meta:resourcekey="lblHourResource1"></asp:Label>
    <asp:Label ID="lblDay" runat="server" Text="天" Visible="False" meta:resourcekey="lblDayResource1"></asp:Label>
</asp:Content>

