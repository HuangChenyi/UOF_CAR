<%@ Page Title="" Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="EIP_Calendar_Common_MultiEventUsers" Codebehind="MultiEventUsers.aspx.cs" %>
<%@ Register assembly="Ede.Uof.Utility.Component.Grid" namespace="Ede.Uof.Utility.Component" tagprefix="Fast" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    <Fast:Grid ID="Grid1" runat="server" AutoGenerateCheckBoxColumn="False" 
        AllowSorting="True" AutoGenerateColumns="False"  
        DataKeyOnClientWithCheckBox="False" DefaultSortDirection="Ascending" 
        EmptyDataText="沒有資料" EnableModelValidation="True" EnhancePager="True" 
        KeepSelectedRows="False" onrowdatabound="Grid1_RowDataBound" PageSize="15" 
          AllowPaging="True" 
        onpageindexchanging="Grid1_PageIndexChanging" onsorting="Grid1_Sorting" 
        Width="100%">
<EnhancePagerSettings FirstImageUrl="" FirstAltImageUrl="" PreviousImageUrl="" NextImageUrl="" LastImageUrl="" LastAltImage="" PageNumberCssClass="" PageNumberCurrentCssClass="" PageInfoCssClass="" PageRedirectCssClass="" NextIAltImageUrl="" PreviousAltImageUrl="" ShowHeaderPager="True"></EnhancePagerSettings>

<ExportExcelSettings AllowExportToExcel="False"></ExportExcelSettings>
        <Columns>
            <asp:TemplateField HeaderText="姓名" SortExpression="USER_NAME" >
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="lblUser" runat="server"></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </Fast:Grid>
    
</asp:Content>

