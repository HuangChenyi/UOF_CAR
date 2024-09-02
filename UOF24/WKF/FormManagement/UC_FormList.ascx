<%@ Control Language="C#" AutoEventWireup="true" Inherits="WKF_FormManagement_UC_FormList" Codebehind="UC_FormList.ascx.cs" %>
<script id="FormListjs" type="text/javascript">
    function EditCategoryNode() {
        var tree = $find("<%= RadTreeView1.ClientID %>");
        var node = tree.get_selectedNode();

        if (node != null && $('#<%=hidNeedEdit.ClientID%>').val()) {
	        node.startEdit();
	    }
    }

    function treeForm_Load(sender, eventArgs) {
        EditCategoryNode();
    }
</script>
<telerik:RadTreeView ID="RadTreeView1" runat="server" OnNodeClick="RadTreeView1_NodeClick" OnClientLoad="treeForm_Load"></telerik:RadTreeView>
<input id="hiddenNodeId" runat="server" type="hidden" />
<input id="hiddenDropSourceNode" runat="server" type="hidden" />
<input id="hidNeedEdit" runat="server" type="hidden" />
