<%@ Page Title="登入IP設定" Language="C#" MasterPageFile="~/Master/DefaultMasterPage.master" AutoEventWireup="true" CodeBehind="IPRangeDefault.aspx.cs" Inherits="System_IPRange_IPRangeDefault" culture="auto" meta:resourcekey="PageResource2" uiculture="auto" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Ede" %>
<%@ Register Src="../../Common/ChoiceCenter/UC_ChoiceList.ascx" TagName="UC_ChoiceList" TagPrefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script id="punchJS" type="text/javascript">
        function RadToolBarButtonClicking(sender, args) {
            var key = args.get_item().get_value();
            switch (key) {
                case "Add":
                    args.set_cancel(true);
                    $uof.dialog.open2("~/System/IPRange/IPRangeEdit.aspx", args.get_item(), '<%=lblDiagTitleAdd.Text %>', 600, 300, openDialogResult, { mode: 'UOF' });
                    break;
                case "Delete":
                    var checkedData = $uof.fastGrid.getChecked('<%=ipGrid.ClientID%>');
                    if (checkedData != '') {
                        if (!confirm('<%=lblDelIPConfirm.Text %>')) {
                            args.set_cancel(true);
                        }
                    }
                    break;
            }
        }

        function openDialogResult(returnValue) {
            if (returnValue === '' || returnValue === null)
                return false;
            else
                return true;
        }

        function RadToolBarIpRangeAppClicking(sender, args) {
            var key = args.get_item().get_value();
            switch (key) {
                case "Add":
                    args.set_cancel(true);
                    $uof.dialog.open2("~/System/IPRange/IPRangeEdit.aspx", args.get_item(), '<%=lblDiagTitleAdd.Text %>', 600, 300, openDialogResultApp, { mode: 'App' });
                    break;
                case "Delete":
                    var checkedData = $uof.fastGrid.getChecked('<%=ipGridApp.ClientID%>');
                    if (checkedData != '') {
                        if (!confirm('<%=lblDelIPConfirm.Text %>')) {
                            args.set_cancel(true);
                        }
                    }
                    break;
            }
        }

        function openDialogResultApp(returnValue) {
            if (returnValue === '' || returnValue === null)
                return false;
            else
                return true;
        }
    </script>
    <telerik:RadTabStrip ID="rdTabs" runat="server" SelectedIndex="0" MultiPageID="rdMultiPage" meta:resourcekey="rdTabsResource1">
        <Tabs>
            <telerik:RadTab runat="server" Text="特殊人員" PageViewID="pageView1" meta:resourcekey="RadTabResource1">
            </telerik:RadTab>
            <telerik:RadTab runat="server" Text="可登入UOF" PageViewID="pageView2" Selected="True" meta:resourcekey="RadTabResource2">
            </telerik:RadTab>
            <telerik:RadTab runat="server" Text="可登入App" PageViewID="pageView3" Selected="True" meta:resourcekey="RadTabResource3">
            </telerik:RadTab>
        </Tabs>
    </telerik:RadTabStrip>
    <telerik:RadMultiPage ID="rdMultiPage" runat="server" SelectedIndex="0" meta:resourcekey="rdMultiPageResource1">
        <telerik:RadPageView ID="pageView1" runat="server" Width="100%" meta:resourcekey="pageView1Resource1" Selected="True">
            <table style="width: 100%">
                <tr>
                    <td>
                        <asp:Label ID="lblInfo" runat="server" Text="說明：特殊人員不受登入設定限制。" CssClass="SizeMemo" meta:resourcekey="lblInfoResource1"></asp:Label>
                    </td>
                </tr>
            </table>
            <table style="width: 100%">
                <tr>
                    <td>
                        <uc1:UC_ChoiceList ID="UC_Choicelist_SelectUser" runat="server" TreeHeight="500px" />
                    </td>
                </tr>
            </table>
        </telerik:RadPageView>
        <telerik:RadPageView ID="pageView2" runat="server" Width="100%" meta:resourcekey="pageView2Resource1">
            <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                <ContentTemplate>
                    <table style="width: 100%; height: 100%;">
                        <tr>
                            <td style="vertical-align: top">
                                <telerik:RadToolBar ID="RadToolBar1" runat="server" Width="100%" OnButtonClick="RadToolBar1_ButtonClick" OnClientButtonClicking="RadToolBarButtonClicking" meta:resourcekey="RadToolBar1Resource1" SingleClick="None">
                                    <Items>
                                        <telerik:RadToolBarButton runat="server" Text="新增" Value="Add"
                                            CheckedImageUrl="~/Common/Images/Icon/icon_m02.gif"
                                            DisabledImageUrl="~/Common/Images/Icon/icon_m02.gif"
                                            HoveredImageUrl="~/Common/Images/Icon/icon_m02.gif"
                                            ImageUrl="~/Common/Images/Icon/icon_m02.gif"
                                            meta:resourcekey="RadToolBarADDIPResource1">
                                        </telerik:RadToolBarButton>
                                        <telerik:RadToolBarButton IsSeparator="True" runat="server" meta:resourcekey="RadToolBarButtonResource1"></telerik:RadToolBarButton>
                                        <telerik:RadToolBarButton runat="server" Text="刪除" Value="Delete"
                                            CheckedImageUrl="~/Common/Images/Icon/icon_m03.gif"
                                            DisabledImageUrl="~/Common/Images/Icon/icon_m03.gif"
                                            HoveredImageUrl="~/Common/Images/Icon/icon_m03.gif"
                                            ImageUrl="~/Common/Images/Icon/icon_m03.gif"
                                            meta:resourcekey="RadToolBarDELIPResource1">
                                        </telerik:RadToolBarButton>
                                        <telerik:RadToolBarButton IsSeparator="True" runat="server" meta:resourcekey="RadToolBarButtonResource2"></telerik:RadToolBarButton>
                                    </Items>
                                </telerik:RadToolBar>
                                <Ede:Grid ID="ipGrid" runat="server" AllowPaging="True" AutoGenerateCheckBoxColumn="True" AutoGenerateColumns="False" Width="100%"
                                    DataKeyOnClientWithCheckBox="False" PageSize="15" EmptyDataText="No data found" KeepSelectedRows="False" AllowSorting="True"
                                    DataKeyNames="RANGE_GUID" OnRowDataBound="IPGrid_RowDataBound" OnPageIndexChanging="IPGrid_PageIndexChanging" CustomDropDownListPage="False"
                                    DefaultSortDirection="Ascending" EnhancePager="True" meta:resourcekey="IPGridResource1" SelectedRowColor="" UnSelectedRowColor="">
                                    <EnhancePagerSettings ShowHeaderPager="True" />
                                    <ExportExcelSettings AllowExportToExcel="False" />
                                    <Columns>
                                        <asp:TemplateField HeaderText="IP(起)" meta:resourcekey="TemplateFieldResource1">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="lbtnBegin" runat="server" Text='<%#: Bind("BEGIN")%>' OnClick="lbtnBegin_Click" meta:resourcekey="lbtnBeginResource1"></asp:LinkButton>
                                            </ItemTemplate>
                                            <HeaderStyle Width="15%" />
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="END" HeaderText="IP(訖)" meta:resourcekey="BoundFieldResource1">
                                            <HeaderStyle Width="15%" />
                                        </asp:BoundField>
                                        <asp:TemplateField HeaderText="人員" meta:resourcekey="TemplateFieldResource2">
                                            <ItemTemplate>
                                                <uc1:UC_ChoiceList runat="server" ID="UC_ChoiceList_IP" IsAllowEdit="false" />
                                            </ItemTemplate>
                                            <HeaderStyle Width="45%" />
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="REMARK" HeaderText="備註" meta:resourcekey="BoundFieldResource2">
                                            <ItemStyle Width="25%" />
                                        </asp:BoundField>
                                    </Columns>
                                </Ede:Grid>
                            </td>
                        </tr>
                        <tr>
                            <td style="padding-left: 5px;">
                                <asp:Label ID="lblUOFIPMemoTitle" runat="server" Text="說明：" ForeColor="Blue" meta:resourcekey="lblIPMemoTitleResource1"></asp:Label>
                                <br />
                                <asp:Label ID="lblUOFIPMemo1" runat="server" Text="1.若沒有新增任何IP限制，表示所有人員在任一IP位址均可登入UOF。" ForeColor="Blue" meta:resourcekey="lblUOFIPMemo1Resource1"></asp:Label>
                                <br />
                                <asp:Label ID="lblUOFIPMemo2" runat="server" Text="2.有設定至少一筆IP限制時，被設定的人員需在允許登入的IP位址才可登入UOF，未被設定在任一筆IP限制中的人員，在任何IP位址均無法登入UOF。" ForeColor="Blue" meta:resourcekey="lblUOFIPMemo2Resource1"></asp:Label>
                                <br />
                                <asp:Label ID="lblUOFIPMemo3" runat="server" Text="3.除特殊人員外，系統管理員(admin)與AD SSO登入者也不受登入IP限制。" ForeColor="Blue" meta:resourcekey="lblUOFIPMemo3Resource1"></asp:Label>                            
                            </td>
                        </tr>
                    </table>
                </ContentTemplate>
            </asp:UpdatePanel>
        </telerik:RadPageView>
        <telerik:RadPageView ID="pageView3" runat="server" Width="100%" meta:resourcekey="pageView3Resource1">
            <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
                <ContentTemplate>
                    <table style="width: 100%; height: 100%;">
                        <tr>
                            <td style="vertical-align: top">
                                <telerik:RadToolBar ID="RadToolBarIpRangeApp" runat="server" Width="100%" OnButtonClick="RadToolBarIpRangeApp_ButtonClick" OnClientButtonClicking="RadToolBarIpRangeAppClicking" meta:resourcekey="RadToolBarIpRangeAppResource1" SingleClick="None">
                                    <Items>
                                        <telerik:RadToolBarButton runat="server" Text="新增" Value="Add"
                                            CheckedImageUrl="~/Common/Images/Icon/icon_m02.gif"
                                            DisabledImageUrl="~/Common/Images/Icon/icon_m02.gif"
                                            HoveredImageUrl="~/Common/Images/Icon/icon_m02.gif"
                                            ImageUrl="~/Common/Images/Icon/icon_m02.gif"
                                            meta:resourcekey="RadToolBarADDIPResource1">
                                        </telerik:RadToolBarButton>
                                        <telerik:RadToolBarButton IsSeparator="True" runat="server" meta:resourcekey="RadToolBarButtonResource1"></telerik:RadToolBarButton>
                                        <telerik:RadToolBarButton runat="server" Text="刪除" Value="Delete"
                                            CheckedImageUrl="~/Common/Images/Icon/icon_m03.gif"
                                            DisabledImageUrl="~/Common/Images/Icon/icon_m03.gif"
                                            HoveredImageUrl="~/Common/Images/Icon/icon_m03.gif"
                                            ImageUrl="~/Common/Images/Icon/icon_m03.gif"
                                            meta:resourcekey="RadToolBarDELIPResource1">
                                        </telerik:RadToolBarButton>
                                        <telerik:RadToolBarButton IsSeparator="True" runat="server" meta:resourcekey="RadToolBarButtonResource2"></telerik:RadToolBarButton>
                                    </Items>
                                </telerik:RadToolBar>
                                <Ede:Grid ID="ipGridApp" runat="server" AllowPaging="True" AutoGenerateCheckBoxColumn="True" AutoGenerateColumns="False" Width="100%"
                                    DataKeyOnClientWithCheckBox="False" PageSize="15" EmptyDataText="No data found" KeepSelectedRows="False" AllowSorting="True"
                                    DataKeyNames="RANGE_GUID" OnRowDataBound="ipGridApp_RowDataBound" OnPageIndexChanging="ipGridApp_PageIndexChanging" CustomDropDownListPage="False"
                                    DefaultSortDirection="Ascending" EnhancePager="True" meta:resourcekey="IPGridResource1" SelectedRowColor="" UnSelectedRowColor="">
                                    <EnhancePagerSettings ShowHeaderPager="True" />
                                    <ExportExcelSettings AllowExportToExcel="False" />
                                    <Columns>
                                        <asp:TemplateField HeaderText="IP(起)" meta:resourcekey="TemplateFieldResource1">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="lbtnBeginApp" runat="server" Text='<%#: Bind("BEGIN")%>' OnClick="lbtnBeginApp_Click" meta:resourcekey="lbtnBeginResource1"></asp:LinkButton>
                                            </ItemTemplate>
                                            <HeaderStyle Width="15%" />
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="END" HeaderText="IP(訖)" meta:resourcekey="BoundFieldResource1">
                                            <HeaderStyle Width="15%" />
                                        </asp:BoundField>
                                        <asp:TemplateField HeaderText="人員" meta:resourcekey="TemplateFieldResource2">
                                            <ItemTemplate>
                                                <uc1:UC_ChoiceList runat="server" ID="UC_ChoiceList_IP" IsAllowEdit="false" />
                                            </ItemTemplate>
                                            <HeaderStyle Width="45%" />
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="REMARK" HeaderText="備註" meta:resourcekey="BoundFieldResource2">
                                            <ItemStyle Width="25%" />
                                        </asp:BoundField>
                                    </Columns>
                                </Ede:Grid>
                            </td>
                        </tr>
                        <tr>
                            <td style="padding-left: 5px;">
                                <asp:Label ID="lblApppIPMemoTitle" runat="server" Text="說明：" ForeColor="Blue" meta:resourcekey="lblIPMemoTitleResource1"></asp:Label>
                                <br />
                                <asp:Label ID="lblAppIPMemo1" runat="server" Text="1.若沒有新增任何IP限制，表示所有人員在任一IP位址均可登入App。" ForeColor="Blue" meta:resourcekey="lblAppIPMemo1Resource1"></asp:Label>
                                <br />
                                <asp:Label ID="lblAppIPMemo2" runat="server" Text="2.有設定至少一筆IP限制時，被設定的人員需在允許登入的IP位址才可登入App，未被設定在任一筆IP限制中的人員，在任何IP位址均無法登入App。" ForeColor="Blue" meta:resourcekey="lblAppIPMemo2Resource1"></asp:Label>
                                <br />
                                <asp:Label ID="lblAppIPMemo3" runat="server" Text="3.除特殊人員外，系統管理員(admin)與AD SSO登入者也不受登入IP限制。" ForeColor="Blue" meta:resourcekey="lblAppIPMemo3Resource1"></asp:Label>
                            </td>
                        </tr>
                    </table>
                </ContentTemplate>
            </asp:UpdatePanel>
        </telerik:RadPageView>
    </telerik:RadMultiPage>
    <asp:Label ID="lblDiagTitleAdd" runat="server" Text="新增IP範圍" Visible="False" meta:resourcekey="lblDiagTitleAddResource1"></asp:Label>
    <asp:Label ID="lblDiagTitleEdit" runat="server" Text="維護IP範圍" Visible="False" meta:resourcekey="lblDiagTitleEditResource1"></asp:Label>
    <asp:Label ID="lblDelIPConfirm" runat="server" Text="確定要刪除選取的IP嗎？" Visible="False" meta:resourcekey="lblDelIPConfirmResource1"></asp:Label>
    <asp:Label ID="Label2" runat="server" Text="特殊人員" Visible="False" meta:resourcekey="Label2Resource1"></asp:Label>
    <asp:Label ID="Label3" runat="server" Text="可刷卡IP維護" Visible="False" meta:resourcekey="Label3Resource1"></asp:Label>
</asp:Content>
