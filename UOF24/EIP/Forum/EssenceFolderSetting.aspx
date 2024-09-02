<%@ Page Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="EIP_Forum_EssenceFolderSetting" Title="精華區目錄設定" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" Codebehind="EssenceFolderSetting.aspx.cs" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <script type="text/javascript">
        function RadTreeView1_NodeDragStart(sender, args) {
            var node = args.get_node();
            if (sender.get_allowNodeEditing()) {
                node.set_allowEdit(false);
            }
        }

        function RadTreeView1_NodeDropping(sender, args) {
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
                                alert('error:' + '<%=Ede.Uof.Utility.Page.Common.Resource.GetResource("Common", "ErrorNameDuplicate")%>!');
                                return;
                            }
                        }
                        //nDest.get_nodes().add(nSource);                        
                        var changedata = [nSource.get_value(), nDest.get_value(), nSource.get_value(), nDest.get_value(), userGuid];
                        var result = $uof.pageMethod.sync("ChangeFolderParent", changedata);
                        if (result == null) {
                            alert("server error");
                            SetToolbarEnable(true);
                        }
                        else {
                            if (result.indexOf('Error') > -1) {
                                if (result == "Error:5") {
                                    alert($("Error:" + "#<%=lblMsg5.ClientID %>").text());
                                }
                                else if (result == "Error:6") {
                                    alert($("Error:" + "#<%=lblMsg6.ClientID %>").text());
                                }
                                else {
                                    alert(result);                                                                                                            
                                }
                                SetToolbarEnable(true);
                                
                            }
                            else {
                                $uof.dialog.set_returnValue("NeedPostBack");
                                window.location = window.location.href;
                            }
                        }
                        break;
                }                
                tree.commitChanges();
                nDest.set_expanded(true);
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
            $uof.dialog.set_returnValue("NeedPostBack");
            window.location = window.location.href;
        }
    }
}

