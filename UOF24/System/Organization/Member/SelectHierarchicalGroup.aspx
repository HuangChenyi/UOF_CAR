<%@ Page Title="選取群組" Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" CodeBehind="SelectHierarchicalGroup.aspx.cs" Inherits="System_Organization_Member_SelectHierarchicalGroup" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" %>

<%@ Register Src="~/Common/Organization/UC_GroupManagerTree.ascx" TagPrefix="uc" TagName="UC_GroupManagerTree" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script type="text/javascript">
        function resizeSelTree(X, Y) {
            var tree = $find("<%=RadTreeView1.ClientID %>");

            tree.get_element().style.height = Y + "px";
            tree.get_element().style.width = X + "px";
            $("#<%=hiddenX.ClientID%>").val(X);
            $("#<%=hiddenY.ClientID%>").val(Y);
        }

    Sys.Application.add_load(function () {

        if ($("#<%=hiddenX.ClientID%>").val() != "" && $("#<%=hiddenY.ClientID%>").val() != "")
            resizeSelTree($("#<%=hiddenX.ClientID%>").val(), $("#<%=hiddenY.ClientID%>").val());

        var tree = $find("<%= RadTreeView1.ClientID %>");
        var selectedNode = tree.get_selectedNode()
        if (selectedNode != null) {
            window.setTimeout(function () { selectedNode.scrollIntoView(); }, 200);
        }
    });
    </script>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <telerik:RadTreeView ID="RadTreeView1" runat="server" Height="400px" Width="200px" meta:resourcekey="RadTreeView1Resource1"></telerik:RadTreeView>
        </ContentTemplate>
    </asp:UpdatePanel>
    <asp:HiddenField ID="hiddenX" runat="server" />
    <asp:HiddenField ID="hiddenY" runat="server" />
</asp:Content>
