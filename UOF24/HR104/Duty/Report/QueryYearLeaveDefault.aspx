<%@ Page Title="" Language="C#" MasterPageFile="~/Master/TwoColumn.master" AutoEventWireup="true" CodeBehind="QueryYearLeaveDefault.aspx.cs" Inherits="Ede.Uof.Web.HR104.Duty.Report.QueryYearLeaveDefault" Culture="auto" UICulture="auto" meta:resourcekey="PageResource1" %>

<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Ede" %>
<%@ Register Src="~/Common/Organization/UC_DeptManagerTree.ascx" TagPrefix="uc1" TagName="UC_DeptManagerTree" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ScriptContentPlaceHolder" runat="server">
    <script type="text/javascript">
        Sys.Application.add_load(RadioClick);

        function RadioClick() {
            var rbSpecialYear = $("#<%= rbSpecialYear.ClientID %>")
            var rbSpecialEnd = $("#<%= rbSpecialEnd.ClientID %>")
            var rbTranMax = $("#<%= rbTranMax.ClientID %>")
            var txtSpecialYear = $("#<%= txtSpecialYear.ClientID %>")
            var radLeaveDateStart = $find('<%=rdLeaveDateStart.ClientID %>');
            var radLeaveDateEnd = $find('<%=rdLeaveDateEnd.ClientID %>');
            var rdTranDateStart = $find('<%=rdTranDateStart.ClientID %>');
            var rdTranDateEnd = $find('<%=rdTranDateEnd.ClientID %>');

            if (rbSpecialYear.is(':checked')) {
                txtSpecialYear.prop("disabled", false);

                radLeaveDateStart.get_dateInput().disable();
                radLeaveDateEnd.get_dateInput().disable();
                radLeaveDateStart.set_enabled(false);
                radLeaveDateEnd.set_enabled(false);

                rdTranDateStart.get_dateInput().disable();
                rdTranDateEnd.get_dateInput().disable();
                rdTranDateStart.set_enabled(false);
                rdTranDateEnd.set_enabled(false);
            }
            else if (rbSpecialEnd.is(':checked')) {
                txtSpecialYear.prop("disabled", true);

                radLeaveDateStart.get_dateInput().enable();
                radLeaveDateEnd.get_dateInput().enable();
                radLeaveDateStart.set_enabled(true);
                radLeaveDateEnd.set_enabled(true);

                rdTranDateStart.get_dateInput().disable();
                rdTranDateEnd.get_dateInput().disable();
                rdTranDateStart.set_enabled(false);
                rdTranDateEnd.set_enabled(false);
            }
            else if (rbTranMax.is(":checked")){
                txtSpecialYear.prop("disabled", true);

                radLeaveDateStart.get_dateInput().disable();
                radLeaveDateEnd.get_dateInput().disable();
                radLeaveDateStart.set_enabled(false);
                radLeaveDateEnd.set_enabled(false);

                rdTranDateStart.get_dateInput().enable();
                rdTranDateEnd.get_dateInput().enable();
                rdTranDateStart.set_enabled(true);
                rdTranDateEnd.set_enabled(true);
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
                        <asp:RadioButton ID="rbSpecialYear" runat="server" Text="依特休年度" Checked="True" GroupName="rdBtnDate"  OnClick="RadioClick()" meta:resourcekey="rbSpecialYearResource1" />
                        <telerik:radnumerictextbox ID="txtSpecialYear" runat="server" DataType="System.Int32" Width="50px">
                            <EnabledStyle  HorizontalAlign="Left" />
                            <NumberFormat ZeroPattern="n" DecimalDigits="0" GroupSeparator="" ></NumberFormat>
                              <ClientEvents OnValueChanging="OnValueChanging"/>
                        </telerik:radnumerictextbox>
                        <br />
                        <asp:RadioButton ID="rbSpecialEnd" runat="server" Text="依可休截止日" GroupName="rdBtnDate" OnClick="RadioClick()" meta:resourcekey="rbSpecialEndResource1" />
                        <telerik:RadDatePicker ID="rdLeaveDateStart" runat="server"  meta:resourcekey="rdLeaveDateStartResource1">
                            <Calendar UseColumnHeadersAsSelectors="False" UseRowHeadersAsSelectors="False" EnableWeekends="True" FastNavigationNextText="&amp;lt;&amp;lt;" Culture="zh-TW" />
                            <DateInput LabelWidth="40%" DateFormat="yyyy/M/d" DisplayDateFormat="yyyy/M/d" Width="">
                                <ClientEvents OnValueChanging="OnValueChanging" />
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
                        <telerik:RadDatePicker ID="rdLeaveDateEnd" runat="server" meta:resourcekey="rdLeaveDateEndResource1">
                            <Calendar UseColumnHeadersAsSelectors="False" UseRowHeadersAsSelectors="False" Culture="zh-TW" EnableWeekends="True" FastNavigationNextText="&amp;lt;&amp;lt;" />
                            <DateInput LabelWidth="40%" DateFormat="yyyy/M/d" DisplayDateFormat="yyyy/M/d" Width="">
                                <ClientEvents OnValueChanging="OnValueChanging" />
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
                        <asp:RadioButton ID="rbTranMax" runat="server" Text="依結轉截止日" GroupName="rdBtnDate" OnClick="RadioClick()" meta:resourcekey="rbTranMaxResource1" />
                        <telerik:RadDatePicker ID="rdTranDateStart" runat="server" meta:resourcekey="rdTranDateStartResource1">
                            <Calendar UseColumnHeadersAsSelectors="False" UseRowHeadersAsSelectors="False" Culture="zh-TW" EnableWeekends="True" FastNavigationNextText="&amp;lt;&amp;lt;" />
                            <DateInput LabelWidth="40%" DateFormat="yyyy/M/d" DisplayDateFormat="yyyy/M/d" Width="">
                                <ClientEvents OnValueChanging="OnValueChanging" />
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
                        <telerik:RadDatePicker ID="rdTranDateEnd" runat="server" meta:resourcekey="rdTranDateEndResource1">
                            <Calendar UseColumnHeadersAsSelectors="False" UseRowHeadersAsSelectors="False" Culture="zh-TW" EnableWeekends="True" FastNavigationNextText="&amp;lt;&amp;lt;" />
                            <DateInput LabelWidth="40%" DateFormat="yyyy/M/d" DisplayDateFormat="yyyy/M/d" Width="">
                                <ClientEvents OnValueChanging="OnValueChanging" />
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
                        <asp:Label ID="lblemployee" runat="server" Text="人員" meta:resourcekey="lblemployeeResource1"></asp:Label>
                    </td>
                    <td style="width: 25%">
                        <asp:TextBox ID="txtUser" runat="server" meta:resourcekey="txtUserResource1" />
                    </td>
                    <td style="width: 10%">
                        <asp:Label ID="lblStatus" runat="server" Text="結清狀態" meta:resourcekey="lblStatusResource1"></asp:Label>
                    </td>
                    <td style="width: 25%">
                          <asp:CheckBoxList ID="cblIsCount" runat="server" RepeatDirection="Horizontal">
                             <asp:ListItem Text="是" Value="1" Selected="True" meta:resourcekey="ListItemResource2"></asp:ListItem>
                            <asp:ListItem Text="否" Value="0" Selected="True" meta:resourcekey="ListItemResource3"></asp:ListItem>
                        </asp:CheckBoxList>
                    </td>
                </tr>
            </table>
            <Ede:Grid ID="grdLeave" Width="100%" AutoGenerateCheckBoxColumn="False" AutoGenerateColumns="False" OnAfterExport="grdLeave_AfterExport" OnBeforeExport="grdLeave_BeforeExport"
                OnPageIndexChanging="grdLeave_PageIndexChanging" OnRowDataBound="grdLeave_RowDataBound" OnSorting="grdLeave_Sorting" runat="server" DataKeyOnClientWithCheckBox="False"
                DefaultSortDirection="Ascending" EmptyDataText="沒有資料" KeepSelectedRows="False" AllowPaging="True" AllowSorting="True" PageSize="15" DefaultSortColumnName="EMPLOYEE_NO"
                CustomDropDownListPage="False" EnhancePager="True" SelectedRowColor="" UnSelectedRowColor="" meta:resourcekey="grdLeaveResource1">
                <EnhancePagerSettings ShowHeaderPager="True" FirstAltImageUrl="" FirstImageUrl="" LastAltImage="" LastImageUrl="" NextIAltImageUrl="" NextImageUrl="" PageInfoCssClass="" PageNumberCssClass="" PageNumberCurrentCssClass="" PageRedirectCssClass="" PreviousAltImageUrl="" PreviousImageUrl="" />
                <ExportExcelSettings AllowExportToExcel="True" />
                <Columns>
                    <asp:BoundField HeaderText="姓名" DataField="EMPLOYEE_CNAME" SortExpression="EMPLOYEE_CNAME" meta:resourcekey="BoundFieldResource1" >
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
                    <asp:BoundField HeaderText="特休年度" DataField="EMPLOYEE_SPECIAL_YEAR" SortExpression="EMPLOYEE_SPECIAL_YEAR" meta:resourcekey="BoundFieldResource4">
                        <HeaderStyle Wrap="False" />
                        <ItemStyle Wrap="False" />
                    </asp:BoundField>
                    <asp:BoundField HeaderText="給假起始日" DataField="EMPLOYEE_SPECIAL_START" SortExpression="EMPLOYEE_SPECIAL_START" DataFormatString="{0:d}" meta:resourcekey="BoundFieldResource5">
                        <HeaderStyle Wrap="False" />
                        <ItemStyle Wrap="False" />
                    </asp:BoundField>
                    <asp:BoundField HeaderText="可休截止日" DataField="EMPLOYEE_SPECIAL_END" SortExpression="EMPLOYEE_SPECIAL_END" DataFormatString="{0:d}" meta:resourcekey="BoundFieldResource6">
                        <HeaderStyle Wrap="False" />
                        <ItemStyle Wrap="False" />
                    </asp:BoundField>
                    <asp:TemplateField HeaderText="單位" SortExpression="EMPLOYEE_SPECIAL_UNIT" meta:resourcekey="TemplateFieldResource1">
                        <ItemTemplate>
                            <asp:Label ID="lblUnit" runat="server" Text=""></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle Wrap="False" />
                        <ItemStyle Wrap="False" HorizontalAlign="Left" />
                    </asp:TemplateField>
                    <asp:BoundField HeaderText="本年度特休" DataField="EMPLOYEE_SPECIAL_VALUE" SortExpression="EMPLOYEE_SPECIAL_VALUE" DataFormatString="{0:N2}" meta:resourcekey="BoundFieldResource7">
                        <HeaderStyle Wrap="False" />
                        <ItemStyle Wrap="False" HorizontalAlign="Right" />
                    </asp:BoundField>
                    <asp:BoundField HeaderText="本年度剩餘" DataField="SPECIAL_REMAIN_HOURS" SortExpression="SPECIAL_REMAIN_HOURS" DataFormatString="{0:N2}" meta:resourcekey="BoundFieldResource8">
                        <HeaderStyle Wrap="False" />
                        <ItemStyle Wrap="False" HorizontalAlign="Right" />
                    </asp:BoundField>
                    <asp:BoundField HeaderText="上期結轉" DataField="EMPLOYEE_SPECIAL_TRAN_MAX" SortExpression="EMPLOYEE_SPECIAL_TRAN_MAX" DataFormatString="{0:N2}" meta:resourcekey="BoundFieldResource9">
                        <HeaderStyle Wrap="False" />
                        <ItemStyle Wrap="False" HorizontalAlign="Right" />
                    </asp:BoundField>
                    <asp:BoundField HeaderText="上期剩餘" DataField="EMPLOYEE_SPECIAL_TRAN" SortExpression="EMPLOYEE_SPECIAL_TRAN" DataFormatString="{0:N2}" meta:resourcekey="BoundFieldResource10">
                        <HeaderStyle Wrap="False" />
                        <ItemStyle Wrap="False" HorizontalAlign="Right" />
                    </asp:BoundField>
                    <asp:BoundField HeaderText="結轉截止日" DataField="EMPLOYEE_SPECIAL_TRAN_END" SortExpression="EMPLOYEE_SPECIAL_TRAN_END" DataFormatString="{0:d}" meta:resourcekey="BoundFieldResource11">
                        <HeaderStyle Wrap="False" />
                        <ItemStyle Wrap="False" />
                    </asp:BoundField>
                    <asp:TemplateField HeaderText="結清狀態" SortExpression="IS_CLEAR" meta:resourcekey="TemplateFieldResource2">
                        <ItemTemplate>
                            <asp:Label ID="lblStatus" runat="server" Text=""></asp:Label>
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
     <asp:Label ID="lblWorkDay" runat="server" Text="工作天" Visible="False" meta:resourcekey="lblWorkDayResource1"></asp:Label>
    <asp:Label ID="lblDay" runat="server" Text="天" Visible="False" meta:resourcekey="lblDayResource1"></asp:Label>
    <asp:Label ID="lblHour" runat="server" Text="小時" Visible="False" meta:resourcekey="lblHourResource1"></asp:Label>
    <asp:Label ID="lblMin" runat="server" Text="分" Visible="False" meta:resourcekey="lblMinResource1"></asp:Label>
    <asp:Label ID="lblYes" runat="server" Text="是" Visible="False" meta:resourcekey="lblYesResource1"></asp:Label>
    <asp:Label ID="lblNo" runat="server" Text="否" Visible="False" meta:resourcekey="lblNoResource1"></asp:Label>
</asp:Content>
