<%@ Page Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="EIP_OMS_ClassSetting" Title="類別維護" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" Codebehind="ClassSetting.aspx.cs" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register Src="../../Common/ChoiceCenter/UC_ChoiceList.ascx" TagName="UC_ChoiceList" TagPrefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <script type="text/javascript">
        function classTreeClientNodeDragStart(sender, args) {
            var node = args.get_node();
            if (sender.get_allowNodeEditing()) {
                node.set_allowEdit(false);
            }
        }

        function classTreeClientNodeEditing(sender, args) {            
            var node = args.get_node();
            if (node.get_level() == 0) {
                args.set_cancel(true);
                node.set_allowEdit(false);
            }
        }

        function classTreeClientNodeEdited(sender, args) {            
            var node = args.get_node();
            if (node.get_level() == 0) {
                node.set_allowEdit(false);                
            }
        }

        function classTreeClientNodeDropping(sender, args) {            
            var nSource = args.get_sourceNode();
            var nDest = args.get_destNode();
            if (nDest == null) {
                $("#<%=hiddenDropTargetNode.ClientID %>").val('null');
            }
            else if (nDest.get_value() == null) {
                $("#<%=hiddenDropTargetNode.ClientID %>").val('');
            }
            else {
                $("#<%=hiddenDropTargetNode.ClientID %>").val(nDest.get_value());
            }
            $("#<%=hiddenDropSourceNode.ClientID %>").val(nSource.get_value());
        }

    function RadToolBar1_ButtonClicking(sender, args) {
        var value = args.get_item().get_value();
        var tree = $find("<%= this.classTree.ClientID %>");
        var node = tree.get_selectedNode();
        switch (value) {
            case "CreateClass":
                var tree = $find("<%= this.classTree.ClientID %>");
                if (tree.get_selectedNode() == null) {
                    args.set_cancel(true);
                    return;
                }
                break;
            case "DeleteClass":
                if (node != null) {
                    if (confirm('<%=msgDelconfirm.Text %>') == false)
                        args.set_cancel(true);
                }
                break;
        }
    }

        function RadToolBar2_ButtonClicking(sender, args) {
            var key = args.get_item().get_value();
            if (key == "SaveMovieClassManager") {
                var divClassManager = $("#<%=divClassManager.ClientID%>");
                var withChildClass = false;
                var withChildReader = $("#<%=cbApplyToChildrenUser.ClientID%>").is(":checked");
                if (divClassManager) {
                    var withChildClass = $("#<%=cbApplyToChildrenManager.ClientID%>").is(":checked");
                }                                

                if (withChildClass || withChildReader) {
                    if (confirm('<%=lblMsgException.Text %>') == false)
                        args.set_cancel(true);
                }
            }
        }

    function resizeTree(X, Y) {        
        var tree = $find("<%=classTree.ClientID %>");
        tree.get_element().style.height = Y - 35 + "px";
        tree.get_element().style.width = X + "px";
    }

    </script>
    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
        <ContentTemplate>
            <table style="width: 100%">
                <tr>
                    <td style="width: 100%">
                        <%--<telerik:RadSplitter ID="MainRadSplitter" runat="server" Width="100%" Height="500px" LiveResize="true" ResizeWithBrowserWindow="true" ResizeWithParentPane="false" Orientation="Horizontal" BorderSize="0">
                    <telerik:RadPane ID="TopRadPane" runat="server" Height="35px" Scrolling="None">--%>
                        <telerik:RadToolBar ID="RadToolBar1" runat="server" Width="100%" OnClientButtonClicking=" RadToolBar1_ButtonClicking" OnButtonClick="RadToolBar1_ButtonClick" meta:resourcekey="RadToolBar1Resource1">
                            <Items>
                                <telerik:RadToolBarButton runat="server" Text="新增類別" ClickedImageUrl="~/Common/Images/Icon/icon_j14.gif"
                                    HoveredImageUrl="~/Common/Images/Icon/icon_j14.gif" ImageUrl="~/Common/Images/Icon/icon_j14.gif" Value="CreateClass" meta:resourcekey="RadToolBarButtonResource1">
                                </telerik:RadToolBarButton>
                                <telerik:RadToolBarButton runat="server" Text="Button 1" IsSeparator="true" meta:resourcekey="RadToolBarButtonResource2">
                                </telerik:RadToolBarButton>
                                <telerik:RadToolBarButton runat="server" Text="刪除類別" ClickedImageUrl="~/Common/Images/Icon/icon_m03.gif"
                                    HoveredImageUrl="~/Common/Images/Icon/icon_m03.gif" ImageUrl="~/Common/Images/Icon/icon_m03.gif" Value="DeleteClass" meta:resourcekey="RadToolBarButtonResource3">
                                </telerik:RadToolBarButton>
                                <telerik:RadToolBarButton runat="server" Text="Button 3" IsSeparator="true" meta:resourcekey="RadToolBarButtonResource4">
                                </telerik:RadToolBarButton>
                                <telerik:RadToolBarButton runat="server" Value="Notice">
                                    <ItemTemplate>
                                        <asp:Label ID="lblNoAuthMsg" runat="server" Text="沒有權限維護" ForeColor="Red" Visible="false" meta:resourcekey="lblNoAuthMsgResource1"></asp:Label>
                                    </ItemTemplate>
                                </telerik:RadToolBarButton>
                            </Items>
                        </telerik:RadToolBar>
                        <%--</telerik:RadPane>
                    <telerik:RadPane ID="TreeRadPane" runat="server" Scrolling="Y">--%>
                        <%--<asp:UpdatePanel ID="UpdatePanel1" runat="server" RenderMode="Inline" UpdateMode="Conditional">
                            <ContentTemplate>--%>
                        <asp:CustomValidator ID="CustomValidator1" runat="server" ErrorMessage="請先選擇任一類別" Display="Dynamic" ForeColor="Red" meta:resourcekey="CustomValidator1Resource1"></asp:CustomValidator>
                        <asp:CustomValidator ID="CustomValidator2" runat="server" ErrorMessage="影音類別不可刪除" Display="Dynamic" ForeColor="Red" meta:resourcekey="CustomValidator2Resource1"></asp:CustomValidator>
                        <asp:CustomValidator ID="CustomValidator3" runat="server" Display="Dynamic" ForeColor="Red" ErrorMessage="類別底下存在子類別或影音" meta:resourcekey="CustomValidator3Resource1"></asp:CustomValidator>
                        <asp:CustomValidator ID="CustomValidator4" runat="server" Display="Dynamic" ErrorMessage="類別名稱已經存在" ForeColor="Red" meta:resourcekey="CustomValidator4Resource1"></asp:CustomValidator>
                        <asp:CustomValidator ID="CustomValidator5" runat="server" Display="Dynamic" ErrorMessage="無法更名 ! 已有相同類別存在" ForeColor="Red" meta:resourcekey="CustomValidator5Resource1"></asp:CustomValidator>
                        <asp:CustomValidator ID="CustomValidator6" runat="server" Display="Dynamic" ErrorMessage="類別名稱不允許空白" ForeColor="Red" meta:resourcekey="CustomValidator6Resource1"></asp:CustomValidator>
                        <asp:CustomValidator ID="CustomValidator7" runat="server" Display="Dynamic" ErrorMessage="不允許更名" ForeColor="Red" meta:resourcekey="CustomValidator7Resource1"></asp:CustomValidator>
                        <asp:CustomValidator ID="CustomValidator8" runat="server" Display="Dynamic" ErrorMessage="類別名稱超出長度" ForeColor="Red" meta:resourcekey="CustomValidator8Resource1"></asp:CustomValidator>
                        <telerik:RadTreeView ID="classTree" runat="server" AllowNodeEditing="true" EnableDragAndDrop="true" Height="440px" Width="100%"
                            OnClientNodeDragStart="classTreeClientNodeDragStart"
                            OnClientNodeEditing="classTreeClientNodeEditing"
                            OnClientNodeEdited="classTreeClientNodeEdited"
                            OnClientNodeDropping="classTreeClientNodeDropping"
                            OnNodeEdit="classTree_NodeEdit"
                            OnNodeDrop="classTree_NodeDrop" OnNodeClick="classTree_NodeClick">
                        </telerik:RadTreeView>
                        <%--</ContentTemplate>
                            <Triggers>
                                <asp:AsyncPostBackTrigger ControlID="RadToolBar1" EventName="ButtonClick"></asp:AsyncPostBackTrigger>
                            </Triggers>
                        </asp:UpdatePanel>--%>
                        <input id="hiddenDropTargetNode" runat="server" type="hidden" />
                        <input id="hiddenDropSourceNode" runat="server" type="hidden" />
                        <input id="hiddenNodeId" runat="server" type="hidden" />
                        <input id="hideStatus" runat="server" type="hidden" /><br />
                        <asp:Label ID="msgNotModify" runat="server" Text="不可修改" Visible="False" meta:resourcekey="msgNotModifyResource1"></asp:Label>
                        <asp:Label ID="msgDelconfirm" runat="server" Text="確定要刪除?" Visible="False" meta:resourcekey="msgDelconfirmResource1"></asp:Label>
                        <asp:Label ID="msgMovieClass" runat="server" Text="影音類別" Visible="False" meta:resourcekey="msgBulletinclass1Resource1"></asp:Label>
                        <%--</telerik:RadPane>
                </telerik:RadSplitter>--%>
                    </td>
                    <td style="width: 50%; display: none">
                        <div runat="server" id="dvMovieManager">
                            <telerik:RadToolBar ID="RadToolBar2" runat="server" Width="100%" OnButtonClick="RadToolBar2_ButtonClick" OnClientButtonClicking="RadToolBar2_ButtonClicking">
                                <Items>
                                    <telerik:RadToolBarButton runat="server" Text="儲存" Enabled="false"
                                        DisabledImageUrl="~/Common/Images/Icon/icon_m66.png" HoveredImageUrl="~/Common/Images/Icon/icon_m66.png"
                                        ImageUrl="~/Common/Images/Icon/icon_m66.png" CheckedImageUrl="~/Common/Images/Icon/icon_m66.png"
                                        Value="SaveMovieClassManager" meta:resourcekey="SaveMovieClassManagerResource1">
                                    </telerik:RadToolBarButton>
                                    <telerik:RadToolBarButton runat="server" IsSeparator="true">
                                    </telerik:RadToolBarButton>
                                    <telerik:RadToolBarButton runat="server" Value="HadSave">
                                        <ItemTemplate>
                                            <asp:Label ID="lblSaveMsg" runat="server" Text="已儲存" ForeColor="Blue" Visible="false" meta:resourcekey="lblSaveMsgResource1"></asp:Label>
                                        </ItemTemplate>
                                    </telerik:RadToolBarButton>
                                </Items>
                            </telerik:RadToolBar>
                            <div runat="server">
                                <div runat="server" id="divClassManager">
                                    <fieldset style="padding: 2px; width: 99%; height: 210px;">
                                        <legend>
                                            <asp:Label ID="lblMovieClassManager" runat="server" Text="設定類別管理員" meta:resourcekey="lblMovieClassManagerResource1"></asp:Label></legend>
                                        <asp:CheckBox ID="cbApplyToChildrenManager" runat="server" Text="同步修改到子類別"
                                            meta:resourcekey="cbApplyToChildrenManagerResource1" /><br />
                                        <uc1:UC_ChoiceList ID="UC_ChoiceListClassManager" runat="server" TreeHeight="120px" ExpandToUser="False" />
                                    </fieldset>
                                    <br />
                                </div>
                                <div>
                                    <fieldset style="padding: 2px; width: 99%; height: 210px;">
                                        <legend>
                                            <asp:Label ID="lblMovieUser" runat="server" Text="設定影音分享人員" meta:resourcekey="lblMovieUserResource1"></asp:Label></legend>
                                        <asp:CheckBox ID="cbApplyToChildrenUser" runat="server" Text="同步修改到子類別"
                                            meta:resourcekey="cbApplyToChildrenUserResource1" /><br />
                                        <uc1:UC_ChoiceList ID="UC_ChoiceListMovieUser" runat="server" TreeHeight="120px" ExpandToUser="False" />
                                    </fieldset>
                                </div>
                            </div>
                        </div>
                    </td>
                </tr>
            </table>

            <asp:Label ID="lblMsgException" runat="server" Text="注意:此動作將會同步修改子類別下的設定" Visible="false" meta:resourcekey="lblMsgExceptionResource1"></asp:Label>
        </ContentTemplate>
    </asp:UpdatePanel>
    <asp:HiddenField ID="hfUserGuid" runat="server" />
</asp:Content>

