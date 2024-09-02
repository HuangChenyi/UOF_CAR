<%@ Page Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="WKF_Admin_AddTriggerCalss" Title="分類管理" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" Codebehind="AddTriggerCalss.aspx.cs" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <script id="AddTriggerCalssjs" type="text/javascript">
        function ToolBar_ButtonClicking(sender, args) {

            if (args.get_item().get_value() == "AddClass") {

            }
            else if (args.get_item().get_value() == "DeleteClass") {
                var tree = $find("<%= treeForm.ClientID %>");
            var node = tree.get_selectedNode();

            if (node == null) {
                // ========= 請先欲刪除類別 =========
                alert('<%=lbNeedItemSelected.Text %>');
                args.set_cancel(true);
            }
            else {

                if (node.get_level() == 1) {
                    // ========= 請先欲刪除類別 =========
                    alert('<%=lbNeedItemSelected.Text %>');
                    args.set_cancel(true);
                }
                else if (node.get_childListElement() != null) {
                    alert('<%=lblHasFlowErrorMsg.Text %>');
                    args.set_cancel(true);
                }
                else {
                    if (confirm('<%=lbConfirmDelete.Text %>「' + node.get_text() + '」') == false)//確定要刪除?
                    {
                        args.set_cancel(true);
                    }
                }
        }
    }
}

function ReplaceAll(strOrg, strFind, strReplace) {
    var index = 0;
    while (strOrg.indexOf(strFind, index) != -1) {
        strOrg = strOrg.replace(strFind, strReplace);
        index = strOrg.indexOf(strFind, index);
    }
    return strOrg;
}

function EditCategoryNode() {
    var tree = $find("<%= treeForm.ClientID %>");
        var node = tree.get_selectedNode();
        if (node != null && $uof.tool.htmlDecode('<%=System.Web.Security.AntiXss.AntiXssEncoder.HtmlEncode(hidNeedEdit.Value,true)%>') == 'true' && node.get_level() == 0) {
            node.startEdit();
        }
    }

    function treeForm_Load(sender, eventArgs) {
        EditCategoryNode();
    }

    </script>
    <asp:UpdatePanel ID="UpdatePanel2" runat="server" RenderMode="Inline" UpdateMode="Conditional">
        <ContentTemplate>
            <telerik:RadSplitter ID="MasterRdSplitter" runat="server" Width="100%" LiveResize="true" ResizeWithBrowserWindow="true" ResizeWithParentPane="true" Orientation="Horizontal" BorderSize="0">
                <telerik:RadPane ID="TopRdPanel" runat="server" Height="35px" Scrolling="None">
                    <asp:ValidationSummary ID="ValidationSummary1" runat="server"
                        meta:resourcekey="ValidationSummary1Resource1" />
                    <asp:CustomValidator ID="CustomValidator1" runat="server" Display="None"
                        meta:resourcekey="CustomValidator1Resource1">
                    </asp:CustomValidator>
                    <telerik:RadToolBar runat="server" ID="RadToolBar1" OnClientButtonClicking="ToolBar_ButtonClicking"
                        OnButtonClick="RadToolBar1_ButtonClick" Width="100%" meta:resourcekey="UltraWebToolbar1Resource1">
                        <Items>
                            <telerik:RadToolBarButton runat="server" Text="新增分類"
                                DisabledImageUrl="~/Common/Images/Icon/icon_m91.gif"
                                HoveredImageUrl="~/Common/Images/Icon/icon_m91.gif"
                                ImageUrl="~/Common/Images/Icon/icon_m91.gif"
                                CheckedImageUrl="~/Common/Images/Icon/icon_m91.gif"
                                Value="AddClass"
                                meta:resourcekey="TBarButtonResource1">
                            </telerik:RadToolBarButton>
                            <telerik:RadToolBarButton runat="server" IsSeparator="True" Text="Button 2" Value="s1" Image="~/App_Themes/DefaultTheme/images/toolbarSp.jpg">
                            </telerik:RadToolBarButton>
                            <telerik:RadToolBarButton runat="server" Text="刪除分類"
                                DisabledImageUrl="~/Common/Images/Icon/icon_m03.gif"
                                HoveredImageUrl="~/Common/Images/Icon/icon_m03.gif"
                                ImageUrl="~/Common/Images/Icon/icon_m03.gif"
                                CheckedImageUrl="~/Common/Images/Icon/icon_m03.gif"
                                Value="DeleteClass"
                                meta:resourcekey="TBarButtonResource2">
                            </telerik:RadToolBarButton>
                            <telerik:RadToolBarButton runat="server" IsSeparator="True" Text="Button 2" Value="s2" Image="~/App_Themes/DefaultTheme/images/toolbarSp.jpg">
                            </telerik:RadToolBarButton>
                        </Items>
                    </telerik:RadToolBar>
                </telerik:RadPane>
                <telerik:RadPane ID="TreeRdPanel" runat="server" Scrolling="None">
                    <telerik:RadTreeView ID="treeForm" runat="server" Height="100%" Width="100%"
                        AllowNodeEditing="true" meta:resourcekey="treeFormResource1"
                        OnClientLoad="treeForm_Load"
                        OnNodeEdit="treeForm_NodeEdit">
                    </telerik:RadTreeView>
                    <asp:HiddenField ID="hiddenDropSourceNode" runat="server" />
                    <asp:HiddenField ID="hiddenNodeId" runat="server" />
                    <asp:HiddenField ID="hidNeedEdit" runat="server" />
                </telerik:RadPane>
            </telerik:RadSplitter>

        </ContentTemplate>
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="RadToolBar1" EventName="ButtonClick"></asp:AsyncPostBackTrigger>
        </Triggers>
    </asp:UpdatePanel>
    <asp:Label ID="lbConfirmDelete" runat="server" Text="確定要刪除？" Visible="False" meta:resourcekey="lbConfirmDeleteResource1"></asp:Label>
    <asp:Label ID="lblNotAllowEmpty" runat="server" Text="不允許空白！" Visible="False" meta:resourcekey="lblNotAllowEmptyResource1"></asp:Label>
    <asp:Label ID="lblClassNameDuplicate" runat="server" Text="類別名稱不可重複！" Visible="False" meta:resourcekey="lblClassNameDuplicateResource1"></asp:Label>
    <asp:Label ID="lblHasFlowErrorMsg" runat="server" Text="類別中有事件，不允許刪除！" Visible="False" meta:resourcekey="lblHasFlowErrorMsgResource1"></asp:Label>
    <asp:Label ID="lbNeedItemSelected" runat="server" Text="請選擇欲刪除類別！" Visible="False" meta:resourcekey="lbNeedItemSelectedResource1"></asp:Label>
    <asp:Label ID="Label1" runat="server" Text="不允許空白！" Visible="False" meta:resourcekey="Label1Resource1"></asp:Label>
    <asp:Label ID="lblRangeError" runat="server" Text="字數不可超過50！" Visible="False" meta:resourcekey="lblRangeErrorResource1"></asp:Label>
    <asp:Label ID="lblClassNameErrorMsg" runat="server" Text="類別名稱不可重複！" Visible="False" meta:resourcekey="lblClassNameErrorMsgResource1"></asp:Label>
</asp:Content>