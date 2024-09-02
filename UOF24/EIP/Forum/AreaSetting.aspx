<%@ Page Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="EIP_Forum_AreaSetting" Title="討論區設定" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" Codebehind="AreaSetting.aspx.cs" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <script id="telerikscript" type="text/javascript">
        var firstTime;
        function ReplaceAll(strOrg, strFind, strReplace) {
            var index = 0;
            while (strOrg.indexOf(strFind, index) != -1) {
                strOrg = strOrg.replace(strFind, strReplace);
                index = strOrg.indexOf(strFind, index);
            }

            return strOrg;
        }

        function SetToolbarEnable(enable) {
            var toolbar = $find('<%=RadToolBar1.ClientID %>');
            toolbar.findItemByValue("Create").set_enabled(enable);
            toolbar.findItemByValue("Delete").set_enabled(enable);
        }

        function alertError(result) {
            if (result == null) {
                alert('server error');
                return 0;
            }
            else if (result.indexOf('ServerError') > -1) {
                alert(result.value);
                return 0;
            }
            else if (result.indexOf('Error') > -1) {
                alert(result);
                return 1;
            }
            else {
                return 2;
            }
        }

        function treeRemoveNode(result) {
            var tree = $find("<%= this.RadTreeView1.ClientID %>");
            var node = tree.findNodeByValue(result.request.args["nodeId"]);
            if (alertError(result) == 2) {
                tree.get_nodes().remove(node);
                top.returnValue = "";
            }
            SetToolbarEnable(true);
        }

        function treeAddNode(result) {

            var tree = $find("<%= this.RadTreeView1.ClientID %>");
            var node = tree.findNodeByValue(result.request.args["nodeId"]);
            var flag = alertError(result);
            if (flag == 0) {
                tree.get_nodes().remove(node);
            }
            else if (flag == 1) {
                node.set_value(null);
                setTimeout(function () { node.startEdit(); }, 100);
            }
            else if (flag == 2) {
                node.set_value(result.value);
                top.returnValue = "";
            }

            SetToolbarEnable(true);
        }

        function treeModifyNode(result) {
            var tree = $find("<%= this.RadTreeView1.ClientID %>");
            var node = tree.findNodeByValue(result.request.args["nodeId"]);
            var flag = alertError(result);
            if (flag == 0) {
                node.set_text(result.request.args["folderName"]);
                setTimeout(function () { node.startEdit(); }, 100);
            }
            else if (flag == 1) {
                node.startEdit();
            }
            else if (flag == 2) {
                top.returnValue = "";
            }
            SetToolbarEnable(true);
        }

        function RadToolBar1ButtonClientNodeClicked(sender, args) {
            var node = args.get_node();
            oldText = node.get_text();
            var tree = node.get_treeView();
            if (tree.get_allowNodeEditing() && !node.get_allowEdit()) {
                node.set_allowEdit(true);
            }
        }

        function RadToolBar1ButtonClicking(sender, args) {
            args.set_cancel(true);
            var key = args.get_item().get_value();
            var tree = $find("<%= this.RadTreeView1.ClientID %>");
            var userGuid = $uof.tool.htmlDecode('<%=System.Web.Security.AntiXss.AntiXssEncoder.HtmlEncode(hdUserGuid.Value,true)%>'); 
            switch (key) {
                case "Create":
                    SetToolbarEnable(false);
                    var node = new Telerik.Web.UI.RadTreeNode()
                    node.set_text("New Block");
                    node.set_imageUrl($('#<%=this.hdnNodeImageURL.ClientID %>').val());
                    tree.trackChanges();
                    tree.get_nodes().insert(0, node);
                    node.set_selected(true);
                    node.startEdit();
                    tree.commitChanges();
                    break;
                case "Delete":
                    var node = tree.get_selectedNode();
                    if (node != null) {
                        if (confirm('<%=msgDelconfirm.Text %>')) {
                        SetToolbarEnable(false);
                        var areaID = node.get_value();
                        var deletedate = [areaID, node.get_value(), userGuid];
                        var result = $uof.pageMethod.sync("DeleteArea", deletedate);
                        if (alertError(result) == 2) {
                            tree.get_nodes().remove(node);
                            $uof.dialog.set_returnValue("NeedPostBack");
                        }
                        SetToolbarEnable(true);
                    }
                }
                break;
        }
    }

    function RadTreeView_ClientNodeEditing(sender, args) {

        //Add code to handle your event here.
        var node = args.get_node();
        var text = args.get_newText();
        var tree = $find("<%= this.RadTreeView1.ClientID %>");
        var userGuid = $uof.tool.htmlDecode('<%=System.Web.Security.AntiXss.AntiXssEncoder.HtmlEncode(hdUserGuid.Value,true)%>');  
            if (escape(text) == '%A0' || escape(text) == "") {
                alert('<%=Ede.Uof.Utility.Page.Common.Resource.GetResource("Common","ErrorNotAllowEmpty") %>');
                args.set_cancel(true);
                setTimeout(function () { node.startEdit(); }, 100);
            }
            else {
                if (node.get_value() == null || node.get_value() == "") {//新增   
                    var createdata = [text, node.get_value(), userGuid];
                    var result = $uof.pageMethod.sync("CreateArea", createdata);
                    var flag = alertError(result);
                    if (flag == 0) {
                        tree.get_nodes().remove(node);
                    }
                    else if (flag == 1) {
                        node.set_value(null);
                        args.set_cancel(true);
                        setTimeout(function () { node.startEdit(); }, 100);
                    }
                    else if (flag == 2) {
                        node.set_value(result);
                        $uof.dialog.set_returnValue("NeedPostBack");
                    }
                    SetToolbarEnable(true);
                }
                else {//修改
                    var modifydata = [node.get_value(), text, userGuid];
                    var result = $uof.pageMethod.sync("ModifyAreaName", modifydata);
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
                        //top.returnValue = "";
                    }
                    SetToolbarEnable(true);
                }
            }
        }
    </script>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <asp:CustomValidator ID="CustomValidator1" runat="server" ForeColor="Red" Display="Dynamic" ErrorMessage="請先挑選討論區" meta:resourcekey="CustomValidator1Resource1"></asp:CustomValidator>
            <asp:CustomValidator ID="CustomValidator2" runat="server" ForeColor="Red" Display="Dynamic" ErrorMessage="不允許空白" meta:resourcekey="CustomValidator2Resource1"></asp:CustomValidator>
            <asp:CustomValidator ID="CustomValidator3" runat="server" ForeColor="Red" Display="Dynamic" ErrorMessage="字串超過50個字" meta:resourcekey="CustomValidator3Resource1"></asp:CustomValidator>
            <asp:CustomValidator ID="CustomValidator4" runat="server" ForeColor="Red" Display="Dynamic" ErrorMessage="名稱重複" meta:resourcekey="CustomValidator4Resource1"></asp:CustomValidator>
            <telerik:RadSplitter ID="MainRdSplitter" runat="server" Width="100%" LiveResize="true" ResizeWithBrowserWindow="true" ResizeWithParentPane="true" Orientation="Horizontal" BorderSize="0">
                <telerik:RadPane ID="TopRdPanel" runat="server" Height="35px" Scrolling="None">
                    <telerik:RadToolBar ID="RadToolBar1" runat="server" Width="100%" OnClientButtonClicking="RadToolBar1ButtonClicking">
                        <Items>
                            <telerik:RadToolBarButton runat="server" Text="新增討論區" Value="Create"
                                CheckedImageUrl="~/Common/Images/Icon/icon_m60.gif"
                                DisabledImageUrl="~/Common/Images/Icon/icon_m60.gif"
                                HoveredImageUrl="~/Common/Images/Icon/icon_m60.gif"
                                ImageUrl="~/Common/Images/Icon/icon_m60.gif"
                                meta:resourcekey="RadToolBarCreateResource1">
                            </telerik:RadToolBarButton>
                            <telerik:RadToolBarButton IsSeparator="true"></telerik:RadToolBarButton>
                            <telerik:RadToolBarButton runat="server" Text="刪除" Value="Delete"
                                CheckedImageUrl="~/Common/Images/Icon/icon_m03.gif"
                                DisabledImageUrl="~/Common/Images/Icon/icon_m03.gif"
                                HoveredImageUrl="~/Common/Images/Icon/icon_m03.gif"
                                ImageUrl="~/Common/Images/Icon/icon_m03.gif"
                                meta:resourcekey="RadToolBarDeleteResource1">
                            </telerik:RadToolBarButton>
                            <telerik:RadToolBarButton IsSeparator="true"></telerik:RadToolBarButton>
                        </Items>
                    </telerik:RadToolBar>
                </telerik:RadPane>
                <telerik:RadPane ID="TreeRdPanel" runat="server">
                    <telerik:RadTreeView ID="RadTreeView1" runat="server" AllowNodeEditing="true" EnableNodeTextHtmlEncoding="true" OnClientNodeEditing="RadTreeView_ClientNodeEditing">
                    </telerik:RadTreeView>
                </telerik:RadPane>
            </telerik:RadSplitter>
            <input id="hiddenNodeId" type="hidden" runat="server" />
            <input id="hideStatus" runat="server" type="hidden" /><br />
            <asp:Label ID="msgDelconfirm" runat="server" Text="確定要刪除?" Visible="False" meta:resourcekey="msgDelconfirmResource1"></asp:Label>
            <asp:HiddenField ID="hdnNodeImageURL" runat="server" />
            <asp:HiddenField ID="hdUserGuid" runat="server" />
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
