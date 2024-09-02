<%@ Page Title="" Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" CodeBehind="VerifyFlowExcelDownload.aspx.cs" Inherits="Ede.Uof.Web.WKF.FormManagement.VerifyFlowExcelDownload" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" %>

<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Ede" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <script>
        function tbSearch_ClientButtonClicking(sender, args) {

            var value = args.get_item().get_value();

            if (value == "Delete") {
                if (confirm('<%=Ede.Uof.Utility.Page.Common.Resource.GetResource("Common","ConfirmDelete") %>') == false) {
                    args.set_cancel(true);
                }
            }
        }
    </script>

    <table style="width: 100%">
        <tr>
            <td>
                <telerik:RadToolBar ID="tbSearch" runat="server" Width="100%" OnButtonClick="tbSearch_ButtonClick" OnClientButtonClicking="tbSearch_ClientButtonClicking">
                    <Items>
                        <telerik:RadToolBarButton runat="server" Value="ExportTime">
                            <ItemTemplate>
                                <table>
                                    <tr>
                                        <td>&nbsp;<asp:Label runat="server" Text="匯出時間：" meta:resourcekey="tbSearchLabel1Resource1"></asp:Label>
                                        </td>
                                        <td>
                                            <table>
                                                <tr>
                                                    <td>
                                                        <telerik:RadDatePicker ID="rdpStartTime" runat="server"></telerik:RadDatePicker>
                                                    </td>
                                                    <td style="padding-left: 3px; padding-right: 3px;">
                                                        <asp:Label ID="Label1" runat="server" Text="~"></asp:Label>
                                                    </td>
                                                    <td>
                                                        <telerik:RadDatePicker ID="rdpEndTime" runat="server"></telerik:RadDatePicker>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                </table>
                            </ItemTemplate>
                        </telerik:RadToolBarButton>
                        <telerik:RadToolBarButton runat="server" IsSeparator="True" Image="~/App_Themes/DefaultTheme/images/toolbarSp.jpg">
                        </telerik:RadToolBarButton>
                        <telerik:RadToolBarButton runat="server" Text="查詢"
                            ImageUrl="~/Common/Images/Icon/icon_m39.gif"
                            HoveredImageUrl="~/Common/Images/Icon/icon_m39.gif"
                            DisabledImageUrl="~/Common/Images/Icon/icon_m39.gif"
                            CheckedImageUrl="~/Common/Images/Icon/icon_m39.gif"
                            Value="Query"
                            meta:resourcekey="tbSearchBtnResource1">
                        </telerik:RadToolBarButton>
                        <telerik:RadToolBarButton runat="server" IsSeparator="True" Image="~/App_Themes/DefaultTheme/images/toolbarSp.jpg">
                        </telerik:RadToolBarButton>
                        <telerik:RadToolBarButton runat="server" Text="刪除"
                            ImageUrl="~/Common/Images/Icon/icon_m03.gif"
                            HoveredImageUrl="~/Common/Images/Icon/icon_m03.gif"
                            DisabledImageUrl="'~/Common/Images/Icon/icon_m03.gif"
                            CheckedImageUrl="~/Common/Images/Icon/icon_m03.gif"
                            Value="Delete"
                            meta:resourcekey="tbSearchBtnResource2">
                        </telerik:RadToolBarButton>
                        <telerik:RadToolBarButton runat="server" IsSeparator="True" Image="~/App_Themes/DefaultTheme/images/toolbarSp.jpg">
                        </telerik:RadToolBarButton>
                        <telerik:RadToolBarButton runat="server" Value="ErrorMsg">
                            <ItemTemplate>
                                <asp:CustomValidator ID="cvCheckTime" runat="server"></asp:CustomValidator>
                            </ItemTemplate>
                        </telerik:RadToolBarButton>
                    </Items>
                </telerik:RadToolBar>
            </td>
        </tr>
        <tr>
            <td>
                <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <Ede:Grid ID="gridExport" runat="server"
                            AllowPaging="True"
                            AllowSorting="True"
                            AutoGenerateCheckBoxColumn="True"
                            AutoGenerateColumns="False"
                            DataKeyNames="EXPORT_ID, EXPORT_FILE_GROUP_ID"
                            DataKeyOnClientWithCheckBox="False"
                            DefaultSortDirection="Descending"
                            DefaultSortColumnName="EXPORT_TIME"
                            EmptyDataText="沒有資料"
                            EnhancePager="True"
                            KeepSelectedRows="False"
                            CustomDropDownListPage="False"
                            Width="100%"
                            SelectedRowColor=""
                            UnSelectedRowColor=""
                            OnRowDataBound="gridExport_RowDataBound"
                            OnPageIndexChanging="gridExport_PageIndexChanging"
                            OnSorting="gridExport_Sorting" meta:resourcekey="gridExportResource1" PageSize="15">
                            <EnhancePagerSettings ShowHeaderPager="True"></EnhancePagerSettings>
                            <ExportExcelSettings AllowExportToExcel="False"></ExportExcelSettings>
                            <Columns>
                                <asp:BoundField DataField="EXPORT_ID" HeaderText="匯出代號" Visible="False" meta:resourcekey="BoundFieldResource1">
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:BoundField>
                                <asp:TemplateField HeaderText="匯出時間" SortExpression="EXPORT_TIME" meta:resourcekey="TemplateFieldResource1">
                                    <ItemTemplate>
                                        <asp:Label ID="lblExportTime" runat="server"></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle HorizontalAlign="Center" Wrap="False" />
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="檔名" meta:resourcekey="TemplateFieldResource2">
                                    <ItemTemplate>
                                        <asp:Image ID="imgExportFileName" runat="server" />
                                        <asp:HyperLink ID="hLinkExportFileName" runat="server" NavigateUrl='<%# "~/Common/FileCenter/DownloadFile.aspx?id="+Eval("EXPORT_FILE_ID") %>'><%# Eval("EXPORT_FILE_NAME") %></asp:HyperLink>
                                        <asp:Label ID="lblExportFileName" runat="server"></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle HorizontalAlign="Center" Wrap="False" />
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="匯出者" meta:resourcekey="TemplateFieldResource3">
                                    <ItemTemplate>
                                        <asp:Label ID="lblExportUser" runat="server"></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle HorizontalAlign="Center" Wrap="False" />
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="匯出狀態" meta:resourcekey="TemplateFieldResource4">
                                    <ItemTemplate>
                                        <asp:Label ID="lblExportStatus" runat="server" Visible="false"></asp:Label>
                                        <asp:LinkButton ID="lbtnFail" runat="server" Text="失敗" Visible="False" meta:resourcekey="lbtnFailResource1"></asp:LinkButton>
                                    </ItemTemplate>
                                    <HeaderStyle HorizontalAlign="Center" Wrap="False" />
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:TemplateField>
                            </Columns>
                            <HeaderStyle HorizontalAlign="Center" Wrap="False"></HeaderStyle>
                        </Ede:Grid>
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="tbSearch" EventName="ButtonClick"></asp:AsyncPostBackTrigger>
                    </Triggers>
                </asp:UpdatePanel>
            </td>
        </tr>
    </table>

    <asp:Label ID="lblSuccess" runat="server" Text="成功" Visible="False" meta:resourcekey="lblSuccessResource1"></asp:Label>
    <asp:Label ID="lblFail" runat="server" Text="失敗" Visible="False" meta:resourcekey="lblFailResource1"></asp:Label>
    <asp:Label ID="lblProcess" runat="server" Text="處理中" Visible="False" meta:resourcekey="lblProcessResource1"></asp:Label>

    <asp:Label ID="lblCvMsgEndAfterStart" runat="server" Text="結束時間需晚於開始時間" Visible="False" meta:resourcekey="lblCvMsgEndAfterStartResource1"></asp:Label>
    <asp:Label ID="lblCvMsgChooseStart" runat="server" Text="請輸入查詢日期（起）" Visible="False" meta:resourcekey="lblCvMsgChooseStartResource1"></asp:Label>
    <asp:Label ID="lblCvMsgChooseEnd" runat="server" Text="請輸入查詢日期（訖）" Visible="False" meta:resourcekey="lblCvMsgChooseEndResource1"></asp:Label>
    <asp:Label ID="lblTitleFailReason" runat="server" Text="匯出失敗原因" Visible="False" meta:resourcekey="lblProcessResource1"></asp:Label>
    
</asp:Content>
