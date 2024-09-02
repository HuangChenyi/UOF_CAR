<%@ Control Language="C#" AutoEventWireup="true" Inherits="WKF_FlowManagement_Layout_UC_SetMastFlow" CodeBehind="UC_SetMastFlow.ascx.cs" %>

<%@ Reference Control="~/WKF/FlowManagement/Layout/UC_SignableSite.ascx" %>
<%@ Reference Control="~/WKF/FlowManagement/Layout/UC_BranchSite.ascx" %>
<%@ Reference Control="~/WKF/FlowManagement/Layout/UC_BranchTopLine.ascx" %>
<%@ Reference Control="~/WKF/FlowManagement/Layout/UC_SubFlow.ascx" %>
<%@ Reference Control="~/WKF/FlowManagement/Layout/UC_Applyer.ascx" %>
<%@ Reference Control="~/WKF/FlowManagement/Layout/UC_Archiver.ascx" %>
<%@ Reference Control="~/WKF/FlowManagement/Layout/UC_CustGroupFlowSite.ascx" %>
<%@ Reference Control="~/WKF/FlowManagement/Layout/UC_CustDesignFlowSite.ascx" %>
<%@ Reference Control="~/WKF/FlowManagement/Layout/UC_FieldSite.ascx" %>
<%@ Reference Control="~/WKF/FlowManagement/Layout/UC_ExternalFlowSite.ascx" %>
<%@ Reference Control="~/WKF/FlowManagement/Layout/UC_AlertSite.ascx" %>

<script language="javascript">

    function saveScrollPosition() {

    }

    function setScrollPosition() {
        
        }

</script>
<body onload="setScrollPosition();">
    <table align="center">
        <tr>
            <td>
                <asp:Table ID="Table1" runat="server" BorderWidth="0px" CellPadding="0" CellSpacing="0" style="word-break:break-all"
                    meta:resourcekey="Table1Resource1">
                </asp:Table>
            </td>
        </tr>
    </table>


    <asp:HiddenField ID="HiddenField1" runat="server" Value="0" />
</body>
