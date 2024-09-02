<%@ Control Language="C#" AutoEventWireup="true" Inherits="WKF_Browse_TaskRecord_UC_TaskSiteRecord" Codebehind="UC_TaskSiteRecord.ascx.cs" %>
<%@ Reference Control="~/WKF/Browse/TaskRecord/UC_Applicant.ascx" %>
<%@ Reference Control="~/WKF/Browse/TaskRecord/UC_Site.ascx" %>
<%@ Reference Control="~/WKF/Browse/TaskRecord/UC_SubFlow.ascx" %>
<%@ Reference Control="~/WKF/Browse/TaskRecord/UC_ParallelFlow.ascx" %>

<asp:Panel ID="Panel1" runat="server" Height="100%" ScrollBars="Auto" Width="100%" meta:resourcekey="Panel1Resource1" BackColor="Transparent" BorderColor="Transparent">
<asp:Table ID="tbTask" runat="server" BorderWidth="0px" CellPadding="0" CellSpacing="0" meta:resourcekey="tbTaskResource1">
</asp:Table>
</asp:Panel>
<asp:Label ID="lblAdopt" runat="server" Text="通過" Visible="False" meta:resourcekey="lblAdoptResource1"></asp:Label>
<asp:Label ID="lblReject" runat="server" Text="否決" Visible="False" meta:resourcekey="lblRejectResource1"></asp:Label>
<asp:Label ID="lblCancel" runat="server" Text="作廢" Visible="False" meta:resourcekey="lblCancelResource1"></asp:Label>
