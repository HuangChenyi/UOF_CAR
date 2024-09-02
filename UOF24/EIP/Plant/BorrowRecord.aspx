<%@ Page Language="C#" MasterPageFile="~/Master/TwoColumn.master" AutoEventWireup="true" Inherits="EIP_Plant_BorrowRecord" Title="借用紀錄" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" Codebehind="BorrowRecord.aspx.cs" %>
<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%--<%@ Register Assembly="System.Web.Extensions" Namespace="System.Web.UI" TagPrefix="asp" %>--%>

<asp:Content ID="Content1" ContentPlaceHolderID="ScriptContentPlaceHolder" runat="Server"></asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ToolbarContentPlaceHolder" runat="Server">
    <telerik:RadToolBar ID="RadToolBar1" runat="server" Width="100%" OnButtonClick="RadToolBar1_ButtonClick" meta:resourcekey="RadToolBar1Resource1">
        <Items>
            <telerik:RadToolBarButton runat="server" Value="Status" meta:resourcekey="RadToolBarButtonResource1">
                <ItemTemplate>
                    <table>
                        <tr>
                            <td>
                                <asp:Label ID="Label1" runat="server" Text="狀態" meta:resourcekey="Label1Resource2"></asp:Label>
                            </td>
                            <td>
                                <asp:DropDownList ID="ddlState" runat="server" meta:resourcekey="ddlStateResource1">
                                    <asp:ListItem Value="0" meta:resourcekey="ListItemResource1" Text="全部"></asp:ListItem>
                                    <asp:ListItem Value="1" meta:resourcekey="ListItemResource2" Text="預約"></asp:ListItem>
                                    <asp:ListItem Value="2" meta:resourcekey="ListItemResource6" Text="審核中"></asp:ListItem>
                                    <asp:ListItem Value="3" meta:resourcekey="ListItemResource3" Text="已借出"></asp:ListItem>
                                    <asp:ListItem Value="4" meta:resourcekey="ListItemResource4" Text="已歸還"></asp:ListItem>
                                    <asp:ListItem Value="5" meta:resourcekey="ListItemResource5" Text="被拒絕"></asp:ListItem>
                                </asp:DropDownList>
                            </td>
                        </tr>
                    </table>
                </ItemTemplate>
            </telerik:RadToolBarButton>
            <telerik:RadToolBarButton runat="server" IsSeparator="True" meta:resourcekey="RadToolBarButtonResource2">
            </telerik:RadToolBarButton>
            <telerik:RadToolBarButton runat="server" Value="QueryDate" meta:resourcekey="RadToolBarButtonResource3">
                <ItemTemplate>
                    <table>
                        <tr>
                            <td>
                                <asp:Label ID="Label2" runat="server" Text="借用日期" meta:resourcekey="Label2Resource1"></asp:Label>
                            </td>
                            <td>
                                <telerik:RadDatePicker ID="rdStart" runat="server">
                                </telerik:RadDatePicker>
                            </td>
                            <td>
                                <asp:Label ID="Label3" runat="server" Text="~" meta:resourcekey="Label3Resource1"></asp:Label>
                            </td>
                            <td>
                                <telerik:RadDatePicker ID="rdEnd" runat="server">
                                </telerik:RadDatePicker>
                            </td>
                        </tr>
                    </table>
                </ItemTemplate>
            </telerik:RadToolBarButton>
            <telerik:RadToolBarButton runat="server" IsSeparator="True" meta:resourcekey="RadToolBarButtonResource4">
            </telerik:RadToolBarButton>
            <telerik:RadToolBarButton runat="server" Text="查詢" Value="Query"
                ImageUrl="~/Common/Images/Icon/icon_m39.gif" DisabledImageUrl="~/Common/Images/Icon/icon_m39.gif"
                HoveredImageUrl="~/Common/Images/Icon/icon_m39.gif" ClickedImageUrl="~/Common/Images/Icon/icon_m39.gif"
                meta:resourcekey="RadToolBarButtonResource5">
            </telerik:RadToolBarButton>
            <telerik:RadToolBarButton runat="server" IsSeparator="True" meta:resourcekey="RadToolBarButtonResource6">
            </telerik:RadToolBarButton>
        </Items>
    </telerik:RadToolBar>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="LeftContentPlaceHolder" runat="Server">
    <telerik:RadTreeView ID="treePlant" runat="server" EnableNodeTextHtmlEncoding="true" OnNodeClick="treePlant_NodeClick" meta:resourcekey="treePlantResource1"></telerik:RadTreeView>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="RightContentPlaceHolder" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <Fast:Grid ID="Grid1" runat="server" AllowSorting="True" AutoGenerateCheckBoxColumn="False"
                AutoGenerateColumns="False"   Width="100%"
                OnRowDataBound="Grid1_RowDataBound" AllowPaging="True" DataKeyNames="DETAIL_GUID" DataKeyOnClientWithCheckBox="False" OnSorting="Grid1_Sorting" OnPageIndexChanging="Grid1_PageIndexChanging"  DefaultSortDirection="Descending" EmptyDataText="沒有資料" EnhancePager="True" KeepSelectedRows="False" meta:resourcekey="Grid1Resource2" PageSize="15" DefaultSortColumnName="PLANT_NAME" OnBeforeExport="Grid1_BeforeExport" CustomDropDownListPage="False" SelectedRowColor="" UnSelectedRowColor="">
                <EnhancePagerSettings FirstAltImageUrl="" FirstImageUrl="" LastAltImage="" LastImageUrl="" NextIAltImageUrl="" NextImageUrl="" PageInfoCssClass="" PageNumberCssClass="" PageNumberCurrentCssClass="" PageRedirectCssClass="" PreviousAltImageUrl="" PreviousImageUrl="" ShowHeaderPager="True" />
                <ExportExcelSettings AllowExportToExcel="True" DataSourceType="ObjectDataSource"  />
                <Columns>
                    <asp:BoundField DataField="SUBJECT" HeaderText="主旨" meta:resourcekey="BoundFieldResource5" SortExpression="SUBJECT">
                    <ItemStyle HorizontalAlign="Left" Wrap="false" Width="150px" />
                    </asp:BoundField>
                    <asp:BoundField DataField="DESCRIPTION" HeaderText="說明" meta:resourcekey="BoundFieldResource6" SortExpression="DESCRIPTION">
                    <ItemStyle HorizontalAlign="Left" Wrap="true" Width="300px" />
                    </asp:BoundField>
                    <asp:TemplateField HeaderText="名稱" meta:resourcekey="TemplateFieldResource1" SortExpression="PLANT_NAME">
                        <ItemTemplate>
                            <asp:LinkButton ID="btnViewDetail" runat="server" CommandName="btnViewDetail" meta:resourceKey="btnViewDetailResource1" Text='<%#: Eval("PLANT_NAME") %>'></asp:LinkButton>
                        </ItemTemplate>                        
                        <ItemStyle Wrap="false" Width="100px" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="借用時間" meta:resourcekey="TemplateFieldResource2">
                        <ItemTemplate>
                            <table>
                                <tbody>
                                    <tr>
                                        <td>
                                            <asp:Literal ID="Literal1" runat="server"></asp:Literal>                                            
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </ItemTemplate>
                        <ItemStyle Wrap="false" Width="200px" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="借出時間" meta:resourcekey="BoundFieldResource1" SortExpression="LOAN_TIME">
                        <ItemTemplate>
                            <asp:Label ID="lblLoanTime" runat="server"></asp:Label>
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Left" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="歸還時間" meta:resourcekey="BoundFieldResource2" SortExpression="RETURN_TIME">
                        <ItemTemplate>
                            <asp:Label ID="lblReturnTime" runat="server"></asp:Label>
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Left" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="目前狀態" meta:resourcekey="BoundFieldResource3" SortExpression="BORROW_STATE">
                        <ItemTemplate>
                            <asp:Label ID="lblStatus" runat="server" Text='<%# Bind("BORROW_STATE") %>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle Width="100px" Wrap="False" />
                    </asp:TemplateField>
                    <asp:BoundField DataField="OWNER" HeaderText="借用人" meta:resourcekey="BoundFieldResource4" SortExpression="OWNER_NAME">
                        <ItemStyle Wrap="false" Width="150px" />
                    </asp:BoundField>
                </Columns>
                <HeaderStyle Wrap="false" />
            </Fast:Grid>
        </ContentTemplate>
    </asp:UpdatePanel>
    <asp:Label ID="Label4" runat="server" meta:resourcekey="Label1Resource1" Text="類別列表" Visible="false"></asp:Label>
    <asp:Label ID="lbUserGuid" runat="server" Visible="False" meta:resourcekey="lbUserGuidResource1"></asp:Label>
    <asp:Label ID="lbAll" runat="server" Text="全部" Visible="False" meta:resourcekey="lbAllResource1"></asp:Label>
    <asp:Label ID="lbSteteBooking" runat="server" Text="預約" Visible="False" meta:resourcekey="lbSteteBookingResource1"></asp:Label>
    <asp:Label ID="lbSteteLoaned" runat="server" Text="已借出" Visible="False" meta:resourcekey="lbSteteLoanedResource1"></asp:Label>
    <asp:Label ID="lbSteteReturned" runat="server" Text="歸還" Visible="False" meta:resourcekey="lbSteteReturnedResource1"></asp:Label>
    <asp:Label ID="lbSteteRejected" runat="server" Text="被拒絕" Visible="False" meta:resourcekey="lbSteteRejectedResource1"></asp:Label>
    <asp:Label ID="lblStateSigning" runat="server" Text="審核中" Visible="False" meta:resourcekey="lblStateSigningResource1"></asp:Label>
    <asp:HiddenField ID="hfCurrentUser" Value="True" runat="server" />
</asp:Content>





