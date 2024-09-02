<%@ Page Title="" Language="C#" MasterPageFile="~/Master/DefaultMasterPage.master" AutoEventWireup="true" Inherits="System_SetRoleAdmin_SetHierarchical" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" Codebehind="SetHierarchical.aspx.cs" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <script type="text/javascript" id="igClientScript">
        function RadToolBar1_SetHR_ButtonClicking(sender, args) {
            var Key = args.get_item().get_value();
            if (Key === "ADD") {
                args.set_cancel(true);
                $uof.dialog.open2("~/System/SetRoleAdmin/Add.aspx", args.get_item(), "", 600, 300, OpenDialogResult)
            }
            if (Key === "DELETE") {
                if (confirm('<%=lbConfirmDelete.Text %>') === false) {
                    args.set_cancel(true);
                }
            }
        }
        function OpenDialogResult(returnValue)
        {
            if (typeof (returnValue) === 'undefined' || returnValue === null) {
                return false;
            }
            else
                return true;
        }
    </script>

    <telerik:RadToolBar ID="RadToolBar1" runat="server" Width="100%" OnButtonClick="RadToolBar1_ButtonClick" OnClientButtonClicking="RadToolBar1_SetHR_ButtonClicking">
        <Items>
            <telerik:RadToolBarButton runat="server" DisabledImageUrl="~/Common/Images/Icon/icon_m18.png"
                HoveredImageUrl="~/Common/Images/Icon/icon_m18.png"
                ImageUrl="~/Common/Images/Icon/icon_m18.png"
                CheckedImageUrl="~/Common/Images/Icon/icon_m18.png"
                Text="新增管理人員" Value="ADD" meta:resourcekey="TBarButtonResource1">
            </telerik:RadToolBarButton>
            <telerik:RadToolBarButton runat="server" IsSeparator="True" Value="s1">
            </telerik:RadToolBarButton>
            <telerik:RadToolBarButton runat="server" DisabledImageUrl="~/Common/Images/Icon/icon_m03.gif"
                HoveredImageUrl="~/Common/Images/Icon/icon_m03.gif"
                ImageUrl="~/Common/Images/Icon/icon_m03.gif"
                CheckedImageUrl="~/Common/Images/Icon/icon_m03.gif"
                Text="刪除管理人員" Value="DELETE" meta:resourcekey="TBarButtonResource2">
            </telerik:RadToolBarButton>
            <telerik:RadToolBarButton runat="server" IsSeparator="True" Value="s2">
            </telerik:RadToolBarButton>
        </Items>
    </telerik:RadToolBar>
    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
        <contenttemplate>
            <Fast:Grid ID="Grid1" runat="server" AllowPaging="True" AllowSorting="True"
        AutoGenerateCheckBoxColumn="True" AutoGenerateColumns="False" DefaultSortColumnName="ACCOUNT"
        DataKeyNames="HIERARCHICAL_GUID"   Width="100%"
        OnRowDataBound="Grid1_RowDataBound"
        DataKeyOnClientWithCheckBox="False" PageSize="15"
        DefaultSortDirection="Ascending" EnhancePager="True"
                onpageindexchanging="Grid1_PageIndexChanging" onsorting="Grid1_Sorting">
                <ExportExcelSettings AllowExportToExcel="False">
                </ExportExcelSettings>
                <Columns>
                    <asp:TemplateField HeaderText="帳號" meta:resourcekey="TemplateFieldResource1" SortExpression="ACCOUNT">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("ACCOUNT") %>'
                                meta:resourcekey="TextBox1Resource1"></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:LinkButton ID="LinkButton2" runat="server" onclick="LinkButton2_Click"
                                meta:resourcekey="LinkButton2Resource1">LinkButton</asp:LinkButton>
                        </ItemTemplate>
                        <ItemStyle Width="20%" />
                    </asp:TemplateField>
                    <asp:BoundField DataField="NAME" HeaderText="名稱" SortExpression="NAME"
                            meta:resourcekey="BoundFieldResource1">
                    <ItemStyle Width="20%" />
                    </asp:BoundField>
                    <asp:BoundField DataField="EMAIL" HeaderText="電子郵件" SortExpression="EMAIL"
                            meta:resourcekey="BoundFieldResource3">
                    <ItemStyle Width="20%" />
                    </asp:BoundField>
                    <asp:BoundField DataField="GROUP_NAME" HeaderText="管理部門(包含子部門)"
                        meta:resourcekey="BoundFieldResource2">
                    <ItemStyle Width="40%" />
                    </asp:BoundField>
                </Columns>
                <EnhancePagerSettings
                        ShowHeaderPager="True" />
            </Fast:Grid>
        </contenttemplate>
        <triggers>
            <asp:AsyncPostBackTrigger ControlID="RadToolBar1"
                EventName="ButtonClick" />
        </triggers>
    </asp:UpdatePanel>

    <asp:Label runat="server" ID="lbConfirmDelete" Text="確定要刪除?" Visible="False" meta:resourcekey="lbConfirmDeleteResource1"></asp:Label>
</asp:Content>