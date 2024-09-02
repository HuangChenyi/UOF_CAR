<%@ Page Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="System_Organization_Member_ClassManage"
    Title="" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" Codebehind="ClassManage.aspx.cs" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <script type="text/javascript">
<!--

        function resizeClassTree(X, Y) {
            var tree = $find("<%=RadTreeViewMembClass.ClientID %>");
            tree.get_element().style.height = Y - 35 + "px";
            tree.get_element().style.width = X + "px";
        }

    function ReplaceAll(strOrg, strFind, strReplace) {
        var index = 0;
        while (strOrg.indexOf(strFind, index) != -1) {
            strOrg = strOrg.replace(strFind, strReplace);
            index = strOrg.indexOf(strFind, index);
        }

        return strOrg;
    }
    function RadToolBar1_Class_ButtonClicking(sender, args) {
        //Add code to handle your event here.
        args.set_cancel(true);
        var tree = $find('<%=RadTreeViewMembClass.ClientID %>');
        var Key = args.get_item().get_value()
            if (Key == "Create") {
                SetToolbarEnable(false);
                var node = new Telerik.Web.UI.RadTreeNode();
                node.set_text('New Class');
                node.set_imageUrl("<%=Request.ApplicationPath %>" + "/Common/Images/Icon/icon_m21.png");
                tree.get_nodes().add(node);
                node.set_selected(true);
                node.scrollIntoView();
                node.startEdit();
            }
            else if (Key == "AddTag") {
                if (tree.get_selectedNode() == null) {
                    return;
                }
                if (tree.get_selectedNode().get_level() > 0) {
                    return;
                }
                
                SetToolbarEnable(false);
                var node = new Telerik.Web.UI.RadTreeNode();
                node.set_text('New Class');
                node.set_imageUrl("<%=Request.ApplicationPath %>" + "/Common/Images/Icon/icon_m138.png");
                tree.get_selectedNode().get_nodes().add(node);
                tree.get_selectedNode().expand();
                node.set_selected(true);
                node.scrollIntoView();
                node.startEdit();
            }
            else if (Key == "Delete") {
                var node = tree.get_selectedNode();
                if (node) {
                    var guid = node.get_value();
                    if (guid == 'DefaultClass') {
                        alert('<%=lblmsgCantDel.Text%>');
                        return;
                    }
                    if (confirm('<%=msgDelconfirm.Text %>')) {
                        SetToolbarEnable(false);

                        var deletedata = [guid];
                        var result = $uof.pageMethod.sync("DeleteClass", deletedata);

                        if (alertError(result) == 2) {
                            if (node.get_level() == 0) {
                                tree.get_nodes().remove(node);
                                tree.get_nodes().getNode(0).set_selected(true);
                            }
                            else {
                                var parentnode = node.get_parent();
                                parentnode.get_nodes().remove(node);
                                parentnode.set_selected(true);
                            }
                        }

                        checkNodePostion(tree.get_selectedNode());
                        SetToolbarEnable(true);
                    }
                }
            }
            else if (Key == "MoveUp") {
                var sourceNode = tree.get_selectedNode();
                var effectNode = sourceNode.get_previousNode();
                var positionType = Key;

                var changedata = [sourceNode.get_value(), effectNode.get_value(), positionType];
                var result = $uof.pageMethod.sync("ChangeMemClassPostion", changedata);
                if (result == null) {
                    AlertError("server error");
                    SetToolbarEnable(true);
                }
                else {
                    if (result.indexOf('Error') > -1) {
                        AlertError(result);
                        SetToolbarEnable(true);
                    }
                    else {                        
                        window.location = "<%=Request.Path %>?focusNode=" + result;
                    }
                }
            }
            else if (Key == "MoveDown") {
                var sourceNode = tree.get_selectedNode();
                var effectNode = sourceNode.get_nextNode();
                var positionType = Key;

                var changedata = [sourceNode.get_value(), effectNode.get_value(), positionType];
                var result = $uof.pageMethod.sync("ChangeMemClassPostion", changedata);
                if (result == null) {
                    AlertError("server error");
                    SetToolbarEnable(true);
                }
                else {
                    if (result.indexOf('Error') > -1) {
                        AlertError(result);
                        SetToolbarEnable(true);
                    }
                    else {
                        window.location = "<%=Request.Path %>?focusNode=" + result;
                    }
                }
            }

            checkNodePostion(tree.get_selectedNode());
            setToolBarAfterEdit();
        }

        function ClientNodeEditing(sender, eventArgs) {
            var node = eventArgs.get_node();
            var text = eventArgs.get_newText();
            var oldtext = node.get_text();

            var guid = node.get_value();

            if (escape(text) == '%A0' || escape(text) == "") {
                alert('<%=Ede.Uof.Utility.Page.Common.Resource.GetResource("Common","ErrorNotAllowEmpty", Ede.Uof.EIP.SystemInfo.Current.Culture) %>');
                eventArgs.set_cancel(true);
                setTimeout(function () { node.startEdit(); }, 100);
                return;
            }

            if (guid == null || guid == "") {//新增
                var guid = $uof.tool.getNewGuid();
                node.set_value(guid);
                var parentNode = node.get_parent();
                var parentNodeId = "";
                try {
                    parentNodeId = parentNode.get_value();
                }
                catch (ex) { };

                var createdata = [text, guid, oldtext, parentNodeId];
                var result = $uof.pageMethod.sync("CreateClass", createdata);

                var flag = alertError(result);
                if (flag == 0) {
                    node.get_parent().get_nodes().remove(node);
                }
                else if (flag == 1) {
                    node.set_value(null);
                    node.set_text(oldtext);
                    eventArgs.set_cancel(true);
                    setTimeout(function () { node.startEdit(); }, 100);
                }
                else if (flag == 2) {
                    node.set_value(result);
                    //        top.returnValue="";
                }

                SetToolbarEnable(true);

            }
            else {//修改
                var changedata = [guid, text, oldtext];
                var result = $uof.pageMethod.sync("ModifyClassName", changedata);
                var flag = alertError(result);

                if (flag == 0) {
                    node.set_text(oldtext);
                    eventArgs.set_cancel(true);
                    setTimeout(function () { node.startEdit(); }, 100);
                }
                else if (flag == 1) {
                    node.set_text(oldtext);
                    eventArgs.set_cancel(true);
                    setTimeout(function () { node.startEdit(); }, 100);
                }
                else if (flag == 2) {
                    //        top.returnValue="";
                }
                SetToolbarEnable(true);
            }
            setToolBarAfterEdit();
        }

        function setToolBarAfterEdit() {            
            var tree = $find('<%=RadTreeViewMembClass.ClientID %>');
            var node = tree.get_selectedNode();
            var oToolbar = $find("<%=RadToolBar1.ClientID %>");            
            var itemAddTag = oToolbar.findItemByValue("AddTag");
            if (tree.get_selectedNode() != null && tree.get_selectedNode().get_level() == 0) {                
                itemAddTag.set_enabled(true);
            }
            else if (tree.get_selectedNode() != null && tree.get_selectedNode().get_level() == 1) {                
                itemAddTag.set_enabled(false);
            }
            else {
                itemAddTag.set_enabled(false);
            }
        }

        function ClientNodeClicked(sender, args) {
            var node = args.get_node();
            checkNodePostion(node);
            setToolBarAfterEdit();
        }

        function membTreeClientNodeDragStart(sender, args) {
            var node = args.get_node();
            if (sender.get_allowNodeEditing()) {
                node.set_allowEdit(false);
            }            
        }

        function membTreeClientNodeDropping(sender, args) {
            var nSource = args.get_sourceNode();//被移動的node
            var nDest = args.get_destNode();//要移到的目標node
            //沒有目標node || 目標node不是類別 || 被移動的node是類別 || 移到原本所屬的類別
            if (nDest == null || nDest.get_level() != 0 || nSource.get_level() == 0 || nSource.get_parent().get_value() == nDest.get_value()) {
                args.set_cancel(true);
            }
            else {
                if (nDest == null) {
                    $("#<%=hidDropTargetNode.ClientID %>").val('null');
                }
                else if (nDest.get_value() == null) {
                    $("#<%=hidDropTargetNode.ClientID %>").val('');
                }
                else {
                    $("#<%=hidDropTargetNode.ClientID %>").val(nDest.get_value());
                }
                $("#<%=hidDropSourceNode.ClientID %>").val(nSource.get_value());

                var changedata = [$("#<%=hidDropTargetNode.ClientID %>").val(), $("#<%=hidDropSourceNode.ClientID %>").val()];
                var result = $uof.pageMethod.sync("MoveMembClass", changedata);

                if (result == null) {
                    alert("server error");
                }
                else {
                    if (result.indexOf('Error') > -1) {
                        alertError(result);
                    }
                    else {
                        window.location = "<%=Request.Path %>?focusNode=" + result;                        
                    }
                }
            }
        }        

        Sys.Application.add_load(function () {
            var tree = $find("<%= RadTreeViewMembClass.ClientID %>");
            var selectedNode = tree.get_selectedNode();
            if (selectedNode != null) {
                window.setTimeout(function () { selectedNode.scrollIntoView(); }, 200);
            }
            checkNodePostion(selectedNode);
            setToolBarAfterEdit();
        });

        function checkNodePostion(treeNode) {            
            if (treeNode != null) {
                var oToolbar = $find("<%=RadToolBar1.ClientID %>");
                var itemdown = oToolbar.findItemByValue("MoveDown");
                var itemup = oToolbar.findItemByValue("MoveUp");

                itemdown.set_enabled((treeNode.get_nextNode() != null));
                itemup.set_enabled((treeNode.get_previousNode() != null));
            }
        }

        function SetToolbarEnable(enable) {
            var oToolbar = $find("<%=RadToolBar1.ClientID %>");
            var itemcreate = oToolbar.findItemByValue("Create");
            var itemAddTag = oToolbar.findItemByValue("AddTag");
            var itemdel = oToolbar.findItemByValue("Delete");
            itemcreate.set_enabled(enable);
            itemAddTag.set_enabled(enable);
            itemdel.set_enabled(enable);
        } // end SetToolbarEnable

        function alertError(result) {
            if (result == null) {
                alert('server error');
                return 0;
            }
            else if (result.indexOf('ServerError') > -1) {
                alert(result);
                return 0;
            }
            else if (result.indexOf('Error') > -1) {
                alert(result);
                return 1;
            }
            else {
                return 2;
            }
        } // end alertError


        // -->
    </script>

