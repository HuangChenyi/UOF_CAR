<%@ Page Title="申請明細" Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" CodeBehind="OverTimeBatchDetailAdv.aspx.cs" Inherits="Ede.Uof.Web.HR104.Duty.Report.OverTimeBatchDetailAdv" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" %>

<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Ede" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <table style="width: 100%">
                <tr>
                    <td style="white-space: nowrap">
                        <telerik:RadToolBar ID="RadToolBar1" runat="server" Width="100%" SingleClick="None" OnButtonClick="RadToolBar1_ButtonClick">
                            <Items>
                                <telerik:RadToolBarButton runat="server" Value="Keyword" meta:resourcekey="RadToolBarButtonResource4">
                                    <ItemTemplate>
                                        <asp:Label ID="lblkeyWord" runat="server" Text="關鍵字:" ForeColor="Black" meta:resourcekey="lblkeyWordResource1"></asp:Label>
                                        <telerik:RadTextBox ID="txtKeyWord" runat="server"/>
                                        <asp:Label ID="lblstatus" runat="server" Text="狀態:" ForeColor="Black" meta:resourcekey="lblstatusResource1"></asp:Label>
                                        <telerik:RadDropDownList ID="ddlstatus" runat="server" meta:resourcekey="ddlstatusResource1" SelectedText="全部" SelectedValue="All">
                                            <Items>
                                                <telerik:DropDownListItem Text="全部" Value="All" Selected="True" meta:resourcekey="ListItemResource1" runat="server"></telerik:DropDownListItem>
                                                <telerik:DropDownListItem Text="成功" Value="Pass" meta:resourcekey="ListItemResource2" runat="server"></telerik:DropDownListItem>
                                                <telerik:DropDownListItem Text="失敗" Value="Fail" meta:resourcekey="ListItemResource3" runat="server"></telerik:DropDownListItem>
                                            </Items>
                                        </telerik:RadDropDownList>
                                    </ItemTemplate>
                                </telerik:RadToolBarButton>
                                <telerik:RadToolBarButton runat="server" Text="查詢" Value="Search" meta:resourcekey="RadToolBarButtonResource1"
                                    CheckedImageUrl="~/Common/Images/Icon/icon_m39.png" DisabledImageUrl="~/Common/Images/Icon/icon_m39.png"
                                    HoveredImageUrl="~/Common/Images/Icon/icon_m39.png" ImageUrl="~/Common/Images/Icon/icon_m39.png">
                                </telerik:RadToolBarButton>
                                <telerik:RadToolBarButton IsSeparator="True" runat="server" meta:resourcekey="RadToolBarButtonResource2"></telerik:RadToolBarButton>
                                <telerik:RadToolBarButton runat="server" Value="Msg" meta:resourcekey="RadToolBarButtonResource3">
                                    <ItemTemplate>
                                        <asp:Label ID="lblApplyUser" runat="server" ForeColor="Blue" meta:resourcekey="lblApplyUserResource1"></asp:Label>&nbsp;&nbsp;
                                        <asp:Label ID="lblNotice" runat="server" Text="部分加班人員加班時數尚未完成計算，請稍候。" Visible="False" ForeColor="Red" meta:resourcekey="lblNoticeResource1"></asp:Label>
                                    </ItemTemplate>
                                </telerik:RadToolBarButton>
                            </Items>
                        </telerik:RadToolBar>
                    </td>
                </tr>
                <tr>
                    <td>
                        <Ede:Grid ID="detailGrid" runat="server" AutoGenerateCheckBoxColumn="False" AllowSorting="True" DataKeyOnClientWithCheckBox="False"
                            DefaultSortDirection="Descending" EmptyDataText="沒有資料" OnSorting="detailGrid_Sorting" OnBeforeExport="detailGrid_BeforeExport"
                            EnhancePager="True" KeepSelectedRows="False" PageSize="15" DefaultSortColumnName="STATE" AllowPaging="true" EnableTheming="true"
                            Width="100%" CustomDropDownListPage="False" SelectedRowColor="" UnSelectedRowColor="" AutoGenerateColumns="False" OnPageIndexChanging="detailGrid_PageIndexChanging" OnRowDataBound="detailGrid_RowDataBound" meta:resourcekey="detailGridResource1">
                            <EnhancePagerSettings ShowHeaderPager="True"></EnhancePagerSettings>
                            <ExportExcelSettings AllowExportToExcel="True"></ExportExcelSettings>
                            <HeaderStyle Wrap="False" />
                            <Columns>
                                <asp:TemplateField HeaderText="姓名" SortExpression="SORT_USER" meta:resourcekey="TFNameResource1">
                                    <ItemTemplate>
                                        <asp:Label ID="lblName" runat="server" meta:resourcekey="lblNameResource1"></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle Wrap="False" />
                                    <ItemStyle Width="200px" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="折換方式" SortExpression="OT_TYPE" meta:resourcekey="TFOTTypeResource1">
                                    <ItemTemplate>
                                        <asp:Label ID="lblOTtype" runat="server" meta:resourcekey="lblOTtypeResource1"></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle Wrap="False" Width="7%" />
                                    <ItemStyle HorizontalAlign="Center" Wrap="False" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="誤餐費" SortExpression="MEAL_ALLOWANCE" meta:resourcekey="TFMealAllowanceResource1">
                                    <ItemTemplate>
                                        <asp:Label ID="lblMealAllowance" runat="server" meta:resourcekey="lblMealAllowanceResource1"></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle Wrap="False" Width="7%" />
                                    <ItemStyle HorizontalAlign="Center" Wrap="False" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="加班時間(起)" SortExpression="START_TIME" meta:resourcekey="TFStartTimeResource1">
                                    <ItemTemplate>
                                        <asp:Label ID="lblStartTime" runat="server" meta:resourcekey="lblStartTimeResource1"></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle Wrap="False" />
                                    <ItemStyle Wrap="False" Width="150px" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="加班時間(訖)" SortExpression="END_TIME" meta:resourcekey="TFEndTimeResource1">
                                    <ItemTemplate>
                                        <asp:Label ID="lblEndTime" runat="server" meta:resourcekey="lblEndTimeResource1"></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle Wrap="False" />
                                    <ItemStyle Wrap="False" Width="150px" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="扣除時數" SortExpression="EXCLUDE_TYPE" meta:resourcekey="TFExcludeTypeResource1">
                                    <ItemTemplate>
                                        <asp:Label ID="lblExcludeType" runat="server" meta:resourcekey="lblExcludeTypeResource1"></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle Wrap="False" />
                                    <ItemStyle Width="100px" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="刷卡資料" SortExpression="PUNCH_CHECK" meta:resourcekey="TFPunchCheckResource1">
                                    <ItemTemplate>
                                        <asp:Label ID="lblPunchCheck" runat="server" meta:resourcekey="lblPunchCheckResource1"></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle Wrap="False" />
                                    <ItemStyle Wrap="False" Width="7%" />
                                </asp:TemplateField>
                                <asp:BoundField HeaderText="事由" DataField="REMARK" SortExpression="REMARK" meta:resourcekey="BFRemarkResource1">
                                    <HeaderStyle Wrap="False" />
                                    <ItemStyle Width="150px" />
                                </asp:BoundField>
                                <asp:TemplateField HeaderText="加班時數" SortExpression="CAL_RESULT" meta:resourcekey="TFCalResultResource1">
                                    <ItemTemplate>
                                        <asp:Label ID="lblCalResult" runat="server" meta:resourcekey="lblCalResultResource1"></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle Wrap="False" />
                                    <ItemStyle Wrap="False" HorizontalAlign="Right" Width="5%" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="驗證結果" SortExpression="STATE" meta:resourcekey="TFStateResource1">
                                    <ItemTemplate>
                                        <asp:Label ID="lblState" runat="server" meta:resourcekey="lblStateResource1"></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle Wrap="False" />
                                    <ItemStyle HorizontalAlign="Center" Wrap="False" Width="5%" />
                                </asp:TemplateField>
                                <asp:BoundField HeaderText="錯誤訊息" DataField="ERROR_MESSAGE" SortExpression="ERROR_MESSAGE" meta:resourcekey="BFErrorMessageResource1">
                                    <HeaderStyle Wrap="False" />
                                    <ItemStyle Width="500px" />
                                </asp:BoundField>
                            </Columns>
                        </Ede:Grid>
                    </td>
                </tr>
            </table>
        </ContentTemplate>
    </asp:UpdatePanel>

    <div runat="server" id="divResource" style="display: none;">
        <asp:Label ID="lblApplyWord" runat="server" Text="申請人數:{0}  成功人數:{1}  失敗人數:{2}" Visible="False" meta:resourcekey="lblApplyWordResource1"></asp:Label>
        <asp:Label ID="lblOTtypePayment" runat="server" Text="轉加班費" Visible="False" meta:resourcekey="lblOTtypePaymentResource1"></asp:Label>
        <asp:Label ID="lblOTtypeTimeOff" runat="server" Text="轉補休" Visible="False" meta:resourcekey="lblOTtypeTimeOffResource1"></asp:Label>
        <asp:Label ID="lblMeatAllowenceYes" runat="server" Text="依HR系統誤餐費設定" Visible="False" meta:resourcekey="lblMeatAllowenceYesResource1"></asp:Label>
        <asp:Label ID="lblMeatAllowenceNo" runat="server" Text="不支領" Visible="False" meta:resourcekey="lblMeatAllowenceNoResource1"></asp:Label>
        <asp:CheckBoxList ID="cblExcludeHours" runat="server" RepeatDirection="Horizontal" meta:resourcekey="cblExcludeHoursResource1">
            <asp:ListItem Text="午餐" Value="Lunch|1" meta:resourcekey="cblExcludeHoursLunchResource1"></asp:ListItem>
            <asp:ListItem Text="晚餐" Value="Dinner|2" meta:resourcekey="cblExcludeHoursDinnerResource1"></asp:ListItem>
            <asp:ListItem Text="宵夜" Value="Supper|4" meta:resourcekey="cblExcludeHoursSupperResource1"></asp:ListItem>
            <asp:ListItem Text="其他" Value="Other|8" meta:resourcekey="cblExcludeHoursOtherResource1"></asp:ListItem>
        </asp:CheckBoxList>
        <asp:Label ID="lblPunchCheckYes" runat="server" Text="依104設定" Visible="False" meta:resourcekey="lblPunchCheckYesResource1"></asp:Label>
        <asp:Label ID="lblPunchCheckNo" runat="server" Text="不需檢查" Visible="False" meta:resourcekey="lblPunchCheckNoNoResource1"></asp:Label>
        <asp:Label ID="lblCalResulting" runat="server" Text="待計算" Visible="False" meta:resourcekey="lblCalResultingResource1"></asp:Label>
        <asp:Label ID="lblStatePass" runat="server" Text="成功" Visible="False" meta:resourcekey="lblStatePassResource1"></asp:Label>
        <asp:Label ID="lblStateFail" runat="server" Text="失敗" Visible="False" meta:resourcekey="lblStateFailResource1"></asp:Label>
    </div>
</asp:Content>
