<%@ Page Title="" Language="C#" MasterPageFile="~/Master/TwoColumn.master" AutoEventWireup="true" CodeBehind="DeptHistoryDefault.aspx.cs" Inherits="System_Organization_Department_History_DeptHistoryDefault" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" %>

<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Ede" %>
<%@ Register Src="~/Common/Organization/UC_DeptManagerTree.ascx" TagPrefix="uc1" TagName="UC_DeptManagerTree" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ScriptContentPlaceHolder" runat="server"></asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ToolbarContentPlaceHolder" runat="server"></asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="LeftContentPlaceHolder" runat="server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <uc1:UC_DeptManagerTree runat="server" ID="deptTree" OnNodeOnClick="deptTree_NodeOnClick"
                EnableDutyManagerAuth="false"
                ShowDeptManagerTree="true" ShowDeptPersonalTree="false" ShowSuperiorTree="False" DisplayActiveControl="true" />
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="RightContentPlaceHolder" runat="server">
    <asp:UpdatePanel ID="deptHistory_UpdatePanel" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <telerik:RadToolBar ID="deptHistoryToolbar" runat="server" Width="100%" SingleClick="None" OnButtonClick="deptHistoryToolbar_ButtonClick" meta:resourcekey="deptHistoryToolbarResource1">
                <Items>
                    <telerik:RadToolBarButton runat="server" Value="subDept">
                        <ItemTemplate>
                            <asp:CheckBox ID="cbSubDept" runat="server" Text="包含子部門" meta:resourcekey="cbSubDeptResource1" />
                        </ItemTemplate>
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton IsSeparator="True" Value="separator" runat="server"></telerik:RadToolBarButton>
                    <telerik:RadToolBarButton runat="server" Text="查詢" Value="Search"
                        CheckedImageUrl="~/Common/Images/Icon/icon_m39.gif" DisabledImageUrl="~/Common/Images/Icon/icon_m39.gif"
                        HoveredImageUrl="~/Common/Images/Icon/icon_m39.gif" ImageUrl="~/Common/Images/Icon/icon_m39.gif" meta:resourcekey="RadToolBarButtonResource1">
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton IsSeparator="True" runat="server" meta:resourcekey="RadToolBarButtonResource2"></telerik:RadToolBarButton>
                </Items>
            </telerik:RadToolBar>
            <table class="PopTable" style="width: 100%">
                <tr>
                    <td>
                        <asp:Label ID="lblStartDate" runat="server" Text="異動日期(起)" meta:resourcekey="lblStartDateResource1"></asp:Label>
                    </td>
                    <td>
                        <telerik:RadDatePicker ID="radDateApplyTimeStart" runat="server" meta:resourcekey="radDateApplyTimeStartResource1">
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
                        <asp:Label ID="lblEndDate" runat="server" Text="異動日期(訖)" meta:resourcekey="lblEndDateResource1"></asp:Label>
                    </td>
                    <td>
                        <telerik:RadDatePicker ID="radDateApplyTimeEnd" runat="server" meta:resourcekey="radDateApplyTimeEndResource1">
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
                        <asp:Label ID="lblKeyWord" runat="server" Text="部門名稱" meta:resourcekey="lblKeyWordResource1"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtKeyWord" runat="server" meta:resourcekey="txtKeyWordResource1" />
                    </td>
                    <td>
                        <asp:Label ID="lblAction" runat="server" Text="動作" meta:resourcekey="lblActionResource1"></asp:Label>
                    </td>
                    <td>
                        <asp:CheckBoxList ID="cblAction" runat="server" RepeatDirection="Horizontal" Style="white-space: nowrap;" meta:resourcekey="cblActionResource1">
                            <asp:ListItem Text="新增" Value="insert" Selected="True" meta:resourcekey="ListItemResource1"></asp:ListItem>
                            <asp:ListItem Text="更名" Value="rename" Selected="True" meta:resourcekey="ListItemResource2"></asp:ListItem>
                            <asp:ListItem Text="搬移" Value="moving" Selected="True" meta:resourcekey="ListItemResource3"></asp:ListItem>
                            <asp:ListItem Text="停用" Value="disable" Selected="True" meta:resourcekey="ListItemResource4"></asp:ListItem>
                            <asp:ListItem Text="啟用" Value="enable" Selected="True" meta:resourcekey="ListItemResource5"></asp:ListItem>
                        </asp:CheckBoxList>
                    </td>
                </tr>
            </table>
            <Ede:Grid ID="grdDeptHistory" Width="100%" AutoGenerateCheckBoxColumn="False" AutoGenerateColumns="False" runat="server" DataKeyOnClientWithCheckBox="False"
                EmptyDataText="沒有資料" KeepSelectedRows="False" AllowPaging="True" AllowSorting="True" PageSize="15" CustomDropDownListPage="False" EnhancePager="True"
                DefaultSortDirection="Descending" OnRowDataBound="grdDeptHistory_RowDataBound" OnBeforeExport="grdDeptHistory_BeforeExport" OnSorting="grdDeptHistory_Sorting"
                DefaultSortColumnName="CREATE_DATE" OnPageIndexChanging="grdDeptHistory_PageIndexChanging" OnAfterExport="grdDeptHistory_AfterExport" meta:resourcekey="grdDeptHistoryResource1">
                <EnhancePagerSettings ShowHeaderPager="True" />
                <ExportExcelSettings AllowExportToExcel="True" />
                <Columns>
                    <asp:TemplateField HeaderText="來源" SortExpression="HISTORY_SOURCE" meta:resourcekey="SyncSourceResource1">
                        <ItemTemplate>
                            <asp:Label ID="lblSyncsource" runat="server" meta:resourcekey="lblSyncsourceResource2"></asp:Label>
                        </ItemTemplate>
                         <HeaderStyle Wrap="false" />
                        <ItemStyle HorizontalAlign="Center" Wrap="false" Width="5%" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="動作" SortExpression="ACTION" meta:resourcekey="TemplateFieldResource1">
                        <ItemTemplate>
                            <asp:Label ID="lblAction" runat="server" meta:resourcekey="lblActionResource2"></asp:Label>
                        </ItemTemplate>
                         <HeaderStyle Wrap="false" />
                        <ItemStyle HorizontalAlign="Center" Wrap="false" Width="5%" />
                    </asp:TemplateField>
                    <asp:BoundField HeaderText="異動前資料" DataField="OLD_GROUP_INFO" meta:resourcekey="BoundFieldResource1">
                        <HeaderStyle Wrap="false" />
                        <ItemStyle HorizontalAlign="Left" Width="25%"/>
                    </asp:BoundField>
                    <asp:BoundField HeaderText="異動後資料" DataField="GROUP_INFO" meta:resourcekey="BoundFieldResource2">
                        <HeaderStyle Wrap="false" />
                        <ItemStyle HorizontalAlign="Left" Width="25%"/>
                    </asp:BoundField>
                     <asp:BoundField HeaderText="異動時間" DataField="STR_CREATE_TIME" SortExpression="CREATE_DATE" DataFormatString="{0:yyyy/MM/dd HH:mm}" meta:resourcekey="BoundFieldResource5">
                        <HeaderStyle Wrap="false" />
                        <ItemStyle HorizontalAlign="Left" Wrap="false" Width="8%"/>
                    </asp:BoundField>
                     <asp:TemplateField HeaderText="異動者" SortExpression="CREATOR_USER" meta:resourcekey="BoundFieldResource3">
                        <ItemTemplate>
                            <asp:Label ID="lblCreatorUser" runat="server"></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle Wrap="false" />
                        <ItemStyle HorizontalAlign="Left" Wrap="false" Width="10%" />
                    </asp:TemplateField>
                    <asp:BoundField HeaderText="IP" DataField="MODIFY_FROM" SortExpression="MODIFY_FROM" meta:resourcekey="BoundFieldResource4">
                        <ItemStyle  Wrap="false" Width="5%" />
                    </asp:BoundField>   
                    <asp:BoundField HeaderText="備註" DataField="REMARK" meta:resourcekey="BoundFieldResource7">
                        <HeaderStyle Wrap="True" />
                         <ItemStyle  Wrap="True" Width="17%" />
                    </asp:BoundField>
                    <asp:TemplateField HeaderText="操作" meta:resourcekey="TemplateFieldResource2">
                        <ItemTemplate>
                            <asp:LinkButton ID="lbtnMaintain" Text="維護" runat="server" OnClick="lbtnMaintain_Click" meta:resourcekey="lbtnMaintainResource1"></asp:LinkButton>
                        </ItemTemplate>
                        <HeaderStyle Wrap="false" />
                        <ItemStyle HorizontalAlign="Center" Wrap="false" Width="5%"/>
                    </asp:TemplateField>
                </Columns>
            </Ede:Grid>
        </ContentTemplate>
    </asp:UpdatePanel>
    <asp:Label ID="lblinsert" runat="server" Text="新增" Visible="False" meta:resourcekey="lblinsertResource1"></asp:Label>
    <asp:Label ID="lblrename" runat="server" Text="更名" Visible="False" meta:resourcekey="lblrenameResource1"></asp:Label>
    <asp:Label ID="lblmoving" runat="server" Text="搬移" Visible="False" meta:resourcekey="lblmovingResource1"></asp:Label>
    <asp:Label ID="lbldisable" runat="server" Text="停用" Visible="False" meta:resourcekey="lbldisableResource1"></asp:Label>
    <asp:Label ID="lblenable" runat="server" Text="啟用" Visible="False" meta:resourcekey="lblenableResource1"></asp:Label>
    <asp:Label ID="lbldelete" runat="server" Text="刪除" Visible="False" meta:resourcekey="lbldeleteResource1"></asp:Label>
    <asp:Label ID="lbldialogTitle" runat="server" Text="異動記錄維護" Visible="False" meta:resourcekey="lbldialogTitleResource1"></asp:Label>
    <asp:Label ID="lblorgtitle" runat="server" Text="內部組織結構列表" Visible="false" meta:resourcekey="lblorgtitleResource1"></asp:Label>
    <asp:Label ID="lblTask" runat="server" Text="排程" Visible="false" meta:resourcekey="lblTaskResource1"></asp:Label>
    <asp:Label ID="lblDeptMaintain" runat="server" Text="部門維護" Visible="false" meta:resourcekey="lblDeptMaintainResource1"></asp:Label>
    <asp:Label ID="lblDeptImport" runat="server" Text="人員匯入" Visible="false" meta:resourcekey="lblDeptImportResource1"></asp:Label>
    <asp:Label ID="lbl104DeptSync" runat="server" Text="104排程" Visible="false" meta:resourcekey="lbl104DeptSyncResource1"></asp:Label>
    <asp:Label ID="lblOther" runat="server" Text="其他" Visible="false" meta:resourcekey="lblOtherResource1"></asp:Label>
    <asp:HiddenField ID="hfCurrentUser" runat="server" />
    <asp:HiddenField ID="hfCurrentRole" runat="server" />
    <asp:HiddenField ID="hfExcelMode" runat="server" />
</asp:Content>
