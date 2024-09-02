<%@ Page Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="Basic_Personal_PrivateMessage_MessageClass" Title="歸檔類別維護" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" Codebehind="MessageClass.aspx.cs" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <script  type="text/javascript">

        function RadToolBar1_ButtonClicking(sender, args)
        {
            args.set_cancel(true);
            var tree = $find("<%= rtvTreeSchClass.ClientID %>");
            var value = args.get_item().get_value();
            if (value == "Create")
            {
                SetToolbarEnable(false);
                var node = new Telerik.Web.UI.RadTreeNode();
                node.set_text("New Class");
                node.set_imageUrl("<%=Request.ApplicationPath %>" + "/Common/Images/Icon/icon_m169.gif");
                tree.trackChanges();
                
                tree.get_nodes().add(node);
                node.set_selected(true);
                node.set_expanded(true);
                node.startEdit();
                tree.commitChanges();

                args.set_cancel(true);
            }
            else if (value == "Delete")
            {
                if(confirm("<%=lblDeleteMsg.Text%>")) {
                    var node = tree.get_selectedNode();
                    if (node != null) {
                        SetToolbarEnable(false);
                        var classGUID = node.get_value();
                        var data = [classGUID, node.get_value()];
                        var result = $uof.pageMethod.sync("DeleteClass", data);
                       
                        if (alertError(result) == 2) {
                            $uof.dialog.set_returnValue("NeedPostBack");
                            node.get_parent().get_nodes().remove(node);
                        }
                        SetToolbarEnable(true);
                    }
                }
                else
                {
                    args.set_cancel(false);
                }
            }
        }

        function SetToolbarEnable(enable)
        {
            var toolbar=$find('<%=RadToolBar1.ClientID %>');    
            toolbar.findItemByValue("Create").set_enabled(enable);
            toolbar.findItemByValue("Delete").set_enabled(enable);
        }

        function alertError(result) {
            if(result==null)
            {
                alert('server error');
                return 0; 
            }
            else if (result.indexOf('ServerError')>-1)
            {
                alert(result);
                return 0; 
            }
            else if (result.indexOf('Error')>-1)
            {
                alert(result);
                return 1; 
            }
            else 
            {            
                top.returnValue = $uof.tool.base64.encode('ScheduleClassManagement');
                return 2; 
            }    
        }

        function onClientNodeClicked(sender, args) {
            var node = args.get_node();
            //when tree set editable, set node editable
            var tree = node.get_treeView();
            if (tree.get_allowNodeEditing() && !node.get_allowEdit()) {
                node.set_allowEdit(true);
            }
        }

        function classTreeClientNodeEditing(sender, args) {
            var tree = $find("<%= rtvTreeSchClass.ClientID %>");
            var node = args.get_node();
            if (node.get_level() == 0) {
                node.set_allowEdit(false);
            }

            var text = args.get_newText();
            if (escape(text) == '%A0') {
                alert('<%=Ede.Uof.Utility.Page.Common.Resource.GetResource("Common","ErrorNotAllowEmpty") %>!');
                setTimeout(function () { node.startEdit(); }, 100);
            }
            else {
                var classGUID = node.get_value();
                if (classGUID == null || classGUID == "") {
                    var owner = '<%=hideOwner.Value %>';
                    var type = '<%= hideScheduleType.Value %>';
                    var data = [owner, text, type, node.get_value()];
                    var result = $uof.pageMethod.sync("CreateClass", data);
             
                    var flag = alertError(result);
                    if (flag == 0) {
                        node.get_parent().get_nodes().remove(node);
                    }
                    else if (flag == 1) {
                        node.set_value(null);
                        args.set_cancel(true);
                        setTimeout(function () { node.startEdit(); }, 100);
                    }
                    else if (flag == 2) {
                        $uof.dialog.set_returnValue("NeedPostBack");
                        node.set_value(result);
                    }

                    SetToolbarEnable(true);
                }
                else {
                    var data = [classGUID, text, node.get_value()];
                    var result = $uof.pageMethod.sync("ChangeClassName", data);
                   
                    var flag = alertError(result);
                    if (flag == 0) {
                        node.set_text(node.get_text());
                        args.set_cancel(true);
                    }
                    else if (flag == 1) {
                        args.set_cancel(true);
                        setTimeout(function () { node.startEdit(); }, 100);
                    }
                    else if (flag == 2) {
                        $uof.dialog.set_returnValue("NeedPostBack");
                    }
                    SetToolbarEnable(true);
                }
            }	
        }

        function classTreeClientNodeEdited(sender, args) {
            var node = args.get_node();

            if (node.get_level() == 0) {
                node.set_allowEdit(false);
            }
        }
