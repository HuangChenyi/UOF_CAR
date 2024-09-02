<%@ Page Language="C#" MasterPageFile="~/Master/TwoColumn.master" AutoEventWireup="true" Inherits="System_SetRoleAdmin_Default" Title="管理員設定" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" Codebehind="Default.aspx.cs" %>

<%@ Register Src="../../Common/ChoiceCenter/UC_ChoiceList.ascx" TagName="UC_ChoiceList"
    TagPrefix="uc1" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Charting" TagPrefix="telerik" %>

<asp:Content ID="Content4" ContentPlaceHolderID="ScriptContentPlaceHolder" runat="Server">
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="ToolbarContentPlaceHolder" runat="Server" Height="0px">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="LeftContentPlaceHolder" runat="Server">

    <telerik:RadTreeView ID="rtvTreeRoleAdmin" runat="server" 
        OnNodeClick="rtvTreeRoleAdmin_NodeClick">
    </telerik:RadTreeView>
    <asp:Label ID="Label1" runat="server" Text="角色管理員列表" Visible="false" meta:resourcekey="Label1Resource1"></asp:Label>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="RightContentPlaceHolder" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server"  UpdateMode="Conditional" >
        <ContentTemplate>
            <uc1:UC_ChoiceList ID="UC_ChoiceList1" runat="server" />
            <asp:Label ID="lblNoManagerMsg" runat="server" Text="沒有設定管理員"  CssClass="SizeMemo" Visible="false" meta:resourcekey="lblNoManagerMsgResource1"></asp:Label>
        </ContentTemplate>
    </asp:UpdatePanel>
    
</asp:Content>


