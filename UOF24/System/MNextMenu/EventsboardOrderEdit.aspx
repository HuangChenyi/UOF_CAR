<%@ Page Title="" Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" CodeBehind="EventsboardOrderEdit.aspx.cs" Inherits="System_MNextMenu_EventsboardOrderEdit" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <style type="text/css">
        
        /* node前面圖片的style */
        .rtImg 
        {
            width: 2.5em !important;
            height: 2em !important;
            border-radius: 20%;
        }

        
        /* 拖拉node後維持cursor */
        {
            cursor: pointer !important;
        }

        /* node彼此間的間距加大 */
        .RadTreeView .rtLI 
        {
            padding-bottom: 0.5em;
        }
        .RadTreeView .rtFirst 
        {
            padding-top: 0.5em;
        }

        /* 拖拉時，node間的分隔線position調整 */
        .rtDropAbove
        {
            margin-top: -4px;
        }
        .rtDropBelow
        {
            margin-top: 4px; 
        }

        .status-publish {
            color: blue;
        }

        .status-expire {
            color: red;
        }
    
    </style>

    <script type="text/javascript">

        // 拖拉node時，丟下node的事件
        function rtvEvents_ClientNodeDropping(sender, args) {
            var sourceNode = args.get_sourceNode();
            
            if (args.get_destNode() != null) {
                var destNodeIdx = args.get_destNode().get_index();

                var eventsTreeView = $find("<%= rtvEvents.ClientID %>");

                // 選取node的 Value (Events Guid)
                var sourceNodeValue = sourceNode.get_value();

                // 開始交換位子
                ChangeNode(eventsTreeView, sourceNode, destNodeIdx);

                // 重新選取換位子後的node
                var newPositonNode = eventsTreeView.findNodeByValue(sourceNodeValue);
                newPositonNode.select();

                // 判斷上移下移按鈕反灰與否
                CheckNodePosition(destNodeIdx, eventsTreeView.get_nodes().get_count() - 1);
            }
        }

        // 拖拉node時，點按開始拖曳的事件
        function rtvEvents_ClientNodeDragStart(sender, args) {
            var sourceNode = args.get_node();

            var eventsTreeView = $find("<%= rtvEvents.ClientID %>");

            // 判斷上移下移按鈕反灰與否
            CheckNodePosition(sourceNode.get_index(), eventsTreeView.get_nodes().get_count() - 1);
        }

        function rtvEvents_ClientNodeClicking(sender, args) {
            var eventsTreeView = $find("<%= rtvEvents.ClientID %>");

            // 判斷上移下移按鈕反灰與否
            CheckNodePosition(args.get_node().get_index(), eventsTreeView.get_nodes().get_count() - 1);
        }

        // 上移下移按鈕事件
        function rtbEvents_ClientButtonClicking(sender, args) {
            if (args.get_item().get_value() == "moveup") {
                MoveNodeLogic('moveup');
            }
            else if (args.get_item().get_value() == "movedown") {
                MoveNodeLogic('movedown');
            }
        }

        // 上移、下移node邏輯
        function MoveNodeLogic(actionType) {

            // tree view物件
            var eventsTreeView = $find("<%=rtvEvents.ClientID %>");

            // 選取到得node
            var selectedNode = eventsTreeView.get_selectedNode();

            // 判斷是否有選取node
            if (selectedNode != null) {

                // 選取node的 Value (Events Guid)
                var sourceNodeValue = eventsTreeView.get_selectedNode().get_value();

                // 跟去上移或下移，決定目標位置的index
                var destNodeIdx = actionType == 'moveup' ? eventsTreeView.get_selectedNode().get_index() - 1 : eventsTreeView.get_selectedNode().get_index() + 1;

                // 開始交換位子
                ChangeNode(eventsTreeView, selectedNode, destNodeIdx);

                // 重新選取換位子後的node
                var newSelectesNode = eventsTreeView.findNodeByValue(sourceNodeValue);
                newSelectesNode.select();

                // 判斷上移下移按鈕反灰與否
                CheckNodePosition(newSelectesNode.get_index(), eventsTreeView.get_nodes().get_count() - 1)
            }
        }

        // 判斷選取的node位置，決定上移跟下移按鈕是否要反灰
        function CheckNodePosition(nowIndex, lastIndex) {
            var eventsToolbar = $find("<%=rtbEvents.ClientID %>");
            var moveupBtn = eventsToolbar.findItemByValue("moveup");
            var movedownBtn = eventsToolbar.findItemByValue("movedown");

            if (nowIndex == 0 && nowIndex != lastIndex) {
                moveupBtn.disable();
                movedownBtn.enable();
            }
            else if (nowIndex != 0 && nowIndex == lastIndex) {
                moveupBtn.enable();
                movedownBtn.disable();
            }
            else if (nowIndex == 0 && nowIndex == lastIndex) {
                moveupBtn.disable();
                movedownBtn.disable();
            }
            else {
                moveupBtn.enable();
                movedownBtn.enable();
            }
        }

        // 變換node位置
        function ChangeNode(eventsTreeView, selectedNode, destNodeIdx) {
            eventsTreeView.trackChanges();
            eventsTreeView.get_nodes().remove(selectedNode);
            eventsTreeView.get_nodes().insert(destNodeIdx, selectedNode);
            eventsTreeView.commitChanges();
        }


    </script>

    <asp:UpdatePanel ID="UpdatePanel1" runat="server" >
        <ContentTemplate>
            <telerik:RadSplitter ID="RadSplitter1" runat="server" Width="100%" LiveResize="True" Orientation="Horizontal" BorderSize="0" meta:resourcekey="RadSplitter1Resource1" PanesBorderSize="0" SplitBarsSize="">
                <telerik:RadPane ID="TopRadPane" runat="server" Height="35px" Scrolling="None" Index="0" meta:resourcekey="TopRadPaneResource1">
                    <telerik:RadToolBar ID="rtbEvents" OnClientButtonClicking="rtbEvents_ClientButtonClicking" runat="server" Width="100%" meta:resourcekey="rtbEventsResource1" SingleClick="None">
                        <Items>
                            <telerik:RadToolBarButton runat="server" HoveredImageUrl="~/Common/Images/Icon/icon_m113.gif"
                                ImageUrl="~/Common/Images/Icon/icon_m113.gif" Value="moveup" CheckedImageUrl="~/Common/Images/Icon/icon_m113.gif"
                                Text="上移" Enabled="False" meta:resourcekey="RadToolBarButtonResource1">
                            </telerik:RadToolBarButton>
                            <telerik:RadToolBarButton runat="server" IsSeparator="True" meta:resourcekey="RadToolBarButtonResource2"></telerik:RadToolBarButton>
                            <telerik:RadToolBarButton runat="server" HoveredImageUrl="~/Common/Images/Icon/icon_m114.gif"
                                ImageUrl="~/Common/Images/Icon/icon_m114.gif" Value="movedown" CheckedImageUrl="~/Common/Images/Icon/icon_m114.gif"
                                Text="下移" meta:resourcekey="RadToolBarButtonResource3">
                            </telerik:RadToolBarButton>
                            <telerik:RadToolBarButton runat="server" IsSeparator="True" meta:resourcekey="RadToolBarButtonResource4"></telerik:RadToolBarButton>
                            <telerik:RadToolBarButton runat="server" meta:resourcekey="RadToolBarButtonResource5">
                                <ItemTemplate>
                                    <asp:Label ID="lblDragToOrder" runat="server" Text="*拖拉名稱也可排序" ForeColor="Blue" meta:resourcekey="lblDragToOrderResource1"></asp:Label>
                                </ItemTemplate>
                            </telerik:RadToolBarButton>
                        </Items>
                    </telerik:RadToolBar>
                </telerik:RadPane>

                <telerik:RadPane ID="TreeRadPane" runat="server" Index="1" meta:resourcekey="TreeRadPaneResource1">
                    <telerik:RadTreeView ID="rtvEvents" OnClientNodeDropping="rtvEvents_ClientNodeDropping" 
                                                        OnClientNodeDragStart="rtvEvents_ClientNodeDragStart"
                                                        OnClientNodeClicking="rtvEvents_ClientNodeClicking"
                                                        EnableDragAndDrop="True" 
                                                        EnableDragAndDropBetweenNodes="True" 
                                                        EnableNodeTextHtmlEncoding="True"
                                                        runat="server" meta:resourcekey="rtvEventsResource1">
                    </telerik:RadTreeView>
                </telerik:RadPane>

            </telerik:RadSplitter>

        </ContentTemplate>
    </asp:UpdatePanel>

    <asp:Label ID="lblPublish" runat="server" Text="已上架" Visible="False" meta:resourcekey="lblPublishResource1"></asp:Label>
    <asp:Label ID="lblWaiting" runat="server" Text="待上架" Visible="False" meta:resourcekey="lblWaitingResource1"></asp:Label>
    <asp:Label ID="lblExpire" runat="server" Text="已下架" Visible="False" meta:resourcekey="lblExpireResource1"></asp:Label>
</asp:Content>
