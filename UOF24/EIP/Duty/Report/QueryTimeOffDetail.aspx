<%@ Page Title="" Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" CodeBehind="QueryTimeOffDetail.aspx.cs" Inherits="Ede.Uof.Web.EIP.Duty.Report.QueryTimeOffDetail" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" %>
<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Ede" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table class="PopTable" border="1">
        <tr>
            <td style="white-space: nowrap">
                <asp:Label ID="Label1" runat="server" Text="帳號" meta:resourcekey="Label1Resource1"></asp:Label>
            </td>
            <td>
                <asp:Label ID="lblAccount" runat="server" meta:resourcekey="lblAccountResource1"></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="white-space: nowrap">
                <asp:Label ID="Label2" runat="server" Text="姓名" meta:resourcekey="Label2Resource1"></asp:Label>
            </td>
            <td>
                <asp:Label ID="lblUserName" runat="server" meta:resourcekey="lblUserNameResource1"></asp:Label>
            </td>
        </tr>
        <tr runat="server" id="trOTtype">
            <td style="white-space: nowrap">
                <asp:Label ID="Label8" runat="server" Text="加班類型" meta:resourcekey="Label8Resource1"></asp:Label>
            </td>
            <td>
                <asp:Label ID="lblOverTimeType" runat="server" meta:resourcekey="lblOverTimeTypeResource1"></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="white-space: nowrap">
                <asp:Label ID="Label3" runat="server" Text="開始日" meta:resourcekey="Label3Resource1"></asp:Label>
            </td>
            <td>
                <asp:Label ID="lblStartDate" runat="server" meta:resourcekey="lblStartDateResource1"></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="white-space: nowrap">
                <asp:Label ID="Label4" runat="server" Text="到期日" meta:resourcekey="Label4Resource1"></asp:Label>
            </td>
            <td>
                <asp:Label ID="lblEndDate" runat="server" meta:resourcekey="lblEndDateResource1"></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="white-space: nowrap">
                <asp:Label ID="Label5" runat="server" Text="可用時數" meta:resourcekey="Label5Resource1"></asp:Label>
            </td>
            <td>
                <asp:Label ID="lblHadHours" runat="server" meta:resourcekey="lblHadHoursResource1"></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="white-space: nowrap">
                <asp:Label ID="Label6" runat="server" Text="已用時數" meta:resourcekey="Label6Resource1"></asp:Label>
            </td>
            <td>
                <asp:Label ID="lblUsedHour" runat="server" meta:resourcekey="lblUsedHourResource1"></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="white-space: nowrap">
                <asp:Label ID="Label7" runat="server" Text="剩餘時數" meta:resourcekey="Label7Resource1"></asp:Label>
            </td>
            <td>
                <asp:Label ID="lblReminderHour" runat="server" meta:resourcekey="lblReminderHourResource1"></asp:Label>
            </td>
        </tr>
    </table>
    <table style="width: 100%">
        <tr>
            <td>
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <Ede:Grid ID="grdTimeOffDetail" runat="server" AutoGenerateColumns="False" AutoGenerateCheckBoxColumn="False" AllowSorting="True"
                    CustomDropDownListPage="False" DataKeyOnClientWithCheckBox="False" DefaultSortColumnName="DOC_NBR" DefaultSortDirection="Ascending"
                    EmptyDataText="沒有資料" EnhancePager="True" KeepSelectedRows="False" PageSize="15" SelectedRowColor="" UnSelectedRowColor=""
                    OnRowDataBound="grdTimeOffDetail_RowDataBound" OnSorting="grdTimeOffDetail_Sorting" Width="100%" OnPageIndexChanging="grdTimeOffDetail_PageIndexChanging" meta:resourcekey="grdTimeOffDetailResource1" AllowPaging="True">
                    <EnhancePagerSettings FirstImageUrl="" FirstAltImageUrl="" PreviousImageUrl="" NextImageUrl="" LastImageUrl="" LastAltImage="" PageNumberCssClass="" PageNumberCurrentCssClass="" PageInfoCssClass="" PageRedirectCssClass="" NextIAltImageUrl="" PreviousAltImageUrl="" ShowHeaderPager="True"></EnhancePagerSettings>
                    <ExportExcelSettings AllowExportToExcel="False"></ExportExcelSettings>
                    <Columns>
                        <asp:TemplateField HeaderText="請假單號" SortExpression="DOC_NBR" meta:resourcekey="TemplateFieldResource1">
                            <ItemTemplate>
                                <asp:LinkButton ID="lbtnDocNbr" runat="server" Text='<%# Eval("DOC_NBR") %>' meta:resourcekey="lbtnDocNbrResource1"></asp:LinkButton>
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Center" Wrap="False" />
                        </asp:TemplateField>
                        <asp:BoundField DataField="TASK_HOURS" HeaderText="請假時數" meta:resourcekey="BoundFieldResource1">
                            <HeaderStyle HorizontalAlign="Center" Wrap="False" />
                            <ItemStyle HorizontalAlign="Right" />
                        </asp:BoundField>
                        <asp:BoundField DataField="USE_DATE" HeaderText="使用日期" DataFormatString="{0:d}" meta:resourcekey="BoundFieldResource2">
                            <HeaderStyle HorizontalAlign="Center" Wrap="False" />
                            <ItemStyle HorizontalAlign="Left" />
                        </asp:BoundField>
                        <asp:BoundField DataField="USE_HOURS" HeaderText="使用時數" meta:resourcekey="BoundFieldResource3">
                            <HeaderStyle HorizontalAlign="Center" Wrap="false" />
                            <ItemStyle HorizontalAlign="Right" />
                        </asp:BoundField>
                    </Columns>
                </Ede:Grid>
                    </ContentTemplate>
                </asp:UpdatePanel>                
            </td>
        </tr>
    </table>
    <asp:Label ID="lblHour" runat="server" Text="小時" Visible="False" meta:resourcekey="lblHourResource1"></asp:Label>
    <asp:Label ID="lblFromImport" runat="server" Text="由外部匯入" Visible="False" meta:resourcekey="lblFromImportResource1"></asp:Label>
    <asp:Label ID="lblWorkTypeWorkDay" runat="server" Text="工作日" Visible="False" meta:resourcekey="lblWorkTypeWorkDayResource1"></asp:Label>
    <asp:Label ID="lblWorkTypeDayoff" runat="server" Text="休息日" Visible="False" meta:resourcekey="lblWorkTypeDayoffResource1"></asp:Label>
    <asp:Label ID="lblWorkTypeRoutine" runat="server" Text="例假日" Visible="False" meta:resourcekey="lblWorkTypeRoutineResource1"></asp:Label>
    <asp:Label ID="lblWorkTypeOrgHoliday" runat="server" Text="國定假日" Visible="False" meta:resourcekey="lblWorkTypeOrgHolidayResource1"></asp:Label>
    <asp:HiddenField ID="hfUsedHour" runat="server" />
    <asp:HiddenField ID="hfUserGuid" runat="server" />
    <asp:HiddenField ID="hfTimeOffGuid" runat="server" />

</asp:Content>
