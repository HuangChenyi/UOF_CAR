<%@ Page Title="部門管理" Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="System_Organization_Department_HierarchicalDepartment" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" Codebehind="HierarchicalDepartment.aspx.cs" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <script type="text/javascript">

        function resizeHRTree(X, Y) {
            var tree = $find("<%=RadTreeViewHR.ClientID %>");
            var control = $("#<%=chbDisplayAllDept.ClientID %>").is(':visible');
            if (control) {
                tree.get_element().style.height = (Y - 55) + "px";
            }
            else {
                tree.get_element().style.height = (Y - 35) + "px";
            }
            tree.get_element().style.width = X + "px";
            $("#<%=leftX.ClientID%>").val(X);
            $("#<%=leftY.ClientID%>").val(Y);
        }

        function RadToolBarHR_ManageDep_ButtonClicking(sender, args) {
            args.set_cancel(true);
            var Key = args.get_item().get_value();
            var displayAllDept = $("#<%=chbDisplayAllDept.ClientID%>").is(":checked");

            if (Key === "createDept") {
                var tree = $find("<%=RadTreeViewHR.ClientID %>");

                var parentNode = tree.get_selectedNode();
                if (parentNode !== null) {
                    var active = parentNode.get_attributes().getAttribute("Active");
                    if (active === "false") {
                        alert('<%=lblCannotAddChildError.Text %>');
                        return;
                    }
                    SetToolbarEnable(false);

                    var node = new Telerik.Web.UI.RadTreeNode();
                    node.set_text("New Department");
                    node.set_imageUrl("<%=Request.ApplicationPath %>" + "/Common/Images/Icon/icon_m01.png");
                    node.get_attributes().setAttribute("Active", "true");

                    parentNode.get_nodes().insert(0, node);
                    parentNode.expand();
                    node.scrollIntoView();
                    node.set_selected(true);
                    node.startEdit();
                }
                else {
                    alert('<%=lbNeedItemSelected.Text %>');
                }
            }
            else if (Key === "delete") {
                var tree = $find("<%=RadTreeViewHR.ClientID %>");
                var node = tree.get_selectedNode();
                var groupId = "<%=_groupId%>";
                if (node !== null) {
                    var level = node.get_level();

                    if (confirm('<%=Ede.Uof.Utility.Page.Common.Resource.GetResource("Common","ConfirmDelete") %>')) {
                        SetToolbarEnable(false);
                        var data = [node.get_value(), level, node.get_value(), groupId,displayAllDept];
                        var result = $uof.pageMethod.sync("DeleteDepartment", data);

                        if (result === null) {
                            alert("server error");
                            SetToolbarEnable(true);
                            checkNodePostion(node);
                        }
                        else {
                            if (result.indexOf('Error') > -1) {

                                alert(result);
                                SetToolbarEnable(true);
                                checkNodePostion(node);
                            }
                            else if (result === 'DeleteException')
                            {
                                alert('<%=lbNotAllowDelete2.Text %>');
                                SetToolbarEnable(true);
                                checkNodePostion(node);
                            }
                            else {
                                if (node) {

                                    if (node.get_level === 0) {
                                        tree.get_nodes().remove(node);
                                        tree.get_nodes().getNode(0).set_selected(true);
                                    }
                                    else {
                                        var parentnode = node.get_parent();
                                        parentnode.get_nodes().remove(node);
                                        parentnode.set_selected(true);

                                        SetToolbarEnable(true);
                                        checkNodePostion(parentnode);
                                    }
                                }
                                top.returnValue = "";
                            }
                        }
                    }
                }
            }
            else if (Key === "moveup") {
                var tree = $find("<%=RadTreeViewHR.ClientID %>");
                var node = tree.get_selectedNode();
                $("#<%=hfNodeId.ClientID%>").val(node.get_value());
                var parentNode = node.get_parent();
                var index = node.get_index();
                var groupId = "<%=_groupId%>";
                var movePostion = index;
                var postionData = [node.get_value(), groupId, displayAllDept, "up"];
                movePostion = $uof.pageMethod.sync("GetMovePostion", postionData);

                var data = [node.get_value(), parentNode.get_value(), movePostion, groupId,displayAllDept];
                var result = $uof.pageMethod.sync("ChangeDepartmentPostion", data);

                if (result === null) {
                    alert("server error");
                    SetToolbarEnable(true);
                }
                else {
                    if (result.indexOf('Error') > -1) {
                        alert(result);
                        SetToolbarEnable(true);
                    }
                    else {
                        $('#<%= Button1.ClientID%>').click();
                        return true;
                    }
                }
            }
            else if (Key === "movedown") {
                var tree = $find("<%=RadTreeViewHR.ClientID %>");
                var node = tree.get_selectedNode();
                $("#<%=hfNodeId.ClientID%>").val(node.get_value());
                var parentNode = node.get_parent()
                var index = node.get_index();
                var groupId = "<%=_groupId%>";
                var movePostion = index;
                var postionData = [node.get_value(), groupId, displayAllDept, "down"];
                movePostion = $uof.pageMethod.sync("GetMovePostion", postionData);

                var data = [node.get_value(), parentNode.get_value(), movePostion, groupId,displayAllDept];
                var result = $uof.pageMethod.sync("ChangeDepartmentPostion", data);

                if (result === null) {
                    alert("server error");
                    SetToolbarEnable(true);
                }
                else {
                    if (result.indexOf('Error') > -1) {
                        alert(result);
                        SetToolbarEnable(true);
                    }
                    else {
                        $('#<%= Button1.ClientID%>').click();
                        return true;
                    }
                }
            }
            else if (Key == "enable") {
                if (confirm('<%=lblConfirmEnable.Text %>')) {
                    var tree = $find("<%=RadTreeViewHR.ClientID %>");
                    var node = tree.get_selectedNode();
                    var needVaild = false;
                    var enableType = true;
                    $("#<%=hfNodeId.ClientID%>").val(node.get_value());
                    var groupId = "<%=_groupId%>";
                    var data = [node.get_value(), enableType, groupId,displayAllDept, needVaild];
                    var result = $uof.pageMethod.sync("EnableDept", data);
                    if (result == null) {
                        alert("server error");
                        SetToolbarEnable(true);
                        checkNodePostion(node);
                    }
                    else {
                        if (result === "ParentError") {
                            alert('<%=lblParentNoneActiveError.Text %>');
                            SetToolbarEnable(true);
                            checkNodePostion(node);
                        }
                        else {
                            $('#<%= Button1.ClientID%>').click();
                            return true;
                        }
                    }
                }
            }
            else if (Key == "disable") {
                if (confirm('<%=lblConfirmDisable.Text %>')) {
                    var tree = $find("<%=RadTreeViewHR.ClientID %>");
                    var node = tree.get_selectedNode();
                    $("#<%=hfNodeId.ClientID%>").val(node.get_value());
                    var groupId = "<%=_groupId%>";
                    var needVaild = true;
                    var enableType = false;
                    var data = [node.get_value(), enableType, groupId,displayAllDept, needVaild];
                    var result = $uof.pageMethod.sync("EnableDept", data);
                    if (result == null) {
                        alert("server error");
                        SetToolbarEnable(true);
                        checkNodePostion(node);
                    }
                    else {
                        if (result === "ChildError") {
                            alert('<%=lblNoneActiveError.Text %>');
                            SetToolbarEnable(true);
                            checkNodePostion(node);
                        }
                        else if (result === "HasActiveUsersError")
                        {
                            if (confirm('<%=lblHasUsersMsg.Text%>')) {
                                needVaild = false;
                                var data = [node.get_value(), enableType, groupId, displayAllDept, needVaild];
                                $uof.pageMethod.sync("EnableDept", data);

                                $('#<%= Button1.ClientID%>').click();
                                return true;
                            }
                        }
                        else {
                            $('#<%= Button1.ClientID%>').click();
                            return true;
                        }
                    }
                }
            }
        }
        Sys.Application.add_load(function () {
            var tree = $find("<%= RadTreeViewHR.ClientID %>");
            var selectedNode = tree.get_selectedNode()
            if (selectedNode !== null) {
                window.setTimeout(function () { selectedNode.scrollIntoView(); }, 200);
            }
            checkNodePostion(selectedNode);
        });

        Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler);

        function EndRequestHandler(sender, args) {
            //display scroll bar
            window.setTimeout(function () { resizeHRTree($("#<%=leftX.ClientID%>").val(), $("#<%=leftY.ClientID%>").val()); }, 500);
        }

        function ClientNodeDragStart(sender, eventArgs) {
            var node = eventArgs.get_node();
            var tree = node.get_treeView();
            var nodes = tree.get_allNodes();
            for (var i = 0; i < nodes.length; i++) {
                nodes[i].endEdit();
            }
        }
        function ClientNodeDropping(sender, eventArgs) {
            var sourceNode = eventArgs.get_sourceNode();
            var parentNode = sourceNode.get_parent();
            var targetNode = eventArgs.get_destNode();
            var displayAllDept = $("#<%=chbDisplayAllDept.ClientID%>").is(":checked");
            var sourceNodeActive = sourceNode.get_attributes().getAttribute("Active");
            $("#<%=hfNodeId.ClientID%>").val(sourceNode.get_value());

            var groupId = "<%=_groupId%>";
            if (parentNode === null) {
                eventArgs.set_cancel(true);
            }
            else {
                var changeDeptPData = [sourceNode.get_value(), sourceNode.get_text(), targetNode.get_value(), sourceNode.get_value(), targetNode.get_value(), groupId,displayAllDept,sourceNodeActive];
                var result = $uof.pageMethod.sync("ChangeDepartmentParent", changeDeptPData);

                if (result === null) {
                    alert("server error");
                    SetToolbarEnable(true);
                }
                else {
                    if (result.indexOf('Error') > -1) {
                        alert(result);
                        SetToolbarEnable(true);
                    }
                    else if (result.indexOf('NoneActive') > -1)
                    {
                        alert('<%=lbNotAllowMoveByActive.Text %>');
                        SetToolbarEnable(true);
                    }
                    else {
                        $('#<%= Button1.ClientID%>').click();
                        return true;
                    }
                }
            }
        }

        function ClientNodeEditing(sender, eventArgs) {
            var tree = $find("<%=RadTreeViewHR.ClientID %>");
            var node = eventArgs.get_node();
            var text = eventArgs.get_newText();
            var oldtext = node.get_text();
            var groupId = "<%=_groupId%>";
            var displayAllDept = $("#<%=chbDisplayAllDept.ClientID%>").is(":checked");

            if (escape(text) === '%A0' || escape(text) === "") {
                alert('<%=Ede.Uof.Utility.Page.Common.Resource.GetResource("Common","ErrorNotAllowEmpty", Ede.Uof.EIP.SystemInfo.Current.Culture) %>');
                eventArgs.set_cancel(true);
                setTimeout(function () { node.startEdit(); }, 100);
            }
            else {
                //如果是新增;
                if (node.get_value() === null || node.get_value() === "") {

                    var guid = $uof.tool.getNewGuid();
                    node.set_value(guid);
                    var parentNode = node.get_parent();
                    var parentGuid = parentNode.get_value();
                    var createData = [guid, text, parentGuid, guid, groupId, oldtext,displayAllDept];
                    var result = $uof.pageMethod.sync("CreateDepartment", createData);

                    if (result === null) {
                        alert("server error");
                        node.get_parent().get_nodes().remove(node);

                        SetToolbarEnable(true);
                    }
                    else {
                        if (result.indexOf('Error') > -1) {
                            alert(result);
                            node.set_value("");
                            setTimeout(function () { node.startEdit(); }, 100);
                        }
                        else {
                            SetToolbarEnable(true);
                            top.returnValue = "";
                        }
                    }
                }
                else {
                    var modifyData = [node.get_value(), text, node.get_value(), groupId, oldtext,displayAllDept];
                    var result = $uof.pageMethod.sync("ModifyDepartment", modifyData);

                    if (result === null) {
                        alert("server error");

                        node.set_text(oldtext);
                        SetToolbarEnable(true);
                    }
                    else {
                        if (result.indexOf('Error') > -1) {
                            alert(result);
                            eventArgs.set_cancel(true);
                            setTimeout(function () { node.startEdit(); }, 100);
                        }
                        else {
                            SetToolbarEnable(true);
                            top.returnValue = "";
                        }
                    }
                }
                checkNodePostion(node);
            }
        }
        function ClientNodeClicked(sender, eventArgs) {
            var node = eventArgs.get_node();
            node.set_selected(true);
            checkNodePostion(node);
        }
        function ClientNodeClicking(sender, eventArgs) {
            var node = eventArgs.get_node();
            if (sender.get_allowNodeEditing() && !node.get_allowEdit())
                node.set_allowEdit(true);
        }

        function checkNodePostion(treeNode) {
            var oToolbar = $find("<%=RadToolBarHR.ClientID %>");
            var itemcreateDept = oToolbar.findItemByValue("createDept");
            var itemdelete = oToolbar.findItemByValue("delete");
            var itemdown = oToolbar.findItemByValue("movedown");
            var itemup = oToolbar.findItemByValue("moveup");
            var itemenable = oToolbar.findItemByValue("enable");
            var itemdisable = oToolbar.findItemByValue("disable");
            var s5Separator = oToolbar.findItemByValue("s5");
            var s6Separator = oToolbar.findItemByValue("s6");

            if (treeNode !== null) {
                itemcreateDept.set_enabled(true);
                itemdelete.set_enabled(true);

                itemdown.set_enabled(treeNode.get_nextNode() != null);
                itemup.set_enabled(treeNode.get_previousNode() != null);

                var active = treeNode.get_attributes().getAttribute("Active");
                itemenable.set_visible(active != "true");
                itemdisable.set_visible(active == "true");

                s5Separator.set_visible(active != "true");
                s6Separator.set_visible(active == "true");
            }
            else {
                itemcreateDept.set_enabled(false);
                itemdelete.set_enabled(false);
                itemdown.set_enabled(false);
                itemup.set_enabled(false);
                itemenable.set_visible(false);
                itemdisable.set_visible(false);
                s5Separator.set_visible(false);
                s6Separator.set_visible(false);
            }
        }

        function SetToolbarEnable(enable) {

            var oToolbar = $find("<%=RadToolBarHR.ClientID %>");
            var itemcreate = oToolbar.findItemByValue("createDept");
            var itemdel = oToolbar.findItemByValue("delete");
            itemcreate.set_enabled(enable);
            itemdel.set_enabled(enable);

            var itemenable = oToolbar.findItemByValue("enable");
            var itemdisable = oToolbar.findItemByValue("disable");
            var s5Separator = oToolbar.findItemByValue("s5");
            var s6Separator = oToolbar.findItemByValue("s6");

            itemenable.set_visible(!enable);
            itemdisable.set_visible(enable);

            s5Separator.set_visible(!enable);
            s6Separator.set_visible(enable);
        }

    </script>

    <telerik:RadSplitter ID="MainRadSplitter" runat="server" Width="100%" LiveResize="true" ResizeWithBrowserWindow="true" ResizeWithParentPane="true" Orientation="Horizontal" BorderSize="0">
        <telerik:RadPane ID="TopRadPane" runat="server" Height="35px" Scrolling="None">
            <telerik:RadToolBar ID="RadToolBarHR" runat="server" Width="100%" OnClientButtonClicking="RadToolBarHR_ManageDep_ButtonClicking">
                <Items>
                    <telerik:RadToolBarButton runat="server" HoveredImageUrl="~/System/Organization/Department/icon_images/icon_m01.gif" ImageUrl="~/System/Organization/Department/icon_images/icon_m01.gif"
                        Value="createDept" CheckedImageUrl="~/System/Organization/Department/icon_images/icon_m01.gif" Text="新增部門" meta:resourcekey="TBarButtonResource1">
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton runat="server" IsSeparator="True" Value="'s1">
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton runat="server" HoveredImageUrl="~/System/Organization/Department/icon_images/icon_m03.gif" ImageUrl="~/System/Organization/Department/icon_images/icon_m03.gif"
                        Value="delete" CheckedImageUrl="~/System/Organization/Department/icon_images/icon_m03.gif" Text="刪除" meta:resourcekey="TBarButtonResource2">
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton runat="server" IsSeparator="True" Value="s2">
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton runat="server" HoveredImageUrl="~/Common/Images/Icon/icon_m113.gif" ImageUrl="~/Common/Images/Icon/icon_m113.gif"
                        Value="moveup"
                        CheckedImageUrl="~/Common/Images/Icon/icon_m113.gif" Text="上移"
                        meta:resourcekey="TBarButtonResource3">
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton runat="server" IsSeparator="True" Value="'s3">
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton runat="server" HoveredImageUrl="~/Common/Images/Icon/icon_m114.gif" ImageUrl="~/Common/Images/Icon/icon_m114.gif"
                        Value="movedown"
                        CheckedImageUrl="~/Common/Images/Icon/icon_m114.gif" Text="下移"
                        meta:resourcekey="TBarButtonResource4">
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton runat="server" IsSeparator="True" Value="s4">
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton runat="server" HoveredImageUrl="~/Common/Images/Icon/icon_m132.gif"
                        ImageUrl="~/Common/Images/Icon/icon_m132.gif" Value="enable" CheckedImageUrl="~/Common/Images/Icon/icon_m132.gif"
                        Text="啟用" meta:resourcekey="TBarButtonResource5">
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton runat="server" IsSeparator="True" Value="s5">
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton runat="server" HoveredImageUrl="~/Common/Images/Icon/icon_m141.gif"
                        ImageUrl="~/Common/Images/Icon/icon_m141.gif" Value="disable" CheckedImageUrl="~/Common/Images/Icon/icon_m141.gif"
                        Text="停用" meta:resourcekey="TBarButtonResource6">
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton runat="server" IsSeparator="True" Value="s6">
                    </telerik:RadToolBarButton>
                </Items>
            </telerik:RadToolBar>
        </telerik:RadPane>
        <telerik:RadPane ID="TreeRadPane" runat="server" Scrolling="None">
            <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                <ContentTemplate>
                    <asp:Label ID="lblControlWidth" runat="server" Text="" Width="1px"></asp:Label>
                    <asp:CheckBox ID="chbDisplayAllDept" runat="server" Text="顯示已停用部門" AutoPostBack="true" OnCheckedChanged="chbDisplayAllDept_CheckedChanged" meta:resourcekey="chbDisplayAllDeptResource1" />
                    <telerik:RadTreeView ID="RadTreeViewHR" runat="server" Width="594px" Height="459px"
                        AllowNodeEditing="true" EnableDragAndDrop="true"
                        EnableNodeTextHtmlEncoding="true"
                        OnClientNodeClicking="ClientNodeClicking"
                        OnClientNodeClicked="ClientNodeClicked"
                        OnClientNodeEditing="ClientNodeEditing" OnClientNodeDragStart="ClientNodeDragStart"
                        OnClientNodeDropping="ClientNodeDropping">
                    </telerik:RadTreeView>
                    <asp:HiddenField ID="hfNodeId" runat="server" />
                    <asp:Button ID="Button1" runat="server" Text="Button" Style="display: none;" OnClick="Button1_Click" meta:resourcekey="Button1Resource1" />
                </ContentTemplate>
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="RadToolBarHR" EventName="ButtonClick" />
                    <asp:AsyncPostBackTrigger ControlID="chbDisplayAllDept" EventName="CheckedChanged"></asp:AsyncPostBackTrigger>
                </Triggers>
            </asp:UpdatePanel>
        </telerik:RadPane>
    </telerik:RadSplitter>
    <asp:HiddenField ID="leftX" runat="server" />
    <asp:HiddenField ID="leftY" runat="server" />
    <asp:Label ID="lbConfirmDelete" runat="server" Text="確定要刪除?" Visible="False" meta:resourcekey="lbConfirmDeleteResource1"></asp:Label>
    <asp:Label ID="lbNotAllowEmpty" runat="server" Text="部門不允許空白!" Visible="False" meta:resourcekey="lbNotAllowEmptyResource1"></asp:Label>
    <asp:Label ID="lbLengthErr" runat="server" Text="字數不可超過50 !" Visible="False" meta:resourcekey="lbLengthErrResource1"></asp:Label>
    <asp:Label ID="lbDuplicateError" runat="server" Text="名稱重複!" Visible="False" meta:resourcekey="lbDuplicateErrorResource1"></asp:Label>
    <asp:Label ID="lbNeedItemSelected" runat="server" Text="請先選擇部門!" Visible="False" meta:resourcekey="lbNeedItemSelectedResource1"></asp:Label>
    <asp:Label ID="lbNotAllowMove" runat="server" Text="無法搬移 ! 不可移動至子節點下" Visible="False" meta:resourcekey="lbNotAllowMoveResource1"></asp:Label>
    <asp:Label ID="lbNotAllowDelete" runat="server" Text="不可刪除!" Visible="False" meta:resourcekey="lbNotAllowDeleteResource1"></asp:Label>
    <asp:Label ID="lbNotAllowDelete2" runat="server" Text="部門內仍有子部門/人員存在，不可刪除！" Visible="False" meta:resourcekey="lbNotAllowDelete2Resource1"></asp:Label>
    <asp:Label ID="lblConfirmEnable" runat="server" Text="確定要啟用?" Visible="False" meta:resourcekey="lblConfirmEnableResource1"></asp:Label>
    <asp:Label ID="lblConfirmDisable" runat="server" Text="確定要停用?" Visible="False" meta:resourcekey="lblConfirmDisableResource1"></asp:Label>
    <asp:Label ID="lblNoneActiveError" runat="server" Text="尚有啟用中的子部門，不可停用" Visible="False" meta:resourcekey="lblNoneActiveErrorResource1"></asp:Label>
    <asp:Label ID="lbNotAllowMoveByActive" runat="server" Text="無法搬移至已停用的部門下" Visible="False" meta:resourcekey="lbNotAllowMoveByActiveResource1"></asp:Label>
    <asp:Label ID="lblParentNoneActiveError" runat="server" Text="父部門已停用，無法啟用此部門" Visible="False" meta:resourcekey="lblParentNoneActiveErrorResource1"></asp:Label>
    <asp:Label ID="lblCannotAddChildError" runat="server" Text="父部門為停用部門不可新增" Visible="False" meta:resourcekey="lblCannotAddChildErrorResource1"></asp:Label>
    <asp:Label ID="lblHasUsersMsg" runat="server" Text="部門內尚有未停用或帳號未到期人員，確定要停用此部門？" Visible="False" meta:resourcekey="lblHasUsersMsgResource1"></asp:Label>
</asp:Content>

