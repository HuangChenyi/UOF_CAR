<%@ Page Title="" Language="C#" MasterPageFile="~/Master/DefaultMasterPage.master" AutoEventWireup="true" CodeBehind="ExportPunchDefault.aspx.cs" Inherits="Ede.Uof.Web.HR104.Punch.ExportPunchDefault" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" %>

<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="EdeGrid" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script type="text/javascript">
        function RadToolBarExportPunch_Click(sendser, args) {
            var value = args.get_item().get_value();

            var toolBar = $find("<%= RadToolBarExportPunch.ClientID %>");
            var toolbarbutton = toolBar.findItemByValue("QueryCondition")
            var rdStart = toolbarbutton.findControl("rdStart");
            var rdEnd = toolbarbutton.findControl("rdEnd");

            var startDate = rdStart.get_selectedDate();
            if (startDate != null) startDate = startDate.format('yyyy/MM/dd');

            var endDate = rdEnd.get_selectedDate();
            if (endDate != null) endDate = endDate.format('yyyy/MM/dd');

            if (value === "Manual") {
                if (!confirm('<%=lblRunExportPunch.Text %>' +'<%=lblPunchRange.Text %>'+ startDate + '~' + endDate)) {
                    args.set_cancel(true);
                }
            }
            else if (value === "DeleteRecord") {
                if (!confirm('<%=lblDelRecordConfirm.Text %>')) {
                    args.set_cancel(true);
                }
            }
        }

        function DownloadFile(url) {
            window.open(url, "_self");
        }
    </script>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <telerik:RadToolBar ID="RadToolBarExportPunch" runat="server" SingleClick="None" Width="1024px" OnButtonClick="RadToolBarExportPunch_ButtonClick" OnClientButtonClicking="RadToolBarExportPunch_Click" meta:resourcekey="RadToolBarExportPunchResource1">
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
                                        <asp:Label ID="Label3" runat="server" Text="狀態:" meta:resourcekey="Label3Resource1"></asp:Label>
                                    </td>
                                    <td>&nbsp;</td>
                                    <td>
                                        <asp:DropDownList ID="ddlStatus" runat="server" meta:resourcekey="ddlStatusResource1">
                                            <asp:ListItem Text="全部" Value="ALL" meta:resourcekey="ListItemResource1"></asp:ListItem>
                                            <asp:ListItem Text="處理中" Value="Process" meta:resourcekey="ListItemResource2"></asp:ListItem>
                                            <asp:ListItem Text="成功" Value="Success" meta:resourcekey="ListItemResource3"></asp:ListItem>
                                            <asp:ListItem Text="失敗" Value="Fail" meta:resourcekey="ListItemResource4"></asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                    <td>&nbsp;</td>
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
                    <telerik:RadToolBarButton runat="server" Text="手動匯出" Value="Manual"
                        ClickedImageUrl="~/Common/Images/Icon/icon_m144.gif" DisabledImageUrl="~/Common/Images/Icon/icon_m144.gif"
                        HoveredImageUrl="~/Common/Images/Icon/icon_m144.gif" ImageUrl="~/Common/Images/Icon/icon_m144.gif" meta:resourcekey="RadToolBarButtonResource4">
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton runat="server" IsSeparator="True" meta:resourcekey="RadToolBarButtonResource5">
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton runat="server" Text="刪除記錄" Value="DeleteRecord"
                        ClickedImageUrl="~/Common/Images/Icon/icon_m03.gif" DisabledImageUrl="~/Common/Images/Icon/icon_m03.gif"
                        HoveredImageUrl="~/Common/Images/Icon/icon_m03.gif" ImageUrl="~/Common/Images/Icon/icon_m03.gif" meta:resourcekey="RadToolBarButtonResource6">
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton runat="server" IsSeparator="True" meta:resourcekey="RadToolBarButtonResource7">
                    </telerik:RadToolBarButton>
                </Items>
            </telerik:RadToolBar>
            <EdeGrid:Grid ID="ExportRecordGrid" runat="server" AutoGenerateCheckBoxColumn="True" Width="1024px" AllowSorting="True" AutoGenerateColumns="False" CustomDropDownListPage="False" DataKeyOnClientWithCheckBox="False"
                DefaultSortColumnName="CREATE_DATE" DefaultSortDirection="Descending" EmptyDataText="No data found" EnhancePager="True" KeepSelectedRows="False" PageSize="15" SelectedRowColor="" UnSelectedRowColor=""
                OnPageIndexChanging="ExportRecordGrid_PageIndexChanging" OnSorting="ExportRecordGrid_Sorting" OnRowDataBound="ExportRecordGrid_RowDataBound" DataKeyNames="EXPORT_GUID" AllowPaging="True" meta:resourcekey="ExportRecordGridResource1">
                <EnhancePagerSettings ShowHeaderPager="True" FirstAltImageUrl="" FirstImageUrl="" LastAltImage="" LastImageUrl="" NextIAltImageUrl="" NextImageUrl="" PageInfoCssClass="" PageNumberCssClass="" PageNumberCurrentCssClass="" PageRedirectCssClass="" PreviousAltImageUrl="" PreviousImageUrl=""></EnhancePagerSettings>

                <ExportExcelSettings AllowExportToExcel="False"></ExportExcelSettings>
                <Columns>
                    <asp:TemplateField HeaderText="執行時間" SortExpression="CREATE_DATE" meta:resourcekey="TemplateFieldResource4">
                        <ItemTemplate>
                            <asp:Label ID="lblDate" runat="server" Text='<%# Bind("CREATE_DATE") %>' meta:resourcekey="lblDateResource1"></asp:Label>
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
                    <asp:TemplateField HeaderText="狀態" SortExpression="EXPORT_STATUS" meta:resourcekey="TemplateFieldResource2">
                        <ItemTemplate>
                            <asp:Label ID="lblStatus" runat="server" Text='<%# Bind("EXPORT_STATUS") %>' meta:resourcekey="lblStatusResource1"></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle Wrap="False" HorizontalAlign="Center" Width="100px" />
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="公司別" SortExpression="COMPANY_NAME" meta:resourcekey="TemplateFieldResource5">
                        <ItemTemplate>
                            <asp:Label ID="lblCompanyName" Text='<%# Bind("COMPANY_NAME") %>' runat="server"></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle Wrap="False" Width="100px" />
                        <ItemStyle Wrap="False" />
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="操作" meta:resourcekey="TemplateFieldResource3">
                        <ItemTemplate>
                            <asp:LinkButton ID="lbtnDownload" runat="server" Text="下載" OnClick="lbtnDownload_Click" meta:resourcekey="lbtnDownloadResource1"></asp:LinkButton>
                            <asp:LinkButton ID="lbtnError" runat="server" Text="訊息" meta:resourcekey="lbtnErrorResource1"></asp:LinkButton>
                        </ItemTemplate>
                        <HeaderStyle Wrap="False" Width="100px" />
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
    <asp:Label ID="lblProcessMessage" runat="server" Text="已有匯出排程執行中" Visible="False" meta:resourcekey="lblProcessMessageResource1"></asp:Label>
    <asp:Label ID="lblMsgTask" runat="server" Text="排程" Visible="False" meta:resourcekey="lblMsgTaskResource1"></asp:Label>
    <asp:Label ID="lblDelRecordConfirm" runat="server" Text="確定要刪除勾選的記錄嗎?" Visible="False" meta:resourcekey="lblDelRecordConfirmResource2"></asp:Label>
    <asp:Label ID="lblRunExportPunch" runat="server" Text="確定要匯出刷卡資料嗎?" Visible="False" meta:resourcekey="lblRunExportPunchResource1"></asp:Label>
    <asp:Label ID="lblPunchRange" runat="server" Text="匯出範圍為:" Visible="False" meta:resourcekey="lblPunchRangeResource1"></asp:Label>
    <asp:Label ID="lblDialogTitleLogDetail" runat="server" Text="訊息" Visible="False" meta:resourcekey="lblDialogTitleLogDetailResource1"></asp:Label>
    <asp:HiddenField ID="hfCurrentUser" runat="server" />
</asp:Content>