function RadTreeView1_NodeEditing(sender, args) {
    var userGuid = $('#<%=this.hdUserGuid.ClientID %>').val();
        var node = args.get_node();
        var text = args.get_newText();
        if (escape(text) == '%A0' || escape(text) == "") {
            alert('<%=Ede.Uof.Utility.Page.Common.Resource.GetResource("Common","ErrorNotAllowEmpty") %>!');
            args.set_cancel(true);
            setTimeout(function () { node.startEdit(); }, 100);
        }
        else {
            //如果是新增;
            if (node.get_value() == null || node.get_value() == "") {

                var boardID = '<%=Request.QueryString["boardid"].ToString() %>';
                var folderID = "";
                node.set_value(folderID);
                var parentNode = node.get_parent();
                var parentGuid = parentNode.get_value();
                var createdata = [boardID, folderID, text, parentGuid, node.get_value(), node.get_level(), userGuid];
                var result = $uof.pageMethod.sync("CreateFolder", createdata);
                if (result == null) {
                    alert("server error");
                    node.get_parent().get_nodes().remove(node);

                    SetToolbarEnable(true);
                }
                else {
                    if (result.indexOf('Error') > -1) {
                        alert(result);
                        node.set_value(null);
                        args.set_cancel(true);
                        setTimeout(function () { node.startEdit(); }, 100);
                    }
                    else {
                        var tree = $find("<%= this.RadTreeView1.ClientID %>");
                        var newnode = tree.findNodeByValue(result);
                        tree.trackChanges();
                        node.set_value(result);
                        node.set_text(text);
                        node.set_selected(true);
                        tree.commitChanges();
                        $uof.dialog.set_returnValue("NeedPostBack");
                        SetToolbarEnable(true);
                    }
                }
            }
            else {
                var modifydata = [node.get_value(), text, node.get_value(), userGuid];
                var result = $uof.pageMethod.sync("ModifyFolder", modifydata);
                if (result == null) {
                    alert("server error");

                    node.set_text(node.get_text());
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
                        $uof.dialog.set_returnValue("NeedPostBack");
                    }
                }
            }
        }
    }

    function treeAddNode(result) {
        var tree = $find("<%= this.RadTreeView1.ClientID %>");
        var node = tree.findNodeByValue(result.request.args["nodeId"]);


        if (result.value == null) {
            alert("server error");
            node.get_parent().get_nodes().remove(node);

            SetToolbarEnable(true);
        }
        else {
            if (result.value.indexOf('Error') > -1) {
                alert(result.value);
                node.set_value(null);
                setTimeout(function () { node.startEdit(); }, 100);
            }
            else {
                node.set_value(result.value);
                //top.returnValue = "";
                $uof.dialog.set_returnValue("NeedPostBack");
                SetToolbarEnable(true);
            }
        }
    }

    function treeRenameNode(result) {
        var tree = $find("<%= this.RadTreeView1.ClientID %>");
        var node = tree.findNodeByValue(result.request.args["nodeId"]);

        if (result.value == null) {
            alert("server error");

            node.set_text(result.request.args["folderName"]);
            SetToolbarEnable(true);
        }
        else {
            if (result.value.indexOf('Error') > -1) {
                alert(result.value);
                setTimeout(function () { node.startEdit(); }, 100);
            }
            else {
                SetToolbarEnable(true);                
                $uof.dialog.set_returnValue("NeedPostBack");
            }
        }
    }

    function SetToolbarEnable(enable) {
        var toolbar = $find("<%= RadToolBar1.ClientID %>");
        toolbar.findItemByValue("Create").set_enabled(enable);
        toolbar.findItemByValue("Delete").set_enabled(enable);
    }

    function treeRemoveNode(result) {
        var tree = $find("<%= this.RadTreeView1.ClientID %>");
        var node = tree.findNodeByValue(result.request.args["folderGUID"]);
        if (result.value == null) {
            alert("server error");
        }
        else {
            if (result.value.indexOf('Error') > -1) {
                alert(result.value);
            }
            else {
                if (node.get_parent() != null) {
                    node.get_parent().set_selected(true);
                    node.get_parent().get_nodes().remove(node);
                    
                    $uof.dialog.set_returnValue("NeedPostBack");
                }


            }
        }

        SetToolbarEnable(true);
    }
    function radToolBarClicking(sender, args) {
        var key = args.get_item().get_value();
        args.set_cancel(true);

        var tree = $find("<%= this.RadTreeView1.ClientID %>");
        var userGuid = $('#<%=this.hdUserGuid.ClientID %>').val();
        switch (key) {
            case "Create":
                var parentNode = tree.get_selectedNode();
                if (parentNode != null) {
                    SetToolbarEnable(false);
                    var nodeNew = new Telerik.Web.UI.RadTreeNode();
                    nodeNew.set_text("New Folder");
                    nodeNew.set_imageUrl($('#<%=this.hdnNodeImageURL.ClientID %>').val());
                    tree.trackChanges();
                    parentNode.get_nodes().insert(0, nodeNew);
                    if (parentNode != tree && !parentNode.get_expanded()) {
                        parentNode.set_expanded(true);
                    }
                    nodeNew.startEdit();
                    tree.commitChanges();
                    $uof.dialog.set_returnValue("NeedPostBack");
                }
                else {
                    alert('<%=CustomValidator1.ErrorMessage %>');
                }
                break;
            case "Delete":
                var node = tree.get_selectedNode();
                if (node != null) {
                    if (confirm('<%=msgDelconfirm.Text %>')) {
                        SetToolbarEnable(false);
                        var folderGUID = node.get_value();
                        var deletedata = [folderGUID, node.Id, userGuid];
                        var result = $uof.pageMethod.sync("DeleteFolder", deletedata);
                        //EIP_Forum_EssenceFolderSetting.DeleteFolder(folderGUID, node.Id, treeRemoveNode);
                        if (result == null) {
                            alert("server error");
                        }
                        else {
                            if (result.indexOf('Error') > -1) {
                                alert(result);
                            }
                            else {
                                if (node.get_parent() != null) {
                                    node.get_parent().set_selected(true);
                                    tree.trackChanges();
                                    node.get_parent().get_nodes().remove(node);
                                    tree.commitChanges();
                                    $uof.dialog.set_returnValue("NeedPostBack");
                                }
                            }
                        }

                        SetToolbarEnable(true);
                    }
                }
                else {
                    alert('<%=CustomValidator1.ErrorMessage %>');
                }
                break;
        }
    }
    function resizeTree(X, Y) {
        var tree = $find("<%=RadTreeView1.ClientID %>");
        tree.get_element().style.height = Y - 35 + "px";
        tree.get_element().style.width = X + "px";
    }
    </script>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <asp:CustomValidator ID="CustomValidator1" runat="server" Display="Dynamic" ErrorMessage="請先選擇任一目錄" meta:resourcekey="CustomValidator1Resource1"></asp:CustomValidator>
            <asp:CustomValidator ID="CustomValidator2" runat="server" Display="Dynamic" ErrorMessage="不允許刪除" meta:resourcekey="CustomValidator2Resource1"></asp:CustomValidator>
            <asp:CustomValidator ID="CustomValidator3" runat="server" Display="Dynamic" ErrorMessage="目錄名稱不允許空白" meta:resourcekey="CustomValidator3Resource1"></asp:CustomValidator>
            <asp:CustomValidator ID="CustomValidator4" runat="server" Display="Dynamic" ErrorMessage="無法更名 ! 已有相同目錄存在" meta:resourcekey="CustomValidator4Resource1"></asp:CustomValidator>
            <asp:CustomValidator ID="CustomValidator5" runat="server" Display="Dynamic" ErrorMessage="目錄與主題是不在同一版中" meta:resourcekey="CustomValidator5Resource1"></asp:CustomValidator>
            <asp:CustomValidator ID="CustomValidator6" runat="server" Display="Dynamic" ErrorMessage="無權限維護" meta:resourcekey="CustomValidator6Resource1"></asp:CustomValidator>
            <asp:CustomValidator ID="CustomValidator7" runat="server" Display="Dynamic" ErrorMessage="目錄名稱超出範圍" meta:resourcekey="CustomValidator7Resource1"></asp:CustomValidator>
            <asp:CustomValidator ID="CustomValidator8" runat="server" Display="Dynamic" ErrorMessage="該主題已存在同一精華區目錄中" meta:resourcekey="CustomValidator8Resource1"></asp:CustomValidator>

            <telerik:RadSplitter ID="MasterRdSplitter" runat="server" Width="100%" LiveResize="true" ResizeWithBrowserWindow="true" ResizeWithParentPane="true" Orientation="Horizontal" BorderSize="0">
                <telerik:RadPane ID="TopRdPanel" runat="server" Height="35px" Scrolling="None">
                    <telerik:RadToolBar ID="RadToolBar1" runat="server" Width="100%" OnClientButtonClicking="radToolBarClicking">
                        <Items>
                            <telerik:RadToolBarButton runat="server" Text="新增目錄" Value="Create"
                                CheckedImageUrl="~/Common/Images/Icon/icon_m14.gif"
                                DisabledImageUrl="~/Common/Images/Icon/icon_m14.gif"
                                HoveredImageUrl="~/Common/Images/Icon/icon_m14.gif"
                                ImageUrl="~/Common/Images/Icon/icon_m14.gif"
                                meta:resourcekey="RadToolBarCreateResource1">
                            </telerik:RadToolBarButton>
                            <telerik:RadToolBarButton IsSeparator="true"></telerik:RadToolBarButton>
                            <telerik:RadToolBarButton runat="server" Text="刪除" Value="Delete"
                                CheckedImageUrl="~/Common/Images/Icon/icon_m03.gif"
                                DisabledImageUrl="~/Common/Images/Icon/icon_m03.gif"
                                HoveredImageUrl="~/Common/Images/Icon/icon_m03.gif"
                                ImageUrl="~/Common/Images/Icon/icon_m03.gif"
                                meta:resourcekey="RadToolBarDeleteResource1">
                            </telerik:RadToolBarButton>
                            <telerik:RadToolBarButton IsSeparator="true"></telerik:RadToolBarButton>
                        </Items>
                    </telerik:RadToolBar>
                </telerik:RadPane>
                <telerik:RadPane ID="TreeRdPanel" runat="server" Scrolling="None">
                    <telerik:RadTreeView ID="RadTreeView1" runat="server" AllowNodeEditing="true" EnableDragAndDrop="true" Height="520px"
                        OnClientNodeDragStart="RadTreeView1_NodeDragStart" OnClientNodeDropping="RadTreeView1_NodeDropping" EnableNodeTextHtmlEncoding="true"
                        OnClientNodeEditing="RadTreeView1_NodeEditing">
                    </telerik:RadTreeView>
                    <input id="hiddenDropTargetNode" runat="server" type="hidden" />
                    <input id="hiddenDropSourceNode" runat="server" type="hidden" />
                    <input id="hiddenNodeId" runat="server" type="hidden" />
                    <input id="hideStatus" runat="server" type="hidden" />
                    <input id="hideBoardId" type="hidden" runat="server" />
                    <asp:HiddenField ID="hdUserGuid" runat="server" />
                    <asp:HiddenField ID="hdnNodeImageURL" runat="server" />
                    <asp:Label ID="msgDelconfirm" runat="server" Text="確定要刪除?" Visible="False" meta:resourcekey="msgDelconfirmResource1"></asp:Label>
                    <asp:Label ID="msgEssence" runat="server" Text="精華區" Visible="False" meta:resourcekey="msgEssenceResource1"></asp:Label>
                    <asp:Label ID="msgNotmodify" runat="server" Text="不可修改" Visible="False" meta:resourcekey="msgNotmodifyResource1"></asp:Label>
                    <asp:Label ID="lblMsg5" runat="server" Text="目錄與主題是不在同一版中" Style="display: none;" meta:resourcekey="CustomValidator5Resource1"></asp:Label>
                    <asp:Label ID="lblMsg6" runat="server" Text="無權限維護" Style="display: none;" meta:resourcekey="CustomValidator6Resource1"></asp:Label>
                </telerik:RadPane>
            </telerik:RadSplitter>
        </ContentTemplate>
    </asp:UpdatePanel>   
</asp:Content>

