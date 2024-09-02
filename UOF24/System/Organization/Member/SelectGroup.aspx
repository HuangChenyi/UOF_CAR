<%@ Page Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="System_Organization_Member_SelectGroup"
    Title="選取群組" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" Codebehind="SelectGroup.aspx.cs" %>

<%@ Register Src="~/common/organization/grouptree.ascx" TagPrefix="uc" TagName="GroupTree" %>



<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
<script type="text/javascript">
    function resizeSelTree(X, Y) {
        var tree = $find("<%=ucGroupTree.TreeClientId %>");

            tree.get_element().style.height = Y + "px";
            tree.get_element().style.width = X + "px";
            $("#<%=hiddenX.ClientID%>").val(X);
            $("#<%=hiddenY.ClientID%>").val(Y);
        }

    Sys.Application.add_load(function () {

        if ($("#<%=hiddenX.ClientID%>").val() != "" && $("#<%=hiddenY.ClientID%>").val() != "")
            resizeSelTree($("#<%=hiddenX.ClientID%>").val(), $("#<%=hiddenY.ClientID%>").val());

        var tree = $find("<%= ucGroupTree.TreeClientId %>");
            var selectedNode = tree.get_selectedNode()
            if (selectedNode != null) {
                window.setTimeout(function () { selectedNode.scrollIntoView(); }, 200);
            }
        });
</script>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <uc:GroupTree runat="server" ID="ucGroupTree" Height="400px" Width="200px" />
        </ContentTemplate>
    </asp:UpdatePanel>
    <asp:HiddenField ID="hiddenX" runat="server" />
    <asp:HiddenField ID="hiddenY" runat="server" />
</asp:Content>
