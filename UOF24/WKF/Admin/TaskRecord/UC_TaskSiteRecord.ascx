<%@ Control Language="C#" AutoEventWireup="true" Inherits="WKF_Admin_TaskRecord_UC_TaskSiteRecord" Codebehind="UC_TaskSiteRecord.ascx.cs" %>
<%@ Reference Control="~/WKF/Admin/TaskRecord/UC_Applicant.ascx" %>
<%@ Reference Control="~/WKF/Admin/TaskRecord/UC_Site.ascx" %>
<%@ Reference Control="~/WKF/Admin/TaskRecord/UC_SubFlow.ascx" %>
<asp:Table ID="tbTask" runat="server" BorderWidth="0px" CellPadding="0" CellSpacing="0" meta:resourcekey="tbTaskResource1" Width="100%">
</asp:Table>
<asp:Label ID="lblAdopt" runat="server" meta:resourcekey="lblAdoptResource1" Text="通過"
    Visible="False"></asp:Label><asp:Label ID="lblReject" runat="server" meta:resourcekey="lblRejectResource1"
        Text="否決" Visible="False"></asp:Label><asp:Label ID="lblCancel" runat="server" meta:resourcekey="lblCancelResource1"
            Text="作廢" Visible="False"></asp:Label>