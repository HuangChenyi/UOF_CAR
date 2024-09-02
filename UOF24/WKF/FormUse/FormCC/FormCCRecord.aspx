<%@ Page Title="" Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="WKF_FormUse_FormCC_FormCCRecord" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" Codebehind="FormCCRecord.aspx.cs" %>
<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>

<%@ Register src="../../../Common/ChoiceCenter/UC_ChoiceList.ascx" tagname="UC_ChoiceList" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<Fast:Grid ID="recordGrid" runat="server" AutoGenerateCheckBoxColumn="False" 
        AllowSorting="True" AutoGenerateColumns="False"  
        DataKeyOnClientWithCheckBox="False" DefaultSortDirection="Ascending" 
        EmptyDataText="沒有資料" EnableModelValidation="True" EnhancePager="True" 
        KeepSelectedRows="False" PageSize="15"  
         
        Width="100%" onrowdatabound="recordGrid_RowDataBound" 
        meta:resourcekey="recordGridResource1" >
<EnhancePagerSettings FirstImageUrl="" FirstAltImageUrl="" PreviousImageUrl="" NextImageUrl="" LastImageUrl="" LastAltImage="" PageNumberCssClass="" PageNumberCurrentCssClass="" PageInfoCssClass="" PageRedirectCssClass="" NextIAltImageUrl="" PreviousAltImageUrl="" ShowHeaderPager="True"></EnhancePagerSettings>

<ExportExcelSettings AllowExportToExcel="False"></ExportExcelSettings>
        <Columns>
            <asp:TemplateField HeaderText="副本發送時間" meta:resourcekey="BoundFieldResource1">
                <ItemTemplate>
                    <asp:Label ID="lblSendTime" runat="server"></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="通知人員" meta:resourcekey="TemplateFieldResource1">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" meta:resourcekey="TextBox1Resource1"></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    
                    <uc1:UC_ChoiceList ID="UC_ChoiceList1" runat="server" />
                    
                </ItemTemplate>
            </asp:TemplateField>
    </Columns>
    </Fast:Grid>
</asp:Content>

