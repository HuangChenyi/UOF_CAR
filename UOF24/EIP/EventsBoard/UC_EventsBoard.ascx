<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UC_EventsBoard.ascx.cs" Inherits="EIP_EventsBoard_UC_EventsBoard" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<asp:UpdatePanel runat="server" ID="updateFrame"> 
    <ContentTemplate>
        <iframe id="Frame1"  src="~/EIP/EventsBoard/BoardDefault.aspx" style="width:100%;" scrolling="no"  runat="server" />
    </ContentTemplate>
</asp:UpdatePanel>      