<%@ Page Title="會員搬移" Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" CodeBehind="MoveHierarchicalMember.aspx.cs" Inherits="System_Organization_Group_MoveHierarchicalMember" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script type="text/javascript">
        Sys.Application.add_load(function () {

            if ($("#<%=hiddenX.ClientID%>").val() != "" && $("#<%=hiddenY.ClientID%>").val() != "")
                resizeMemberTree($("#<%=hiddenX.ClientID%>").val(), $("#<%=hiddenY.ClientID%>").val());

            var tree = $find("<%= RadTreeGroup.ClientID %>");
            var selectedNode = tree.get_selectedNode()
            if (selectedNode != null) {
                window.setTimeout(function () { selectedNode.scrollIntoView(); }, 500);
            }
        });

        function resizeMemberTree(X, Y) {

            var treedept = $find("<%=RadTreeGroup.ClientID %>");
            var treeemp = $find("<%=RadTreeMember.ClientID %>");

            treedept.get_element().style.height = Y - 25 + "px";
            treedept.get_element().style.width = X / 2 + "px";

            treeemp.get_element().style.height = Y - 25 + "px";
            treeemp.get_element().style.width = X / 2 + "px";

            $("#<%=hiddenX.ClientID%>").val(X);
            $("#<%=hiddenY.ClientID%>").val(Y);

        }
    </script>

    <asp:ValidationSummary ID="ValidationSummary1" runat="server" meta:resourcekey="ValidationSummary1Resource1" />
    <asp:CustomValidator ID="CustomValidator1" runat="server" Display="None" meta:resourcekey="CustomValidator1Resource1"></asp:CustomValidator>
    <telerik:RadSplitter ID="MainRadSplitter" runat="server" Width="100%" LiveResize="True" BorderSize="0" meta:resourcekey="MainRadSplitterResource1" PanesBorderSize="0" SplitBarsSize="">
        <telerik:RadPane ID="LeftRadPane" runat="server" Scrolling="None" Index="0" meta:resourcekey="LeftRadPaneResource1">
            <table border="0">
                <tr>
                    <td>
                        <img src="<%=themePath %>/images/icon04.gif" width="7" height="7" style="vertical-align: middle">
                        <asp:Label ID="Label1" runat="server" meta:resourcekey="Label1Resource1" Text="群組"></asp:Label></td>
                </tr>
            </table>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <telerik:RadTreeView ID="RadTreeGroup" runat="server" OnNodeClick="RadTreeGroup_NodeClick" Height="400px"
                        EnableNodeTextHtmlEncoding="true"
                        OnNodeDrop="RadTreeGroup_NodeDrop" meta:resourcekey="RadTreeGroupResource1">
                    </telerik:RadTreeView>
                </ContentTemplate>
            </asp:UpdatePanel>
        </telerik:RadPane>
        <telerik:RadPane ID="RightRadPane" runat="server" Scrolling="None" Index="1" meta:resourcekey="RightRadPaneResource1">
            <table border="0">
                <tr>
                    <td>
                        <img src="<%=themePath %>/images/icon04.gif" width="7" height="7" style="vertical-align: middle">
                        <asp:Label ID="Label2" runat="server" meta:resourcekey="Label2Resource1" Text="會員"></asp:Label>
                        <asp:Label ID="Label3" runat="server" meta:resourcekey="Label3Resource1" Text="可拖曳更換群組" CssClass="SizeMemo"></asp:Label>
                    </td>
                </tr>
            </table>
            <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                <ContentTemplate>
                    <telerik:RadTreeView ID="RadTreeMember" runat="server" EnableDragAndDrop="True" Height="400px"
                        EnableNodeTextHtmlEncoding="true"
                        OnNodeDrop="RadTreeGroup_NodeDrop" meta:resourcekey="RadTreeMemberResource1">
                    </telerik:RadTreeView>
                </ContentTemplate>
            </asp:UpdatePanel>
        </telerik:RadPane>
    </telerik:RadSplitter>

    <asp:HiddenField ID="hiddenDropSourceNode" runat="server" />
    <asp:HiddenField ID="hiddenDropTargetNode" runat="server" />
    <asp:HiddenField ID="hiddenNodeId" runat="server" />
    <asp:HiddenField ID="hiddenTreeId" runat="server" />
    <asp:Label ID="lbDuplicateError" runat="server" Text="名稱重複!" Visible="False" meta:resourcekey="lbDuplicateErrorResource1"></asp:Label>
    <asp:HiddenField ID="hiddenX" runat="server" />
    <asp:HiddenField ID="hiddenY" runat="server" />

</asp:Content>
