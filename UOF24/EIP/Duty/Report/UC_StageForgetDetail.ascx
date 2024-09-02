<%@ Control Language="C#" AutoEventWireup="true" Inherits="EIP_Duty_Report_UC_StageForgetDetail" Codebehind="UC_StageForgetDetail.ascx.cs" %>
<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>
<Fast:Grid ID="StageForget" runat="server" AllowSorting="True" AutoGenerateCheckBoxColumn="False"
    AutoGenerateColumns="False" AllowPaging="True"
    Width="100%" DefaultSortColumnName="APPLY_GROUP,ACCOUNT,WDATE"
    DataKeyOnClientWithCheckBox="False"
    DefaultSortDirection="Ascending" EmptyDataText="沒有資料"
    EnhancePager="True" KeepSelectedRows="False" meta:resourcekey="StageForgetResource1"
    PageSize="15"   
    OnRowDataBound="StageForget_RowDataBound" OnBeforeExport="StageForget_BeforeExport" OnPageIndexChanging="StageForget_PageIndexChanging" OnSorting="StageForget_Sorting">
    <EnhancePagerSettings ShowHeaderPager="True" FirstAltImageUrl="" FirstImageUrl="" LastAltImage="" LastImageUrl=""
        NextIAltImageUrl="" NextImageUrl="" PageInfoCssClass="" PageNumberCssClass=""
        PageNumberCurrentCssClass="" PageRedirectCssClass="" PreviousAltImageUrl=""
        PreviousImageUrl="" />
    <ExportExcelSettings ExcelExportFileName="ForgetDetail.xls" DataSourceType="ObjectDataSource" ExportType="GridContent" AllowExportToExcel="True"></ExportExcelSettings>
    <Columns>

        <asp:BoundField HeaderText="帳號" DataField="ACCOUNT" SortExpression="ACCOUNT" meta:resourcekey="BoundFieldResource1" />
        <asp:TemplateField HeaderText="姓名" meta:resourcekey="BoundFieldResource2" >
            <ItemTemplate>
                <asp:Label ID="lblName" runat="server" meta:resourcekey="lblNameResource1"></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:BoundField HeaderText="申請部門" DataField="APPLY_GROUP" SortExpression="APPLY_GROUP" meta:resourcekey="BoundFieldResource3"/>
        <asp:BoundField HeaderText="補刷卡日期" HeaderStyle-Width="100px" DataField="WDATE" SortExpression="WDATE" DataFormatString="{0:yyyy/MM/dd}" meta:resourcekey="BoundFieldResource4">
<HeaderStyle Width="100px"></HeaderStyle>
        </asp:BoundField>
        <asp:TemplateField HeaderText="上班忘刷"  HeaderStyle-Width="80px" ItemStyle-HorizontalAlign="Center" meta:resourcekey="TemplateFieldResource1"  >
            <ItemTemplate>
                <asp:Label ID="lblWork" runat="server" meta:resourcekey="lblWorkResource1"></asp:Label>
            </ItemTemplate>

<HeaderStyle Width="80px"></HeaderStyle>

<ItemStyle HorizontalAlign="Center"></ItemStyle>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="下班忘刷"  HeaderStyle-Width="80px" ItemStyle-HorizontalAlign="Center" meta:resourcekey="TemplateFieldResource2">
            <ItemTemplate>
                <asp:Label ID="lblOff" runat="server" meta:resourcekey="lblOffResource1"></asp:Label>
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