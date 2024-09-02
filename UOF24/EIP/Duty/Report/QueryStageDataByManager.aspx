<%@ Page Title="" Language="C#" MasterPageFile="~/Master/TwoColumn.master" AutoEventWireup="true" Inherits="EIP_Duty_Report_QueryStageDataByManager" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" Codebehind="QueryStageDataByManager.aspx.cs" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>
<%@ Register Assembly="System.Web, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a" Namespace="System.Web.UI" TagPrefix="cc1" %>
<%@ Register Src="../../../Common/Organization/UC_DeptManagerTree.ascx" TagName="UC_DeptManagerTree" TagPrefix="uc2" %>
<%@ Register Assembly="System.Web, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a" Namespace="System.Web.UI.HtmlControls" TagPrefix="cc2" %>
<%@ Register Src="~/EIP/Duty/Report/UC_StageLeaDetail.ascx" TagPrefix="uc2" TagName="UC_StageLeaDetail" %>
<%@ Register Src="~/EIP/Duty/Report/UC_StageOvtDetail.ascx" TagPrefix="uc2" TagName="UC_StageOvtDetail" %>
<%@ Register Src="~/EIP/Duty/Report/UC_StageTrvDetail.ascx" TagPrefix="uc2" TagName="UC_StageTrvDetail" %>
<%@ Register Src="~/EIP/Duty/Report/UC_StageLateMinsDetail.ascx" TagPrefix="uc2" TagName="UC_StageLateMinsDetail" %>
<%@ Register Src="~/EIP/Duty/Report/UC_StageAbsentDetail.ascx" TagPrefix="uc2" TagName="UC_StageAbsentDetail" %>
<%@ Register Src="~/EIP/Duty/Report/UC_StageForgetDetail.ascx" TagPrefix="uc2" TagName="UC_StageForgetDetail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ScriptContentPlaceHolder" runat="Server">
    <script type="text/javascript">
        function OnValueChanging(sender, args) {
            if (args.get_newValue() == "") {
                args.set_newValue(args.get_oldValue());
            }
        }

        Sys.Application.add_load(function () {
            var result = $uof.pageMethod.sync("IsAllowRole", []);
            if (result == 'false') {
                alert("<%=lblAllowRoleMsg.Text%>");
                window.location.href = '<%=ResolveUrl("~/Homepage.aspx")%>';
            }
        })        
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ToolbarContentPlaceHolder" runat="server"></asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="LeftContentPlaceHolder" runat="server">
    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
        <ContentTemplate>
            <uc2:UC_DeptManagerTree ID="dept_Tree" runat="server" ShowDeptManagerTree="True" ShowSuperiorTree="True" DisplayActiveControl="true"/>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="RightContentPlaceHolder" runat="server">
    <table border="0" cellpadding="0" cellspacing="0" style="width: 100%;">
        <tr>
            <td>
                <asp:UpdatePanel ID="UpdatePanel3" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>


                        <telerik:RadToolBar ID="RadToolBar1" runat="server" Width="100%" OnButtonClick="RadToolBar1_OnButtonClick" meta:resourcekey="RadToolBar1Resource1" SingleClick="None">
                            <Items>
                                <telerik:RadToolBarButton runat="server" Value="time" meta:resourcekey="RadToolBarButtonResource1">
                                    <ItemTemplate>
                                        <table id="Table1" style="width: 100%;" runat="server" cellpadding="0" cellspacing="0">
                                            <tr id="Tr1" runat="server">
                                                <td id="Td1" runat="server">&nbsp;
                                                </td>
                                                <td style="width: 30px;" runat="server">
                                                    <asp:Label ID="lblSETT" runat="server" Text="類別" meta:resourcekey="lblSETTResource1"></asp:Label>
                                                </td>
                                                <td runat="server">
                                                    <asp:DropDownList ID="ddlSETT" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlSETT_SelectedIndexChanged">
                                                    </asp:DropDownList>
                                                </td>
                                                <td style="width: 30px;" runat="server">
                                                    <asp:Label ID="lblYear" runat="server" Text="年度" meta:resourcekey="lblYearResource1"></asp:Label>
                                                </td>
                                                <td id="Td2" runat="server" style="width: 60px;">
                                                    <asp:DropDownList ID="ddlYear" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlYear_SelectedIndexChanged">
                                                    </asp:DropDownList>
                                                </td>
                                                <td style="width: 30px;" runat="server">
                                                    <asp:Label ID="Label1" runat="server" Text="期別" meta:resourcekey="Label1Resource1"></asp:Label>
                                                </td>
                                                <td id="Td3" runat="server" style="width: 40px;">
                                                    <asp:DropDownList ID="ddlStage" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlStage_SelectedIndexChanged">
                                                    </asp:DropDownList>
                                                </td>
                                                <td style="width: 20px;" runat="server">
                                                    <asp:Label ID="Label3" runat="server" Text="起" meta:resourcekey="Label3Resource1"></asp:Label>
                                                </td>
                                                <td id="Td4" runat="server">
                                                    <telerik:RadDatePicker runat="server" ID="rdStart">
                                                        <Calendar UseColumnHeadersAsSelectors="False" UseRowHeadersAsSelectors="False" EnableWeekends="True" Culture="zh-TW" FastNavigationNextText="&amp;lt;&amp;lt;">
                                                        </Calendar>
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
                                                        <DatePopupButton HoverImageUrl="" ImageUrl="" CssClass="" />
                                                    </telerik:RadDatePicker>
                                                </td>
                                                <td id="Td5" runat="server" style="width: 10px;">
                                                    <asp:Label ID="Label2" runat="server" Text="~"></asp:Label>
                                                </td>
                                                <td style="width: 20px;" runat="server">
                                                    <asp:Label ID="Label4" runat="server" Text="訖" meta:resourcekey="Label4Resource1"></asp:Label>
                                                </td>
                                                <td id="Td6" runat="server">
                                                    <telerik:RadDatePicker runat="server" ID="rdEnd">
                                                        <Calendar UseColumnHeadersAsSelectors="False" UseRowHeadersAsSelectors="False" EnableWeekends="True" Culture="zh-TW" FastNavigationNextText="&amp;lt;&amp;lt;">
                                                        </Calendar>
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
                                                        <DatePopupButton HoverImageUrl="" ImageUrl="" CssClass="" />
                                                    </telerik:RadDatePicker>
                                                </td>
                                            </tr>
                                        </table>
                                    </ItemTemplate>
                                </telerik:RadToolBarButton>
                                <telerik:RadToolBarButton IsSeparator="True" runat="server" meta:resourcekey="RadToolBarButtonResource2"></telerik:RadToolBarButton>
                                <telerik:RadToolBarButton runat="server" Value="subDept" meta:resourcekey="RadToolBarButtonResource3">
                                    <ItemTemplate>
                                        <asp:CheckBox ID="cbxDept" runat="server" Text="包含子部門" meta:resourcekey="cbxDeptResource1" />
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
                                <telerik:RadToolBarButton runat="server" Text="匯出" Value="ExportAll"
                                    CheckedImageUrl="~/Common/Images/Icon/icon_m144.gif"
                                    DisabledImageUrl="~/Common/Images/Icon/icon_m144.gif"
                                    HoveredImageUrl="~/Common/Images/Icon/icon_m144.gif"
                                    ImageUrl="~/Common/Images/Icon/icon_m144.gif" meta:resourcekey="RadToolBarButtonResource6">
                                </telerik:RadToolBarButton>
                                <telerik:RadToolBarButton IsSeparator="True" runat="server" meta:resourcekey="RadToolBarButtonResource7"></telerik:RadToolBarButton>
                            </Items>
                        </telerik:RadToolBar>
                        <asp:CustomValidator ID="CustomValidator1" runat="server" ForeColor="Red" ErrorMessage="起的時間不可晚於訖的時間" Display="Dynamic" meta:resourcekey="CustomValidator1Resource1"></asp:CustomValidator>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </td>
        </tr>
        <tr>
            <td>
                <telerik:RadTabStrip ID="StageTabStrip" runat="server" SelectedIndex="0" MultiPageID="StageMultiPage" meta:resourcekey="StageTabStripResource1">
                    <Tabs>
                        <telerik:RadTab runat="server" Value="tabsum" PageViewID="PageViewSum" Text="統計" Selected="True" meta:resourcekey="RadTabResource1" />
                        <telerik:RadTab runat="server" Value="tablea" PageViewID="PageViewLea" Text="請假明細" meta:resourcekey="RadTabResource2" />
                        <telerik:RadTab runat="server" Value="tabovt" PageViewID="PageViewOvt" Text="加班明細" meta:resourcekey="RadTabResource3" />
                        <telerik:RadTab runat="server" Value="tabtrv" PageViewID="PageViewTrv" Text="出差明細" meta:resourcekey="RadTabResource4" />
                        <telerik:RadTab runat="server" Value="tablate" PageViewID="PageViewLate" Text="遲到明細" meta:resourcekey="RadTabResource5" />
                        <telerik:RadTab runat="server" Value="tabforget" PageViewID="PageViewForget" Text="忘刷卡明細" meta:resourcekey="RadTabResource6" />
                        <telerik:RadTab runat="server" Value="tababsent" PageViewID="PageViewAbsent" Text="曠職明細" meta:resourcekey="RadTabResource7" />
                    </Tabs>
                </telerik:RadTabStrip>
                <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <telerik:RadMultiPage ID="StageMultiPage" runat="server" SelectedIndex="0" meta:resourcekey="StageMultiPageResource1">

                            <telerik:RadPageView ID="PageViewSum" runat="server" meta:resourcekey="PageViewSumResource1" Selected="True">


                                <Fast:Grid ID="DutyGrid" runat="server" AllowPaging="True" AllowSorting="True"
                                    AutoGenerateCheckBoxColumn="False"
                                    DataKeyOnClientWithCheckBox="False" DefaultSortDirection="Ascending" DefaultSortColumnName="ACCOUNT"
                                    EmptyDataText="沒有資料" EnhancePager="True"
                                    meta:resourcekey="gridItemResource1" PageSize="15"
                                    Width="100%" KeepSelectedRows="False"
                                    AutoGenerateColumns="False" OnRowDataBound="DutyGrid_RowDataBound"
                                    OnPageIndexChanging="DutyGrid_PageIndexChanging"
                                    OnBeforeExport="DutyGrid_BeforeExport" OnSorting="DutyGrid_Sorting" CustomDropDownListPage="False" SelectedRowColor="" UnSelectedRowColor=""   >
                                    <EnhancePagerSettings ShowHeaderPager="True" FirstAltImageUrl="" FirstImageUrl="" LastAltImage="" LastImageUrl="" NextIAltImageUrl="" NextImageUrl="" PageInfoCssClass="" PageNumberCssClass="" PageNumberCurrentCssClass="" PageRedirectCssClass="" PreviousAltImageUrl="" PreviousImageUrl="" />
                                    <ExportExcelSettings AllowExportToExcel="True" DataSourceType="ObjectDataSource" />
                                    <Columns>
                                        <asp:TemplateField HeaderText="帳號" SortExpression="ACCOUNT"
                                            meta:resourcekey="TemplateFieldResource3">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="lblAccount" runat="server" Text='<%# Bind("ACCOUNT") %>'
                                                    meta:resourcekey="lblAccountResource1"></asp:LinkButton>
                                            </ItemTemplate>
                                            <HeaderStyle Wrap="False" />
                                            <ItemStyle Wrap="False" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="姓名" SortExpression="NAME"
                                            meta:resourcekey="TemplateFieldResource1">
                                            <ItemTemplate>
                                                <asp:Label ID="lbtnlink" runat="server" Text='<%#: Bind("NAME") %>'
                                                    meta:resourcekey="lbtnlinkResource1"></asp:Label>
                                            </ItemTemplate>
                                            <HeaderStyle Wrap="False" />
                                            <ItemStyle Wrap="False" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="員工編號" SortExpression="EMPLOYEE_NO" meta:resourcekey="TemplateFieldEMOResource1">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="lbtnempnolink" runat="server" Text='<%# Bind("EMPLOYEE_NO") %>' meta:resourcekey="lbtnempnolinkResource1"></asp:LinkButton>
                                            </ItemTemplate>
                                            <HeaderStyle Wrap="False" />
                                            <ItemStyle Wrap="False" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="部門名稱" SortExpression="GROUP_NAME"
                                            meta:resourcekey="TemplateFieldResource2">
                                            <ItemTemplate>
                                                <asp:Label ID="lblDeptName" runat="server" Text='<%#: Bind("GROUP_NAME") %>'
                                                    meta:resourcekey="lblDeptNameResource1"></asp:Label>
                                            </ItemTemplate>
                                            <HeaderStyle Wrap="False" />
                                            <ItemStyle Wrap="False" />
                                        </asp:TemplateField>
                                    </Columns>
                                </Fast:Grid>
                            </telerik:RadPageView>
                            <telerik:RadPageView ID="PageViewLea" runat="server" meta:resourcekey="PageViewLeaResource1">
                                <uc2:UC_StageLeaDetail runat="server" ID="UC_StageLeaDetail" />
                            </telerik:RadPageView>
                            <telerik:RadPageView ID="PageViewOvt" runat="server" meta:resourcekey="PageViewOvtResource1">
                                <uc2:UC_StageOvtDetail runat="server" ID="UC_StageOvtDetail" />
                            </telerik:RadPageView>
                            <telerik:RadPageView ID="PageViewTrv" runat="server" meta:resourcekey="PageViewTrvResource1">
                                <uc2:UC_StageTrvDetail runat="server" ID="UC_StageTrvDetail" />
                            </telerik:RadPageView>
                            <telerik:RadPageView ID="PageViewLate" runat="server" meta:resourcekey="PageViewLateResource1">
                                <uc2:UC_StageLateMinsDetail runat="server" ID="UC_StageLateMinsDetail" />
                            </telerik:RadPageView>
                            <telerik:RadPageView ID="PageViewForget" runat="server" meta:resourcekey="PageViewForgetResource1">
                                <uc2:UC_StageForgetDetail runat="server" ID="UC_StageForgetDetail" />
                            </telerik:RadPageView>
                            <telerik:RadPageView ID="PageViewAbsent" runat="server" meta:resourcekey="PageViewAbsentResource1">
                                <uc2:UC_StageAbsentDetail runat="server" ID="UC_StageAbsentDetail" />
                            </telerik:RadPageView>

                        </telerik:RadMultiPage>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </td>
        </tr>
    </table>
    <asp:Label ID="lblDayCount" runat="server" Text="日數" Visible="False" meta:resourcekey="lblDayCountResource1"></asp:Label>
    <asp:Label ID="lblHrCount" runat="server" Text="時數" Visible="False" meta:resourcekey="lblHrCountResource1"></asp:Label>
    <asp:Label ID="lblUserName" runat="server" Text="姓名" Visible="False" meta:resourcekey="lblUserNameResource1"></asp:Label>
    <asp:Label ID="lblDeptName" runat="server" Text="部門名稱" Visible="False" meta:resourcekey="lblDeptNameResource2"></asp:Label>
    <asp:Label ID="lblAccountName" runat="server" Text="帳號" Visible="False" meta:resourcekey="lblAccountNameResource1"></asp:Label>
    <asp:Label ID="lblEmpNO" runat="server" Text="員工編號" Visible="False" meta:resourcekey="lblEmpNOResource1"></asp:Label>
    <asp:Label ID="lblLate" runat="server" Text="遲到次數" Visible="False" meta:resourcekey="lblLateResource1"></asp:Label>
    <asp:Label ID="lblAbsent" runat="server" Text="曠職時數" Visible="False" meta:resourcekey="lblAbsentResource1"></asp:Label>
    <asp:Label ID="lblOvertime" runat="server" Text="加班轉費用時數" Visible="False" meta:resourcekey="lblOvertimeResource1"></asp:Label>
    <asp:Label ID="lblOvertimeT" runat="server" Text="加班轉補休時數" Visible="False" meta:resourcekey="lblOverTimeTResource1"></asp:Label>
    <asp:Label ID="lblTravel" runat="server" Text="出差時數" Visible="False" meta:resourcekey="lblTravelResource1"></asp:Label>
    <asp:Label ID="Label7" runat="server" Text="內部組織結構列表" Visible="False" meta:resourcekey="Label7Resource1"></asp:Label>
    <asp:Label ID="lblLateMins" runat="server" Text="遲到分鐘數" Visible="False" meta:resourcekey="lblLateMinsResource1"></asp:Label>
    <asp:Label ID="lblForget" runat="server" Text="忘刷卡次數" Visible="False" meta:resourcekey="lblForgetResource1"></asp:Label>
    <asp:Label ID="lblHOvertime" runat="server" Text="休息日加班時數" Visible="False" meta:resourcekey="lblHOvertimeResource1"></asp:Label>
    <asp:Label ID="lblWOvertime" runat="server" Text="工作日加班時數" Visible="False" meta:resourcekey="lblWOvertimeResource1"></asp:Label>
    <asp:Label ID="lblROvertime" runat="server" Text="例假日加班時數" Visible="False" meta:resourcekey="lblROvertimeResource1"></asp:Label>
    <asp:Label ID="lblOOvertime" runat="server" Text="國定假日加班時數" Visible="False" meta:resourcekey="lblOOvertimeResource1"></asp:Label>
    <asp:Label ID="lblExpWork" runat="server" Text="應出勤時數" Visible="False" meta:resourcekey="lblExpWorkResource1"></asp:Label>
    <asp:Label ID="lblPunWork" runat="server" Text="刷卡出勤時數" Visible="False" meta:resourcekey="lblPunWorkResource1"></asp:Label>


    <asp:Label ID="lblHour" runat="server" Text="時" Visible="False" meta:resourcekey="lblHourResource1"></asp:Label>
    <asp:Label ID="lblDay" runat="server" Text="天" Visible="False" meta:resourcekey="lblDayResource1"></asp:Label>
    <asp:Label ID="lblExport0" runat="server" Text="統計" Visible="False" meta:resourcekey="lblExport0Resource1"></asp:Label>
    <asp:Label ID="lblExport1" runat="server" Text="請假明細" Visible="False" meta:resourcekey="lblExport1Resource1"></asp:Label>
    <asp:Label ID="lblExport2" runat="server" Text="加班明細" Visible="False" meta:resourcekey="lblExport2Resource1"></asp:Label>
    <asp:Label ID="lblExport3" runat="server" Text="出差明細" Visible="False" meta:resourcekey="lblExport3Resource1"></asp:Label>
    <asp:Label ID="lblExport4" runat="server" Text="遲到明細" Visible="False" meta:resourcekey="lblExport4Resource1"></asp:Label>
    <asp:Label ID="lblExport5" runat="server" Text="忘刷卡明細" Visible="False" meta:resourcekey="lblExport5Resource1"></asp:Label>
    <asp:Label ID="lblExport6" runat="server" Text="曠職明細" Visible="False" meta:resourcekey="lblExport6Resource1"></asp:Label>
    <asp:Label ID="lblAllowRoleMsg" runat="server" Text="需有差勤管理者、部門管理員或部門主管權限才可觀看" Visible="False" meta:resourcekey="lblAllowRoleMsgResource1"></asp:Label>
</asp:Content>

