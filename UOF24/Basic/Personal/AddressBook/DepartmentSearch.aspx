<%@ Page Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="Basic_Personal_AddressBook_DepartmentSearch" Title="搜尋" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" Codebehind="DepartmentSearch.aspx.cs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table class="PopTable" cellspacing="1" width="100%">
        <tr>
            <td style="width: 100px; height: 29px; white-space: nowrap">
                <asp:Label ID="lbLeftName" runat="server" Text="姓名" meta:resourcekey="lbLeftNameResource1"></asp:Label></td>
            <td style="width: 100px; height: 29px;">
                <asp:TextBox ID="nameTB" runat="server" meta:resourcekey="nameTBResource1" Width="100%"></asp:TextBox></td>
        </tr>
        <tr>
            <td style="width: 100px; white-space: nowrap">
                <asp:Label ID="lbLeftMail" runat="server" Text="電子郵件" meta:resourcekey="lbLeftMailResource1"></asp:Label></td>
            <td style="width: 100px">
                <asp:TextBox ID="emailTB" runat="server" meta:resourcekey="emailTBResource1" Width="100%"></asp:TextBox></td>
        </tr>
    </table>
</asp:Content>

