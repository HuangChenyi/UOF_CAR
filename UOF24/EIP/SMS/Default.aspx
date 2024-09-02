<%@ Page Title="簡訊發送" Language="C#" MasterPageFile="~/Master/DefaultMasterPage.master" AutoEventWireup="true" Inherits="EIP_SMS_Default" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" CodeBehind="Default.aspx.cs" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>
<%@ Register Assembly="System.Web, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a" Namespace="System.Web.UI" TagPrefix="cc1" %>
<%@ Register Assembly="System.Web, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a" Namespace="System.Web.UI.HtmlControls" TagPrefix="cc2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <script>
        function RadToolBar1_ButtonClicking(sender, args) {
            var value = args.get_item().get_value();
            switch (value) {
                case "Insert":
                    args.set_cancel(true)
                    $uof.dialog.open2("~/EIP/SMS/SendMsg.aspx", args.get_item(), "", 1000, 925, OpenDialogResult);

                    break;
            }
        }

        function OpenDialogResult(returnValue) {
            if (typeof (returnValue) == "undefined")
                return false;
            else
                return true;
        }

        function OnValueChanging(sender, args) {

            if (args.get_newValue() == "") {
                args.set_newValue(args.get_oldValue());
            }
        }
    </script>

    <style type="text/css">
        .breakword {
            word-break: break-all;
        }
    </style>

    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <table width="100%" cellpadding="0" cellspacing="0">
                <tr>
                    <td>
                        <telerik:RadToolBar ID="RadToolBar1" runat="server" OnButtonClick="RadToolBar1_ButtonClick" OnClientButtonClicking="RadToolBar1_ButtonClicking" Width="100%" meta:resourcekey="RadToolBar1Resource1">
                            <Items>
                                <telerik:RadToolBarButton runat="server" ClickedImageUrl="~/Common/Images/Icon/icon_m33.gif" DisabledImageUrl="~/Common/Images/Icon/icon_m33.gif" HoveredImageUrl="~/Common/Images/Icon/icon_m33.gif" ImageUrl="~/Common/Images/Icon/icon_m33.gif" Text="新增簡訊發送" Value="Insert" meta:resourcekey="RadToolBarButtonResource1">
                                </telerik:RadToolBarButton>
                                <telerik:RadToolBarButton runat="server" IsSeparator="True" meta:resourcekey="RadToolBarButtonResource2">
                                </telerik:RadToolBarButton>
                                <telerik:RadToolBarButton runat="server" Value="QueryCondition" meta:resourcekey="RadToolBarButtonResource3">
                                    <ItemTemplate>
                                        <table>
                                            <tr>
                                                <td>
                                                    <asp:Label ID="Label3" runat="server" Text="查詢條件：" meta:resourcekey="Label3Resource1"></asp:Label>
                                                </td>
                                                <td>
                                                    <telerik:RadDatePicker ID="rdpDateStart" runat="server">
                                                        <DateInput runat="server" ClientEvents-OnValueChanging="OnValueChanging"></DateInput>
                                                    </telerik:RadDatePicker>
                                                </td>
                                                <td>
                                                    <asp:Label ID="Label4" runat="server" Text="~" meta:resourcekey="Label4Resource1"></asp:Label>
                                                </td>
                                                <td>
                                                    <telerik:RadDatePicker ID="rdpDateEnd" runat="server">
                                                        <DateInput runat="server" ClientEvents-OnValueChanging="OnValueChanging"></DateInput>
                                                    </telerik:RadDatePicker>
                                                </td>
                                            </tr>
                                        </table>
                                    </ItemTemplate>
                                </telerik:RadToolBarButton>
                                <telerik:RadToolBarButton runat="server" IsSeparator="True" meta:resourcekey="RadToolBarButtonResource4">
                                </telerik:RadToolBarButton>
                                <telerik:RadToolBarButton runat="server" Value="SendStatus" meta:resourcekey="RadToolBarButtonResource5">
                                    <ItemTemplate>
                                        <table>
                                            <tr>
                                                <td>
                                                    <asp:Label ID="Label2" runat="server" Text="發送狀態：" meta:resourcekey="Label2Resource1"></asp:Label>
                                                </td>
                                                <td>
                                                    <asp:DropDownList ID="ddlSendResult" runat="server" meta:resourcekey="ddlSendResultResource1">
                                                        <asp:ListItem meta:resourcekey="ListItemResource1" Value="2" Text="全部"></asp:ListItem>
                                                        <asp:ListItem meta:resourcekey="ListItemResource2" Value="0" Text="未發送"></asp:ListItem>
                                                        <asp:ListItem meta:resourcekey="ListItemResource3" Value="1" Text="已發送"></asp:ListItem>
                                                    </asp:DropDownList>
                                                </td>
                                            </tr>
                                        </table>
                                    </ItemTemplate>
                                </telerik:RadToolBarButton>
                                <telerik:RadToolBarButton runat="server" IsSeparator="True" meta:resourcekey="RadToolBarButtonResource6">
                                </telerik:RadToolBarButton>
                                <telerik:RadToolBarButton runat="server" ClickedImageUrl="~/Common/Images/Icon/icon_m39.gif" DisabledImageUrl="~/Common/Images/Icon/icon_m39.gif" HoveredImageUrl="~/Common/Images/Icon/icon_m39.gif" ImageUrl="~/Common/Images/Icon/icon_m39.gif" Text="查詢" Value="Query" meta:resourcekey="RadToolBarButtonResource7">
                                </telerik:RadToolBarButton>
                                <telerik:RadToolBarButton runat="server" IsSeparator="True" meta:resourcekey="RadToolBarButtonResource8">
                                </telerik:RadToolBarButton>
                            </Items>
                        </telerik:RadToolBar>
                    </td>
                </tr>
                <tr>
                    <td>
                        <Fast:Grid ID="Grid1" runat="server" Width="100%"
                            AutoGenerateCheckBoxColumn="False" AutoGenerateColumns="False" AllowSorting="True" AllowPaging="True"
                            DataKeyOnClientWithCheckBox="False" DefaultSortDirection="Descending" DefaultSortColumnName="SEND_TIME"
                            EnhancePager="True" EmptyDataText="沒有資料"
                            PageSize="15" KeepSelectedRows="False"
                            OnRowCommand="Grid1_RowCommand"
                            OnPageIndexChanging="Grid1_PageIndexChanging"
                            OnRowDataBound="Grid1_RowDataBound"
                            OnSorting="Grid1_Sorting"
                            meta:resourcekey="Grid1Resource2" CustomDropDownListPage="False" SelectedRowColor="" UnSelectedRowColor="">
                            <EnhancePagerSettings ShowHeaderPager="True"></EnhancePagerSettings>
                            <ExportExcelSettings AllowExportToExcel="False"></ExportExcelSettings>
                            <Columns>
                                <asp:TemplateField HeaderText="簡訊主旨" SortExpression="SUBJECT" meta:resourcekey="TemplateFieldResource1">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="lbtnSubject" Style="word-break: break-all" runat="server"
                                            meta:resourcekey="lbtnSubjectResource1"></asp:LinkButton>
                                    </ItemTemplate>
                                    <ItemStyle Width="200px" Wrap="true" CssClass="breakword" />
                                    <HeaderStyle Wrap="false" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="簡訊內容" meta:resourcekey="TemplateFieldResource2">
                                    <ItemTemplate>
                                        <asp:Label ID="Label1" runat="server" Style="word-break: break-all" meta:resourcekey="Label1Resource1"></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle Width="400px" Wrap="True" CssClass="breakword" />
                                </asp:TemplateField>
                                <asp:BoundField DataField="TOTAL_MSG_COUNT" HeaderText="發送筆數" SortExpression="TOTAL_MSG_COUNT" meta:resourcekey="BoundFieldResource2">
                                    <ItemStyle HorizontalAlign="Right" Width="60px" Wrap="false" />
                                    <HeaderStyle Wrap="false" />
                                </asp:BoundField>
                                <asp:BoundField DataField="SUCCESS_COUNT" HeaderText="成功筆數" SortExpression="SUCCESS_COUNT" meta:resourcekey="BoundFieldResource3">
                                    <ItemStyle HorizontalAlign="Right" Width="60px" Wrap="false" />
                                    <HeaderStyle Wrap="false" />
                                </asp:BoundField>
                                <asp:BoundField DataField="FAIL_COUNT" HeaderText="失敗筆數" SortExpression="FAIL_COUNT" meta:resourcekey="BoundFieldResource4">
                                    <ItemStyle HorizontalAlign="Right" Width="60px" Wrap="false" />
                                    <HeaderStyle Wrap="false" />
                                </asp:BoundField>
                                <asp:BoundField DataField="SEND_RESULT" HeaderText="發送狀態" meta:resourcekey="BoundFieldResource5">
                                    <ItemStyle Width="60px" Wrap="false" />
                                    <HeaderStyle Wrap="false" />
                                </asp:BoundField>
                                <asp:TemplateField HeaderText="發送時間" SortExpression="SEND_TIME" meta:resourcekey="BoundFieldResource6">
                                    <ItemTemplate>
                                        <asp:Label ID="lblSendTime" runat="server" Text='<%# Bind("SEND_TIME") %>'></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle Wrap="False" />
                                    <ItemStyle Width="100px" Wrap="False" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="操作">
                                    <ItemTemplate>
                                        <telerik:RadButton ID="rbtnUpdateStatus" CommandName="rbtnUpdateStatus" runat="server" Text="更新發送狀態" CommandArgument='<%# Bind("BATCH_ID") %>'></telerik:RadButton>
                                    </ItemTemplate>
                                    <ItemStyle Width="150px" Wrap="false" />
                                    <HeaderStyle Width="150px" Wrap="false" />
                                </asp:TemplateField>
                            </Columns>
                        </Fast:Grid>
                    </td>
                </tr>
            </table>
        </ContentTemplate>
    </asp:UpdatePanel>
    <asp:Label ID="lblSend" runat="server" Text="已發送" Visible="False" meta:resourcekey="lblSendResource1"></asp:Label>
    <asp:Label ID="lblNonSend" runat="server" Text="未發送" Visible="False" meta:resourcekey="lblNonSendResource1"></asp:Label>
    <asp:HiddenField ID="hfCurrentUser" runat="server" />
</asp:Content>




