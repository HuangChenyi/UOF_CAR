<%@ Page Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="EIP_SMS_MessageDetail" Title="訊息明細" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" CodeBehind="MessageDetail.aspx.cs" %>

<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <Fast:Grid ID="Grid1" runat="server" AllowPaging="True" Width="100%"
        AutoGenerateCheckBoxColumn="False" AutoGenerateColumns="False"
        AllowSorting="True"
        DataKeyOnClientWithCheckBox="False" DefaultSortDirection="Ascending"
        EnhancePager="True" PageSize="20"
        OnPageIndexChanging="Grid1_PageIndexChanging"
        OnRowDataBound="Grid1_RowDataBound" CustomDropDownListPage="False" EmptyDataText="No data found" KeepSelectedRows="False" SelectedRowColor="" UnSelectedRowColor="">
        <EnhancePagerSettings FirstImageUrl="" FirstAltImageUrl="" PreviousImageUrl="" NextImageUrl="" LastImageUrl="" LastAltImage="" PageNumberCssClass="" PageNumberCurrentCssClass="" PageInfoCssClass="" PageRedirectCssClass="" NextIAltImageUrl="" PreviousAltImageUrl="" ShowHeaderPager="True"></EnhancePagerSettings>

        <ExportExcelSettings AllowExportToExcel="False"></ExportExcelSettings>
        <Columns>
            <asp:BoundField DataField="RECEIVER_NAME" HeaderText="姓名"
                meta:resourcekey="BoundFieldResource1">
                <HeaderStyle Wrap="False" />
            </asp:BoundField>

            <asp:BoundField DataField="RECEIVER_PHONE" HeaderText="電話"
                meta:resourcekey="BoundFieldResource2">
                <HeaderStyle Wrap="False" />
            </asp:BoundField>

            <asp:TemplateField HeaderText="發送時間" SortExpression="SEND_TIME" meta:resourcekey="BoundFieldResource3">
                <ItemTemplate>
                    <asp:Label ID="lblSendTime" runat="server"></asp:Label>
                </ItemTemplate>
                <HeaderStyle Wrap="False" />
                <ItemStyle Width="100px" Wrap="False" />
            </asp:TemplateField>

            <asp:BoundField DataField="USED_MSG_COUNT" HeaderText="使用通數"
                meta:resourcekey="BoundFieldResource4">
                <HeaderStyle Wrap="False" />
            </asp:BoundField>

            <asp:BoundField DataField="SEND_RESULT" HeaderText="發送結果"
                meta:resourcekey="BoundFieldResource5">
                <HeaderStyle Wrap="False" />
            </asp:BoundField>
        </Columns>
    </Fast:Grid>

    <asp:Label ID="lblNonSend" runat="server" Text="未發送" Visible="False" meta:resourcekey="lblNonSendResource1"></asp:Label>
    <asp:Label ID="lblSucc" runat="server" Text="成功" Visible="False" meta:resourcekey="lblSuccResource1"></asp:Label>
    <asp:Label ID="lblFail" runat="server" Text="失敗" Visible="False" meta:resourcekey="lblFailResource1"></asp:Label>
</asp:Content>

