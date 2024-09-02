<%@ Page Language="C#" MasterPageFile="~/Master/DefaultMasterPage.master" AutoEventWireup="true" Inherits="System_OnlineUser_Default" Title="線上使用者管理"
    Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" CodeBehind="Default.aspx.cs" %>

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
            <Fast:Grid ID="Grid1" runat="server" AllowSorting="True" AutoGenerateCheckBoxColumn="False"
                AutoGenerateColumns="False" DataKeyNames="userGuid,ip"
                OnPageIndexChanging="Grid1_PageIndexChanging" OnRowCommand="Grid1_RowCommand"
                OnRowDataBound="Grid1_RowDataBound" AllowPaging="True" DataKeyOnClientWithCheckBox="False" 
                OnBeforeExport="Grid1_BeforeExport" CustomDropDownListPage="False"
                EmptyDataText="No data found" EnhancePager="True" KeepSelectedRows="False" PageSize="15" SelectedRowColor="" UnSelectedRowColor="" meta:resourcekey="Grid1Resource2"  OnSorting="Grid1_Sorting">
                <EnhancePagerSettings ShowHeaderPager="True" />
                <ExportExcelSettings AllowExportToExcel="True" />
                <Columns>
                    <asp:TemplateField HeaderText="使用者" SortExpression="GroupName" meta:resourcekey="TemplateFieldResource1">
                        <ItemTemplate>
                            <asp:Label runat="server" Text='<%# Bind("userGUID") %>' ID="Label1" meta:resourceKey="Label1Resource1"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="來源" SortExpression="source" meta:resourcekey="TemplateFieldResource3">
                        <ItemTemplate>
                            <asp:Label ID="lblDevice" runat="server" Text='<%# Bind("source") %>' meta:resourcekey="lblDeviceResource1"></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle Wrap="False"/>
                        <ItemStyle Wrap="False" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="IP/裝置" meta:resourcekey="TemplateFieldResource4">
                        <ItemTemplate>
                            <asp:Label ID="lblIPorDeviceId" runat="server" meta:resourcekey="lblIPorDeviceIdResource1" ></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="最後要求時間" SortExpression="requestTime" meta:resourcekey="TemplateFieldResource5">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("requestTime") %>' meta:resourcekey="TextBox1Resource1"></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblRequestTime" runat="server" Text='<%# Bind("requestTime") %>' meta:resourcekey="lblRequestTimeResource1"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="使用模組" SortExpression="module" meta:resourcekey="TemplateFieldResource2">
                        <ItemTemplate>
                            <asp:Label runat="server" Text='<%# Bind("module") %>' ID="Label2" meta:resourceKey="Label2Resource1"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:ButtonField CommandName="kick" Text="強制登出" meta:resourcekey="ButtonFieldResource1" />
                </Columns>
            </Fast:Grid>
            <asp:HiddenField ID="hfCurrentUser" runat="server" />
        </ContentTemplate>
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="RadToolBar1" EventName="ButtonClick" />
        </Triggers>
    </asp:UpdatePanel>
</asp:Content>
