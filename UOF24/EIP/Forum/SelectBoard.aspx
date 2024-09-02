<%@ Page Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="EIP_Forum_SelectBoard" Title="文章搬移" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" Codebehind="SelectBoard.aspx.cs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <table width="100%" class="PopTable">
        <tr>
            <td style=" white-space:nowrap;">
                <asp:Label ID="Label1" runat="server" Text="討論區" meta:resourcekey="Label1Resource1"></asp:Label></td>
            <td>
                <asp:DropDownList ID="dwnArea" runat="server" AutoPostBack="True" meta:resourcekey="dwnAreaResource1" OnSelectedIndexChanged="dwnArea_SelectedIndexChanged">
                </asp:DropDownList></td>
        </tr>
        <tr>
            <td >
                <asp:Label ID="Label2" runat="server" Text="討論版" meta:resourcekey="Label2Resource1"></asp:Label></td>
            <td >
                <asp:DropDownList ID="dwnBoard" runat="server" meta:resourcekey="dwnBoardResource1">
                </asp:DropDownList></td>
        </tr>
    </table>
    <asp:CustomValidator ID="cvSelectBoard" runat="server" ErrorMessage="請選擇討論版" Display="dynamic" meta:resourcekey="cvSelectBoardResource1"></asp:CustomValidator>
    
</asp:Content>

