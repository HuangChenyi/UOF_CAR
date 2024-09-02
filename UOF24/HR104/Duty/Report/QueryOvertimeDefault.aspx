<%@ Page Title="" Language="C#" MasterPageFile="~/Master/TwoColumn.master" AutoEventWireup="true" CodeBehind="QueryOvertimeDefault.aspx.cs" Inherits="Ede.Uof.Web.HR104.Duty.Report.QueryOvertimeDefault" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" %>
<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Ede" %>
<%@ Register Src="~/Common/Organization/UC_DeptManagerTree.ascx" TagPrefix="uc1" TagName="UC_DeptManagerTree" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ScriptContentPlaceHolder" runat="server">
    <script type="text/javascript">
        function OnValueChanging(sender, args) {
            if (args.get_newValue() == "") {
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
                    <telerik:RadToolBarButton runat="server" Value ="suDept" meta:resourcekey="RadToolBarButtonResource1">
                        <ItemTemplate>
                            <asp:CheckBox ID="cbSubDet" runat="server" Text="包含子部門" meta:resourcekey="cbSubDetResource1"/>
                        </ItemTemplate>
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton IsSeparator="True" runat="server" meta:resourcekey="RadToolBarButtonResource2"></telerik:RadToolBarButton>
                    <telerik:RadToolBarButton runat="server" Text="查詢" Value="Serach" CheckedImageUrl="~/Common/Images/Icon/icon_m39.gif"
                        DisabledImageUrl="~/Common/Images/Icon/icon_m39.gif" HoveredImageUrl="~/Common/Images/Icon/icon_m39.gif"
                        ImageUrl="~/Common/Images/Icon/icon_m39.gif" meta:resourcekey="RadToolBarButtonResource3">
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton IsSeparator="True" runat="server" meta:resourcekey="RadToolBarButtonResource4"></telerik:RadToolBarButton>
                </Items>
            </telerik:RadToolBar>
            <table class ="PopTable" style="width:100%">
                <tr>                   
                    <td>
                        <asp:Label ID="Label3" runat="server" Text="加班日期(起)" meta:resourcekey="Label3Resource1"></asp:Label>
                    </td>
                    <td>
                        <telerik:RadDatePicker ID="rdStartDate" runat="server" meta:resourcekey="rdStartDateResource1">
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
                    <td>
                        <asp:Label ID="Label4" runat="server" Text="加班日期(訖)" meta:resourcekey="Label4Resource1"></asp:Label>
                    </td>
                    <td>
                        <telerik:RadDatePicker ID="rdEndDate" runat="server" meta:resourcekey="rdEndDateResource1">
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
                <tr>
                     <td>
                        <asp:Label ID="Label2" runat="server" Text="人員" meta:resourcekey="Label2Resource1"></asp:Label>
                    </td>
                    <td colspan="3">
                         <asp:TextBox ID="txtUser" runat="server" meta:resourcekey="txtUserResource1"/>
                    </td>
                </tr>
            </table>
            <div style="margin-top: 2px;">
                <Ede:Grid ID="grdOverTime" Width="100%" AutoGenerateCheckBoxColumn="False" AutoGenerateColumns="False"  OnAfterExport="grdOverTime_AfterExport" OnBeforeExport="grdOverTime_BeforeExport"
                    OnPageIndexChanging="grdOverTime_PageIndexChanging" OnRowDataBound="grdOverTime_RowDataBound" OnSorting="grdOverTime_Sorting" runat="server"  DataKeyOnClientWithCheckBox="False"
                     DefaultSortDirection="Ascending" EmptyDataText="沒有資料" KeepSelectedRows="False"  AllowPaging="True" AllowSorting="True"  PageSize="15"   DefaultSortColumnName="EMPLOYEE_NO"
                    CustomDropDownListPage="False" EnhancePager="True" SelectedRowColor="" UnSelectedRowColor="" meta:resourcekey="grdOverTimeResource1">
                    <EnhancePagerSettings ShowHeaderPager="True" />
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
                        <asp:BoundField HeaderText="加班時間(起)" DataField="ASK_LEAVE_START" SortExpression="ASK_LEAVE_START" meta:resourcekey="BoundFieldResource5">
                            <HeaderStyle Wrap="False" />
                            <ItemStyle Wrap="False"  Width="150px"/>
                        </asp:BoundField>
                        <asp:BoundField HeaderText="加班時間(訖)" DataField="ASK_LEAVE_END" SortExpression="ASK_LEAVE_END" meta:resourcekey="BoundFieldResource6">
                            <HeaderStyle Wrap="False" />
                            <ItemStyle Wrap="False"  Width="150px"/>
                        </asp:BoundField>
                        <asp:TemplateField HeaderText="加班時數" SortExpression="ASK_LEAVE_HOUR" meta:resourcekey="TemplateFieldResource1">
                            <ItemTemplate>
                                <asp:Label ID="lblOverTimeHour" runat="server" meta:resourcekey="lblOverTimeHourResource1"></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle Wrap="False" />
                            <ItemStyle Wrap="False" HorizontalAlign="Right" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="轉費用時數" SortExpression="CHANGE_HOUR1" meta:resourcekey="TemplateFieldResource2">
                            <ItemTemplate>
                                <asp:Label ID="lblPayment" runat="server" meta:resourcekey="lblPaymentResource1"></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle Wrap="False" />
                            <ItemStyle HorizontalAlign="Right" Wrap="False" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="轉補休時數" SortExpression="CHANGE_HOUR2" meta:resourcekey="TemplateFieldResource3">
                            <ItemTemplate>
                                <asp:Label ID="lblTimeOff" runat="server" meta:resourcekey="lblTimeOffResource1"></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle Wrap="False" />
                            <ItemStyle HorizontalAlign="Right" Wrap="False" Width="100px"/>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="事由" meta:resourcekey="TemplateFieldResource5">                             
                            <ItemTemplate>
                                <asp:Label ID="lblReason" runat="server" meta:resourcekey="lblReasonResource1"></asp:Label>                                
                            </ItemTemplate>
                            <HeaderStyle Wrap="False" />
                            <ItemStyle Wrap="False"   Width="120px" />
                        </asp:TemplateField>
                    </Columns>
                </Ede:Grid>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
            
    <asp:HiddenField ID="hfCurrentUser" runat="server" />
    <asp:HiddenField ID="hfIsExporting" runat="server" Value="N"></asp:HiddenField>
    <asp:Label ID="Label1" runat="server" Text="內部組織結構列表" Visible="False" meta:resourcekey="Label1Resource1"></asp:Label>
</asp:Content>

