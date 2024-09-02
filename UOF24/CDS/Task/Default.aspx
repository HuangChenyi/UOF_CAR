<%@ Page Title="" Language="C#" MasterPageFile="~/Master/DefaultMasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="CDS_Task_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <table class="PopTable">
        <tr>
            <td>
                <asp:Label ID="Label1" runat="server" Text="傳入參數"></asp:Label>
            </td>
            
            <td>
                <asp:TextBox ID="txtParam" runat="server"></asp:TextBox>
            </td>
        </tr>

    </table>
    <asp:Button ID="btnExecute" runat="server" Text="執行排程" OnClick="btnExecute_Click" />
</asp:Content>

