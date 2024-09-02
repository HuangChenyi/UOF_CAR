<%@ Page Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="Basic_Personal_AddressBook_ManageMyAddrClass" Title="通訊錄類別設定" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" Codebehind="ManageMyAddrClass.aspx.cs" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <script language="javascript" type="text/javascript">

        function RadToolBar1_ButtonClicking(sender, args) {
            //args.set_cancel(true);
            var tree = $find("<%= rtvTreeClass.ClientID %>");
            var value = args.get_item().get_value();

            if (value == "createClass") {
                SetToolbarEnable(false);
                var node = new Telerik.Web.UI.RadTreeNode();
                node.set_text("New Class");
                node.set_imageUrl("<%=Request.ApplicationPath %>" + "/Common/Images/Icon/icon_m40.gif");
                tree.trackChanges();

                tree.get_nodes().add(node);
                node.set_selected(true);
                node.set_expanded(true);
                node.startEdit();
                tree.commitChanges();
                //args.set_cancel(true);
            }
            else if (value == "delete") {
                var node = tree.get_selectedNode();
                if (node != null) {
                    if (confirm('<%=msgDelconfirm.Text %>')) {
                          SetToolbarEnable(true);
                          var deletedata = [node.get_value(), node.Id];
                          result = $uof.pageMethod.sync("DeleteClass", deletedata)
                          var flag = alertError(result);
                          if (flag == 2) {
                              node.get_parent().get_nodes().remove(node);
                              top.returnValue = "";
                          }

                          SetToolbarEnable(true);
                      }
                      else {
                          args.set_cancel(false);
                      }
                  }
            }

            $uof.dialog.set_returnValue("NeedPostBack");

      }
      function SetToolbarEnable(enable) {
          var toolbar = $find("<%=RadToolBar1.ClientID%>");
            toolbar.findItemByValue("createClass").set_enabled(enable);
            toolbar.findItemByValue("delete").set_enabled(enable);
        }

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
                return 2;
            }
        }// end alertError

        function classTreeClientNodeEditing(sender, args) {
            var node = args.get_node();

            var classID = node.get_value();
            var text = args.get_newText();
            if (escape(text) == '%A0') {
                alert('<%=Ede.Uof.Utility.Page.Common.Resource.GetResource("Common","ErrorNotAllowEmpty") %>!');
                node.set_allowEdit(false);
            }
            else {
                var classGUID = node.get_value();
                if (classID == null || classID == "") {
                    var userGuid = $uof.tool.htmlDecode('<%= System.Web.Security.AntiXss.AntiXssEncoder.HtmlEncode(hidUserGuid.Value,true)%>'); 
                    var createdata = [text, node.get_value(), userGuid];
                    var result = $uof.pageMethod.sync("CreateClass", createdata);

                    var flag = alertError(result);
                    if (flag == 0)
                    { node.get_parent().get_nodes().remove(node); }
                    else if (flag == 1) {
                        setTimeout(function () { node.startEdit(); }, 100);
                    }
                    else if (flag == 2) {
                        node.set_value(result);
                        top.returnValue = "";
                    }
                    SetToolbarEnable(true);
                }
                else {
                    var changedata = [classID, text, node.get_value()];
                    var result = $uof.pageMethod.sync("ChangeClassName", changedata);

                    var flag = alertError(result);
                    if (flag == 0) {
                        node.set_text(text);
                        setTimeout(function () { node.startEdit(); }, 100);
                    }
                    else if (flag == 1) {
                        setTimeout(function () { node.startEdit(); }, 100);
                    }
                    else if (flag == 2) {
                        $uof.dialog.set_returnValue("NeedPostBack");
                        top.returnValue = "";
                    }
                    SetToolbarEnable(true);
                }
            }
        }

    </script>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <asp:ValidationSummary ID="ValidationSummary1" runat="server" meta:resourcekey="ValidationSummary1Resource1" BackColor="Red" ForeColor="White" />
            <asp:CustomValidator ID="CustomValidator1" runat="server" ForeColor="Blue" Display="None" meta:resourcekey="CustomValidator1Resource1"></asp:CustomValidator>
            <telerik:RadSplitter ID="MasterRdSplitter" runat="server"  Width="100%" LiveResize="true" ResizeWithBrowserWindow="true" ResizeWithParentPane="true" Orientation="Horizontal" BorderSize="0">
                <telerik:RadPane ID="TopRdPanel" runat="server"  Height="35px" Scrolling="None">
                    <telerik:RadToolBar ID="RadToolBar1" runat="server" Width="100%" OnClientButtonClicking="RadToolBar1_ButtonClicking" meta:resourcekey="RadToolBar1Resource1">
                        <Items>
                            <telerik:RadToolBarButton runat="server" Text="新增類別" Value="createClass"
                                ClickedImageUrl="~/Common/Images/Icon/icon_m40.gif" DisabledImageUrl="~/Common/Images/Icon/icon_m40.gif"
                                HoveredImageUrl="~/Common/Images/Icon/icon_m40.gif" ImageUrl="~/Common/Images/Icon/icon_m40.gif" meta:resourcekey="RadToolBarButtonResource1">
                            </telerik:RadToolBarButton>
                            <telerik:RadToolBarButton runat="server" IsSeparator="true" meta:resourcekey="RadToolBarButtonResource2">
                            </telerik:RadToolBarButton>
                            <telerik:RadToolBarButton runat="server" Text="刪除" Value="delete"
                                ClickedImageUrl="~/EIP/Personal/icon_images/icon_m03.gif" DisabledImageUrl="~/EIP/Personal/icon_images/icon_m03.gif"
                                HoveredImageUrl="~/EIP/Personal/icon_images/icon_m03.gif" ImageUrl="~/EIP/Personal/icon_images/icon_m03.gif" meta:resourcekey="RadToolBarButtonResource3">
                            </telerik:RadToolBarButton>
                            <telerik:RadToolBarButton runat="server" IsSeparator="true" meta:resourcekey="RadToolBarButtonResource4">
                            </telerik:RadToolBarButton>
                        </Items>
                    </telerik:RadToolBar>
                </telerik:RadPane>
                <telerik:RadPane ID="TreeRdPanel" runat="server">
                    <telerik:RadTreeView ID="rtvTreeClass" runat="server" Height="100%" AllowNodeEditing="true" EnableNodeTextHtmlEncoding="true"
                        OnClientNodeEditing="classTreeClientNodeEditing">
                    </telerik:RadTreeView>
                </telerik:RadPane>
            </telerik:RadSplitter>
            <asp:HiddenField ID="hiddenNodeId" runat="server" />
            <asp:HiddenField ID="hidUserGuid" runat="server" />
            <asp:Label ID="msgDelconfirm" runat="server" Text="確定要刪除?" Visible="False" meta:resourcekey="msgDelconfirmResource1"></asp:Label>
            <asp:Label ID="msgNotEmpty" runat="server" Text="類別不允許空白" Visible="False" meta:resourcekey="msgNotEmptyResource1"></asp:Label>
            <asp:Label ID="msgStrtoolong" runat="server" Text="字數不可超過50" Visible="False" meta:resourcekey="msgStrtoolongResource1"></asp:Label>
            <asp:Label ID="msgNameduplicate" runat="server" Text="名稱重複" Visible="False" meta:resourcekey="msgNameduplicateResource1"></asp:Label>
            <asp:Label ID="msgNotdelete" runat="server" Text="類別下有聯絡人不可刪除" Visible="False" meta:resourcekey="msgNotdeleteResource1"></asp:Label>
            <asp:Label ID="msgMustselectnode" runat="server" Text="請先選擇節點" Visible="False" meta:resourcekey="msgMustselectnodeResource1"></asp:Label>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
