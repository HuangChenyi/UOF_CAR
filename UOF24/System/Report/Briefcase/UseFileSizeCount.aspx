<%@ Page Language="C#" MasterPageFile="~/Master/DefaultMasterPage.master" AutoEventWireup="true" Inherits="System_Report_Briefcase_UseFileSizeCount" Title="公事包使用容量統計" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" Codebehind="UseFileSizeCount.aspx.cs" %>

<%--<%@ Register Assembly="System.Web.Extensions" Namespace="System.Web.UI" TagPrefix="asp" %>--%>


<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <telerik:RadToolBar ID="RadToolBar1" runat="server" Width="100%" OnButtonClick="RadToolBar1_ButtonClick" meta:resourcekey="RadToolBar1Resource1">
        <Items>
            <telerik:RadToolBarButton runat="server" Text="Button 0" Value="Keyword" meta:resourcekey="RadToolBarButtonResource1">
                <ItemTemplate>
                    <table>
                        <tr>
                            <td style="white-space:nowrap">
                                <asp:Label ID="Label4" runat="server" Text="人員" meta:resourcekey="Label4Resource1"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="txtKeyword" runat="server" meta:resourcekey="txtKeywordResource1"></asp:TextBox>
                            </td>
                        </tr>
                    </table>
                </ItemTemplate>
            </telerik:RadToolBarButton>
            <telerik:RadToolBarButton runat="server" IsSeparator="True" Text="Button 1" meta:resourcekey="RadToolBarButtonResource2">
            </telerik:RadToolBarButton>
            <telerik:RadToolBarButton runat="server" Text="查詢" Value="Query"
                ClickedImageUrl="~/Common/Images/Icon/icon_m39.gif" 
                DisabledImageUrl="~/Common/Images/Icon/icon_m39.gif" 
                HoveredImageUrl="~/Common/Images/Icon/icon_m39.gif" 
                ImageUrl="~/Common/Images/Icon/icon_m39.gif" meta:resourcekey="RadToolBarButtonResource3">
            </telerik:RadToolBarButton>
            <telerik:RadToolBarButton runat="server" IsSeparator="True" Text="Button 3" meta:resourcekey="RadToolBarButtonResource4">
            </telerik:RadToolBarButton>
        </Items>
    </telerik:RadToolBar>
    <table class="SizeMemo">
        <tr>
            <td style="white-space:nowrap" >
                <asp:Label ID="lblMaxFileTotal" runat="server" meta:resourcekey="lblUsedFileSizeTotalResource1"></asp:Label>

            </td>
            <td style="width:20px"></td>
            <td style="white-space:nowrap">
                <asp:Label ID="lblUsedFileSizeTotal" runat="server" meta:resourcekey="lblUsedFileSizeTotalResource1"></asp:Label></td>
        </tr>
    </table>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <Fast:Grid ID="DGUseInfoList" runat="server" AutoGenerateCheckBoxColumn="False" AutoGenerateColumns="False" AllowSorting="True" OnPageIndexChanging="DGUseInfoList_PageIndexChanging" OnSorting="DGUseInfoList_Sorting" AllowPaging="True" meta:resourcekey="DGUseInfoListResource1" OnRowDataBound="DGUseInfoList_RowDataBound"  DataKeyOnClientWithCheckBox="False" DefaultSortDirection="Ascending" EmptyDataText="沒有資料" EnhancePager="True" KeepSelectedRows="False" PageSize="15"  >
                <EnhancePagerSettings FirstAltImageUrl="" FirstImageUrl="" LastAltImage="" LastImageUrl="" NextIAltImageUrl="" NextImageUrl="" PageInfoCssClass="" PageNumberCssClass="" PageNumberCurrentCssClass="" PageRedirectCssClass="" PreviousAltImageUrl="" PreviousImageUrl="" ShowHeaderPager="True" />
                <ExportExcelSettings AllowExportToExcel="False" />
                <Columns>
                    <asp:TemplateField HeaderText="使用者名稱" meta:resourcekey="TemplateFieldResource1" SortExpression="USER_GUID">
                        <ItemTemplate>
                            <asp:Label runat="server" ID="lblUser" meta:resourceKey="lblUserResource1"></asp:Label>


                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="MAX_FILE_SIZE_GRID" HeaderText="可使用容量" SortExpression="MAX_FILE_SIZE" meta:resourcekey="BoundFieldResource3" />
                    <asp:BoundField DataField="USED_SIZE_GRID" HeaderText="已使用容量統計" SortExpression="USED_SIZE" meta:resourcekey="BoundFieldResource4" />
                    <asp:BoundField DataField="USE_RATE_GRID" HeaderText="使用率" SortExpression="USE_RATE" meta:resourcekey="BoundFieldResource5" />

                </Columns>
            </Fast:Grid>
        </ContentTemplate>
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="RadToolBar1" EventName="ButtonClick"></asp:AsyncPostBackTrigger>
        </Triggers>
    </asp:UpdatePanel>
    <asp:Label ID="Label1" runat="server" Text="可使用容量總計：" Visible="False" meta:resourcekey="Label1Resource1"></asp:Label>
    <asp:Label ID="Label2" runat="server" Text="已使用容量總計：" Visible="False" meta:resourcekey="Label2Resource1"></asp:Label>
    <asp:Label ID="Label3" runat="server" Text="MB" Visible="False" meta:resourcekey="Labe3Resource1"></asp:Label>
</asp:Content>

