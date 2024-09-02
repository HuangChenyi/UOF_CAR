<%@ Page Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="EIP_Personal_Briefcase_ManageFolder" Title="目錄設定" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" Codebehind="ManageFolder.aspx.cs" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <script id="Folderjs" type="text/javascript">
        function ReplaceAll(strOrg, strFind, strReplace) {
            var index = 0;
            while (strOrg.indexOf(strFind, index) != -1) {
                strOrg = strOrg.replace(strFind, strReplace);
                index = strOrg.indexOf(strFind, index);
            }

            return strOrg;
        }

        function SetToolbarEnable(enable) {
            var toolbar = $find("<%=RadToolBar1.ClientID %>");

            toolbar.findItemByValue("create").set_enabled(enable);
            toolbar.findItemByValue("delete").set_enabled(enable);
        }// end SetToolbarEnable

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
        }// end alertError

        function treeDropNode(result) {
            if (alertError(result) == 2) {
                top.returnValue = "";
                window.location = window.location.href;
            }
        }

        function treeRemoveNode(result) {
            var tree = $find("<%= this.folderTree.ClientID %>");
            var node = tree.get_selectedNode();
            if (alertError(result) == 2) {
                node.get_parent().get_nodes().remove(node);
                top.returnValue = "";
            }
            SetToolbarEnable(true);
        }

        function treeAddNode(result) {

            var tree = $find("<%= this.folderTree.ClientID %>");
            var node = tree.findNodeByValue(result.request.args["nodeID"]);
            var flag = alertError(result);

            if (flag == 0) {
                node.remove();
            }
            else if (flag == 1) {
                node.set_value(null);
                setTimeout(function () { node.startEdit(); }, 100);
            }
            else if (flag == 2) {
                node.set_value(result.value);
                top.returnValue = "";
            }

            SetToolbarEnable(true);
        }

        function treeRenameNode(result) {
            var tree = $find("<%= this.folderTree.ClientID %>");
            var node = tree.findNodeByValue(result.request.args["nodeID"]);

            var flag = alertError(result);
            if (flag == 0) {
                node.set_text(result.request.args["folderName"]);
                setTimeout(function () { node.startEdit(); }, 100);
            }
            else if (flag == 1) {
                args.set_cancel(true);
            }
            else if (flag == 2) {
                top.returnValue = "";
            }
            SetToolbarEnable(true);
        }

        function RadToolBarButtonClicking(sender, args) {
            args.set_cancel(true);
            var tree = $find("<%= this.folderTree.ClientID %>");
            if (args.get_item().get_value() == "create") {
                var parent = tree.get_selectedNode();
                if (parent != null) {
                    SetToolbarEnable(false);
                    var nodeNew = new Telerik.Web.UI.RadTreeNode();
                    nodeNew.set_text("New Folder");
                    nodeNew.set_imageUrl("<%=Request.ApplicationPath %>" + "/Common/Images/Icon/icon_m14.gif");
                    tree.trackChanges();
                    parent.get_nodes().insert(0, nodeNew);
                    if (parent != tree && !parent.get_expanded()) {
                        parent.set_expanded(true);
                    }
                    nodeNew.startEdit();
                    tree.commitChanges();

                    $uof.dialog.set_returnValue("NeedPostBack");
                }
            }
            if (args.get_item().get_value() == "delete") {
                var node = tree.get_selectedNode();
                if (node != null) {
                    if (confirm('<%=msgDelconfirm.Text %>')) {
                        SetToolbarEnable(false);
                        var deletedata = [node.get_value(), node.get_value()];
                        var result = $uof.pageMethod.sync("DeleteFolder", deletedata);

                        if (alertError(result) == 2) {
                            node.get_parent().get_nodes().remove(node);
                            top.returnValue = "";
                        }
                        SetToolbarEnable(true);

                        $uof.dialog.set_returnValue("NeedPostBack");
                    }
                    else { args.set_cancel(true); }
                }
            }
        }
        function folderTreeClientNodeDragStart(sender, args) {
            var node = args.get_node();
            if (sender.get_allowNodeEditing()) {
                node.set_allowEdit(false);
            }
        }
        function folderTreeClientNodeClicked(sender, args) {
            var node = args.get_node();
            var toolbar = $find("<%=RadToolBar1.ClientID %>");
            oldText = node.get_text();

            var tree = node.get_treeView();
            if (tree.get_allowNodeEditing() && !node.get_allowEdit()) {
                node.set_allowEdit(true);
            }
            if (node.get_value() == 'mybriefcase')
                toolbar.findItemByValue("delete").set_enabled(false);
            else
                toolbar.findItemByValue("delete").set_enabled(true);
        }
        function folderTreeClientNodeEditing(sender, args) {
            var userGuid = $('#<%=this.hdUserGuid.ClientID %>').val();
            var node = args.get_node();
            var text = args.get_newText();
            var level = node.get_level();
            var tree = $find("<%= this.folderTree.ClientID %>");

            if (escape(text) == '%A0' || escape(text) == "") {
                alert('<%=Ede.Uof.Utility.Page.Common.Resource.GetResource("Common","ErrorNotAllowEmpty") %>!');
                args.set_cancel(true);
                setTimeout(function () { node.startEdit(); }, 100);
            }
            else {
                if (node.get_value() == null || node.get_value() == "") {
                    var guid = $uof.tool.getNewGuid();
                    node.set_value(guid);
                    var parentNode = node.get_parent();
                    var parentGuid = parentNode.get_value();

                    if (parentNode.get_level() == 0) {
                        parentGuid = "";
                    }
                    var createdata = [parentGuid, text, node.get_value(), userGuid];
                    var result = $uof.pageMethod.sync("CreateFolder", createdata);

                    var flag = alertError(result);
                    if (flag == 0) {
                        tree.get_nodes().remove(node);
                    }
                    else if (flag == 1) {
                        node.set_value(null);
                        args.set_cancel(true);
                        setTimeout(function () { node.startEdit(); }, 100);
                    }
                    else if (flag == 2) {
                        node.set_value(result);
                        top.returnValue = "";
                    }

                    SetToolbarEnable(true);
                }
                else {
                    if (node.get_value() == 'mybriefcase') {
                        alert('<%=CustomValidator2.ErrorMessage %>')
	                    args.set_cancel(true);
	                }
	                else {
	                    var changedata = [node.get_value(), text, node.get_value(), userGuid];
	                    var result = $uof.pageMethod.sync("ChangeFolderName", changedata);
	                    var flag = alertError(result);
	                    if (flag == 0) {
	                        node.set_text(text);
	                        args.set_cancel(true);
	                    }
	                    else if (flag == 1) {
	                        args.set_cancel(true);
	                        setTimeout(function () { node.startEdit(); }, 100);
	                    }
	                    else if (flag == 2) {
	                        $uof.dialog.set_returnValue("NeedPostBack");
	                        top.returnValue = "";

	                    }
	                    SetToolbarEnable(true);
	                }
                }
            }
        }

        function folderTreeClientNodeDropping(sender, args) {

            var nSource = args.get_sourceNode();
            var nDest = args.get_destNode();
            var userGuid = $('#<%=this.hdUserGuid.ClientID %>').val();
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
                                alert('Error:' + '<%=Ede.Uof.Utility.Page.Common.Resource.GetResource("Common", "ErrorNameDuplicate")%>!');
                                return;
                            }
                        }
                        nDest.get_nodes().add(nSource);
                        var changedata = [nSource.get_value(), nDest.get_value(), nSource.get_value(), nDest.get_value(), userGuid];
                        var result = $uof.pageMethod.sync("ChangeParent", changedata);
                        if (alertError(result) == 2) {
                            top.returnValue = "";
                            window.location = window.location.href;
                        }
                        break;
                }
                tree.commitChanges();
                nDest.set_expanded(true);
            }
        }
        function resizeTree(X, Y) {
            var tree = $find("<%=folderTree.ClientID %>");
            tree.get_element().style.height = Y - 35 + "px";
            tree.get_element().style.width = X + "px";
        }
    </script>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <asp:ValidationSummary ID="ValidationSummary1" runat="server" meta:resourcekey="ValidationSummary1Resource1" BackColor="Red" ForeColor="White" />
            <asp:CustomValidator ID="CustomValidator1" runat="server" Display="None" ErrorMessage="目錄名稱已經存在" ForeColor="Red" meta:resourcekey="CustomValidator1Resource1"></asp:CustomValidator>
            <asp:CustomValidator ID="CustomValidator2" runat="server" Display="None" ErrorMessage="我的公事包不允許更名!" ForeColor="Red" meta:resourcekey="CustomValidator2Resource1"></asp:CustomValidator>
            <asp:CustomValidator ID="CustomValidator3" runat="server" Display="None" ErrorMessage="目錄名稱不允許空白" ForeColor="Red" meta:resourcekey="CustomValidator3Resource1"></asp:CustomValidator>
            <asp:CustomValidator ID="CustomValidator4" runat="server" Display="None" ErrorMessage="無法更名 ! 已有相同目錄名存在" ForeColor="Red" meta:resourcekey="CustomValidator4Resource1"></asp:CustomValidator>
            <asp:CustomValidator ID="CustomValidator5" runat="server" Display="None" ErrorMessage="請先選擇任一目錄" ForeColor="Red" meta:resourcekey="CustomValidator5Resource1"></asp:CustomValidator>
            <asp:CustomValidator ID="CustomValidator6" runat="server" Display="None" ErrorMessage="已有相同目錄名存在" ForeColor="Red" meta:resourcekey="CustomValidator6Resource1"></asp:CustomValidator>
            <asp:CustomValidator ID="CustomValidator7" runat="server" Display="None" ErrorMessage="我的公事包不可刪除" ForeColor="Red" meta:resourcekey="CustomValidator7Resource1"></asp:CustomValidator>
            <asp:CustomValidator ID="CustomValidator8" runat="server" Display="None" ErrorMessage="無法刪除" ForeColor="Red" meta:resourcekey="CustomValidator8Resource1"></asp:CustomValidator>
            <asp:CustomValidator ID="CustomValidator9" runat="server" Display="None" ErrorMessage="目錄名稱太長" ForeColor="Red" meta:resourcekey="CustomValidator9Resource1"></asp:CustomValidator>
            <telerik:RadSplitter ID="MasterRdSplitter" runat="server" Width="100%" LiveResize="true" ResizeWithBrowserWindow="true" ResizeWithParentPane="true" Orientation="Horizontal" BorderSize="0">
                <telerik:RadPane ID="TopRdPanel" runat="server" Height="35px" Scrolling="None">
                    <telerik:RadToolBar ID="RadToolBar1" runat="server" Width="100%" OnClientButtonClicking="RadToolBarButtonClicking" OnButtonClick="RadToolBar1_ButtonClick" meta:resourcekey="RadToolBar1Resource1">
                        <Items>
                            <telerik:RadToolBarButton runat="server" Text="新增目錄" Value="create"
                                ClickedImageUrl="~/EIP/Personal/icon_images/icon_m14.gif" DisabledImageUrl="~/EIP/Personal/icon_images/icon_m14.gif"
                                HoveredImageUrl="~/EIP/Personal/icon_images/icon_m14.gif" ImageUrl="~/EIP/Personal/icon_images/icon_m14.gif" meta:resourcekey="RadToolBarButtonResource1">
                            </telerik:RadToolBarButton>
                            <telerik:RadToolBarButton runat="server" Text="" IsSeparator="true" meta:resourcekey="RadToolBarButtonResource2">
                            </telerik:RadToolBarButton>
                            <telerik:RadToolBarButton runat="server" Text="刪除目錄" Value="delete"
                                ClickedImageUrl="~/EIP/Personal/icon_images/icon_m03.gif" DisabledImageUrl="~/EIP/Personal/icon_images/icon_m03.gif"
                                HoveredImageUrl="~/EIP/Personal/icon_images/icon_m03.gif" ImageUrl="~/EIP/Personal/icon_images/icon_m03.gif" meta:resourcekey="RadToolBarButtonResource3">
                            </telerik:RadToolBarButton>
                            <telerik:RadToolBarButton runat="server" Text="" IsSeparator="true" meta:resourcekey="RadToolBarButtonResource4">
                            </telerik:RadToolBarButton>
                        </Items>
                    </telerik:RadToolBar>
                </telerik:RadPane>
                <telerik:RadPane ID="TreeRdPanel" runat="server" Scrolling="None">
                    <telerik:RadTreeView ID="folderTree" runat="server" AllowNodeEditing="true" EnableDragAndDrop="true" Height="500px" EnableNodeTextHtmlEncoding="true" 
                        OnClientNodeClicked="folderTreeClientNodeClicked"
                        OnClientNodeEditing="folderTreeClientNodeEditing"
                        OnClientNodeDragStart="folderTreeClientNodeDragStart"
                        OnClientNodeDropping="folderTreeClientNodeDropping">
                    </telerik:RadTreeView>
                </telerik:RadPane>
            </telerik:RadSplitter>
            <asp:HiddenField ID="hiddenDropTargetNode" runat="server" />
            <asp:HiddenField ID="hiddenDropSourceNode" runat="server" />
            <asp:HiddenField ID="hiddenNodeId" runat="server" />
            <asp:HiddenField ID="hideStatus" runat="server" />
         
            <asp:Label ID="msgDelconfirm" runat="server" Text="確定要刪除?" Visible="False" meta:resourcekey="msgDelconfirmResource1"></asp:Label>
            <asp:Label ID="msgMybriefcase" runat="server" Text="我的公事包" Visible="False" meta:resourcekey="msgMybriefcaseResource1"></asp:Label>

            <asp:HiddenField ID="hdUserGuid" runat="server" />
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
