<%@ Page Title="" Language="C#" MasterPageFile="~/Master/DefaultMasterPage.master" AutoEventWireup="true" Inherits="EIP_Duty_YearLeaveDays_QueryPersonalYearLeaveDays" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" CodeBehind="QueryPersonalYearLeaveDays.aspx.cs" %>

<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <telerik:RadToolBar ID="RadToolBar1" runat="server" Width="100%" OnButtonClick="RadToolBar1_ButtonClick">
        <Items>
            <telerik:RadToolBarButton>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text="年度" meta:resourcekey="Label2Resource1"></asp:Label>
                </ItemTemplate>
            </telerik:RadToolBarButton>
            <telerik:RadToolBarButton runat="server" Value="Year">
                <ItemTemplate>
                    <asp:DropDownList ID="ddlLeaveYear" runat="server" meta:resourcekey="ddlLeaveYearResource1"></asp:DropDownList>
                </ItemTemplate>
            </telerik:RadToolBarButton>
            <telerik:RadToolBarButton IsSeparator="true" />
            <telerik:RadToolBarButton runat="server" CheckedImageUrl="~/Common/Images/Icon/icon_m39.gif" DisabledImageUrl="~/Common/Images/Icon/icon_m39.gif" HoveredImageUrl="~/Common/Images/Icon/icon_m39.gif" ImageUrl="~/Common/Images/Icon/icon_m39.gif" Text="查詢" Value="Query">
            </telerik:RadToolBarButton>
            <telerik:RadToolBarButton IsSeparator="true" />
        </Items>
    </telerik:RadToolBar>

    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <Fast:Grid ID="Grid1" runat="server" AutoGenerateCheckBoxColumn="False"
                AllowSorting="True" AutoGenerateColumns="False"
                DataKeyOnClientWithCheckBox="False" DefaultSortDirection="Ascending" EnhancePager="True"
                KeepSelectedRows="False" PageSize="15"
                OnRowDataBound="Grid1_RowDataBound" Width="100%"
                meta:resourcekey="Grid1Resource1" EmptyDataText="沒有資料" CustomDropDownListPage="False" SelectedRowColor="" UnSelectedRowColor="">
                <EnhancePagerSettings ShowHeaderPager="True" FirstAltImageUrl="" FirstImageUrl="" LastAltImage="" LastImageUrl="" NextIAltImageUrl="" NextImageUrl="" PageInfoCssClass="" PageNumberCssClass="" PageNumberCurrentCssClass="" PageRedirectCssClass="" PreviousAltImageUrl="" PreviousImageUrl=""></EnhancePagerSettings>

                <ExportExcelSettings AllowExportToExcel="False"></ExportExcelSettings>
                <Columns>
                    <asp:BoundField HeaderText="年度" DataField="YEAR"
                        meta:resourcekey="BoundFieldResource1">
                        <ItemStyle HorizontalAlign="Right" />
                    </asp:BoundField>
                    <asp:TemplateField HeaderText="總可休天(時)數"
                        meta:resourcekey="TemplateFieldResource1">
                        <ItemTemplate>
                            <asp:Label ID="lblAllHave" runat="server"
                                meta:resourcekey="lblAllHaveResource1"></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle Wrap="False" />
                        <ItemStyle HorizontalAlign="Right" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="總已休天(時)數"
                        meta:resourcekey="TemplateFieldResource2">
                        <ItemTemplate>
                            <asp:Label ID="lblAllUsed" runat="server"
                                meta:resourcekey="lblAllUsedResource1"></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle Wrap="False" />
                        <ItemStyle HorizontalAlign="Right" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="總未休天(時)數"
                        meta:resourcekey="TemplateFieldResource3">
                        <ItemTemplate>
                            <asp:Label ID="lblAllReminder" runat="server"
                                meta:resourcekey="lblAllReminderResource1"></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle Wrap="False" />
                        <ItemStyle HorizontalAlign="Right" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="本年度可休"
                        meta:resourcekey="TemplateFieldResource4">
                        <ItemTemplate>
                            <asp:Label ID="lblThisHave" runat="server"
                                meta:resourcekey="lblThisHaveResource1"></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle Wrap="False" />
                        <ItemStyle HorizontalAlign="Right" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="本年度已休"
                        meta:resourcekey="TemplateFieldResource5">
                        <ItemTemplate>
                            <asp:Label ID="lblThisUsed" runat="server"
                                meta:resourcekey="lblThisUsedResource1"></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle Wrap="False" />
                        <ItemStyle HorizontalAlign="Right" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="本年度未休"
                        meta:resourcekey="TemplateFieldResource6">
                        <ItemTemplate>
                            <asp:Label ID="lblThisReminder" runat="server"
                                meta:resourcekey="lblThisReminderResource1"></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle Wrap="False" />
                        <ItemStyle HorizontalAlign="Right" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="去年度保留"
                        meta:resourcekey="TemplateFieldResource7">
                        <ItemTemplate>
                            <asp:Label ID="lblLastHave" runat="server"
                                meta:resourcekey="lblLastHaveResource1"></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle Wrap="False" />
                        <ItemStyle HorizontalAlign="Right" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="去年度保留已休"
                        meta:resourcekey="TemplateFieldResource8">
                        <ItemTemplate>
                            <asp:Label ID="lblLastUsed" runat="server"
                                meta:resourcekey="lblLastUsedResource1"></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle Wrap="False" />
                        <ItemStyle HorizontalAlign="Right" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="去年度保留未休"
                        meta:resourcekey="TemplateFieldResource9">
                        <ItemTemplate>
                            <asp:Label ID="lblLastReminder" runat="server"
                                meta:resourcekey="lblLastReminderResource1"></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle Wrap="False" />
                        <ItemStyle HorizontalAlign="Right" />
                    </asp:TemplateField>
                </Columns>
            </Fast:Grid>
        </ContentTemplate>
    </asp:UpdatePanel>
    <br />
    <table style="width: 50%">
        <tr id="trDetailTitle" runat="server">
            <td class="PopTableHeader">
                <div style="text-align: center">
                    <asp:Label ID="lblDetailTitle" runat="server" Text="年休使用記錄" meta:resourcekey="lblDetailTitleResource1"></asp:Label>
                </div>
            </td>
        </tr>
        <tr>
            <td>
                <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                    <ContentTemplate>
                        <Fast:Grid ID="grdYearLeaveDaysDetail" runat="server" AutoGenerateCheckBoxColumn="False" AutoGenerateColumns="False" AllowSorting="True" AllowPaging="True"
                            CustomDropDownListPage="False" DataKeyOnClientWithCheckBox="False" DefaultSortDirection="Ascending" EmptyDataText="沒有資料"
                            EnhancePager="True" KeepSelectedRows="False" PageSize="15" SelectedRowColor="" UnSelectedRowColor="" Width="100%"
                            OnRowDataBound="grdYearLeaveDaysDetail_RowDataBound" DefaultSortColumnName="DOC_NBR" OnSorting="grdYearLeaveDaysDetail_Sorting" OnPageIndexChanging="grdYearLeaveDaysDetail_PageIndexChanging" meta:resourcekey="grdYearLeaveDaysDetailResource1">
                            <EnhancePagerSettings ShowHeaderPager="True" />
                            <ExportExcelSettings AllowExportToExcel="False" />
                            <Columns>
                                <asp:TemplateField HeaderText="請假單號" SortExpression="DOC_NBR" meta:resourcekey="TemplateFieldResource10">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="lbtnDocNbr" runat="server" Text='<%# Eval("DOC_NBR") %>' meta:resourcekey="lbtnDocNbrResource1"></asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="START_DATETIME" HeaderText="請假時間(起)" meta:resourcekey="BoundFieldResource2">
                                    <ItemStyle HorizontalAlign="Left" Wrap="False" />
                                </asp:BoundField>
                                <asp:BoundField DataField="END_DATETIME" HeaderText="請假時間(訖)" meta:resourcekey="BoundFieldResource3">
                                    <ItemStyle HorizontalAlign="Left" Wrap="False" />
                                </asp:BoundField>
                                <asp:TemplateField HeaderText="已休" meta:resourcekey="TemplateFieldResource11">
                                    <ItemTemplate>
                                        <asp:Label ID="lblUsedTime" runat="server" meta:resourcekey="lblUsedTimeResource1"></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Right" Wrap="False" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="備註" meta:resourcekey="TemplateFieldResource12">
                                    <ItemTemplate>
                                        <asp:Label ID="lblExtend" runat="server" meta:resourcekey="lblExtendResource1"></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" Wrap="False" Width="20%" />
                                </asp:TemplateField>
                            </Columns>
                        </Fast:Grid>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </td>
        </tr>
    </table>
    <asp:Label ID="lblLastRetention" runat="server" Visible="False" Text="去年度保留" meta:resourcekey="lblLastRetentionResource1"></asp:Label>
    <asp:Label ID="lblHour" runat="server" Visible="False" Text="小時" meta:resourcekey="lblHourResource1"></asp:Label>
    <asp:Label ID="lblDay" runat="server" Visible="False" Text="天" meta:resourcekey="lblDayResource1"></asp:Label>
    <asp:HiddenField ID="hfCurrentUser" runat="server" />
</asp:Content>

