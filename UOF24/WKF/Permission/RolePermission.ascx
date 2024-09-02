<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="RolePermission.ascx.cs" Inherits="Ede.Uof.Web.WKF.Permission.RolePermission" %>
<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>

<script>
    function onToolBarClientClicking(sender, args){
        if (args.get_item().get_value() == "ExportFormList") {
            var senderButtton = args.get_item();
            args.set_cancel(true);
            $uof.dialog.open2("~/WKF/Permission/ExportPermission.aspx", senderButtton, "<%=lblSearchRole.Text%>", 500, 250, function () { return false;});
        }
    }
</script>
<style>
    .ColumnHide {
        display:none;
    }
</style>
<asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>
        <telerik:RadToolBar ID="RadToolBar1" runat="server" Width="100%" OnButtonClick="RadToolBar1_ButtonClick" OnClientButtonClicking="onToolBarClientClicking" meta:resourcekey="RadToolBar1Resource1" SingleClick="None">
            <Items>
                <telerik:RadToolBarButton runat="server"
                    Text="查詢"
                    ImageUrl="~/Common/Images/Icon/icon_m39.gif"
                    HoveredImageUrl="~/Common/Images/Icon/icon_m39.gif"
                    DisabledImageUrl="~/Common/Images/Icon/icon_m39.gif"
                    CheckedImageUrl="~/Common/Images/Icon/icon_m39.gif"
                    Value="Search" meta:resourcekey="RadToolBarButtonResource1">
                </telerik:RadToolBarButton>
                <telerik:RadToolBarButton runat="server" IsSeparator="True" Text="Button 1" Image="~/App_Themes/DefaultTheme/images/toolbarSp.jpg" meta:resourcekey="RadToolBarButtonResource2">
                </telerik:RadToolBarButton>
                <telerik:RadToolBarButton runat="server"
                    Text="排程匯出Excel"
                    ImageUrl="~/Common/Images/Icon/icon_m144.gif"
                    HoveredImageUrl="~/Common/Images/Icon/icon_m144.gif"
                    DisabledImageUrl="~/Common/Images/Icon/icon_m144.gif"
                    CheckedImageUrl="~/Common/Images/Icon/icon_m144.gif"
                    Value="ExportFormList" meta:resourcekey="RadToolBarButtonResource3">
                </telerik:RadToolBarButton>
                <telerik:RadToolBarButton runat="server" IsSeparator="True" Text="Button 3" Image="~/App_Themes/DefaultTheme/images/toolbarSp.jpg" meta:resourcekey="RadToolBarButtonResource4">
                </telerik:RadToolBarButton>
                <telerik:RadToolBarButton>
                    <ItemTemplate>
                        <asp:Label ID="lblMemo" runat="server" Text="*查詢結果不包含停用人員及帳號到期人員" CssClass="SizeMemo" meta:resourcekey="RadToolBarButtonResource5"></asp:Label>
                    </ItemTemplate>
                </telerik:RadToolBarButton>
            </Items>

        </telerik:RadToolBar>
        <table class="PopTable">
            <tr style="width: 100%">
                <td style="width: 8%">
                    <asp:Label ID="Label1" runat="server" Text="表單類別" meta:resourcekey="Label1Resource1"></asp:Label>
                </td>
                <td style="width: 25%">
                    <asp:DropDownList ID="ddlFormCategory" runat="server" OnSelectedIndexChanged="ddlFormCategory_SelectedIndexChanged" AutoPostBack="True" meta:resourcekey="ddlFormCategoryResource1"></asp:DropDownList>
                </td>
                <td style="width: 8%">
                    <asp:Label ID="Label2" runat="server" Text="表單名稱" meta:resourcekey="Label2Resource1"></asp:Label>
                </td>
                <td style="width: 25%">
                    <asp:DropDownList ID="ddlFormNames" runat="server" OnSelectedIndexChanged="ddlFormNames_SelectedIndexChanged" AutoPostBack="True" meta:resourcekey="ddlFormNamesResource1"></asp:DropDownList>
                </td>
                <td style="width: 8%">
                    <asp:Label ID="Label3" runat="server" Text="角色" meta:resourcekey="Label3Resource1"></asp:Label>
                </td>
                <td style="width: 25%">
                    <asp:DropDownList ID="ddlRoles" runat="server" meta:resourcekey="ddlRolesResource1">
                        <asp:ListItem Text="全部" Value="All" meta:resourcekey="ListItemResource1"></asp:ListItem>
                        <asp:ListItem Text="表單負責人" Value="WKFResponsible" meta:resourcekey="ListItemResource2"></asp:ListItem>
                        <asp:ListItem Text="表單查閱者" Value="WKFReader" meta:resourcekey="ListItemResource3"></asp:ListItem>
                        <asp:ListItem Text="歸檔者" Value="WKFArchiveUser" meta:resourcekey="ListItemResource4"></asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
        </table>
        <Fast:Grid ID="permissionGrid" runat="server" AutoGenerateCheckBoxColumn="False" AllowPaging="True" OnPageIndexChanging="permissionGrid_PageIndexChanging"
            Width="100%" AllowSorting="True" AutoGenerateColumns="False" OnRowDataBound="permissionGrid_RowDataBound" OnSorting="permissionGrid_Sorting"
            DataKeyOnClientWithCheckBox="False" DefaultSortDirection="Ascending" EmptyDataText="沒有資料" EnhancePager="True" KeepSelectedRows="False" PageSize="15" 
            DefaultSortColumnName="ACCOUNT" OnBeforeExport="permissionGrid_BeforeExport" CustomDropDownListPage="False" meta:resourcekey="permissionGridResource1" SelectedRowColor="" UnSelectedRowColor="">
            <EnhancePagerSettings ShowHeaderPager="True" FirstAltImageUrl="" FirstImageUrl="" LastAltImage="" LastImageUrl="" NextIAltImageUrl="" NextImageUrl="" PageInfoCssClass="" PageNumberCssClass="" PageNumberCurrentCssClass="" PageRedirectCssClass="" PreviousAltImageUrl="" PreviousImageUrl=""></EnhancePagerSettings>
            <ExportExcelSettings AllowExportToExcel="True" DataSourceType="ObjectDataSource"></ExportExcelSettings>
            <Columns>
                 <asp:TemplateField HeaderText="表單類別" meta:resourcekey="TemplateFieldResource1">
                    <ItemTemplate>
                        <asp:Label runat="server" ID="lblCategory" meta:resourcekey="lblCategoryResource1"></asp:Label>
                    </ItemTemplate>
                     <HeaderStyle CssClass="ColumnHide" />
                     <ItemStyle CssClass="ColumnHide" />
                </asp:TemplateField>
                <asp:BoundField DataField="FORM_ID" HeaderText="表單名稱" SortExpression="FORM_ID" meta:resourcekey="BoundFieldResource1">
                    <ItemStyle Wrap="False" Width="16%"></ItemStyle>
                </asp:BoundField>
                <asp:TemplateField HeaderText="角色" SortExpression="ROLE_ID" meta:resourcekey="TemplateFieldResource2">
                    <ItemTemplate>
                        <asp:Label runat="server" ID="lblRoleName" meta:resourcekey="lblRoleNameResource1"></asp:Label>
                    </ItemTemplate>
                    <ItemStyle Wrap="False" Width="16%"/>
                </asp:TemplateField>
                 <asp:BoundField DataField="ACCOUNT" HeaderText="帳號" SortExpression="ACCOUNT" meta:resourcekey="BoundFieldResource2">
                    <ItemStyle Wrap="False" Width="16%"></ItemStyle>
                </asp:BoundField>
                <asp:BoundField DataField="NAME" HeaderText="姓名" SortExpression="NAME" meta:resourcekey="BoundFieldResource4">
                    <ItemStyle Wrap="False" Width="16%"></ItemStyle>
                </asp:BoundField>
                 <asp:BoundField DataField="EMPLOYEE_NO" HeaderText="員工編號" SortExpression="EMPLOYEE_NO" meta:resourcekey="BoundFieldResource3">
                    <ItemStyle Wrap="False" Width="16%"></ItemStyle>
                </asp:BoundField>
                <asp:BoundField DataField="GROUP_NAME" HeaderText="部門" SortExpression="GROUP_NAME" meta:resourcekey="BoundFieldResource5">
                    <ItemStyle Wrap="False"></ItemStyle>
                </asp:BoundField>
            </Columns>
        </Fast:Grid>
        <asp:Label ID="lblAll" runat="server" Text="全部" Visible="False" meta:resourcekey="lblAllResource1"></asp:Label>
        <asp:Label ID="lblSearchRole" runat="server" Text="依角色查詢" Visible="False" meta:resourcekey="lblSearchRoleResource1"></asp:Label>
    </ContentTemplate>
</asp:UpdatePanel>
