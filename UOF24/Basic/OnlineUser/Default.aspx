<%@ Page Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="Basic_OnlineUser_Default" Title="" Culture="auto" meta:resourcekey="PageResource2" UICulture="auto" CodeBehind="Default.aspx.cs" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <telerik:RadToolBar ID="RadToolBar1" runat="server" Width="100%" OnButtonClick="RadToolBar1_ButtonClick">
        <Items>
            <telerik:RadToolBarButton runat="server" DisabledImageUrl="~/Common/Images/Icon/icon_m39.gif"
                HoveredImageUrl="~/Common/Images/Icon/icon_m39.gif" ImageUrl="~/Common/Images/Icon/icon_m39.gif"
                Value="Search" CheckedImageUrl="~/Common/Images/Icon/icon_m39.gif"
                Text="更新名單" meta:resourcekey="RadButtonRefreshResource1">
            </telerik:RadToolBarButton>
            <telerik:RadToolBarButton runat="server" IsSeparator="True">
            </telerik:RadToolBarButton>
        </Items>
    </telerik:RadToolBar>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <Fast:Grid ID="Grid1" Width="100%" runat="server" AllowSorting="True" AutoGenerateCheckBoxColumn="False"
                AutoGenerateColumns="False" DataKeyNames="userGUID,ip" OnPageIndexChanging="Grid1_PageIndexChanging"
                OnRowDataBound="Grid1_RowDataBound" AllowPaging="True"
                DataKeyOnClientWithCheckBox="False" 
                EmptyDataText="沒有資料"
                EnhancePager="True" KeepSelectedRows="False" meta:resourcekey="Grid1Resource2"
                PageSize="15" OnBeforeExport="Grid1_BeforeExport" OnSorting="Grid1_Sorting">
                <EnhancePagerSettings FirstAltImageUrl="" FirstImageUrl="" LastAltImage=""
                    LastImageUrl="" NextIAltImageUrl="" NextImageUrl="" PageInfoCssClass=""
                    PageNumberCssClass="" PageNumberCurrentCssClass="" PageRedirectCssClass=""
                    PreviousAltImageUrl="" PreviousImageUrl="" ShowHeaderPager="True" />
                <ExportExcelSettings AllowExportToExcel="true" />
                <Columns>
                    <asp:TemplateField HeaderText="使用者" ItemStyle-Wrap="false" SortExpression="GroupName" meta:resourcekey="TemplateFieldResource1">
                        <ItemTemplate>
                            <asp:Label runat="server"  ID="lblUser" Text='<%# Bind("userGUID") %>'  meta:resourceKey="Label1Resource1"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="來源" SortExpression="source" ItemStyle-Wrap="false" meta:resourcekey="TemplateFieldResource3">
                        <ItemTemplate>
                            <asp:Label ID="lblDevice" runat="server" Text='<%# Bind("source") %>'></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle Wrap="false"/>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="最後要求時間" ItemStyle-Wrap="false" SortExpression="requestTime" meta:resourcekey="BoundFieldResource1">
                        <ItemTemplate>
                            <asp:Label runat="server" ID="lblRequestTime"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="使用模組" SortExpression="module" ItemStyle-Wrap="false" meta:resourcekey="TemplateFieldResource2">
                        <ItemTemplate>
                            <asp:Label runat="server" Text='<%# Bind("module") %>' ID="Label2" meta:resourceKey="Label2Resource1"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </Fast:Grid>
        </ContentTemplate>
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="RadToolBar1" EventName="ButtonClick" />
        </Triggers>
    </asp:UpdatePanel>
    <asp:Label ID="lbRefresh" runat="server" Text="更新名單" Visible="False" meta:resourcekey="lbRefreshResource1"></asp:Label>
</asp:Content>