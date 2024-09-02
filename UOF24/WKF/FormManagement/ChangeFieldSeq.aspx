<%@ Page Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="WKF_FormManagement_ChangeFieldSeq" Title="調整欄位順序" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" Codebehind="ChangeFieldSeq.aspx.cs" %>
<%@ Register Assembly="System.Web.Extensions" Namespace="System.Web.UI" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <script id="replacejs" type="text/javascript">
        function ReplaceAll(strOrg, strFind, strReplace) {
            var index = 0;
            while (strOrg.indexOf(strFind, index) != -1) {
                strOrg = strOrg.replace(strFind, strReplace);
                index = strOrg.indexOf(strFind, index);
            }
            return strOrg;
        }
    </script>
    <script type="text/javascript">

    function treeVersionField_NodeDragStart(sender, eventArgs) {
        $("#<%= hiddenDropSourceNode.ClientID %>").val(eventArgs.get_node().get_value());
         }

    </script>

    <asp:Panel ID="Panel1" runat="server" Width="100%" Height="430px" ScrollBars="Auto">
        <asp:UpdatePanel id="UpdatePanel1" runat="server" RenderMode="Inline" UpdateMode="Conditional">
            <contenttemplate>
<TABLE width="100%" border=0><TBODY><TR><TD vAlign=top background="<%=themePath %>/images/tree_bg.gif">
    <telerik:RadTreeView ID="treeVersionField" Runat="server" OnNodeDrop="RadTreeView1_NodeDrop" EnableDragAndDrop="true" 
        OnClientNodeDragStart="treeVersionField_NodeDragStart">

    </telerik:RadTreeView>
    <asp:HiddenField id="hiddenFirstField" runat="server"></asp:HiddenField> <INPUT id="hiddenNodeId" type=hidden runat="server" /> <INPUT id="hiddenDropSourceNode" type=hidden runat="server" /> </TD></TR></TBODY></TABLE>
</contenttemplate>
        </asp:UpdatePanel>
    </asp:Panel>
</asp:Content>