<asp:UpdatePanel ID="UpdatePanel2" runat="server">
    <ContentTemplate>
    <telerik:RadSplitter ID="MainRadSplitter" runat="server" Width="100%" LiveResize="true" ResizeWithBrowserWindow="true" ResizeWithParentPane="true" Orientation="Horizontal" BorderSize="0">
        <telerik:RadPane ID="TopRadPane" runat="server" Height="35px" Scrolling="None">
            <telerik:RadToolBar ID="RadToolBar1" runat="server" Width="100%" OnClientButtonClicking="RadToolBar1_Class_ButtonClicking">
                <Items>
                    <telerik:RadToolBarButton runat="server" Value="Create" Text="新增類別" HoveredImageUrl="~/Common/Images/Icon/icon_m21.png"
                        ImageUrl="~/Common/Images/Icon/icon_m21.png" CheckedImageUrl="~/Common/Images/Icon/icon_m21.png"
                        meta:resourcekey="TBarButtonResource1">
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton runat="server" IsSeparator="True" Value="s1">
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton runat="server" Value="AddTag" Text="新增標籤" HoveredImageUrl="~/Common/Images/Icon/icon_m138.png"
                        ImageUrl="~/Common/Images/Icon/icon_m138.png" CheckedImageUrl="~/Common/Images/Icon/icon_m138.png"
                        meta:resourcekey="TBarButtonResource3">
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton runat="server" IsSeparator="True" Value="s3">
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton runat="server" Value="Delete" Text="刪除" HoveredImageUrl="~/Common/Images/Icon/icon_m03.gif"
                        ImageUrl="~/Common/Images/Icon/icon_m03.gif" CheckedImageUrl="~/Common/Images/Icon/icon_m03.gif"
                        meta:resourcekey="TBarButtonResource2">
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton runat="server" IsSeparator="True" Value="s2">
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton runat="server" Value="MoveUp" Text="上移" HoveredImageUrl="~/Common/Images/Icon/icon_m113.gif"
                        ImageUrl="~/Common/Images/Icon/icon_m113.gif" CheckedImageUrl="~/Common/Images/Icon/icon_m113.gif"
                        meta:resourcekey="TBarButtonResource4">
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton runat="server" IsSeparator="True" Value="s4">
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton runat="server" Value="MoveDown" Text="下移" HoveredImageUrl="~/Common/Images/Icon/icon_m114.gif"
                        ImageUrl="~/Common/Images/Icon/icon_m114.gif" CheckedImageUrl="~/Common/Images/Icon/icon_m114.gif"
                        meta:resourcekey="TBarButtonResource5">
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton runat="server" IsSeparator="True" Value="s5">
                    </telerik:RadToolBarButton>
                </Items>
            </telerik:RadToolBar>
        </telerik:RadPane>
        <telerik:RadPane ID="TreeRadPane" runat="server" Scrolling="None">
            <telerik:RadTreeView ID="RadTreeViewMembClass" runat="server" AllowNodeEditing="true" EnableDragAndDrop="True"
                OnClientNodeEditing="ClientNodeEditing"
                OnClientNodeClicked="ClientNodeClicked"
                OnClientNodeDragStart="membTreeClientNodeDragStart"
                OnClientNodeDropping="membTreeClientNodeDropping"
                EnableNodeTextHtmlEncoding="true"
                Height="400px">
            </telerik:RadTreeView>
        </telerik:RadPane>
    </telerik:RadSplitter>
        <asp:HiddenField ID="hidDropTargetNode" runat="server" />
        <asp:HiddenField ID="hidDropSourceNode" runat="server" />
    </ContentTemplate>
</asp:UpdatePanel>

    <asp:Label ID="msgDelconfirm" runat="server" Text="確定要刪除？" Visible="False" meta:resourcekey="msgDelconfirmResource1"></asp:Label>
    <asp:Label ID="lblmsgCantDel" runat="server" Text="不可刪除" Visible="False" meta:resourcekey="lblmsgCantDelResource1"></asp:Label>    
</asp:Content>
