<%@ Control Language="C#" AutoEventWireup="true" Inherits="EIP_Duty_Report_UC_StageOvtDetail" Codebehind="UC_StageOvtDetail.ascx.cs" %>
<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>
<Fast:Grid ID="StageOverTime" runat="server" AllowSorting="True" AutoGenerateCheckBoxColumn="False"
    AutoGenerateColumns="False" AllowPaging="True"
    Width="100%" DefaultSortColumnName="APPLY_GROUP,ACCOUNT,WDATE"
    DataKeyOnClientWithCheckBox="False"
    DefaultSortDirection="Ascending" EmptyDataText="沒有資料"
    EnhancePager="True" KeepSelectedRows="False" meta:resourcekey="StageOverTimeResource1"
    PageSize="15"   
    OnRowDataBound="StageOverTime_RowDataBound" OnBeforeExport="StageOverTime_BeforeExport" OnPageIndexChanging="StageOverTime_PageIndexChanging" OnSorting="StageOverTime_Sorting">
    <EnhancePagerSettings ShowHeaderPager="True" />
    <ExportExcelSettings ExcelExportFileName="OverTimeDetail.xls" DataSourceType="ObjectDataSource" ExportType="GridContent" AllowExportToExcel="True"></ExportExcelSettings>
    <Columns>

        <asp:BoundField HeaderText="帳號" DataField="ACCOUNT" SortExpression="ACCOUNT" meta:resourcekey="BoundFieldResource1" />
        <asp:TemplateField HeaderText="姓名" meta:resourcekey="BoundFieldResource2" >
            <ItemTemplate>
                <asp:Label ID="lblName" runat="server" meta:resourcekey="lblNameResource1"></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:BoundField HeaderText="申請部門" DataField="APPLY_GROUP" SortExpression="APPLY_GROUP" meta:resourcekey="BoundFieldResource3"/>
        <asp:BoundField HeaderText="歸屬日" HeaderStyle-Width="100px" DataField="WDATE" SortExpression="WDATE" DataFormatString="{0:yyyy/MM/dd}" meta:resourcekey="BoundFieldResource4">
<HeaderStyle Width="100px"></HeaderStyle>
        </asp:BoundField>
        <asp:BoundField HeaderText="加班時數" HeaderStyle-Width="80px" DataField="NUM" SortExpression="NUM" ItemStyle-HorizontalAlign="Right" DataFormatString="{0:N2}" meta:resourcekey="BoundFieldResource5" >
<HeaderStyle Width="80px"></HeaderStyle>

<ItemStyle HorizontalAlign="Right"></ItemStyle>
        </asp:BoundField>
        <asp:TemplateField HeaderText="給付方式"  HeaderStyle-Width="80px" SortExpression="CODE" ItemStyle-HorizontalAlign="Center" meta:resourcekey="TemplateFieldResource1"  >
            <ItemTemplate>
                <asp:Label ID="lblPay" runat="server" meta:resourcekey="lblPayResource1"></asp:Label>
            </ItemTemplate>

<HeaderStyle Width="80px"></HeaderStyle>

<ItemStyle HorizontalAlign="Center"></ItemStyle>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="加班類型"  HeaderStyle-Width="80px" SortExpression="TYPE" ItemStyle-HorizontalAlign="Center" meta:resourcekey="TemplateFieldResource2">
            <ItemTemplate>
                <asp:Label ID="lblHoliday" runat="server" meta:resourcekey="lblHolidayResource1"></asp:Label>
            </ItemTemplate>

<HeaderStyle Width="80px"></HeaderStyle>

<ItemStyle HorizontalAlign="Center"></ItemStyle>
        </asp:TemplateField>
    </Columns>
    <HeaderStyle Wrap="false" />
</Fast:Grid>
<asp:Label ID="lblHour" runat="server" Text="時" Visible="False" meta:resourcekey="lblHourResource1"></asp:Label>
<asp:Label ID="lblDay" runat="server" Text="天" Visible="False" meta:resourcekey="lblDayResource1"></asp:Label>
<asp:HiddenField ID="hf_Sdate" runat="server" />
<asp:HiddenField ID="hf_Edate" runat="server" />
<asp:HiddenField ID="hf_IsDept" runat="server" />
<asp:HiddenField ID="hf_DeptGuid" runat="server" />
<asp:Label ID="lblWorkDay" runat="server" Text="工作日" Visible="False" meta:resourcekey="lblWorkDayResource1"></asp:Label>
<asp:Label ID="lblDayoff" runat="server" Text="休息日" Visible="False" meta:resourcekey="lblDayoffResource1"></asp:Label>
<asp:Label ID="lblRoutine" runat="server" Text="例假日" Visible="False" meta:resourcekey="lblRoutineResource1"></asp:Label>
<asp:Label ID="lblOrgHoliday" runat="server" Text="國定假日" Visible="False" meta:resourcekey="lblOrgHolidayResource1"></asp:Label>
<asp:Label ID="lblOverTime" runat="server" Text="轉費用" Visible="False" meta:resourcekey="lblOverTimeResource1"></asp:Label>
<asp:Label ID="lblOverTimeT" runat="server" Text="轉補休" Visible="False" meta:resourcekey="lblOverTimeTResource1"></asp:Label>
<asp:Label ID="lblOverTimeB" runat="server" Text="轉補休及費用" Visible="False" meta:resourcekey="lblOverTimeBResource1"></asp:Label>