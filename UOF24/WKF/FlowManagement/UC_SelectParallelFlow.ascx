<%@ Control Language="C#" AutoEventWireup="true" Inherits="WKF_FlowManagement_UC_SelectParallelFlow" Codebehind="UC_SelectParallelFlow.ascx.cs" %>

<script type="text/javascript" id="telerikClientEvents1">

	function RadToolBar1_ButtonClicking(sender,args)
	{
	    args.set_cancel(true);
	    $uof.dialog.open2("~/WKF/Browse/ViewSubFlow.aspx", args.get_item(), "<%=dialogTitleName%>", 600, 650, function () { return false; }, {"subFlowId":"<%=subFlowId%>"});
	}
</script>

<div style="text-align: center">
    <table border="0" cellpadding="0" cellspacing="0" width="96%" style="height: 100%">
        <tr>
            <td align="left" valign="middle" style="height: 40px">
                <telerik:RadToolBar ID="RadToolBar1" runat="server" OnClientButtonClicking="RadToolBar1_ButtonClicking">
                    <Items>
                        <telerik:RadToolBarButton runat="server" Text="觀看流程" Value="ShowFlow" meta:resourceKey="TBarButtonResource1">
                        </telerik:RadToolBarButton>
                        <telerik:RadToolBarButton runat="server" Text="Button 0" IsSeparator="true">
                        </telerik:RadToolBarButton>
                    </Items>
                </telerik:RadToolBar>
                
            </td>
        </tr>
        <tr>
            <td align="left" valign="top">
                <telerik:RadTreeView ID="treeSubFlow" runat="server" Width="100%" OnNodeClick="treeSubFlow_NodeClick" ></telerik:RadTreeView>
            </td>
        </tr>
    </table>
    <asp:HiddenField ID="hfOldNode" runat="server" />
</div>
