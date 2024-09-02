<%@ Page Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="DMS_Admin_FolderMaintain" Title="目錄維護" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" Codebehind="FolderMaintain.aspx.cs" %>

<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <script id="scriptblock1" type="text/javascript">
        var oldText;

        function SetToolbarEnable(enable) {
            var tree = $find("<%= this.treeFolder.ClientID %>");
            var node = tree.get_selectedNode();
            var nodeTag = node.get_value();
            var oToolbar = $find("<%= this.RadFolderToolbar1.ClientID %>");
            var AddNew = oToolbar.findItemByValue("AddNew");
            var Delete = oToolbar.findItemByValue("Delete");
            var Sort = oToolbar.findItemByValue("Sort");
            var Culture = oToolbar.findItemByValue("Culture");
            AddNew.set_enabled(enable);
            Delete.set_enabled(enable);
            Sort.set_enabled(enable);
            Culture.set_enabled(enable);

            if (nodeTag != "DMSRoot") {
                Sort.set_enabled(false);
                Culture.set_enabled(enable);
            }
            else {
                Culture.set_enabled(false);
            }
        }

        //取得權限
        function GetPrivilege(folderID) {
            var userGuid = $('#<%=this.hdUserGuid.ClientID %>').val();
            var data = [folderID, userGuid];
            var result = $uof.pageMethod.sync("GetPrivilege", data);
            try {
                var folderPrivilege;
                folderPrivilege = result;

                var tb = $find("<%= this.RadFolderToolbar1.ClientID %>");
                if (tb == null)
                    return;

                var AddNew = tb.findItemByValue("AddNew");
                var Delete = tb.findItemByValue("Delete");
                var Sort = tb.findItemByValue("Sort");
                var Culture = tb.findItemByValue("Culture");
                switch (folderPrivilege) {
                    case "DMSReader":
                    case "DMSNone":
                    case "DMSAuthor":
                        AddNew.set_enabled(false);
                        Delete.set_enabled(false);
                        Sort.set_enabled(false);
                        Culture.set_enabled(false);
                        break;

                    case "DMSFolderMang":
                        AddNew.set_enabled(true);
                        Delete.set_enabled(true);
                        Sort.set_enabled(false);
                        Culture.set_enabled(true);
                        break;
                    case "DMSAdmin":
                        AddNew.set_enabled(true);
                        Delete.set_enabled(true);
                        Sort.set_enabled(true);
                        Culture.set_enabled(true);
                        break;
                }

                if (folderID != "DMSRoot") {
                    Sort.set_enabled(false);
                }
                else {
                    Culture.set_enabled(false);
                }
            }
            catch (e) {
                alert("error");
            }
        }
    </script>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <asp:CustomValidator ID="CustomValidator1" runat="server" Display="Dynamic" ErrorMessage="請先選擇一個目錄" meta:resourcekey="CustomValidator1Resource1"></asp:CustomValidator>
            <telerik:RadSplitter ID="MasterRdSplitter" runat="server" Width="100%" LiveResize="True" Orientation="Horizontal" BorderSize="0" meta:resourcekey="MasterRdSplitterResource1" PanesBorderSize="0" SplitBarsSize="">
                <telerik:RadPane ID="TopRdPanel" runat="server" Height="35px" Scrolling="None" Index="0" meta:resourcekey="TopRdPanelResource1">
                    <telerik:RadToolBar ID="RadFolderToolbar1" runat="server" Width="100%" OnClientButtonClicking="RadFolderToolbar_Click" meta:resourcekey="barMainResource1"  SingleClick="None" OnButtonClick="RadFolderToolbar1_ButtonClick">
                        <Items>
                            <telerik:RadToolBarButton runat="server" CheckedImageUrl="~/Common/Images/Icon/icon_m121_g.png" DisabledImageUrl="~/Common/Images/Icon/icon_m121_g.png" HoveredImageUrl="~/Common/Images/Icon/icon_m121_g.png" ImageUrl="~/Common/Images/Icon/icon_m121_g.png" Text="新增子目錄" Value="AddNew" meta:resourcekey="TBarButtonResource1">
                            </telerik:RadToolBarButton>
                            <telerik:RadToolBarButton runat="server" IsSeparator="True" Value="sep1" meta:resourcekey="RadToolBarButtonResource2" />
                            <telerik:RadToolBarButton runat="server" CheckedImageUrl="~/Common/Images/Icon/icon_m03_g.png" DisabledImageUrl="~/Common/Images/Icon/icon_m03_g.png" HoveredImageUrl="~/Common/Images/Icon/icon_m03_g.png" ImageUrl="~/Common/Images/Icon/icon_m03_g.png" Text="刪除目錄" Value="Delete" meta:resourcekey="TBarButtonResource2">
                            </telerik:RadToolBarButton>
                            <telerik:RadToolBarButton runat="server" IsSeparator="True" meta:resourcekey="RadToolBarButtonResource3"/>
                            <telerik:RadToolBarButton runat="server"
                                Value="Culture"
                                Text="設定語系"
                                HoveredImageUrl="~/Common/Images/Icon/icon_j01.gif"
                                ImageUrl="~/Common/Images/Icon/icon_j01.gif"
                                CheckedImageUrl="~/Common/Images/Icon/icon_j01.gif"
                                DisabledImageUrl="~/Common/Images/Icon/icon_j01.gif" meta:resourcekey="RadToolBarButtonResource4">
                            </telerik:RadToolBarButton>
                            <telerik:RadToolBarButton runat="server" IsSeparator="True" Value="sep2" meta:resourcekey="RadToolBarButtonResource2" />
                             <telerik:RadToolBarButton runat="server" CheckedImageUrl="~/Common/Images/Icon/icon_m193.png" DisabledImageUrl="~/Common/Images/Icon/icon_m193.png" HoveredImageUrl="~/Common/Images/Icon/icon_m193.png" ImageUrl="~/Common/Images/Icon/icon_m193.png" Text="重新排序" Value="Sort" meta:resourcekey="RadToolBarButtonResource1">
                            </telerik:RadToolBarButton>
                            <telerik:RadToolBarButton runat="server" IsSeparator="True" meta:resourcekey="RadToolBarButtonResource3"/>
                        </Items>
                    </telerik:RadToolBar>
                </telerik:RadPane>
                <telerik:RadPane ID="TreeRdPanel" runat="server" Scrolling="None" Index="1" meta:resourcekey="TreeRdPanelResource1">
                    <telerik:RadTreeView runat="server" ID="treeFolder" AllowNodeEditing="True" EnableDragAndDrop="True" EnableDragAndDropBetweenNodes="True" Height="100%"
                        OnNodeCreated="treeFolder_NodeCreated"
                        OnClientLoad="FolderTreeClientLoad"
                        OnClientNodeClicked="FolderTreeClientNodeClicked"
                        OnClientNodeEditing="FolderTreeClientNodeEditing"
                        OnClientNodeDragStart="FolderTreeClientNodeDragStart"
                        OnClientNodeDropping="FolderTreeClientNodeDropping" EnableNodeTextHtmlEncoding="true" meta:resourcekey="treeFolderResource1">
                    </telerik:RadTreeView>
                </telerik:RadPane>
            </telerik:RadSplitter>
            <asp:Label ID="lblRoot" runat="server" Text="文件庫" Visible="False" meta:resourcekey="lblRootResource1"></asp:Label>
            <asp:Label ID="lblMsg" runat="server" Text="依全部目錄排序，確定要排序?" Visible="False" meta:resourcekey="lblMsgResource1"></asp:Label>
            <asp:HiddenField ID="hiddenDropTargetNode" runat="server" />
            <asp:HiddenField ID="hiddenDropSourceNode" runat="server" />
            <asp:HiddenField ID="hiddenNodeId" runat="server" />
            <asp:HiddenField ID="hideStatus" runat="server" />
            <asp:Label ID="lbNeedItemSelected" runat="server" meta:resourceKey="lbNeedItemSelectedResource1" Text="請先選擇節點!" Visible="False"></asp:Label>
            <asp:Label ID="lblConfirmDelete2" runat="server" meta:resourcekey="lblConfirmDelete2Resource1" Text="此目錄有{0}個子目錄，{1}份文件，確定後會直接銷毀目錄及文件。" Visible="False"></asp:Label>
            <asp:Label ID="lblConfrimVaild" runat="server" Text="此目錄尚有{0}個子目錄，{1}份文件，當目錄下沒有任何文件時，才允許刪除目錄" Visible="False" meta:resourcekey="lblConfrimVaildResource1"></asp:Label>
             <asp:HiddenField ID="hidFolderHasDoc" runat="server" />
            <asp:HiddenField ID="hidSelectNose" runat="server" />
            <asp:HiddenField ID="hidNotShowFolder" runat="server" Value="''" />
            <asp:HiddenField ID="hidNotShowChildFolderID" runat="server" Value="''" />
            <asp:HiddenField ID="hidPrivilege" runat="server" Value="''" />
            <asp:Label ID="lblNoPrivilege" runat="server" meta:resourceKey="lblNoPrivilegeResource1" Text="無目錄維護權限。" Visible="False"></asp:Label>
            <asp:HiddenField ID="hdnNodeSelectedImageURL" runat="server" />
            <asp:HiddenField ID="hdnNodeImageURL" runat="server" />
            <asp:HiddenField ID="hdUserGuid" runat="server" />
        </ContentTemplate>
    </asp:UpdatePanel>

    <telerik:RadScriptBlock runat="server" ID="scriptBlock">
        <script type="text/javascript">
            function resizeTree(X, Y) {
                var tree = $find("<%=treeFolder.ClientID %>");
                        tree.get_element().style.height = Y - 35 + "px";
                        tree.get_element().style.width = X + "px";
                    }
            function RadFolderToolbar_Click(sender, args) {
                //Add code to handle your event here.
                var toolBar = sender;
                var button = args.get_item();
                var tree = $find("<%= this.treeFolder.ClientID %>");

                if (button.get_value() == "AddNew") {

                    var parent = tree.get_selectedNode(); // || tree;
                    if (parent) {
                        SetToolbarEnable(false);

                        //Instantiate a new client node
                        var nodeNew = new Telerik.Web.UI.RadTreeNode();
                        //Set its text
                        nodeNew.set_text("New Department");
                        nodeNew.set_imageUrl($('#<%=this.hdnNodeImageURL.ClientID %>').val());
                        //Add the new node as the child of the selected node or the treeview if no node is selected                
                        parent.get_nodes().insert(parent.get_nodes().get_count(), nodeNew);
                        //Expand the parent if it is not the treeview
                        if (parent != tree && !parent.get_expanded()) {
                            parent.set_expanded(true);
                        }
                        nodeNew.startEdit();
                    } else {
                        alert('<%=lbNeedItemSelected.Text %>');
                    }
                    args.set_cancel(true);
                } else if (button.get_value() == "Delete") {
                    var node = tree.get_selectedNode();
                    if (node != null) {
                        var level = node.get_level();

                        var confirmData = [node.get_value(), '<%=lblConfirmDelete2.Text%>','<%=lblConfrimVaild.Text%>'];                      
                        var strConfirmData =$uof.pageMethod.sync("GetConfirmText", confirmData).split("|");
                        args.set_cancel(true);
                        if (strConfirmData[0].toLowerCase() ==="true") {//目錄底下還有文件，不允許刪除目錄
                           alert(strConfirmData[1]);}
                      else{ 
                             if (confirm(strConfirmData[1])) {
                                SetToolbarEnable(false);
                                var data = [node.get_value(), level, node.get_value()];
                                var result = $uof.pageMethod.sync("DeleteFolder", data);

                                if (result == null) {
                                    alert("server error");
                                }
                                else {
                                    if (result.indexOf('Error') > -1) {
                                        alert(result);
                                    }
                                    else {
                                        if (node.get_parent()) {
                                            var parent = node.get_parent();
                                            parent.select();
                                            parent.get_nodes().remove(node);
                                        }

                                       top.returnValue = "dopostback";
                                    }
                                }

                                SetToolbarEnable(true);
                            }
                        }
                    }                      
                }
                else if (button.get_value() == "Sort") {
                    if (confirm("<%=lblMsg.Text%>")) {
                        var result = $uof.pageMethod.sync("SortFolder", []);
                        top.returnValue = "dopostback";
                    }
                    else {
                        args.set_cancel(true);
                    }
                }
                else if (button.get_value() == "Culture") {
                    var node = tree.get_selectedNode();
                    var nodeTag = node.get_value();
                    args.set_cancel(true);
                    $uof.dialog.open2("~/DMS/Admin/FolderCultureMaintain.aspx", args.get_item(), "", 600, 400, OpenDocDialogResult, { "folderid": nodeTag });
                }
            }

            function OpenDocDialogResult(returnValue) {
                if (typeof (returnValue) == 'undefined' || returnValue == null) {
                    return false;
                }
                else
                    return true;
            }
        function FolderTreeClientLoad(sender, args) {
            var node = sender.get_selectedNode();
            if (node) {
                node.expand();
                try { nodeCurrentSelect = node; } catch (e) { }
                GetPrivilege(node.get_value());
            }
        }

        function FolderTreeClientNodeClicked(sender, args) {
            var node = args.get_node();
            $("#<%=hiddenNodeId.ClientID%>").val(node.get_value());
                GetPrivilege(node.get_value());
                oldText = node.get_text();

                var tree = node.get_treeView();
                if (tree.get_allowNodeEditing() && node.get_allowEdit()) {
                    node.set_allowEdit(true);
                }
            }

            function FolderTreeClientNodeEditing(sender, args) {
                var tree = $find("<%= this.treeFolder.ClientID %>");
                var userGuid = $('#<%=this.hdUserGuid.ClientID %>').val();
                var node = args.get_node();
                var old_text = node.get_text();
                var text = args.get_newText();
                var tree = $find("<%= treeFolder.ClientID %>");
                if (escape(text) == '%A0' || escape(text) == "") {
                    alert('<%=Ede.Uof.Utility.Page.Common.Resource.GetResource("Common","ErrorNotAllowEmpty", Ede.Uof.EIP.SystemInfo.Current.Culture) %>');
                    args.set_cancel(true);
                    setTimeout(function () { node.startEdit(); }, 100);

                } else {
                    //如果是新增;
                    if (node.get_value() == null || node.get_value() == "") {
                        var guid = $uof.tool.getNewGuid();
                        node.set_value(guid);
                        var parentNode = node.get_parent();
                        var parentGuid = parentNode.get_value();
                        var data = [guid, text, parentGuid, "", userGuid];
                        var result = $uof.pageMethod.sync("CreateFolder", data);

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
                            if (result.indexOf('Error') > -1) {
                                alert(result);
                                node.set_value(null);
                                setTimeout(function () { node.startEdit(); }, 100);
                            } else {
                                top.returnValue = "dopostback";
                                SetToolbarEnable(true);
                            }
                        }

                    } else { //重新命名 modify by taylor 2012/11/7 11:52 修改依權限判斷是否能重新命名             
                        var data = [node.get_value(), userGuid];
                        var folderPrivilege = $uof.pageMethod.sync("GetPrivilege", data);
                        switch (folderPrivilege) {
                            case "DMSReader":
                            case "DMSNone":
                            case "DMSAuthor":
                                alert('<%=lblNoPrivilege.Text %>');
                                args.set_cancel(true);
                            break;
                        case "DMSFolderMang":
                        case "DMSAdmin":
                            var modifydata = [node.get_value(), text, node.get_value(), userGuid];
                            var result = $uof.pageMethod.sync("ModifyFolder", modifydata);
                            if (result == null) {
                                alert("server error");
                                args.set_cancel(true);
                                SetToolbarEnable(true);
                            }
                            else {
                                if (result.indexOf('Error') > -1) {
                                    alert(result);
                                    args.set_cancel(true);
                                    setTimeout(function () { node.startEdit(); }, 100);
                                }
                                else {
                                    SetToolbarEnable(true);
                                    top.returnValue = "dopostback";
                                }
                            }
                            break;
                    }
                }
            }
        }

        function FolderTreeClientNodeDragStart(sender, args) {
            var node = args.get_node();
            //when tree editable and start drag, disable node edit
            if (sender.get_allowNodeEditing()) {
                node.set_allowEdit(false);
            }
        }

        function FolderTreeClientNodeDropping(sender, args) {
            var userGuid = $('#<%=this.hdUserGuid.ClientID %>').val();
                var nSource = args.get_sourceNode();
                var nDest = args.get_destNode();
                var aboveindex = nDest.get_parent().get_nodes().indexOf(nDest);
                var belowindex = aboveindex + 1;
                
                if (nDest) {
                    var tree = nDest.get_treeView();
                    var level = nDest.get_level();
                    var position = args.get_dropPosition();

                    //not allow dropping between root
                    if (level == "0" && (position == "above" || position == "below")) {
                        args.set_cancel(true);
                        return;
                    }

                    var tree = $find("<%= treeFolder.ClientID %>");
                    tree.trackChanges();
                    switch (position) {
                        case "over":
                            var sourcedata = [nSource.get_value(), userGuid];
                            var parentdata = [nDest.get_value(), userGuid];
                            var sourceNodePrivilege = $uof.pageMethod.sync("GetPrivilege", sourcedata);;
                            var parentNodePrivilege = $uof.pageMethod.sync("GetPrivilege", parentdata);;
                            if (sourceNodePrivilege == 'DMSFolderMang' || sourceNodePrivilege == 'DMSAdmin') {

                                if (parentNodePrivilege == 'DMSFolderMang' || parentNodePrivilege == 'DMSAdmin') {

                                    for (var i = 0; i < nDest.get_nodes().get_count() ; i++) {
                                        var nodeName = nDest.get_nodes().getNode(i).get_text();
                                        if (nodeName == nSource.get_text()) {
                                            alert('Error:' + '<%=Ede.Uof.Utility.Page.Common.Resource.GetResource("Common", "ErrorNameDuplicate")%>!');
                                            return;
                                        }
                                    }
                                    var data = [nSource.get_value(), nSource.get_text(), nDest.get_value(), nSource.get_value(), nDest.get_value()];
                                    var result = $uof.pageMethod.sync("ChangeFolderParent", data);

                                    if (result == null) {
                                        alert("server error");
                                        args.set_cancel(true);
                                        SetToolbarEnable(true);
                                    }
                                    else {
                                        if (result.indexOf('Error') > -1) {
                                            alert(result);
                                            SetToolbarEnable(true);
                                        }
                                    }
                                    nDest.get_nodes().insert(0, nSource);
                                } else {
                                    alert('<%=lblNoPrivilege.Text %>');
                                }
                            } else {
                                alert('<%=lblNoPrivilege.Text %>');
                            }

                            break;
                        case "above":
                            var parentID;
                            var childID;
                            var insertIndex
                            if (nSource.get_parent().get_value() != nDest.get_parent().get_value()) {
                                if (MoveInsert(nSource, nDest, userGuid)) {
                                    aboveindex = nDest.get_parent().get_nodes().indexOf(nDest) + 1;
                                    insertIndex = nDest.get_parent().get_nodes().indexOf(nDest);
                                    childID = nSource.get_value();
                                    parentID = nDest.get_parent().get_value();
                                }
                                else
                                    return;
                            }
                            else {
                                var sourceIndex = nSource.get_index();
                                insertIndex = nDest.get_index();

                                if (sourceIndex < insertIndex)
                                    insertIndex -= 1;
                                childID = nSource.get_value();
                                parentID = nSource.get_parent().get_value();
                            }

                            var data = [childID, parentID, insertIndex + 1];
                            var result = $uof.pageMethod.sync("ChangePosition", data);
                            if (result == null) {
                                alert("server error");
                                args.set_cancel(true);
                                SetToolbarEnable(true);
                                return;
                            }
                            else {
                                if (result.indexOf('Error') > -1) {
                                    alert(result);
                                    SetToolbarEnable(true);
                                    return;
                                }
                            }
                            
                            nSource.get_parent().get_nodes().remove(nSource);
                            nDest.get_parent().get_nodes().insert(insertIndex, nSource);
                            break;
                        case "below":
                            var parentID;
                            var childID;
                            var insertIndex
                            if (nSource.get_parent().get_value() != nDest.get_parent().get_value()) {
                                if (MoveInsert(nSource, nDest, userGuid)) {
                                    belowindex = nDest.get_parent().get_nodes().indexOf(nDest) + 2;
                                    insertIndex = nDest.get_parent().get_nodes().indexOf(nDest) + 1;
                                    childID = nSource.get_value();
                                    parentID = nDest.get_parent().get_value();
                                }
                                else
                                    return;
                            }
                            else {
                                var sourceIndex = nSource.get_index();
                                insertIndex = nDest.get_index();

                                if (sourceIndex > insertIndex)
                                    insertIndex += 1;
                                childID = nSource.get_value();
                                parentID = nSource.get_parent().get_value();
                            }

                            var data = [childID, parentID, insertIndex + 1];
                            var result = $uof.pageMethod.sync("ChangePosition", data);
                            if (result == null) {
                                alert("server error");
                                args.set_cancel(true);
                                SetToolbarEnable(true);
                                return;
                            }
                            else {
                                if (result.indexOf('Error') > -1) {
                                    alert(result);
                                    SetToolbarEnable(true);
                                    return;
                                }
                            }                            
                            
                            nSource.get_parent().get_nodes().remove(nSource);
                            nDest.get_parent().get_nodes().insert(insertIndex, nSource);
                            break;
                    }
                    tree.commitChanges();
                    nDest.set_expanded(true);
                }
            }

            function InsertNode(destNode) {
                var tree = $find("<%= treeFolder.ClientID %>");
                tree.trackChanges();

                tree.get_nodes().insert(0, destNode);
                tree.commitChanges();
            }

            function insertBefore(destinationNode, sourceNode) {
                var destinationParent = destinationNode.get_parent();
                var index = destinationParent.get_nodes().indexOf(destinationNode);
                destinationParent.get_nodes().insert(index, sourceNode);
            }

            function insertAfter(destinationNode, sourceNode) {
                var destinationParent = destinationNode.get_parent();
                var index = destinationParent.get_nodes().indexOf(destinationNode);
                destinationParent.get_nodes().insert(index + 1, sourceNode);
            }

            function MoveInsert(nSource, nDest, userGuid) {
                
                var childID = nSource.get_value();
                var parentID = nDest.get_parent().get_value();
                var sourcedata = [childID, userGuid];
                var parentdata = [parentID, userGuid];
                var sourceNodePrivilege = $uof.pageMethod.sync("GetPrivilege", sourcedata);
                var parentNodePrivilege = $uof.pageMethod.sync("GetPrivilege", parentdata);
                if (sourceNodePrivilege == 'DMSFolderMang' || sourceNodePrivilege == 'DMSAdmin') {

                    if (parentNodePrivilege == 'DMSFolderMang' || parentNodePrivilege == 'DMSAdmin') {

                        for (var i = 0; i < nDest.get_parent().get_nodes().get_count() ; i++) {
                            var nodeName = nDest.get_parent().get_nodes().getNode(i).get_text();
                            if (nodeName == nSource.get_text()) {
                                alert('Error:' + '<%=Ede.Uof.Utility.Page.Common.Resource.GetResource("Common", "ErrorNameDuplicate")%>!');
                                return;
                            }
                        }
                        var data = [childID, nSource.get_text(), parentID, childID, parentID];
                        var result = $uof.pageMethod.sync("ChangeFolderParent", data);

                        if (result == null) {
                            alert("server error");
                            args.set_cancel(true);
                            SetToolbarEnable(true);
                        }
                        else {
                            if (result.indexOf('Error') > -1) {
                                alert(result);
                                SetToolbarEnable(true);
                            }
                        }
                        nDest.get_nodes().add(nSource);
                        return true;
                    } else {
                        alert('<%=lblNoPrivilege.Text %>');
                        return false;
                    }
                } else {
                    alert('<%=lblNoPrivilege.Text %>');
                    return false;
                }
            }
        </script>
    </telerik:RadScriptBlock>
</asp:Content>

