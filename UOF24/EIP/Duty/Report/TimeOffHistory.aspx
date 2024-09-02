<%@ Page Title="" Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" CodeBehind="TimeOffHistory.aspx.cs" Inherits="Ede.Uof.Web.EIP.Duty.Report.TimeOffHistory" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" %>

<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Ede" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table class="PopTable">
        <tr>
            <td style="width:15%">
                <asp:Label ID="Label1" runat="server" Text="姓名" meta:resourcekey="Label1Resource1"></asp:Label>
            </td>
            <td style="width:35%">
                <asp:Label ID="lblUserName" runat="server" meta:resourcekey="lblUserNameResource1"></asp:Label>
            </td>
            <td style="width:15%">
                <asp:Label ID="Label3" runat="server" Text="來源" meta:resourcekey="Label3Resource1"></asp:Label>
            </td>
            <td style="width:35%">
                <asp:Label ID="lblUserSources" runat="server" meta:resourcekey="lblUserSourcesResource1"></asp:Label>
            </td>
        </tr>
    </table>
    <Ede:Grid ID="grdHistory" runat="server" AutoGenerateCheckBoxColumn="False" AutoGenerateColumns="False" AllowPaging="True"
        AllowSorting="True" CustomDropDownListPage="False" DataKeyOnClientWithCheckBox="False" DefaultSortDirection="Descending" DefaultSortColumnName="MODIFY_TIME"
        EmptyDataText="No data found" EnhancePager="True" KeepSelectedRows="False" PageSize="15" SelectedRowColor="" UnSelectedRowColor=""
        OnRowDataBound="grdHistory_RowDataBound" OnSorting="grdHistory_Sorting" width="100%"
        OnAfterExport="grdHistory_AfterExport" OnBeforeExport="grdHistory_BeforeExport" OnPageIndexChanging="grdHistory_PageIndexChanging" meta:resourcekey="grdHistoryResource1">
<EnhancePagerSettings FirstImageUrl="" FirstAltImageUrl="" PreviousImageUrl="" NextImageUrl="" LastImageUrl="" LastAltImage="" PageNumberCssClass="" PageNumberCurrentCssClass="" PageInfoCssClass="" PageRedirectCssClass="" NextIAltImageUrl="" PreviousAltImageUrl="" ShowHeaderPager="True"></EnhancePagerSettings>

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
            <asp:TemplateField AccessibleHeaderText="來源" HeaderText="來源" meta:resourcekey="TemplateFieldResource3">
                <ItemTemplate>
                    <asp:Label ID="lblSources" runat="server" meta:resourcekey="lblSourcesResource1"></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="異動前資料" meta:resourcekey="TemplateFieldResource4">
                <ItemTemplate>
                    <asp:Label ID="lblOldInfo" runat="server" meta:resourcekey="lblOldInfoResource1"></asp:Label>
                </ItemTemplate>
                <HeaderStyle Wrap="false" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="異動後資料" meta:resourcekey="TemplateFieldResource5">
                <ItemTemplate>
                    <asp:Label ID="lblInfo" runat="server" meta:resourcekey="lblInfoResource1"></asp:Label>
                </ItemTemplate>
                <HeaderStyle Wrap="false" />
            </asp:TemplateField>
            <asp:BoundField HeaderText="異動原因" DataField="REASON" HeaderStyle-Wrap="false" meta:resourcekey="BoundFieldResource1"/>
            <asp:TemplateField HeaderText="修改者" SortExpression="MODIFIER" meta:resourcekey="TemplateFieldResource6">
                <ItemTemplate>
                    <asp:Label ID="lblModifier" runat="server" meta:resourcekey="lblModifierResource1"></asp:Label>
                </ItemTemplate>
                <HeaderStyle Wrap="false" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="修改時間" SortExpression="MODIFY_TIME" meta:resourcekey="TemplateFieldResource7">
                <ItemTemplate>
                    <asp:Label ID="lblModifyTime" runat="server" meta:resourcekey="lblModifyTimeResource1"></asp:Label>
                </ItemTemplate>
                <HeaderStyle Wrap="false" />
            </asp:TemplateField>
        </Columns>
    </Ede:Grid>
    <asp:Label ID="lblWorkTypeWorkDay" runat="server" Text="工作日" Visible="False" meta:resourcekey="lblWorkTypeWorkDayResource1"></asp:Label>
    <asp:Label ID="lblWorkTypeDayoff" runat="server" Text="休息日" Visible="False" meta:resourcekey="lblWorkTypeDayoffResource1"></asp:Label>
    <asp:Label ID="lblWorkTypeRoutine" runat="server" Text="例假日" Visible="False" meta:resourcekey="lblWorkTypeRoutineResource1"></asp:Label>
    <asp:Label ID="lblWorkTypeOrgHoliday" runat="server" Text="國定假日" Visible="False" meta:resourcekey="lblWorkTypeOrgHolidayResource1"></asp:Label>
    <asp:Label ID="lblOverTimeType" runat="server" Text="加班類型：" Visible="False" meta:resourcekey="lblOverTimeTypeResource1"></asp:Label>    
    <asp:Label ID="lblEndDate" runat="server" Text="到期日：" Visible="False" meta:resourcekey="lblEndDateResource1"></asp:Label>
    <asp:Label ID="lblStartDate" runat="server" Text="開始日：" Visible="False" meta:resourcekey="lblStartDateResource1"></asp:Label>
    <asp:Label ID="lblHours" runat="server" Text="可用時數：" Visible="False" meta:resourcekey="lblHoursResource1"></asp:Label>
    <asp:Label ID="lblOverTime" runat="server" Text="加班" Visible="False"  meta:resourcekey="lblOverTimeResource1"></asp:Label>
    <asp:Label ID="lblRemark" runat="server" Text="備註：" Visible="False"  meta:resourcekey="lblRemarkResource1"></asp:Label>
    <asp:Label ID="lblImport" runat="server" Text="匯入" Visible="False"  meta:resourcekey="lblImportResource1"></asp:Label>
    <asp:Label ID="lblAccountTitle" runat="server" Text="帳號" Visible="False"  meta:resourcekey="lblAccountTitleResource1"></asp:Label>
    <asp:Label ID="lblNameTitle" runat="server" Text="姓名" Visible="False"  meta:resourcekey="lblNameTitleResource1"></asp:Label>
    <asp:Label ID="lblSourcesTitle" runat="server" Text="來源" Visible="False"  meta:resourcekey="lblSourcesTitleResource1"></asp:Label>
    <asp:HiddenField ID="hidIsExporting" runat="server" Value="N"/>
</asp:Content>
