<%@ Control Language="C#" AutoEventWireup="true" Inherits="WKF_FormUse_UC_FormList" Codebehind="UC_FormList.ascx.cs" %>

<style>
    .SearchBoxMargin {
        margin-top: 2px;
        margin-left: 1px;
    }
    .TreeMargin {
        margin-left: 5px;
    }
    .rbPrimary{
        padding-left:0px !important;
    }
</style>
<script id=" treejs" type="text/javascript">
    var IsSearh = "";   //紀錄是不是查詢表單的動作

    function CollapseAllNodes() {
        var tree = $find("<%=treeFormList.ClientID%>");
        if (tree != null)
        {
            var nodes = tree.get_allNodes();
            for (var i = 0; i < nodes.length; i++) {

                if (nodes[i].get_nodes() != null) {
                    nodes[i].collapse();
                }
            }

            $("#<%=divCollapse.ClientID%>").hide();
            $("#<%=divExpand.ClientID%>").show();
        }
    }

    function ExpandAllNodes()
    {
        var tree = $find("<%=treeFormList.ClientID%>");
        if (tree != null)
        {
            var nodes = tree.get_allNodes();
            for (var i = 0; i < nodes.length; i++) {

                if (nodes[i].get_nodes() != null) {
                    nodes[i].expand();
                }
            }

            $("#<%=divCollapse.ClientID%>").show();
            $("#<%=divExpand.ClientID%>").hide();
        }
    }


    function Search(sender, args)
    {
        KeywordSearch();
    }

    function KeywordSearch() {
        var text = $("#<%=txtSearch.ClientID%>").val();
        var tree = $find("<%=treeFormList.ClientID%>");
                
        if (text !== "") {
            var categoryNodes = tree.get_nodes();

            //每一個類別
            for (var i = 0; i < categoryNodes.get_count() ; i++) {

                //拿到該類別
                var categoryNode = categoryNodes.getNode(i);

                //拿到該類別底下的所有表單
                var formNodes = categoryNode.get_nodes();

                var searchExist = false;
                //每一個表單
                for (var j = 0; j < formNodes.get_count() ; j++) {

                    //拿到該表單
                    var formNode = formNodes.getNode(j);

                    //拿到該表單的文字
                    var formText = formNode.get_text();

                    if (formText.indexOf(text) < 0) {
                        formNode.set_visible(false);
                    }
                    else {
                        formNode.set_visible(true);
                        searchExist = true;
                    }
                }
                
                if (!searchExist) {
                    categoryNode.set_visible(false);
                }
                else {
                    if (IsSearh != "false") {                        
                        //查詢表單展開符合關鍵字的表單類別
                        categoryNode.set_visible(true);
                        categoryNode.expand();
                        $("#<%=divCollapse.ClientID%>").show();
                        $("#<%=divExpand.ClientID%>").hide();                        
                    } else {
                        //User的表單列表有權限問題，不一定全部節點都有顯示，所以要先判斷有沒有該節點
                        if (tree.get_selectedNode() != null) {
                            //點選節點則判斷要展開還是收合(查詢表單狀態)
                            if (categoryNode.get_text() == tree.get_selectedNode().get_text()) {
                                if (categoryNode.get_expanded()) {                               
                                    categoryNode.collapse();                                
                                } else {                                
                                    categoryNode.expand();                                
                                }
                            }
                        }                         
                    }
                }
            }            
            IsSearh = "";
        }
        else {
            var nodes = tree.get_allNodes();

            for (var i = 0; i < nodes.length; i++) {
                nodes[i].set_visible(true);
            }
        }        
    }

    Sys.Application.add_load(function () {
        var lblSearch = $("#<%=lblSearch.ClientID%>");
        var txtSearch = $("#<%=txtSearch.ClientID%>");

        txtSearch.attr("placeholder", lblSearch.text());

        txtSearch.keyup(function (e) {
            if ((e.which == 8 && txtSearch.val() == "") ||
                (e.which == 13 && txtSearch.val() != "") ||
                (e.which == 46 && txtSearch.val() == "")) {
                KeywordSearch();                
            }
        });
        
        txtSearch.bind("mouseup", function (e) {
            var $input = $(this),
                oldValue = $input.val();

            if (oldValue == "") return;

            setTimeout(function () {
                var newValue = $input.val();

                if (newValue == "") {
                    KeywordSearch();
                }
            }, 10);
        });

        if (txtSearch.val() != "") {
            IsSearh = "false";  //點選類別節點改狀態為false            
            KeywordSearch();
        }
    });
    //按下 node 事件
    function treeFormList_NodeClick(sender, args) {        

        $("#<%=this.hdnIsNodeSelectionChanged.ClientID %>").val("");
        var node = args.get_node();

        //單擊類別文字即展開或收合列表(非查詢表單狀態)
        var txtSearch = $("#<%=txtSearch.ClientID%>");
        if (txtSearch.val() == "") {            
            node.toggle();
        } 

        if (node.get_value() != $("#<%=this.hdnPreSelectedNodeTag.ClientID %>").val())
         {
            $("#<%=this.hdnIsNodeSelectionChanged.ClientID %>").val("changed");
            
        }
        $("#<%=this.hdnPreSelectedNodeTag.ClientID %>").val(node.get_value());


        if( '<%= this.isParentNodePostBack %>' == 'False')
        {                  
            
            // ======= 第一層的不動作 (表單類別) =======
            if(node.get_level()==0)
            {	        
                oEvent.set_cancel(true);
            }
         }
    }
    
    function treeFormList_NodeCollapse(treeId, nodeId)
    {
        igtree_getTreeById(treeId).CancelPostBack=true;
    }

    function treeFormList_NodeExpand(treeId, nodeId)
    {
        igtree_getTreeById(treeId).CancelPostBack=true;
    }

