<%@ Page Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="EIP_Bulletin_ClassSelect" Title="選擇公告類別" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" Codebehind="ClassSelect.aspx.cs" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table>
        <tr>
            <td>
                <asp:Image ID="Image1" runat="server" ImageUrl="~/Common/images/icon/icon_m47.png" />
                <asp:Label ID="Label1" runat="server" Text="有發佈權限" meta:resourcekey="Label1Resource1"></asp:Label>
                &nbsp;&nbsp;
            </td>
            <td>
                <asp:Image ID="Image2" runat="server" ImageUrl="~/Common/images/icon/icon_m47a.png" />
                <asp:Label ID="Label2" runat="server" Text="沒有發佈權限" meta:resourcekey="Label2Resource1"></asp:Label>
            </td>
        </tr>
    </table>
    <asp:CustomValidator ID="CustomValidator1" runat="server" ErrorMessage="請選擇一公告類別" Display="Dynamic" meta:resourcekey="CustomValidator1Resource1"></asp:CustomValidator>
    <asp:CustomValidator ID="CustomValidator2" runat="server" Display="Dynamic" ErrorMessage="請選擇內外公告下的類別" meta:resourcekey="CustomValidator2Resource1"></asp:CustomValidator>
    <telerik:RadTreeView ID="RadTreeView1"  runat="server" meta:resourcekey="UltraWebTree1Resource1">
        <Nodes>
            <telerik:RadTreeNode  Value="Bulletinclass1"></telerik:RadTreeNode>
            <telerik:RadTreeNode  Value="Bulletinclass2"></telerik:RadTreeNode>
        </Nodes>
    </telerik:RadTreeView>
    <asp:Label ID="msgBulletinclass1" runat="server" Text="內部公告" Visible="False" meta:resourcekey="msgBulletinclass1Resource1"></asp:Label>
    <asp:Label ID="msgBulletinclass2" runat="server" Text="外部公告" Visible="False" meta:resourcekey="msgBulletinclass2Resource1"></asp:Label>
    <asp:HiddenField ID="hfCurrentUser" runat="server" />
</asp:Content>

