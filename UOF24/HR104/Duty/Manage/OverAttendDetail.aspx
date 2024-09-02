<%@ Page Title="明細" Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" CodeBehind="OverAttendDetail.aspx.cs" Inherits="Ede.Uof.Web.HR104.Duty.Manage.OverAttendDetail" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" %>
<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="EdeGrid" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <telerik:RadToolBar ID="rtbOverAttendDetail" runat="server" SingleClick="None" Width="100%" OnButtonClick="rtbOverAttendDetail_ButtonClick" meta:resourcekey="rtbOverAttendDetailResource1">
        <Items>
            <telerik:RadToolBarButton runat="server" Value="QueryCondition" meta:resourcekey="RadToolBarButtonResource1">
                <ItemTemplate>
                    <table>
                        <tr>
                            <td>
                                <asp:Label ID="lblUserTitle" runat="server" Text="人員:" meta:resourcekey="lblUserTitleResource1"></asp:Label>
                            </td>
                            <td>&nbsp;</td>
                            <td>
                                <asp:TextBox ID="txtKeyWord" runat="server" meta:resourcekey="txtKeyWordResource1"></asp:TextBox>
                            </td>
                            <td>&nbsp;&nbsp;</td>
                            <td>
                                <asp:Label ID="lblStatusTitle" runat="server" Text="狀態:" meta:resourcekey="lblStatusTitleResource1"></asp:Label>
                            </td>
                            <td>&nbsp;</td>
                            <td>
                                <asp:DropDownList ID="ddlStatus" runat="server" meta:resourcekey="ddlStatusResource1">
                                    <asp:ListItem Text="全部" Value="All" meta:resourcekey="liStatusAllResource1"></asp:ListItem>
                                    <asp:ListItem Text="成功" Value="Success" meta:resourcekey="liStatusSuccessResource1"></asp:ListItem>
                                    <asp:ListItem Text="失敗" Value="Fail" meta:resourcekey="liStatusFailResource1"></asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td>&nbsp;</td>
                        </tr>
                    </table>
                </ItemTemplate>
            </telerik:RadToolBarButton>
            <telerik:RadToolBarButton runat="server" Text="查詢" Value="Query"
                ClickedImageUrl="~/Common/Images/Icon/icon_m39.png" DisabledImageUrl="~/Common/Images/Icon/icon_m39.png"
                HoveredImageUrl="~/Common/Images/Icon/icon_m39.png" ImageUrl="~/Common/Images/Icon/icon_m39.png" meta:resourcekey="RadToolBarButtonResource2">
            </telerik:RadToolBarButton>
            <telerik:RadToolBarButton runat="server" IsSeparator="True" meta:resourcekey="RadToolBarButtonResource3">
            </telerik:RadToolBarButton>
            <telerik:RadToolBarButton runat="server" Value="QueryShowCount" meta:resourcekey="RadToolBarButtonResource4">
                <ItemTemplate>
                    <table>
                        <tr>
                            <td>
                                <asp:Label ID="lblExecuteCount" runat="server" Text="處理筆數:{0} 成功筆數:{1} 失敗筆數:{2}" ForeColor="Blue" meta:resourcekey="lblExecuteCountResource1"></asp:Label>
                            </td>
                        </tr>
                    </table>
                </ItemTemplate>
            </telerik:RadToolBarButton>
        </Items>
    </telerik:RadToolBar>

    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <EdeGrid:Grid ID="grdDetail" runat="server" Width="100%" AutoGenerateCheckBoxColumn="False" AutoGenerateColumns="False" 
                CustomDropDownListPage="False" DataKeyOnClientWithCheckBox="False" OnRowDataBound="grdDetail_RowDataBound" 
                EmptyDataText="No data found" EnhancePager="True" KeepSelectedRows="False" SelectedRowColor="" UnSelectedRowColor="" 
                AllowSorting="True" OnSorting="grdDetail_Sorting"
                AllowPaging="True" PageSize="15" OnPageIndexChanging="grdDetail_PageIndexChanging" meta:resourcekey="detailGridResource1">
                <EnhancePagerSettings ShowHeaderPager="True"></EnhancePagerSettings>
                <ExportExcelSettings AllowExportToExcel="False"></ExportExcelSettings>
                <Columns>
                    <asp:BoundField DataField="ACCOUNT" HeaderText="帳號" SortExpression="ACCOUNT" meta:resourcekey="BoundFieldResource3">
                        <HeaderStyle Wrap="False" Width="70px" />
                        <ItemStyle Wrap="False" HorizontalAlign="Left" />
                    </asp:BoundField>
                    <asp:BoundField HeaderText="姓名" DataField="NAME" SortExpression="NAME" meta:resourcekey="BoundFieldResource2">
                        <HeaderStyle Wrap="False" Width="70px" />
                        <ItemStyle Wrap="False" HorizontalAlign="Left" />
                    </asp:BoundField>
                    <asp:BoundField HeaderText="員編" DataField="EMPLOYEE_NO" SortExpression="EMPLOYEE_NO" meta:resourcekey="BoundFieldResource4">
                        <HeaderStyle Wrap="False" Width="70px" />
                        <ItemStyle Wrap="False" HorizontalAlign="Left" />
                    </asp:BoundField>
                    <asp:BoundField HeaderText="部門" DataField="GROUP_NAME" SortExpression="GROUP_NAME" meta:resourcekey="BoundFieldResource5">
                        <HeaderStyle Wrap="False" />
                        <ItemStyle Width="250px"/>
                    </asp:BoundField>
                    <asp:TemplateField HeaderText="起單狀態" SortExpression="FORM_STATUS" meta:resourcekey="TemplateFieldResource2">
                        <ItemTemplate>
                            <asp:Label ID="lblStatus" runat="server" Text='<%#: Bind("FORM_STATUS") %>' meta:resourcekey="lblStatusResource1"></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle Wrap="False" Width="70px" />
                        <ItemStyle Wrap="False" HorizontalAlign="Center" />
                    </asp:TemplateField>
                    <asp:BoundField HeaderText="表單單號" DataField="DOC_NBR" SortExpression="DOC_NBR" meta:resourcekey="BoundFieldResource6">
                        <HeaderStyle Wrap="False" Width="130px" />
                        <ItemStyle Wrap="False" HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:BoundField HeaderText="訊息" DataField="ERROR_MESSAGE" meta:resourcekey="BoundFieldResource7">
                        <HeaderStyle Wrap="False" />
                    </asp:BoundField>
                </Columns>
            </EdeGrid:Grid>
        </ContentTemplate>
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="rtbOverAttendDetail" EventName="ButtonClick" />
        </Triggers>
    </asp:UpdatePanel>
    <asp:Label ID="lblStatusSuccess" runat="server" Text="成功" Visible="False" meta:resourcekey="lblStatusSuccessResource1"></asp:Label>
    <asp:Label ID="lblStatusFail" runat="server" Text="失敗" Visible="False" meta:resourcekey="lblStatusFailResource1"></asp:Label>
    <asp:HiddenField ID="hfMasterGuid" runat="server" />
</asp:Content>
