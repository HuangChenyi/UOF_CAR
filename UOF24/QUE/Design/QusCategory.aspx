<%@ Page Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="QUE_Design_QusCategory" culture="auto" uiculture="auto"　Title="問卷類別維護"　meta:resourcekey="PageResource1" Codebehind="QusCategory.aspx.cs"%>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<script type="text/javascript">
   
    function treeCategory_NodeEditing(sender, args)
    {
        var tree = $find("<%=treeCategory.ClientID%>");
        var node = args.get_node();
        var newText = args.get_newText();
        var oldText = node.get_text();
        var nodeLevel = node.get_level()-1;

        var parentGuid = node.get_parent().get_value();
        if (node.get_value() == null || node.get_value() == "") {
            
            var createdata = [newText, oldText, parentGuid, nodeLevel];
            var result = $uof.pageMethod.sync("InsertCategory", createdata);
            if (result == null) {
                alert("server error");
            }
            else if (result == "hasRepeat") {
                alert("<%=lblMsg.Text%>");
                args.set_cancel(true);
                setTimeout(function () { node.startEdit(); }, 100);
            }
            else if (result == "hasNull") {
                alert('<%=Ede.Uof.Utility.Page.Common.Resource.GetResource("Common","ErrorNotAllowEmpty") %>');
                node.set_text(oldText);
                args.set_cancel(true);
                setTimeout(function () { node.startEdit(); }, 100);

            }
            else {
                node.set_value(result);
                node.set_selected(true);
            }
        }
        else {
            if (newText != oldText) {
                var updatedata = [newText, oldText, node.get_value()];
                var result = $uof.pageMethod.sync("UpdateCategory", updatedata);
                var node = tree.get_selectedNode();

                if (result == null) {
                    alert("server error");
                }
                else if (result == "hasRepeat") {
                    alert("<%=lblMsg.Text%>");
                    args.set_cancel(true);
                    setTimeout(function () { node.startEdit(); }, 100);
                }
                else if (result == "hasNull") {
                    alert('<%=Ede.Uof.Utility.Page.Common.Resource.GetResource("Common","ErrorNotAllowEmpty") %>');
                    node.set_text(oldText);
                    args.set_cancel(true);
                    setTimeout(function () { node.startEdit(); }, 100);
                }
                else {
                    node.set_value(result);
                    node.set_selected(true);
                }
            }
        }
    }

    function catToolBarButtonClicking(sender, args) {
        var key = args.get_item().get_value();
        var tree = $find("<%=treeCategory.ClientID%>");
        var selectNode = tree.get_selectedNode();

        switch (key) {
            case "AddChild":
                var node = new Telerik.Web.UI.RadTreeNode();
                node.set_text("New Category");
                node.set_imageUrl("../../Common/Images/Icon/icon_m178.gif");
                tree.trackChanges();
                selectNode.get_nodes().add(node);
                node.set_selected(true);
                selectNode.set_expanded(true);


                node.startEdit();
                tree.commitChanges();
                args.set_cancel(true);
                break;
            case "Delete":
                if (selectNode.get_level() == 0) {
                    alert('<%=lblRoot.Text %>');
                    return;
                }

                if (!confirm('<%=Ede.Uof.Utility.Page.Common.Resource.GetResource("Common","ConfirmDelete") %>')) {
                    args.set_cancel(true);
                    return;
                }
                else {
                    if (selectNode.get_nodes().get_count() > 0) {
                        alert('<%=lblDelete.Text %>');
                        args.set_cancel(true);
                        return;
                    }
                    else {
                        var data = [selectNode.get_value()];
                        var result = $uof.pageMethod.sync("DeleteCate", data);
                        if (result == "true") {
                            if (selectNode.get_level() == 0) {
                                tree.get_nodes().remove(selectNode);
                            }
                            else {
                                selectNode.get_parent().get_nodes().remove(selectNode);
                            }
                        }
                        else
                            break;
                    }
                }
                break;
        }
        args.set_cancel(true);
    }
    
    function treeCategory_NodeClicking(sender, args) {
        var catToolBar = $find("<%= catToolBar.ClientID %>");
        var node = args.get_node();
        var attrResult = node.get_attributes().getAttribute("isManager");
        node.select();
        if (catToolBar != null && catToolBar != 'undefined') {            
            if (attrResult == null || attrResult == "undefined") {
                if ($("#<%=hidHasAuth.ClientID%>").val() == "True") {
                    catToolBar.findItemByValue("AddChild").set_enabled(true);
                    catToolBar.findItemByValue("Delete").set_enabled(true);
                    catToolBar.findItemByValue("NoAuthMsg").hide();
                }
                else {
                    catToolBar.findItemByValue("AddChild").disable();
                    catToolBar.findItemByValue("Delete").disable();
                    catToolBar.findItemByValue("NoAuthMsg").show();
                }
            }
            else {
                if (attrResult === "False") {
                    catToolBar.findItemByValue("AddChild").disable();
                    catToolBar.findItemByValue("Delete").disable();
                    catToolBar.findItemByValue("NoAuthMsg").show();
                }
                else {
                    catToolBar.findItemByValue("AddChild").set_enabled(true);
                    catToolBar.findItemByValue("Delete").set_enabled(true);
                    catToolBar.findItemByValue("NoAuthMsg").hide();
                }
            }
        }
    }
    Sys.Application.add_load(
        function () {
            var catToolBar = $find("<%= catToolBar.ClientID %>");
            if (catToolBar != null && catToolBar != 'undefined') {
                var tree = $find("<%= treeCategory.ClientID %>");
                var node = tree.get_selectedNode();
                var attrResult = node.get_attributes().getAttribute("isManager");

                if (catToolBar != null && catToolBar != 'undefined') {
                    if (attrResult == null || attrResult == "undefined") {
                        if ($("#<%=hidHasAuth.ClientID%>").val() == "True") {
                            catToolBar.findItemByValue("AddChild").set_enabled(true);
                            catToolBar.findItemByValue("Delete").set_enabled(true);
                            catToolBar.findItemByValue("NoAuthMsg").hide();
                        }
                        else {
                            catToolBar.findItemByValue("AddChild").disable();
                            catToolBar.findItemByValue("Delete").disable();
                            catToolBar.findItemByValue("NoAuthMsg").show();
                        }
                    }
                    else {
                        catToolBar.findItemByValue("AddChild").set_enabled(true);
                        catToolBar.findItemByValue("Delete").set_enabled(true);
                        catToolBar.findItemByValue("NoAuthMsg").hide();
                    }
                }
            }
        }
        );
    function CheckAuth() {
        var tree = $find("<%= treeCategory.ClientID %>");
        var node = tree.get_selectedNode();
        var managerAttrResult = node.get_attributes().getAttribute("isManager");
      

        if (managerAttrResult != 'True') {

            alert("<%=lblNoAuth.Text %>");
            return false;
        }
    }
    function MasterRdSplitter_Resized(sender, args)
    {
        var splitter = $find("<%= MasterRdSplitter.ClientID %>");
        var pane = splitter.getPaneById("<%= TreeRdPanel.ClientID %>");

        var tree = $find("<%= treeCategory.ClientID %>");
        var node = tree.get_selectedNode();
        

        var nodeheight = node.get_element().offsetTop ;
        var nodewidth = node.get_element().offsetLeft;
        
        pane.setScrollPos(nodewidth, nodeheight);
    }
    function treeCategory_NodeDropping(sender, args) {
        var nSource = args.get_sourceNode();
        var nDest = args.get_destNode();
        $("#<%=hidSelectNode.ClientID%>").val(nSource.get_value());

        var catToolBar = $find("<%= catToolBar.ClientID %>");
        var attrResult = nDest.get_attributes().getAttribute("isManager");

        if (catToolBar != null && catToolBar != 'undefined') {
            if (attrResult == null || attrResult === "undefined" || attrResult === "False") {
                if ($("#<%=hidHasAuth.ClientID%>").val() != "True") {
                    catToolBar.findItemByValue("NoAuthMsg").show();
                    args.set_cancel(true);
                }
            }
        }       
    }
  
    </script>

   
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
           
            <telerik:RadSplitter ID="MasterRdSplitter" runat="server" Width="100%" LiveResize="True" Orientation="Horizontal" BorderSize="0" meta:resourcekey="MasterRdSplitterResource1" PanesBorderSize="0" SplitBarsSize="" OnClientResized="MasterRdSplitter_Resized">
                <telerik:RadPane ID="TopRdPanel" runat="server" Height="35px" Scrolling="None" Index="0" meta:resourcekey="TopRdPanelResource1">
                      <telerik:RadToolBar ID="catToolBar" runat="server" Width="100%" OnClientButtonClicking="catToolBarButtonClicking" meta:resourcekey="catToolBarResource1" SingleClick="None">
                    <Items>
                        <telerik:RadToolBarButton runat="server" Text="新增類別" Value="AddChild"
                            CheckedImageUrl="~/Common/Images/Icon/icon_m02.gif"
                            DisabledImageUrl="~/Common/Images/Icon/icon_m02.gif"
                            HoveredImageUrl="~/Common/Images/Icon/icon_m02.gif"
                            ImageUrl="~/Common/Images/Icon/icon_m02.gif"
                            meta:resourcekey="catToolBarAddChildResource1">
                        </telerik:RadToolBarButton>
                        <telerik:RadToolBarButton IsSeparator="True" runat="server" meta:resourcekey="RadToolBarButtonResource1"></telerik:RadToolBarButton>
                        <telerik:RadToolBarButton runat="server" Text="刪除類別" Value="Delete"
                            CheckedImageUrl="~/Common/Images/Icon/icon_m03.gif"
                            DisabledImageUrl="~/Common/Images/Icon/icon_m03.gif"
                            HoveredImageUrl="~/Common/Images/Icon/icon_m03.gif"
                            ImageUrl="~/Common/Images/Icon/icon_m03.gif"
                            meta:resourcekey="catToolBarDeleteResource1">
                        </telerik:RadToolBarButton>
                        <telerik:RadToolBarButton IsSeparator="True" runat="server" meta:resourcekey="RadToolBarButtonResource2"></telerik:RadToolBarButton>
                        <telerik:RadToolBarButton runat="server" Value="NoAuthMsg" meta:resourcekey="RadToolBarButtonResource3">
                            <ItemTemplate> 
                                <asp:Label ID="Label1" runat="server" Text="沒有權限維護" ForeColor="Red" meta:resourcekey="Label1Resource1"></asp:Label>
                            </ItemTemplate>
                        </telerik:RadToolBarButton>
                    </Items>
                </telerik:RadToolBar>
                </telerik:RadPane>
                <telerik:RadPane ID="TreeRdPanel" runat="server" Index="1" meta:resourcekey="TreeRdPanelResource1" Scrolling="None">
                    
                    <telerik:RadTreeView ID="treeCategory" runat="server" EnableNodeTextHtmlEncoding="True" Height="390px"
                        OnNodeEdit="treeCategory_NodeEdit"
                        OnClientNodeEditing="treeCategory_NodeEditing" EnableDragAndDrop="true"
                        meta:resourcekey="treeCategoryResource1" OnClientNodeClicking="treeCategory_NodeClicking" 
                        OnNodeDrop ="treeCategory_NodeDrop" OnClientNodeDropping="treeCategory_NodeDropping"></telerik:RadTreeView>
                        </telerik:RadPane>
            </telerik:RadSplitter>
            <asp:HiddenField ID="hidHasAuth" runat="server" />
            <asp:HiddenField ID="hidIsExamine" runat="server" />
            <asp:HiddenField ID="hidSelectNode" runat="server" />

       </ContentTemplate>
    </asp:UpdatePanel>
   
    <asp:Label ID="lblType" runat="server" Visible="False" meta:resourcekey="lblTypeResource1"></asp:Label>
    <asp:HiddenField ID="hiddenDelete" runat="server" value="類別內仍有子類別，請先刪除子類別" />
    <asp:HiddenField ID="hiddenHasQue" runat="server" value="類別內仍有問卷，不允許刪除" />
    <asp:HiddenField ID="hiddenRoot"   runat="server" value="該類別不允許刪除" />
    <asp:Label ID="lblDelete" runat="server" Visible="False" Text="類別內仍有子類別，請先刪除子類別" meta:resourcekey="lblDeleteResource1"></asp:Label>
    <asp:Label ID="lblHasQue" runat="server" Visible="False" Text="類別內仍有問卷，不允許刪除" meta:resourcekey="lblHasQueResource1"></asp:Label>
    <asp:Label ID="lblRoot" runat="server" Visible="False" Text="該類別不允許刪除" meta:resourcekey="lblRootResource1"></asp:Label>
    <asp:Label ID="lblRootName" runat="server" Visible="False" Text="類別" meta:resourcekey="lblRootNameResource1"></asp:Label>
    <asp:Label ID="lblMsg" runat="server" Visible="False" Text="類別不可以重複" meta:resourcekey="lblMsgResource1"></asp:Label>
    <asp:Label ID="lblNoAuth" runat="server" Text="沒有權限" Visible="False" meta:resourcekey="lblNoAuthResource1"></asp:Label>
    <asp:Label ID="lblPageTitle" runat="server" Text="問卷類別" Visible="False" meta:resourcekey="lblPageTitleResource1"></asp:Label>
</asp:Content>

