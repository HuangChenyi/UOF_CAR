<%@ Page Title="已加簽資訊" Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" CodeBehind="ViewSimulationAdditionalSignFlow.aspx.cs" Inherits="Ede.Uof.Web.WKF.Browse.ViewSimulationAdditionalSignFlow" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" %>

<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <Fast:Grid ID="gridSimulation" runat="server" AutoGenerateCheckBoxColumn="False" Width="100%" AllowSorting="True" 
        AutoGenerateColumns="False" DataKeyOnClientWithCheckBox="False" DefaultSortDirection="Ascending" EnableTheming="True"
        EmptyDataText="沒有資料" EnhancePager="True" KeepSelectedRows="False" PageSize="15"
        OnRowDataBound="gridSimulation_RowDataBound" RowStyle-HorizontalAlign="Left" meta:resourcekey="gridSimulationResource1" CustomDropDownListPage="False" SelectedRowColor="" UnSelectedRowColor="">
        <EnhancePagerSettings ShowHeaderPager="True"></EnhancePagerSettings>
        <ExportExcelSettings AllowExportToExcel="False"></ExportExcelSettings>
        <Columns>
            <asp:BoundField HeaderText="站點" DataField="SITE_SEQ" meta:resourcekey="BoundFieldResource5">
                <ItemStyle Width="50px" HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField HeaderText="已加簽資訊" DataField="ORIGINAL_SIGNER" meta:resourcekey="BoundFieldResource6" ItemStyle-HorizontalAlign="Left" />
        </Columns>
    </Fast:Grid>
    
    <asp:Label ID="lblAdditionalSign" runat="server" Text="由 {#User} 加簽" Visible="False" meta:resourcekey="lblAdditionalSignResource1"></asp:Label>
    <asp:Label ID="lblReturnTxt" runat="server" Text="返回" Visible="False" meta:resourcekey="lblReturnTxtResource1"></asp:Label>

</asp:Content>