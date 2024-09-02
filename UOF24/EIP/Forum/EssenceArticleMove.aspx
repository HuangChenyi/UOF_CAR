<%@ Page Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="EIP_Forum_EssenceArticleMove" Title="精華區文章搬移" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" Codebehind="EssenceArticleMove.aspx.cs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<script id="telerikscript" type="text/javascript">

    function RadTreeView1_NodeDragStart(sender, args) {
        var sourceNode = args.get_node();
        var parentNode = sourceNode.get_parent();
        if (sender.get_allowNodeEditing()) {
            sourceNode.set_allowEdit(false);
        }
        $("#<%=hiddenDropSourceNode.ClientID %>").val(parentNode.get_value());
        $("#<%=hiddenNodeId.ClientID %>").val(sourceNode.get_value());
       
    }
    function RadTreeView1_NodeDropping(sender, args) {
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
        }
    }
  
</script>
<table width="100%">
<tr><td>
    <asp:CustomValidator ID="CustomValidator1" runat="server" Display="Dynamic" ForeColor="Red" ErrorMessage="目錄與主題是不在同一版中" meta:resourcekey="CustomValidator1Resource1"></asp:CustomValidator>
    <asp:CustomValidator ID="CustomValidator2" runat="server" Display="Dynamic" ForeColor="Red" ErrorMessage="沒有權限" meta:resourcekey="CustomValidator2Resource1"></asp:CustomValidator></td>
</tr>
<tr><td>
    <telerik:RadTreeView ID="RadTreeView1" runat="server" AllowNodeEditing="false" EnableDragAndDrop="true"
        OnClientNodeDragStart="RadTreeView1_NodeDragStart"  EnableNodeTextHtmlEncoding="true"
        OnClientNodeDropping="RadTreeView1_NodeDropping" 
        OnNodeDrop="RadTreeView1_NodeDrop"></telerik:RadTreeView>
</td></tr>
</table>
<input id="hiddenDropTargetNode" runat="server" type="hidden" />
    <input id="hiddenDropSourceNode" runat="server" type="hidden" />
    <input id="hiddenNodeId" runat="server" type="hidden" />
</asp:Content>

