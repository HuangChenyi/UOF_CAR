<%@ Page Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="DMS_Admin_ClassMaintain" Title="類別維護" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" CodeBehind="ClassMaintain.aspx.cs" %>

<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <script id="ClassMaintainjs" type="text/javascript">

        function SetToolbarEnable(enable) {
            var tree = $find("<%= this.treeClass.ClientID %>");
            var node = tree.get_selectedNode();           
            var oToolbar = $find("<%= this.RadFolderToolbar1.ClientID %>");
            var AddNew = oToolbar.findItemByValue("AddNew");
            var Delete = oToolbar.findItemByValue("Delete");
            var Culture = oToolbar.findItemByValue("Culture");               
            AddNew.set_enabled(enable);
            Delete.set_enabled(enable); 
           if(node!=null){           
                var nodeTag = node.get_value();  
                if (nodeTag != "DMSClass") {
                    Culture.set_enabled(true);
                }
                else {
                    Culture.set_enabled(false);
                }
           }          
        }
    </script>

    <telerik:RadScriptBlock runat="server" ID="scriptBlock">
        <script type="text/javascript">
            // <![CDATA[
            function RadFolderToolbar1_Click(sender, args) {
                var toolBar = sender;
                var button = args.get_item();
                var tree = $find("<%= this.treeClass.ClientID %>");
                //Add code to handle your event here.
                if (button.get_value() == "AddNew") {
                    var parent = tree.get_selectedNode(); // || tree;
                    if (parent) {
                        SetToolbarEnable(false);

                        //Instantiate a new client node
                        var nodeNew = new Telerik.Web.UI.RadTreeNode();
                        //Set its text
                        nodeNew.set_text("New Class");
                        nodeNew.set_imageUrl($('#<%=this.hdnNodeImageURL.ClientID %>').val());
                        //Add the new node as the child of the selected node or the treeview if no node is selected           
                        parent.get_nodes().insert(0, nodeNew);
                        //Expand the parent if it is not the treeview
                        if (parent != tree && !parent.get_expanded()) {
                            parent.set_expanded(true);
                        }
                        nodeNew.startEdit();
                    } else {
                        alert('<%=lbNeedItemSelected.Text %>');
                    }
                    args.set_cancel(true);
                }
                else if (button.get_value() == "Delete") {
                    var node = tree.get_selectedNode();
                    if (node != null) {

                        var level = node.get_level();

                        if (confirm('<%=Ede.Uof.Utility.Page.Common.Resource.GetResource("Common","ConfirmDelete", Ede.Uof.EIP.SystemInfo.Current.Culture) %>')) {
                            SetToolbarEnable(false);

                            var data = [node.get_value(), level];
                            var result = $uof.pageMethod.sync("DeleteClass", data);
                           
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
                            args.set_cancel(true);                          
                        }
                    }
                    args.set_cancel(true);
                } 
                else if (button.get_value() == "Culture") {
                    var node = tree.get_selectedNode();
                    var nodeTag = node.get_value();
                    args.set_cancel(true);
                    $uof.dialog.open2("~/DMS/Admin/ClassCultureMaintain.aspx", args.get_item(), "", 600, 400, OpenDocDialogResult, { "classid": nodeTag });
                }
        }

        function ClassTreeClientNodeClicked(sender, args) {
            var node = args.get_node();
            $("#<%=hiddenNodeId.ClientID%>").val(node.get_value());
            oldText = node.get_text();
            var tree = node.get_treeView();
            if (tree.get_allowNodeEditing() && !node.get_allowEdit() && node.get_value() != "DMSClass" ) {
                node.set_allowEdit(true);
            }
           
            SetToolbarEnable(true);
            var oToolbar = $find("<%= this.RadFolderToolbar1.ClientID %>");
            var Culture = oToolbar.findItemByValue("Culture");
            if (node.get_value() != "DMSClass") {
                Culture.set_enabled(true);
            }
            else {
                Culture.set_enabled(false);
            }
        }          
        function ClassTreeClientNodeEditing(sender, args) {
            var userGuid = $('#<%=this.hdUserGuid.ClientID %>').val();
            var tree = $find("<%= this.treeClass.ClientID %>");
            var node = args.get_node();
            var old_text = node.get_text();
            var text = args.get_newText();

             if (node.get_value() == "DMSClass")
             {
                 return;
             }


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
                        var data = [guid, text, parentGuid, userGuid];
                        var result = $uof.pageMethod.sync("CreateClass", data);
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
                                setTimeout(function () { SetToolbarEnable(true); }, 300);
                            }
                        }
                    }
                    else {
                        var data = [node.get_value(), text];
                        var result = $uof.pageMethod.sync("ModifyClass", data);
                        if (result == null) {
                            alert("server error");
                            args.set_cancel(true);
                            SetToolbarEnable(true);
                        }
                        else {
                            if (result.indexOf('Error') > -1) {
                                alert(result);
                                setTimeout(function () { node.startEdit(); }, 100);
                            }
                            else {
                                SetToolbarEnable(true);
                                top.returnValue = "dopostback";
                            }
                        }

                    }
                }
            }

            function ClassTreeClientNodeDragStart(sender, args) {
                var node = args.get_node();
                //when tree editable and start drag, disable node edit
                if (sender.get_allowNodeEditing()) {
                    node.set_allowEdit(false);
                }
            }

            function ClassTreeClientNodeDropping(sender, args) {
                var nSource = args.get_sourceNode();
                var nDest = args.get_destNode();
                //debugger;
                if (nDest) {
                    var tree = nDest.get_treeView();
                    var level = nDest.get_level();
                    var position = args.get_dropPosition();

                    //not allow dropping between root
                    if (level == "0" && (position == "above" || position == "below")) {
                        args.set_cancel(true);
                        return;
                    }

                    //                    nSource.get_parent().get_nodes().remove(nSource);
                    switch (position) {
                        case "over":
                            var node0 = tree.get_nodes().getNode(0);
                            for (var i = 0; i < node0.get_nodes().get_count() ; i++) {
                                var nodeName = args.get_destNode().get_text();
                                if (nodeName == args.get_sourceNode().get_text()) {

                                    alert('Error:' + '<%=Ede.Uof.Utility.Page.Common.Resource.GetResource("Common", "ErrorNameDuplicate")%>!');
                                    return;
                                }
                            }
                            var data = [nSource.get_value(), nSource.get_text(), nDest.get_value()];
                            var result = $uof.pageMethod.sync("ChangeClassParent", data);
                            var sourcenode = tree.findNodeByValue(nSource.get_value());
                            var targetnode = tree.findNodeByValue(nDest.get_value());
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
                                    top.returnValue = "dopostback";
                                    targetnode.get_nodes().add(sourcenode);
                                    window.location = window.location.href;
                                }
                            }
                            break;
                        case "above":
                            //InsertBetweenBefore(nDest, nSource, bIsTheSameParent);
                            break;
                        case "below":
                            //InsertBetweenAfter(nDest, nSource, bIsTheSameParent);
                            break;
                    }

                    tree.commitChanges();
                    nDest.set_expanded(true);
                }
            }

            function ClassTreeClientLoad(sender, args) {
                var node = sender.get_selectedNode();
                if (node) {
                    SetToolbarEnable(true);
                }
            }
            function resizeTree(X, Y) {
                var tree = $find("<%=treeClass.ClientID %>");
                tree.get_element().style.height = Y - 35 + "px";
                tree.get_element().style.width = X + "px";
            }
            function OpenDocDialogResult(returnValue) {
                if (typeof (returnValue) == 'undefined' || returnValue == null) {
                    return false;
                }
                else
                    return true;
            }
        </script>
    </telerik:RadScriptBlock>
    <asp:CustomValidator ID="CustomValidator1" runat="server" Display="Dynamic" ErrorMessage="請先選擇一個目錄" meta:resourcekey="CustomValidator1Resource1"></asp:CustomValidator>
    <telerik:RadToolBar ID="RadFolderToolbar1" runat="server" Width="100%" OnClientButtonClicking="RadFolderToolbar1_Click" meta:resourcekey="barMainResource1" OnButtonClick="RadFolderToolbar1_ButtonClick">
        <Items>
            <telerik:RadToolBarButton runat="server" CheckedImageUrl="~/Common/Images/Icon/icon_m47.png" DisabledImageUrl="~/Common/Images/Icon/icon_m47.png" HoveredImageUrl="~/Common/Images/Icon/icon_m47.png" ImageUrl="~/Common/Images/Icon/icon_m47.png" Text="新增子類別" Value="AddNew" meta:resourcekey="TBarButtonResource1">
            </telerik:RadToolBarButton>
            <telerik:RadToolBarButton runat="server" IsSeparator="True" Value="s1" meta:resourcekey="RadToolBarButtonResource2" />
            <telerik:RadToolBarButton runat="server" CheckedImageUrl="~/Common/Images/Icon/icon_m03.png" DisabledImageUrl="~/Common/Images/Icon/icon_m03.png" HoveredImageUrl="~/Common/Images/Icon/icon_m03.png" ImageUrl="~/Common/Images/Icon/icon_m03.png" Text="刪除類別" Value="Delete" meta:resourcekey="TBarButtonResource2">
            </telerik:RadToolBarButton>
            <telerik:RadToolBarButton runat="server" IsSeparator="True" Value="s2" meta:resourcekey="RadToolBarButtonResource2" />
            <telerik:RadToolBarButton runat="server"
                Value="Culture"
                Text="設定語系"
                HoveredImageUrl="~/Common/Images/Icon/icon_j01.gif"
                ImageUrl="~/Common/Images/Icon/icon_j01.gif"
                CheckedImageUrl="~/Common/Images/Icon/icon_j01.gif"
                DisabledImageUrl="~/Common/Images/Icon/icon_j01.gif" meta:resourcekey="RadToolBarButtonResource1">
            </telerik:RadToolBarButton>
            <telerik:RadToolBarButton runat="server" IsSeparator="True" Value="sep2" />
        </Items>
    </telerik:RadToolBar>
    <telerik:RadTreeView runat="server" ID="treeClass" AllowNodeEditing="True" EnableDragAndDrop="True" Height="100%" Width="100%" EnableNodeTextHtmlEncoding="true"
        OnNodeCreated="ClassTreeClientOnNodeCreated"
        OnClientNodeClicked="ClassTreeClientNodeClicked"
        OnClientNodeEditing="ClassTreeClientNodeEditing"
        OnClientNodeDragStart="ClassTreeClientNodeDragStart"
        OnClientNodeDropping="ClassTreeClientNodeDropping"
        OnClientLoad="ClassTreeClientLoad">
    </telerik:RadTreeView>
    <asp:Label ID="lblClass" runat="server" Text="文件類別" Visible="False" meta:resourcekey="lblClassResource1"></asp:Label>
    <asp:HiddenField ID="hiddenDropTargetNode" runat="server" />
    <asp:HiddenField ID="hiddenDropSourceNode" runat="server" />
    <asp:HiddenField ID="hiddenNodeId" runat="server" />
    <asp:HiddenField ID="hideStatus" runat="server" />
    <asp:HiddenField ID="hdUserGuid" runat="server" />
    <asp:HiddenField ID="hdnNodeImageURL" runat="server" />
    <asp:Label ID="lbNeedItemSelected" runat="server" Text="請先選擇節點!" Visible="False" meta:resourcekey="lbNeedItemSelectedResource1"></asp:Label>
</asp:Content>
