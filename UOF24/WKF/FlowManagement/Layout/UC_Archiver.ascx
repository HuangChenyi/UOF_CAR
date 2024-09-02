<%@ Control Language="C#" AutoEventWireup="true" Inherits="WKF_FlowManagement_Layout_UC_Archiver" Codebehind="UC_Archiver.ascx.cs" %>
<table cellpadding="0" cellspacing="0">
    <tr>
        <td colspan="3">
            <asp:Image ID="Image2" runat="server"  meta:resourcekey="Image2Resource1" /></td>
    </tr>
    <tr>
        <td class="SiteLeftTD" valign="top" width="10">&nbsp;</td>
        <td class="SiteMiddleTD" valign="top" width="125">
            
            <table cellpadding=0 cellspacing=0 width="100%" >
            <tr><td align=center>
                <asp:LinkButton ID="lbtnArchiver" runat="server" Text="歸檔處理者" meta:resourcekey="Label1Resource1"></asp:LinkButton></td></tr>            
            <tr><td>          
             <div class="SignerTD">              
                <asp:Table ID="tbSigner" runat="server" BorderWidth="0px" CellPadding="0" CellSpacing="0" meta:resourcekey="tbSignerResource1">
              </asp:Table>
             </div></td></tr></table>
 
        </td>
        <td class="SiteRightTD">&nbsp;</td>
    </tr>
    <tr>
        <td colspan="3">
            <asp:Image ID="Image1" runat="server"  meta:resourcekey="Image1Resource1" /></td>
    </tr>
</table>
