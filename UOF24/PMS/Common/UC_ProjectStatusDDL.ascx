<%@ Control Language="C#" AutoEventWireup="true" Inherits="PMS_Common_UC_ProjectStatusDDL" Codebehind="UC_ProjectStatusDDL.ascx.cs" %>
<asp:DropDownList ID="ddlProjStatus" runat="server" OnSelectedIndexChanged="ddlProjStatus_SelectedIndexChanged" Width="130px" meta:resourcekey="ddlProjStatusResource1">
    <asp:ListItem Value="All" meta:resourcekey="ListItemResource1">所有狀態</asp:ListItem>
    <asp:ListItem Value="Draft" meta:resourcekey="ListItemResource2">草稿</asp:ListItem>
    <asp:ListItem Value="Audit" meta:resourcekey="ListItemResource3">審核中</asp:ListItem>
    <asp:ListItem Value="NotYetBegin" meta:resourcekey="ListItemResource4">尚未開始</asp:ListItem>
    <asp:ListItem Value="Proceeding" Selected="True" meta:resourcekey="ListItemResource5">進行中</asp:ListItem>
    <asp:ListItem Value="Suspend" meta:resourcekey="ListItemResource6">已中止</asp:ListItem>
    <asp:ListItem Value="Close" meta:resourcekey="ListItemResource7">已結案</asp:ListItem>        
</asp:DropDownList>
<asp:HiddenField ID="hidShowDraftStatus" runat="server" value="true" />