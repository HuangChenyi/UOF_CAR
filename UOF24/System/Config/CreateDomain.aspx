<%@ Page Title="網域名稱設定" Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="System_Config_CreateDomain" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" Codebehind="CreateDomain.aspx.cs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <asp:CustomValidator ID="cvCheckDomainExist" runat="server" ErrorMessage="網域名稱已存在" Display="Dynamic"></asp:CustomValidator>
     <table class="PopTable" cellspacing="1">
        <tr>
            <td style="width: 25%; word-break: break-all;white-space:nowrap;"  class="PopTableLeftTD">
                <asp:Label ID="Label4" runat="server" Text="*" ForeColor="Red" meta:resourcekey="Label4Resource1"></asp:Label>
                <asp:Label ID="Label1" runat="server" Text="網域名稱" meta:resourcekey="Label1Resource1"></asp:Label>
            </td>
            <td style="width: 75%; word-break: break-all" >
                <asp:TextBox ID="txtDomainName" runat="server" meta:resourcekey="txtDomainNameResource1"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtDomainName" Display="Dynamic" ErrorMessage="Domain Name 不允許為空白" meta:resourcekey="RequiredFieldValidator1Resource1"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td style="white-space:nowrap">
                <asp:Label ID="Label3" runat="server" Text="*" ForeColor="Red" meta:resourcekey="Label3Resource1"></asp:Label>
                <asp:Label ID="Label2" runat="server" Text="顯示名稱" meta:resourcekey="Label2Resource1"></asp:Label>
            </td>
            <td>            
                <asp:TextBox ID="txtDomainNickName" runat="server" meta:resourcekey="txtDomainNickNameResource1"></asp:TextBox>
                <asp:CheckBox ID="CheckBox1" runat="server" AutoPostBack="True" oncheckedchanged="CheckBox1_CheckedChanged" Text="同上" meta:resourcekey="CheckBox1Resource1" />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtDomainNickName" Display="Dynamic" ErrorMessage="顯示名稱不允許為空白" meta:resourcekey="RequiredFieldValidator2Resource1"></asp:RequiredFieldValidator>
             </td>
        </tr>
        <tr>
            <td style="white-space:nowrap">
                <asp:Label ID="Label5" runat="server" Text="*" ForeColor="Red" ></asp:Label>
                <asp:Label ID="lblTitlefullyDomainName" runat="server" Text="完整網域名稱" meta:resourcekey="lblTitlefullyDomainNameResource1"></asp:Label>                
            </td>
            <td>            
                <asp:TextBox ID="txtFullyDomainName" runat="server" MaxLength="50"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtFullyDomainName" Display="Dynamic" ErrorMessage="完整網域名稱不允許為空白" meta:resourcekey="RequiredFieldValidator3Resource1"></asp:RequiredFieldValidator>
            </td>
        </tr>
    </table>
</asp:Content>

