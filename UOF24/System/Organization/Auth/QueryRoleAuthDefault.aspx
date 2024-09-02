<%@ Page Title="" Language="C#" MasterPageFile="~/Master/TwoColumn.master" AutoEventWireup="true" CodeBehind="QueryRoleAuthDefault.aspx.cs" Inherits="System_Organization_Auth_QueryRoleAuthDefault" Culture="auto" meta:resourcekey="PageResource2" UICulture="auto" %>

<%@ Register Src="../../../Common/Organization/DepartmentTree.ascx" TagName="DepartmentTree" TagPrefix="uc1" %>
<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ScriptContentPlaceHolder" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ToolbarContentPlaceHolder" runat="server">
    <asp:UpdatePanel ID="upToolBarContent" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <telerik:RadTabStrip runat="server" ID="radContentTab" MultiPageID="radAuthPage" OnTabClick="radContentTab_TabClick1" meta:resourcekey="radContentTabResource1" SelectedIndex="0">
                <Tabs>
                    <telerik:RadTab runat="server" Value="pageAccount" PageViewID="pvAccount" Text="依人員" Selected="True" meta:resourcekey="RadTabResource1"></telerik:RadTab>
                    <telerik:RadTab runat="server" Value="pageRole" PageViewID="pvRole" Text="依角色" meta:resourcekey="RadTabResource2"></telerik:RadTab>
                    <telerik:RadTab runat="server" Value="pageExcelReport" PageViewID ="pvExcelReport" Text="下載匯出報表" meta:resourcekey="RadTabResource3"></telerik:RadTab>
                </Tabs>
            </telerik:RadTabStrip>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="LeftContentPlaceHolder" runat="server">
    <asp:UpdatePanel ID="upDepartmentTree" UpdateMode="Conditional" runat="server">
        <ContentTemplate>
            <uc1:DepartmentTree ID="deptTree" runat="server" DisplayActiveControl="true" />
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="RightContentPlaceHolder" runat="server">
    <script>
        function OnRtbQueryRole_ClientButtonClicking(sender, args) {
            if (args.get_item().get_value() == "ExportExcel") {
                var senderBtn = args.get_item();
                args.set_cancel(true);
                $uof.dialog.open2("~/System/Organization/Auth/ExportRoleManageDetail.aspx", senderBtn,'<%=lblExportExcelTitle.Text%>' , 500, 250, function () { return false; });
            }
        }

        function radExcelReportToolBar_ButtonClicking(sender, args) {
            if (args.get_item().get_value() == "Delete") {
                if (confirm('<%=Ede.Uof.Utility.Page.Common.Resource.GetResource("Common","ConfirmDelete") %>') == false) {
                        args.set_cancel(true);
                    }
                }
            }

    </script>
    <style>
        .GridColHiden {
            display: none;          
        }
    </style>
    <asp:UpdatePanel ID="upRightContent" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <telerik:RadMultiPage runat="server" ID="radAuthPage" SelectedIndex="0" meta:resourcekey="radAuthPageResource1">
                <telerik:RadPageView runat="server" ID="pvAccount" Selected="True" meta:resourcekey="pvAccountResource1">
                    <telerik:RadToolBar ID="rtbQueryUser" runat="server" Width="100%" OnButtonClick="rtbQueryUser_ButtonClick" meta:resourcekey="rtbQueryUserResource1" SingleClick="None">
                        <Items>
                            <telerik:RadToolBarButton runat="server" Value="subDept" meta:resourcekey="RadToolBarButtonResource1">
                                <ItemTemplate>
                                    <asp:CheckBox ID="chbChild" runat="server" Text="包含子部門" meta:resourcekey="chbChildResource1" />
                                </ItemTemplate>
                            </telerik:RadToolBarButton>
                            <telerik:RadToolBarButton IsSeparator="True" runat="server" meta:resourcekey="RadToolBarButtonResource2">
                            </telerik:RadToolBarButton>
                            <telerik:RadToolBarButton runat="server" Text="查詢" Value="Query" CheckedImageUrl="~/Common/Images/Icon/icon_m39.gif"
                                DisabledImageUrl="~/Common/Images/Icon/icon_m39.gif" HoveredImageUrl="~/Common/Images/Icon/icon_m39.gif"
                                ImageUrl="~/Common/Images/Icon/icon_m39.gif" meta:resourcekey="RadToolBarButtonResource3">
                            </telerik:RadToolBarButton>
                            <telerik:RadToolBarButton IsSeparator="True" runat="server" meta:resourcekey="RadToolBarButtonResource4">
                            </telerik:RadToolBarButton>
                            <telerik:RadToolBarButton runat="server" meta:resourcekey="RadToolBarButtonResource7">
                                <ItemTemplate>
                                    <asp:Label ID="lblSearchNotice" runat="server" Text="*可查詢到停用人員及帳號到期人員" ForeColor="Blue" meta:resourcekey="lblSearchNoticeResource1"></asp:Label>
                                </ItemTemplate>
                            </telerik:RadToolBarButton>
                        </Items>
                    </telerik:RadToolBar>
                    <table style="width: 100%" class="PopTable">
                        <tr>
                            <td>
                                <asp:Label ID="lblQueryUser" runat="server" Text="人員" meta:resourcekey="lblQueryUserResource1"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="txtUser" runat="server" meta:resourcekey="txtUserResource1"></asp:TextBox>
                            </td>
                        </tr>
                    </table>
                    <Fast:Grid ID="grdUser" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateCheckBoxColumn="False"
                        AutoGenerateColumns="False" Width="100%" DataKeyOnClientWithCheckBox="False" OnRowDataBound="grdUser_RowDataBound"
                        PageSize="15" DefaultSortDirection="Ascending" EnhancePager="True" OnSorting="grdUser_Sorting" OnPageIndexChanging="grdUser_PageIndexChanging"
                        EmptyDataText="沒有資料" KeepSelectedRows="False" DefaultSortColumnName="ACCOUNT" OnBeforeExport="grdUser_BeforeExport"
                        CustomDropDownListPage="False" meta:resourcekey="grdUserResource1" SelectedRowColor="" UnSelectedRowColor="">
                        <ExportExcelSettings AllowExportToExcel="True" />
                        <EnhancePagerSettings ShowHeaderPager="True" FirstAltImageUrl="" FirstImageUrl="" LastAltImage="" LastImageUrl="" NextIAltImageUrl="" NextImageUrl="" PageInfoCssClass="" PageNumberCssClass="" PageNumberCurrentCssClass="" PageRedirectCssClass="" PreviousAltImageUrl="" PreviousImageUrl="" />
                        <Columns>
                            <asp:TemplateField HeaderText="帳號" SortExpression="ACCOUNT" meta:resourcekey="TemplateFieldResource1">
                                <ItemTemplate>
                                    <asp:LinkButton ID="lbtnAccount" runat="server" meta:resourcekey="lbtnAccountResource1"></asp:LinkButton>
                                </ItemTemplate>
                                <HeaderStyle Wrap="False" />
                                <ItemStyle Wrap="False" Width="150px"/>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="姓名" SortExpression="NAME" meta:resourcekey="TemplateFieldResource2">
                                <ItemTemplate>
                                    <asp:Label ID="lblName" runat="server" meta:resourcekey="lblNameResource1"></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle Wrap="False" />
                                <ItemStyle Wrap="False" Width="200px"/>
                            </asp:TemplateField>
                            <asp:BoundField HeaderText="員工編號" DataField="EMPLOYEE_NO" SortExpression="EMPLOYEE_NO" meta:resourcekey="BoundFieldResource1">
                                <HeaderStyle Wrap="False" />
                                <ItemStyle Wrap="False" Width="150px"/>
                            </asp:BoundField>
                            <asp:BoundField HeaderText="部門" DataField="GROUP_NAME" SortExpression="GROUP_NAME" meta:resourcekey="BoundFieldResource2">
                                <HeaderStyle Wrap="False" />
                                <ItemStyle Wrap="False" />
                            </asp:BoundField>
                            <asp:TemplateField HeaderText="帳號鎖定" SortExpression="IS_LOCKED_OUT" meta:resourcekey="TemplateFieldResource3">
                                <ItemTemplate>
                                    <asp:Label ID="lblIsLockOut" runat="server" meta:resourcekey="lblIsLockOutResource1"></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle Wrap="False" />
                                <ItemStyle Wrap="False" Width="100px"/>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="帳號停用" SortExpression="IS_SUSPENDED" meta:resourcekey="TemplateFieldResource4">
                                <ItemTemplate>
                                    <asp:Label ID="lblIsSuspended" runat="server" meta:resourcekey="lblIsSuspendedResource1"></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle Wrap="False" />
                                <ItemStyle Wrap="False" Width="100px"/>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="帳號到期日" SortExpression="EXPIRE_DATE" meta:resourcekey="TemplateFieldResource5">
                                <ItemTemplate>
                                    <asp:Label ID="lblExpireDate" runat="server" meta:resourcekey="lblExpireDateResource1"></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle Wrap="False" />
                                <ItemStyle Wrap="False" Width="150px"/>
                            </asp:TemplateField>
                        </Columns>
                    </Fast:Grid>
                </telerik:RadPageView>
                <telerik:RadPageView runat="server" ID="pvRole" meta:resourcekey="pvRoleResource1">
                    <telerik:RadToolBar ID="rtbQueryRole" runat="server" Width="100%" OnButtonClick="rtbQueryRole_ButtonClick" OnClientButtonClicking="OnRtbQueryRole_ClientButtonClicking" meta:resourcekey="rtbQueryRoleResource1" SingleClick="None">
                        <Items>
                            <telerik:RadToolBarButton runat="server" Text="查詢" Value="Query" CheckedImageUrl="~/Common/Images/Icon/icon_m39.gif"
                                DisabledImageUrl="~/Common/Images/Icon/icon_m39.gif" HoveredImageUrl="~/Common/Images/Icon/icon_m39.gif"
                                ImageUrl="~/Common/Images/Icon/icon_m39.gif" meta:resourcekey="RadToolBarButtonResource5">
                            </telerik:RadToolBarButton>
                            <telerik:RadToolBarButton IsSeparator="True" runat="server" meta:resourcekey="RadToolBarButtonResource8">
                            </telerik:RadToolBarButton>
                            <telerik:RadToolBarButton runat="server" Text="排程匯出Excel" Value="ExportExcel"  CheckedImageUrl="~/Common/Images/Icon/icon_m144.gif"
                                DisabledImageUrl="~/Common/Images/Icon/icon_m144.gif" HoveredImageUrl="~/Common/Images/Icon/icon_m144.gif"
                                ImageUrl="~/Common/Images/Icon/icon_m144.gif" meta:resourcekey="RadToolBarButtonResource9">
                            </telerik:RadToolBarButton>
                            <telerik:RadToolBarButton IsSeparator="True" runat="server" meta:resourcekey="RadToolBarButtonResource6">
                            </telerik:RadToolBarButton>
                            <telerik:RadToolBarButton runat="server" meta:resourcekey="RadToolBarButtonResource10">
                                <ItemTemplate>
                                    <asp:Label ID="lblRoleSearchNotice" runat="server" Text="*查詢結果不包含停用人員及帳號到期人員" ForeColor="Blue" meta:resourcekey="lblRoleSearchNoticeResource1"></asp:Label>
                                </ItemTemplate>
                            </telerik:RadToolBarButton>
                        </Items>
                    </telerik:RadToolBar>
                    <table style="width: 100%" class="PopTable">
                        <tr style="width: 100%">
                            <td style="width: 10%">
                                <asp:Label ID="lblModuleTitle" runat="server" Text="模組" meta:resourcekey="lblModuleTitleResource1"></asp:Label>
                            </td>
                            <td style="width: 40%">
                                <asp:DropDownList ID="ddlDLModule" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlDLModule_SelectedIndexChanged" meta:resourcekey="radDLModuleResource1"></asp:DropDownList>
                            </td>
                            <td style="width: 10%">
                                <asp:Label ID="lblRoleTitle" runat="server" Text="角色" meta:resourcekey="lblRoleTitleResource1"></asp:Label>
                            </td>
                            <td style="width: 40%">
                                <asp:DropDownList ID="ddlDLRole" runat="server" AutoPostBack="True" meta:resourcekey="radDLRoleResource1"></asp:DropDownList>
                            </td>
                        </tr>
                    </table>
                    <Fast:Grid ID="grdRole" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateCheckBoxColumn="False" OnBeforeExport="grdRole_BeforeExport"
                        AutoGenerateColumns="False" Width="100%" DataKeyOnClientWithCheckBox="False" OnRowDataBound="grdRole_RowDataBound"
                        PageSize="15" DefaultSortDirection="Ascending" EnhancePager="True" OnSorting="grdRole_Sorting" OnPageIndexChanging="grdRole_PageIndexChanging"
                        EmptyDataText="沒有資料" KeepSelectedRows="False" DefaultSortColumnName="ACCOUNT"
                        CustomDropDownListPage="False" meta:resourcekey="grdRoleResource1" SelectedRowColor="" UnSelectedRowColor="">
                        <ExportExcelSettings AllowExportToExcel="True" />
                        <EnhancePagerSettings ShowHeaderPager="True" FirstAltImageUrl="" FirstImageUrl="" LastAltImage="" LastImageUrl="" NextIAltImageUrl="" NextImageUrl="" PageInfoCssClass="" PageNumberCssClass="" PageNumberCurrentCssClass="" PageRedirectCssClass="" PreviousAltImageUrl="" PreviousImageUrl="" />
                        <Columns>
                            <asp:BoundField HeaderText="模組" DataField="MODULE_NAME" SortExpression="MODULE_NAME" meta:resourcekey="lblGriModuleResource1">
                                 <HeaderStyle CssClass="GridColHiden" />
                                <ItemStyle CssClass="GridColHiden"/>
                            </asp:BoundField>
                            <asp:BoundField HeaderText="角色" DataField="ROLE_NAME" SortExpression="ROLE_NAME" meta:resourcekey="BoundFieldResource3">
                                <HeaderStyle Wrap="False" />
                                <ItemStyle Wrap="False" />
                            </asp:BoundField>
                            <asp:BoundField HeaderText="帳號" DataField="ACCOUNT" SortExpression="ACCOUNT" meta:resourcekey="BoundFieldResource4">
                                <HeaderStyle Wrap="False" />
                                <ItemStyle Wrap="False" />
                            </asp:BoundField>
                            <asp:BoundField HeaderText="姓名" DataField="NAME" SortExpression="NAME" meta:resourcekey="BoundFieldResource5">
                                <HeaderStyle Wrap="False" />
                                <ItemStyle Wrap="False" />
                            </asp:BoundField>
                            <asp:BoundField HeaderText="員工編號" DataField="EMPLOYEE_NO" SortExpression="EMPLOYEE_NO" meta:resourcekey="BoundFieldResource6">
                                <HeaderStyle Wrap="False" />
                                <ItemStyle Wrap="False" />
                            </asp:BoundField>
                            <asp:BoundField HeaderText="部門" DataField="GROUP_NAME" SortExpression="GROUP_NAME" meta:resourcekey="BoundFieldResource7">
                                <HeaderStyle Wrap="False" />
                                <ItemStyle Wrap="False" />
                            </asp:BoundField>
                            <asp:TemplateField HeaderText="管理範圍"   meta:resourcekey="TemplateFieldResource6">
                                <ItemTemplate>
                                    <asp:LinkButton ID="lbtnShowAuthItems" runat="server" Text="觀看" meta:resourcekey="lbtnShowAuthItemsResource6"></asp:LinkButton>
                                </ItemTemplate>
                                <HeaderStyle Wrap="False" />
                                <ItemStyle HorizontalAlign="Center"/>
                            </asp:TemplateField>
                        </Columns>
                    </Fast:Grid>
                </telerik:RadPageView>
                <telerik:RadPageView runat="server" ID="pvExcelReport" meta:resourcekey="pvExcelReportResource1">               
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        <ContentTemplate>
                            <telerik:RadToolBar ID="radExcelReportToolBar" runat="server" Width="100%" OnButtonClick="radExcelReportToolBar_ButtonClick" OnClientButtonClicking="radExcelReportToolBar_ButtonClicking"  SingleClick="None" meta:resourcekey="radExcelReportToolBarResource1">
                                <Items>
                                    <telerik:RadToolBarButton runat="server" meta:resourcekey="RadToolBarButtonResource11" >
                                        <ItemTemplate>
                                            <asp:Label ID="queryDate" runat="server" Text="匯出時間:" meta:resourcekey="queryDateResource1" ></asp:Label>
                                        </ItemTemplate>
                                    </telerik:RadToolBarButton>
                                    <telerik:RadToolBarButton runat="server" Value="startdate" meta:resourcekey="RadToolBarButtonResource12" >
                                        <ItemTemplate>
                                            <telerik:RadDatePicker ID="rdStartDate" runat="server" meta:resourcekey="rdStartDateResource1" >
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
                                            </igsch:WebDateChooser>
                                        </ItemTemplate>
                                    </telerik:RadToolBarButton>
                                    <telerik:RadToolBarButton runat="server" meta:resourcekey="RadToolBarButtonResource13" >
                                        <ItemTemplate>
                                            <asp:Label ID="Label3" runat="server" Text="~" meta:resourcekey="Label3Resource1" ></asp:Label>
                                        </ItemTemplate>
                                    </telerik:RadToolBarButton>
                                    <telerik:RadToolBarButton runat="server" Value="enddate" meta:resourcekey="RadToolBarButtonResource14" >
                                        <ItemTemplate>
                                            <telerik:RadDatePicker ID="rdEndDate" runat="server" meta:resourcekey="rdEndDateResource1" >
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
                                            </igsch:WebDateChooser>
                                        </ItemTemplate>
                                    </telerik:RadToolBarButton>
                                    <telerik:RadToolBarButton IsSeparator="True" runat="server" meta:resourcekey="RadToolBarButtonResource15" ></telerik:RadToolBarButton>
                                    <telerik:RadToolBarButton runat="server" Text="查詢" Value="Serach"
                                        CheckedImageUrl="~/Common/Images/Icon/icon_m39.gif"
                                        DisabledImageUrl="~/Common/Images/Icon/icon_m39.gif"
                                        HoveredImageUrl="~/Common/Images/Icon/icon_m39.gif"
                                        ImageUrl="~/Common/Images/Icon/icon_m39.gif" meta:resourcekey="RadToolBarButtonResource16" >
                                    </telerik:RadToolBarButton>
                                    <telerik:RadToolBarButton IsSeparator="True" runat="server" meta:resourcekey="RadToolBarButtonResource17" ></telerik:RadToolBarButton>
                                    <telerik:RadToolBarButton runat="server" Text="刪除" Value="Delete"
                                        CheckedImageUrl="~/Common/Images/Icon/icon_m03.gif"
                                        DisabledImageUrl="~/Common/Images/Icon/icon_m03.gif"
                                        HoveredImageUrl="~/Common/Images/Icon/icon_m03.gif"
                                        ImageUrl="~/Common/Images/Icon/icon_m03.gif" meta:resourcekey="RadToolBarButtonResource18" >
                                    </telerik:RadToolBarButton>
                                    <telerik:RadToolBarButton IsSeparator="True" runat="server" meta:resourcekey="RadToolBarButtonResource19" ></telerik:RadToolBarButton>
                                </Items>
                            </telerik:RadToolBar>
                            <Fast:Grid ID="grdExport" runat="server" AllowSorting="True" AutoGenerateCheckBoxColumn="True"
                                AutoGenerateColumns="False" DataKeyOnClientWithCheckBox="False" OnPageIndexChanging="grdExport_PageIndexChanging"
                                EnhancePager="True" PageSize="15" DefaultSortColumnName="CREATE_DATE" DefaultSortDirection="Descending"
                                Width="100%" OnRowDataBound="grdExport_RowDataBound" OnSorting="grdExport_Sorting" DataKeyNames="EXPORT_GUID,FILE_GROUP_ID" AllowPaging="True" CustomDropDownListPage="False" EmptyDataText="No data found" KeepSelectedRows="False" meta:resourcekey="grdExportResource1" SelectedRowColor="" UnSelectedRowColor="" >
                                <EnhancePagerSettings ShowHeaderPager="True" FirstAltImageUrl="" FirstImageUrl="" LastAltImage="" LastImageUrl="" NextIAltImageUrl="" NextImageUrl="" PageInfoCssClass="" PageNumberCssClass="" PageNumberCurrentCssClass="" PageRedirectCssClass="" PreviousAltImageUrl="" PreviousImageUrl="" />
                                <ExportExcelSettings AllowExportToExcel="False" />
                                <Columns>
                                    <asp:BoundField DataField="EXPORT_GUID" HeaderText="EXPORT_GUID" Visible="False" meta:resourcekey="BoundFieldResource8"  />
                                    <asp:TemplateField HeaderText="匯出時間" SortExpression="CREATE_DATE" meta:resourcekey="TemplateFieldResource7"  >
                                        <ItemTemplate>
                                            <asp:Label ID="lblExportTime" runat="server" meta:resourcekey="lblExportTimeResource1" ></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" Wrap="False" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="檔名" meta:resourcekey="TemplateFieldResource8"  >
                                        <ItemTemplate>
                                            <asp:Image ID="Image1" runat="server" meta:resourcekey="Image1Resource1" ></asp:Image>
                                            <asp:HyperLink ID="hlFileName" runat="server" meta:resourcekey="HyperLink1Resource1"></asp:HyperLink>
                                            <asp:Label ID="lblfileName" runat="server" meta:resourcekey="lblfileNameResource1" ></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" Wrap="False" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="匯出者" meta:resourcekey="TemplateFieldResource9" >
                                        <ItemTemplate>
                                            <asp:Label runat="server" ID="lblUser" meta:resourcekey="lblUserResource1" ></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" Wrap="False" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="狀態" meta:resourcekey="TemplateFieldResource10"  >
                                        <ItemTemplate>
                                            <asp:Label runat="server" ID="lblExportStatus" meta:resourcekey="lblExportStatusResource1" ></asp:Label>
                                            <asp:LinkButton runat="server" ID="lbtnStatus" meta:resourcekey="lbtnStatusResource1" ></asp:LinkButton>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" Wrap="False" />
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:TemplateField>
                                </Columns>
                            </Fast:Grid>
                            <asp:Label ID="lblSuccess" runat="server" Text="成功" Visible="False" meta:resourcekey="lblSuccessResource1" ></asp:Label>
                            <asp:Label ID="lblFail" runat="server" Text="失敗" Visible="False" meta:resourcekey="lblFailResource1" ></asp:Label>
                            <asp:Label ID="lblProcess" runat="server" Text="處理中" Visible="False" meta:resourcekey="lblProcessResource1" ></asp:Label>
                            <asp:Label ID="lblErrorMessage" runat="server" Text="錯誤訊息" Visible="False" meta:resourcekey="lblErrorMessageResource1"  ></asp:Label>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </telerik:RadPageView>
            </telerik:RadMultiPage>
            <asp:HiddenField ID="hfCurrentUser" runat="server" />
            <asp:HiddenField ID="hfCurrentCulture" runat="server" />
        </ContentTemplate>
    </asp:UpdatePanel>
    <asp:Label ID="lblRoleList" runat="server" Text="角色權限表" Visible="False" meta:resourcekey="lblRoleListResource1"></asp:Label>
    <asp:Label ID="lblYes" runat="server" Text="是" Visible="False" meta:resourcekey="lblYesResource1"></asp:Label>
    <asp:Label ID="lblNo" runat="server" Text="否" Visible="False" meta:resourcekey="lblNoResource1"></asp:Label>
    <asp:Label ID="lblAll" runat="server" Text="全部" Visible="False" meta:resourcekey="lblAllResource1"></asp:Label>
    <asp:Label ID="lblTreeTitle" runat="server" Text="內部組織結構列表" Visible="False" meta:resourcekey="lblTreeTitleResource1"></asp:Label>
    <asp:Label ID="lblGridRole" runat="server" Text="角色" Visible="False" meta:resourcekey="lblGridRoleResource1"></asp:Label>
    <asp:Label ID="lblGridAccount" runat="server" Text="帳號" Visible="False" meta:resourcekey="lblGridAccountResource1"></asp:Label>
    <asp:Label ID="lblGridName" runat="server" Text="姓名" Visible="False" meta:resourcekey="lblGridNameResource1"></asp:Label>
    <asp:Label ID="lblGridEmployeeNO" runat="server" Text="員工編號" Visible="False" meta:resourcekey="lblGridEmployeeNOResource1"></asp:Label>
    <asp:Label ID="lblGridDep" runat="server" Text="部門" Visible="False" meta:resourcekey="lblGridDepResource1"></asp:Label>
    <asp:Label ID="lblGriAuth" runat="server" Text="權限" Visible="False" meta:resourcekey="lblGriAuthResource1"></asp:Label>
    <asp:Label ID="lblGridItems" runat="server" Text="管理範圍" Visible="False" meta:resourcekey="lblGridItemsResource1"></asp:Label>
    <asp:Label ID="lblGriLock" runat="server" Text="帳號鎖定" Visible="False" meta:resourcekey="lblGriLockResource1"></asp:Label>
    <asp:Label ID="lblGriSuspended" runat="server" Text="帳號停用" Visible="False" meta:resourcekey="lblGriSuspendedResource1"></asp:Label>
    <asp:Label ID="lblGriExpiry" runat="server" Text="帳號到期日" Visible="False" meta:resourcekey="lblGriExpiryResource1"></asp:Label>
    <asp:Label ID="lblExportExcelTitle" runat="server" Text="依角色查詢" Visible="False" meta:resourcekey="lblExportExcelTitleResource1"></asp:Label>
</asp:Content>
