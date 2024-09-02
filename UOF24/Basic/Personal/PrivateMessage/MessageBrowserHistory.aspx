<%@ Page Title="" Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" CodeBehind="MessageBrowserHistory.aspx.cs" Inherits="Ede.Uof.Web.Basic.Personal.PrivateMessage.MessageBrowserHistory" culture="auto" uiculture="auto" meta:resourcekey="PageResource1" %>

<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Ede" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <Ede:Grid ID="grdReadRecord" runat="server" AutoGenerateCheckBoxColumn="False" AllowSorting="True"
                AutoGenerateColumns="False" Width="100%" DataKeyNames="MESSAGE_TO" AllowPaging="True" DefaultSortDirection="Ascending" DefaultSortColumnName="NAME"
                OnRowDataBound="grdReadRecord_RowDataBound" OnPageIndexChanging="grdReadRecord_PageIndexChanging" OnSorting="grdReadRecord_Sorting" CustomDropDownListPage="False" DataKeyOnClientWithCheckBox="False" EmptyDataText="No data found" EnhancePager="True" KeepSelectedRows="False" meta:resourcekey="grdReadRecordResource1" PageSize="15" SelectedRowColor="" UnSelectedRowColor="">
                <EnhancePagerSettings ShowHeaderPager="True" FirstAltImageUrl="" FirstImageUrl="" LastAltImage="" LastImageUrl="" NextIAltImageUrl="" NextImageUrl="" PageInfoCssClass="" PageNumberCssClass="" PageNumberCurrentCssClass="" PageRedirectCssClass="" PreviousAltImageUrl="" PreviousImageUrl=""></EnhancePagerSettings>
                        <ExportExcelSettings AllowExportToExcel="False"></ExportExcelSettings>
                        <Columns>
                            <asp:TemplateField HeaderText="瀏覽者" SortExpression="NAME" meta:resourcekey="TemplateFieldResource1">
                                <ItemTemplate>
                                    <asp:Label runat="server" ID="lblViewer" meta:resourcekey="lblViewerResource1"></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="閱讀時間" SortExpression="READED_TIME" meta:resourcekey="TemplateFieldResource2">
                                <ItemTemplate>
                                    <asp:Label ID="lblReadTime" runat="server" meta:resourcekey="lblReadTimeResource1"></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
            </Ede:Grid>
            <Ede:Grid ID="grdReplyRecord" runat="server" AutoGenerateCheckBoxColumn="False" AllowSorting="True"
                        AutoGenerateColumns="False" Width="100%" DataKeyNames="MESSAGE_TO" AllowPaging="True" DefaultSortDirection="Ascending" DefaultSortColumnName="NAME"
                        OnRowDataBound="grdReplyRecord_RowDataBound" OnPageIndexChanging="grdReplyRecord_PageIndexChanging" OnSorting="grdReplyRecord_Sorting" CustomDropDownListPage="False" DataKeyOnClientWithCheckBox="False" EmptyDataText="No data found" EnhancePager="True" KeepSelectedRows="False" meta:resourcekey="grdReplyRecordResource1" PageSize="15" SelectedRowColor="" UnSelectedRowColor="">
                <EnhancePagerSettings ShowHeaderPager="True" FirstAltImageUrl="" FirstImageUrl="" LastAltImage="" LastImageUrl="" NextIAltImageUrl="" NextImageUrl="" PageInfoCssClass="" PageNumberCssClass="" PageNumberCurrentCssClass="" PageRedirectCssClass="" PreviousAltImageUrl="" PreviousImageUrl=""></EnhancePagerSettings>
                        <ExportExcelSettings AllowExportToExcel="False"></ExportExcelSettings>
                        <Columns>
                            <asp:TemplateField HeaderText="回覆者" SortExpression="NAME" meta:resourcekey="TemplateFieldResource3">
                                <ItemTemplate>
                                    <asp:Label runat="server" ID="lblReplier" meta:resourcekey="lblReplierResource1"></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="回覆時間" SortExpression="REPLY_TIME" meta:resourcekey="TemplateFieldResource4">
                                <ItemTemplate>
                                    <asp:Label ID="lblReplyTime" runat="server" meta:resourcekey="lblReplyTimeResource1"></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
            </Ede:Grid>
            <asp:HiddenField ID="hfMasterGuid" runat="server" />
            <asp:HiddenField ID="hfType" runat="server" />
            <asp:Label ID="lblReplyTitle" runat="server" Text="回覆記錄" Style="display:none" meta:resourcekey="lblReplyTitleResource1"></asp:Label>
            <asp:Label ID="lblReadTitle" runat="server" Text="閱讀記錄" Style="display:none" meta:resourcekey="lblReadTitleResource1"></asp:Label>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
