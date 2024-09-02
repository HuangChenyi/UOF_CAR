<%@ Page Title="選取時區" Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" CodeBehind="EditWorldClock.aspx.cs" Inherits="Ede.Uof.Web.Basic.Personal.WorldClock.EditWorldClock" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" %>
<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">    
    <Fast:Grid ID="gridTimeZone" runat="server" AllowSorting="True" AutoGenerateCheckBoxColumn="True"
        AutoGenerateColumns="False" DataKeyNames="Key" Width="100%" OnRowDataBound="gridTimeZone_RowDataBound"
        DataKeyOnClientWithCheckBox="False" EnhancePager="True" PageSize="15" EmptyDataText="No data found" KeepSelectedRows="True" CustomDropDownListPage="False" DefaultSortDirection="Ascending" meta:resourcekey="gridTimeZoneResource1" SelectedRowColor="" UnSelectedRowColor="">
        <EnhancePagerSettings ShowHeaderPager="True" />
        <ExportExcelSettings AllowExportToExcel="False" />
        <Columns>
            <asp:BoundField DataField="Value" HeaderText="時區" meta:resourcekey="BoundFieldResource2"></asp:BoundField>
        </Columns>
    </Fast:Grid>
    <asp:HiddenField ID="hidTimeZoneCount" runat="server" />
</asp:Content>
