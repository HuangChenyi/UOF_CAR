<%@ Page Title="離線文件開啟記錄" Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" CodeBehind="ListUDocOpenTimes.aspx.cs" Inherits="Ede.Uof.Web.DMS.Admin.ListUDocOpenTimes" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" %>

<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Ede" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <Ede:Grid ID="Grid1" runat="server" Width="100%" AutoGenerateCheckBoxColumn="False" AllowSorting="True" AutoGenerateColumns="False" CustomDropDownListPage="False" DataKeyOnClientWithCheckBox="False" DefaultSortDirection="Ascending" EmptyDataText="No data found" EnhancePager="True" KeepSelectedRows="False" PageSize="15" SelectedRowColor="" UnSelectedRowColor="" DefaultSortColumnName="CREATE_DATE" AllowPaging="True" OnPageIndexChanging="Grid1_PageIndexChanging" OnRowDataBound="Grid1_RowDataBound" OnSorting="Grid1_Sorting" meta:resourcekey="Grid1Resource1">
<EnhancePagerSettings ShowHeaderPager="True"></EnhancePagerSettings>

<ExportExcelSettings AllowExportToExcel="False"></ExportExcelSettings>
        <Columns>
            <asp:BoundField DataField="MACHINE_NAME" HeaderText="電腦名稱" SortExpression="MACHINE_NAME" meta:resourcekey="BoundFieldResource1" />
            <asp:BoundField DataField="READER" HeaderText="觀看人員" SortExpression="READER" meta:resourcekey="BoundFieldResource2" />
            <asp:BoundField DataField="EXTERNAL_IP" HeaderText="外部IP" SortExpression="EXTERNAL_IP" meta:resourcekey="BoundFieldResource3" />
            <asp:BoundField DataField="INTERNAL_IP" HeaderText="內部IP" SortExpression="INTERNAL_IP" meta:resourcekey="BoundFieldResource4" />
            <asp:TemplateField HeaderText="觀看時間" SortExpression="CREATE_DATE" meta:resourcekey="TemplateFieldResource1">
                <ItemTemplate>
                    <asp:Label ID="lblCreateDate" runat="server" meta:resourcekey="lblCreateDateResource1"></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </Ede:Grid>
</asp:Content>
