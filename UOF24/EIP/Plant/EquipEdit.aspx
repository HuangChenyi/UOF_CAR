<%@ Page Title="場地內配備維護" Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" CodeBehind="EquipEdit.aspx.cs" Inherits="Ede.Uof.Web.EIP.Plant.EquipEdit" meta:resourcekey="PageResource1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table class="PopTable">
        <tr class="PopTableHeader">
            <td colspan="2" style="text-align:center">
                <asp:Label ID="lblHeader" runat="server" Text="場地內配備" meta:resourcekey="lblHeaderResource1"></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="white-space:nowrap">
                <span style="color: #ff0000">*</span>
                <asp:Label ID="lblName" runat="server" Text="配備名稱" meta:resourcekey="lblNameResource1"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtName" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rvName" runat="server" Display="Dynamic" ErrorMessage="不允許空白" ControlToValidate="txtName" meta:resourcekey="rvNameResource1"></asp:RequiredFieldValidator>
            </td>
        </tr>
    </table>
    <asp:HiddenField ID="hfEquipID" runat="server" />
</asp:Content>
