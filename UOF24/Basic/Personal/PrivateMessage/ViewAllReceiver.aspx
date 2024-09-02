<%@ Page Title="" Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" CodeBehind="ViewAllReceiver.aspx.cs" Inherits="Ede.Uof.Web.Basic.Personal.PrivateMessage.ViewAllReceiver" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" %>

<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Ede" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <Ede:Grid ID="grdAllReceiver" runat="server" DataKeyNames="MESSAGE_TO"
                AutoGenerateCheckBoxColumn="False" 
                AllowPaging="True" PageSize="15" 
                AutoGenerateColumns="False" Width="100%" 
                OnRowDataBound="grdAllReceiver_RowDataBound"
                OnPageIndexChanging="grdAllReceiver_PageIndexChanging"
                CustomDropDownListPage="False" DataKeyOnClientWithCheckBox="False" EmptyDataText="沒有資料" EnhancePager="True" KeepSelectedRows="False" SelectedRowColor="" UnSelectedRowColor="" DefaultSortDirection="Ascending" meta:resourcekey="grdAllReceiverResource1">
                
                <EnhancePagerSettings FirstAltImageUrl="" FirstImageUrl="" LastAltImage="" LastImageUrl="" NextIAltImageUrl="" NextImageUrl="" PageInfoCssClass="" PageNumberCssClass="" PageNumberCurrentCssClass="" PageRedirectCssClass="" PreviousAltImageUrl="" PreviousImageUrl="" ShowHeaderPager="True" />
                <ExportExcelSettings AllowExportToExcel="False" />
                
                <Columns>
                    <asp:TemplateField HeaderText="收件人" meta:resourcekey="TemplateFieldResource1">
                        <ItemTemplate>
                            <asp:Label ID="lblReceiver" runat="server" meta:resourcekey="lblReceiverResource1"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>        
                </Columns>
            </Ede:Grid>

            <asp:HiddenField ID="hfMasterGuid" runat="server" />

        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
