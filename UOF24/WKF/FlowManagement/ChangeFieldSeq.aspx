<%@ Page Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="WKF_FlowManagement_ChangeFieldSeq" Title="調整欄位順序" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" Codebehind="ChangeFieldSeq.aspx.cs" %>
<%@ Register Assembly="System.Web.Extensions" Namespace="System.Web.UI" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <script id="ChangeFieldSeqJS" type="text/javascript">


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
    function treeVersionField2_NodeDragStart(sender, eventArgs) {
        $("#<%= hiddenDropSourceNode.ClientID %>").val(eventArgs.get_node().get_value());
    }

    </script>
    <asp:Panel ID="Panel1" runat="server" Width="100%" Height="430px" ScrollBars="Auto"
        meta:resourcekey="Panel1Resource1">
        <asp:UpdatePanel id="UpdatePanel1" runat="server" RenderMode="Inline" UpdateMode="Conditional">
            <contenttemplate>
<TABLE width="100%" border=0>
    <TBODY>
    <TR>
        <TD vAlign=top background="/images/tree_bg.gif">
            <telerik:RadTreeView ID="treeVersionField2" Runat="server" EnableDragAndDrop="true" OnClientNodeDragStart="treeVersionField2_NodeDragStart" OnNodeDrop="treeVersionField2_NodeDrop">

            </telerik:RadTreeView>
            <asp:HiddenField id="hiddenFirstField" runat="server"></asp:HiddenField> 
    <input id="hiddenNodeId" runat="server" type="hidden"></input>
        <input id="hiddenDropSourceNode" runat="server" type="hidden"></input>
        </input>
    </input>
    </TD></TR></TBODY></TABLE>
</contenttemplate>
        </asp:UpdatePanel>
    </asp:Panel>
</asp:Content>
