<%@ Page Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="EIP_Calendar_Common_ScheduleClass" Title="" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" Codebehind="ScheduleClass.aspx.cs" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <script id="js" type="text/javascript">
    function RadToolBar1_ScheduleClass_ButtonClicking(sender, args) {
        var Key = args.get_item().get_value();

        args.set_cancel(true);
        var tree = $find("<%= rtvTreeSchClass.ClientID %>");
            if (Key == "Create") {
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
            else if (Key == "Delete") {

                var node = tree.get_selectedNode();
                if (node != null) {
                    if (!confirm('<%=lblconfirm.Text %>'))
                        args.set_cancel(true);
                    else {
                        SetToolbarEnable(false);
                        var classGUID = node.get_value();
                        var deletedata = [classGUID, node.Id];
                        var result = $uof.pageMethod.sync("DeleteClass", deletedata);
                        if (alertError(result) == 2) {
                            node.get_parent().get_nodes().remove(node);
                        }
                        SetToolbarEnable(true);
                    }
                }
            }
        }

        function SetToolbarEnable(enable) {

            var oToolbar = $find("<%=RadToolBar1.ClientID %>");
            oToolbar.findItemByValue("Create").set_enabled(enable);
            oToolbar.findItemByValue("Delete").set_enabled(enable);
        } // end SetToolbarEnable

        function alertError(result) {
            if (result == null) {
                alert('server error');
                return 0;
            }
            else if (result.indexOf('ServerError') > -1) {
                alert(result);
                return 0;
            }
            else if (result.indexOf('Error') > -1) {
                alert(result);
                return 1;
            }
            else {
                $uof.dialog.set_returnValue("ScheduleClassManagement");
                return 2;
            }
        } // end alertError

        function treeRemoveNode(result) {
            var tree = $find("<%= rtvTreeSchClass.ClientID %>");
            var node = tree.get_selectedNode();
            if (alertError(result) == 2) {
                node.get_parent().get_nodes().remove(node);
            }
            SetToolbarEnable(true);
        } // end treeRemoveNode

        function treeAddNode(result) {
            var tree = $find("<%= rtvTreeSchClass.ClientID %>");
            var node = tree.get_selectedNode();
            var flag = alertError(result);
            if (flag == 0) {
                node.get_parent().get_nodes().remove(node);
            }
            else if (flag == 1) {
                node.set_value(null);
                node.startEdit();
            }
            else if (flag == 2) {
                node.set_value(result.value);
            }

            SetToolbarEnable(true);
        } // end treeAddNode

        function treeRenameNode(result) {
            var tree = $find("<%= rtvTreeSchClass.ClientID %>");
            var node = tree.get_selectedNode();
            var flag = alertError(result);
            if (flag == 0) {
                node.set_text(result.request.args["className"]);
                node.startEdit();
            }
            else if (flag == 1) {
                node.startEdit();
            }
            else if (flag == 2) {
            }
            SetToolbarEnable(true);
        } // end treeModifyNode
        // -->

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
                node.set_allowEdit(false);
            }
            else {
                var classGUID = node.get_value();
                if (classGUID == null || classGUID == "") {
                    var owner = $uof.tool.htmlDecode('<%=System.Web.Security.AntiXss.AntiXssEncoder.HtmlEncode(hideOwner.Value, true) %>');
                    var type = $uof.tool.htmlDecode('<%= System.Web.Security.AntiXss.AntiXssEncoder.HtmlEncode(hideScheduleType.Value, true) %>');
                    var createdata = [owner, text, type, node.get_value()];
                    var result = $uof.pageMethod.sync("CreateClass", createdata);

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
                        node.set_value(result);
                    }

                    SetToolbarEnable(true);
                }
                else {
                    var changedata = [classGUID, text, node.get_value()];
                    var result = $uof.pageMethod.sync("ChangeClassName", changedata);
                    var flag = alertError(result);
                    if (flag == 0) {
                        node.set_text(node.get_text());
                        node.startEdit();
                    }
                    else if (flag == 1) {
                        args.set_cancel(true);
                        setTimeout(function () { node.startEdit(); }, 100);
                    }
                    else if (flag == 2) {
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
                    <telerik:RadToolBar ID="RadToolBar1" runat="server" Width="100%" OnClientButtonClicking="RadToolBar1_ScheduleClass_ButtonClicking">
                        <Items>
                            <telerik:RadToolBarButton runat="server" HoveredImageUrl="~/Common/Images/Icon/icon_m170.gif"
                                ImageUrl="~/Common/Images/Icon/icon_m170.gif" CheckedImageUrl="~/Common/Images/Icon/icon_m170.gif"
                                Value="Create" Text="新增類別" meta:resourcekey="TBarButtonResource1">
                            </telerik:RadToolBarButton>
                            <telerik:RadToolBarButton runat="server" IsSeparator="True" Value="s1">
                            </telerik:RadToolBarButton>
                            <telerik:RadToolBarButton runat="server" HoveredImageUrl="~/Common/Images/Icon/icon_m03.gif"
                                ImageUrl="~/Common/Images/Icon/icon_m03.gif" CheckedImageUrl="~/Common/Images/Icon/icon_m03.gif"
                                Value="Delete" Text="刪除類別" meta:resourcekey="TBarButtonResource2">
                            </telerik:RadToolBarButton>
                            <telerik:RadToolBarButton runat="server" IsSeparator="True" Value="s2">
                            </telerik:RadToolBarButton>
                        </Items>
                    </telerik:RadToolBar>
                </telerik:RadPane>
                <telerik:RadPane ID="TreeRdPanel" runat="server">
                    <asp:CustomValidator ID="cvClassNameExists" runat="server" ErrorMessage="名稱重覆" Display="Dynamic" meta:resourcekey="cvClassNameExistsResource1"></asp:CustomValidator>
                    <asp:CustomValidator ID="cvNameEmpty" runat="server" ErrorMessage="名稱不允許空白" Display="Dynamic" meta:resourcekey="cvNameEmptyResource1"></asp:CustomValidator><br />
                    <telerik:RadTreeView ID="rtvTreeSchClass" AllowNodeEditing="True" runat="server"  EnableNodeTextHtmlEncoding="true"
                        OnClientNodeEditing="classTreeClientNodeEditing"
                        OnClientNodeEdited="classTreeClientNodeEdited"
                        OnClientNodeClicked="onClientNodeClicked"  meta:resourcekey="rtvTreeSchClassResource1">
                    </telerik:RadTreeView>
                </telerik:RadPane>
            </telerik:RadSplitter>
            <asp:Label ID="lblconfirm" runat="server" Text="確定要刪除?" Visible="False" meta:resourcekey="lblconfirmResource1"></asp:Label>
            <asp:Label ID="lblClassNameNeeded" runat="server" Text="請輸入類別名稱" Visible="False" meta:resourcekey="lblClassNameNeededResource1"></asp:Label>
            <asp:HiddenField ID="hideOwner" runat="server" />
            <asp:HiddenField ID="hideScheduleType" runat="server" />
            <asp:HiddenField ID="hideIsUpdate" Value="false" runat="server" />
            <asp:HiddenField ID="hiddNodeId" runat="server" />
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
