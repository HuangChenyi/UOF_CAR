<%@ Page Title="訊息" Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" CodeBehind="ExportPunchLog.aspx.cs" Inherits="Ede.Uof.Web.HR104.Punch.ExportPunchLog" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" %>
<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="EdeGrid" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <EdeGrid:Grid ID="logGrid" runat="server" AutoGenerateCheckBoxColumn="False" AllowSorting="True" AutoGenerateColumns="False" CustomDropDownListPage="False" DataKeyOnClientWithCheckBox="False" DefaultSortColumnName="ITEM" DefaultSortDirection="Ascending" EmptyDataText="No data found" EnhancePager="True" KeepSelectedRows="False" PageSize="15" SelectedRowColor="" UnSelectedRowColor="" Width="100%" AllowPaging="True" OnPageIndexChanging="logGrid_PageIndexChanging" OnRowDataBound="logGrid_RowDataBound" OnSorting="logGrid_Sorting" meta:resourcekey="logGridResource1">
                <EnhancePagerSettings ShowHeaderPager="True" FirstAltImageUrl="" FirstImageUrl="" LastAltImage="" LastImageUrl="" NextIAltImageUrl="" NextImageUrl="" PageInfoCssClass="" PageNumberCssClass="" PageNumberCurrentCssClass="" PageRedirectCssClass="" PreviousAltImageUrl="" PreviousImageUrl=""></EnhancePagerSettings>

                <ExportExcelSettings AllowExportToExcel="False" DataSourceType="ObjectDataSource"></ExportExcelSettings>
                <Columns>
                    <asp:BoundField DataField="Item" HeaderText="項目" meta:resourcekey="BoundFieldResource1" >
                        <HeaderStyle Wrap="False" Width="30%" />
                    </asp:BoundField>                    
                    <asp:BoundField DataField="Message" HeaderText="訊息" meta:resourcekey="BoundFieldResource2">
                        <HeaderStyle Wrap="False" />
                    </asp:BoundField>
                </Columns>
            </EdeGrid:Grid>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
