<%@ Page Title="人員刷卡設定查詢" Language="C#" MasterPageFile="~/Master/DefaultMasterPage.master" AutoEventWireup="true" Inherits="QueryDutyPunchSetting" Culture="auto" UICulture="auto" CodeBehind="QueryDutyPunchSetting.aspx.cs" meta:resourcekey="PageResource1" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>
<%@ Register Src="../../../Common/Organization/UC_DeptManagerTree.ascx" TagName="UC_DeptManagerTree" TagPrefix="uc1" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <telerik:RadToolBar ID="RadToolBar1" runat="server" Width="100%" OnButtonClick="RadToolBar1_OnButtonClick" meta:resourcekey="RadToolBar1Resource1" SingleClick="None">
                <Items>

                    <telerik:RadToolBarButton runat="server" Text="查詢" Value="Serach"
                        CheckedImageUrl="~/Common/Images/Icon/icon_m39.gif"
                        DisabledImageUrl="~/Common/Images/Icon/icon_m39.gif"
                        HoveredImageUrl="~/Common/Images/Icon/icon_m39.gif"
                        ImageUrl="~/Common/Images/Icon/icon_m39.gif"
                        meta:resourcekey="RadToolBarSerachResource1">
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton IsSeparator="true" meta:resourcekey="RadToolBarButtonResource1"></telerik:RadToolBarButton>
                    <telerik:RadToolBarButton Value="Tip">
                        <ItemTemplate>
                            <%--padding-top→為了對齊前方ToolBarButton按鈕與文字 --%>
                            <div id="divTip" style="padding-top: 5px">
                                <asp:Label ID="lblTipTxt" runat="server" Text="*查詢結果僅會顯示功能設定為啟用的人員" ForeColor="Blue" meta:resourcekey="lblTipTxtResource1"></asp:Label>
                            </div>
                        </ItemTemplate>
                    </telerik:RadToolBarButton>
                </Items>
            </telerik:RadToolBar>

            <table class="PopTable" style="width: 100%">
                <tr>

                    <td>
                        <asp:Label ID="Label2" runat="server" Text="刷卡功能名稱"
                            meta:resourcekey="Label2Resource1"></asp:Label>
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlType" runat="server"
                            meta:resourcekey="ddlTypeResource1">
                            <asp:ListItem Value="0" Selected="True" meta:resourcekey="ListItemResource1">全部</asp:ListItem>
                            <asp:ListItem Value="1" meta:resourcekey="ListItemResource2">刷卡IP範圍</asp:ListItem>
                            <asp:ListItem Value="2" meta:resourcekey="ListItemResource3">App刷卡範圍</asp:ListItem>
                            <asp:ListItem Value="3" meta:resourcekey="ListItemResource4">只可用App人員</asp:ListItem>
                            <asp:ListItem Value="4" meta:resourcekey="ListItemResource5">特殊人員</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label3" runat="server" Text="人員"
                            meta:resourcekey="Label3Resource1"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtName" runat="server" meta:resourcekey="txtNameResource1"></asp:TextBox>
                        <asp:Label ID="Label4" runat="server" ForeColor="Blue" Text="(可輸入姓名、帳號)"
                            meta:resourcekey="Label4Resource1"></asp:Label>
                    </td>
                </tr>

            </table>
            <div style="margin-top: 2px;">
                <Fast:Grid ID="grid" runat="server" AutoGenerateCheckBoxColumn="False"
                    AutoGenerateColumns="False" AllowPaging="True"
                    DataKeyOnClientWithCheckBox="False"
                    AllowSorting="True" DefaultSortDirection="Ascending" DefaultSortColumnName="USER_DEPT,USER_NAME,TYPE" EmptyDataText="沒有資料" EnhancePager="True" KeepSelectedRows="False"
                    PageSize="15"
                    OnPageIndexChanging="grid_PageIndexChanging"
                    OnRowDataBound="grid_RowDataBound" OnSorting="grid_Sorting"
                    OnBeforeExport="grid_BeforeExport" Width="100%"
                    meta:resourcekey="gridResource1" CustomDropDownListPage="False" SelectedRowColor="" UnSelectedRowColor="">
                    <EnhancePagerSettings ShowHeaderPager="True" FirstAltImageUrl="" FirstImageUrl="" LastAltImage="" LastImageUrl="" NextIAltImageUrl="" NextImageUrl="" PageInfoCssClass="" PageNumberCssClass="" PageNumberCurrentCssClass="" PageRedirectCssClass="" PreviousAltImageUrl="" PreviousImageUrl="" />
                    <ExportExcelSettings AllowExportToExcel="True" />
                    <Columns>

                        <asp:BoundField DataField="USER_DEPT" SortExpression="USER_DEPT" HeaderText="部門" meta:resourcekey="BoundFieldResource1">
                            <HeaderStyle Wrap="False" />
                        </asp:BoundField>

                        <asp:BoundField DataField="USER_NAME" SortExpression="USER_NAME" HeaderText="人員" meta:resourcekey="BoundFieldResource2">
                            <HeaderStyle Wrap="False" />
                        </asp:BoundField>

                        <asp:BoundField DataField="TYPE" SortExpression="TYPE" HeaderText="功能列表" meta:resourcekey="BoundFieldResource3">
                            <HeaderStyle Wrap="False" />
                        </asp:BoundField>

                        <asp:BoundField DataField="SETTING" HeaderText="設定內容" meta:resourcekey="BoundFieldResource4">
                            <HeaderStyle Wrap="False" />
                        </asp:BoundField>

                        <asp:TemplateField HeaderText="維護人員" SortExpression="MODIFIER_NAME" meta:resourcekey="BoundFieldResource5">
                            <ItemTemplate>
                                <asp:Label ID="lblModifier" runat="server"></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle Width="10%" Wrap="False" />
                            <ItemStyle Wrap="False" />
                        </asp:TemplateField>

                        <asp:BoundField DataField="MODIFY_DATE" SortExpression="MODIFY_DATE" HeaderText="維護時間" meta:resourcekey="BoundFieldResource6">
                            <HeaderStyle Width="10%" Wrap="False" />
                        </asp:BoundField>

                    </Columns>
                </Fast:Grid>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>

    <asp:Label ID="lbl104PunchModule" runat="server" Text="假勤管理" Visible="False" meta:resourcekey="lbl104PunchModuleResource1"></asp:Label>
    <asp:Label ID="lblUOFPunchModule" runat="server" Text="刷卡管理" Visible="False" meta:resourcekey="lblUOFPunchModuleResource1"></asp:Label>
    <asp:Label ID="lbl104QueryGroup" runat="server" Text="統計查詢" Visible="False" meta:resourcekey="lbl104QueryGroupResource1"></asp:Label>
    <asp:Label ID="lblUOFQueryGroup" runat="server" Text="查詢" Visible="False" meta:resourcekey="lblUOFQueryGroupResource1"></asp:Label>

    <asp:Label ID="lblIPRangeTxt" runat="server" Text="可刷卡IP範圍" Style="display: none" meta:resourcekey="lblIPRangeTxtResource1"></asp:Label>
    <asp:Label ID="lblAPPRangeTxt" runat="server" Text="APP刷卡範圍" Style="display: none" meta:resourcekey="lblAPPRangeTxtResource1"></asp:Label>
    <asp:Label ID="lblOnlyAppTxt" runat="server" Text="只可用APP" Style="display: none" meta:resourcekey="lblOnlyAppTxtResource1"></asp:Label>
    <asp:Label ID="lblExcludeTxt" runat="server" Text="特殊人員" Style="display: none" meta:resourcekey="lblExcludeTxtResource1"></asp:Label>
    <asp:Label ID="lblYesTxt" runat="server" Text="是" Style="display: none" meta:resourcekey="lblYesTxtResource1"></asp:Label>
    <asp:Label ID="lblEmptyData" runat="server" Text="沒有資料" Style="display: none" meta:resourcekey="lblEmptyDataResource1"></asp:Label>

</asp:Content>

