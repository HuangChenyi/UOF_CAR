<%@ Page Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="WKF_FlowManagement_SubFlowMT" Title="類別管理" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" Codebehind="SubFlowMT.aspx.cs" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <script type="text/javascript" id="telerikClientEvents1">
        function RadToolBar1_Clicking(sender, args) {
            var value = args.get_item().get_value();

            if (value == "AddCategory") {

            }
            else if (value == "DeleteCategory") {
                var tree = $find("<%=treeSubFlow.ClientID %>");
                var node = tree.get_selectedNode();

                if (node == null) {
                    // ========= 請先欲刪除類別 =========
                    alert('<%=lbNeedItemSelected.Text %>');
                    args.set_cancel(true);
                    return;
                }
                else {

                    if (node.get_level() == 1) {
                        // ========= 請先欲刪除類別 =========
                        alert('<%=lbNeedItemSelected.Text %>');
                        args.set_cancel(true);
                        return;
                    }
                    else if (node.get_childListElement() != null) {
                        alert('<%=lblHasFlowErrorMsg.Text %>');
                            args.set_cancel(true);
                            return;
                        }
                }

                if (confirm('<%=lbConfirmDelete.Text %>「' + node.get_text() + '」') == false)//確定要刪除?
                {
                    args.set_cancel(true);
                }
            }
    }
    </script>

    <script id="replaceJS" type="text/javascript">

        function ReplaceAll(strOrg, strFind, strReplace) {
            var index = 0;
            while (strOrg.indexOf(strFind, index) != -1) {
                strOrg = strOrg.replace(strFind, strReplace);
                index = strOrg.indexOf(strFind, index);
            }
            return strOrg;
        }
    </script>

    <script type="text/javascript">

        function EditCategoryNode() {
            var tree = $find("<%= treeSubFlow.ClientID %>");
            var node = tree.get_selectedNode();

            if (node != null && $('#<%=hidNeedEdit.ClientID%>').val() == 'true') {
                node.startEdit();
            }
        }

        function treeSubFlow_Load(sender, eventArgs) {
            EditCategoryNode();
        }
        function resizeTree(X, Y) {
            var tree = $find("<%=treeSubFlow.ClientID %>");
                    tree.get_element().style.height = Y - 35 + "px";
                    tree.get_element().style.width = X + "px";
                }
    </script>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server" RenderMode="Inline" UpdateMode="Conditional">
        <ContentTemplate>
            <asp:ValidationSummary ID="ValidationSummary1" runat="server" meta:resourcekey="ValidationSummary1Resource2" />
            <asp:CustomValidator ID="CustomValidator1" runat="server" Display="None" meta:resourcekey="CustomValidator1Resource2"></asp:CustomValidator>
            <telerik:RadSplitter ID="MasterRdSplitter" runat="server" Width="100%" LiveResize="true" ResizeWithBrowserWindow="true" ResizeWithParentPane="true" Orientation="Horizontal" BorderSize="0">
                <telerik:RadPane ID="TopRdPanel" runat="server" Height="35px" Scrolling="None">
                    <telerik:RadToolBar ID="RadToolBar1" runat="server" OnClientButtonClicking="RadToolBar1_Clicking" meta:resourcekey="UltraWebToolbar1Resource2" OnButtonClick="RadToolBar1_ButtonClick" Width="100%">
                        <Items>
                            <telerik:RadToolBarButton runat="server"
                                HoveredImageUrl="~/Common/Images/Icon/icon_m91.gif"
                                ImageUrl="~/Common/Images/Icon/icon_m91.gif"
                                Value="AddCategory"
                                CheckedImageUrl="~/Common/Images/Icon/icon_m91.gif"
                                DisabledImageUrl="~/Common/Images/Icon/icon_m91.gif"
                                Text="新增類別"
                                meta:resourcekey="TBarButtonResource1">
                            </telerik:RadToolBarButton>
                            <telerik:RadToolBarButton runat="server" IsSeparator="True" Text="Button 1" ImageUrl="~/App_Themes/DefaultTheme/images/toolbarSp.jpg">
                            </telerik:RadToolBarButton>
                            <telerik:RadToolBarButton runat="server"
                                HoveredImageUrl="~/Common/Images/Icon/icon_m03.gif"
                                ImageUrl="~/Common/Images/Icon/icon_m03.gif"
                                Value="DeleteCategory"
                                CheckedImageUrl="~/Common/Images/Icon/icon_m03.gif"
                                DisabledImageUrl="~/Common/Images/Icon/icon_m03.gif"
                                Text="刪除類別"
                                meta:resourcekey="TBarButtonResource2">
                            </telerik:RadToolBarButton>
                            <telerik:RadToolBarButton runat="server" IsSeparator="True" Text="Button 3" ImageUrl="~/App_Themes/DefaultTheme/images/toolbarSp.jpg">
                            </telerik:RadToolBarButton>
                        </Items>
                    </telerik:RadToolBar>
                </telerik:RadPane>
                <telerik:RadPane ID="TreeRdPanel" runat="server" Scrolling="None">
                    <telerik:RadTreeView ID="treeSubFlow" runat="server" Height="100%" Width="100%"
                        EnableDragAndDrop="true"
                        AllowNodeEditing="true"
                        OnClientLoad="treeSubFlow_Load"
                        OnNodeDrop="treeSubFlow_NodeDrop"
                        OnNodeEdit="treeSubFlow_NodeEdit">
                    </telerik:RadTreeView>
                    <input id="hidNeedEdit" runat="server" type="hidden" />
                    <input id="hiddenNodeId" runat="server" type="hidden" />
                    <input id="hiddenDropSourceNode" runat="server" type="hidden" />
                </telerik:RadPane>
            </telerik:RadSplitter>
        </ContentTemplate>
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="RadToolBar1" EventName="ButtonClick"></asp:AsyncPostBackTrigger>
        </Triggers>
    </asp:UpdatePanel>
    <asp:Label ID="lbConfirmDelete" runat="server" Text="確定要刪除？" Visible="False" meta:resourcekey="lbConfirmDeleteResource2"></asp:Label>
    <asp:Label ID="lblNotAllowEmpty" runat="server" Text="不允許空白！" Visible="False" meta:resourcekey="lblNotAllowEmptyResource1"></asp:Label>
    <asp:Label ID="lblRangeError" runat="server" Text="字數不可超過50！" Visible="False" meta:resourcekey="lblRangeErrorResource1"></asp:Label>
    <asp:Label ID="lblClassNameErrorMsg" runat="server" Text="類別名稱不可重複！" Visible="False" meta:resourcekey="lblClassNameErrorMsgResource1"></asp:Label>
    <asp:Label ID="lblHasFlowErrorMsg" runat="server" Visible="False" Text="類別中有流程不允許刪除！" meta:resourcekey="lblHasFlowErrorMsgResource1"></asp:Label>
    <asp:Label ID="lbNeedItemSelected" runat="server" Text="請選擇欲刪除類別！" Visible="False" meta:resourcekey="lbNeedItemSelectedResource2"></asp:Label>
    <asp:Label ID="lblDeleteErrorMsg1" runat="server" Text="錯誤！類別中有流程不允許刪除！" Visible="False" meta:resourcekey="lblDeleteErrorMsg1Resource1"></asp:Label>
    <asp:Label ID="lblDeleteErrorMsg2" runat="server" Text="錯誤！刪除失敗！" Visible="False" meta:resourcekey="lblDeleteErrorMsg2Resource1"></asp:Label>
    <asp:HiddenField ID="hiddenIsDelete" runat="server" />
</asp:Content>
