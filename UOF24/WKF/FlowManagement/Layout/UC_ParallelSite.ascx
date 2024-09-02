<%@ Control Language="C#" AutoEventWireup="true" Inherits="WKF_FlowManagement_Layout_UC_ParallelSite" Codebehind="UC_ParallelSite.ascx.cs" %>
<table border="0" style="padding:0px;width:143px" >
<tr>
    <tr>
        <td style="height:18px;vertical-align:bottom;text-align: center;background-image:url(<%=themePath %>/images/wkf/app_top.gif)" colspan="3" >
       
             </td>
    </tr>
    <tr>
        <td class="SiteLeftTD" valign="top" width="10">
            &nbsp;</td>
        <td  style="height:60px;vertical-align:bottom;width:125px;text-align:center;background-image:url(<%=themePath %>/images/wkf/site_con.gif)"   >
               <asp:Table ID="tb" runat="server" BorderWidth="0px" CellPadding="0" CellSpacing="0" meta:resourcekey="tbSignerResource1">
                </asp:Table>
                </td>
        <td class="SiteRightTD" width="8" valign="top">
            &nbsp;</td>
    </tr>
    <tr>
        <td colspan="3" height="27"><asp:Image ID="imgButton" runat="server" meta:resourcekey="Image1Resource1"  /></td>
    </tr>
</table>
