<%@ Control Language="C#" AutoEventWireup="true" Inherits="Common_Organization_GroupTree" Codebehind="GroupTree.ascx.cs" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<telerik:RadTreeView ID="UC_GROUPTREE" runat="server" EnableNodeTextHtmlEncoding="true"
    OnNodeClick ="UC_GROUPTREE_NodeClick">
</telerik:RadTreeView>
