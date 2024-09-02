<%@ Page Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="WKF_FlowManagement_SetupCustGroupFlowSite" Title="" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" Codebehind="SetupCustGroupFlowSite.aspx.cs" %>
<%@ Register Src="UC_SubFlow.ascx" TagName="UC_SubFlow" TagPrefix="uc1" %>
<%@ Register Src="UC_SelectSubFlow.ascx" TagName="UC_SelectSubFlow" TagPrefix="uc2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

<script id="treejs" type="text/javascript">
    Sys.Application.add_load(function () {
        if ($("#<%=hiddenX.ClientID%>").val() != "" && $("#<%=hiddenY.ClientID%>").val() != "")
                    resizeTwoTree($("#<%=hiddenX.ClientID%>").val(), $("#<%=hiddenY.ClientID%>").val());
            });

    function resizeTwoTree(X, Y) {
        var treeBranchSite = $find("<%=treeBranchSite.ClientID %>");
        var treeSubFlow = $find("<%=treeSubFlow.ClientID %>");

        treeBranchSite.get_element().style.height = Y - 35 + "px";
        treeBranchSite.get_element().style.width = X / 2 - 30 + "px";

        treeSubFlow.get_element().style.height = Y - 35 + "px";
        treeSubFlow.get_element().style.width = X / 2 - 30 + "px";

        $("#<%=hiddenX.ClientID%>").val(X);
        $("#<%=hiddenY.ClientID%>").val(Y);

    }
    function treeBranchSiteNode_DragStart(oTree, oNode, oDataTransfer, oEvent) {
        $('#<%=hiddenSourceNodeId.ClientID%>').val(oNode.getTag());

        if (oNode.getLevel() == 1) {
            oDataTransfer.dataTransfer.effectAllowed = 'none';
        }
        else {
            oDataTransfer.dataTransfer.effectAllowed = 'move';
        }
    }

    function treeBranchSiteNode_DragOver(oTree, oNode, oDataTransfer, oEvent) {
        if (oNode.getLevel() == 1) {
            oDataTransfer.dataTransfer.dropEffect = 'none';
        }
    }

    function treeBranchSiteNode_Drop(oTree, oNode, oDataTransfer, oEvent) {
        return false;
    }
    </script>

    <table width="99%" align="center" height="100%">
        <tr>
            <td valign="top" width="47%" height="100%">
                <table cellpadding="0" cellspacing="0" height="100%" width="100%" class="PopTable">
                    <tr>
                        <td align="center" class="PopTableLeftTD" style="height:20px;width: 50%; text-align: center">
                            <asp:Label ID="Label4" runat="server" meta:resourcekey="Label4Resource1" Text="自選流程站點"></asp:Label>&nbsp;</td>
                    </tr>
                    <tr>
                        <td style="text-align: left" valign="top" width="50%" class="PopTableRightTD">
                            <asp:UpdatePanel id="UpdatePanel1" runat="server" RenderMode="Inline" UpdateMode="Conditional">
                                <contenttemplate>
                                        <telerik:RadTreeView ID="treeBranchSite" Runat="server" height="500px" Width="300px"
                                            EnableDragAndDrop="true" 
                                            OnNodeDrop="treeBranchSite_NodeDrop">
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
                <telerik:RadButton ID="btnAdd" runat="server" CausesValidation="False" 
                    meta:resourcekey="btnAddResource1" Text="<--" OnClick="btnAdd_Click1"></telerik:RadButton>
                &nbsp;
                <br />
                <br />
                <telerik:RadButton ID="btnRemove" runat="server"  
                    meta:resourcekey="btnRemoveResource1" Text="-->" OnClick="btnRemove_Click1"></telerik:RadButton>
            </td>
            <td style="vertical-align:top;width:47%;height:100%" >
                <table border="1" cellpadding="0" cellspacing="0" height="100%" width="100%" class="PopTable">
                    <tr>
                        <td align="center" class="PopTableLeftTD" style="height:20px;width: 50%; text-align: center">
                            <asp:Label ID="Label1" runat="server" meta:resourcekey="Label1Resource1" Text="副流程"></asp:Label>&nbsp;</td>
                    </tr>
                    <tr>
                            <td class="PopTableRightTD" style="text-align: left;" valign="top" width="50%">
                                <telerik:RadTreeView ID="treeSubFlow" runat="server" Height="500px" Width="300px"></telerik:RadTreeView>
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
