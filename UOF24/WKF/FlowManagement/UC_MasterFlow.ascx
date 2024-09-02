<%@ Control Language="C#" AutoEventWireup="true"
    Inherits="WKF_FlowManagement_UC_MasterFlow" Codebehind="UC_MasterFlow.ascx.cs" %>
<%@ Reference Control="~/WKF/FlowManagement/UC_SignableSite_Master.ascx" %>
<%@ Reference Control="~/WKF/FlowManagement/UC_BranchSite.ascx" %>
<%@ Reference Control="~/WKF/FlowManagement/UC_FlowSite.ascx" %>
<%@ Reference Control="~/WKF/FlowManagement/UC_CustGroupFlowSite.ascx" %>
<%@ Reference Control="~/WKF/FlowManagement/UC_CustDesignFlowSite.ascx" %>
<%@ Reference Control="~/WKF/FlowManagement/UC_FieldSite_Master.ascx" %>
<%@ Reference Control="~/WKF/FlowManagement/UC_ParallelFlow.ascx" %>
<%@ Reference Control="~/WKF/FlowManagement/UC_ExternalFlowSite.ascx" %>
<%@ Reference Control="~/WKF/FlowManagement/UC_AlertSite.ascx" %>

<div style="text-align: center; width: 100%">
    <table border="0" cellpadding="0" cellspacing="0" width="90%" align="center" style="margin: 0px auto;">
        <tr>
            <td align="center"></td>
        </tr>
        <tr style="text-align: center">
            <td style="height: 80px; width: 100%; vertical-align: top">
                <table align="center" border="0" cellpadding="0" cellspacing="0" style="width: 100%; height: 84px">
                    <tr>
                        <td style="width: 34%; height: 70px"></td>
                        <td align="center" style="width: 12%; height: 70px" valign="top">
                            <asp:Image ID="Image2" runat="server"
                                meta:resourcekey="Image2Resource1" /></td>
                        <td style="width: 34%; height: 70px" valign="bottom">&nbsp;
                            <telerik:RadButton ID="WebImageButton_InsertFirstSite" runat="server" 
                                meta:resourcekey="WebImageButton_InsertFirstSiteResource1" OnClick="WebImageButton_InsertFirstSite_Click1"></telerik:RadButton>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr style="text-align: center">
            <td style="text-align: center; width: 100%;" align="center">
                            <asp:Table ID="Table1" runat="server" Width="100%" meta:resourcekey="Table1Resource1">
                            </asp:Table>
                            &nbsp;&nbsp; 
            </td>
        </tr>
    </table>
    <asp:Label ID="lblinsertConfirmStr" runat="server" Text="確定新增站點?" Visible="False"
        meta:resourcekey="lblinsertConfirmStrResource1"></asp:Label>
    <asp:Label ID="lblInsertFirstSite" runat="server" Text="插入站點" Visible="False" meta:resourcekey="lblInsertFirstSiteResource1"></asp:Label>
</div>
