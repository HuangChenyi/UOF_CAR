<%@ Page Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="WKF_Custom_SelectGroupSite" Culture="auto"
    UICulture="auto" Codebehind="SelectGroupSite.aspx.cs" %>
<%@ Register Assembly="System.Web.Extensions"
    Namespace="System.Web.UI" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    
    <script type="text/javascript">
        <!--
        function treeCustGroupFlowSite2_NodeDragging(sender, eventArgs) {
    }

    function treeCustGroupFlowSite2_NodeDragStart(sender, eventArgs) {
        $("#<%=hiddenSourceNodeId.ClientID %>").val(eventArgs.get_node().get_value());
    }

    function treeCustGroupFlowSite2_NodeDropping(sender, eventArgs) {
        clientSideEdit(sender, eventArgs);
        eventArgs.set_cancel(true);
        return;
    }

    function clientSideEdit(sender, args) {
        var destinationNode = args.get_destNode();

        if (destinationNode) {
            var firstTreeView = $find('<%= treeCustGroupFlowSite2.ClientID %>');

            firstTreeView.trackChanges();
            var sourceNodes = args.get_sourceNodes();
            var dropPosition = args.get_dropPosition();

            for (var i = sourceNodes.length - 1; i >= 0; i--) {
                var sourceNode = sourceNodes[i];
                sourceNode.get_parent().get_nodes().remove(sourceNode);
                insertBefore(destinationNode, sourceNode);
            }

            destinationNode.set_expanded(true);
            firstTreeView.commitChanges();
        }
    }

    function insertBefore(destinationNode, sourceNode) {
        var destinationParent = destinationNode.get_parent();
        var index = destinationParent.get_nodes().indexOf(destinationNode);
        destinationParent.get_nodes().insert(index, sourceNode);
    }

    function insertAfter(destinationNode, sourceNode) {
        var destinationParent = destinationNode.get_parent();
        var index = destinationParent.get_nodes().indexOf(destinationNode);
        destinationParent.get_nodes().insert(index + 1, sourceNode);
    }
        //-->
    Sys.Application.add_load(function () {
        if ($("#<%=hiddenX.ClientID%>").val() != "" && $("#<%=hiddenY.ClientID%>").val() != "")
                      resizeAllTree($("#<%=hiddenX.ClientID%>").val(), $("#<%=hiddenY.ClientID%>").val());
              });

      function resizeAllTree(X, Y) {

          var treeLeft = $find("<%=treeCustGroupFlowSite2.ClientID %>");
          var treeRight = $find("<%=treeGroupFlowSite.ClientID%>");

          treeLeft.get_element().style.height = Y - 50 + "px";
          treeLeft.get_element().style.width = X / 2 - 35 + "px";

          treeRight.get_element().style.height = Y - 50 + "px";
          treeRight.get_element().style.width = X / 2 - 35 + "px";

          $("#<%=hiddenX.ClientID%>").val(X);
          $("#<%=hiddenY.ClientID%>").val(Y);

      }
    </script>

    <table width="99%" align="center" height="100%">
        <tr>
            <td valign="top" width="47%" height="100%">
                <table cellpadding="0" cellspacing="0" height="100%" width="100%" class="PopTable">
                    <tr>
                        <td class="PopTableLeftTD" style="height:45px;width: 50%; text-align: center;vertical-align:middle">
                            <asp:Label ID="Label5" runat="server" Text="簽核流程" meta:resourcekey="Label5Resource2"></asp:Label>
                            <asp:CustomValidator Display="Dynamic" ErrorMessage="自選流程不允許為空" ID="CustomValidatorRequire"
                                meta:resourcekey="CustomValidatorRequireResource1" runat="server" />
                            <br />
                            <asp:Label ID="Label2" runat="server" Text="註：請以拖曳節點方式，調整流程優先順序" meta:resourcekey="Label2Resource1"
                                ForeColor="Blue"></asp:Label></td>
                    </tr>
                    <tr>
                        <td style="text-align: left; vertical-align: top; width: 50%" class="PopTableRightTD">
                            <asp:UpdatePanel id="UpdatePanel1" runat="server" RenderMode="Inline" UpdateMode="Conditional">
                                <contenttemplate>
 <telerik:RadTreeView ID="treeCustGroupFlowSite2" Runat="server" Width="500px" Height="300px" 
     OnClientNodeDragging="treeCustGroupFlowSite2_NodeDragging" 
     OnClientNodeDragStart="treeCustGroupFlowSite2_NodeDragStart"
     OnClientNodeDropping="treeCustGroupFlowSite2_NodeDropping"
     EnableDragAndDrop="True">
                                        </telerik:RadTreeView>
</contenttemplate>
                                <triggers>
<asp:AsyncPostBackTrigger ControlID="btnAdd" EventName="Click"></asp:AsyncPostBackTrigger>
<asp:AsyncPostBackTrigger ControlID="btnRemove" EventName="Click"></asp:AsyncPostBackTrigger>
</triggers>
                            </asp:UpdatePanel>
                        </td>
                    </tr>
                </table>
            </td>
            <td  style="min-width:50px;vertical-align:middle;text-align:center" >
                <telerik:RadButton ID="btnAdd" runat="server" CausesValidation="False" Text="<--" meta:resourcekey="btnAddResource2" OnClick="btnAdd_Click1"></telerik:RadButton>
                <br />
                <br />
                <telerik:RadButton ID="btnRemove" runat="server" Text="-->" meta:resourcekey="btnRemoveResource2" OnClick="btnRemove_Click1"></telerik:RadButton>
            </td>
            <td style="vertical-align:top;width:47%;height:100%" >
                <table border="1" cellpadding="0" cellspacing="0" height="100%" width="100%" class="PopTable">
                    <tr>
                        <td align="center" class="PopTableLeftTD" style="height:45px;width: 50%; text-align: center;vertical-align:middle">
                            <asp:Label ID="Label3" runat="server" Text="請選擇下列簽核流程" meta:resourcekey="Label3Resource2"></asp:Label></td>
                    </tr>
                    <tr>
                            <td class="PopTableRightTD" style="text-align: left;" valign="top" width="50%">
                            <asp:UpdatePanel id="UpdatePanel2" runat="server" RenderMode="Inline" UpdateMode="Conditional">
                                <contenttemplate>
                                    <telerik:RadTreeView ID="treeGroupFlowSite" Runat="server" Width="500px" Height="300px"></telerik:RadTreeView>
                                </contenttemplate>
                                <triggers>
<asp:AsyncPostBackTrigger ControlID="btnAdd" EventName="Click"></asp:AsyncPostBackTrigger>
<asp:AsyncPostBackTrigger ControlID="btnRemove" EventName="Click"></asp:AsyncPostBackTrigger>
</triggers>
                            </asp:UpdatePanel>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>

    </table>
    <asp:HiddenField ID="hiddenSourceNodeId" runat="server" />
    <asp:HiddenField ID="hiddenX" runat="server" />
    <asp:HiddenField ID="hiddenY" runat="server" />
</asp:Content>
