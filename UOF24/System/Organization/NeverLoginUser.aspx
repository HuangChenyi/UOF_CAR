<%@ Page Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="System_Organization_NeverLoginUser"
    Title="" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" Codebehind="NeverLoginUser.aspx.cs" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register Assembly="System.Web, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
    Namespace="System.Web.UI" TagPrefix="cc1" %>
<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <script type="text/javascript">
<!--

    function RadToolBar1_NL_ButtonClicking(sender, args) {
        //Add code to handle your event here.
        var Key = args.get_item().get_value();
        if (Key == "SendPW") {
            var checkedUsers = $uof.fastGrid.getChecked('<%=gridUser.ClientID %>');
            if (checkedUsers == "") {
                alert("<%=lblSendUserMsg.Text %>");
                return;
            }
            $("#<%=hideCheckedUser.ClientID %>").val(checkedUsers);
            args.set_cancel(true);
            $uof.dialog.open2("~/System/Organization/SendPW.aspx", args.get_item(), "", 450, 350, OpenDialogResult, { "hideCheckedUserID": '<%=hideCheckedUser.ClientID%>' });
        }
    }
        function OpenDialogResult(returnValue) {
            if (typeof (returnValue) == 'undefined' || returnValue == null) {
                return false;
            }
            else {
                return true;
            }
        }
    // -->
    </script>
    <telerik:RadToolBar ID="RadToolBar1" runat="server" Width="100%" OnButtonClick="RadToolBar1_ButtonClick"
        OnClientButtonClicking="RadToolBar1_NL_ButtonClicking" meta:resourcekey="RadToolBar1Resource1" SingleClick="None">
        <Items>
            <telerik:RadToolBarButton runat="server" DisabledImageUrl="~/Common/Images/Icon/icon_m33.gif"
                HoveredImageUrl="~/Common/Images/Icon/icon_m33.gif" ImageUrl="~/Common/Images/Icon/icon_m33.gif"
                Value="SendPW" CheckedImageUrl="~/Common/Images/Icon/icon_m33.gif" Text="發送"
                meta:resourcekey="TBarButtonResource1">
            </telerik:RadToolBarButton>
            <telerik:RadToolBarButton runat="server" IsSeparator="True" Value="s1" meta:resourcekey="RadToolBarButtonResource1">
            </telerik:RadToolBarButton>
            <telerik:RadToolBarButton runat="server" Value="Condition" meta:resourcekey="RadToolBarButtonResource2">
                <ItemTemplate>
                    <table>
                        <tr>
                            <td style="padding-left: 2px; padding-right: 1px">
                                <asp:Label runat="server" Text="查詢範圍" meta:resourcekey="TBLabelResource1"></asp:Label>
                            </td>
                            <td style="padding-left: 2px; padding-right: 1px">
                                <asp:DropDownList ID="ddlLogined" runat="server" meta:resourcekey="ddlLoginedResource1">
                                    <asp:ListItem Value="never" meta:resourcekey="ListItemResource1" Text="從未登入"></asp:ListItem>
                                    <asp:ListItem Value="all" meta:resourcekey="ListItemResource2" Text="全部"></asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td style="padding-left: 2px; padding-right: 1px">
                                <asp:Label runat="server" Text="帳號建立時間(起)" meta:resourcekey="TBLabelResource2"></asp:Label>
                            </td>
                            <td style="padding-left: 2px; padding-right: 1px">
                                <telerik:RadDatePicker ID="wdcStart" runat="server" meta:resourcekey="wdcStartResource2">
                                    <Calendar Culture="zh-TW" EnableWeekends="True" FastNavigationNextText="&amp;lt;&amp;lt;" UseColumnHeadersAsSelectors="False" UseRowHeadersAsSelectors="False">
                                    </Calendar>
                                    <DateInput DateFormat="yyyy/M/d" DisplayDateFormat="yyyy/M/d" LabelWidth="64px" Width="">
                                        <EmptyMessageStyle Resize="None" />
                                        <ReadOnlyStyle Resize="None" />
                                        <FocusedStyle Resize="None" />
                                        <DisabledStyle Resize="None" />
                                        <InvalidStyle Resize="None" />
                                        <HoveredStyle Resize="None" />
                                        <EnabledStyle Resize="None" />
                                    </DateInput>
                                    <DatePopupButton CssClass="" HoverImageUrl="" ImageUrl="" />
                                </telerik:RadDatePicker>
                            </td>
                            <td style="padding-left: 2px; padding-right: 1px">
                                <asp:Label runat="server" Text="帳號建立時間(迄)" meta:resourcekey="TBLabelResource3"></asp:Label>
                            </td>
                            <td style="padding-left: 2px; padding-right: 1px">
                                <telerik:RadDatePicker ID="wdcEnd" runat="server" meta:resourcekey="wdcEndResource2">
                                    <Calendar Culture="zh-TW" EnableWeekends="True" FastNavigationNextText="&amp;lt;&amp;lt;" UseColumnHeadersAsSelectors="False" UseRowHeadersAsSelectors="False">
                                    </Calendar>
                                    <DateInput DateFormat="yyyy/M/d" DisplayDateFormat="yyyy/M/d" LabelWidth="64px" Width="">
                                        <EmptyMessageStyle Resize="None" />
                                        <ReadOnlyStyle Resize="None" />
                                        <FocusedStyle Resize="None" />
                                        <DisabledStyle Resize="None" />
                                        <InvalidStyle Resize="None" />
                                        <HoveredStyle Resize="None" />
                                        <EnabledStyle Resize="None" />
                                    </DateInput>
                                    <DatePopupButton CssClass="" HoverImageUrl="" ImageUrl="" />
                                </telerik:RadDatePicker>
                            </td>
                        </tr>
                    </table>
                </ItemTemplate>
            </telerik:RadToolBarButton>
            <telerik:RadToolBarButton runat="server" Value="Query" Text="查詢" DisabledImageUrl="~/Common/Images/Icon/icon_m39.gif"
                HoveredImageUrl="~/Common/Images/Icon/icon_m39.gif" ImageUrl="~/Common/Images/Icon/icon_m39.gif"
                CheckedImageUrl="~/Common/Images/Icon/icon_m39.gif" meta:resourcekey="TBarButtonResource2">
            </telerik:RadToolBarButton>
            <telerik:RadToolBarButton runat="server" IsSeparator="True" Value="s2" meta:resourcekey="RadToolBarButtonResource3">
            </telerik:RadToolBarButton>
        </Items>
    </telerik:RadToolBar>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <Fast:Grid ID="gridUser" runat="server" AllowSorting="True" AutoGenerateCheckBoxColumn="True"
                AutoGenerateColumns="False" DataKeyNames="USER_GUID" DataKeyOnClientWithCheckBox="True" DefaultSortColumnName="ACCOUNT"
                EnhancePager="True" PageSize="15" OnRowDataBound="gridUser_RowDataBound" AllowPaging="True"
                OnPageIndexChanging="gridUser_PageIndexChanging" OnSorting="gridUser_Sorting"
                Width="100%" CustomDropDownListPage="False" DefaultSortDirection="Ascending" EmptyDataText="No data found" KeepSelectedRows="False" SelectedRowColor="" UnSelectedRowColor="" meta:resourcekey="gridUserResource2">
                <EnhancePagerSettings ShowHeaderPager="True" />
                <ExportExcelSettings AllowExportToExcel="False" />
                <Columns>
                    <asp:BoundField DataField="ACCOUNT" HeaderText="帳號" SortExpression="ACCOUNT" meta:resourcekey="BoundFieldResource1">
                    <HeaderStyle Wrap="False" />
                    </asp:BoundField>
                    <asp:TemplateField HeaderText="名稱" meta:resourcekey="TemplateFieldResource1">
                        <ItemTemplate>
                            <asp:Label runat="server" ID="lblAccount" meta:resourceKey="lblAccountResource1"></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle Wrap="False" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="是否啟用AD驗證" SortExpression="IS_AD_AUTH" meta:resourcekey="TemplateFieldResource2">
                        <ItemTemplate>
                            <asp:Label runat="server" Text='<%# Bind("IS_AD_AUTH") %>' ID="lblAD" meta:resourceKey="lblADResource1"></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle Wrap="False" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="建立時間" SortExpression="CREATE_DATE" meta:resourcekey="TemplateFieldResource3">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("CREATE_DATE") %>' meta:resourcekey="TextBox1Resource1"></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblCreateDate" runat="server" Text='<%# Bind("CREATE_DATE") %>' meta:resourcekey="lblCreateDateResource1"></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle Wrap="False" />
                    </asp:TemplateField>
                </Columns>
            </Fast:Grid>
        </ContentTemplate>
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="RadToolBar1" EventName="ButtonClick" />
        </Triggers>
    </asp:UpdatePanel>
    <asp:Label ID="lblYes" runat="server" Text="是" Visible="False" meta:resourcekey="lblYesResource1"></asp:Label>
    <asp:Label ID="lblNo" runat="server" Text="否" Visible="False" meta:resourcekey="lblNoResource1"></asp:Label>
    <asp:Label ID="lblSendUserMsg" runat="server" Text="請選擇要發送密碼通知函給哪位使用者" Visible="False" meta:resourcekey="lblSendUserMsgResource1"></asp:Label>
    <asp:HiddenField ID="hideCheckedUser" runat="server" />
    <asp:HiddenField ID="hfCurrentUser" runat="server" />
</asp:Content>