</script>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <telerik:RadSplitter ID="MasterRdSplitter" runat="server" Width="100%" LiveResize="true" ResizeWithBrowserWindow="true" ResizeWithParentPane="true" Orientation="Horizontal" BorderSize="0">
                <telerik:RadPane ID="TopRdPanel" runat="server" Height="35px" Scrolling="None">
                      <telerik:RadToolBar ID="RadToolBar1" runat="server" Width="100%" OnClientButtonClicking="RadToolBar1_ButtonClicking" meta:resourcekey="RadToolBar1Resource1">
        <Items>
            <telerik:RadToolBarButton runat="server" Text="新增類別" Value="Create"
                 ClickedImageUrl="~/Common/Images/Icon/icon_m170.gif" DisabledImageUrl="~/Common/Images/Icon/icon_m170.gif"
                 HoveredImageUrl="~/Common/Images/Icon/icon_m170.gif" ImageUrl="~/Common/Images/Icon/icon_m170.gif" meta:resourcekey="RadToolBarButtonResource1">
            </telerik:RadToolBarButton>
            <telerik:RadToolBarButton runat="server" IsSeparator="true" meta:resourcekey="RadToolBarButtonResource2">
            </telerik:RadToolBarButton>
            <telerik:RadToolBarButton runat="server" Text="刪除類別" Value="Delete"
                 ClickedImageUrl="~/Common/Images/Icon/icon_m03.gif" DisabledImageUrl="~/Common/Images/Icon/icon_m03.gif"
                 HoveredImageUrl="~/Common/Images/Icon/icon_m03.gif" ImageUrl="~/Common/Images/Icon/icon_m03.gif" meta:resourcekey="RadToolBarButtonResource3">
            </telerik:RadToolBarButton>
            <telerik:RadToolBarButton runat="server" IsSeparator="true" meta:resourcekey="RadToolBarButtonResource4">
            </telerik:RadToolBarButton>
        </Items>
    </telerik:RadToolBar>
                </telerik:RadPane>
                <telerik:RadPane ID="TreeRdPanel" runat="server">
                        <asp:CustomValidator ID="cvClassNameExists" runat="server" ErrorMessage="名稱重覆" 
        Display="Dynamic" meta:resourcekey="cvClassNameExistsResource1" ></asp:CustomValidator>
    <asp:CustomValidator ID="cvNameEmpty" runat="server" ErrorMessage="名稱不允許空白" 
        Display="Dynamic" meta:resourcekey="cvNameEmptyResource1" ></asp:CustomValidator><br />
    <telerik:RadTreeView ID="rtvTreeSchClass" AllowNodeEditing="True"  runat="server"  EnableNodeTextHtmlEncoding="true"
    OnClientNodeEditing="classTreeClientNodeEditing"
    OnClientNodeEdited="classTreeClientNodeEdited" 
    OnClientNodeClicked="onClientNodeClicked" meta:resourcekey="rtvTreeSchClassResource1">
    </telerik:RadTreeView>
                </telerik:RadPane>
            </telerik:RadSplitter>
                <asp:Label ID="lblClassNameNeeded" runat="server" Text="請輸入類別名稱"  Visible="False" meta:resourcekey="lblClassNameNeededResource1" ></asp:Label>
    <input id="hideOwner" type="hidden" runat="server"/>
    <input id="hideScheduleType" type="hidden" runat="server" />
    <input id="hideIsUpdate" type="hidden" value="false" runat="server"/>
    <input id="hiddNodeId" type="hidden" runat="server" />
    <asp:Label ID="lblDeleteMsg" runat="server" Text="確定要刪除?" Visible="False" meta:resourcekey="lblDeleteMsgResource1"></asp:Label>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