</script>
<asp:Label ID="lblSearch" runat="server" Text="表單名稱" meta:resourcekey="lblSearchResource1"></asp:Label>
<table style="width: 100%">
    <tr>
        <td style="width: 100%">
            <asp:TextBox ID="txtSearch" runat="server" Width="100%" placeholder="" CssClass="SearchBoxMargin"></asp:TextBox>

        </td>
        <td>
            <telerik:RadButton ID="btnSearh" runat="server" AutoPostBack="false" OnClientClicked="Search">

                <Icon PrimaryIconUrl="~/Common/Images/Icon/icon_m39.png" PrimaryIconLeft="2px" />
            </telerik:RadButton>
        </td>

    </tr>
    <tr>
        <td colspan="2">
            <table>
                <tr>
                    <td>
                        <div id="divExpand" style="cursor: pointer" onclick="ExpandAllNodes()" runat="server">
                                <img id="imgExpand" src="<%=ResolveUrl("~/Common/Images/Icon/icon_m209.png")%>" style="margin-left:5px;margin-bottom:3px"/>
                                <asp:Label ID="lblExpand" runat="server" Text="展開" meta:resourcekey="lblExpandResource1"></asp:Label>
                            </div>
                    </td>
                    <td>
                        <div id="divCollapse" style="cursor: pointer" onclick="CollapseAllNodes()" runat="server">
                                <img id="imgCollapse" src="<%=ResolveUrl("~/Common/Images/Icon/icon_m210.png")%>" style="margin-left:5px;margin-bottom:3px"/>
                                <asp:Label ID="lblCollapse" runat="server" Text="收合" meta:resourcekey="lblCollapseResource1"></asp:Label>
                            </div>
                    </td>
                </tr>
            </table>
        </td>
        
    </tr>
</table>

<telerik:RadTreeView ID="treeFormList" runat="server" OnNodeClick="treeFormList_NodeClick" OnClientNodeClicking="treeFormList_NodeClick" CssClass="TreeMargin"></telerik:RadTreeView>
    <asp:Label ID="lblNoForm" runat="server" Text="無可查詢表單" Visible="False" 
    meta:resourcekey="lblNoFormResource1"></asp:Label>

    <asp:HiddenField runat="server" ID="hdnIsNodeSelectionChanged" />
    <asp:HiddenField runat="server" ID="hdnPreSelectedNodeTag" />
