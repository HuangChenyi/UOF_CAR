<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UC_QusByExamine.ascx.cs" Inherits="Ede.Uof.Web.QUE.Common.UC_QusByExamine" %>
<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Ede" %>

<Ede:Grid ID="Grid1" runat="server" AutoGenerateCheckBoxColumn="False" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CustomDropDownListPage="False" DataKeyOnClientWithCheckBox="False" DefaultSortColumnName="DESIGN_NAME" DefaultSortDirection="Ascending" EmptyDataText="No data found" EnhancePager="True" KeepSelectedRows="False" PageSize="15" SelectedRowColor="" ShowHeader="False" SkinID="HomepageBlockStyle" UnSelectedRowColor="" 
    OnRowDataBound="Grid1_RowDataBound" OnPageIndexChanging="Grid1_PageIndexChanging" OnSorting="Grid1_Sorting" Width="100%" meta:resourcekey="Grid1Resource1">
<EnhancePagerSettings FirstImageUrl="" FirstAltImageUrl="" PreviousImageUrl="" NextImageUrl="" LastImageUrl="" LastAltImage="" PageNumberCssClass="" PageNumberCurrentCssClass="" PageInfoCssClass="" PageRedirectCssClass="" NextIAltImageUrl="" PreviousAltImageUrl="" ShowHeaderPager="True"></EnhancePagerSettings>

<ExportExcelSettings AllowExportToExcel="False"></ExportExcelSettings>
    <Columns>
        <asp:TemplateField SortExpression="DESIGN_NAME" meta:resourcekey="TemplateFieldResource1">
            <ItemTemplate>
                <asp:LinkButton ID="lbtnQus" runat="server" Text='<%# Bind("DESIGN_NAME") %>' OnClick="lbtnQus_Click" meta:resourcekey="lbtnQusResource1"></asp:LinkButton>
            </ItemTemplate>
        </asp:TemplateField>
    </Columns>
</Ede:Grid>
<asp:Label ID="lblTitle" runat="server" Text="問卷審核" Visible="False" meta:resourcekey="lblTitleResource1"></asp:Label>