<%@ Page Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="EIP_Personal_Briefcase_Search" Title="" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" Codebehind="Search.aspx.cs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table class="PopTable" width="100%">
        <tr>
            <td >
                <asp:Label ID="Label1" runat="server" Text="關鍵字" meta:resourcekey="Label1Resource1"></asp:Label></td>
            <td>
                <asp:TextBox ID="txtKeyWord" runat="server" meta:resourcekey="txtKeyWordResource1"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvKeyWord" runat="server" ControlToValidate="txtKeyWord"
                    Display="Dynamic" ErrorMessage="請輸入搜尋關鍵字" meta:resourcekey="rfvKeyWordResource1"></asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td >
                <asp:Label ID="Label2" runat="server" Text="搜尋範圍" meta:resourcekey="Label2Resource1"></asp:Label></td>
            <td >
                <asp:RadioButtonList ID="rbSearchScope" runat="server" meta:resourcekey="rbSearchScopeResource1">
                    <asp:ListItem Value="All" meta:resourcekey="ListItemResource1" Text="全部"></asp:ListItem>
                    <asp:ListItem Value="Self" Selected="True" meta:resourcekey="ListItemResource2" Text="自己的檔案"></asp:ListItem>
                    <asp:ListItem Value="Share" meta:resourcekey="ListItemResource3" Text="別人分享的檔案"></asp:ListItem>
                </asp:RadioButtonList></td>
        </tr>
    </table>
</asp:Content>

