<%@ Control Language="C#" AutoEventWireup="true" Inherits="EIP_Duty_Report_UC_StageLeaDetail" Codebehind="UC_StageLeaDetail.ascx.cs" %>
<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>
<Fast:Grid ID="StageLeave" runat="server" AllowSorting="True" AutoGenerateCheckBoxColumn="False"
    AutoGenerateColumns="False" AllowPaging="True"
    Width="100%" DefaultSortColumnName="APPLY_GROUP,ACCOUNT,WDATE"
    DataKeyOnClientWithCheckBox="False"
    DefaultSortDirection="Ascending" EmptyDataText="沒有資料"
    EnhancePager="True" KeepSelectedRows="False" meta:resourcekey="StageLeaveResource1"
    PageSize="15"   
    OnRowDataBound="StageLeave_RowDataBound" OnBeforeExport="StageLeave_BeforeExport" OnPageIndexChanging="StageLeave_PageIndexChanging" OnSorting="StageLeave_Sorting">
    <EnhancePagerSettings ShowHeaderPager="True" />
    <ExportExcelSettings ExcelExportFileName="LeaveDetail.xls"  DataSourceType="ObjectDataSource" ExportType="GridContent" AllowExportToExcel="True"></ExportExcelSettings>
    <Columns>

        <asp:BoundField HeaderText="帳號" DataField="ACCOUNT" SortExpression="ACCOUNT" meta:resourcekey="BoundFieldResource1" />
        <asp:TemplateField HeaderText="姓名" meta:resourcekey="BoundFieldResource2" >
            <ItemTemplate>
                <asp:Label ID="lblName" runat="server" meta:resourcekey="lblNameResource1"></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:BoundField HeaderText="申請部門" DataField="APPLY_GROUP" SortExpression="APPLY_GROUP" meta:resourcekey="BoundFieldResource3"/>
        <asp:BoundField HeaderText="請假日期" HeaderStyle-Width="100px" DataField="WDATE" SortExpression="WDATE" DataFormatString="{0:yyyy/MM/dd}" meta:resourcekey="BoundFieldResource4">
<HeaderStyle Width="100px"></HeaderStyle>
        </asp:BoundField>
        <asp:BoundField HeaderText="請假時/天數" HeaderStyle-Width="80px" DataField="NUM" ItemStyle-HorizontalAlign="Right" DataFormatString="{0:N2}" meta:resourcekey="BoundFieldResource5" >
<HeaderStyle Width="80px"></HeaderStyle>

<ItemStyle HorizontalAlign="Right"></ItemStyle>
        </asp:BoundField>
        <asp:TemplateField HeaderText="單位"  HeaderStyle-Width="50px" meta:resourcekey="TemplateFieldResource1" >
            <ItemTemplate>
                <asp:Label ID="lblUnit" runat="server" meta:resourcekey="lblUnitResource1"></asp:Label>
            </ItemTemplate>
        <HeaderStyle Width="50px"></HeaderStyle>
        </asp:TemplateField>
        <asp:BoundField HeaderText="假別代碼" DataField="LEA_CODE" SortExpression="LEA_CODE" meta:resourcekey="BoundFieldResource6"/>
        <asp:BoundField HeaderText="假別" DataField="LEA_NAME"  SortExpression="LEA_NAME" meta:resourcekey="BoundFieldResource7"/>

    </Columns>
    <HeaderStyle Wrap="false" />
</Fast:Grid>
<asp:Label ID="lblHour" runat="server" Text="時" Visible="False" meta:resourcekey="lblHourResource1"></asp:Label>
<asp:Label ID="lblDay" runat="server" Text="天" Visible="False" meta:resourcekey="lblDayResource1"></asp:Label>
<asp:HiddenField ID="hf_Sdate" runat="server" />
<asp:HiddenField ID="hf_Edate" runat="server" />
<asp:HiddenField ID="hf_IsDept" runat="server" />
<asp:HiddenField ID="hf_DeptGuid" runat="server" />
