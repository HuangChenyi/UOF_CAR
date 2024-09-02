<%@ Page Title="" Language="C#" MasterPageFile="~/Master/DefaultMasterPage.master" AutoEventWireup="true" CodeBehind="OverAttendManage.aspx.cs" Inherits="Ede.Uof.Web.HR104.Duty.Manage.OverAttendManage" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" %>
<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="EdeGrid" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script type="text/javascript">
        function rtbOverAttendClick(sendser, args) {
            var value = args.get_item().get_value();
            var toolBar = $find("<%= rtbOverAttend.ClientID %>");

            //手動起單
            if (value === "ExecuteForm") {
                var result = $uof.pageMethod.sync("CheckEnableExecuteForm", []);//檢查是否允許起單
                if (result === "True") {
                    args.set_cancel(true);
                    $uof.dialog.open2("~/HR104/Duty/Manage/OverAttendExecuteForm.aspx", args.get_item(), '<%=lblDialogTitleExecuteForm.Text%>', 780, 450, openDialogResult);
                }
                else {
                    alert('<%=lblProcessTaskMsg.Text %>')
                    args.set_cancel(true);
                }
            }
        }

        function openDialogResult(returnValue) {

            if (returnValue === '' || returnValue === null)
                return false;
            else
                return true;
        }
    </script>

    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <telerik:RadToolBar ID="rtbOverAttend" runat="server" SingleClick="None" Width="1024px" OnButtonClick="rtbOverAttend_ButtonClick" OnClientButtonClicking="rtbOverAttendClick" meta:resourcekey="RadToolBar1Resource1">
                <Items>
                    <telerik:RadToolBarButton runat="server" Text="查詢" Value="Query"
                        ClickedImageUrl="~/Common/Images/Icon/icon_m39.png" DisabledImageUrl="~/Common/Images/Icon/icon_m39.png"
                        HoveredImageUrl="~/Common/Images/Icon/icon_m39.png" ImageUrl="~/Common/Images/Icon/icon_m39.png" meta:resourcekey="RadToolBarButtonResource2">
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton runat="server" IsSeparator="True" meta:resourcekey="RadToolBarButtonResource3">
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton runat="server" Text="手動起單" Value="ExecuteForm"
                        ClickedImageUrl="~/Common/Images/Icon/icon_m95.gif" DisabledImageUrl="~/Common/Images/Icon/icon_m95.gif"
                        HoveredImageUrl="~/Common/Images/Icon/icon_m95.gif" ImageUrl="~/Common/Images/Icon/icon_m95.gif" meta:resourcekey="RadToolBarButtonResource9">
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton runat="server" IsSeparator="True" meta:resourcekey="RadToolBarButtonResource7">
                    </telerik:RadToolBarButton>
                </Items>
            </telerik:RadToolBar>
            <table class="PopTable" style="width: 1024px">
                <tr>
                    <td>
                        <asp:Label ID="lblExcuteDate" runat="server" Text="執行時間" meta:resourcekey="lblExcuteDateResource1"></asp:Label>
                    </td>
                    <td style="width: 40%">
                        <table>
                            <tr>
                                <td>
                                    <telerik:RadDatePicker ID="rdStartDate" runat="server"  meta:resourcekey="rdStartDateResource1">
                                    </telerik:RadDatePicker>
                                </td>
                                <td>
                                    <asp:Label ID="Label2" runat="server" Text="~" meta:resourcekey="Label2Resource1"></asp:Label>
                                </td>
                                <td>
                                    <telerik:RadDatePicker ID="rdEndDate" runat="server"  meta:resourcekey="rdEndDateResource1">
                                    </telerik:RadDatePicker>
                                </td>
                            </tr>
                        </table>
                    </td>
                    <td>
                        <asp:Label ID="lblStateTitle" runat="server" Text="狀態" meta:resourcekey="lblStateTitleResource1"></asp:Label>
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlStatus" runat="server" meta:resourcekey="ddlStatusResource1">
                            <asp:ListItem Text="全部" Value="All" meta:resourcekey="liStatusAllResource1"></asp:ListItem>
                            <asp:ListItem Text="完成" Value="Success" meta:resourcekey="liStatusSuccessResource1"></asp:ListItem>
                            <asp:ListItem Text="處理中" Value="Process" meta:resourcekey="liStatusProcessResource1"></asp:ListItem>
                            <asp:ListItem Text="失敗" Value="Fail" meta:resourcekey="liStatusFailResource1"></asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblExecuterTitle" runat="server" Text="執行者" meta:resourcekey="lblExecuterTitleResource1"></asp:Label>
                    </td>
                    <td colspan="3">
                        <asp:TextBox ID="txtExcuter" runat="server" meta:resourcekey="txtExcuterResource1"></asp:TextBox>
                    </td>
                </tr>
            </table>

            <EdeGrid:Grid ID="grdOverAttendExecute" runat="server" Width="1024px" AutoGenerateCheckBoxColumn="False" AutoGenerateColumns="False" 
                CustomDropDownListPage="False" DataKeyOnClientWithCheckBox="False" DataKeyNames="MASTER_GUID" OnRowDataBound="grdOverAttendExecute_RowDataBound" 
                EmptyDataText="No data found" EnhancePager="True" KeepSelectedRows="False" SelectedRowColor="" UnSelectedRowColor="" 
                AllowSorting="True" DefaultSortColumnName="CREATE_DATE" DefaultSortDirection="Descending" OnSorting="grdOverAttendExecute_Sorting"  
                AllowPaging="True" PageSize="15" OnPageIndexChanging="grdOverAttendExecute_PageIndexChanging" meta:resourcekey="grdOverAttendExecuteResource1">
                <EnhancePagerSettings ShowHeaderPager="True"></EnhancePagerSettings>
                <ExportExcelSettings AllowExportToExcel="False"></ExportExcelSettings>
                <Columns>
                    <asp:TemplateField HeaderText="執行時間" SortExpression="CREATE_DATE" meta:resourcekey="TemplateFieldResource4">
                        <ItemTemplate>
                            <asp:Label ID="lblExecuteDate" runat="server" Text='<%#: Bind("CREATE_DATE") %>' meta:resourcekey="lblExecuteDateResource1"></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle Wrap="False" Width="200px" />
                        <ItemStyle HorizontalAlign="Center" Wrap="False" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="執行者" SortExpression="CREATOR" meta:resourcekey="TemplateFieldResource1">
                        <ItemTemplate>
                            <asp:Label ID="lblCreator" runat="server" meta:resourcekey="lblExecuterResource1"></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle Wrap="False" Width="250px" />
                        <ItemStyle Wrap="False" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="超時出勤期間" meta:resourcekey="TemplateFieldResource5">
                        <ItemTemplate>
                            <asp:Label ID="lblExecuteRange" runat="server" meta:resourcekey="lblExecuteRangeResource1"></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle Wrap="False" Width="300px" />
                        <ItemStyle Wrap="False" HorizontalAlign="Center" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="狀態" SortExpression="TASK_STATUS" meta:resourcekey="TemplateFieldResource2">
                        <ItemTemplate>
                            <asp:Label ID="lblStatus" runat="server" Text='<%#: Bind("TASK_STATUS") %>' meta:resourcekey="lblStatusResource1"></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle Wrap="False" HorizontalAlign="Center" Width="100px" />
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="操作" meta:resourcekey="TemplateFieldResource3">
                        <ItemTemplate>
                            <asp:LinkButton ID="lbtnDetail" runat="server" Text="明細" meta:resourcekey="lbtnDetailResource1"></asp:LinkButton>
                            &nbsp;&nbsp;
                            <asp:LinkButton ID="lbtnError" runat="server" Text="訊息" meta:resourcekey="lbtnErrorResource1"></asp:LinkButton>
                        </ItemTemplate>
                        <HeaderStyle Wrap="False" Width="100px" HorizontalAlign="Center" />
                        <ItemStyle Wrap="False" HorizontalAlign="Center" />
                    </asp:TemplateField>
                </Columns>
            </EdeGrid:Grid>
        </ContentTemplate>
    </asp:UpdatePanel>

    <asp:Label ID="lblStatusSuccess" runat="server" Text="完成" Visible="False" meta:resourcekey="lblStatusSuccessResource1"></asp:Label>
    <asp:Label ID="lblStatusFail" runat="server" Text="失敗" Visible="False" meta:resourcekey="lblStatusFailResource1"></asp:Label>
    <asp:Label ID="lblStatusProcess" runat="server" Text="處理中" Visible="False" meta:resourcekey="lblStatusProcessResource1"></asp:Label>
    <asp:Label ID="lblDialogTitleExecuteForm" runat="server" Text="手動起單" Visible="False" meta:resourcekey="lblDialogTitleExecuteFormResource1"></asp:Label>
    <asp:Label ID="lblDialogTitleLog" runat="server" Text="錯誤訊息" Visible="False" meta:resourcekey="lblDialogTitleLogResource1"></asp:Label>
    <asp:Label ID="lblDialogTitleDetail" runat="server" Text="明細" Visible="False" meta:resourcekey="lblDialogTitleDetailResource1"></asp:Label>
    <asp:Label ID="lblProcessTaskMsg" runat="server" Text="已有起單排程處理中" Visible="False" meta:resourcekey="lblProcessTaskMsgResource1"></asp:Label>
    <asp:Label ID="lblTask" runat="server" Text="排程" Visible="False" meta:resourcekey="lblTaskResource1"></asp:Label>
    <asp:HiddenField ID="hfCurrentUser" runat="server" />
</asp:Content>
