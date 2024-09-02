<%@ Page Title="管理群組" Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" CodeBehind="HierarchicalGroup.aspx.cs" Inherits="System_Organization_Group_HierarchicalGroup" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script type="text/javascript">

        function resizeMangerTree(X, Y) {
            var tree = $find("<%=RadTreeView1.ClientID %>");
            tree.get_element().style.height = Y - 35 + "px";
            tree.get_element().style.width = X + "px";
        }


        function ClientNodeDragStart(sender, eventArgs) {
            var node = eventArgs.get_node();
            var tree = node.get_treeView();
            var nodes = tree.get_allNodes();
            for (var i = 0; i < nodes.length; i++) {
                nodes[i].endEdit();
            }
        }
       
         function ClientNodeDropping(sender, eventArgs) {
            var sourceNode = eventArgs.get_sourceNode();
            var parentNode = sourceNode.get_parent();
            var targetNode = eventArgs.get_destNode();

            if (parentNode == null) {
                eventArgs.set_cancel(true);
            }
            else {
                var ChangeGroupParentData = [sourceNode.get_value(), sourceNode.get_text(), targetNode.get_value(), sourceNode.get_value(), targetNode.get_value()];
                var result = $uof.pageMethod.sync("ChangeGroupParent", ChangeGroupParentData);

                if (result == null) {
                    alert("server error");
                    SetToolbarEnable(true);
                }
                else {
                    if (result.indexOf('Error') > -1) {
                        alert(result);
                        SetToolbarEnable(true);
                    }
                    else {
                        window.location = "<%=Request.Path %>?focusNode=" + result;
                        top.returnValue = "";
                    }
                }
            }

         }
        function ClientNodeEditing(sender, eventArgs) {
            var node = eventArgs.get_node();
            var text = eventArgs.get_newText();
            var oldtext = node.get_text();

            //如果是新增;
            if (node.get_value() == null || node.get_value() == "") {
                var guid = $uof.tool.getNewGuid();
                node.set_value(guid);
                var parentNode = node.get_parent();
                var parentGuid = parentNode.get_value();

                var createdata = [guid, text, parentGuid, guid, oldtext];
                var result = $uof.pageMethod.sync("CreateGroup", createdata);
                if (result == null) {
                    alert("server error");
                    node.get_parent().get_nodes().remove(node);
                    SetToolbarEnable(true);
                }
                else {
                    if (result.indexOf('Error') > -1) {

                        alert(result);
                        node.set_value("");
                        node.set_text(oldtext);
                        eventArgs.set_cancel(true);
                        setTimeout(function () { node.startEdit(); }, 100);

                    }
                    else {
                        top.returnValue = "";
                        SetToolbarEnable(true);
                    }
                }
            }
            else {
                var modifydata = [node.get_value(), text, node.get_value(), oldtext];
                var result = $uof.pageMethod.sync("ModifyGroup", modifydata);

                if (result == null) {
                    alert("server error");

                    node.set_text(oldtext);
                    SetToolbarEnable(true);
                }
                else {
                    if (result.indexOf('Error') > -1) {
                        alert(result);
                        node.set_text(oldtext);
                        eventArgs.set_cancel(true);
                        setTimeout(function () { node.startEdit(); }, 100);
                    }
                    else {
                        SetToolbarEnable(true);
                        top.returnValue = "";
                    }
                }
            }
            checkNodePostion(node);
            SetToolbarEnable(true);
        }

        function ClientNodeClicked(sender, eventArgs) {
            var node = eventArgs.get_node();
            node.set_selected(true);
            checkNodePostion(node);
        }

        function ClientNodeClicking(sender, eventArgs) {
            var node = eventArgs.get_node();
            if (sender.get_allowNodeEditing() && !node.get_allowEdit())
                node.set_allowEdit(true);
        }
       
        Sys.Application.add_load(function () {
            var tree = $find("<%= RadTreeView1.ClientID %>");
            var selectedNode = tree.get_selectedNode()
            if (selectedNode != null) {
                window.setTimeout(function () { selectedNode.scrollIntoView(); }, 200);
            }
            checkNodePostion(selectedNode);
        });

            function checkNodePostion(treeNode) {
                if (treeNode != null) {

                    var oToolbar = $find("<%=RadToolBar1.ClientID %>");
                    var itemdown = oToolbar.findItemByValue("movedown");
                    var itemup = oToolbar.findItemByValue("moveup");

                    itemdown.set_enabled((treeNode.get_nextNode() != null));
                    itemup.set_enabled((treeNode.get_previousNode() != null));

                }

            }

        function RadToolBar1_Group_ButtonClicking(sender, args) {
            //Add code to handle your event here.
            args.set_cancel(true);
            var Key = args.get_item().get_value();

            if (Key == "createGroup") {
                var tree = $find("<%=RadTreeView1.ClientID %>");
                var parentNode = tree.get_selectedNode();
                if (parentNode != null) {
                    SetToolbarEnable(false);
                    var node = new Telerik.Web.UI.RadTreeNode();
                    node.set_text("New Group");
                    node.set_imageUrl("<%=Request.ApplicationPath %>" + "/Common/Images/Icon/icon_m05.png");
                    parentNode.get_nodes().insert(0, node);
                    parentNode.expand();
                    node.scrollIntoView();
                    node.startEdit();
                }
                else {
                    alert('<%=lbNeedItemSelected.Text %>');
                }
            }
            else if (Key == "delete") {
                var tree = $find("<%=RadTreeView1.ClientID %>");
                var node = tree.get_selectedNode();
                if (node) {
                    var level = node.get_level();

                    if (confirm('<%=Ede.Uof.Utility.Page.Common.Resource.GetResource("Common","ConfirmDelete") %>')) {
                        SetToolbarEnable(false);
                        var deletedata = [node.get_value(), level, node.get_value()];
                        var result = $uof.pageMethod.sync("DeleteGroup", deletedata);

                        if (result == null) {
                            alert("server error");
                        }
                        else {
                            if (result.indexOf('Error') > -1) {
                                alert(result);
                            }
                            else {
                                if (node) {
                                    if (node.get_level == 0) {
                                        tree.get_nodes().remove(node);
                                        tree.get_nodes().getNode(0).set_selected(true);
                                    }
                                    else {
                                        var parentnode = node.get_parent();
                                        parentnode.get_nodes().remove(node);
                                        parentnode.set_selected(true);
                                        checkNodePostion(parentnode);
                                    }
                                }

                                top.returnValue = "";
                            }
                        }

                        SetToolbarEnable(true);
                    }
                }
            }
            else if (Key == "moveup") {
                var tree = $find("<%=RadTreeView1.ClientID %>");

                var node = tree.get_selectedNode();
                var parentNode = node.get_parent();
                var index = node.get_index();

                var changedata = [node.get_value(), parentNode.get_value(), index + 1 - 1];
                var result = $uof.pageMethod.sync("ChangeGroupPostion", changedata);
                if (result == null) {
                    alert("server error");
                    SetToolbarEnable(true);
                }
                else {
                    if (result.indexOf('Error') > -1) {
                        alert(result);
                        SetToolbarEnable(true);
                    }
                    else {
                        window.location = "<%=Request.Path %>?focusNode=" + result;
                        top.returnValue = "";
                    }
                }
            }
            else if (Key == "movedown") {
                var tree = $find("<%=RadTreeView1.ClientID %>");
                var node = tree.get_selectedNode();
                var parentNode = node.get_parent();
                var index = node.get_index();

                var changedata = [node.get_value(), parentNode.get_value(), index + 1 + 1];
                var result = $uof.pageMethod.sync("ChangeGroupPostion", changedata);
                if (result == null) {
                    alert("server error");
                    SetToolbarEnable(true);
                }
                else {
                    if (result.indexOf('Error') > -1) {
                        alert(result);
                        SetToolbarEnable(true);
                    }
                    else {
                        window.location = "<%=Request.Path %>?focusNode=" + result;
                        top.returnValue = "";
                    }
                }
            }
        }
        
        function SetToolbarEnable(enable) {
            var oToolbar = $find("<%=RadToolBar1.ClientID %>");
            var itemcreate = oToolbar.findItemByValue("createGroup");
            var itemdel = oToolbar.findItemByValue("delete");
            itemcreate.set_enabled(enable);
            itemdel.set_enabled(enable);
        }
    </script>
    <asp:ValidationSummary ID="ValidationSummary1" runat="server" meta:resourcekey="ValidationSummary1Resource1"
        DisplayMode="List" />
    <asp:CustomValidator ID="CustomValidator1" runat="server" Display="None" meta:resourcekey="CustomValidator1Resource1"></asp:CustomValidator>
    <telerik:RadSplitter ID="MainRadSplitter" runat="server" Width="100%" LiveResize="True" Orientation="Horizontal" BorderSize="0" meta:resourcekey="MainRadSplitterResource1" PanesBorderSize="0" SplitBarsSize="">
        <telerik:RadPane ID="TopRadPane" runat="server" Height="35px" Scrolling="None" Index="0" meta:resourcekey="TopRadPaneResource1">
            <telerik:RadToolBar ID="RadToolBar1" runat="server" Width="100%" OnClientButtonClicking="RadToolBar1_Group_ButtonClicking" meta:resourcekey="RadToolBar1Resource1" SingleClick="None">
                <Items>
                    <telerik:RadToolBarButton runat="server" HoveredImageUrl="~/System/icon_images/icon_m05.gif"
                        ImageUrl="~/System/icon_images/icon_m05.gif" Value="createGroup" CheckedImageUrl="~/System/icon_images/icon_m05.gif"
                        Text="新增群組" meta:resourcekey="TBarButtonResource1">
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton runat="server" IsSeparator="True" Value="s1" meta:resourcekey="RadToolBarButtonResource1">
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton runat="server" HoveredImageUrl="~/System/icon_images/icon_m03.gif"
                        ImageUrl="~/System/icon_images/icon_m03.gif" Value="delete" CheckedImageUrl="~/System/icon_images/icon_m03.gif"
                        Text="刪除" meta:resourcekey="TBarButtonResource2">
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton runat="server" IsSeparator="True" Value="s2" meta:resourcekey="RadToolBarButtonResource2">
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton runat="server" HoveredImageUrl="~/Common/Images/Icon/icon_m113.gif"
                        ImageUrl="~/Common/Images/Icon/icon_m113.gif" Value="moveup" CheckedImageUrl="~/Common/Images/Icon/icon_m113.gif"
                        Text="上移" meta:resourcekey="TBarButtonResource3">
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton runat="server" IsSeparator="True" Value="s3" meta:resourcekey="RadToolBarButtonResource3">
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton runat="server" HoveredImageUrl="~/Common/Images/Icon/icon_m114.gif"
                        ImageUrl="~/Common/Images/Icon/icon_m114.gif" Value="movedown" CheckedImageUrl="~/Common/Images/Icon/icon_m114.gif"
                        Text="下移" meta:resourcekey="TBarButtonResource4">
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton runat="server" IsSeparator="True" Value="s4" meta:resourcekey="RadToolBarButtonResource4">
                    </telerik:RadToolBarButton>
                </Items>
            </telerik:RadToolBar>
        </telerik:RadPane>
        <telerik:RadPane ID="TreeRadPane" runat="server" Scrolling="None" Index="1" meta:resourcekey="TreeRadPaneResource1">

            <telerik:RadTreeView ID="RadTreeView1" runat="server" AllowNodeEditing="True" EnableDragAndDrop="True" Height="500px" Width="300px"
                EnableNodeTextHtmlEncoding="true"
                OnClientNodeClicking="ClientNodeClicking" OnClientNodeClicked="ClientNodeClicked"
                OnClientNodeEditing="ClientNodeEditing" OnClientNodeDragStart="ClientNodeDragStart"
                OnClientNodeDropping="ClientNodeDropping" meta:resourcekey="RadTreeView1Resource1">
            </telerik:RadTreeView>
        </telerik:RadPane>
    </telerik:RadSplitter>
    <asp:HiddenField ID="hiddenDropTargetNode" runat="server" />
    <asp:HiddenField ID="hiddenDropSourceNode" runat="server" />
    <asp:HiddenField ID="hiddenNodeId" runat="server" />
    <asp:HiddenField ID="hfIsManagerment" runat="server" />
    <asp:Label ID="lbConfirmDelete" runat="server" Text="確定要刪除?" Visible="False" meta:resourcekey="lbConfirmDeleteResource1"></asp:Label>
    <asp:Label ID="lbNotAllowEmpty" runat="server" Text="群組不允許空白!" Visible="False" meta:resourcekey="lbNotAllowEmptyResource1"></asp:Label>
    <asp:Label ID="lbLengthErr" runat="server" Text="字數不可超過50 !" Visible="False" meta:resourcekey="lbLengthErrResource1"></asp:Label>
    <asp:Label ID="lbDuplicateError" runat="server" Text="名稱重複!" Visible="False" meta:resourcekey="lbDuplicateErrorResource1"></asp:Label>
    <asp:Label ID="lbNeedItemSelected" runat="server" Text="請先選擇節點!" Visible="False" meta:resourcekey="lbNeedItemSelectedResource1"></asp:Label>
    <asp:Label ID="lbNotAllowMove" runat="server" Text="無法搬移 ! 不可移動至子節點下" Visible="False" meta:resourcekey="lbNotAllowMoveResource1"></asp:Label>
    <asp:Label ID="lbNotAllowDelete" runat="server" Text="不可刪除!" Visible="False" meta:resourcekey="lbNotAllowDeleteResource1"></asp:Label>
    <asp:Label ID="lbNotAllowDelete2" runat="server" Text="節點內仍有項目存在, 不可刪除!" Visible="False" meta:resourcekey="lbNotAllowDelete2Resource1"></asp:Label>
</asp:Content>
