<%@ Page Title="" Language="C#" MasterPageFile="~/Master/TwoColumn.master" AutoEventWireup="true" CodeBehind="QueryLeaveDefault.aspx.cs" Inherits="Ede.Uof.Web.HR104.Duty.Report.QueryLeaveDefault" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" %>

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
                            <asp:CheckBox ID="cbSubDet" runat="server" Text="包含子部門" meta:resourcekey="cbSubDetResource1" />
                        </ItemTemplate>
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton IsSeparator="True" runat="server" meta:resourcekey="RadToolBarButtonResource2"></telerik:RadToolBarButton>
                    <telerik:RadToolBarButton runat="server" Text="查詢" Value="Serach" CheckedImageUrl="~/Common/Images/Icon/icon_m39.gif"
                        DisabledImageUrl="~/Common/Images/Icon/icon_m39.gif" HoveredImageUrl="~/Common/Images/Icon/icon_m39.gif"
                        ImageUrl="~/Common/Images/Icon/icon_m39.gif" meta:resourcekey="RadToolBarButtonResource3" >
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton IsSeparator="True" runat="server" meta:resourcekey="RadToolBarButtonResource4"></telerik:RadToolBarButton>
                </Items>
            </telerik:RadToolBar>
            <table class ="PopTable" style="width:100%">
                <tr>                   
                    <td>
                        <asp:Label ID="Label3" runat="server" Text="請假日期(起)" meta:resourcekey="Label3Resource1"></asp:Label>
                    </td>
                    <td>
                        <telerik:RadDatePicker ID="rdLeaveDateStart" runat="server" meta:resourcekey="rdLeaveDateStartResource1">
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
                    <td>
                        <asp:Label ID="Label4" runat="server" Text="請假日期(訖)" meta:resourcekey="Label4Resource1"></asp:Label>
                    </td>
                    <td>
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
                    </td>
                </tr>
                <tr>
                     <td>
                        <asp:Label ID="Label2" runat="server" Text="人員" meta:resourcekey="Label2Resource1"></asp:Label>
                    </td>
                    <td colspan="3">
                         <asp:TextBox ID="txtUser" runat="server" meta:resourcekey="txtUserResource1" />
                    </td>
                </tr>
            </table>
            <div style="margin-top: 2px;">
                <Ede:Grid ID="grdLeave" Width="100%" AutoGenerateCheckBoxColumn="False" AutoGenerateColumns="False" OnAfterExport ="grdLeave_AfterExport" OnBeforeExport="grdLeave_BeforeExport"
                    OnPageIndexChanging="grdLeave_PageIndexChanging" OnRowDataBound="grdLeave_RowDataBound" OnSorting="grdLeave_Sorting" runat="server"  DataKeyOnClientWithCheckBox="False"
                     DefaultSortDirection="Ascending" EmptyDataText="沒有資料" KeepSelectedRows="False"  AllowPaging="True" AllowSorting="True"  PageSize="15"   DefaultSortColumnName="EMPLOYEE_NO"
                    CustomDropDownListPage="False" EnhancePager="True" SelectedRowColor="" UnSelectedRowColor="" meta:resourcekey="grdLeaveResource1">
                    <EnhancePagerSettings ShowHeaderPager="True" FirstAltImageUrl="" FirstImageUrl="" LastAltImage="" LastImageUrl="" NextIAltImageUrl="" NextImageUrl="" PageInfoCssClass="" PageNumberCssClass="" PageNumberCurrentCssClass="" PageRedirectCssClass="" PreviousAltImageUrl="" PreviousImageUrl="" />
                    <ExportExcelSettings AllowExportToExcel="true" />
                    <Columns>
                        <asp:BoundField HeaderText="姓名" DataField="EMPLOYEE_CNAME" SortExpression="EMPLOYEE_CNAME" meta:resourcekey="BoundFieldResource2"> 
                            <HeaderStyle Wrap="False" />
                            <ItemStyle Wrap="False" />
                        </asp:BoundField>
                        <asp:BoundField HeaderText="員工編號" DataField="EMPLOYEE_NO" SortExpression="EMPLOYEE_NO" meta:resourcekey="BoundFieldResource3">
                            <HeaderStyle Wrap="False" />
                            <ItemStyle Wrap="False" />
                        </asp:BoundField>
                        <asp:BoundField HeaderText="申請部門" DataField="DEPARTMENT_CNAME" SortExpression="DEPARTMENT_CNAME" meta:resourcekey="BoundFieldResource4">
                            <HeaderStyle Wrap="False" />
                            <ItemStyle Wrap="False" />
                        </asp:BoundField>                      
                        <asp:BoundField HeaderText="請假時間(起)" DataField="ASK_LEAVE_START" SortExpression="ASK_LEAVE_START" meta:resourcekey="BoundFieldResource6">
                            <HeaderStyle Wrap="False" />
                            <ItemStyle Wrap="False"   Width="150px"/>
                        </asp:BoundField>
                        <asp:BoundField HeaderText="請假時間(訖)" DataField="ASK_LEAVE_END" SortExpression="ASK_LEAVE_END" meta:resourcekey="BoundFieldResource7">
                            <HeaderStyle Wrap="False" />
                            <ItemStyle Wrap="False"  Width="150px"/>
                        </asp:BoundField>
                         <asp:BoundField HeaderText="代理人" DataField="AGENT_CNAME" SortExpression="AGENT_CNAME"  meta:resourcekey="BoundFieldResource11" >
                          <HeaderStyle Wrap="False" />
                          <ItemStyle Wrap="False" />
                          </asp:BoundField>
                        <asp:TemplateField HeaderText="請假時/天數" SortExpression="ASK_LEAVE_HOUR" meta:resourcekey="TemplateFieldResource1">
                            <ItemTemplate>
                                <asp:Label ID="lblLeaveHour" runat="server" meta:resourcekey="lblLeaveHourResource1" ></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle Wrap="False" />
                            <ItemStyle Wrap="False"   HorizontalAlign="Right" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="單位" meta:resourcekey="TemplateFieldResource2">
                            <ItemTemplate>
                             <asp:Label ID="lblDay" runat="server" Text="天" Visible="False" meta:resourcekey="lblDayResource1"></asp:Label>
                             <asp:Label ID="lblHour" runat="server" Text="小時" Visible="False" meta:resourcekey="lblHourResource1"></asp:Label>
                              <asp:Label ID="lblMin" runat="server" Text="分" Visible="False" meta:resourcekey="lblMinResource1"></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle Wrap="False" />
                            <ItemStyle Wrap="False" />
                        </asp:TemplateField>
                        <asp:BoundField HeaderText="假別代碼" DataField="LEAVE_REFERENCE_CODE" SortExpression="LEAVE_REFERENCE_CODE" meta:resourcekey="BoundFieldResource8">
                            <HeaderStyle Wrap="False" />
                            <ItemStyle Wrap="False" />
                        </asp:BoundField>
                        <asp:BoundField HeaderText="假別" DataField="LEAVE_REFERENCE_CLASS" SortExpression="LEAVE_REFERENCE_CLASS" meta:resourcekey="BoundFieldResource9">
                            <HeaderStyle Wrap="False" />
                            <ItemStyle Wrap="False" />
                        </asp:BoundField>
                        <asp:TemplateField HeaderText="事由" meta:resourcekey="BoundFieldResource10">
                              <ItemTemplate>
                                <asp:Label ID="lblMemo" runat="server"></asp:Label>
                              </ItemTemplate>
                            <HeaderStyle Wrap="False"/>
                            <ItemStyle Wrap="False" Width="120px" />
                        </asp:TemplateField>
                    </Columns>
                </Ede:Grid>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
     <asp:HiddenField ID="hfCurrentUser" runat="server" />
     <asp:HiddenField ID="hidIsExporting" runat="server"  Value="N"/>
     <asp:Label ID="Label1" runat="server" Text="內部組織結構列表" Visible="False" meta:resourcekey="Label1Resource1"></asp:Label>
     <asp:CustomValidator ID="cvdateNull" runat="server" ErrorMessage="日期不可為空值" Visible="False" meta:resourcekey="cvdateNullResource1"></asp:CustomValidator>
     <asp:CustomValidator ID="cvdateError" runat="server" ErrorMessage="日期(起)不可以晚於日期(訖)" Visible="False" meta:resourcekey="cvdateErrorResource1"></asp:CustomValidator>
</asp:Content>
