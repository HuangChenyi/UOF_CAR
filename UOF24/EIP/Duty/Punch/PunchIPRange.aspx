<%@ Page Title="線上刷卡IP維護" Language="C#" MasterPageFile="~/Master/DefaultMasterPage.master" AutoEventWireup="true" Inherits="CDS_HR_Punch_PunchIPRange" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" CodeBehind="PunchIPRange.aspx.cs" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>
<%@ Register Src="../../../Common/ChoiceCenter/UC_ChoiceList.ascx" TagName="UC_ChoiceList" TagPrefix="uc1" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <script id="punchJS" type="text/javascript">
        function RadToolBarButtonClicking(sender, args) {
            var key = args.get_item().get_value();
            switch (key) {
                case "ADDIP":
                    args.set_cancel(true);
                    $uof.dialog.open2("~/EIP/Duty/Punch/PunchIPRangeEdit.aspx", args.get_item(), '<%=lblDiagTitleAdd.Text %>', 600, 300, openDialogResult);
                break;
            case "DELIP":
                if (!confirm('<%=lblDelIPConfirm.Text %>')) {
                    args.set_cancel(true);
                }
                break;
        }
    }

        function rtbPositionRangeButtonClicking(sender, args) {
        var key = args.get_item().get_value();
        switch (key) {
            case "addPosition":
                args.set_cancel(true);
                $uof.dialog.open2("~/EIP/Duty/Punch/PunchPositionRangeEdit.aspx", args.get_item(), '<%=lblPositionDiagTitle.Text %>', 800, 800, openDialogResult);
                break;
            case "delPosition":
                if (!confirm('<%=Ede.Uof.Utility.Page.Common.Resource.GetResource("Common","ConfirmDelete") %>')) {
                    args.set_cancel(true);
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

    </script>
    <telerik:RadTabStrip ID="rdTabs" runat="server" SelectedIndex="0" MultiPageID="rdMultiPage">
        <Tabs>
            <telerik:RadTab runat="server" Text="特殊人員" PageViewID="pageView1" Selected="True">
            </telerik:RadTab>
            <telerik:RadTab runat="server" Text="可刷卡IP維護" PageViewID="pageView2">
            </telerik:RadTab>
            <telerik:RadTab runat="server" Text="App刷卡範圍" PageViewID="pageView3" meta:resourcekey="RadTabResource1">
            </telerik:RadTab>
             <telerik:RadTab runat="server" Text="只可用App" PageViewID="pageView4" meta:resourcekey="RadTabResource2">
            </telerik:RadTab>
        </Tabs>
    </telerik:RadTabStrip>
    <telerik:RadMultiPage ID="rdMultiPage" runat="server" SelectedIndex="0">
        <telerik:RadPageView ID="pageView1" runat="server" Width="100%">
            <table style="width: 100%">
                <tr>
                    <td>
                        <asp:Label ID="Label1" runat="server" Text="說明：特殊人員不受刷卡設定限制。" CssClass="SizeMemo" meta:resourcekey="Label1Resource1"></asp:Label>
                    </td>
                </tr>
            </table>
            <table style="width: 100%">
                <tr>
                    <td>
                        <uc1:UC_ChoiceList ID="SelectUser" runat="server" TreeHeight="500px" />
                    </td>
                </tr>
            </table>
        </telerik:RadPageView>
        <telerik:RadPageView ID="pageView2" runat="server" Width="100%">
            <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                <ContentTemplate>
                    <table style="width:100%; height: 100%;">
                        <tr>
                            <td valign="top">
                                <telerik:RadToolBar ID="RadToolBar1" runat="server" Width="100%" OnButtonClick="RadToolBar1_OnButtonClick" OnClientButtonClicking="RadToolBarButtonClicking">
                                    <Items>
                                        <telerik:RadToolBarButton runat="server" Text="新增" Value="ADDIP"
                                            CheckedImageUrl="~/Common/Images/Icon/icon_m02.gif"
                                            DisabledImageUrl="~/Common/Images/Icon/icon_m02.gif"
                                            HoveredImageUrl="~/Common/Images/Icon/icon_m02.gif"
                                            ImageUrl="~/Common/Images/Icon/icon_m02.gif"
                                            meta:resourcekey="RadToolBarADDIPResource1">
                                        </telerik:RadToolBarButton>
                                        <telerik:RadToolBarButton IsSeparator="true"></telerik:RadToolBarButton>
                                        <telerik:RadToolBarButton runat="server" Text="刪除" Value="DELIP"
                                            CheckedImageUrl="~/Common/Images/Icon/icon_m03.gif"
                                            DisabledImageUrl="~/Common/Images/Icon/icon_m03.gif"
                                            HoveredImageUrl="~/Common/Images/Icon/icon_m03.gif"
                                            ImageUrl="~/Common/Images/Icon/icon_m03.gif"
                                            meta:resourcekey="RadToolBarDELIPResource1">
                                        </telerik:RadToolBarButton>
                                        <telerik:RadToolBarButton IsSeparator="true"></telerik:RadToolBarButton>
                                    </Items>
                                </telerik:RadToolBar>
                                <Fast:Grid ID="IPGrid" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateCheckBoxColumn="True"
                                    AutoGenerateColumns="False" DataKeyNames="INDEX"
                                    DataKeyOnClientWithCheckBox="True" DefaultSortDirection="Ascending" EmptyDataText="沒有資料"
                                    EnableModelValidation="True" EnhancePager="True" OnPageIndexChanging="IPGrid_PageIndexChanging"
                                    OnRowDataBound="IPGrid_RowDataBound" PageSize="15"
                                    KeepSelectedRows="False"
                                    meta:resourcekey="IPGridResource1" Width="70%">
                                    <EnhancePagerSettings
                                        ShowHeaderPager="False" />
                                    <ExportExcelSettings AllowExportToExcel="False" />
                                    <Columns>
                                        <asp:TemplateField HeaderText="IP(起)" meta:resourcekey="TemplateFieldResource1">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="lbtnBegin" runat="server" Text='<%#: Bind("BEGIN") %>'
                                                    meta:resourcekey="lbtnBeginResource1"></asp:LinkButton>
                                            </ItemTemplate>
                                            <HeaderStyle Width="15%" />
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="END" HeaderText="IP(訖)"
                                            meta:resourcekey="BoundFieldResource1">
                                            <HeaderStyle Width="15%" />
                                        </asp:BoundField>
                                         <asp:TemplateField HeaderText="人員" meta:resourcekey="TemplateFieldResource4">
                                            <ItemTemplate>
                                                <uc1:UC_ChoiceList runat="server" ID="UC_ChoiceList_IP" IsAllowEdit="false" />
                                            </ItemTemplate>
                                            <HeaderStyle Width="45%" />
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="REMARK" HeaderText="備註"
                                            meta:resourcekey="BoundFieldResource2">
                                            <ItemStyle Width="25%" />
                                        </asp:BoundField>
                                       
                                    </Columns>
                                </Fast:Grid>
                            </td>
                        </tr>
                    </table>
                </ContentTemplate>
            </asp:UpdatePanel>
        </telerik:RadPageView>
        <telerik:RadPageView ID="pageView3" runat="server" Width="100%">
            <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                <ContentTemplate>
                    <telerik:RadToolBar ID="rtbPositionRange" runat="server" OnClientButtonClicking="rtbPositionRangeButtonClicking" OnButtonClick="rtbPositionRange_ButtonClick" Width="100%">
                        <Items>
                            <telerik:RadToolBarButton runat="server" Text="新增" Value="addPosition"
                                CheckedImageUrl="~/Common/Images/Icon/icon_m02.gif"
                                DisabledImageUrl="~/Common/Images/Icon/icon_m02.gif"
                                HoveredImageUrl="~/Common/Images/Icon/icon_m02.gif"
                                ImageUrl="~/Common/Images/Icon/icon_m02.gif"
                                meta:resourcekey="RadToolBarADDPositionResource1">
                            </telerik:RadToolBarButton>
                            <telerik:RadToolBarButton IsSeparator="true"></telerik:RadToolBarButton>
                            <telerik:RadToolBarButton runat="server" Text="刪除" Value="delPosition"
                                CheckedImageUrl="~/Common/Images/Icon/icon_m03.gif"
                                DisabledImageUrl="~/Common/Images/Icon/icon_m03.gif"
                                HoveredImageUrl="~/Common/Images/Icon/icon_m03.gif"
                                ImageUrl="~/Common/Images/Icon/icon_m03.gif"
                                meta:resourcekey="RadToolBarDELPositionResource1">
                            </telerik:RadToolBarButton>
                            <telerik:RadToolBarButton IsSeparator="true"></telerik:RadToolBarButton>
                        </Items>
                    </telerik:RadToolBar>
                    <Fast:Grid ID="punchPositionGrid" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateCheckBoxColumn="True"
                        AutoGenerateColumns="False" DataKeyNames="PUNCH_POSITION_GUID"
                        DataKeyOnClientWithCheckBox="True" DefaultSortDirection="Ascending" EmptyDataText="沒有資料"
                        EnableModelValidation="True" EnhancePager="True" OnPageIndexChanging="punchPositionGrid_PageIndexChanging"
                        OnRowDataBound="punchPositionGrid_RowDataBound" PageSize="15"
                        KeepSelectedRows="False" OnSorting="punchPositionGrid_Sorting"
                        meta:resourcekey="punchPositionGridResource1" DefaultSortColumnName="NAME" Width="70%">
                        <ExportExcelSettings AllowExportToExcel="False" />
                        <Columns>
                            <asp:TemplateField HeaderText="名稱" SortExpression="NAME" meta:resourcekey="TemplateFieldResource2">
                                <ItemTemplate>
                                    <asp:LinkButton ID="lbtnName" runat="server" Text='<%#: Bind("NAME") %>' OnClick="lbtnName_Click"></asp:LinkButton>
                                       
                                </ItemTemplate>
                                <HeaderStyle Width="20%" Wrap="false" />
                            </asp:TemplateField>
                            <asp:BoundField DataField="RADIUS" HeaderText="半徑範圍(公尺)" SortExpression="RADIUS" meta:resourcekey="BoundFieldResource3">
                                <HeaderStyle Width="10%" Wrap="false" />
                                <ItemStyle HorizontalAlign="Right" />
                            </asp:BoundField>
                            <asp:TemplateField HeaderText="人員" meta:resourcekey="TemplateFieldResource3">
                                <ItemTemplate>
                                    <uc1:UC_ChoiceList runat="server" ID="UC_ChoiceList_PunchPosition" IsAllowEdit="false" />
                                </ItemTemplate>
                                <HeaderStyle Width="70%" />
                            </asp:TemplateField>
                        </Columns>
                    </Fast:Grid>
                </ContentTemplate>

            </asp:UpdatePanel>
        </telerik:RadPageView>
        <telerik:RadPageView runat="server" ID="pageView4">
            <asp:Label ID="Label4" runat="server" Text="說明：需在一般組態定中將人員設定為可用App人員，才能使用App打卡" CssClass="SizeMemo" meta:resourcekey="Label4Resource1"></asp:Label>
            <uc1:UC_ChoiceList runat="server" ID="UC_ChoiceList_OnlyUseApp" IsAllowEdit="true" ExpandToUser="false"  ShowMember="false" />
            <asp:Label ID="lblNoAllowAppMsg" runat="server" Text="下列人員已設定不能使用App："  CssClass="SizeMemo" Visible="false" meta:resourcekey="lblNoAllowAppMsgResource1"></asp:Label><br />
            <asp:Label ID="lblNoAllowAppUser" runat="server" Text="" CssClass="SizeMemo" meta:resourcekey="lblNoAllowAppUserResource1"></asp:Label>

        </telerik:RadPageView>
    </telerik:RadMultiPage>
    <br />
    <asp:Label ID="lblDiagTitleAdd" runat="server" Text="新增IP範圍" Visible="False" meta:resourcekey="lblDiagTitleAddResource1"></asp:Label>
    <asp:Label ID="lblDiagTitleEdit" runat="server" Text="維護IP範圍" Visible="False" meta:resourcekey="lblDiagTitleEditResource1"></asp:Label>
    <asp:Label ID="lblDelIPConfirm" runat="server" Text="確定要刪除選取的IP嗎？" Visible="False" meta:resourcekey="lblDelIPConfirmResource1"></asp:Label>
    <asp:Label ID="Label2" runat="server" Text="特殊人員" Visible="False" meta:resourcekey="Label2Resource1"></asp:Label>
    <asp:Label ID="Label3" runat="server" Text="可刷卡IP維護" Visible="False"  meta:resourcekey="Label3Resource1"></asp:Label>
    <asp:Label ID="lblPositionDiagTitle" runat="server" Text="維護刷卡範圍" Visible="False" meta:resourcekey="lblDiagTitleEditResource1"></asp:Label>
    <asp:Label ID="lblLeaveManagament" runat="server" Text="假勤管理" Visible="False" meta:resourcekey="lblLeaveManagamentResource1"></asp:Label>
    <asp:Label ID="lblPunchManagement" runat="server" Text="刷卡管理" Visible="False" meta:resourcekey="lblPunchManagementResource1"></asp:Label>
    <asp:Label ID="lblMaintain" runat="server" Text="主檔維護" Visible="False" meta:resourcekey="lblMaintainResource1"></asp:Label>    
    <asp:Label ID="lblPunchIPRange" runat="server" Text="刷卡設定" Visible="False" meta:resourcekey="lblPunchIPRangeResource1"></asp:Label>
</asp:Content>
