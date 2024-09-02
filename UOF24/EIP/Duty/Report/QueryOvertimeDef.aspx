<%@ Page Title="" Language="C#" MasterPageFile="~/Master/TwoColumn.master" AutoEventWireup="true" Inherits="EIP_Duty_Report_QueryOvertimeDef" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" Codebehind="QueryOvertimeDef.aspx.cs" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>
<%@ Register Src="../../../Common/Organization/UC_DeptManagerTree.ascx" TagName="UC_DeptManagerTree" TagPrefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ScriptContentPlaceHolder" runat="Server">
    <script type="text/javascript">
        function OnValueChanging(sender, args) {
            if (args.get_newValue() == "") {
                args.set_newValue(args.get_oldValue());
            }
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ToolbarContentPlaceHolder" runat="server"></asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="LeftContentPlaceHolder" runat="server">
    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
        <ContentTemplate>
            <uc1:UC_DeptManagerTree ID="UC_DeptManagerTree1" runat="server" ShowDeptManagerTree="True" ShowDeptPersonalTree="True" ShowSuperiorTree="True" DisplayActiveControl="true"/>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="RightContentPlaceHolder" runat="server">
    <telerik:RadToolBar ID="RadToolBar1" runat="server" Width="100%" OnButtonClick="RadToolBar1_OnButtonClick">
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
        </Items>
    </telerik:RadToolBar>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <table class="PopTable" style="width: 100%">
                <tr>
                    <td style="width: 20%">
                        <asp:Label ID="Label5" runat="server" Text="加班日期(起)"
                            meta:resourcekey="Label5Resource1"></asp:Label>
                    </td>
                    <td style="width: 30%">
                        <telerik:RadDatePicker ID="rdOverDateStart" runat="server">
                            <Calendar UseColumnHeadersAsSelectors="False" UseRowHeadersAsSelectors="False" runat="server">
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
                            <DateInput LabelWidth="40%" ClientEvents-OnValueChanging="OnValueChanging" runat="server">
                            </DateInput>
                        </telerik:RadDatePicker>
                    </td>
                    <td style="width: 20%">
                        <asp:Label ID="Label7" runat="server" Text="加班日期(訖)"
                            meta:resourcekey="Label7Resource1"></asp:Label>
                    </td>
                    <td style="width: 30%">
                        <telerik:RadDatePicker ID="rdOverDateEnd" runat="server">
                            <Calendar UseColumnHeadersAsSelectors="False" UseRowHeadersAsSelectors="False" runat="server">
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
                            <DateInput LabelWidth="40%" ClientEvents-OnValueChanging="OnValueChanging" runat="server">
                            </DateInput>
                        </telerik:RadDatePicker>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label6" runat="server" Text="人員"
                            meta:resourcekey="Label6Resource1"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtUser" runat="server" meta:resourcekey="txtUserResource1"></asp:TextBox>
                    </td>
                    <td>
                        <asp:Label ID="Label8" runat="server" Text="單據狀態"
                            meta:resourcekey="Label8Resource1"></asp:Label>
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlByState" runat="server"
                            meta:resourcekey="ddlByStateResource1">
                            <asp:ListItem Value="0" meta:resourcekey="ListItemResource1">所有狀態</asp:ListItem>
                            <asp:ListItem Value="1" meta:resourcekey="ListItemResource2">簽核中</asp:ListItem>
                            <asp:ListItem Value="2" meta:resourcekey="ListItemResource3">通過</asp:ListItem>
                            <asp:ListItem Value="3" meta:resourcekey="ListItemResource4">否決</asp:ListItem>
                            <asp:ListItem Value="4" meta:resourcekey="ListItemResource5">作廢</asp:ListItem>
                            <asp:ListItem Value="5" meta:resourcekey="ListItemResource6">銷單中</asp:ListItem>
                            <asp:ListItem Value="6" meta:resourcekey="ListItemResource7">已銷單</asp:ListItem>
                            <asp:ListItem Value="-1" meta:resourcekey="ListItemResource8">異常</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>

            </table>
            <div style="margin-top: 2px;">
                <Fast:Grid ID="grdLeave" runat="server" AutoGenerateCheckBoxColumn="False"
                    AutoGenerateColumns="False" AllowPaging="True"
                    DataKeyNames="APPLICANT,DOC_NBR,APPLICANT_GROUP_ID,TASK_ID" AllowSorting="True"
                    DataKeyOnClientWithCheckBox="False"
                    DefaultSortDirection="Ascending" DefaultSortColumnName="APPLICANT_ACCOUNT" EmptyDataText="沒有資料" EnhancePager="True" KeepSelectedRows="False"
                    PageSize="15"
                    OnPageIndexChanging="grdLeave_PageIndexChanging"
                    OnRowDataBound="grdLeave_RowDataBound" OnSorting="grdLeave_Sorting"
                    OnBeforeExport="grdLeave_BeforeExport" Width="100%" OnAfterExport="grdLeave_AfterExport"
                    meta:resourcekey="grdLeaveResource1"  CustomDropDownListPage="False" SelectedRowColor="" UnSelectedRowColor=""  >
                    <EnhancePagerSettings ShowHeaderPager="True" />
                    <ExportExcelSettings AllowExportToExcel="True" />
                    <Columns>
                        <asp:BoundField DataField="APPLICANT_ACCOUNT" HeaderText="帳號" AccessibleHeaderText="APPLICANT_ACCOUNT"
                            SortExpression="APPLICANT_ACCOUNT" meta:resourcekey="BoundFieldResource0" HeaderStyle-Wrap="false" >
                        <HeaderStyle Wrap="False" />
                        </asp:BoundField>
                        <asp:TemplateField HeaderText="姓名" meta:resourcekey="BoundFieldResource1" >
                           <ItemTemplate>
                             <asp:Label ID="lblName" runat="server" meta:resourcekey="lblNameResource1"></asp:Label>
                           </ItemTemplate>
                           <HeaderStyle Wrap="False" />
                           <ItemStyle Wrap="False" />
                        </asp:TemplateField>
                        <asp:BoundField DataField="EMPLOYEE_NO" HeaderText="員工編號" SortExpression="EMPLOYEE_NO" AccessibleHeaderText="EMPLOYEE_NO" meta:resourcekey="BoundFieldEMPNOResource1" HeaderStyle-Wrap="false" >
                        <HeaderStyle Wrap="False" />
                        </asp:BoundField>
                        <asp:BoundField DataField="APPLICANT_GROUP_ID_NAME" HeaderText="申請部門" AccessibleHeaderText="APPLICANT_GROUP_ID_NAME"
                            SortExpression="APPLICANT_GROUP_ID_NAME"
                            meta:resourcekey="BoundFieldResource2" HeaderStyle-Wrap="false" >
                        <HeaderStyle Wrap="False" />
                        </asp:BoundField>
                        <asp:TemplateField HeaderText="申請時間" SortExpression="APPLY_DATE" meta:resourcekey="ApplyDateResource1">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox3" runat="server" Text='<%#: Bind("APPLY_DATE") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblApplyDate" runat="server" Text='<%#: Bind("APPLY_DATE") %>'></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle Wrap="false" />
                            <ItemStyle Wrap="False" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="加班單號" SortExpression="DOC_NBR"
                            meta:resourcekey="TemplateFieldResource1">
                            <ItemTemplate>
                                <asp:LinkButton ID="lbtnDocNbr" runat="server" Text='<%#: Eval("DOC_NBR") %>'
                                    meta:resourcekey="lbtnDocNbrResource1"></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField AccessibleHeaderText="EXPECTED_START_TIME" HeaderText="預計加班開始時間" SortExpression="EXPECTED_START_TIME" meta:resourcekey="BoundFieldResource3">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%#: Bind("EXPECTED_START_TIME") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblExpStartDate" runat="server" Text='<%#: Bind("EXPECTED_START_TIME") %>'></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle Wrap="False" />
                            <ItemStyle Wrap="False"  />
                        </asp:TemplateField>
                        <asp:TemplateField AccessibleHeaderText="EXPECTED_END_TIME" HeaderText="預計加班結束時間" SortExpression="EXPECTED_END_TIME" meta:resourcekey="BoundFieldResource4">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox2" runat="server" Text='<%#: Bind("EXPECTED_END_TIME") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblExpEndDate" runat="server" Text='<%#: Bind("EXPECTED_END_TIME") %>'></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle Wrap="False" />
                            <ItemStyle Wrap="False"  />
                        </asp:TemplateField>
                        <asp:BoundField DataField="EXPECTED_HOURS_SHOW" HeaderText="預計加班時數"
                            AccessibleHeaderText="EXPECTED_HOURS_SHOW"
                            meta:resourcekey="BoundFieldResource8" NullDisplayText="0.0"
                            SortExpression="EXPECTED_HOURS_SHOW" HeaderStyle-Wrap="false">

                            <HeaderStyle Wrap="False" />

                            <ItemStyle HorizontalAlign="Right" />
                        </asp:BoundField>

                        <asp:TemplateField AccessibleHeaderText="ACTUAL_START_TIME" HeaderText="實際加班開始時間" SortExpression="ACTUAL_START_TIME" meta:resourcekey="BoundFieldResource5">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox3" runat="server" Text='<%#: Bind("ACTUAL_START_TIME") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblActStartDate" runat="server" Text='<%#: Bind("ACTUAL_START_TIME") %>'></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle Wrap="False" />
                            <ItemStyle Wrap="False"  />
                        </asp:TemplateField>
                        <asp:TemplateField AccessibleHeaderText="ACTUAL_END_TIME" HeaderText="實際加班結束時間" SortExpression="ACTUAL_END_TIME" meta:resourcekey="BoundFieldResource6">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox4" runat="server" Text='<%#: Bind("ACTUAL_END_TIME") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblActEndDate" runat="server" Text='<%#: Bind("ACTUAL_END_TIME") %>'></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle Wrap="False" />
                            <ItemStyle Wrap="False"  />
                        </asp:TemplateField>
                        <asp:BoundField DataField="ACTUAL_WORK_HOURS_SHOW" HeaderText="實際加班時數"
                            AccessibleHeaderText="ACTUAL_WORK_HOURS_SHOW"
                            meta:resourcekey="BoundFieldResource9" NullDisplayText="0.0"
                            SortExpression="ACTUAL_WORK_HOURS_SHOW">
                            <ItemStyle HorizontalAlign="Right" />
                            <HeaderStyle Wrap="false" />
                        </asp:BoundField>
                        <asp:BoundField DataField="ACTUAL_HOURS_SHOW" HeaderText="核銷時數"
                            AccessibleHeaderText="ACTUAL_HOURS_SHOW"
                            meta:resourcekey="BoundFieldResource17" NullDisplayText="0.0"
                            SortExpression="ACTUAL_HOURS_SHOW">
                            <ItemStyle HorizontalAlign="Right" />
                            <HeaderStyle Wrap="false" />
                        </asp:BoundField>
                            <asp:TemplateField HeaderText="歸屬日期" meta:resourcekey="BELONG_DATEResource1" SortExpression="BELONG_DATE">
                                <ItemTemplate>
                                    <asp:Label ID="lblBelongDate" runat="server"></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle Wrap="False" />
                                <ItemStyle Wrap="False" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="給付方式" meta:resourcekey="OT_TYPEResource1" SortExpression="OT_TYPE" ItemStyle-HorizontalAlign="Center"  >
                                <ItemTemplate>
                                    <asp:Label ID="lblOTTYPE" runat="server"></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle Wrap="False" />
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="加班類型" meta:resourcekey="HOLIDAYResource1" SortExpression="HOLIDAY" ItemStyle-HorizontalAlign="Center"  >
                                <ItemTemplate>
                                    <asp:Label ID="lblHOLIDAY" runat="server"></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle Wrap="False" />
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:TemplateField>

                        <asp:TemplateField HeaderText="事由" meta:resourcekey="TemplateFieldResource2">
                            <ItemTemplate>
                                <asp:Label ID="lblRemark" runat="server"></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle Wrap="False" />
                        </asp:TemplateField>
                        <asp:BoundField DataField="STATUS" HeaderText="狀態" SortExpression="STATUS"
                            AccessibleHeaderText="STATUS" meta:resourcekey="BoundFieldResource7" HeaderStyle-Wrap="false" >
                        <HeaderStyle Wrap="False" />
                        <ItemStyle Wrap="False" />
                        </asp:BoundField>
                        <asp:BoundField DataField="APPLICANT" HeaderText="APPLICANT"
                            AccessibleHeaderText="APPLICANT" InsertVisible="False"
                            meta:resourcekey="BoundFieldResource10" />



                        <asp:BoundField DataField="APPLICANT_GROUP_ID" HeaderText="APPLICANT_GROUP_ID" AccessibleHeaderText="APPLICANT_GROUP_ID"
                            Visible="False" meta:resourcekey="BoundFieldResource11" />
                        <asp:BoundField DataField="REMARK" HeaderText="REMARK" Visible="False"
                            AccessibleHeaderText="REMARK" meta:resourcekey="BoundFieldResource12" />
                        <asp:BoundField DataField="CANCEL_TASK_ID" HeaderText="CANCEL_TASK_ID" AccessibleHeaderText="CANCEL_TASK_ID"
                            Visible="False" meta:resourcekey="BoundFieldResource13" />
                        <asp:BoundField DataField="CANCEL_DOC_NBR" HeaderText="CANCEL_DOC_NBR" AccessibleHeaderText="CANCEL_DOC_NBR"
                            Visible="False" meta:resourcekey="BoundFieldResource14" />
                        <asp:BoundField DataField="APPLY_DATE" HeaderText="APPLY_DATE" AccessibleHeaderText="APPLY_DATE"
                            Visible="False" meta:resourcekey="BoundFieldResource15" />
                        <asp:BoundField DataField="TASK_ID" HeaderText="TASK_ID"
                            AccessibleHeaderText="TASK_ID" meta:resourcekey="BoundFieldResource16" />
                    </Columns>
                </Fast:Grid>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
    <asp:Label ID="Label1" runat="server" meta:resourcekey="Label1Resource1" Text="內部組織結構列表" Visible="false"></asp:Label>
    <asp:Label ID="lblDialogTitle" runat="server" Text="加班單查詢-加班單資訊" Style="display: none" meta:resourcekey="lblDialogTitleResource1"></asp:Label>
    <asp:HiddenField ID="hidIsExporting" runat="server" Value="N"></asp:HiddenField>
    <asp:HiddenField ID="hfCurrentUser" runat="server" />
    <asp:Label ID="lblWorkDay" runat="server" Text="工作日" Visible="False" meta:resourcekey="lblWorkDayResource1"></asp:Label>
    <asp:Label ID="lblDayoff" runat="server" Text="休息日" Visible="False" meta:resourcekey="lblDayoffResource1"></asp:Label>
    <asp:Label ID="lblRoutine" runat="server" Text="例假日" Visible="False" meta:resourcekey="lblRoutineResource1"></asp:Label>
    <asp:Label ID="lblOrgHoliday" runat="server" Text="國定假日" Visible="False" meta:resourcekey="lblOrgHolidayResource1"></asp:Label>
    <asp:Label ID="lblOverTime" runat="server" Text="轉費用" Visible="False" meta:resourcekey="lblOverTimeResource1"></asp:Label>
    <asp:Label ID="lblOverTimeT" runat="server" Text="轉補休" Visible="False" meta:resourcekey="lblOverTimeTResource1"></asp:Label>
    <asp:Label ID="lblOverTimeB" runat="server" Text="轉補休及費用" Visible="False" meta:resourcekey="lblOverTimeBResource1"></asp:Label>
</asp:Content>

