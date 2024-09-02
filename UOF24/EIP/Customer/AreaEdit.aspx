<%@ Page Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="EIP_Customer_AreaEdit" Title="維護地區別" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" Codebehind="AreaEdit.aspx.cs" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <script type="text/javascript">

        function treeAddNode(result) {

            var tree = $find("<%= this.areaTree.ClientID %>");
            var node = tree.get_selectedNode();
            if (result != "" && result.indexOf('Error') > -1) {
                alert(result);
                node.set_value(null);
                node.startEdit();
            } else {
                top.returnValue = "dopostback";
                SetToolbarEnable(true);
            }
        }

        function treeDragNode(result) {

            if (result.value == null) {
                alert("server error");
                SetToolbarEnable(true);
            }
            else {
                if (result.value.indexOf('Error') > -1) {
                    alert(result.value);
                    SetToolbarEnable(true);
                }
                else {
                    top.returnValue = "dopostback";
                    window.location = window.location.href;
                }
            }
        }

        function treeRenameNode(result) {

            var tree = $find("<%= this.areaTree.ClientID %>");
            var node = tree.findNodeByValue(result.request.args["nodeId"]);

            if (result.value == null) {
                alert("server error");

                node.set_text(result.request.args["name"]);
                SetToolbarEnable(true);
            }
            else {
                if (result.value.indexOf('Error') > -1) {
                    alert(result.value);
                    node.startEdit();
                }
                else {
                    SetToolbarEnable(true);
                    top.returnValue = "dopostback";
                }
            }
        }

        function treeRemoveNode(result) {
            var tree = $find("<%= this.areaTree.ClientID %>");
            var node = tree.get_selectedNode();

            if (result != "" && result.indexOf('Error') > -1) {
                alert(result.value);
            }
            else {
                if (node.get_parent() != null) {
                    var parent = node.get_parent();
                    parent.select();
                    parent.get_nodes().remove(node);
                }
                top.returnValue = "dopostback";
            }

            SetToolbarEnable(true);
        }

        function SetToolbarEnable(enable) {
            var toolbar = $find("<%= RadToolBar1.ClientID %>");
            toolbar.findItemByValue("AddNew").set_enabled(enable);
            toolbar.findItemByValue("Delete").set_enabled(enable);
        }

        function areaTreeClientNodeDragStart(sender, args) {
            var node = args.get_node();
            if (sender.get_allowNodeEditing()) {
                node.set_allowEdit(false);
            }
        }

        function areaTreeClientNodeDropping(sender, args) {

            var nSource = args.get_sourceNode();
            var nDest = args.get_destNode();

            if (nDest) {
                var tree = nDest.get_treeView();
                var level = nDest.get_level();
                var position = args.get_dropPosition();

                if (level == "0" && (position == "above" || position == "below")) {
                    args.set_cancel(true);
                    return;
                }

                switch (position) {
                    case "over":
                        //check node name repeat
                        for (var i = 0; i < nDest.get_nodes().get_count() ; i++) {
                            var nodeName = nDest.get_nodes().getNode(i).get_text();
                            if (nodeName == nSource.get_text()) {
                                alert('Error:' + '<%=Ede.Uof.Utility.Page.Common.Resource.GetResource("Common", "ErrorNameDuplicate")%>');
                                return;
                            }
                        }
                        nDest.get_nodes().add(nSource);
                        //EIP_Customer_AreaEdit.ChangeAreaParent(nSource.get_value(), nSource.get_text(), nDest.get_value(), nSource.get_value(), nDest.get_value(), treeDragNode);
                        var dropdata = [nSource.get_value(), nSource.get_text(), nDest.get_value(), nSource.get_value(), nDest.get_value()];
                        var result = $uof.pageMethod.sync("ChangeAreaParent", dropdata);
                        if (result == null) {
                            alert("server error");
                            SetToolbarEnable(true);
                        }
                        else {
                            if (result != '' && result.indexOf('Error') > -1) {
                                alert(result);
                                SetToolbarEnable(true);
                            }
                            else {
                                top.returnValue = "dopostback";
                                window.location = window.location.href;
                            }
                        }
                        break;
                }
                tree.commitChanges();
                nDest.set_expanded(true);
            }
        }

        function areaTreeClientNodeClicked(sender, args) {
            var node = args.get_node();
            oldText = node.get_text();
            var tree = node.get_treeView();
            if (tree.get_allowNodeEditing() && !node.get_allowEdit()) {
                node.set_allowEdit(true);
            }
        }

        function areaTreeClientNodeEditing(sender, args) {
            var node = args.get_node();
            var text = args.get_newText();

            if (escape(text) == '%A0' || escape(text) == "") {
                alert('<%=Ede.Uof.Utility.Page.Common.Resource.GetResource("Common","ErrorNotAllowEmpty", Ede.Uof.EIP.SystemInfo.Current.Culture) %>');
                args.set_cancel(true);
                setTimeout(function () { node.startEdit(); }, 100);
            }
            else {
                //如果是新增;
                if (node.get_value() == null || node.get_value() == "") {
                    var guid = $uof.tool.getNewGuid();
                    node.set_value(guid);
                    var parentNode = node.get_parent();
                    var parentGuid = parentNode.get_value();
                    var createdata = [guid, text, parentGuid, node.get_value()];
                    var result = $uof.pageMethod.sync("CreateArea", createdata);
                    if (result == null) {
                        alert("server error");
                        try {
                            if (node) {
                                var parent = node.get_parent();
                                parent.select();
                                parent.get_nodes().remove(node);
                            }
                        } catch (e) {
                        }

                        SetToolbarEnable(true);
                    } else {

                        if (result != "" && result.indexOf('Error') > -1) {
                            alert(result);
                            node.set_value(null);
                            setTimeout(function () { node.startEdit(); }, 100);
                        } else {
                            top.returnValue = "dopostback";
                            SetToolbarEnable(true);
                        }
                    }
                }
                else {
                    var parentNode = node.get_parent();
                    if (node.get_value() == 'Area') {
                        alert('<%=lblEdit.Text %>');
                    args.set_cancel(true);
                }
                else {
                    var parentGuid = parentNode.get_value();
                    var level = node.get_level();
                    var modifydata = [node.get_value(), text, parentGuid, node.get_value()];
                    var result = $uof.pageMethod.sync("ModifyArea", modifydata);
                    if (result == null) {
                        alert("server error");

                        args.set_cancel(true);
                        SetToolbarEnable(true);
                    }
                    else {
                        if (result != "" && result.indexOf('Error') > -1) {

                            alert(result);
                            args.set_cancel(true);
                            setTimeout(function () { node.startEdit(); }, 100);
                        }
                        else {
                            SetToolbarEnable(true);
                            top.returnValue = "dopostback";
                            $uof.dialog.set_returnValue(" ");
                        }
                    }
                }
            }
        }
    }

    function RadToolBar1ButtonClicking(sender, args) {
        var key = args.get_item().get_value();
        var tree = $find("<%= this.areaTree.ClientID %>");
        $uof.dialog.set_returnValue(" ");
            switch (key) {
                case "AddNew":
                    var parent = tree.get_selectedNode();
                    if (parent != null) {
                        SetToolbarEnable(false);
                        var nodeNew = new Telerik.Web.UI.RadTreeNode();
                        nodeNew.set_text("New Area");
                        parent.get_nodes().insert(0, nodeNew);
                        if (parent != tree && !parent.get_expanded()) {
                            parent.set_expanded(true);
                        }
                        nodeNew.startEdit();
                    }
                    else {
                        alert('<%=lbNeedItemSelected.Text %>');
                    }
                    break;
                case "Delete":
                    var node = tree.get_selectedNode();
                    if (node != null && node.get_value() != "Area") {
                        var level = node.get_level();

                        if (confirm('<%=Ede.Uof.Utility.Page.Common.Resource.GetResource("Common","ConfirmDelete", Ede.Uof.EIP.SystemInfo.Current.Culture) %>')) {
                            //LIHUEI 2008/08/11 加入判斷此節點是否已被客戶資料使用,如有客戶使用將無法刪除
                            var checkdata = [node.get_value()];
                            var retValue = $uof.pageMethod.sync("CheckAreaData", checkdata);
                            if (retValue == "false") {
                                SetToolbarEnable(false);
                                var deletedate = [node.get_value(), level, node.get_value()];
                                $uof.pageMethod.async("DeleteArea", deletedate, treeRemoveNode);
                            }
                            else {
                                alert('<%=lblDeleteMsg.Text %>');
                            }
                        }
                    }
                    break;
            }
        }

        function resizeTree(X, Y) {
            var tree = $find("<%=areaTree.ClientID %>");
            tree.get_element().style.height = Y - 35 + "px";
            tree.get_element().style.width = X + "px";
            $("#<%=X.ClientID%>").val(X);
            $("#<%=Y.ClientID%>").val(Y);
        }
    </script>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <asp:ValidationSummary ID="ValidationSummary1" runat="server" />
            <asp:CustomValidator ID="CustomValidator1" runat="server" Display="Dynamic" ErrorMessage="請先選擇一個目錄" meta:resourcekey="CustomValidator1Resource1"></asp:CustomValidator>
            <telerik:RadSplitter ID="MainRadSplitter" runat="server" Width="100%" LiveResize="true" ResizeWithBrowserWindow="true" ResizeWithParentPane="true" Orientation="Horizontal" BorderSize="0">
                <telerik:RadPane ID="TopRadPane" runat="server" Height="35px" Scrolling="None">
                    <telerik:RadToolBar ID="RadToolBar1" runat="server" Width="100%" OnClientButtonClicking="RadToolBar1ButtonClicking">
                        <Items>
                            <telerik:RadToolBarButton runat="server" Text="新增地區別" Value="AddNew"
                                CheckedImageUrl="~/Common/Images/Icon/icon_m47.png"
                                DisabledImageUrl="~/Common/Images/Icon/icon_m47.png"
                                HoveredImageUrl="~/Common/Images/Icon/icon_m47.png"
                                ImageUrl="~/Common/Images/Icon/icon_m47.png"
                                meta:resourcekey="RadToolBarNewResource1">
                            </telerik:RadToolBarButton>
                            <telerik:RadToolBarButton IsSeparator="true"></telerik:RadToolBarButton>
                            <telerik:RadToolBarButton runat="server" Text="刪除地區別" Value="Delete"
                                CheckedImageUrl="~/Common/Images/Icon/icon_m03.png"
                                DisabledImageUrl="~/Common/Images/Icon/icon_m03.png"
                                HoveredImageUrl="~/Common/Images/Icon/icon_m03.png"
                                ImageUrl="~/Common/Images/Icon/icon_m03.png"
                                meta:resourcekey="RadToolBarDeleteResource1">
                            </telerik:RadToolBarButton>
                            <telerik:RadToolBarButton IsSeparator="true"></telerik:RadToolBarButton>
                        </Items>
                    </telerik:RadToolBar>
                </telerik:RadPane>
                <telerik:RadPane ID="TreeRadPane" runat="server" Scrolling="None">
                    <asp:CustomValidator ID="cvMessage" runat="server" BackColor="Red" Display="None" ForeColor="White" Visible="False"></asp:CustomValidator>
                    <telerik:RadTreeView ID="areaTree" runat="server" AllowNodeEditing="true" EnableDragAndDrop="true" Height="100%" Width="100%" EnableNodeTextHtmlEncoding="true"
                        OnClientNodeClicked="areaTreeClientNodeClicked"
                        OnClientNodeEditing="areaTreeClientNodeEditing"
                        OnClientNodeDragStart="areaTreeClientNodeDragStart"
                        OnClientNodeDropping="areaTreeClientNodeDropping">
                    </telerik:RadTreeView>

                    <asp:Label ID="lblArea" runat="server" Text="地區別" Visible="False" meta:resourcekey="lblAreaResource1"></asp:Label>
                    <input id="hiddenDropTargetNode" runat="server" type="hidden" />
                    <input id="hiddenDropSourceNode" runat="server" type="hidden" />
                    <input id="hiddenNodeId" runat="server" type="hidden" />
                    <input id="hideStatus" runat="server" type="hidden" />
                </telerik:RadPane>
            </telerik:RadSplitter>

            <asp:Label ID="lbNeedItemSelected" runat="server" Text="請先選擇節點!" Visible="False" meta:resourcekey="lbNeedItemSelectedResource1"></asp:Label>
            <asp:Label ID="lblDBFail" runat="server" Text="數據操作失敗" Visible="False" meta:resourcekey="lblDBFailResource1"></asp:Label>
            <asp:Label ID="lblEdit" runat="server" Text="根節點不允許修改" Visible="False" meta:resourcekey="lblEditResource1"></asp:Label>
            <asp:Label ID="lblDeleteMsg" runat="server" Text="選取的地區別節點或子節點,已有客戶資料使用,不允許刪除!" Visible="False" meta:resourcekey="lblDeleteMsgResource1"></asp:Label>
            <asp:HiddenField ID="X" runat="server" />
            <asp:HiddenField ID="Y" runat="server" />
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
