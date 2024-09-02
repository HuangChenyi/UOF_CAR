<%@ Page Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="WKF_FlowManagement_AdjustBranchPriority" Title="節點順序調整" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" Codebehind="AdjustBranchPriority.aspx.cs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <script type="text/javascript">
    function treeBranchSiteNodes2_NodeDragStart(sender, eventArgs) {
        $("#<%= hiddenSourceNodeId.ClientID %>").val(eventArgs.get_node().get_value());
        }

        Sys.Application.add_load(function () {
            if ($("#<%=hiddenX.ClientID%>").val() != "" && $("#<%=hiddenY.ClientID%>").val() != "") {
                treeResize($("#<%=hiddenX.ClientID%>").val(), $("#<%=hiddenY.ClientID%>").val());
            }
        });

        function treeResize(X, Y) {

            var tree = $find("<%=treeBranchSiteNodes2.ClientID %>");
            tree.get_element().style.height = Y * 0.85 + "px";
            tree.get_element().style.width = X * 0.8 + "px";
                  $("#<%=hiddenX.ClientID%>").val(X);
          $("#<%=hiddenY.ClientID%>").val(Y);

              }

    </script>
    <div>
        <br />
        <table cellspacing="1" style="width:90%;margin-left:5%;margin-right:5%" class="PopTable">
            <tr>
                <td style="background-image: url(../../App_Themes/DefaultTheme/images/po_06.gif); height: 27px;text-align:center">
                    <asp:Label ID="lblTitle" runat="server" Text="節點順序調整" meta:resourcekey="lblTitleResource1"></asp:Label></td>
            </tr>
            <tr>
                <td class="PopTableRightTD" valign="top" style="text-align: left;width:90%;height:90%">
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        <ContentTemplate>
                            <telerik:RadTreeView ID="treeBranchSiteNodes2" runat="server" EnableDragAndDrop="true"
                                OnClientNodeDragStart="treeBranchSiteNodes2_NodeDragStart" Width="90%" Height="90%"
                                OnNodeDrop="treeBranchSiteNodes2_NodeDrop">
                            </telerik:RadTreeView>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </td>
            </tr>
        </table>
        <asp:HiddenField ID="hiddenSourceNodeId" runat="server" />
    </div>
    <asp:HiddenField ID="hiddenX" runat="server" />
    <asp:HiddenField ID="hiddenY" runat="server" />
</asp:Content>

