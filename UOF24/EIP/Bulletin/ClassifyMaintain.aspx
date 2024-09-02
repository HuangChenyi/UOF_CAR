<%@ Page Title="分類公告維護" Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" CodeBehind="ClassifyMaintain.aspx.cs" Inherits="Ede.Uof.Web.EIP.Bulletin.ClassifyMaintain" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <script type="text/javascript">
         //前端移除node
<%--         function NodeDoubleClick(sender, args) {
             var tree = $find("<%=rdtvWebpartBulletin.ClientID%>");
               var node = tree.get_selectedNode();
               if (node != null) {
                   tree.trackChanges();
                   node.get_parent().get_nodes().remove(node);
                   tree.commitChanges();
               }
         }--%>

         function RadToolBar_ButtonClicking(sender, args) {
             var key = args.get_item().get_value();
             if (key == "DeleteClass") {
                 if (!confirm('<%=lblDelconfirm.Text%>')){
                     args.set_cancel(true);                 
                 }
             }
         }
      
     </script>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <table style="width:100%;border:0px;padding:0;border-spacing:0">
                <tr>
                    <td style="vertical-align:top;width:280px">
                        <telerik:RadTreeView ID="rdtvBulletinClass" runat="server" OnNodeClick="rdtvBulletinClass_NodeClick" meta:resourcekey="rdtvBulletinClassResource1">
                            <Nodes>
                                <telerik:RadTreeNode Value="InnerClass" Enabled="False" runat="server" meta:resourcekey="RadTreeNodeResource1"></telerik:RadTreeNode>
                                <telerik:RadTreeNode Value="OuterClass" Enabled="False" runat="server" meta:resourcekey="RadTreeNodeResource2"></telerik:RadTreeNode>
                            </Nodes>
                        </telerik:RadTreeView>
                    </td>
                    <td style="width:5px">
                    </td>
                    <td style="vertical-align:top">
                        <telerik:RadToolBar ID="rdEditToolBar" runat="server" Width="100%" OnButtonClick="rdEditToolBar_ButtonClick" OnClientButtonClicking="RadToolBar_ButtonClicking" meta:resourcekey="rdEditToolBarResource1" SingleClick="None">
                            <Items>
                                <telerik:RadToolBarButton runat="server" Text="儲存" DisabledImageUrl="~/Common/Images/Icon/icon_m66.png"
                                    HoveredImageUrl="~/Common/Images/Icon/icon_m66.png" ImageUrl="~/Common/Images/Icon/icon_m66.png"
                                    CheckedImageUrl="~/Common/Images/Icon/icon_m66.png" Value="Save" meta:resourcekey="RadToolBarButtonResource1" >
                                </telerik:RadToolBarButton>
                                <telerik:RadToolBarButton runat="server" IsSeparator="True" meta:resourcekey="RadToolBarButtonResource2"  />
                                <telerik:RadToolBarButton runat="server" HoveredImageUrl="~/Common/Images/Icon/icon_m03.png" 
                                    ImageUrl="~/Common/Images/Icon/icon_m03.png"
                                    Value="DeleteClass" CheckedImageUrl="~/Common/Images/Icon/icon_m03.png" Text="移除類別" 
                                    DisabledImageUrl="~/Common/Images/Icon/icon_m03.png" meta:resourcekey="RadToolBarButtonResource3">
                                </telerik:RadToolBarButton>
                                <telerik:RadToolBarButton runat="server" IsSeparator="True" meta:resourcekey="RadToolBarButtonResource4"  />
                                <telerik:RadToolBarButton runat="server" HoveredImageUrl="~/Common/Images/Icon/icon22_04.png"
                                    ImageUrl="~/Common/Images/Icon/icon22_04.png" CheckedImageUrl="~/Common/Images/Icon/icon22_04.png"
                                    Value="Up" Text="上移" meta:resourcekey="RadToolBarButtonResource5">
                                </telerik:RadToolBarButton>
                                <telerik:RadToolBarButton runat="server" IsSeparator="True" meta:resourcekey="RadToolBarButtonResource6"  />
                                <telerik:RadToolBarButton runat="server" HoveredImageUrl="~/Common/Images/Icon/icon22_05.png"
                                    ImageUrl="~/Common/Images/Icon/icon22_05.png" CheckedImageUrl="~/Common/Images/Icon/icon22_05.png"
                                    Value="Down" Text="下移" meta:resourcekey="RadToolBarButtonResource7">
                                </telerik:RadToolBarButton>  
                                <telerik:RadToolBarButton runat="server" IsSeparator="True" meta:resourcekey="RadToolBarButtonResource6"  />
                                <telerik:RadToolBarButton runat="server" Value="hasSave">
                                    <ItemTemplate>
                                        <asp:Label runat="server" ID="lalSaveMsg" Text="己儲存" ForeColor="Blue" Visible="false" meta:resourcekey="lalSaveMsgResource1" ></asp:Label>
                                    </ItemTemplate>
                                </telerik:RadToolBarButton>
                            </Items>
                        </telerik:RadToolBar>
                        <div>
                            <fieldset style="height:100%;padding:2px" >
                                <legend>
                                    <asp:Label runat="server" Text="依序顯示於內部的分類公告面板" meta:resourcekey="LabelResource1"></asp:Label>
                                </legend>
                                <table>
                                    <tr>
                                        <asp:Label ID="lblexist" runat="server" Text="此類別已存在" ForeColor="Red" Visible="False" meta:resourcekey="lblexistResource1"></asp:Label>
                                    </tr>
                                    <telerik:RadTreeView ID="rdtvInnerBulletin" runat="server" CheckBoxes="True" meta:resourcekey="rdtvWebpartBulletinResource1" OnNodeClick="rdtvInnerBulletin_NodeClick" OnNodeCheck="rdtvInnerBulletin_NodeCheck" TriStateCheckBoxes="False">
                                    </telerik:RadTreeView>
                                </table>                                 
                            </fieldset>
                        </div>
                        <div style="height:50px"></div>
                         <div>
                            <fieldset style="height:100%;padding:2px" >
                                <legend>
                                    <asp:Label runat="server" Text="依序顯示於外部的分類公告面板" meta:resourcekey="LabelOuterResource1" ></asp:Label>
                                </legend>
                                <table>
                                    <tr>
                                        <asp:Label ID="lblOuterExist" runat="server" Text="此類別已存在" ForeColor="Red" Visible="False" meta:resourcekey="lblOuterExistResource1"></asp:Label>
                                    </tr>
                                    <telerik:RadTreeView ID="rdtvOuterBulletin" runat="server" CheckBoxes="True" OnNodeCheck="rdtvOuterBulletin_NodeCheck" OnNodeClick="rdtvOuterBulletin_NodeClick" TriStateCheckBoxes="False">
                                    </telerik:RadTreeView>
                                </table>                                 
                            </fieldset>
                        </div>
                    </td>
                </tr>
            </table>
            <asp:Label ID="lblInnerClass" runat="server" Text="內部公告" Visible="False" meta:resourcekey="lblInnerClassResource1" ></asp:Label>
            <asp:Label ID="lblOuterClass" runat="server" Text="外部公告" Visible="False" meta:resourcekey="lblOuterClassResource1" ></asp:Label>
            <asp:Label ID="lblDelconfirm" runat="server" Text="確定要刪除?" Visible="False" meta:resourcekey="lblDelconfirmResource1"></asp:Label>
            <asp:HiddenField runat="server" ID="hfCurrentUser"></asp:HiddenField>
            <asp:HiddenField runat="server" ID="hfUserFrom"></asp:HiddenField>
        </ContentTemplate>        
    </asp:UpdatePanel>
</asp:Content>
