<%@ Page Title="聊天室成員" Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" CodeBehind="UChatMember.aspx.cs" Inherits="Ede.Uof.Web.EIP.Chat.UChatMember" meta:resourcekey="PageResource1" culture="auto" uiculture="auto" %>

<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:UpdatePanel ID="UpdataPanel1" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <Fast:Grid ID="gridUChatMember" runat="server" AllowPaging="True"
                AllowSorting="True" AutoGenerateCheckBoxColumn="False"
                AutoGenerateColumns="False" DataKeyNames="USER_GUID" DataKeyOnClientWithCheckBox="False"
                DefaultSortDirection="Ascending" EmptyDataText="沒有資料" EnhancePager="True" KeepSelectedRows="False"
                OnPageIndexChanging="gridUChatMember_PageIndexChanging"
                OnRowDataBound="gridUChatMember_RowDataBound" OnSorting="gridUChatMember_Sorting"
                PageSize="15" Width="100%" meta:resourcekey="gridChatMemberResource1" DefaultSortColumnName="USER_NAME" CustomDropDownListPage="False" SelectedRowColor="" UnSelectedRowColor="">
                <EnhancePagerSettings ShowHeaderPager="True" FirstAltImageUrl="" FirstImageUrl="" LastAltImage="" LastImageUrl="" NextIAltImageUrl="" NextImageUrl="" PageInfoCssClass="" PageNumberCssClass="" PageNumberCurrentCssClass="" PageRedirectCssClass="" PreviousAltImageUrl="" PreviousImageUrl="" />
                <ExportExcelSettings AllowExportToExcel="False" />
                <Columns>
                    <asp:TemplateField HeaderText="聊天室成員" SortExpression="USER_NAME" meta:resourcekey="TemplateFieldResource1">
                        <ItemTemplate>
                            <asp:Label ID="lblUser" runat="server" Text='<%# Bind("USER_GUID") %>' meta:resourcekey="lblUserResource1"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>                    
                </Columns>
            </Fast:Grid>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
