<%@ Page Title="類別維護" Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="System_Organization_Employee_HR_MaintainEipLicType" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" Codebehind="MaintainEipLicType.aspx.cs" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <script type="text/javascript">

        function RadToolBar1_EipLicType_ButtonClicking(sender, args) {
            var Key = args.get_item().get_value();
            if (Key === "btnDelete") {
                if (!confirm('<%=lblConfirmDel.Text %>')) {
                    args.set_cancel(true);
                }
            }
        }

    </script>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <telerik:RadSplitter ID="MasterRdSplitter" runat="server" Width="100%" LiveResize="true" ResizeWithBrowserWindow="true" ResizeWithParentPane="true" Orientation="Horizontal" BorderSize="0">
                <telerik:RadPane ID="TopRdPanel" runat="server" Height="35px" Scrolling="None">
                    <telerik:RadToolBar ID="RadToolBar1" runat="server" Width="100%" OnButtonClick="RadToolBar1_ButtonClick" OnClientButtonClicking="RadToolBar1_EipLicType_ButtonClicking">
                        <Items>
                            <telerik:RadToolBarButton runat="server" Text="新增類別" Value="btnInsert" DisabledImageUrl="~/Common/Images/Icon/icon_m91.gif"
                                HoveredImageUrl="~/Common/Images/Icon/icon_m91.gif" ImageUrl="~/Common/Images/Icon/icon_m91.gif"
                                SelectedImage="~/Common/Images/Icon/icon_m91.gif" meta:resourcekey="TBarButtonResource1">
                            </telerik:RadToolBarButton>
                            <telerik:RadToolBarButton runat="server" IsSeparator="True">
                            </telerik:RadToolBarButton>
                            <telerik:RadToolBarButton runat="server" Text="刪除類別" Value="btnDelete" DisabledImageUrl="~/Common/Images/Icon/icon_m03.gif"
                                HoveredImageUrl="~/Common/Images/Icon/icon_m03.gif" ImageUrl="~/Common/Images/Icon/icon_m03.gif"
                                CheckedImageUrl="~/Common/Images/Icon/icon_m03.gif" meta:resourcekey="TBarButtonResource2">
                            </telerik:RadToolBarButton>
                            <telerik:RadToolBarButton runat="server" IsSeparator="True">
                            </telerik:RadToolBarButton>
                        </Items>
                    </telerik:RadToolBar>
                </telerik:RadPane>
                <telerik:RadPane ID="TreeRdPanel" runat="server">
                    <telerik:RadTreeView ID="RadTreeViewLicType" runat="server" AllowNodeEditing="true" OnNodeEdit="RadTreeViewLicType_NodeEdit">
                    </telerik:RadTreeView>
                </telerik:RadPane>
            </telerik:RadSplitter>
        </ContentTemplate>
    </asp:UpdatePanel>
    <asp:Label ID="lblNewType" runat="server" Text="新類別" Visible="False" meta:resourcekey="lblNewTypeResource1"></asp:Label>
    <asp:Label ID="lblClassNameDuplicate" runat="server" Text="類別名稱重複" Visible="False" meta:resourcekey="lblClassNameDuplicateResource1"></asp:Label>
    <asp:Label ID="lblNotAllowEmpty" runat="server" Text="類別名稱空白" Visible="False" meta:resourcekey="lblNotAllowEmptyResource1"></asp:Label>
    <asp:Label ID="lblConfirmDel" runat="server" Text="確認刪除嗎?" Visible="False" meta:resourcekey="lblConfirmDelResource1"></asp:Label>
    <asp:Label ID="lblAllType" runat="server" Text="全部" Visible="False" meta:resourcekey="lblAllTypeResource1"></asp:Label>
</asp:Content>
