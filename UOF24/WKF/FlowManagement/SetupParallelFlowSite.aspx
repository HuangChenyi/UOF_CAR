<%@ Page Title="加入副流程" Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="WKF_FlowManagement_SetupParallelFlowSite" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" Codebehind="SetupParallelFlowSite.aspx.cs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <script id="treejs" type="text/javascript">

        function treeSubFlow_NodeEditStart(sender, args) {
            var node = args.get_node();
            var FlowID = node.get_value();
            node.endEdit();
            $uof.dialog.open2("~/WKF/Browse/ViewSubFlow.aspx", "", "<%=lblViewSubFlowTitle.Text%>", 600, 650, function () { return false; }, { "subFlowId": FlowID });
        }

        function treeparallelFlow_DoubleClick(sender, args) {

            var node = args.get_node();
            var FlowID = node.get_value();
            $uof.dialog.open2("~/WKF/Browse/ViewSubFlow.aspx", "", "<%=lblViewSubFlowTitle.Text%>", 600, 650, function () { return false; }, { "subFlowId": FlowID });
        }

        Sys.Application.add_load(function () {

            if ($("#<%=hiddenX.ClientID%>").val() != "" && $("#<%=hiddenY.ClientID%>").val() != "")
                resizeTwoTree($("#<%=hiddenX.ClientID%>").val(), $("#<%=hiddenY.ClientID%>").val());
        });

        function resizeTwoTree(X, Y) {

            var treePara = $find("<%=treeparallelFlow.ClientID %>");
            var treeSub = $find("<%=treeSubFlow.ClientID %>");

            treePara.get_element().style.height = Y - 25 + "px";
            treePara.get_element().style.width = X / 2 - 40 + "px";

            treeSub.get_element().style.height = Y - 25 + "px";
            treeSub.get_element().style.width = X / 2 - 40 + "px";

            $("#<%=hiddenX.ClientID%>").val(X);
            $("#<%=hiddenY.ClientID%>").val(Y);

        }

</script>


    <telerik:RadSplitter ID="MainRadSplitter" runat="server" Width="100%" LiveResize="true" ResizeWithBrowserWindow="true" ResizeWithParentPane="true" Orientation="Vertical" BorderSize="0">
        <telerik:RadPane ID="LeftRadPane" runat="server" Scrolling="None" >
                            <table border="1" cellpadding="0" cellspacing="0" style="margin-right:20px;width:100%" class="PopTable">
                    <tr>
                        <td class="PopTableLeftTD" style=" text-align:center; width: 50%; height:20px; text-align: center">
                            <asp:Label ID="Label4" runat="server" 
                                Text="平行流程" meta:resourcekey="Label4Resource1"></asp:Label>
                            <asp:CustomValidator ID="cvFlowIsZero" runat="server" ErrorMessage="請至少選擇一個副流程"  Display="Dynamic"
                                meta:resourcekey="cvFlowIsZeroResource1"></asp:CustomValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="PopTableRightTD" style=" text-align:left; vertical-align:top;width:50%">
                                <asp:UpdatePanel id="UpdatePanel1" runat="server" RenderMode="Inline" UpdateMode="Conditional">
                                    <contenttemplate>
                                        <telerik:RadTreeView ID="treeparallelFlow" Runat="server" Width="100%"  Height="525px"
                                            OnClientDoubleClick="treeparallelFlow_DoubleClick"></telerik:RadTreeView>
                                    </contenttemplate>
                                    <triggers>
                                        <asp:AsyncPostBackTrigger ControlID="btnAdd" EventName="Click"></asp:AsyncPostBackTrigger>
                                        <asp:AsyncPostBackTrigger ControlID="btnRemove" EventName="Click"></asp:AsyncPostBackTrigger>
                                   </triggers>
                                </asp:UpdatePanel>
                        </td>
                    </tr>
                </table>
        </telerik:RadPane>

        <telerik:RadPane ID="MinRadPane" runat="server" Scrolling="None" Width="50px" >
            <table style="width:100%;height:100%">
                <tr>
                    <td style="text-align:center;vertical-align:middle;min-width:50px">

                        <telerik:RadButton ID="btnAdd" runat="server" CausesValidation="False" Text="<--" OnClick="btnAdd_Click1"></telerik:RadButton>
     
                <br />
                <br />
                <telerik:RadButton ID="btnRemove" runat="server" Text="-->" OnClick="btnRemove_Click1"></telerik:RadButton>
                    </td>

                </tr>

            </table>
        </telerik:RadPane>

                <telerik:RadPane ID="RightRadPane" runat="server" Scrolling="None">
                    <table  style="argin-right:20px ;width:100%" class="PopTable" >
                    <tr>
                        <td class="PopTableLeftTD" style="width: 50%; text-align: center;height:20px">
                            <asp:Label ID="Label1" runat="server"  Text="副流程" 
                                meta:resourcekey="Label1Resource1"></asp:Label>&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="PopTableRightTD" style="text-align:left; vertical-align:top">
                            <telerik:RadTreeView ID="treeSubFlow" runat="server"  Height="525px"
                                 OnClientNodeEditStart="treeSubFlow_NodeEditStart"
                                Width="100%"  AllowNodeEditing="true"></telerik:RadTreeView>
                        </td>
                    </tr>
                </table>
        </telerik:RadPane>

    </telerik:RadSplitter>

    
    <asp:HiddenField ID="hiddenX" runat="server" />
    <asp:HiddenField ID="hiddenY" runat="server" />

    <asp:HiddenField ID="hfFlowID" runat="server" />
    <asp:HiddenField ID="hiddenNodeId1" runat="server" />
    <asp:HiddenField ID="hiddenNodeId" runat="server" />
    <asp:Label ID="lblViewSubFlowTitle" runat="server" Text="觀看副流程" Visible="False" 
        meta:resourcekey="lblViewSubFlowTitleResource1"></asp:Label>
</asp:Content>

