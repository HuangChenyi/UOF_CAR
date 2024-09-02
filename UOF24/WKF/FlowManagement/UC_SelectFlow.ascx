<%@ Control Language="C#" AutoEventWireup="true" Inherits="WKF_FlowManagement_UC_SelectFlow" Codebehind="UC_SelectFlow.ascx.cs" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>


 <script type="text/javascript" id="telerikClientEvents1">

     function RadToolBar1_Clicking(sender, args) {
         var value = args.get_item().get_value();

         if (value == "ShowFlow") {
             args.set_cancel(true);
             var subFlowId = $find("<%=treeSubFlow.ClientID%>").get_selectedNode().get_value();
             $uof.dialog.open2("~/WKF/Browse/ViewSubFlow.aspx", args.get_item(), "<%=dialogTitleName%>", 600, 650, function () { return false; }, {"subFlowId":subFlowId.split('@')[1]});
         }

         if (value == "ShowParallelFlow") {
             args.set_cancel(true);
             var paraFlowId = $find("<%=treeSubFlow.ClientID%>").get_selectedNode().get_value();
             $uof.dialog.open2("~/WKF/Browse/ViewParallelFlow.aspx", args.get_item(), "<%=lblViewParallel.Text%>", 600, 650, function () { return false; }, { "flowID": paraFlowId.split('@')[1] });
         }

         args.set_cancel(true);
         
     }
    </script>

<div style="text-align: center">
    <table border="0" cellpadding="0" cellspacing="0" width="96%" style="height: 100%">
        <tr>
            <td align="left" valign="middle" style="height: 40px">
                <telerik:RadToolBar ID="RadToolBar1" runat="server" Width="100%" OnClientButtonClicking="RadToolBar1_Clicking">
                    <Items>
                        <telerik:RadToolBarButton runat="server" IsSeparator="True" Text="Button 0" ImageUrl="~/App_Themes/DefaultTheme/images/toolbarSp.jpg">
                        </telerik:RadToolBarButton>
                        <telerik:RadToolBarButton runat="server" Value="ShowFlow" Text="觀看流程" meta:resourceKey="TBarButtonResource1">
                        </telerik:RadToolBarButton>
                        <telerik:RadToolBarButton runat="server" Value="ShowParallelFlow" Text="觀看流程" Visible="false" meta:resourceKey="TBarButtonResource2">
                        </telerik:RadToolBarButton>
                        <telerik:RadToolBarButton runat="server" IsSeparator="True" Text="Button 3" ImageUrl="~/App_Themes/DefaultTheme/images/toolbarSp.jpg">
                        </telerik:RadToolBarButton>
                    </Items>

                </telerik:RadToolBar>
                <telerik:RadTreeView ID="treeSubFlow" runat="server" Width="100%" Height="450px" OnNodeClick="treeSubFlow_NodeClick"
                    ></telerik:RadTreeView>
            </td>
        </tr>
        <tr>
            <td align="left" valign="top">
            </td>
        </tr>
    </table>
    <asp:HiddenField ID="hfOldNode" runat="server" />
    <asp:Label ID="lblRootSub" runat="server" Text="一般副流程" Visible="False" 
        meta:resourcekey="lblRootSubResource1"></asp:Label>
    <asp:Label ID="lblRootParallel" runat="server" Text="平行流程" Visible="False" 
        meta:resourcekey="lblRootParallelResource1"></asp:Label>
    <asp:Label ID="lblViewParallel" runat="server" Text="觀看平行流程" Visible="False" 
        meta:resourcekey="lblViewParallelResource1"></asp:Label>
</div>
