<%@ Page Title="訊息" Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" CodeBehind="SyncHRLog.aspx.cs" Inherits="Ede.Uof.Web.HR104.SyncHR.SyncHRLog" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" %>
<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="EdeGrid" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <EdeGrid:Grid ID="logGrid" runat="server" AutoGenerateCheckBoxColumn="False" AllowSorting="True" AutoGenerateColumns="False" CustomDropDownListPage="False" DataKeyOnClientWithCheckBox="False" DefaultSortDirection="Ascending" EmptyDataText="No data found" EnhancePager="True" KeepSelectedRows="False" PageSize="15" SelectedRowColor="" UnSelectedRowColor="" Width="100%" DefaultSortColumnName="PARAM_TYPE" OnSorting="logGrid_Sorting" AllowPaging="True" OnBeforeExport="logGrid_BeforeExport" OnPageIndexChanging="logGrid_PageIndexChanging" OnRowDataBound="logGrid_RowDataBound" meta:resourcekey="logGridResource1">
                <EnhancePagerSettings ShowHeaderPager="True"></EnhancePagerSettings>

                <ExportExcelSettings AllowExportToExcel="False" DataSourceType="ObjectDataSource"></ExportExcelSettings>
                <Columns>
                    <asp:BoundField DataField="ITEM" HeaderText="項目" meta:resourcekey="BoundFieldResource1" >
                        <HeaderStyle Wrap="False" Width="50%" />
                    </asp:BoundField>
                    <asp:TemplateField HeaderText="狀態" SortExpression="SYNC_TYPE" meta:resourcekey="TemplateFieldResource1">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("SYNC_TYPE") %>' meta:resourcekey="TextBox1Resource1"></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblSyncType" runat="server" Text='<%# Bind("SYNC_TYPE") %>' meta:resourcekey="lblSyncTypeResource1"></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle Wrap="False" />
                    </asp:TemplateField>
                    <asp:BoundField DataField="MESSAGE" HeaderText="訊息" meta:resourcekey="BoundFieldResource2">
                        <HeaderStyle Wrap="False" />
                    </asp:BoundField>
                </Columns>
            </EdeGrid:Grid>

            <asp:Label ID="lblMsgInsert" runat="server" Text="新增" Visible="False" meta:resourcekey="lblMsgInsertResource1"></asp:Label>
            <asp:Label ID="lblMsgUpdate" runat="server" Text="更新" Visible="False" meta:resourcekey="lblMsgUpdateResource1"></asp:Label>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
