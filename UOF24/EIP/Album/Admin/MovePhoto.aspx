<%@ Page Title="搬移相片" Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="EIP_Album_Admin_MovePhoto" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" Codebehind="MovePhoto.aspx.cs" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <telerik:RadTreeView ID="treeAlbumClass" Runat="server" ></telerik:RadTreeView>
    <br />
        <table>
             <tr>
                <td>
                    <asp:Image ID="Image1" runat="server" ImageUrl="~/Common/Images/Icon/icon_j28.gif"></asp:Image>
                    <asp:Label ID="Label1" runat="server" Text="相簿類別" meta:resourcekey="Label1Resource1"></asp:Label>
                </td>
                <td>
                    <asp:Image ID="Image2" runat="server" ImageUrl="~/Common/Images/Icon/icon_j29.gif"></asp:Image>
                    <asp:Label ID="Label2" runat="server" Text="相簿" meta:resourcekey="Label2Resource1"></asp:Label>
                </td>
            </tr>
        </table>

<input id="hiddenNodeId" type="hidden" runat="server" />
<input id="hiddenDropSourceNode" type="hidden" runat="server" />
<asp:Label ID="lblRootName" runat="server" Text="相簿類別" Visible="False" meta:resourcekey="lblRootNameResource1"></asp:Label>
<asp:Label ID="lblNoMoveMsg" runat="server" Text="不可把相片移動到類別裡!!" Visible="False" meta:resourcekey="lblNoMoveMsgResource1"></asp:Label>
<asp:Label ID="lblcheck" runat="server" Text="確定" Visible="False" meta:resourcekey="lblcheckResource1"></asp:Label>
<asp:Label ID="lblSelectAlbumToMove" runat="server" Text="請選擇要搬移的相簿!!" Visible="False" meta:resourcekey="lblSelectAlbumToMoveResource1"></asp:Label>
</asp:Content>

