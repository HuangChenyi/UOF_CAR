<%@ Page Title="" Language="C#" MasterPageFile="~/Master/TwoColumn.master" AutoEventWireup="true" Inherits="EIP_Duty_Report_QueryLeaveDef" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" Codebehind="QueryLeaveDef.aspx.cs" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%--<%@ Register Assembly="System.Web.Extensions" Namespace="System.Web.UI" TagPrefix="asp" %>--%>
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
    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
        <ContentTemplate>
            <uc1:UC_DeptManagerTree ID="UC_DeptManagerTree1" runat="server" ShowDeptManagerTree="True" ShowDeptPersonalTree="True" ShowSuperiorTree="True" DisplayActiveControl="true"/>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>



<asp:Content ID="Content4" ContentPlaceHolderID="RightContentPlaceHolder" runat="server">
    <asp:UpdatePanel ID="UpdatePanel3" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
             <telerik:RadToolBar ID="RadToolBar1" runat="server" OnButtonClick="RadToolBar1_OnButtonClick" Width="100%" meta:resourcekey="RadToolBar1Resource1" SingleClick="None">
                            <Items>
                                <telerik:RadToolBarButton runat="server" Value="subDept" meta:resourcekey="RadToolBarButtonResource1">
                                    <ItemTemplate>
                                        <asp:CheckBox ID="cbSubDept" runat="server" meta:resourcekey="cbSubDeptResource1" Text="包含子部門" />
                                    </ItemTemplate>
                                </telerik:RadToolBarButton>
                                <telerik:RadToolBarButton IsSeparator="True" runat="server" meta:resourcekey="RadToolBarButtonResource2">
                                </telerik:RadToolBarButton>
                                <telerik:RadToolBarButton runat="server" CheckedImageUrl="~/Common/Images/Icon/icon_m39.gif" DisabledImageUrl="~/Common/Images/Icon/icon_m39.gif" HoveredImageUrl="~/Common/Images/Icon/icon_m39.gif" ImageUrl="~/Common/Images/Icon/icon_m39.gif" meta:resourcekey="RadToolBarSerachResource1" Text="查詢" Value="Serach">
                                </telerik:RadToolBarButton>
                                <telerik:RadToolBarButton IsSeparator="True" runat="server" meta:resourcekey="RadToolBarButtonResource3">
                                </telerik:RadToolBarButton>
                            </Items>
                        </telerik:RadToolBar>
            <table class="PopTable" style="width:100%" >
                
                <tr>
                    <td style="width:20%">
                        <asp:Label ID="Label5" runat="server" meta:resourcekey="Label5Resource1" Text="請假日期(起)"></asp:Label>
                    </td>
                    <td style="width:30%">
                        <telerik:RadDatePicker ID="rdStart" Runat="server"  meta:resourcekey="rdStartResource1">
                            <calendar usecolumnheadersasselectors="False" userowheadersasselectors="False" Culture="zh-TW" EnableWeekends="True" FastNavigationNextText="&amp;lt;&amp;lt;">
                            </calendar>
                            <dateinput labelwidth="40%" DateFormat="yyyy/M/d" DisplayDateFormat="yyyy/M/d" Width="">
                                <ClientEvents OnValueChanging="OnValueChanging" />
                                <EmptyMessageStyle Resize="None" />
                                <ReadOnlyStyle Resize="None" />
                                <FocusedStyle Resize="None" />
                                <DisabledStyle Resize="None" />
                                <InvalidStyle Resize="None" />
                                <HoveredStyle Resize="None" />
                                <EnabledStyle Resize="None" />
                            </dateinput>
                            <DatePopupButton CssClass="" HoverImageUrl="" ImageUrl="" />
                        </telerik:RadDatePicker>
                    </td>
                    <td style="width:20%">
                        <asp:Label ID="Label7" runat="server" meta:resourcekey="Label7Resource1" Text="請假日期(訖)"></asp:Label>
                    </td>
                    <td style="width:30%">
                        <telerik:RadDatePicker ID="rdEnd" Runat="server"  meta:resourcekey="rdEndResource1">
                            <calendar usecolumnheadersasselectors="False" userowheadersasselectors="False" Culture="zh-TW" EnableWeekends="True" FastNavigationNextText="&amp;lt;&amp;lt;">
                            </calendar>
                            <dateinput labelwidth="40%" DateFormat="yyyy/M/d" DisplayDateFormat="yyyy/M/d" Width="">
                                <ClientEvents OnValueChanging="OnValueChanging" />
                                <EmptyMessageStyle Resize="None" />
                                <ReadOnlyStyle Resize="None" />
                                <FocusedStyle Resize="None" />
                                <DisabledStyle Resize="None" />
                                <InvalidStyle Resize="None" />
                                <HoveredStyle Resize="None" />
                                <EnabledStyle Resize="None" />
                            </dateinput>
                            <DatePopupButton CssClass="" HoverImageUrl="" ImageUrl="" />
                        </telerik:RadDatePicker>
                    </td>
                </tr>
                <tr>
                    <td >
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
                            <asp:ListItem Value="0" meta:resourcekey="ListItemResource1" Text="所有狀態"></asp:ListItem>
                            <asp:ListItem Value="1" meta:resourcekey="ListItemResource2" Text="簽核中"></asp:ListItem>
                            <asp:ListItem Value="2" meta:resourcekey="ListItemResource3" Text="通過"></asp:ListItem>
                            <asp:ListItem Value="3" meta:resourcekey="ListItemResource4" Text="否決"></asp:ListItem>
                            <asp:ListItem Value="4" meta:resourcekey="ListItemResource5" Text="作廢"></asp:ListItem>
                            <asp:ListItem Value="5" meta:resourcekey="ListItemResource6" Text="銷單中"></asp:ListItem>
                            <asp:ListItem Value="6" meta:resourcekey="ListItemResource7" Text="已銷單"></asp:ListItem>
                            <asp:ListItem Value="-1" meta:resourcekey="ListItemResource8" Text="異常"></asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
            </table>
            <div style="margin-top: 2px;">
  <Fast:Grid ID="grdLeave" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateCheckBoxColumn="False" AutoGenerateColumns="False" DataKeyOnClientWithCheckBox="False" DefaultSortDirection="Ascending" DefaultSortColumnName="APPLICANT_ACCOUNT" EmptyDataText="沒有資料" EnhancePager="True" KeepSelectedRows="False" meta:resourcekey="grdLeaveResource1" OnBeforeExport="grdLeave_BeforeExport" OnAfterExport="grdLeave_AfterExport" OnPageIndexChanging="grdLeave_PageIndexChanging" OnRowDataBound="grdLeave_RowDataBound" OnSorting="grdLeave_Sorting" PageSize="15" Width="100%" CustomDropDownListPage="False" SelectedRowColor="" UnSelectedRowColor="">
                            <EnhancePagerSettings ShowHeaderPager="True"/>
                            <ExportExcelSettings AllowExportToExcel="True" />
                            <Columns>
                                <asp:BoundField DataField="APPLICANT_ACCOUNT" HeaderText="帳號" meta:resourcekey="BoundFieldResource0" SortExpression="APPLICANT_ACCOUNT"  />
                                <asp:TemplateField HeaderText="姓名" meta:resourcekey="BoundFieldResource1" >
                                 <ItemTemplate>
                                  <asp:Label ID="lblName" runat="server" meta:resourcekey="lblNameResource1"></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle Wrap="False" />
                                <ItemStyle Wrap="False" />
                               </asp:TemplateField>
                                <asp:BoundField DataField="EMPLOYEE_NO" HeaderText="員工編號" meta:resourcekey="BoundFieldEMPNOResource1" SortExpression="EMPLOYEE_NO" />
                                <asp:BoundField DataField="APPLICANT_GROUP_ID_NAME" HeaderText="申請部門" meta:resourcekey="BoundFieldResource2" SortExpression="APPLICANT_GROUP_ID_NAME" />
                                <asp:TemplateField HeaderText="申請時間" SortExpression="APPLY_DATE" meta:resourcekey="ApplyDateResource1">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox3" runat="server" Text='<%#: Bind("APPLY_DATE") %>' meta:resourcekey="TextBox3Resource1"></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="lblApplyDate" runat="server" Text='<%#: Bind("APPLY_DATE") %>' meta:resourcekey="lblApplyDateResource1"></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle Wrap="False" />
                                    <ItemStyle Wrap="False"  />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="請假單號" meta:resourcekey="TemplateFieldResource1" SortExpression="DOC_NBR">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="lbtnDocNbr" runat="server" meta:resourcekey="lbtnDocNbrResource1" Text='<%#: Eval("DOC_NBR") %>'></asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="請假時間(起)" SortExpression="START_DATETIME" meta:resourcekey="BoundFieldResource3">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox1" runat="server" Text='<%#: Bind("START_DATETIME") %>' meta:resourcekey="TextBox1Resource1"></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="lblStartDateTime" runat="server" Text='<%#: Bind("START_DATETIME") %>' meta:resourcekey="lblStartDateTimeResource1"></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle Wrap="False"  />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="請假時間(訖)" SortExpression="END_DATETIME" meta:resourcekey="BoundFieldResource4">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox2" runat="server" Text='<%#: Bind("END_DATETIME") %>' meta:resourcekey="TextBox2Resource1"></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="lblEndDateTime" runat="server" Text='<%#: Bind("END_DATETIME") %>' meta:resourcekey="lblEndDateTimeResource1"></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle Wrap="False"  />
                                </asp:TemplateField>
                                <asp:BoundField DataField="SHOW_TIME" HeaderText="請假時數/天數" meta:resourcekey="BoundFieldResource5" Visible="False">
                                    <ItemStyle HorizontalAlign="Right" />
                                </asp:BoundField>
                                <asp:TemplateField HeaderText="請假時/天數" meta:resourcekey="TemplateFieldResource3">
                                    <ItemTemplate>
                                        <asp:Label ID="lblNumber" runat="server" Text="0" meta:resourcekey="lblNumberResource1"></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Right" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="單位" meta:resourcekey="TemplateFieldResource4">
                                    <ItemTemplate>
                                        <asp:Label ID="lblUnit" runat="server" Text="時" meta:resourcekey="lblUnitResource1"></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="LEA_CODE" HeaderText="假別代碼" meta:resourcekey="LEA_CODEBoundFieldResource" SortExpression="LEA_CODE" />
                                <asp:BoundField DataField="LEA_CODE_NAME" HeaderText="假別" meta:resourcekey="BoundFieldResource6" SortExpression="LEA_CODE_NAME">
                                    <HeaderStyle Wrap="False" />
                                    <ItemStyle Wrap="False" />
                                </asp:BoundField>
                                <asp:TemplateField HeaderText="事由" InsertVisible="False" meta:resourcekey="TemplateFieldResource2">
                                    <ItemTemplate>
                                        <asp:Label ID="lblRemark" runat="server" Text='<%#: Bind("REMARK") %>' meta:resourcekey="lblRemarkResource1"></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="STATUS" HeaderText="單據狀態" meta:resourcekey="BoundFieldResource7" SortExpression="STATUS" />
                                <asp:BoundField AccessibleHeaderText="APPLICANT" DataField="APPLICANT" HeaderText="APPLICANT" meta:resourcekey="BoundFieldResource8" />
                                <asp:BoundField AccessibleHeaderText="TASK_ID" DataField="TASK_ID" HeaderText="TASK_ID" meta:resourcekey="BoundFieldResource9" />
                            </Columns>
                            <HeaderStyle Wrap="False" />
                            <RowStyle Wrap="True" HorizontalAlign="Left" />
                        </Fast:Grid>   
                </div>
                         <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            </asp:UpdatePanel>
        </ContentTemplate>
    </asp:UpdatePanel>
    <asp:Label ID="lblDialog" runat="server" Text="請假單查詢-請假單資訊" Visible="False" meta:resourcekey="lblDialogResource1"></asp:Label>
    <asp:Label ID="lblDayUnit" runat="server" Text="天" Visible="False" meta:resourcekey="lblDayUnitResource1"></asp:Label>
    <asp:Label ID="lblHourUnit" runat="server" Text="時" Visible="False" meta:resourcekey="lblHourUnitResource1"></asp:Label>
    <asp:Label ID="Label1" runat="server" meta:resourcekey="Label1Resource1" Text="內部組織結構列表" Visible="False"></asp:Label>
    <asp:HiddenField ID="hidIsExporting" runat="server" Value="N" />
    <asp:HiddenField ID="hfCurrentUser" runat="server" />
</asp:Content>
