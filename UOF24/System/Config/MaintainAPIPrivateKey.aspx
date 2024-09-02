<%@ Page Title="新增/維護私鑰" Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" CodeBehind="MaintainAPIPrivateKey.aspx.cs" Inherits="MaintainAPIPrivateKey" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table class="PopTable">
        <tr>
            <td style="white-space:nowrap">
                <asp:Label ID="Label3" runat="server" Text="*" ForeColor="Red" meta:resourcekey="Label3Resource1"></asp:Label>
                <asp:Label ID="Label1" runat="server" Text="外部系統代號" meta:resourcekey="Label1Resource1"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtAppID" runat="server" Width="100%" MaxLength="50" meta:resourcekey="txtAppIDResource1"></asp:TextBox>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtAppID" Display="Dynamic" ErrorMessage="輸入內容只允許英文或數字" ValidationExpression="\w*" meta:resourcekey="RegularExpressionValidator1Resource1"></asp:RegularExpressionValidator>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="不允許空白" ControlToValidate="txtAppID" Display="Dynamic" meta:resourcekey="RequiredFieldValidator1Resource1"></asp:RequiredFieldValidator>
                <asp:CustomValidator ID="cvErr" runat="server" ErrorMessage="外部系統代號不允許重複" Display="Dynamic" meta:resourcekey="cvErrResource1"></asp:CustomValidator>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label2" runat="server" Text="私鑰" meta:resourcekey="Label2Resource1"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtPrivateKey" runat="server" Width="100%" meta:resourcekey="txtPrivateKeyResource1"></asp:TextBox>
            </td>
        </tr>
    </table>
    <asp:HiddenField ID="hfCurrentUser" runat="server" />
</asp:Content>
