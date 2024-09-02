<%@ Page Title="" Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="Common_ChoiceCenter_ChoiceAddressBookPreview" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" Codebehind="ChoiceAddressBookPreview.aspx.cs" %>
<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <Fast:Grid ID="Grid1" runat="server" AutoGenerateCheckBoxColumn="False" AutoGenerateColumns="False"
           Width="100%"
        AllowPaging="True" AllowSorting="True" OnPageIndexChanging="Grid1_PageIndexChanging"
        OnSorting="Grid1_Sorting" OnRowDataBound="Grid1_RowDataBound"
        DataKeyOnClientWithCheckBox="False" DefaultSortColumnName="NAME" 
        DefaultSortDirection="Ascending" 
        EnhancePager="True" PageSize="15">
        <EnhancePagerSettings FirstImageUrl="" FirstAltImageUrl="" PreviousImageUrl="" NextImageUrl=""
            LastImageUrl="" LastAltImage="" PageNumberCssClass="" PageNumberCurrentCssClass=""
            PageInfoCssClass="" PageRedirectCssClass="" NextIAltImageUrl="" PreviousAltImageUrl=""
            ShowHeaderPager="True"></EnhancePagerSettings>
        <ExportExcelSettings AllowExportToExcel="False"></ExportExcelSettings>
        <Columns>            
            <asp:BoundField DataField="NAME" HeaderText="聯絡人" SortExpression="NAME" 
                meta:resourcekey="BoundFieldResource1">
                
            </asp:BoundField>
        </Columns>
    </Fast:Grid>
    <input id="Hidden1" runat="server" type="hidden" />
    <asp:Label ID="lbIsFirstRun" runat="server" Visible="False" meta:resourcekey="lbIsFirstRunResource1"></asp:Label>
</asp:Content>


