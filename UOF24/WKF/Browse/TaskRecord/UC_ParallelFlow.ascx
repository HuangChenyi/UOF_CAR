<%@ Control Language="C#" AutoEventWireup="true" Inherits="WKF_Browse_TaskRecord_UC_ParallelFlow" Codebehind="UC_ParallelFlow.ascx.cs" %>
<%@ Reference Control="~/WKF/Browse/TaskRecord/UC_Site.ascx" %>
<table border="0" cellpadding="0" cellspacing="0" width="163">
    <tr>
        <td colspan="3" height="55">
            <asp:Image ID="Image1" runat="server"
                    meta:resourcekey="Image2Resource1" /></td>
    </tr>
    <tr>
        <td valign="top" width="10" style="background-image: url(<%=themePath %>/images/wkf/site_left_big.gif); background-repeat: repeat-y;">
            &nbsp;</td>
        <td valign="top" width="143" bgcolor ="#ffffff">
            <p style="text-align: center">
                        <asp:Label ID="lblParallelSiteName" runat="server"  Text="" /> <br />
            <asp:Label ID="lblSubName" runat="server" meta:resourcekey="lblSubNameResource1" /><asp:Table ID="tbTask" runat="server" BorderWidth="0px" CellPadding="0" CellSpacing="0" meta:resourcekey="tbTaskResource1">

</asp:Table>

           
        </td>
        <td style="background-image: url(<%=themePath %>/images/wkf/site_rig_big.gif); background-repeat: repeat-y;" valign="top" width="10">
            </td>
    </tr>
    <tr>
        <td colspan="3" height="33">
            <asp:Image ID="Imgdown" runat="server" 
                    meta:resourcekey="Image1Resource1" /></td>
    </tr>
</table>

<asp:Label ID="lblAddtionalFlowMsg" runat="server" Text="加簽流程" Visible="False" 
    meta:resourcekey="lblAddtionalFlowMsgMsgResource1"></asp:Label>