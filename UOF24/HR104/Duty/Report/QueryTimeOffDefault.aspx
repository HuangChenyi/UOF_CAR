<%@ Page Title="" Language="C#" MasterPageFile="~/Master/TwoColumn.master" AutoEventWireup="true" CodeBehind="QueryTimeOffDefault.aspx.cs" Inherits="Ede.Uof.Web.HR104.Duty.Report.QueryTimeOffDefault" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" %>

<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Ede" %>
<%@ Register Src="~/Common/Organization/UC_DeptManagerTree.ascx" TagPrefix="uc1" TagName="UC_DeptManagerTree" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ScriptContentPlaceHolder" runat="server">
    <script type="text/javascript"> 
        Sys.Application.add_load(RadioClick);

        function RadioClick() {
            var rbAskLeaveStart = $("#<%= rbAskLeaveStart.ClientID %>")
            var rdChangeEndDate = $("#<%= rdChangeEndDate.ClientID %>")
            var radLeaveDateStart = $find('<%=rdLeaveDateStart.ClientID %>');
            var radLeaveDateEnd = $find('<%=rdLeaveDateEnd.ClientID %>');
            var rdChangeStart = $find('<%=rdChangeStart.ClientID %>');
            var rdChangeEnd = $find('<%=rdChangeEnd.ClientID %>');
            
            if (rbAskLeaveStart.is(':checked')) {

                radLeaveDateStart.get_dateInput().enable();
                radLeaveDateEnd.get_dateInput().enable();
                radLeaveDateStart.set_enabled(true);
                radLeaveDateEnd.set_enabled(true);

                rdChangeStart.get_dateInput().disable();
                rdChangeEnd.get_dateInput().disable();
                rdChangeStart.set_enabled(false);
                rdChangeEnd.set_enabled(false);
            }
            else if (rdChangeEndDate.is(':checked')) {

                radLeaveDateStart.get_dateInput().disable();
                radLeaveDateEnd.get_dateInput().disable();
                radLeaveDateStart.set_enabled(false);
                radLeaveDateEnd.set_enabled(false);

                rdChangeStart.get_dateInput().enable();
                rdChangeEnd.get_dateInput().enable();
                rdChangeStart.set_enabled(true);
                rdChangeEnd.set_enabled(true);
            }
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ToolbarContentPlaceHolder" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="LeftContentPlaceHolder" runat="server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <uc1:UC_DeptManagerTree runat="server" ID="UC_DeptManagerTree" OnNodeOnClick="UC_DeptManagerTree_NodeOnClick" ShowDeptManagerTree="true" ShowDeptPersonalTree="true" ShowSuperiorTree="true" DisplayActiveControl="true"/>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="RightContentPlaceHolder" runat="server">
    <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <telerik:RadToolBar ID="RadToolBar1" runat="server" Width="100%" OnButtonClick="RadToolBar1_ButtonClick" SingleClick="None" meta:resourcekey="RadToolBar1Resource1">
                <Items>
                    <telerik:RadToolBarButton runat="server" Value="suDept" meta:resourcekey="RadToolBarButtonResource1">
                        <ItemTemplate>
                            <asp:CheckBox ID="cbSubDet" runat="server" Text="包含子部門" meta:resourcekey="cbSubDetResource1" />
                        </ItemTemplate>
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton IsSeparator="True" runat="server" meta:resourcekey="RadToolBarButtonResource2"></telerik:RadToolBarButton>
                    <telerik:RadToolBarButton runat="server" Text="查詢" Value="Search" CheckedImageUrl="~/Common/Images/Icon/icon_m39.gif"
                        DisabledImageUrl="~/Common/Images/Icon/icon_m39.gif" HoveredImageUrl="~/Common/Images/Icon/icon_m39.gif"
                        ImageUrl="~/Common/Images/Icon/icon_m39.gif" meta:resourcekey="RadToolBarButtonResource3">
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton IsSeparator="True" runat="server" meta:resourcekey="RadToolBarButtonResource4"></telerik:RadToolBarButton>
                </Items>
            </telerik:RadToolBar>
            <table class="PopTable" style="width: 100%">
                <tr>
                    <td>
                        <asp:Label ID="lblQuery" runat="server" Text="查詢區間" meta:resourcekey="lblQueryResource1"></asp:Label>
                    </td>
                    <td colspan="3">
                        <asp:RadioButton ID="rbAskLeaveStart" runat="server" Text="依加班時間(起)" Checked="True" GroupName="rdBtnDate" OnClick="RadioClick()" meta:resourcekey="rbAskLeaveStartResource1" />
                        <telerik:RadDatePicker ID="rdLeaveDateStart" runat="server" meta:resourcekey="rdLeaveDateStartResource1">
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
                        <telerik:RadDatePicker ID="rdLeaveDateEnd" runat="server"  meta:resourcekey="rdLeaveDateEndResource1">
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
                        <asp:RadioButton ID="rdChangeEndDate" runat="server" Text="依補休期限(訖)" GroupName="rdBtnDate" OnClick="RadioClick()" meta:resourcekey="rdChangeEndDateResource1" />
                        <telerik:RadDatePicker ID="rdChangeStart" runat="server"  meta:resourcekey="rdChangeStartResource1">
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
                        <asp:Label ID="Label1" runat="server" Text="~" meta:resourcekey="Label1Resource1"></asp:Label>
                        <telerik:RadDatePicker ID="rdChangeEnd" runat="server"  meta:resourcekey="rdChangeEndResource1">
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
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblemployee" runat="server" Text="人員" meta:resourcekey="lblemployeeResource1"></asp:Label>
                    </td>
                    <td style="width: 25%">
                        <asp:TextBox ID="txtUser" runat="server" meta:resourcekey="txtUserResource1" />
                    </td>
                    <td style="width: 10%">
                        <asp:Label ID="lblStatus" runat="server" Text="折抵狀態" meta:resourcekey="lblStatusResource1"></asp:Label>
                    </td>
                    <td style="width: 25%">
                        <asp:CheckBoxList ID="cblIsCount" runat="server" RepeatDirection="Horizontal" meta:resourcekey="cblIsCountResource1">
                            <asp:ListItem Text="未折抵" Value="0" Selected="True" meta:resourcekey="ListItemResource1"></asp:ListItem>
                            <asp:ListItem Text="部份折抵" Value="1" Selected="True" meta:resourcekey="ListItemResource2"></asp:ListItem>
                            <asp:ListItem Text="已折抵" Value="2" Selected="True" meta:resourcekey="ListItemResource3"></asp:ListItem>
                        </asp:CheckBoxList>
                    </td>
                </tr>
            </table>
            <Ede:Grid ID="grdLeave" Width="100%" AutoGenerateCheckBoxColumn="False" AutoGenerateColumns="False" OnAfterExport="grdLeave_AfterExport" OnBeforeExport="grdLeave_BeforeExport"
                OnPageIndexChanging="grdLeave_PageIndexChanging" OnRowDataBound="grdLeave_RowDataBound" OnSorting="grdLeave_Sorting" runat="server" DataKeyOnClientWithCheckBox="False"
                DefaultSortDirection="Ascending" EmptyDataText="沒有資料" KeepSelectedRows="False" AllowPaging="True" AllowSorting="True" PageSize="15" DefaultSortColumnName="EMPLOYEE_NO"
                CustomDropDownListPage="False" EnhancePager="True" meta:resourcekey="grdLeaveResource1" SelectedRowColor="" UnSelectedRowColor="">
                <EnhancePagerSettings ShowHeaderPager="True" FirstAltImageUrl="" FirstImageUrl="" LastAltImage="" LastImageUrl="" NextIAltImageUrl="" NextImageUrl="" PageInfoCssClass="" PageNumberCssClass="" PageNumberCurrentCssClass="" PageRedirectCssClass="" PreviousAltImageUrl="" PreviousImageUrl="" />
                <ExportExcelSettings AllowExportToExcel="True" />
                <Columns>
                    <asp:BoundField HeaderText="姓名" DataField="EMPLOYEE_CNAME" SortExpression="EMPLOYEE_CNAME" meta:resourcekey="BoundFieldResource1">
                        <HeaderStyle Wrap="False" />
                        <ItemStyle Wrap="False" />
                    </asp:BoundField>
                    <asp:BoundField HeaderText="員工編號" DataField="EMPLOYEE_NO" SortExpression="EMPLOYEE_NO" meta:resourcekey="BoundFieldResource2">
                        <HeaderStyle Wrap="False" />
                        <ItemStyle Wrap="False" />
                    </asp:BoundField>
                    <asp:BoundField HeaderText="申請部門" DataField="DEPARTMENT_CNAME" SortExpression="DEPARTMENT_CNAME" meta:resourcekey="BoundFieldResource3">
                        <HeaderStyle Wrap="False" />
                        <ItemStyle Wrap="False" />
                    </asp:BoundField>
                    <asp:BoundField HeaderText="加班時間(起)" DataField="ASK_LEAVE_START" SortExpression="ASK_LEAVE_START"  meta:resourcekey="BoundFieldResource4">
                        <HeaderStyle Wrap="False" />
                        <ItemStyle Wrap="False" />
                    </asp:BoundField>
                    <asp:BoundField HeaderText="加班時間(訖)" DataField="ASK_LEAVE_END" SortExpression="ASK_LEAVE_END"  meta:resourcekey="BoundFieldResource5">
                        <HeaderStyle Wrap="False" />
                        <ItemStyle Wrap="False" />
                    </asp:BoundField>
                    <asp:BoundField HeaderText="轉補休時數" DataField="CHANGE_HOURS" SortExpression="CHANGE_HOURS" DataFormatString="{0:N2}" meta:resourcekey="BoundFieldResource6">
                        <HeaderStyle Wrap="False" />
                        <ItemStyle Wrap="False" HorizontalAlign="Right" />
                    </asp:BoundField>
                    <asp:BoundField HeaderText="補休期限(起)" DataField="CHANGE_STARTDATE" SortExpression="CHANGE_STARTDATE" DataFormatString="{0:d}" meta:resourcekey="BoundFieldResource7">
                        <HeaderStyle Wrap="False" />
                        <ItemStyle Wrap="False" />
                    </asp:BoundField>
                    <asp:BoundField HeaderText="補休期限(訖)" DataField="CHANGE_ENDDATE" SortExpression="CHANGE_ENDDATE" DataFormatString="{0:d}" meta:resourcekey="BoundFieldResource8">
                        <HeaderStyle Wrap="False" />
                        <ItemStyle Wrap="False" />
                    </asp:BoundField>
                    <asp:BoundField HeaderText="折抵剩餘時數" DataField="CHANGE_REMAIN_HOURS" SortExpression="CHANGE_REMAIN_HOURS" DataFormatString="{0:N2}" meta:resourcekey="BoundFieldResource9">
                        <HeaderStyle Wrap="False" />
                        <ItemStyle Wrap="False" HorizontalAlign="Right" />
                    </asp:BoundField>
                    <asp:TemplateField HeaderText="折抵狀態" SortExpression="CHANGE_IS_COUNT" meta:resourcekey="TemplateFieldResource1">
                        <ItemTemplate>
                            <asp:Label ID="lblUnit" runat="server" meta:resourcekey="lblUnitResource1"></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle Wrap="False" />
                        <ItemStyle Wrap="False" HorizontalAlign="Left" />
                    </asp:TemplateField>
                </Columns>
            </Ede:Grid>
        </ContentTemplate>
    </asp:UpdatePanel>
    <asp:HiddenField ID="hfCurrentUser" runat="server" />
    <asp:HiddenField ID="hidIsExporting" runat="server" Value="N" />
    <asp:Label ID="lblTreeTitle" runat="server" Text="內部組織結構列表" Visible="False" meta:resourcekey="lblTreeTitleResource1"></asp:Label>
    <asp:Label ID="lblNoDiscount" runat="server" Text="未折抵" Visible="False" meta:resourcekey="lblNoDiscountResource1"></asp:Label>
    <asp:Label ID="lblPartDiscount" runat="server" Text="部分折抵" Visible="False" meta:resourcekey="lblPartDiscountResource1"></asp:Label>
    <asp:Label ID="lblAllDiscount" runat="server" Text="已折抵" Visible="False" meta:resourcekey="lblAllDiscountResource1"></asp:Label>
</asp:Content>
