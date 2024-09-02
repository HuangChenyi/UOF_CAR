<%@ Page Title="" Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="EIP_Album_Admin_MaintainAlbumClass" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" CodeBehind="MaintainAlbumClass.aspx.cs" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<%@ Register Src="~/Common/ChoiceCenter/UC_ChoiceList.ascx" TagPrefix="uc1" TagName="UC_ChoiceList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <script type="text/javascript">
        var prm = Sys.WebForms.PageRequestManager.getInstance();
        prm.add_pageLoaded(pageLoaded);

        function pageLoaded(sender, args) {            
          var state = $uof.tool.htmlDecode('<%=System.Web.Security.AntiXss.AntiXssEncoder.HtmlEncode(Request.QueryString["state"],true)%>');
          if (state === "treeSetting") {
                var toolbar = $find("<%=RadToolBar1.ClientID%>");
                var tree = $find("<%= this.albumTree.ClientID %>");
                console.log(tree);                
                var treeNode = tree.get_selectedNode();
                var isManager = treeNode.get_attributes().getAttribute("IsManager");

                //判斷是否為管理者
                if (toolbar != null && treeNode != null && isManager == "true") {
                    {
                        toolbar.findItemByValue("Insert").set_enabled(true);
                        toolbar.findItemByValue("Delete").set_enabled(true);

                        if (treeNode.get_nextSibling() != null) {
                            toolbar.findItemByValue("movedown").set_enabled(true);
                        }
                        else {
                            toolbar.findItemByValue("movedown").set_enabled(false);
                        }

                        if (treeNode.get_previousSibling()) {
                            toolbar.findItemByValue("moveup").set_enabled(true);
                        }
                        else {
                            toolbar.findItemByValue("moveup").set_enabled(false);
                        }
                    }
                }
                else {
                    toolbar.findItemByValue("Insert").set_enabled(false);
                    toolbar.findItemByValue("Delete").set_enabled(false);
                    toolbar.findItemByValue("movedown").set_enabled(false);
                    toolbar.findItemByValue("moveup").set_enabled(false);
                }
            }
        }

        function checkNodePostion(treeNode) {
            var isManager = treeNode.get_attributes().getAttribute("IsManager");
            if (treeNode != null && isManager == "true") {
                var toolbar = $find("<%=RadToolBar1.ClientID%>");
                if (toolbar != null) {
                    if (treeNode.get_nextSibling() != null) {
                        toolbar.findItemByValue("movedown").set_enabled(true);
                    }
                    else {
                        toolbar.findItemByValue("movedown").set_enabled(false);
                    }

                    if (treeNode.get_previousSibling()) {
                        toolbar.findItemByValue("moveup").set_enabled(true);
                    }
                    else {
                        toolbar.findItemByValue("moveup").set_enabled(false);
                    }
                }
            }
        }

        function RadToolBar1_ButtonClicking(sender, args) {
            var value = args.get_item().get_value();
            var tree = $find("<%= this.albumTree.ClientID %>");
           var node = tree.get_selectedNode();
           if (value == "Delete") {
               args.set_cancel(!confirm('<%= lblDelete.Text %>'));
           }
       }

       function albumTreeClientNodeDragStart(sender, args) {
           var node = args.get_node();
           $("#<%=hiddenDropSourceNode.ClientID %>").val(node.get_value());
          $("#<%=hiddenNodeId.ClientID %>").val(node.get_attributes().getAttribute("CLASS_GUID"));

          if (sender.get_allowNodeEditing()) {
              node.set_allowEdit(false);
          }
      }

      function albumTreeClientNodeEditing(sender, args) {
          var node = args.get_node();
          if (node.get_level() == 0) {
              node.set_allowEdit(false);
          }
      }

      function albumTreeClientNodeEdited(sender, args) {

          var node = args.get_node();
          if (node.get_level() == 0) {
              node.set_allowEdit(false);
          }
      }

      function albumTreeClientNodeClicked(sender, args) {

          var node = args.get_node();
          $("#<%=hiddenNodeId.ClientID %>").val(node.get_attributes().getAttribute("CLASS_GUID"));
            checkNodePostion(node);
        }
    </script>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server" RenderMode="Inline" UpdateMode="Conditional">
        <ContentTemplate>
            <table style="width: 100%">
                <tr>
                    <td id="tdTreeManagerSetting" runat="server" style="width: 50%; height: 500px">
                        <telerik:RadSplitter ID="MasterRdSplitter" Height="100%" runat="server" Width="100%" LiveResize="True" Orientation="Horizontal" BorderSize="0" FullScreenMode="True" meta:resourcekey="MasterRdSplitterResource1" PanesBorderSize="0" SplitBarsSize="">
                            <telerik:RadPane ID="TopRdPanel" runat="server" Height="35px" Scrolling="None" Index="0" meta:resourcekey="TopRdPanelResource1">
                                <telerik:RadToolBar ID="RadToolBar1" runat="server" Width="100%" OnClientButtonClicking="RadToolBar1_ButtonClicking" OnButtonClick="RadToolBar1_ButtonClick" meta:resourcekey="RadToolBar1Resource1" SingleClick="None">
                                    <Items>
                                        <telerik:RadToolBarButton runat="server" Text="新增類別" Value="Insert"
                                            ClickedImageUrl="~/Common/Images/Icon/icon_j21.gif" DisabledImageUrl="~/Common/Images/Icon/icon_j21.gif"
                                            HoveredImageUrl="~/Common/Images/Icon/icon_j21.gif" ImageUrl="~/Common/Images/Icon/icon_j21.gif" meta:resourcekey="RadToolBarButtonResource1">
                                        </telerik:RadToolBarButton>
                                        <telerik:RadToolBarButton runat="server" IsSeparator="True" meta:resourcekey="RadToolBarButtonResource2">
                                        </telerik:RadToolBarButton>
                                        <telerik:RadToolBarButton runat="server" Text="刪除類別" Value="Delete"
                                            ClickedImageUrl="~/Common/Images/Icon/icon_j22.gif" DisabledImageUrl="~/Common/Images/Icon/icon_j22.gif"
                                            HoveredImageUrl="~/Common/Images/Icon/icon_j22.gif" ImageUrl="~/Common/Images/Icon/icon_j22.gif" meta:resourcekey="RadToolBarButtonResource3">
                                        </telerik:RadToolBarButton>
                                        <telerik:RadToolBarButton runat="server" IsSeparator="True" meta:resourcekey="RadToolBarButtonResource4">
                                        </telerik:RadToolBarButton>
                                        <telerik:RadToolBarButton runat="server" Text="上移" Value="moveup"
                                            ClickedImageUrl="~/Common/Images/Icon/icon_m113.gif" DisabledImageUrl="~/Common/Images/Icon/icon_m113.gif"
                                            HoveredImageUrl="~/Common/Images/Icon/icon_m113.gif" ImageUrl="~/Common/Images/Icon/icon_m113.gif" meta:resourcekey="RadToolBarButtonResource5">
                                        </telerik:RadToolBarButton>
                                        <telerik:RadToolBarButton runat="server" IsSeparator="True" meta:resourcekey="RadToolBarButtonResource6">
                                        </telerik:RadToolBarButton>
                                        <telerik:RadToolBarButton runat="server" Text="下移" Value="movedown"
                                            ClickedImageUrl="~/Common/Images/Icon/icon_m114.gif" DisabledImageUrl="~/Common/Images/Icon/icon_m114.gif"
                                            HoveredImageUrl="~/Common/Images/Icon/icon_m114.gif" ImageUrl="~/Common/Images/Icon/icon_m114.gif" meta:resourcekey="RadToolBarButtonResource7">
                                        </telerik:RadToolBarButton>
                                        <telerik:RadToolBarButton runat="server" IsSeparator="True" meta:resourcekey="RadToolBarButtonResource8">
                                        </telerik:RadToolBarButton>
                                    </Items>
                                </telerik:RadToolBar>
                            </telerik:RadPane>
                            <telerik:RadPane ID="TreeRdPanel" runat="server" Scrolling="Y" Index="1" meta:resourcekey="TreeRdPanelResource1">
                                <telerik:RadTreeView ID="albumTree" runat="server" AllowNodeEditing="True" EnableDragAndDrop="True" Height="100%" Width="100%"
                                    OnClientNodeDragStart="albumTreeClientNodeDragStart"
                                    OnClientNodeEditing="albumTreeClientNodeEditing"
                                    OnClientNodeEdited="albumTreeClientNodeEdited"
                                    OnClientNodeClicked="albumTreeClientNodeClicked"
                                    OnNodeEdit="albumTree_NodeEdit" OnNodeDrop="albumTree_NodeDrop"
                                    OnNodeClick="albumTree_NodeClick" meta:resourcekey="albumTreeResource1">
                                </telerik:RadTreeView>
                            </telerik:RadPane>
                        </telerik:RadSplitter>

                    </td>
                    <td id="tdClassManagerSetting" runat="server" style="height: 100%; width: 50%">
                        <div id="divClassManagerSetting" runat="server">
                            <telerik:RadToolBar ID="RadToolBar2" runat="server" Width="100%" OnButtonClick="RadToolBar2_ButtonClick" meta:resourcekey="RadToolBar2Resource1" SingleClick="None">
                                <Items>
                                    <telerik:RadToolBarButton runat="server" Text="儲存" Value="save"
                                        ClickedImageUrl="~/Common/Images/Icon/icon_m66.png" DisabledImageUrl="~/Common/Images/Icon/icon_m66.png"
                                        HoveredImageUrl="~/Common/Images/Icon/icon_m66.png" ImageUrl="~/Common/Images/Icon/icon_m66.png" meta:resourcekey="RadToolBarButtonResource9">
                                    </telerik:RadToolBarButton>
                                    <telerik:RadToolBarButton runat="server" Value="HadSave" meta:resourcekey="RadToolBarButtonResource10">
                                        <ItemTemplate>
                                            <asp:Label ID="lblSaveMsg" runat="server" Text="儲存完成" ForeColor="Blue" Visible="False" meta:resourcekey="lblSaveMsgResource1"></asp:Label>
                                        </ItemTemplate>
                                    </telerik:RadToolBarButton>
                                </Items>
                            </telerik:RadToolBar>
                            <table style="width: 100%" class="PopTable">
                                <tr>
                                    <td style="width: 30%;">
                                        <asp:Label ID="lblClass" runat="server" Text="類別" meta:resourcekey="lblClassResource1"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:Label ID="lblClassPath" runat="server" meta:resourcekey="lblClassPathResource1"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 30%; white-space: nowrap;">
                                        <asp:Label ID="lblSetClassManager" runat="server" Text="類別管理員" meta:resourcekey="lblSetClassManagerResource1"></asp:Label>
                                    </td>
                                    <td style="white-space: nowrap;">
                                        <asp:CheckBox ID="ckbClassManager" runat="server" Text="同步修改到子類別" meta:resourcekey="ckbClassManagerResource1" />
                                        <asp:UpdatePanel runat="server" ID="testupdatepanel" UpdateMode="Conditional">
                                            <ContentTemplate>
                                                <uc1:UC_ChoiceList runat="server" ID="UC_ClassManagerList" />
                                            </ContentTemplate>
                                        </asp:UpdatePanel>
                                        <asp:Label ID="lblmsg" runat="server" Text="註：具有類別管理員權限的人員，可同時維護該類別與子類別的設定。" ForeColor="Blue" meta:resourcekey="lblmsgResource1"></asp:Label>
                                    </td>
                                </tr>
                            </table>
                        </div>
                        <asp:Label ID="lblUserLevel" runat="server" Text="此類別無使用權限" ForeColor="Blue" Visible="False" meta:resourcekey="lblUserLevelResource1"></asp:Label>
                    </td>
                </tr>
            </table>
            <input id="hiddenDropSourceNode" runat="server" type="hidden" />
            </input>
            <input id="hiddenNodeId" runat="server" type="hidden"/></input>
            <asp:HiddenField ID="hfCurrentUser" runat="server" />
            <asp:HiddenField ID="hfCurrentRole" runat="server" />
        </ContentTemplate>
    </asp:UpdatePanel>

    <asp:Label ID="lblDeleteRoot" runat="server" Text="不可刪除根節點" Visible="False" meta:resourcekey="lblDeleteRootResource1"></asp:Label>
    <asp:Label ID="lblSelectedMove" runat="server" Text="請選擇要搬移的類別名稱" Visible="False" meta:resourcekey="lblSelectedMoveResource1"></asp:Label>
    <asp:Label ID="lblSelectedDelete" runat="server" Text="請選擇要刪除的類別名稱" Visible="False" meta:resourcekey="lblSelectedDeleteResource1"></asp:Label>
    <asp:Label ID="lblTooLong" runat="server" Text="類別名稱不可大於50個字" Visible="False" meta:resourcekey="lblTooLongResource1"></asp:Label>
    <asp:Label ID="lblNotAllowEmpty" runat="server" Text="類別名稱不允許空白" Visible="False" meta:resourcekey="lblNotAllowEmptyResource1"></asp:Label>
    <asp:Label ID="lblNotAllowRepeat" runat="server" Text="類別名稱不允許重覆" Visible="False" meta:resourcekey="lblNotAllowRepeatResource1"></asp:Label>
    <asp:Label ID="lblSelectedClass" runat="server" Text="請選擇要新增的類別名稱" Visible="False" meta:resourcekey="lblSelectedClassResource1"></asp:Label>
    <asp:Label ID="lblRootName" runat="server" Text="相簿類別" Visible="False" meta:resourcekey="lblRootNameResource1"></asp:Label>
    <asp:Label ID="lblDelete" runat="server" Text="確定要刪除嗎?" Visible="False" meta:resourcekey="lblDeleteResource1"></asp:Label>
    <asp:Label ID="lblClassHaveAlbum" runat="server" Text="不允許刪除,該類別底下有相簿存在" Visible="False" meta:resourcekey="lblClassHaveAlbumResource1"></asp:Label>
    <asp:Label ID="lblNotMoveSubClass" runat="server" Text="不允許搬移到子類別上" Visible="False" meta:resourcekey="lblNotMoveSubClassResource1"></asp:Label>
    
</asp:Content>
