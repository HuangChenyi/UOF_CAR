<%@ Page Title="" Language="C#" MasterPageFile="~/Master/DefaultMasterPage.master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="System_MobileMenu_Default"  Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" %>

<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Ede" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <Ede:Grid ID="Grid1" runat="server" DataKeyNames="RESOURCE_KEY" AllowSorting="True" AutoGenerateCheckBoxColumn="False" AutoGenerateColumns="False" CustomDropDownListPage="False" DataKeyOnClientWithCheckBox="False" DefaultSortDirection="Ascending" EmptyDataText="No data found" EnhancePager="True" KeepSelectedRows="False" PageSize="15" SelectedRowColor="" UnSelectedRowColor="" Width="50%" OnRowDataBound="Grid1_RowDataBound" meta:resourcekey="Grid1Resource1">
        <EnhancePagerSettings FirstImageUrl="" FirstAltImageUrl="" PreviousImageUrl="" NextImageUrl="" LastImageUrl="" LastAltImage="" PageNumberCssClass="" PageNumberCurrentCssClass="" PageInfoCssClass="" PageRedirectCssClass="" NextIAltImageUrl="" PreviousAltImageUrl="" ShowHeaderPager="True"></EnhancePagerSettings>
        <ExportExcelSettings AllowExportToExcel="False"></ExportExcelSettings>
        <Columns>
            <asp:TemplateField HeaderText="選單名稱" meta:resourcekey="TemplateFieldResource1">
                <ItemTemplate>
                    <asp:Label ID="lblMenuName" runat="server" meta:resourcekey="lblMenuNameResource1"></asp:Label>
                    <asp:Label ID="lblMenuComment" runat="server" CssClass="SizeMemo" meta:resourcekey="lblMenuCommentResource1"></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="內部啟用" HeaderStyle-Width="10%" HeaderStyle-Wrap="False"  meta:resourcekey="TemplateFieldResource2">
                <ItemTemplate>
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        <ContentTemplate>
                            <asp:CheckBox ID="cbEnable" AutoPostBack="True" Checked='<%# Eval("ENABLED") %>' MENU_ID='<%# Eval("MENU_ID") %>' runat="server" OnCheckedChanged="cbEnable_CheckedChanged" meta:resourcekey="cbEnableResource1" />
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </ItemTemplate>
                <HeaderStyle Wrap="False" Width="10%"></HeaderStyle>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="外部啟用" HeaderStyle-Width="10%" HeaderStyle-Wrap="False" meta:resourcekey="MemberEnabledResource1">
                <ItemTemplate>
                    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                        <ContentTemplate>
                            <asp:CheckBox ID="cbMemberEnable" runat="server" AutoPostBack="True" Checked='<%# Eval("MEMBER_ENABLED") %>' MENU_ID='<%# Eval("MENU_ID") %>' OnCheckedChanged="cbMemberEnable_CheckedChanged" />
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </ItemTemplate>
                <HeaderStyle Wrap="False" Width="10%"></HeaderStyle>
            </asp:TemplateField>
        </Columns>
    </Ede:Grid>
    <asp:Label ID="lblSiteSearchComment" runat="server" Text="啟用站內搜尋，需購買龍捲風搜尋引擎" CssClass="SizeMemo" meta:resourcekey="lblSiteSearchCommentResource1"></asp:Label>
    <br />            
    <asp:Label ID="lblNotSupport" runat="server" Text="核選方塊無法維護，代表行動裝置尚不支援" CssClass="SizeMemo" meta:resourcekey="lblNotSupportResource1"></asp:Label>
    <asp:Label ID="lblMobileIsMovieDownload" runat="server" Text="(如啟用此功能，檔案可能會被下載到使用者的行動裝置)" Visible="false" meta:resourcekey="lblMobileIsMovieDownloadResource1"></asp:Label>
    <asp:HiddenField ID="hfUserGuid" runat="server" />
</asp:Content>
