<%@ Page Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="System_ManageEmployee" Title="人員搬移"
    Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" Codebehind="ManageEmployee.aspx.cs" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <script type="text/javascript">
        Sys.Application.add_load(function () {

            if ($("#<%=hiddenX.ClientID%>").val() != "" && $("#<%=hiddenY.ClientID%>").val() != "")
                resizeTwoTree($("#<%=hiddenX.ClientID%>").val(),$("#<%=hiddenY.ClientID%>").val());

            var tree = $find("<%= RadTreeDept.ClientID %>");
            var selectedNode = tree.get_selectedNode()
            if (selectedNode != null) {
                window.setTimeout(function () { selectedNode.scrollIntoView(); }, 500);
            }
        });

        function resizeTwoTree(X, Y) {

            var treedept = $find("<%=RadTreeDept.ClientID %>");
            var treeemp = $find("<%=RadTreeEmployee.ClientID %>");

            treedept.get_element().style.height = Y - 25 + "px";
            treedept.get_element().style.width = X / 2 + "px";

            treeemp.get_element().style.height = Y - 25 + "px";
            treeemp.get_element().style.width = X / 2 + "px";

            $("#<%=hiddenX.ClientID%>").val(X);
            $("#<%=hiddenY.ClientID%>").val(Y);

        }
    </script>





    <asp:ValidationSummary ID="ValidationSummary1" runat="server" meta:resourcekey="ValidationSummary1Resource1"
        Width="100%" />
    <asp:CustomValidator ID="CustomValidator1" runat="server" Display="None" meta:resourcekey="CustomValidator1Resource1"></asp:CustomValidator>

    <telerik:RadSplitter ID="MainRadSplitter" runat="server" Width="100%" LiveResize="true" ResizeWithBrowserWindow="true" ResizeWithParentPane="true" Orientation="Vertical" BorderSize="0">
        <telerik:RadPane ID="LeftRadPane" runat="server" Scrolling="None">
            <table border="0">
                <tr>
                    <td>
                        <asp:Label ID="Label4" runat="server" Text="" Width="1px"></asp:Label>
                        <img src="<%=themePath %>/images/icon04.gif" width="7" height="7" style="vertical-align: middle">
                        <asp:Label ID="Label3" runat="server" Text="部門" meta:resourcekey="Label3Resource1"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblControlWidth" runat="server" Text="" Width="1px"></asp:Label>
                        <asp:CheckBox ID="chbDisplayAllDept" runat="server" Text="顯示已停用部門" AutoPostBack="true" OnCheckedChanged="chbDisplayAllDept_CheckedChanged" meta:resourcekey="chbDisplayAllDeptResource1" />
                    </td>
                </tr>
            </table>

            <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                <ContentTemplate>
                    <telerik:RadTreeView ID="RadTreeDept" runat="server" EnableDragAndDrop="false" AllowNodeEditing="false" Height="500px" Width="300px"
                        OnNodeClick="RadTreeDept_NodeClick" OnNodeDrop="RadTreeDept_NodeDrop" EnableNodeTextHtmlEncoding="True">
                    </telerik:RadTreeView>
                </ContentTemplate>
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="chbDisplayAllDept" EventName="CheckedChanged"></asp:AsyncPostBackTrigger>
                </Triggers>
            </asp:UpdatePanel>
        </telerik:RadPane>
        <telerik:RadPane ID="RightRadPane" runat="server" Scrolling="None">
            <table border="0">
                <tr>
                    <td>
                        <img src="<%=themePath %>/images/icon04.gif" width="7" height="7" style="vertical-align: middle">
                        <asp:Label ID="Label2" runat="server" Text="員工" meta:resourcekey="Label2Resource1"></asp:Label><asp:Label ID="Label1" runat="server" CssClass="SizeMemo" meta:resourcekey="Label1Resource1"
                            Text="可拖曳更換部門" Font-Size="10pt"></asp:Label></td>
                </tr>

            </table>
            <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                <ContentTemplate>
                    <telerik:RadTreeView ID="RadTreeEmployee" runat="server" EnableDragAndDrop="true" Height="500px" Width="300px"
                        OnNodeDrop="RadTreeDept_NodeDrop" AllowNodeEditing="false" EnableNodeTextHtmlEncoding="True">
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
