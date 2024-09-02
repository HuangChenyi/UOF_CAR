<%@ Page Title="" Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" CodeBehind="YearLeaveHistory.aspx.cs" Inherits="Ede.Uof.Web.EIP.Duty.YearLeaveDays.YearLeaveHistory" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" %>
<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Ede" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <table class="PopTable">
                <tr>
                    <td style="width:20%">
                        <asp:Label ID="Label1" runat="server" Text="姓名" meta:resourcekey="Label1Resource1"></asp:Label>
                    </td>
                    <td style="width:30%">
                        <asp:Label ID="lblUserName" runat="server" meta:resourcekey="lblUserNameResource1"></asp:Label>
                    </td>
                    <td style="width:20%">
                        <asp:Label ID="Label3" runat="server" Text="年度" meta:resourcekey="Label3Resource1"></asp:Label>
                    </td>
                    <td style="width:30%">
                        <asp:Label ID="lblUserYear" runat="server" meta:resourcekey="lblUserYearResource1"></asp:Label>
                    </td>
                </tr>
            </table>
            <Ede:Grid ID="grdHistory" runat="server" AutoGenerateCheckBoxColumn="False" AutoGenerateColumns="False" AllowPaging="True"
                AllowSorting="True" CustomDropDownListPage="False" DataKeyOnClientWithCheckBox="False" DefaultSortDirection="Descending" DefaultSortColumnName="MODIFY_TIME"
                EmptyDataText="No data found" EnhancePager="True" KeepSelectedRows="False" PageSize="15" SelectedRowColor="" UnSelectedRowColor=""
                OnRowDataBound="grdHistory_RowDataBound" OnSorting="grdHistory_Sorting" width="100%"
                OnAfterExport="grdHistory_AfterExport" OnBeforeExport="grdHistory_BeforeExport" OnPageIndexChanging="grdHistory_PageIndexChanging" meta:resourcekey="grdHistoryResource1">
                <EnhancePagerSettings ShowHeaderPager="True"></EnhancePagerSettings>

                <ExportExcelSettings AllowExportToExcel="True"></ExportExcelSettings>
                <Columns>
                    <asp:TemplateField AccessibleHeaderText="帳號" HeaderText="帳號" meta:resourcekey="TemplateFieldResource1">
                        <ItemTemplate>
                            <asp:Label ID="lblAccount" runat="server" meta:resourcekey="lblAccountResource1"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField AccessibleHeaderText="姓名" HeaderText="姓名" meta:resourcekey="TemplateFieldResource2">
                        <ItemTemplate>
                            <asp:Label ID="lblName" runat="server" meta:resourcekey="lblNameResource1"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField AccessibleHeaderText="年度" HeaderText="年度" meta:resourcekey="TemplateFieldResource3">
                        <ItemTemplate>
                            <asp:Label ID="lblYear" runat="server" meta:resourcekey="lblYearResource1"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="異動前資料" meta:resourcekey="TemplateFieldResource4">
                        <ItemTemplate>
                            <asp:Label ID="lblOldInfo" runat="server" meta:resourcekey="lblOldInfoResource1"></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle Width="170px" Wrap="False"/>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="異動後資料" meta:resourcekey="TemplateFieldResource5">
                        <ItemTemplate>
                            <asp:Label ID="lblInfo" runat="server" meta:resourcekey="lblInfoResource1"></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle Width="170px" Wrap="False"/>
                    </asp:TemplateField>
                    <asp:BoundField HeaderText="異動原因" DataField="REASON" meta:resourcekey="BoundFieldResource1" >
                    <HeaderStyle Wrap="False" />
                    </asp:BoundField>
                    <asp:TemplateField HeaderText="修改者" SortExpression="MODIFIER" meta:resourcekey="TemplateFieldResource6">
                        <ItemTemplate>
                            <asp:Label ID="lblModifier" runat="server" meta:resourcekey="lblModifierResource1"></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle Width="200px" Wrap="False"/>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="修改時間" SortExpression="MODIFY_TIME" meta:resourcekey="TemplateFieldResource7">
                        <ItemTemplate>
                            <asp:Label ID="lblModifyTime" runat="server" meta:resourcekey="lblModifyTimeResource1"></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle Width="200px" Wrap="False"/>
                    </asp:TemplateField>
                </Columns>
            </Ede:Grid>
            <asp:HiddenField ID="hidIsExporting" runat="server" Value="N"/>
        </ContentTemplate>
    </asp:UpdatePanel>
    

    <asp:Label ID="lblAccountTitle" runat="server" Text="帳號" Visible="False" meta:resourcekey="lblAccountTitleResource1"></asp:Label>
    <asp:Label ID="lblNameTitle" runat="server" Text="姓名" Visible="False" meta:resourcekey="lblNameTitleResource1" ></asp:Label>
    <asp:Label ID="lblSourcesType" runat="server" Text="來源：" Visible="False" meta:resourcekey="lblSourcesTypeResource1"></asp:Label>
    <asp:Label ID="lblYearth" runat="server" Text="年資：" Visible="False" meta:resourcekey="lblYearthResource1"></asp:Label>
    <asp:Label ID="lblLeaveDay" runat="server" Text="本年度可休數：" Visible="False" meta:resourcekey="lblLeaveDayResource1"></asp:Label>
    <asp:Label ID="lblStart" runat="server" Text="起：" Visible="False" meta:resourcekey="lblStartResource1"></asp:Label>
    <asp:Label ID="lblEnd" runat="server" Text="訖：" Visible="False" meta:resourcekey="lblEndResource1"></asp:Label>
    <asp:Label ID="lblLastYearLeaveDay" runat="server" Text="去年度可休數：" Visible="False" meta:resourcekey="lblLastYearLeaveDayResource1"></asp:Label>
    <asp:Label ID="lblImport" runat="server" Visible="False" Text="匯入" meta:resourcekey="lblImportResource1"></asp:Label>
    <asp:Label ID="lblSystemInsert" runat="server" Visible="False" Text="系統產生" meta:resourcekey="lblSystemInsertResource1"></asp:Label>
    <asp:Label ID="lblManualInsert" runat="server" Visible="False" Text="手動新增" meta:resourcekey="lblManualInsertResource1"></asp:Label>
    <asp:Label ID="lblHour" runat="server" Visible="False" Text="時" meta:resourcekey="lblHourResource1"></asp:Label>
    <asp:Label ID="lblDay" runat="server" Visible="False" Text="天" meta:resourcekey="lblDayResource1"></asp:Label>
</asp:Content>
