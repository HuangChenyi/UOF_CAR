<%@ Page Title="" Language="C#" MasterPageFile="~/Master/DefaultMasterPage.master" AutoEventWireup="true" Inherits="EIP_Duty_Leave_CharityLeave_CharityLeaveConfig" CodeBehind="CharityLeaveConfig.aspx.cs" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <script type="text/javascript">
        function RadToolBarButtonClicking(sender, args) {
            var key = args.get_item().get_value();
            switch (key) {
                case "Add":
                    args.set_cancel(true);
                    var Type = "add";
                    $uof.dialog.open2("~/EIP/Duty/Leave/CharityLeave/MaintainCharityLeave.aspx", args.get_item(), '<%=lblDialogTitle.Text%>', 600, 560, openDialogResult, { "type": Type });

                    break;
                case "Delete":
                    var grid = window['<%=CharityLeaveGrid.ClientID %>'];
                    var totalrowcount = grid.rows.length;
                    if (totalrowcount > 1) {
                        if (confirm('<%=lblDeleteMsg.Text %>')) {
                            $('#<%= hfIsDelete.ClientID %>').val("True");
                        } else {
                            $('#<%= hfIsDelete.ClientID %>').val("False");
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
    </script>

    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <table style="width: 100%;">
                <tr>
                    <td>
                        <telerik:RadToolBar ID="RadToolBar1" runat="server" Width="100%" OnButtonClick="RadToolBar1_OnButtonClick" OnClientButtonClicking="RadToolBarButtonClicking">
                            <Items>
                                <telerik:RadToolBarButton runat="server" Text="新增" Value="Add"
                                    CheckedImageUrl="~/Common/Images/Icon/icon_m02.gif"
                                    DisabledImageUrl="~/Common/Images/Icon/icon_m02.gif"
                                    HoveredImageUrl="~/Common/Images/Icon/icon_m02.gif"
                                    ImageUrl="~/Common/Images/Icon/icon_m02.gif"
                                    meta:resourcekey="RadToolBarAddResource1">
                                </telerik:RadToolBarButton>
                                <telerik:RadToolBarButton IsSeparator="true"></telerik:RadToolBarButton>
                                <telerik:RadToolBarButton runat="server" Text="刪除" Value="Delete"
                                    CheckedImageUrl="~/Common/Images/Icon/icon_m03.gif"
                                    DisabledImageUrl="~/Common/Images/Icon/icon_m03.gif"
                                    HoveredImageUrl="~/Common/Images/Icon/icon_m03.gif"
                                    ImageUrl="~/Common/Images/Icon/icon_m03.gif"
                                    meta:resourcekey="RadToolBarDeleteResource1">
                                </telerik:RadToolBarButton>
                                <telerik:RadToolBarButton IsSeparator="true"></telerik:RadToolBarButton>
                                <telerik:RadToolBarButton runat="server">
                                    <ItemTemplate>
                                        <asp:Label ID="lblName" runat="server" Text="活動名稱:" meta:resourcekey="lblNameResource1"></asp:Label>
                                    </ItemTemplate>
                                </telerik:RadToolBarButton>
                                <telerik:RadToolBarButton runat="server" Value="name">
                                    <ItemTemplate>
                                        <asp:TextBox ID="txtCharityName" runat="server"></asp:TextBox>
                                    </ItemTemplate>
                                </telerik:RadToolBarButton>
                                <telerik:RadToolBarButton IsSeparator="true"></telerik:RadToolBarButton>
                                <telerik:RadToolBarButton runat="server" Text="查詢" Value="Query"
                                    CheckedImageUrl="~/Common/Images/Icon/icon_m39.gif"
                                    DisabledImageUrl="~/Common/Images/Icon/icon_m39.gif"
                                    HoveredImageUrl="~/Common/Images/Icon/icon_m39.gif"
                                    ImageUrl="~/Common/Images/Icon/icon_m39.gif"
                                    meta:resourcekey="RadToolBarQueryResource1">
                                </telerik:RadToolBarButton>
                                <telerik:RadToolBarButton IsSeparator="true"></telerik:RadToolBarButton>
                            </Items>
                        </telerik:RadToolBar>
                    </td>
                </tr>
                <tr>
                    <td>
                        <Fast:Grid ID="CharityLeaveGrid" 
                            Width="100%" runat="server" DataKeyNames="MASTER_CHARITY_GUID" PageSize="15"
                            AllowSorting="True" AllowPaging="True" AutoGenerateCheckBoxColumn="True"
                            DataKeyOnClientWithCheckBox="False" DefaultSortDirection="Ascending"
                            EmptyDataText="沒有資料" EnhancePager="True" KeepSelectedRows="False"                            
                            AutoGenerateColumns="False" DefaultSortColumnName="START_DATETIME"
                            OnPageIndexChanging="CharityLeaveGrid_PageIndexChanging"
                            OnRowDataBound="CharityLeaveGrid_RowDataBound"
                            OnSorting="CharityLeaveGrid_Sorting"
                            meta:resourcekey="CharityLeaveGridResource1" CustomDropDownListPage="False" SelectedRowColor="" UnSelectedRowColor="">
                            <EnhancePagerSettings FirstImageUrl="" FirstAltImageUrl="" PreviousImageUrl="" 
                                NextImageUrl="" LastImageUrl="" LastAltImage="" PageNumberCssClass="" 
                                PageNumberCurrentCssClass="" PageInfoCssClass="" PageRedirectCssClass="" 
                                NextIAltImageUrl="" PreviousAltImageUrl="" ShowHeaderPager="True"></EnhancePagerSettings>
                            <ExportExcelSettings AllowExportToExcel="False"></ExportExcelSettings>
                            <Columns>
                                <asp:TemplateField HeaderText="是否啟用" SortExpression="ACTIVE"
                                    meta:resourcekey="TemplateFieldResource1">
                                    <ItemTemplate>
                                        <asp:Label ID="lblYes" runat="server" Text="是" Visible="False"
                                            meta:resourcekey="lblYesResource1"></asp:Label>
                                        <asp:Label ID="lblNo" runat="server" Text="否" Visible="False"
                                            meta:resourcekey="lblNoResource1"></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="活動名稱" SortExpression="NAME" meta:resourcekey="TemplateFieldResource2">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="lbtnName" runat="server" meta:resourcekey="lbtnNameResource1" OnClick="lbtnName_Click"></asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="活動時間(起)" SortExpression="START_DATETIME" meta:resourcekey="BoundFieldResource3">
                                    <ItemTemplate>
                                        <asp:Label ID="lblStartDateTime" runat="server" Text='<%# Bind("START_DATETIME") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="活動時間(訖)" SortExpression="END_DATETIME" meta:resourcekey="BoundFieldResource4">
                                    <ItemTemplate>
                                        <asp:Label ID="lblEndDateTime" runat="server" Text='<%# Bind("END_DATETIME") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="活動時區" SortExpression="TIMEZONE" meta:resourcekey="TemplateFieldResource3">
                                    <ItemTemplate>
                                        <asp:Label ID="lblTimeZone" runat="server"></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="ACTIVITY_HOURS" HeaderText="活動時數"
                                    SortExpression="ACTIVITY_HOURS" meta:resourcekey="BoundFieldResource7" />
                                <asp:BoundField DataField="HOURS" HeaderText="公益時數"
                                    SortExpression="HOURS" meta:resourcekey="BoundFieldResource5" />
                                <asp:BoundField DataField="LOCATION" HeaderText="活動地點" SortExpression="LOCATION"
                                    meta:resourcekey="BoundFieldResource1" />
                                <asp:BoundField DataField="CONTENT" HeaderText="活動內容" SortExpression="CONTENT"
                                    meta:resourcekey="BoundFieldResource2" />
                                <asp:BoundField DataField="USERS" HeaderText="活動名額"
                                    SortExpression="USERS" meta:resourcekey="BoundFieldResource6" />
                            </Columns>
                        </Fast:Grid>
                    </td>
                </tr>
            </table>
        </ContentTemplate>
    </asp:UpdatePanel>

    <asp:Label ID="lblDialogTitle" runat="server" Text="新增/維䕶公益活動" Visible="False" meta:resourcekey="lblDialogTitleResource1"></asp:Label>
    <asp:HiddenField ID="hfIsDelete" runat="server" />
    <asp:Label ID="lblDeleteMsg" runat="server" Text="確定刪除?" Visible="False" meta:resourcekey="lblDeleteMsgResource1"></asp:Label>
</asp:Content>
