<%@ Page Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="EIP_Forum_RecommendArticle" Title="推薦文章" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" Codebehind="RecommendArticle.aspx.cs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:CustomValidator ID="CustomValidator1" runat="server" ForeColor="Red" Display="Dynamic" ErrorMessage="無維護權限" meta:resourcekey="CustomValidator1Resource1"></asp:CustomValidator>
    <asp:CustomValidator ID="CustomValidator2" runat="server" ForeColor="Red" Display="Dynamic" ErrorMessage="你已經推薦過" meta:resourcekey="CustomValidator2Resource1"></asp:CustomValidator>
    <asp:CustomValidator ID="cvSelectScore" runat="server" ForeColor="Red" Display="dynamic" ErrorMessage="請選擇評分燈號" meta:resourcekey="cvSelectScoreResource1"></asp:CustomValidator>
    <table width="100%"  class="PopTable" cellspacing="0">
        <tr>
            <td >
                <asp:Label ID="Label1" runat="server" Text="評分" meta:resourcekey="Label1Resource1"></asp:Label></td>
            <td >
                <asp:RadioButtonList ID="RadioButtonList1" runat="server" meta:resourcekey="RadioButtonList1Resource1">
                    <asp:ListItem Value="1" meta:resourcekey="ListItemResource1" Text="一個燈"></asp:ListItem>
                    <asp:ListItem Value="2" meta:resourcekey="ListItemResource2" Text="二個燈"></asp:ListItem>
                    <asp:ListItem Value="3" meta:resourcekey="ListItemResource3" Text="三個燈"></asp:ListItem>
                    <asp:ListItem Value="4" meta:resourcekey="ListItemResource4" Text="四個燈"></asp:ListItem>
                    <asp:ListItem Value="5" meta:resourcekey="ListItemResource5" Text="五個燈"></asp:ListItem>
                </asp:RadioButtonList></td>
        </tr>
    </table>
</asp:Content>

