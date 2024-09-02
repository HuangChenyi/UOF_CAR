<%@ Page Title="類別維護" Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="EIP_Duty_Allowance_MaintainClass" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" Codebehind="MaintainClass.aspx.cs" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <script type="text/javascript">

        function OnClientButtonClicking(sender, args) {
            var key = args.get_item().get_value();
            switch (key) {
                case "Delete":
                    if (!confirm('<%=lbConfirmDelete.Text %>')) {
                        args.set_cancel(true);
                    }
                    break;
            }
        }

        function classTreeClientNodeClicked(sender, args) {

            var node = args.get_node();
            var tree = node.get_treeView();
            if (tree.get_allowNodeEditing() && !node.get_allowEdit()) {
                node.set_allowEdit(true);
            }
        }

        function classTreeClientNodeEditing(sender, args) {

            var node = args.get_node();

            if (node != null) {
                if (node.get_level() == 0) {
                    node.set_allowEdit(false);
                }
            }
        }
    </script>
    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
        <ContentTemplate>
            <telerik:RadSplitter ID="MasterRdSplitter" runat="server" Width="100%" LiveResize="true" ResizeWithBrowserWindow="true" ResizeWithParentPane="true" Orientation="Horizontal" BorderSize="0">
                <telerik:RadPane ID="TopRdPanel" runat="server" Height="35px" Scrolling="None">
                    <telerik:RadToolBar ID="RadToolBar1" runat="server" Width="100%"
                        OnButtonClick="RadToolBar1_OnButtonClick"
                        OnClientButtonClicking="OnClientButtonClicking"
                        meta:resourcekey="RadToolBar1Resource1">
                        <Items>
                            <telerik:RadToolBarButton runat="server" Text="新增類別" Value="Add"
                                CheckedImageUrl="~/Common/Images/Icon/icon_m148.gif"
                                DisabledImageUrl="~/Common/Images/Icon/icon_m148.gif"
                                HoveredImageUrl="~/Common/Images/Icon/icon_m148.gif"
                                ImageUrl="~/Common/Images/Icon/icon_m148.gif"
                                meta:resourcekey="RadToolBarButtonResource1">
                            </telerik:RadToolBarButton>
                            <telerik:RadToolBarButton IsSeparator="true"
                                meta:resourcekey="RadToolBarButtonResource2">
                            </telerik:RadToolBarButton>
                            <telerik:RadToolBarButton runat="server" Text="刪除類別" Value="Delete"
                                CheckedImageUrl="~/Common/Images/Icon/icon_m03.gif"
                                DisabledImageUrl="~/Common/Images/Icon/icon_m03.gif"
                                HoveredImageUrl="~/Common/Images/Icon/icon_m03.gif"
                                ImageUrl="~/Common/Images/Icon/icon_m03.gif"
                                meta:resourcekey="RadToolBarButtonResource3">
                            </telerik:RadToolBarButton>
                            <telerik:RadToolBarButton IsSeparator="true"
                                meta:resourcekey="RadToolBarButtonResource4">
                            </telerik:RadToolBarButton>
                        </Items>
                    </telerik:RadToolBar>
                </telerik:RadPane>
                <telerik:RadPane ID="TreeRdPanel" runat="server" Scrolling="None">
                    <telerik:RadTreeView ID="classTree" runat="server" AllowNodeEditing="True" Width="100%" Height="100%"
                        OnNodeClick="classTree_NodeClick"
                        OnNodeEdit="classTree_NodeEdit"
                        OnClientNodeClicked="classTreeClientNodeClicked"
                        OnClientNodeEditing="classTreeClientNodeEditing" meta:resourcekey="classTreeResource1">
                    </telerik:RadTreeView>
                    <asp:Label runat="server" ID="lblAll" Text="所有類別" Visible="False"
                        meta:resourcekey="lblAllResource1"></asp:Label>
                    <input id="hiddenNodeId" runat="server" type="hidden" />
                    </input>
            </input>
            <asp:Label ID="lblClassNameErrorMsg" runat="server" meta:resourceKey="lblClassNameErrorMsgResource1" Text="類別名稱不可重複!" Visible="False"></asp:Label>
                    <asp:Label ID="lblNotAllowEmpty" runat="server" meta:resourceKey="lblNotAllowEmptyResource1" Text="不允許空白!" Visible="False"></asp:Label>
                    <asp:Label ID="lbConfirmDelete" runat="server" meta:resourceKey="lbConfirmDeleteResource1" Text="確定要刪除?" Visible="False"></asp:Label>
                    <asp:Label ID="lblAllowanceInClass" runat="server" meta:resourceKey="lblAllowanceInClassResource1" Text="該類別底下尚有津貼項目，不允許刪除!" Visible="False"></asp:Label>
                </telerik:RadPane>
            </telerik:RadSplitter>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>