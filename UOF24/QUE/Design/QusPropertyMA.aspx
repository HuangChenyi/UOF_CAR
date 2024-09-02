<%@ Page Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="QUE_Design_QusPropertyMA" Title="新增/維護填寫人屬性" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" Codebehind="QusPropertyMA.aspx.cs" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%--<%@ Register Assembly="System.Web.Extensions" Namespace="System.Web.UI" TagPrefix="asp" %>--%>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
<script type="text/javascript" id="igClientScript">  
    var blnRepeat = false;
    function treeItems_OnClientNodeEditing(sender, args) {
        var tree = $find("<%=treeItems.ClientID%>");
        var node = args.get_node();
        var newText = args.get_newText();
        var oldText = node.get_text();
        var index = node.get_index();
        var err = false;

        if (escape(newText) == '%A0' || escape(newText) == "") {
            alert('<%=Ede.Uof.Utility.Page.Common.Resource.GetResource("Common","ErrorNotAllowEmpty") %>');
            args.set_cancel(true);
            setTimeout(function () { node.startEdit(); }, 100);
        }
        else {
            for (var i = 0; i < tree.get_nodes().get_count() ; i++) {
                if (newText == tree.get_nodes().getNode(i).get_text() && index != i) {
                    blnRepeat = true;
                    err = true;
                    alert("<%=lblMsg.Text%>");
                    args.set_cancel(true);
                    setTimeout(function () { node.startEdit(); }, 100);
                    break;
                }
            }
            if (!err) {
                blnRepeat = false;
            }
        }

    }

    function RadToolBar1ButtonClicking(sender, args) {
        var key = args.get_item().get_value();
        switch (key) {
            case "Add":
                if (blnRepeat == false) {
                    blnRepeat = true;
                    var tree = $find('<%= this.treeItems.ClientID %>');
                    var newText = 'New Item';
                    //var node = tree.insertRoot(9999, newText, '');
                    var node = new Telerik.Web.UI.RadTreeNode();
                    node.set_text(newText);
                    node.set_imageUrl("../../Common/Images/Icon/icon_m47.png");
                    tree.trackChanges();
                    tree.get_nodes().add(node);
                    node.set_selected(true);
                    node.startEdit();
                    tree.commitChanges();
                    args.set_cancel(true);
                }
                else {
                    args.set_cancel(true);
                }
                break;
            case "Delete":
                if (!confirm('<%=Ede.Uof.Utility.Page.Common.Resource.GetResource("Common","ConfirmDelete") %>')) {
                    args.set_cancel(true);
                }
                break;
        }
    }
</script>
    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
        <ContentTemplate>
            <asp:CustomValidator ID="cvMessage" runat="server" Display="Dynamic" ForeColor="Red" meta:resourcekey="cvMessageResource1"></asp:CustomValidator>
            <table style="width: 100%" cellspacing="0" class="PopTable">
                <tr>
                    <td style=" white-space:nowrap;">
                        <span style="color: #FF0000">*</span><asp:Label ID="lblPropName" runat="server" 
                            Text="屬性名稱" meta:resourcekey="lblPropNameResource1"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtPropName" runat="server" MaxLength="255" Width="240px" 
                            meta:resourcekey="txtPropNameResource1"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td style="white-space:nowrap">
                        <asp:Label ID="lblPropType" runat="server" Text="屬性類型" 
                            meta:resourcekey="lblPropTypeResource1"></asp:Label>
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlPropType" runat="server" 
                            meta:resourcekey="ddlPropTypeResource1">
                            <asp:ListItem Value="SC" meta:resourcekey="ListItemResource1">單選</asp:ListItem>
                            <asp:ListItem Value="MS" meta:resourcekey="ListItemResource2">多選</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td style="white-space:nowrap">
                        <asp:Label ID="lblItemName" runat="server" Text="屬性值" 
                            meta:resourcekey="lblItemNameResource1"></asp:Label>
                    </td>
                    <td>
                        <table style="width: 100%">
                            <tr>
                                <td>
                                    <telerik:RadToolBar ID="RadToolBar1" runat="server" Width="100%" OnButtonClick="RadToolBar1_OnButtonClick" OnClientButtonClicking="RadToolBar1ButtonClicking" >
                                        <Items>
                                            <telerik:RadToolBarButton runat="server" Text="增加屬性值" Value="Add"
                                                CheckedImageUrl="~/Common/Images/Icon/icon_m02.gif"
                                                DisabledImageUrl="~/Common/Images/Icon/icon_m02.gif"
                                                HoveredImageUrl="~/Common/Images/Icon/icon_m02.gif"
                                                ImageUrl="~/Common/Images/Icon/icon_m02.gif"
                                                meta:resourcekey="RadToolBarAddResource1">
                                            </telerik:RadToolBarButton>
                                            <telerik:RadToolBarButton IsSeparator="true"></telerik:RadToolBarButton>
                                            <telerik:RadToolBarButton runat="server" Text="刪除屬性值" Value="Delete"
                                                CheckedImageUrl="~/Common/Images/Icon/icon_m03.gif"
                                                DisabledImageUrl="~/Common/Images/Icon/icon_m03.gif"
                                                HoveredImageUrl="~/Common/Images/Icon/icon_m03.gif"
                                                ImageUrl="~/Common/Images/Icon/icon_m03.gif"
                                                meta:resourcekey="RadToolBarDeleteResource1">
                                            </telerik:RadToolBarButton>
                                            <telerik:RadToolBarButton IsSeparator="true"></telerik:RadToolBarButton>
                                        </Items>
                                    </telerik:RadToolBar>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                        <ContentTemplate>
                                            <telerik:RadTreeView ID="treeItems" Runat="server" AllowNodeEditing="true" Width="100%" Height="200px" CheckBoxes="True"
                                                 OnNodeEdit="treeItems_NodeEdit" OnClientNodeEditing="treeItems_OnClientNodeEditing"></telerik:RadTreeView>
                                            <asp:HiddenField ID="hidNeedEdit" runat="server" />
                                             </ContentTemplate>
                                             <triggers>
                                                <asp:AsyncPostBackTrigger ControlID="RadToolBar1" EventName="ButtonClick" />
                                            </triggers>
                                    </asp:UpdatePanel>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
              </ContentTemplate>
    </asp:UpdatePanel>
            <asp:HiddenField ID="hiddenMsg" runat="server" value="屬性值不可以重複" />
            <asp:Label ID="lblPropNameIsNull" runat="server" Text="屬性名稱不能為空" Visible="False" 
                    meta:resourcekey="lblPropNameIsNullResource1"></asp:Label>
            <asp:Label ID="lblPropNameExist" runat="server" Text="該屬性名稱已存在" Visible="False" 
                    meta:resourcekey="lblPropNameExistResource1"></asp:Label>
            <asp:Label ID="lblDelete" runat="server" Text="已被使用，不可以刪除" Visible ="False" 
                    meta:resourcekey="lblDeleteResource1"></asp:Label>
            <asp:Label ID="lblPropNameError" runat="server" Text="屬性名稱不可以輸入',''@'符號" 
                    Visible ="False" meta:resourcekey="lblPropNameErrorResource1"></asp:Label>
             <asp:Label ID="lblMsg" runat="server" Visible="False" Text="屬性值不可以重複" 
              meta:resourcekey="lblMsgResource1"></asp:Label>
      
</asp:Content>
