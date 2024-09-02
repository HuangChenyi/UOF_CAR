<%@ Page Title="" Language="C#" MasterPageFile="~/Master/DefaultMasterPage.master" AutoEventWireup="true" CodeBehind="SyncHRDefault.aspx.cs" Inherits="Ede.Uof.Web.HR104.SyncHR.SyncHRDefault" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" %>

<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="EdeGrid" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script type="text/javascript">
        function RadToolBar1_Click(sendser, args) {

            var value = args.get_item().get_value();

            var toolBar = $find("<%= RadToolBar1.ClientID %>");
            var toolbarbutton = toolBar.findItemByValue("QueryCondition")
            var rdStart = toolbarbutton.findControl("rdStart");
            var rdEnd = toolbarbutton.findControl("rdEnd");

            var startDate = rdStart.get_selectedDate();
            if (startDate != null) startDate = startDate.format('yyyy/MM/dd');

            var endDate = rdEnd.get_selectedDate();
            if (endDate != null) endDate = endDate.format('yyyy/MM/dd');

            var result = $uof.pageMethod.sync("GetHREnable", []);
            var status = $uof.pageMethod.sync("GetSyncStatus", []);

            if (value === "DeleteRecord") {
                if (!confirm('<%=lblDelIPConfirm.Text %>')) {
                    args.set_cancel(true);
                }
            }
            else if (value === "ManualSync") {

                if (result === "true") {
                    args.set_cancel(true);
                    if (status === "false") {
                        $uof.dialog.open2("~/HR104/SyncHR/ExecuteSyncHR.aspx", args.get_item(), '<%=lblDialogTitle.Text%>', 600, 450, openDialogResult);
                    }
                    else {
                        confirm('<%=lblProcessMessage.Text %>');
                    }
                }
                else {
                    confirm('<%=lblEnableHR104.Text %>')
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
            <telerik:RadToolBar ID="RadToolBar1" runat="server" SingleClick="None"  Width="1024px" OnButtonClick="RadToolBar1_ButtonClick" OnClientButtonClicking="RadToolBar1_Click" meta:resourcekey="RadToolBar1Resource1">
                <Items>
                    <telerik:RadToolBarButton runat="server" Value="QueryCondition" meta:resourcekey="RadToolBarButtonResource1">
                        <ItemTemplate>
                            <table>
                                <tr>
                                    <td>
                                        <asp:Label ID="Label1" runat="server" Text="執行時間:" meta:resourcekey="Label1Resource1"></asp:Label>
                                    </td>
                                    <td>&nbsp;</td>
                                    <td>
                                        <telerik:RadDatePicker ID="rdStart" runat="server" meta:resourcekey="rdStartResource1">
                                        </telerik:RadDatePicker>
                                    </td>
                                    <td>
                                        <asp:Label ID="Label2" runat="server" Text="~" meta:resourcekey="Label2Resource1"></asp:Label>
                                    </td>
                                    <td>
                                        <telerik:RadDatePicker ID="rdEnd" runat="server" meta:resourcekey="rdEndResource1">
                                        </telerik:RadDatePicker>
                                    </td>
                                    <td>&nbsp;</td>
                                    <td>
                                        <asp:Label ID="Label4" runat="server" Text="類型:" meta:resourcekey="Label4Resource1"></asp:Label>
                                    </td>
                                    <td>&nbsp;</td>
                                    <td>
                                        <asp:DropDownList ID="ddlSyncItem" runat="server" meta:resourcekey="ddlSyncItemResource1">
                                            <asp:ListItem Text="全部" Value="ALL" meta:resourcekey="ListItemResource1"></asp:ListItem>
                                            <asp:ListItem Text="部門" Value="Dept" meta:resourcekey="ListItemResource2"></asp:ListItem>
                                            <asp:ListItem Text="人員" Value="User" meta:resourcekey="ListItemResource3"></asp:ListItem>
                                            <asp:ListItem Text="職級" Value="JobTitle" meta:resourcekey="ListItemResource14"></asp:ListItem>
                                            <asp:ListItem Text="職務" Value="JobFunc" meta:resourcekey="ListItemResource15"></asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                    <td>&nbsp;</td>
                                    <td>
                                        <asp:Label ID="Label3" runat="server" Text="狀態:" meta:resourcekey="Label3Resource1"></asp:Label>
                                    </td>
                                    <td>&nbsp;</td>
                                    <td>
                                        <asp:DropDownList ID="ddlStatus" runat="server" meta:resourcekey="ddlStatusResource1">
                                            <asp:ListItem Text="全部" Value="ALL" meta:resourcekey="ListItemResource4"></asp:ListItem>
                                            <asp:ListItem Text="處理中" Value="Process" meta:resourcekey="ListItemResources5"></asp:ListItem>
                                            <asp:ListItem Text="成功" Value="Success" meta:resourcekey="ListItemResource6"></asp:ListItem>
                                            <asp:ListItem Text="失敗" Value="Fail" meta:resourcekey="ListItemResource7"></asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                            </table>
                        </ItemTemplate>
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton runat="server" Text="查詢" Value="Query"
                        ClickedImageUrl="~/Common/Images/Icon/icon_m39.png" DisabledImageUrl="~/Common/Images/Icon/icon_m39.png"
                        HoveredImageUrl="~/Common/Images/Icon/icon_m39.png" ImageUrl="~/Common/Images/Icon/icon_m39.png" meta:resourcekey="RadToolBarButtonResource2">
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton runat="server" IsSeparator="True" meta:resourcekey="RadToolBarButtonResource3">
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton runat="server" Text="刪除記錄" Value="DeleteRecord"
                        ClickedImageUrl="~/Common/Images/Icon/icon_m03.gif" DisabledImageUrl="~/Common/Images/Icon/icon_m03.gif"
                        HoveredImageUrl="~/Common/Images/Icon/icon_m03.gif" ImageUrl="~/Common/Images/Icon/icon_m03.gif" meta:resourcekey="RadToolBarButtonResource6">
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton runat="server" IsSeparator="True" meta:resourcekey="RadToolBarButtonResource7">
                    </telerik:RadToolBarButton>
                     <telerik:RadToolBarButton runat="server" Text="手動同步" Value="ManualSync"
                        ClickedImageUrl="~/Common/Images/Icon/icon_m95.gif" DisabledImageUrl="~/Common/Images/Icon/icon_m95.gif"
                        HoveredImageUrl="~/Common/Images/Icon/icon_m95.gif" ImageUrl="~/Common/Images/Icon/icon_m95.gif" meta:resourcekey="RadToolBarButtonResource9">
                     </telerik:RadToolBarButton>
                     <telerik:RadToolBarButton runat="server" IsSeparator="True" meta:resourcekey="RadToolBarButtonResource7">
                    </telerik:RadToolBarButton>
                </Items>
            </telerik:RadToolBar>
            <EdeGrid:Grid ID="syncGrid" runat="server" AutoGenerateCheckBoxColumn="True"  Width="1024px" AllowSorting="True" AutoGenerateColumns="False" CustomDropDownListPage="False" DataKeyOnClientWithCheckBox="False" DefaultSortDirection="Descending" EmptyDataText="No data found" EnhancePager="True" KeepSelectedRows="False" PageSize="15" SelectedRowColor="" UnSelectedRowColor="" DefaultSortColumnName="CREATE_DATE"
                OnPageIndexChanging="syncGrid_PageIndexChanging" OnSorting="syncGrid_Sorting" OnRowDataBound="syncGrid_RowDataBound" DataKeyNames="SYNC_GUID" AllowPaging="True" meta:resourcekey="Grid1Resource1">
                <EnhancePagerSettings ShowHeaderPager="True"></EnhancePagerSettings>
                <ExportExcelSettings AllowExportToExcel="False"></ExportExcelSettings>
                <Columns>
                    <asp:TemplateField HeaderText="執行時間" SortExpression="CREATE_DATE" meta:resourcekey="TemplateFieldResource4">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%#: Bind("CREATE_DATE") %>' meta:resourcekey="TextBox1Resource1"></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblDate" runat="server" Text='<%#: Bind("CREATE_DATE") %>' meta:resourcekey="lblDateResource1"></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle Wrap="False" Width="200px" />
                        <ItemStyle HorizontalAlign="Center" Wrap="False" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="執行者" SortExpression="NAME" meta:resourcekey="TemplateFieldResource1">
                        <ItemTemplate>
                            <asp:Label ID="lblName" runat="server" meta:resourcekey="lblNameResource1"></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle Wrap="False" Width="200px" />
                        <ItemStyle Wrap="False" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="類型" meta:resourcekey="TemplateFieldResource5">
                        <ItemTemplate>
                            <asp:Label ID="lblSyncItem" runat="server" meta:resourcekey="lblSyncItemResource1"></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle Wrap="False" Width="100px" />
                        <ItemStyle Wrap="False" HorizontalAlign="Center" />
                    </asp:TemplateField>
                     <asp:TemplateField HeaderText="同步期間設定" meta:resourcekey="TemplateFieldResources_1">
                        <ItemTemplate>
                            <asp:Label ID="lblIsSyncTime" runat="server" meta:resourcekey="lblIsSyncTimeResource1"></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle Wrap="False" Width="100px" />
                        <ItemStyle Wrap="False" HorizontalAlign="Center" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="狀態" meta:resourcekey="TemplateFieldResource2">
                        <ItemTemplate>
                            <asp:Label ID="lblStatus" runat="server" Text='<%#: Bind("SYNC_STATUS") %>' meta:resourcekey="lblStatusResource1"></asp:Label>
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
    <asp:Label ID="lblSuccess" runat="server" Text="成功" Visible="False" meta:resourcekey="lblSuccessResource1"></asp:Label>
    <asp:Label ID="lblProcess" runat="server" Text="處理中" Visible="False" meta:resourcekey="lblProcessResource1"></asp:Label>
    <asp:Label ID="lblDialogTitlelog" runat="server" Text="錯誤訊息" Visible="False" meta:resourcekey="lblDialogTitlelogResource1"></asp:Label>
    <asp:Label ID="lblFail" runat="server" Text="失敗" Visible="False" meta:resourcekey="lblFailResource1"></asp:Label>
    <asp:Label ID="lblProcessMessage" runat="server" Text="已有同步排程執行中" Visible="False" meta:resourcekey="lblProcessMessageResource1"></asp:Label>
    <asp:Label ID="lblMsgTask" runat="server" Text="排程" Visible="False" meta:resourcekey="lblMsgTaskResource1"></asp:Label>
    <asp:Label ID="lblDialogTitleDetail" runat="server" Text="明細" Visible="False" meta:resourcekey="lblDialogTitleDetailResource1"></asp:Label>
    <asp:Label ID="lblDialogTitleLogDetail" runat="server" Text="訊息" Visible="False" meta:resourcekey="lblDialogTitleLogDetailResource1"></asp:Label>
    <asp:Label ID="lblDelIPConfirm" runat="server" Text="確定要刪除勾選的記錄嗎?" Visible="False" meta:resourcekey="lblDelIPConfirmResource2" ></asp:Label>
    <asp:Label ID="lblDept" runat="server" Text="部門" Visible="False" meta:resourcekey="lblDeptResource1"></asp:Label>
    <asp:Label ID="lblUser" runat="server" Text="人員" Visible="False" meta:resourcekey="lblUserResource1"></asp:Label>
    <asp:Label ID="lblJobTitle" runat="server" Text="職級" Visible="False" meta:resourcekey="lblJobTitleResource1"></asp:Label>
    <asp:Label ID="lblJobFunc" runat="server" Text="職務" Visible="False" meta:resourcekey="lblJobFuncResource1"></asp:Label>
    <asp:Label ID="lblRunDeptSync" runat="server" Text="確定要同步部門資料嗎?" Visible="False" meta:resourcekey="lblRunDeptSyncResource1"></asp:Label>
    <asp:Label ID="lblRunUserSync" runat="server" Text="確定要同步人員資料嗎?" Visible="False" meta:resourcekey="lblRunUserSyncResource1"></asp:Label>
    <asp:Label ID="lblSyncRange" runat="server" Text="同步範圍為:" Visible="False" meta:resourcekey="lblSyncRangeResource1"></asp:Label>
    <asp:Label ID="lblEnableHR104" runat="server" Text="未啟用104組織同步，不可執行同步作業" Visible="False" meta:resourcekey="lblEnableHR104Resource1"></asp:Label>
    <asp:Label ID="lblDialogTitle" runat="server" Text="手動同步" Visible="False" meta:resourcekey="lblDialogTitleResource1"></asp:Label>
     <asp:Label ID="lblNoTimeMsg" runat="server" Text="不限" Visible="False" meta:resourcekey="lblNoTimeMsgResource1"></asp:Label>    
    <asp:HiddenField ID="hfCurrentUser" runat="server" />
</asp:Content>
