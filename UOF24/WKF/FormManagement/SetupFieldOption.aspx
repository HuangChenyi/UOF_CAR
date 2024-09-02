<%@ Page Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="WKF_FormManagement_SetupFieldOption" Title="設定欄位選項值" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" Codebehind="SetupFieldOption.aspx.cs" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <script type="text/javascript">
        <!--
        function EditCategoryNode() {
            var tree = $find("<%= RadTreeView1.ClientID %>");
            var node = tree.get_selectedNode();

            if (node != null && $('#<%=hidNeedEdit.ClientID%>').val() == 'true') {
                node.startEdit();
            }
        }

        function treeSubFlow_Load(sender, eventArgs) {
            EditCategoryNode();
        }
            //-->


        function Nodedropping(e, args) {
            //目的地節點如果找不到，取消拖拉動作
            if (!args.get_destNode()) {
                args.set_cancel(true);
            }
        }
    </script>


    <table cellpadding="0" cellspacing="0" style="width: 100%">
        <tr>
            <td>
                <asp:ValidationSummary ID="ValidationSummary1" runat="server" meta:resourcekey="ValidationSummary1Resource1" />
                <asp:CustomValidator ID="CustomValidator1" runat="server" Display="None" meta:resourcekey="CustomValidator1Resource1"></asp:CustomValidator>
            </td>
        </tr>
        <tr>
            <td>
                <telerik:RadToolBar ID="RadToolBar1" runat="server" meta:resourcekey="UltraWebToolbar1Resource1" OnButtonClick="RadToolBar1_ButtonClick" Width="100%">
                    <Items>
                        <telerik:RadToolBarButton runat="server"
                            Text="新增項目"
                            HoveredImageUrl="~/System/icon_images/icon_m19.gif"
                            ImageUrl="~/System/icon_images/icon_m19.gif"
                            Value="AddItem"
                            CheckedImageUrl="~/System/icon_images/icon_m19.gif"
                            meta:resourcekey="TBarButtonResource1">
                        </telerik:RadToolBarButton>
                        <telerik:RadToolBarButton runat="server" IsSeparator="True" Text="Button 1" ImageUrl="~/App_Themes/DefaultTheme/images/toolbarSp.jpg">
                        </telerik:RadToolBarButton>
                        <telerik:RadToolBarButton runat="server"
                            Text="刪除"
                            HoveredImageUrl="~/System/icon_images/icon_m03.gif"
                            ImageUrl="~/System/icon_images/icon_m03.gif"
                            Value="DeleteItem"
                            CheckedImageUrl="~/System/icon_images/icon_m03.gif"
                            meta:resourcekey="TBarButtonResource2">
                        </telerik:RadToolBarButton>
                        <telerik:RadToolBarButton runat="server" IsSeparator="True" Text="Button 3" ImageUrl="~/App_Themes/DefaultTheme/images/toolbarSp.jpg">
                        </telerik:RadToolBarButton>
                    </Items>
                </telerik:RadToolBar>
            </td>
        </tr>
    </table>
    <table border="0" width="100%" height="300">
        <tr>
            <td background="<%=themePath %>/images/tree_bg.gif" valign="top">
                <asp:UpdatePanel id="UpdatePanel1"
                    runat="server" RenderMode="Inline" UpdateMode="always">
                    <contenttemplate>
                    <telerik:RadTreeView ID="RadTreeView1" Runat="server"
                        EnableDragAndDrop="true" 
                        AllowNodeEditing="true"
                        CheckBoxes="true"
                        OnNodeDrop="RadTreeView1_NodeDrop" 
                        OnNodeEdit="RadTreeView1_NodeEdit"
                        OnClientNodeDropping="Nodedropping"
                         OnClientLoad="treeSubFlow_Load" >

                    </telerik:RadTreeView>
                        <input id="hidNeedEdit" runat="server" type="hidden" />
                    </contenttemplate>
                    <triggers>
                    <asp:AsyncPostBackTrigger ControlID="RadToolBar1" 
                        EventName="ButtonClick" />
                </triggers>
                </asp:UpdatePanel>
            </td>
        </tr>
    </table>
    <asp:Label ID="lblRepeatName" runat="server" Text="名稱重複" Visible="false" meta:resourcekey="lblRepeatNameResource1"></asp:Label>
    <asp:Label ID="lblForbidChar" runat="server" Text="{0}為保留字，請勿使用" Visible="false" meta:resourcekey="lblForbidCharResource1"></asp:Label>
    <asp:Label ID="lblUsedInConditions" runat="server" Text="此欄位已被設定為表單條件，不允許變更或刪除選項！" Visible="false" meta:resourcekey="lblUsedInConditionsResource1"></asp:Label>
    <asp:HiddenField ID="hidden_oldNodeText" runat="server" />
</asp:Content>
