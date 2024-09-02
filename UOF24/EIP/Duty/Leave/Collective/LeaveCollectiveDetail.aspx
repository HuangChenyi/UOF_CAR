<%@ Page Title="批次扣假明細" Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="EIP_Duty_Leave_Collective_LeaveCollectiveDetail" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" CodeBehind="LeaveCollectiveDetail.aspx.cs" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <script type="text/javascript">
        function RadToolBarButtonClicking(sender, args) {
            var key = args.get_item().get_value();
            switch (key) {
                case "Delete":
                    if (!confirm('<%=lblDeleteConfirm.Text %>')) {
                        args.set_cancel(true);
                    }
                    break;
            }
        }
    </script>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <telerik:RadToolBar ID="RadToolBar1" runat="server" Width="100%" OnButtonClick="RadToolBar1_OnButtonClick" OnClientButtonClicking="RadToolBarButtonClicking" meta:resourcekey="RadToolBar1Resource1" SingleClick="None">
                <Items>
                    <telerik:RadToolBarButton runat="server" Value="user" meta:resourcekey="RadToolBarButtonResource1">
                        <ItemTemplate>
                            <asp:TextBox ID="Keyword" runat="server" meta:resourcekey="KeywordResource1"></asp:TextBox>
                        </ItemTemplate>
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton runat="server" Text="搜尋人員" Value="Search"
                        CheckedImageUrl="~/Common/Images/Icon/icon_m39.gif"
                        DisabledImageUrl="~/Common/Images/Icon/icon_m39.gif"
                        HoveredImageUrl="~/Common/Images/Icon/icon_m39.gif"
                        ImageUrl="~/Common/Images/Icon/icon_m39.gif"
                        meta:resourcekey="SearchResource1">
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton IsSeparator="True" runat="server" meta:resourcekey="RadToolBarButtonResource2"></telerik:RadToolBarButton>
                    <telerik:RadToolBarButton runat="server" Text="刪除" Value="Delete"
                        DisabledImageUrl="~/Common/Images/Icon/icon_m03.gif"
                        CheckedImageUrl="~/Common/Images/Icon/icon_m03.gif"
                        HoveredImageUrl="~/Common/Images/Icon/icon_m03.gif"
                        ImageUrl="~/Common/Images/Icon/icon_m03.gif"
                        meta:resourcekey="DeleteResource1">
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton IsSeparator="True" runat="server" meta:resourcekey="RadToolBarButtonResource3"></telerik:RadToolBarButton>
                </Items>
            </telerik:RadToolBar>
            <asp:CustomValidator ID="cvFault" runat="server" meta:resourcekey="cvFaultResource1"></asp:CustomValidator>
            <Fast:Grid ID="detailGrid" runat="server" Width="100%" DataKeyNames="COLLECTIVE_DETAIL_GUID"
                AutoGenerateColumns="False" DataKeyOnClientWithCheckBox="False"
                AllowSorting="True" AutoGenerateCheckBoxColumn="True" DefaultSortDirection="Ascending"
                EmptyDataText="沒有資料" EnhancePager="True"
                KeepSelectedRows="False" PageSize="15"
                OnRowDataBound="detailGrid_RowDataBound" AllowPaging="True" OnBeforeExport="detailGrid_BeforeExport"
                DefaultSortColumnName="ACCOUNT" OnPageIndexChanging="detailGrid_PageIndexChanging"
                meta:resourcekey="detailGridResource1" OnSorting="detailGrid_Sorting" CustomDropDownListPage="False" SelectedRowColor="" UnSelectedRowColor="">
                <EnhancePagerSettings ShowHeaderPager="True" FirstAltImageUrl="" FirstImageUrl="" LastAltImage="" LastImageUrl="" NextIAltImageUrl="" NextImageUrl="" PageInfoCssClass="" PageNumberCssClass="" PageNumberCurrentCssClass="" PageRedirectCssClass="" PreviousAltImageUrl="" PreviousImageUrl=""></EnhancePagerSettings>
                <ExportExcelSettings AllowExportToExcel="True" ExportType="DataSource"></ExportExcelSettings>
                <Columns>
                    <asp:TemplateField HeaderText="帳號" SortExpression="ACCOUNT" meta:resourcekey="TemplateFieldResource1">
                        <ItemTemplate>
                            <asp:Label ID="lblAccount" runat="server" meta:resourcekey="lblAccountResource1"></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle Wrap="False" />
                        <ItemStyle Wrap="False" Width="10%" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="人員" meta:resourcekey="TemplateFieldResource2">
                        <ItemTemplate>
                            <asp:LinkButton ID="lbtnMember" runat="server" meta:resourcekey="lbtnMemberResource1"></asp:LinkButton>
                        </ItemTemplate>
                        <HeaderStyle Width="15%" />
                        <ItemStyle Wrap="False" />
                    </asp:TemplateField>
                    <asp:BoundField HeaderText="扣假時間(起)" DataField="START_DATETIME" meta:resourcekey="BoundFieldResource1">
                        <HeaderStyle Width="15%" Wrap="False" />
                    </asp:BoundField>
                    <asp:BoundField HeaderText="扣假時間(訖)" DataField="END_DATETIME" meta:resourcekey="BoundFieldResource2">
                        <HeaderStyle Width="15%" Wrap="False" />
                    </asp:BoundField>
                    <asp:TemplateField HeaderText="假別" meta:resourcekey="TemplateFieldResource3">
                        <ItemTemplate>
                            <asp:Label ID="lblLeaveCode" runat="server" Text='<%# Bind("LEA_NAME") %>' meta:resourcekey="lblLeaveCodeResource1"></asp:Label>
                            <asp:Label ID="lblYearLeave" runat="server" meta:resourcekey="lblYearLeaveResource1"></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle Width="10%" />
                        <ItemStyle Wrap="False" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="天(時)數" meta:resourcekey="TemplateFieldResource4">
                        <ItemTemplate>
                            <asp:Label ID="lblTotalHour" runat="server" meta:resourcekey="lblTotalHourResource1"></asp:Label>
                            <asp:Label ID="lblUnit" runat="server" meta:resourcekey="lblUnitResource1"></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle Width="10%" Wrap="False" />
                    </asp:TemplateField>
                    <asp:BoundField HeaderText="事由" DataField="REMARK" meta:resourcekey="BoundFieldResource3">
                        <HeaderStyle Width="20%" Wrap="False" />
                    </asp:BoundField>
                    <asp:TemplateField HeaderText="操作" meta:resourcekey="TemplateFieldResource5">
                        <ItemTemplate>
                            <asp:LinkButton ID="lbtnModify" runat="server" Text="修改" OnClick="lbtnModify_Click"
                                meta:resourcekey="lbtnModifyResource1"></asp:LinkButton>
                        </ItemTemplate>
                        <HeaderStyle Width="5%" Wrap="False" />
                    </asp:TemplateField>
                </Columns>
            </Fast:Grid>
            <asp:TextBox ID="tbErr" runat="server" Visible="False" TextMode="MultiLine" Width="995px"
                Height="140px" ReadOnly="True" meta:resourcekey="tbErrResource1"></asp:TextBox>
            <asp:HiddenField ID="hfSearch" runat="server" />
        </ContentTemplate>
    </asp:UpdatePanel>
    <div style="display: none">
        <asp:Label ID="lblDeleteConfirm" runat="server" Text="確定要刪除?" Visible="False" meta:resourcekey="lblDeleteConfirmResource1"></asp:Label>
        <asp:Label ID="lblConfirm" runat="server" Text="確定扣假" Visible="False" meta:resourcekey="lblConfirmResource1"></asp:Label>
        <asp:Label ID="lblHour" runat="server" Text="小時" Visible="False" meta:resourcekey="lblHourResource1"></asp:Label>
        <asp:Label ID="lblDay" runat="server" Text="天" Visible="False" meta:resourcekey="lblDayResource1"></asp:Label>
        <asp:Label ID="lblLeaveTimeRepect" runat="server" Text="{0}的扣假時間與請假時間重疊:{0}<br />" Visible="False" meta:resourcekey="lblLeaveTimeRepectResource1"></asp:Label>
        <asp:Label ID="lblOveRepect" runat="server" Text="{0}的扣假時間與加班時間重疊:" Visible="False" meta:resourcekey="lblOveRepectResource1"></asp:Label>
        <asp:Label ID="lblTraRepect" runat="server" Text="{0}的扣假時間與出差時間重疊" Visible="False" meta:resourcekey="lblTraRepectResource1"></asp:Label>
        <asp:Label ID="lblLeaveDayLack" runat="server" Text="{0}的{1}餘額不足" Visible="False" meta:resourcekey="lblLeaveDayLackResource1"></asp:Label>
        <asp:Label ID="lblStageStatusLock" runat="server" Text="請假時間差勤結算已鎖單或關帳" Visible="False" meta:resourcekey="lblStageStatusLockResource1"></asp:Label>
        <asp:Label ID="lblAccount" runat="server" Text="帳號" Visible="False" meta:resourcekey="lblAccountResource2"></asp:Label>
        <asp:Label ID="lblMember" runat="server" Text="人員" Visible="False" meta:resourcekey="lblMemberResource1"></asp:Label>
        <asp:Label ID="lblStartDate" runat="server" Text="扣假時間(起)" Visible="False" meta:resourcekey="lblStartDateResource1"></asp:Label>
        <asp:Label ID="lblEndDate" runat="server" Text="扣假時間(訖)" Visible="False" meta:resourcekey="lblEndDateResource1"></asp:Label>
        <asp:Label ID="lblLeaveCode" runat="server" Text="假別" Visible="False" meta:resourcekey="lblLeaveCodeResource2"></asp:Label>
        <asp:Label ID="lblHr" runat="server" Text="時數" Visible="False" meta:resourcekey="lblHrResource1"></asp:Label>
        <asp:Label ID="lblReson" runat="server" Text="事由" Visible="False" meta:resourcekey="lblResonResource1"></asp:Label>
        <asp:Label ID="lblNoLeaveCode" runat="server" Text="{0}無啟用該假別。" Visible="False" meta:resourcekey="lblNoLeaveCodeResource1"></asp:Label>
        <asp:Label ID="lblNodata" runat="server" Visible="False" Text="無資料可進行扣假" meta:resourcekey="lblNodataResource1"></asp:Label>
        <asp:Label ID="lblMsgNoYearLea" runat="server" Text="扣假時間非年休可使用區間" Visible="False" meta:resourcekey="lblMsgNoYearLeaResource1"></asp:Label>
        <asp:Label ID="lblSettErrorMsg" runat="server" Text="下列人員差勤結算類別不同，無法同時進行批次扣假。" Visible="False" meta:resourcekey="lblSettErrorMsgResource1"></asp:Label>
        <asp:Label ID="lblSameOfficeMsg" runat="server" Text="下列人員歸屬地點不同，無法同時進行批次扣假。" Visible="False" meta:resourcekey="lblSameOfficeMsgResource1"></asp:Label>
        <asp:Label ID="lblErrlrLeaveDiffUse" runat="server" Text="已有其他請假資料接續使用該筆記錄，不允許刪除。" Visible="False" meta:resourcekey="lblErrlrLeaveDiffUseResource1"></asp:Label>
        <asp:Label ID="lblLeaveNotInRange" runat="server" Text="{0}請假時間(訖)已超過可用年休使用期限" meta:resourcekey="lblLeaveNotInRangeResource1"></asp:Label>
        <asp:Label ID="lblProbationErrorMsg" runat="server" Text="下列人員未滿足該假別的到職限制或無設定到職日，無法申請" Visible="False" meta:resourcekey="lblProbationErrorMsgResource1"></asp:Label>
        <asp:Label ID="lblNoLeaveCodeLimit" runat="server" Text="下列人員未符合此假別的申請及性別限制，無法申請" Visible="False" meta:resourcekey="lblNoLeaveCodeLimitResource1"></asp:Label>
        <asp:HiddenField ID="hfCurrentUser" runat="server" />
    </div>
</asp:Content>
