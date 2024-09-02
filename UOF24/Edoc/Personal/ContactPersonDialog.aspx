<%@ Page Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" CodeBehind="ContactPersonDialog.aspx.cs" Inherits="Ede.Uof.Web.Edoc.Personal.ContactPersonDialog" %>



<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table class="PopTable">
        <tr>
            <td>
                <asp:Label runat="server" Text="*" ForeColor="Red"></asp:Label>
                <asp:Label runat="server" ID="Label1" Text="聯絡人"></asp:Label>
            </td>
            <td>
                <asp:TextBox runat="server" ID="txtContactUser" Style="text-align: left" MaxLength="50" Width="200px"></asp:TextBox>
                <asp:RequiredFieldValidator runat="server" ControlToValidate="txtContactUser" ErrorMessage="必填" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label runat="server" ID="Label2" Text="職稱"></asp:Label>
            </td>
            <td>
                <asp:TextBox runat="server" ID="txtTitle" Style="text-align: left" MaxLength="50" Width="200px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label runat="server" ID="Label3" Text="電話"></asp:Label>
            </td>
            <td>
                <asp:TextBox runat="server" ID="txtPhone" Style="text-align: left" MaxLength="50" Width="200px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label runat="server" ID="Label4" Text="傳真"></asp:Label>
            </td>
            <td>
                <asp:TextBox runat="server" ID="txtFax" Style="text-align: left" MaxLength="50" Width="200px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label runat="server" ID="Label5" Text="電子信箱"></asp:Label>
            </td>
            <td>
                <asp:TextBox runat="server" ID="txtEmail" Style="text-align: left" MaxLength="255" Width="200px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label runat="server" ID="Label6" Text="地址"></asp:Label>
            </td>
            <td>
                <asp:TextBox runat="server" ID="txtAddress" Style="text-align: left" MaxLength="255" Width="400px"></asp:TextBox>
            </td>
        </tr>
    </table>

    <asp:HiddenField runat="server" ID="hfContactGuid" />
    <asp:Label runat="server" ID="lblAddContact" Text="新增聯絡人" Visible="false"></asp:Label>
    <asp:Label runat="server" ID="lblModifycontact" Text="維護聯絡人" Visible="false"></asp:Label>
</asp:Content>
