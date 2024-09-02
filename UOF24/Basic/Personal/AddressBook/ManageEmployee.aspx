<%@ Page Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="Basic_Personal_AddressBook_ManageEmployee" Title="人員搬移" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" Codebehind="ManageEmployee.aspx.cs" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


<script language="javascript" type="text/javascript">
  
    function treeEmployee_NodeClicking(sender, eventArgs)
    {
        var nodeId = eventArgs.get_node().get_value();
     
        eventArgs.set_cancel(false);
    }
    
   
    function treeEmployee_NodeDropping(sender, args)
    {
        var nDest = args.get_destNode();
        var nSource = args.get_sourceNode();
        if (nDest) {
            var tree = nDest.get_treeView();
            var level = nDest.get_level();
            var position = args.get_dropPosition();

            if (level == "0" && (position == "above" || position == "below")) {
                args.set_cancel(true);
                return;
            }
            switch (position) {
                case "over":

                $("#<%=hiddenDropTargetNode.ClientID %>").val(nDest.get_value());
                $("#<%=hiddenDropSourceNode.ClientID %>").val(nSource.get_value());   
            }
            tree.commitChanges();
            nDest.set_expanded(true);

            $uof.dialog.set_returnValue("NeedPostBack");
        }

    }
 
</script>
    <table>
        <tr>
            <td>
                <asp:ValidationSummary ID="ValidationSummary1" runat="server" meta:resourcekey="ValidationSummary1Resource1" />
                <asp:CustomValidator ID="CustomValidator1" runat="server" Display="None" meta:resourcekey="CustomValidator1Resource1"></asp:CustomValidator></td>
        </tr>
    </table>
    <table width="100%"   style=" height:100%;  border:0;">
        <tr style=" height:15px; text-align: left; " class="PopTableLeftTD">
            <td  style="height: 15px; " class="g">
                <img src="<%=themePath %>/images/icon04.gif" width="7" height="7" >
                <asp:Label ID="Label3" runat="server" Text="類別" meta:resourcekey="Label3Resource1"></asp:Label></td>
            <td class="g" style="height: 15px; vertical-align:top">
                <img src="<%=themePath %>/images/icon04.gif" width="7" height="7">
                <asp:Label ID="Label2" runat="server" Text="聯絡人" meta:resourcekey="Label2Resource1"></asp:Label></td>
        </tr>
        <tr style=" height:15px; text-align: left;" class="PopTableLeftTD" >
        <td></td>
        <td style="vertical-align:top;">
            <asp:Label ID="Label1" runat="server" ForeColor="#669933" meta:resourcekey="Label1Resource1"
                Text="可拖曳更換類別" CssClass="SizeS"></asp:Label></td>
        </tr>
        <tr>
        <td class="PopTableLeftTD"style="width:50%; vertical-align:top; height:100%">
            <table width="99%" style="height:100%;">
                <tr>
                    <td style="background-image: url(<%=themePath %>/images/tree_bg.gif); text-align:left;vertical-align:top;">
                        <telerik:RadTreeView ID="treeMyAddr" runat="server" OnNodeClick="treeMyAddr_NodeClick"  EnableDragAndDrop="True" EnableNodeTextHtmlEncoding="true"></telerik:RadTreeView>
                    </td>
                </tr>
            </table>
        </td>
        <td  style="background-image: url(<%=themePath %>/images/tree_bg.gif); width:50%; vertical-align:top;">
             <telerik:RadTreeView ID="treeEmployee" runat="server" EnableDragAndDrop="true" OnClientNodeClicking="treeEmployee_NodeClicking" OnClientNodeDropping="treeEmployee_NodeDropping" OnNodeDrop="treeEmployee_NodeDrop" EnableNodeTextHtmlEncoding="true"></telerik:RadTreeView>
        </td>
            </tr>
        </table>
     
                    
                
                           
    <asp:HiddenField ID="hiddenDropSourceNode" runat="server" />    
    <asp:HiddenField ID="hiddenDropTargetNode" runat="server" />    
    <asp:HiddenField ID="hdValue" runat="server"/>
    <asp:Label ID="lbDuplicateError" runat="server" Text="名稱重複!" Visible="False" meta:resourcekey="lbDuplicateErrorResource1"></asp:Label>
      
</asp:Content>

