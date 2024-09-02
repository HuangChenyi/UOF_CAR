<%@ Page Title="搬移相簿" Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="EIP_Album_Admin_MoveAlbum" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" Codebehind="MoveAlbum.aspx.cs" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
<asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>
        <telerik:RadSplitter ID="MasterRdSplitter" Runat="server" Width="100%" LiveResize="true" ResizeWithBrowserWindow="true" ResizeWithParentPane="true" Orientation="Horizontal" BorderSize="0">
            <telerik:RadPane ID="TreeRdPanel" Runat="server">
                <telerik:RadTreeView ID="treeAlbumClass" Runat="server"></telerik:RadTreeView>
            </telerik:RadPane>
        </telerik:RadSplitter>
        <asp:HiddenField ID="hiddenAlbumGuid" runat="server" />
        <asp:HiddenField ID="hiddenAlbumClassGuid" runat="server" />
    </ContentTemplate> 
</asp:UpdatePanel>
<asp:Label ID="lblRootName" runat="server" Text="相簿類別" Visible="False"  meta:resourcekey="lblRootNameResource1"></asp:Label>
<asp:Label ID="lblNoMoveMsg" runat="server" Text="不可把相簿移動到類別裡!!" Visible="False" meta:resourcekey="lblNoMoveMsgResource1"></asp:Label>        
<asp:Label ID="lblNoAuthMsg" runat="server" Text="不可把相簿移動到沒權限的類別裡!!" Visible="false" meta:resourcekey="lblNoAuthMsgResource1"></asp:Label>
</asp:Content>

