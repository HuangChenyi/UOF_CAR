<%@ Control Language="C#" AutoEventWireup="true" Inherits="WKF_FormUse_PersonalBox_UC_CustFlowList" Codebehind="UC_CustFlowList.ascx.cs" %>

<script id="CustFlowListjs" type="text/javascript">

    //按下 node 事件
    function treeFormList_NodeClick(sender, args)
    {     

      $("#<%=this.hdnIsNodeSelectionChanged.ClientID %>").val("");
        var node = args.get_node();
        if (node.get_value() != $("#<%=this.hdnPreSelectedNodeTag.ClientID %>").val())
         {
            $("#<%=this.hdnIsNodeSelectionChanged.ClientID %>").val("changed");
            
        }
        $("#<%=this.hdnPreSelectedNodeTag.ClientID %>").val(node.get_value());


        if( '<%= this.isParentNodePostBack %>' == 'False')
        {
           // var node = igtree_getNodeById(nodeId);
            
            if(node.get_level()==0)
            {	        
                args.set_cancel(true);
            }
         }
    }

    function GetSelectedFlowTag()
    {
        var tree=$find("<%=RadTreeView1.ClientID%>");
        var obj = tree.get_selectedNode();
       
        if(obj == null)
        {
            return null
        }
        else
        {
            return obj.get_value();
        }
    }
</script>
<telerik:RadTreeView ID="RadTreeView1" runat="server" OnNodeClick="RadTreeView1_NodeClick"
    OnClientNodeChecking="treeFormList_NodeClick"></telerik:RadTreeView>



    <asp:HiddenField runat="server" ID="hdnIsNodeSelectionChanged" />
    <asp:HiddenField runat="server" ID="hdnPreSelectedNodeTag" />

