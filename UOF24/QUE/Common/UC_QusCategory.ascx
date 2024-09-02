<%@ Control Language="C#" AutoEventWireup="true" Inherits="QUE_Design_UC_QusCategory" Debug="true" Codebehind="UC_QusCategory.ascx.cs" %>

<style type="text/css">
    .style2
    {
        width: 281px;
    }
</style>

<script type="text/javascript">
    function treeCategory_NodeEditing(sender, args)
    {
        var node = args.get_node();
        var tree = $find("<%=treeCategory.ClientID%>");
        var thisText = node.get_text();
        var thisNpde = node.get_index();
        var count = tree.get_nodes().get_count();
        var oldText = node.get_text();
        var parentGuid = node.get_parent().get_value();

        $('#<%=this.hiddenRepeat.ClientID %>').val('false');
        if (node.get_level() == 0) {
            return;
        }
        else {
            if (node.get_value() == null || node.get_value() == "") {
                QUE_Design_QusCategory.InsertCategory(newText, oldText, parentGuid, AddTreeNode);
            }
            else {
                if (newText != oldText) {
                    QUE_Design_QusCategory.UpdateCategory(newText, oldText, node.get_value(), ReNameTreeNode);
                }
            }
        }
    }
    function ReNameTreeNode(result) {
        var tree = $find("<%=treeCategory.ClientID%>");

        var node = tree.get_selectedNode();
        if (result.value == null) {
            alert("server error");
        }
        else if (result.value == "hasRepeat") {
            alert("<%=lblMsg.Text%>");
            node.startEdit();
        }
        else if (result.value == "hasNull") {
            alert('<%=Ede.Uof.Utility.Page.Common.Resource.GetResource("Common","ErrorNotAllowEmpty") %>');
            node.set_text(result.request.args["oldText"]);
            node.startEdit();
        }
    }
function AddTreeNode(result) {
    var tree = $find("<%=treeCategory.ClientID%>");
        var node = tree.get_selectedNode();
        if (result.value == null) {
            alert("server error");
        }
        else if (result.value == "hasRepeat") {
            alert("<%=lblMsg.Text%>");
            node.startEdit();
        }
        else if (result.value == "hasNull") {
            alert('<%=Ede.Uof.Utility.Page.Common.Resource.GetResource("Common","ErrorNotAllowEmpty") %>');
            node.set_text(result.request.args["oldText"]);
            node.startEdit();

        }
        else {

            node.set_value(result.value);
            node.set_selected(true);

        }
    }

    function treeCategory_NodeClicking(sender, args)
    {
        var node = args.get_node();
        var tag = $('#<%=this.hidTag.ClientID%>');
        tag.val(node.get_value());
        var name = $('#<%=this.hidName.ClientID%>');
        name.val(node.get_text());
    }
</script>

<script type="text/javascript">
    $(function () {
        var selectedNodeId = $("#<%=this.hiddenNode.ClientID %>").val();
        
        if (selectedNodeId) {
            var node = igtree_getNodeById(selectedNodeId);
            if (node && $("#<%=this.hiddenRepeat.ClientID %>").val() == "true") {
                node.setSelected(true);
                node.edit();
            }
        }
    });
   
    function SetNodeEdit()
    {
        if(document.readyState == 'complete')
        {
            var node=igtree_getNodeById($('#<%=this.hiddenNode.ClientID %>').val());

            if(node!=null && $('#<%=this.hiddenRepeat.ClientID %>').val()=='true')
            {
                node.setSelected(true);
                node.edit();
            }

        }
    }

</script>
<table width="100%">
    <tr>
        
            <td style="text-align:left" >
                <telerik:RadTreeView ID="treeCategory" runat="server" OnNodeClick="treeCategory_NodeClick"  EnableNodeTextHtmlEncoding="true"
                    OnClientNodeClicking="treeCategory_NodeClicking" OnClientNodeEditing="treeCategory_NodeEditing"></telerik:RadTreeView>
            </td>
</tr>
</table>

<asp:HiddenField ID="hiddenRepeat" runat="server" />
<asp:HiddenField ID="hiddenNode" runat="server" />
<asp:HiddenField ID="hidTag" runat="server" />
<asp:HiddenField ID="hidName" runat="server" />
<asp:Label ID="lblRoot" runat="server" Visible="False" Text="類別" 
    meta:resourcekey="lblRootResource1"></asp:Label>
<asp:Label ID="lblAll" runat="server" Visible="False" Text="全部類別" 
    meta:resourcekey="lblAllResource1"></asp:Label>
<asp:Label ID="lblMsg" runat="server" Visible="False" Text="類別不可以重複" 
    meta:resourcekey="lblMsgResource1"></asp:Label>
<asp:Label ID="lblEmpty" runat="server" Visible="False" Text="類別不可以為空" 
    meta:resourcekey="lblEmptyResource1"></asp:Label>
<asp:Label ID="lblDelete" runat="server" Visible="False" Text="該類別不可以被刪除" 
    meta:resourcekey="lblDeleteResource1"></asp:Label>
<asp:Label ID="lblRootMsg" runat="server" Visible="False" Text="該類別不可以變更" 
    meta:resourcekey="lblRootMsgResource1"></asp:Label>
