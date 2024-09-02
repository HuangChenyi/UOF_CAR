<%@ Page Language="C#" MasterPageFile="~/Master/DefaultMasterPage.master" AutoEventWireup="true" Inherits="EIP_SMS_QueryMessage" Title="簡訊查詢" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" CodeBehind="QueryMessage.aspx.cs" %>

<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <script type="text/javascript">
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
                        <telerik:RadToolBar ID="RadToolBar1" runat="server" Width="100%" OnButtonClick="RadToolBar1_ButtonClick" meta:resourcekey="RadToolBar1Resource1">
                            <Items>
                                <telerik:RadToolBarButton runat="server" Value="QueryCondition" meta:resourcekey="RadToolBarButtonResource1">
                                    <ItemTemplate>
                                        <table>
                                            <tr>
                                                <td>
                                                    <asp:Label ID="Label2" runat="server" Text="查詢條件：" meta:resourcekey="Label2Resource1"></asp:Label>
                                                </td>
                                                <td>
                                                    <telerik:RadDatePicker ID="rdpDateStart" runat="server">
                                                        <DateInput runat="server" ClientEvents-OnValueChanging="OnValueChanging"></DateInput>
                                                    </telerik:RadDatePicker>
                                                </td>
                                                <td>
                                                    <asp:Label ID="Label1" runat="server" Text="~" meta:resourcekey="Label1Resource2"></asp:Label>
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
                                <telerik:RadToolBarButton runat="server" IsSeparator="True" meta:resourcekey="RadToolBarButtonResource2">
                                </telerik:RadToolBarButton>
                                <telerik:RadToolBarButton runat="server" Value="SendStatus" meta:resourcekey="RadToolBarButtonResource3">
                                    <ItemTemplate>
                                        <table>
                                            <tr>
                                                <td>
                                                    <asp:Label ID="Label3" runat="server" Text="發送狀態：" meta:resourcekey="Label3Resource1"></asp:Label>
                                                </td>
                                                <td>
                                                    <asp:DropDownList ID="ddlSendResult" runat="server" meta:resourcekey="ddlSendResultResource1">
                                                        <asp:ListItem Value="2" meta:resourcekey="ListItemResource1" Text="全部"></asp:ListItem>
                                                        <asp:ListItem Value="0" meta:resourcekey="ListItemResource2" Text="未發送"></asp:ListItem>
                                                        <asp:ListItem Value="1" meta:resourcekey="ListItemResource3" Text="已發送"></asp:ListItem>
                                                    </asp:DropDownList>
                                                </td>
                                            </tr>
                                        </table>
                                    </ItemTemplate>
                                </telerik:RadToolBarButton>
                                <telerik:RadToolBarButton runat="server" IsSeparator="True" meta:resourcekey="RadToolBarButtonResource4">
                                </telerik:RadToolBarButton>
                                <telerik:RadToolBarButton runat="server" Text="查詢" ClickedImageUrl="~/Common/Images/Icon/icon_m39.gif" DisabledImageUrl="~/Common/Images/Icon/icon_m39.gif"
                                    HoveredImageUrl="~/Common/Images/Icon/icon_m39.gif" ImageUrl="~/Common/Images/Icon/icon_m39.gif" Value="Query" meta:resourcekey="RadToolBarButtonResource5">
                                </telerik:RadToolBarButton>
                                <telerik:RadToolBarButton runat="server" IsSeparator="True" meta:resourcekey="RadToolBarButtonResource6">
                                </telerik:RadToolBarButton>
                            </Items>
                        </telerik:RadToolBar>
                    </td>
                </tr>
                <tr>
                    <td>
                        <Fast:Grid ID="Grid1" runat="server"
                            AutoGenerateCheckBoxColumn="False" AutoGenerateColumns="False" AllowSorting="True" AllowPaging="True"
                            DataKeyOnClientWithCheckBox="False" DefaultSortColumnName="SEND_TIME" DefaultSortDirection="Ascending"
                            EnhancePager="True" EmptyDataText="沒有資料"
                            PageSize="15" KeepSelectedRows="False" Width="100%"
                            CustomDropDownListPage="False" SelectedRowColor="" UnSelectedRowColor=""
                            OnRowCommand="Grid1_RowCommand"
                            OnPageIndexChanging="Grid1_PageIndexChanging"
                            OnRowDataBound="Grid1_RowDataBound"
                            OnSorting="Grid1_Sorting"
                            meta:resourcekey="Grid1Resource2">
                            <EnhancePagerSettings ShowHeaderPager="True"
                                FirstAltImageUrl="" FirstImageUrl="" LastAltImage=""
                                LastImageUrl="" NextIAltImageUrl="" NextImageUrl=""
                                PageInfoCssClass="" PageNumberCssClass="" PageNumberCurrentCssClass=""
                                PageRedirectCssClass="" PreviousAltImageUrl="" PreviousImageUrl="">
                            </EnhancePagerSettings>
                            <ExportExcelSettings AllowExportToExcel="False"></ExportExcelSettings>
                            <Columns>
                                <asp:TemplateField HeaderText="簡訊主旨" SortExpression="SUBJECT" meta:resourcekey="TemplateFieldResource1">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="lbtnSubject" Style="word-break: break-all" runat="server" meta:resourcekey="lbtnSubjectResource1"></asp:LinkButton>
                                    </ItemTemplate>
                                    <ItemStyle Width="300px" Wrap="True" CssClass="breakword" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="簡訊內容" meta:resourcekey="TemplateFieldResource2">
                                    <ItemTemplate>
                                        <asp:Label ID="Label1" runat="server" Style="word-break: break-all" meta:resourcekey="Label1Resource1"></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle Wrap="True" CssClass="breakword" />
                                    <HeaderStyle Wrap="false" />
                                </asp:TemplateField>
                                <asp:BoundField DataField="TOTAL_MSG_COUNT" HeaderText="發送筆數" SortExpression="TOTAL_MSG_COUNT" meta:resourcekey="BoundFieldResource1">
                                    <HeaderStyle Wrap="False" />
                                    <ItemStyle HorizontalAlign="Right" Width="60px" Wrap="False" />
                                </asp:BoundField>
                                <asp:BoundField DataField="SUCCESS_COUNT" HeaderText="成功筆數" SortExpression="SUCCESS_COUNT" meta:resourcekey="BoundFieldResource2">
                                    <HeaderStyle Wrap="False" />
                                    <ItemStyle HorizontalAlign="Right" Width="60px" Wrap="False" />
                                </asp:BoundField>
                                <asp:BoundField DataField="FAIL_COUNT" HeaderText="失敗筆數" SortExpression="FAIL_COUNT" meta:resourcekey="BoundFieldResource3">
                                    <HeaderStyle Wrap="False" />
                                    <ItemStyle HorizontalAlign="Right" Width="60px" Wrap="False" />
                                </asp:BoundField>
                                <asp:BoundField DataField="SEND_RESULT" HeaderText="發送狀態" meta:resourcekey="BoundFieldResource4">
                                    <HeaderStyle Wrap="False" />
                                    <ItemStyle Width="60px" Wrap="False" />
                                </asp:BoundField>
                                <asp:TemplateField HeaderText="發送時間" SortExpression="SEND_TIME" meta:resourcekey="BoundFieldResource5">
                                    <ItemTemplate>
                                        <asp:Label ID="lblSendTime" runat="server" Text='<%# Bind("SEND_TIME") %>'></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle Wrap="False" />
                                    <ItemStyle Width="120px" Wrap="False" />
                                </asp:TemplateField>
                                <asp:BoundField HeaderText="發送者" meta:resourcekey="BoundFieldResource6">
                                    <HeaderStyle Wrap="False" />
                                    <ItemStyle Width="120px" Wrap="False" />
                                </asp:BoundField>
                                <asp:TemplateField HeaderText="操作" meta:resourcekey="BoundFieldResource7">
                                    <ItemTemplate>
                                        <telerik:RadButton ID="rbtnUpdateStatus" CommandName="rbtnUpdateStatus" runat="server"
                                            Text="更新發送狀態" CommandArgument='<%# Bind("BATCH_ID") %>' meta:resourcekey="rbtnUpdateStatusResource1">
                                        </telerik:RadButton>
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

