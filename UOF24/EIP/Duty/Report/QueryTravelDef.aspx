<%@ Page Title="" Language="C#" MasterPageFile="~/Master/TwoColumn.master" AutoEventWireup="true" Inherits="EIP_Duty_Report_QueryTravelDef" Culture="auto" UICulture="auto" meta:resourcekey="PageResource1" Codebehind="QueryTravelDef.aspx.cs" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register Src="../../../Common/Organization/UC_DeptManagerTree.ascx" TagName="UC_DeptManagerTree" TagPrefix="uc1" %>
<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>
<%@ Register Assembly="System.Web, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a" Namespace="System.Web.UI" TagPrefix="cc1" %>

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
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <uc1:UC_DeptManagerTree ID="UC_DeptManagerTree1" runat="server" ShowDeptManagerTree="True" ShowDeptPersonalTree="True" ShowSuperiorTree="True" DisplayActiveControl="true"/>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="RightContentPlaceHolder" runat="server">
    <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <telerik:RadToolBar ID="RadToolBar1" runat="server" Width="100%" OnButtonClick="RadToolBar1_OnButtonClick" meta:resourcekey="RadToolBar1Resource1" SingleClick="None">
                <Items>
                    <telerik:RadToolBarButton runat="server" Value="subDept" meta:resourcekey="RadToolBarButtonResource1">
                        <ItemTemplate>
                            <asp:CheckBox ID="cbSubDept" runat="server" Text="包含子部門" meta:resourcekey="cbSubDeptResource1" />
                        </ItemTemplate>
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton IsSeparator="True" runat="server" meta:resourcekey="RadToolBarButtonResource2">
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton runat="server" Text="查詢" Value="Serach" CheckedImageUrl="~/Common/Images/Icon/icon_m39.gif"
                        DisabledImageUrl="~/Common/Images/Icon/icon_m39.gif" HoveredImageUrl="~/Common/Images/Icon/icon_m39.gif"
                        ImageUrl="~/Common/Images/Icon/icon_m39.gif" meta:resourcekey="RadToolBarSerachResource1">
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton IsSeparator="True" runat="server" meta:resourcekey="RadToolBarButtonResource3">
                    </telerik:RadToolBarButton>
                </Items>
            </telerik:RadToolBar>
            <asp:ValidationSummary ID="vsError" runat="server" ForeColor="Red" meta:resourcekey="vsErrorResource1" />
            <table class="PopTable" style="width: 100%">
                <tr>
                    <td style="width: 20%">
                        <asp:Label ID="Label5" runat="server" Text="出差日期(起)" meta:resourcekey="Label5Resource1"></asp:Label>
                    </td>
                    <td style="width: 30%">
                        <telerik:RadDatePicker ID="rdTravelDateStart" runat="server" meta:resourcekey="rdTravelDateStartResource1">
                            <Calendar UseColumnHeadersAsSelectors="False" UseRowHeadersAsSelectors="False" Culture="zh-TW" EnableWeekends="True" FastNavigationNextText="&amp;lt;&amp;lt;">
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
                            <DatePopupButton CssClass="" HoverImageUrl="" ImageUrl="" />
                        </telerik:RadDatePicker>
                    </td>
                    <td style="width: 20%">
                        <asp:Label ID="Label7" runat="server" Text="出差日期(訖)" meta:resourcekey="Label7Resource1"></asp:Label>
                    </td>
                    <td style="width: 30%">
                        <telerik:RadDatePicker ID="rdTravelDateEnd" runat="server"  meta:resourcekey="rdTravelDateEndResource1">
                            <Calendar UseColumnHeadersAsSelectors="False" UseRowHeadersAsSelectors="False" Culture="zh-TW" EnableWeekends="True" FastNavigationNextText="&amp;lt;&amp;lt;">
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
                            <DatePopupButton CssClass="" HoverImageUrl="" ImageUrl="" />
                        </telerik:RadDatePicker>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label6" runat="server" Text="人員" meta:resourcekey="Label6Resource1"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtUser" runat="server" meta:resourcekey="txtUserResource1"></asp:TextBox>
                    </td>
                    <td>
                        <asp:Label ID="Label8" runat="server" Text="單據狀態" meta:resourcekey="Label8Resource1"></asp:Label>
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlByState" runat="server" meta:resourcekey="ddlByStateResource1">
                            <asp:ListItem Value="0" Text="所有狀態" meta:resourcekey="ListItemResource1"></asp:ListItem>
                            <asp:ListItem Value="1" Text="簽核中" meta:resourcekey="ListItemResource2"></asp:ListItem>
                            <asp:ListItem Value="2" Text="通過" meta:resourcekey="ListItemResource3"></asp:ListItem>
                            <asp:ListItem Value="3" Text="否決" meta:resourcekey="ListItemResource4"></asp:ListItem>
                            <asp:ListItem Value="4" Text="作廢" meta:resourcekey="ListItemResource5"></asp:ListItem>
                            <asp:ListItem Value="5" Text="銷單中" meta:resourcekey="ListItemResource6"></asp:ListItem>
                            <asp:ListItem Value="6" Text="已銷單" meta:resourcekey="ListItemResource7"></asp:ListItem>
                            <asp:ListItem Value="-1" Text="異常" meta:resourcekey="ListItemResource8"></asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
            </table>
            <div style="margin-top: 2px;">
                <Fast:Grid ID="TravelGrid" runat="server" AutoGenerateCheckBoxColumn="False" Width="100%"
                    OnBeforeExport="TravelGrid_BeforeExport" OnAfterExport="TravelGrid_AfterExport" OnPageIndexChanging="TravelGrid_PageIndexChanging"
                    OnRowDataBound="TravelGrid_RowDataBound" OnSorting="TravelGrid_Sorting" AllowSorting="True"
                    AutoGenerateColumns="False" DataKeyOnClientWithCheckBox="False" DefaultSortDirection="Ascending"
                    EmptyDataText="沒有資料" EnhancePager="True"
                    KeepSelectedRows="False" PageSize="15" DefaultSortColumnName="APPLICANT_ACCOUNT"
                    AllowPaging="True" meta:resourcekey="TravelGridResource1"  CustomDropDownListPage="False" SelectedRowColor="" UnSelectedRowColor="">
                    <EnhancePagerSettings
                        ShowHeaderPager="True" />
                    <ExportExcelSettings AllowExportToExcel="True" />
                    <Columns>
                        <asp:BoundField DataField="APPLICANT_ACCOUNT" HeaderText="帳號" SortExpression="APPLICANT_ACCOUNT"
                            meta:resourcekey="BoundFieldResource1" />
                        <asp:TemplateField HeaderText="出差人員" meta:resourcekey="BoundFieldResource2" >
                           <ItemTemplate>
                             <asp:Label ID="lblName" runat="server" meta:resourcekey="lblNameResource1"></asp:Label>
                           </ItemTemplate>
                           <HeaderStyle Wrap="False" />
                           <ItemStyle Wrap="False" />
                        </asp:TemplateField>
                        <asp:BoundField DataField="EMPLOYEE_NO" HeaderText="員工編號" meta:resourcekey="BoundFieldEMPNOResource1" SortExpression="EMPLOYEE_NO" >
                        <HeaderStyle Wrap="False" />
                        </asp:BoundField>
                        <asp:BoundField DataField="APPLICANT_GROUP_NAME" HeaderText="申請部門" SortExpression="APPLICANT_GROUP_NAME"
                            meta:resourcekey="BoundFieldResource3" >
                        <HeaderStyle Wrap="False" />
                        </asp:BoundField>
                        <asp:TemplateField HeaderText="申請時間" SortExpression="APPLY_DATE" meta:resourcekey="ApplyDateResource1">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox3" runat="server" Text='<%#: Bind("APPLY_DATE") %>' meta:resourcekey="TextBox3Resource1"></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblApplyDate" runat="server" Text='<%#: Bind("APPLY_DATE") %>' meta:resourcekey="lblApplyDateResource1"></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle Wrap="False" />
                            <ItemStyle Wrap="False" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="出差單號" SortExpression="DOC_NBR" meta:resourcekey="TemplateFieldResource1">
                            <ItemTemplate>
                                <asp:LinkButton ID="lbtnDocNbr" runat="server" meta:resourcekey="lbtnDocNbrResource1"></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="出差類別" SortExpression="TRAVEL_TYPE" meta:resourcekey="TemplateFieldResource2">
                            <ItemTemplate>
                                <asp:Label ID="lblTravelType" runat="server" meta:resourcekey="lblTravelTypeResource1"></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle Wrap="False" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="出差時間(起)" SortExpression="START_DATETIME"  meta:resourcekey="BoundFieldResource4">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%#: Bind("START_DATETIME") %>' meta:resourcekey="TextBox1Resource1"></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblStartDateTime" runat="server" Text='<%#: Bind("START_DATETIME") %>' meta:resourcekey="lblStartDateTimeResource1"></asp:Label>
                            </ItemTemplate>
                            <ItemStyle Wrap="False"  />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="出差時間(訖)" SortExpression="END_DATETIME"  meta:resourcekey="BoundFieldResource5">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox2" runat="server" Text='<%#: Bind("END_DATETIME") %>' meta:resourcekey="TextBox2Resource1"></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblEndDateTime" runat="server" Text='<%#: Bind("END_DATETIME") %>' meta:resourcekey="lblEndDateTimeResource1"></asp:Label>
                            </ItemTemplate>
                            <ItemStyle Wrap="False"  />
                        </asp:TemplateField>
                        <asp:BoundField DataField="TRA_HOURS" HeaderText="出差時數" AccessibleHeaderText="TRA_HOURS"
                            meta:resourcekey="BoundFieldResource7" SortExpression="TRA_HOURS" NullDisplayText="0.0">
                            <HeaderStyle Wrap="False" />
                            <ItemStyle HorizontalAlign="Right" />
                        </asp:BoundField>
                        <asp:TemplateField HeaderText="事由" meta:resourcekey="TemplateFieldResource3">
                            <ItemTemplate>
                                <asp:Label ID="lblRemark" runat="server" meta:resourcekey="lblRemarkResource1"></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle Wrap="False" />
                        </asp:TemplateField>
                        <asp:BoundField DataField="STATUS" HeaderText="狀態" meta:resourcekey="BoundFieldResource6"
                            SortExpression="STATUS" >
                        <ItemStyle Wrap="False" />
                        </asp:BoundField>
                    </Columns>
                </Fast:Grid>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
    <asp:Label ID="Label1" runat="server" Text="內部組織結構列表" meta:resourcekey="Label1Resource1" Visible="False"></asp:Label>
    <asp:Label ID="lblDialogTitle" runat="server" Text="出差單查詢-出差單資訊" Style="display: none" meta:resourcekey="lblDialogTitleResource1"></asp:Label>
    <asp:Label ID="lblInternal" runat="server" Text="國內出差" Style="display: none" meta:resourcekey="lblInternalResource1"></asp:Label>
    <asp:Label ID="lblForeign" runat="server" Text="國外出差" Style="display: none" meta:resourcekey="lblForeignResource1"></asp:Label>
    <asp:CustomValidator ID="cvdateNull" runat="server" ErrorMessage="日期不可為空值" Visible="False" meta:resourcekey="cvdateNullResource1"></asp:CustomValidator>
    <asp:CustomValidator ID="cvdateError" runat="server" ErrorMessage="日期(起)不可以晚於日期(訖)" Visible="False" meta:resourcekey="cvdateErrorResource1"></asp:CustomValidator>
    <asp:HiddenField ID="hidIsExporting" runat="server" Value="N"></asp:HiddenField>
    <asp:HiddenField ID="hfCurrentUser" runat="server" />
</asp:Content>
