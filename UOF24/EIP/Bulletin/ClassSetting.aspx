<%@ Page Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="EIP_Bulletin_ClassSetting" Title="類別設定" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" Codebehind="ClassSetting.aspx.cs" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <script id="classtreejs" type="text/javascript">
        function classTreeClientNodeDragStart(sender, args) {
            var node = args.get_node();
            if (sender.get_allowNodeEditing()) {
                node.set_allowEdit(false);
            }
        }


        function classTreeClientNodeDropping(sender, args) {
            var nSource = args.get_sourceNode();
            var nDest = args.get_destNode();
            if (nDest.get_value() == null) {
                $("#<%=hiddenDropTargetNode.ClientID %>").val('');
            }
            else {
                $("#<%=hiddenDropTargetNode.ClientID %>").val(nDest.get_value());
            }
            $("#<%=hiddenDropSourceNode.ClientID %>").val(nSource.get_value());
        }

        function classTreeClientNodeEditing(sender, args) {
            var node = args.get_node();
            if (node.get_level() == 0) {
                node.set_allowEdit(false);
            }
        }

        function classTreeClientNodeEdited(sender, args) {
            var node = args.get_node();
            if (node.get_level() == 0) {
                node.set_allowEdit(false);
            }
        }

        function RadToolBar1_ButtonClicking(sender, args) {

            var Key = args.get_item().get_value();
            if (Key == "CreateClass") {

                var tree = $find("<%= this.RadTreeView1.ClientID %>");
                var node = tree.get_selectedNode();
                if (node == null) {
                    args.set_cancel(true);
                    return;
                }

            }
            if (Key == "DeleteClass") {
                if (confirm('<%=msgDelconfirm.Text %>') == false)
                    args.set_cancel(true);
            }

            if (Key == "AddPublisher") {
                args.set_cancel(true);
                var TYPE = "Add";

                var classType = $("#<%= hfClassType.ClientID %>").val();
                var classID = $("#<%= hfClass.ClientID %>").val();
                $uof.dialog.open2("~/EIP/Bulletin/ModifyPublishersByClass.aspx", args.get_item(), "", 500, 300, openDialogResult, { "CLASSID": classID, "TYPE": TYPE, "CLASSTYPE": classType });
            }

            if (Key == "DeletePublisher") {
                args.set_cancel(true);
                var TYPE = "Delete";
                var classType = $("#<%= hfClassType.ClientID %>").val();
                var classID = $("#<%= hfClass.ClientID %>").val();

                $uof.dialog.open2("~/EIP/Bulletin/ModifyPublishersByClass.aspx", args.get_item(), "", 500, 300, openDialogResult, { "CLASSID": classID, "TYPE": TYPE, "CLASSTYPE": classType });
            }
            if (Key == "AddWebPart") {
                args.set_cancel(true);             

                $uof.dialog.open2("~/EIP/Bulletin/ClassifyMaintain.aspx", args.get_item(),'<%=lblMaintainTitle.Text%>', 700,600, openDialogResult);
            }
        }

        function openDialogResult(returnValue) {
            if (typeof (returnValue) == 'undefined')
                return false;
            else
                return true;
        }

        function resizeTree(X, Y) {
            var tree = $find("<%=RadTreeView1.ClientID %>");
    tree.get_element().style.height = Y - 35 + "px";
    tree.get_element().style.width = X + "px";
    $("#<%=X.ClientID%>").val(X);
        $("#<%=Y.ClientID%>").val(Y);
        }



    </script>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <telerik:RadSplitter ID="MainRadSplitter" runat="server" Width="100%" LiveResize="true" ResizeWithBrowserWindow="true" ResizeWithParentPane="true" Orientation="Horizontal" BorderSize="0">
                <telerik:RadPane ID="TopRadPane" runat="server" Height="35px" Scrolling="None">
                    <telerik:RadToolBar ID="RadToolBar1" runat="server" Width="100%" OnButtonClick="RadToolBar1_ButtonClick" OnClientButtonClicking="RadToolBar1_ButtonClicking">
                        <Items>
                            <telerik:RadToolBarButton runat="server" Value="CreateClass" Text="新增類別" HoveredImageUrl="~/Common/Images/Icon/icon_m47.png"
                                ImageUrl="~/Common/Images/Icon/icon_m47.png" CheckedImageUrl="~/Common/Images/Icon/icon_m47.png" DisabledImageUrl="~/Common/Images/Icon/icon_m47.png"
                                meta:resourcekey="TBarButtonResource1">
                            </telerik:RadToolBarButton>
                            <telerik:RadToolBarButton runat="server" IsSeparator="True" Value="s1">
                            </telerik:RadToolBarButton>
                            <telerik:RadToolBarButton runat="server" HoveredImageUrl="~/Common/Images/Icon/icon_m03.png" ImageUrl="~/Common/Images/Icon/icon_m03.png"
                                Value="DeleteClass" CheckedImageUrl="~/Common/Images/Icon/icon_m03.png" Text="刪除類別" DisabledImageUrl="~/Common/Images/Icon/icon_m03.png"
                                meta:resourcekey="TBarButtonResource2">
                            </telerik:RadToolBarButton>
                            <telerik:RadToolBarButton runat="server" IsSeparator="True" Value="s2">
                            </telerik:RadToolBarButton>
                            <telerik:RadToolBarButton runat="server" DisabledImageUrl="~/Common/Images/Icon/icon_m105.png" HoveredImageUrl="~/Common/Images/Icon/icon_m105.png"
                                ImageUrl="~/Common/Images/Icon/icon_m105.png" CheckedImageUrl="~/Common/Images/Icon/icon_m105.png"
                                Text="加入類別發佈對象" Value="AddPublisher"
                                meta:resourcekey="btnAddPublisherResource1">
                            </telerik:RadToolBarButton>
                            <telerik:RadToolBarButton runat="server" IsSeparator="True" Value="s3">
                            </telerik:RadToolBarButton>
                            <telerik:RadToolBarButton runat="server" DisabledImageUrl="~/Common/Images/Icon/icon_m107.png" HoveredImageUrl="~/Common/Images/Icon/icon_m107.png"
                                ImageUrl="~/Common/Images/Icon/icon_m107.png" CheckedImageUrl="~/Common/Images/Icon/icon_m107.png"
                                Text="移除類別發佈對象" Value="DeletePublisher" meta:resourcekey="btnDeletePublisherResource1">
                            </telerik:RadToolBarButton>
                            <telerik:RadToolBarButton runat="server" IsSeparator="True" Value="s4">
                            </telerik:RadToolBarButton>
                            <telerik:RadToolBarButton runat="server" DisabledImageUrl="~/Common/Images/Icon/icon_m43.png"
                                HoveredImageUrl="~/Common/Images/Icon/icon_m43.png" ImageUrl="~/Common/Images/Icon/icon_m43.png"
                                Value="AddWebPart" CheckedImageUrl="~/Common/Images/Icon/icon_m43.png" Text="分類公告維護" meta:resourcekey="btnAddWebPartResource1">
                            </telerik:RadToolBarButton>
                              <telerik:RadToolBarButton runat="server" IsSeparator="True" Value="s5">
                            </telerik:RadToolBarButton>
                        </Items>
                    </telerik:RadToolBar>
                </telerik:RadPane>
                <telerik:RadPane ID="TreeRadPane" runat="server" Scrolling="None">
                    <asp:CustomValidator ID="CustomValidator1" runat="server" ErrorMessage="請先選擇任一目錄" ForeColor="Red"
                        Display="Dynamic" meta:resourcekey="CustomValidator1Resource1"></asp:CustomValidator>
                    <asp:CustomValidator ID="CustomValidator2" runat="server" ErrorMessage="公告類別不可刪除" ForeColor="Red"
                        Display="Dynamic" meta:resourcekey="CustomValidator2Resource1"></asp:CustomValidator>
                    <asp:CustomValidator ID="CustomValidator3" runat="server" Display="Dynamic" ErrorMessage="類別底下存在子類別或公告" ForeColor="Red"
                        meta:resourcekey="CustomValidator3Resource1"></asp:CustomValidator>
                    <asp:CustomValidator ID="CustomValidator4" runat="server" Display="Dynamic" ErrorMessage="目錄名稱已經存在" ForeColor="Red"
                        meta:resourcekey="CustomValidator4Resource1"></asp:CustomValidator>
                    <asp:CustomValidator ID="CustomValidator5" runat="server" Display="Dynamic" ErrorMessage="無法更名 ! 已有相同類別存在" ForeColor="Red"
                        meta:resourcekey="CustomValidator5Resource1"></asp:CustomValidator>
                    <asp:CustomValidator ID="CustomValidator6" runat="server" Display="Dynamic" ErrorMessage="目錄名稱不允許空白" ForeColor="Red"
                        meta:resourcekey="CustomValidator6Resource1"></asp:CustomValidator>
                    <asp:CustomValidator ID="CustomValidator7" runat="server" Display="Dynamic" ErrorMessage="不允許更名" ForeColor="Red"
                        meta:resourcekey="CustomValidator7Resource1"></asp:CustomValidator>
                    <asp:CustomValidator ID="CustomValidator8" runat="server" Display="Dynamic" ErrorMessage="類別名稱超出長度" ForeColor="Red"
                        meta:resourcekey="CustomValidator8Resource1"></asp:CustomValidator>
                    <telerik:RadTreeView ID="RadTreeView1" runat="server" AllowNodeEditing="true" EnableDragAndDrop="true" Height="100%" Width="100%"
                        OnNodeClick="RadTreeView1_NodeClick" OnNodeEdit="RadTreeView1_NodeEdit" OnNodeDrop="RadTreeView1_NodeDrop"
                        OnClientNodeEditing="classTreeClientNodeEditing"
                        OnClientNodeEdited="classTreeClientNodeEdited"
                        OnClientNodeDragStart="classTreeClientNodeDragStart"
                        OnClientNodeDropping="classTreeClientNodeDropping">
                        <Nodes>
                            <telerik:RadTreeNode Value="Bulletinclass1"></telerik:RadTreeNode>
                            <telerik:RadTreeNode Value="Bulletinclass2"></telerik:RadTreeNode>
                        </Nodes>
                    </telerik:RadTreeView>


                    <asp:HiddenField ID="hfClassType" runat="server" />
                    <input id="hfClass" runat="server" type="hidden" />
                    <input id="hiddenDropTargetNode" runat="server" type="hidden" />
                    <input id="hiddenDropSourceNode" runat="server" type="hidden" />
                    <input id="hiddenNodeId" runat="server" type="hidden" />
                    <input id="hideStatus" runat="server" type="hidden" /><br />
                    <asp:Label ID="msgNotModify" runat="server" Text="不可修改" Visible="False" meta:resourcekey="msgNotModifyResource1"></asp:Label>
                    <asp:Label ID="msgDelconfirm" runat="server" Text="確定要刪除?" Visible="False" meta:resourcekey="msgDelconfirmResource1"></asp:Label>
                    <asp:Label ID="msgBulletinclass1" runat="server" Text="內部公告" Visible="False" meta:resourcekey="msgBulletinclass1Resource1"></asp:Label>
                    <asp:Label ID="msgBulletinclass2" runat="server" Text="外部公告" Visible="False" meta:resourcekey="msgBulletinclass2Resource1"></asp:Label>
                    <asp:Label ID="lblMaintainTitle" runat="server" Text="分類公告維護" Visible="False" meta:resourcekey="lblMaintainTitleResource1"></asp:Label>                
                </telerik:RadPane>
            </telerik:RadSplitter>
            <asp:HiddenField ID="X" runat="server" />
            <asp:HiddenField ID="Y" runat="server" />
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
