<%@ Page Language="C#" MasterPageFile="~/Master/OneColumn.master" AutoEventWireup="true" Inherits="System_Organization_BaseData_Default" Title="基礎資料維護" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" Codebehind="Default.aspx.cs" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ScriptContentPlaceHolder" runat="Server">
    <script type="text/javascript">

        //職級
        function RadToolBar1_ButtonClicking(sender, args) {
            var Key = args.get_item().get_value();

            if (Key == "createRank") {
                //rank由UI即時產生
                args.set_cancel(true);
                var tree = $find('<%=RadTreeRank.ClientID %>');
                var maxRank = tree.get_nodes().get_count() + 1;
                var newNode = new Telerik.Web.UI.RadTreeNode();

                newNode.set_text(maxRank + '');
                newNode.set_value(maxRank + '');
                newNode.set_imageUrl("<%=Request.ApplicationPath %>" + "/Common/Images/Icon/icon_m18.png");
                newNode.get_attributes().setAttribute("sourceTree", "treeRank");
                tree.get_nodes().add(newNode);
                newNode.set_selected(true);
                newNode.scrollIntoView();
            }
            else if (Key == "createTitle") {
                //rank是虛資料, 所以加在rank 16以上的新職級需要先從前端呼叫pageMethod新增, 否則後端抓不到rank
                var tree = $find('<%=RadTreeRank.ClientID %>');
                var parentNode = tree.get_selectedNode();
                if (parentNode != null) {
                    if (parentNode.get_level() == 1) {
                        parentNode = parentNode.get_parent();
                    }
                    var guid = $uof.tool.getNewGuid();
                    $('#<%=hidCurrentRank.ClientID%>').val(guid);
                    var createData = [guid, GetNewNodeName(), parentNode.get_value()];
                    var result = $uof.pageMethod.sync("CreateTitle", createData);

                    if (result == null) {
                        alert("server error");
                        eventArgs.set_cancel(true);
                    }
                    else {
                        if (result.indexOf('Error') > -1) {
                            alert(result);
                            eventArgs.set_cancel(true);
                            node.scrollIntoView();
                        }
                        else {
                            //success
                        }
                    }
                }
                else {
                    alert('<%=lblMessage1.Text %>');
                }
            }
            else if (Key == "delete") {
                var tree = $find('<%=RadTreeRank.ClientID %>');
                var node = tree.get_selectedNode();

                if (node == null) {
                    args.set_cancel(true);
                    return;
                }
                else {
                    var level = node.get_level();
                    if (level == 0) {
                        args.set_cancel(true);
                        return;
                    }

                    if (confirm('<%=lbConfirmDelete.Text %>「' + node.get_text() + '」?') == false)//確定要刪除?
                    {
                        args.set_cancel(true);
                    }
                }
            }
        }

        function GetNewNodeName() {
            var nodeName = 'New Title';
            var maxNum = 0;
            var currentNum = 0;
            var tree = $find("<%= RadTreeRank.ClientID %>");
            var nodes = tree.get_allNodes();
            for (var i = 0; i < nodes.length; i++) {
                if (nodes[i].get_text().length >= nodeName.length) {
                    var b = nodes[i].get_text().substring(nodeName.length);
                    if (nodes[i].get_text().substring(0, nodeName.length) == nodeName) {
                        if (nodes[i].get_text() == nodeName) {
                            currentNum = 1;
                        }
                        else {
                            try {
                                currentNum = parseInt(nodes[i].get_text().substring(nodeName.length));
                            }
                            catch (e) {
                                //ignore
                            }
                        }

                        if (maxNum <= currentNum) {
                            maxNum = currentNum + 1;
                        }
                    }                
                }
            }

            if (maxNum == 0) {
                return nodeName;
            }
            else {
                return nodeName + maxNum;
            }
        }

        function treeRank_ClientLoad(sender, eventArgs) {
            var tree = $find("<%= RadTreeRank.ClientID %>");
            var currentSource = $("#<%= hidCurrentSource.ClientID %>").val();
            var node = tree.get_selectedNode();

            if (node != null && currentSource == node.get_attributes().getAttribute('sourceTree') && $('#<%=hidEdit.ClientID%>').val() == 'true') {
                node.startEdit();
            }
        }

        function Rank_OnClientNodeDragStart(sender, eventArgs) {
            var node = eventArgs.get_node();
            var tree = node.get_treeView();
            var nodes = tree.get_allNodes();
            for (var i = 0; i < nodes.length; i++) {
                nodes[i].endEdit();
            }
        }

        function Rank_OnClientNodeDropping(sender, eventArgs) {
            var tree = $find('<%=RadTreeRank.ClientID %>');
            var sourceNode = eventArgs.get_sourceNode();
            var sourceparentNode = sourceNode.get_parent();
            var targetNode = eventArgs.get_destNode();
            var targetParentNode = targetNode.get_parent();
            if (sourceNode.get_level() == 0 || targetNode.get_level() == 1 || sourceparentNode.get_text() == targetNode.get_text()) {
                eventArgs.set_cancel(true);
            }
            else if (sourceNode.get_attributes().getAttribute('sourceTree') != targetNode.get_attributes().getAttribute('sourceTree')) {
                eventArgs.set_cancel(true);
            }
            else {
                var changeData = [sourceNode.get_value(), sourceNode.get_text(), targetNode.get_value()];
                var result = $uof.pageMethod.sync("ChangeTitleLevel", changeData);

                if (result == null) {
                    alert("server error");
                    eventArgs.set_cancel(true);
                }
                else {
                    if (result.indexOf('Error') > -1) {
                        alert(result);
                        eventArgs.set_cancel(true);
                    }
                    else {
                        //success
                    }
                }
            }
        }

        //職務
        function RadToolBar2_ButtonClicking(sender, args) {
            var Key = args.get_item().get_value();

            if (Key == "createFunc") {

            }
            else if (Key == "delete") {
                var tree = $find('<%=RadTreeFunc.ClientID %>');
                var node = tree.get_selectedNode();

                if (node == null) {
                    args.set_cancel(true);
                    return;
                }
                else {                    
                    if (confirm('<%=lbConfirmDelete.Text %>「' + node.get_text() + '」?') == false)//確定要刪除?
                    {
                        args.set_cancel(true);
                    }
                }         
            }
        }

        function treeFunc_ClientLoad(sender, eventArgs) {
            var tree = $find("<%= RadTreeFunc.ClientID %>");
            var currentSource = $("#<%= hidCurrentSource.ClientID %>").val();
            var node = tree.get_selectedNode();

            if (node != null && currentSource == node.get_attributes().getAttribute('sourceTree') && $('#<%=hidEdit.ClientID%>').val() == 'true') {
                node.startEdit();
            }
        }

        //學歷
        function RadToolBar3_ButtonClicking(sender, args) {
            var Key = args.get_item().get_value();
            if (Key == "createEduc") {

            }
            else if (Key == "delete") {
                var tree = $find('<%=RadTreeEdu.ClientID %>');
                var node = tree.get_selectedNode();

                if (node == null) {
                    args.set_cancel(true);
                    return;
                }
                else {
                    if (confirm('<%=lbConfirmDelete.Text %>「' + node.get_text() + '」?') == false)//確定要刪除?
                    {
                        args.set_cancel(true);
                    }
                }
            }
        }

        function treeEduc_ClientLoad(sender, eventArgs) {
            var tree = $find("<%= RadTreeEdu.ClientID %>");
            var currentSource = $("#<%= hidCurrentSource.ClientID %>").val();
            var node = tree.get_selectedNode();

            if (node != null && currentSource == node.get_attributes().getAttribute('sourceTree') && $('#<%=hidEdit.ClientID%>').val() == 'true') {
                node.startEdit();
            }
        }

        //專長
        function RadToolBar4_ButtonClicking(sender, args) {
            var Key = args.get_item().get_value();

            if (Key == "createType") {

            }
            else if (Key == "createSkill") {
                var tree = $find('<%=RadTreeSkill.ClientID %>');
                var node = tree.get_selectedNode();

                if (node == null) {
                    alert('<%=lblMessage2.Text %>');
                    args.set_cancel(true);
                    return;
                }
            }
            else if (Key == "delete") {
                var tree = $find('<%=RadTreeSkill.ClientID %>');
                var node = tree.get_selectedNode();

                if (node == null) {
                    args.set_cancel(true);
                    return;
                }
                else {
                    var level = node.get_level();
                    if (level == 0) {
                        if (node.get_allNodes().length > 0) {
                            alert('<%=lblMessage3.Text %>');
                            args.set_cancel(true);
                        }
                        else {
                            if (confirm('<%=lbConfirmDelete.Text %>「' + node.get_text() + '」?') == false)//確定要刪除?
                            {
                                args.set_cancel(true);
                            }
                        }
                    }
                    else {
                        if (confirm('<%=lbConfirmDelete.Text %>「' + node.get_text() + '」?') == false)//確定要刪除?
                        {
                            args.set_cancel(true);
                        }
                    }
                }
            }
        }

        function treeSkill_ClientLoad(sender, eventArgs) {
            var tree = $find("<%= RadTreeSkill.ClientID %>");
            var currentSource = $("#<%= hidCurrentSource.ClientID %>").val();
            var node = tree.get_selectedNode();

            if (node != null && currentSource == node.get_attributes().getAttribute('sourceTree') && $('#<%=hidEdit.ClientID%>').val() == 'true') {
                node.startEdit();
            }
        }

        function Skill_OnClientNodeDragStart(sender, eventArgs) {
            var node = eventArgs.get_node();
            var tree = node.get_treeView();
            var nodes = tree.get_allNodes();
            for (var i = 0; i < nodes.length; i++) {
                nodes[i].endEdit();
            }
        }

        function Skill_OnClientNodeDropping(sender, eventArgs) {
            var tree = $find('<%=RadTreeSkill.ClientID %>');
            var sourceNode = eventArgs.get_sourceNode();
            var sourceparentNode = sourceNode.get_parent();
            var targetNode = eventArgs.get_destNode();
            var targetParentNode = targetNode.get_parent();

            if (sourceNode.get_level() == 0 || targetNode.get_level() == 1 || sourceparentNode.get_text() == targetNode.get_text()) {
                eventArgs.set_cancel(true);
            }
            else if (sourceNode.get_attributes().getAttribute('sourceTree') != targetNode.get_attributes().getAttribute('sourceTree')) {
                eventArgs.set_cancel(true);
            }
            else {
                var changeData = [sourceNode.get_value(), sourceNode.get_text(), targetNode.get_value()];
                var result = $uof.pageMethod.sync("ChangeSkillType", changeData);

                if (result == null) {
                    alert("server error");
                    eventArgs.set_cancel(true);
                }
                else {
                    if (result.indexOf('Error') > -1) {
                        alert(result);
                        eventArgs.set_cancel(true);
                    }
                    else {
                        //success
                    }
                }
            }
        }        

    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContentPlaceHolder" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <telerik:RadSplitter ID="MainRadSplitter" runat="server" PanesBorderSize="0" Width="100%" Height="100%" ResizeWithParentPane="True"
                ResizeWithBrowserWindow="True" meta:resourcekey="MainRadSplitterResource1">
                <telerik:RadPane ID="RadPaneRank" runat="server" Scrolling="None" Width="31%" Index="0" meta:resourceKey="RadPaneRankResource1">
                    <telerik:RadSplitter ID="RadSplitterRank" runat="server" Orientation="Horizontal" BorderSize="0" meta:resourceKey="RadSplitterRankResource1">
                        <telerik:RadPane ID="RadPaneRankTop" runat="server" Height="35px" Scrolling="None" Index="0" MinHeight="35" meta:resourceKey="RadPaneRankTopResource1">
                            <telerik:RadToolBar ID="RadToolBar1" runat="server" Width="100%" OnButtonClick="RadToolBar1_ButtonClick" OnClientButtonClicking="RadToolBar1_ButtonClicking" meta:resourceKey="RadToolBar1Resource1">
                                <Items>
                                    <telerik:RadToolBarButton runat="server" HoveredImageUrl="~/Common/Images/Icon/icon_m18.png"
                                        ImageUrl="~/Common/Images/Icon/icon_m18.png" Value="createRank" CheckedImageUrl="~/Common/Images/Icon/icon_m18.png"
                                        Text="新增等級" ToolTip="新增等級" meta:resourcekey="TBarButtonResource7">
                                    </telerik:RadToolBarButton>
                                    <telerik:RadToolBarButton runat="server" IsSeparator="True" meta:resourceKey="RadToolBarButtonResource1">
                                    </telerik:RadToolBarButton>
                                    <telerik:RadToolBarButton runat="server" HoveredImageUrl="~/Common/Images/Icon/icon_m18.png"
                                        ImageUrl="~/Common/Images/Icon/icon_m18.png" Value="createTitle" CheckedImageUrl="~/Common/Images/Icon/icon_m18.png"
                                        Text="新增職級" ToolTip="新增職級" meta:resourcekey="TBarButtonResource8">
                                    </telerik:RadToolBarButton>
                                    <telerik:RadToolBarButton runat="server" IsSeparator="True" meta:resourceKey="RadToolBarButtonResource2">
                                    </telerik:RadToolBarButton>
                                    <telerik:RadToolBarButton runat="server" HoveredImageUrl="~/Common/Images/Icon/icon_m03.png"
                                        ImageUrl="~/Common/Images/Icon/icon_m03.png" Value="delete" CheckedImageUrl="~/Common/Images/Icon/icon_m03.png"
                                        Text="刪除" ToolTip="刪除" meta:resourcekey="TBarButtonResource9">
                                    </telerik:RadToolBarButton>
                                    <telerik:RadToolBarButton runat="server" IsSeparator="True" meta:resourceKey="RadToolBarButtonResource3">
                                    </telerik:RadToolBarButton>
                                </Items>
                            </telerik:RadToolBar>
                        </telerik:RadPane>
                        <telerik:RadPane ID="RadPaneRankTree" runat="server" Index="1" meta:resourceKey="RadPaneRankTreeResource1">
                            <telerik:RadTreeView ID="RadTreeRank" runat="server" AllowNodeEditing="True" EnableDragAndDrop="True"
                                Height="100%" OnClientNodeDragStart="Rank_OnClientNodeDragStart" OnClientNodeDropping="Rank_OnClientNodeDropping" OnNodeDrop="RadTreeRank_NodeDrop"
                                OnNodeEdit="RadTreeRank_NodeEdit" OnClientLoad="treeRank_ClientLoad" meta:resourceKey="RadTreeRankResource1">
                            </telerik:RadTreeView>
                        </telerik:RadPane>
                    </telerik:RadSplitter>
                </telerik:RadPane>
                <telerik:RadPane ID="RadPaneFunc" runat="server" Scrolling="None" Width="19%" meta:resourceKey="RadPaneFuncResource1">
                    <telerik:RadSplitter ID="RadSplitterFunc" runat="server" Orientation="Horizontal" BorderSize="0" meta:resourceKey="RadSplitterFuncResource1" PanesBorderSize="0" SplitBarsSize="">
                        <telerik:RadPane ID="RadPaneFuncTop" runat="server" Height="35px" Scrolling="None" Index="0" MinHeight="35" meta:resourceKey="RadPaneFuncTopResource1">
                            <telerik:RadToolBar ID="RadToolBar2" runat="server" Width="100%" OnButtonClick="RadToolBar2_ButtonClick" OnClientButtonClicking="RadToolBar2_ButtonClicking" meta:resourceKey="RadToolBar2Resource1">
                                <Items>
                                    <telerik:RadToolBarButton runat="server" HoveredImageUrl="~/Common/Images/Icon/icon_m19.png"
                                        ImageUrl="~/Common/Images/Icon/icon_m19.png" Value="createFunc" CheckedImageUrl="~/Common/Images/Icon/icon_m19.png"
                                        Text="新增職務" ToolTip="新增職務" meta:resourcekey="TBarButtonResource10">
                                    </telerik:RadToolBarButton>
                                    <telerik:RadToolBarButton runat="server" IsSeparator="True" meta:resourceKey="RadToolBarButtonResource4">
                                    </telerik:RadToolBarButton>
                                    <telerik:RadToolBarButton runat="server" HoveredImageUrl="~/Common/Images/Icon/icon_m03.png"
                                        ImageUrl="~/Common/Images/Icon/icon_m03.png" Value="delete" CheckedImageUrl="~/Common/Images/Icon/icon_m03.png"
                                        Text="刪除" ToolTip="刪除" meta:resourcekey="TBarButtonResource11">
                                    </telerik:RadToolBarButton>
                                    <telerik:RadToolBarButton runat="server" IsSeparator="True" meta:resourceKey="RadToolBarButtonResource5">
                                    </telerik:RadToolBarButton>
                                </Items>
                            </telerik:RadToolBar>
                        </telerik:RadPane>
                        <telerik:RadPane ID="RadPaneFuncTree" runat="server" meta:resourceKey="RadPaneFuncTreeResource1">
                            <telerik:RadTreeView ID="RadTreeFunc" runat="server" AllowNodeEditing="True" EnableDragAndDrop="false"
                                Height="100%" OnNodeEdit="RadTreeFunc_NodeEdit" OnClientLoad="treeFunc_ClientLoad" meta:resourceKey="RadTreeFuncResource1">
                            </telerik:RadTreeView>
                        </telerik:RadPane>
                    </telerik:RadSplitter>
                </telerik:RadPane>
                <telerik:RadPane ID="RadPaneEdu" runat="server" Scrolling="None" Width="19%" meta:resourceKey="RadPaneEduResource1">
                    <telerik:RadSplitter ID="RadSplitterEdu" runat="server" Orientation="Horizontal" BorderSize="0" meta:resourceKey="RadSplitterEduResource1">
                        <telerik:RadPane ID="RadPaneEduTop" runat="server" Height="35px" Scrolling="None" Index="0" MinHeight="35" meta:resourceKey="RadPaneEduTopResource1">
                            <telerik:RadToolBar ID="RadToolBar3" runat="server" Width="100%" OnButtonClick="RadToolBar3_ButtonClick" OnClientButtonClicking="RadToolBar3_ButtonClicking" meta:resourceKey="RadToolBar3Resource1">
                                <Items>
                                    <telerik:RadToolBarButton runat="server" HoveredImageUrl="~/Common/Images/Icon/icon_m27.png"
                                        ImageUrl="~/Common/Images/Icon/icon_m27.png" Value="createEduc" CheckedImageUrl="~/Common/Images/Icon/icon_m27.png"
                                        Text="新增學歷" ToolTip="新增學歷" meta:resourcekey="TBarButtonResource5">
                                    </telerik:RadToolBarButton>
                                    <telerik:RadToolBarButton runat="server" IsSeparator="True" meta:resourceKey="RadToolBarButtonResource6">
                                    </telerik:RadToolBarButton>
                                    <telerik:RadToolBarButton runat="server" HoveredImageUrl="~/Common/Images/Icon/icon_m03.png"
                                        ImageUrl="~/Common/Images/Icon/icon_m03.png" Value="delete" CheckedImageUrl="~/Common/Images/Icon/icon_m03.png"
                                        Text="刪除" ToolTip="刪除" meta:resourcekey="TBarButtonResource6">
                                    </telerik:RadToolBarButton>
                                    <telerik:RadToolBarButton runat="server" IsSeparator="True" meta:resourceKey="RadToolBarButtonResource7">
                                    </telerik:RadToolBarButton>
                                </Items>
                            </telerik:RadToolBar>
                        </telerik:RadPane>
                        <telerik:RadPane ID="RadPaneEduTree" runat="server" meta:resourceKey="RadPaneEduTreeResource1">
                            <telerik:RadTreeView ID="RadTreeEdu" runat="server" AllowNodeEditing="True" EnableDragAndDrop="false"
                                Height="100%" OnNodeEdit="RadTreeEdu_NodeEdit" OnClientLoad="treeEduc_ClientLoad" meta:resourceKey="RadTreeEduResource1">
                            </telerik:RadTreeView>
                        </telerik:RadPane>
                    </telerik:RadSplitter>
                </telerik:RadPane>
                <telerik:RadPane ID="RadPaneSkill" runat="server" Scrolling="None" Width="31%" meta:resourceKey="RadPaneSkillResource1">
                    <telerik:RadSplitter ID="RadSplitterSkill" runat="server" Orientation="Horizontal" BorderSize="0" meta:resourceKey="RadSplitterSkillResource1">
                        <telerik:RadPane ID="RadPaneSkillTop" runat="server" Height="35px" Scrolling="None" MinHeight="35" meta:resourceKey="RadPaneSkillTopResource1">
                            <telerik:RadToolBar ID="RadToolBar4" runat="server" Width="100%" OnButtonClick="RadToolBar4_ButtonClick" OnClientButtonClicking="RadToolBar4_ButtonClicking" meta:resourceKey="RadToolBar4Resource1">
                                <Items>
                                    <telerik:RadToolBarButton runat="server" HoveredImageUrl="~/Common/Images/Icon/icon_m07.png"
                                        ImageUrl="~/Common/Images/Icon/icon_m07.png" Value="createType" CheckedImageUrl="~/Common/Images/Icon/icon_m07.png"
                                        Text="新增類別" ToolTip="新增類別" meta:resourcekey="TBarButtonResource12">
                                    </telerik:RadToolBarButton>
                                    <telerik:RadToolBarButton runat="server" IsSeparator="True" meta:resourceKey="RadToolBarButtonResource8">
                                    </telerik:RadToolBarButton>
                                    <telerik:RadToolBarButton runat="server" HoveredImageUrl="~/Common/Images/Icon/icon_m08.png"
                                        ImageUrl="~/Common/Images/Icon/icon_m08.png" Value="createSkill" CheckedImageUrl="~/Common/Images/Icon/icon_m08.png"
                                        Text="新增專長" ToolTip="新增專長" meta:resourcekey="TBarButtonResource13">
                                    </telerik:RadToolBarButton>
                                    <telerik:RadToolBarButton runat="server" IsSeparator="True" meta:resourceKey="RadToolBarButtonResource9">
                                    </telerik:RadToolBarButton>
                                    <telerik:RadToolBarButton runat="server" HoveredImageUrl="~/Common/Images/Icon/icon_m03.png"
                                        ImageUrl="~/Common/Images/Icon/icon_m03.png" Value="delete" CheckedImageUrl="~/Common/Images/Icon/icon_m03.png"
                                        Text="刪除" ToolTip="刪除" meta:resourcekey="TBarButtonResource14">
                                    </telerik:RadToolBarButton>
                                    <telerik:RadToolBarButton runat="server" IsSeparator="True" meta:resourceKey="RadToolBarButtonResource10">
                                    </telerik:RadToolBarButton>
                                </Items>
                            </telerik:RadToolBar>
                        </telerik:RadPane>
                        <telerik:RadPane ID="RadPaneSkillTree" runat="server" meta:resourceKey="RadPaneSkillTreeResource1">
                            <telerik:RadTreeView ID="RadTreeSkill" runat="server" AllowNodeEditing="True" EnableDragAndDrop="True"
                                Height="100%" OnClientNodeDragStart="Skill_OnClientNodeDragStart" OnClientNodeDropping="Skill_OnClientNodeDropping" OnNodeDrop="RadTreeSkill_NodeDrop"
                                OnNodeEdit="RadTreeSkill_NodeEdit" OnClientLoad="treeSkill_ClientLoad" meta:resourceKey="RadTreeSkillResource1">
                            </telerik:RadTreeView>
                        </telerik:RadPane>
                    </telerik:RadSplitter>
                </telerik:RadPane>
            </telerik:RadSplitter>
            <asp:HiddenField runat="server" ID="hidEdit" />
            <asp:HiddenField runat="server" ID="hidCurrentSource" />
            <asp:HiddenField runat="server" ID="hidCurrentRank" />

        </ContentTemplate>
    </asp:UpdatePanel>

    <asp:Label ID="lblMessage4" runat="server" Text="系統預設職務,不允許刪除" Visible="False" meta:resourcekey="lblMessage4Resource1"></asp:Label>
    <asp:Label ID="lblMessage3" runat="server" Text="請先刪除專長,再刪除類別" Visible="False" meta:resourcekey="lblMessage3Resource1"></asp:Label>
    <asp:Label ID="lblMessage2" runat="server" Text="請先選擇類別" Visible="False" meta:resourcekey="lblMessage2Resource1"></asp:Label>
    <asp:Label ID="lblMessage1" runat="server" Text="請先選擇等級" Visible="False" meta:resourcekey="lblMessage1Resource1"></asp:Label>
    <asp:Label ID="lbConfirmDelete" runat="server" Text="確定要刪除" Visible="False" meta:resourcekey="lbConfirmDeleteResource1"></asp:Label>
    <asp:Label ID="lblNotAllowEmpty" runat="server" Text="不允許空白！" Visible="False" meta:resourcekey="lblNotAllowEmptyResource1"></asp:Label>
</asp:Content>
