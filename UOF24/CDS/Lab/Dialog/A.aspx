<%@ Page Title="" Language="C#" MasterPageFile="~/Master/DefaultMasterPage.master" AutoEventWireup="true" CodeFile="A.aspx.cs" Inherits="CDS_Lab_Dialog_A" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <table class="PopTable">
        <tr>
            <td>
                <asp:Label ID="Label1" runat="server" Text="開啟對話視窗"></asp:Label>

            </td>
            <td>
                <asp:Button ID="btnOpen" runat="server" Text="開窗" OnClick="btnOpen_Click" />
            </td>
        </tr>
         <tr>
            <td>
                <asp:Label ID="Label2" runat="server" Text="返回值"></asp:Label>

            </td>
            <td>
                <asp:TextBox ID="txtReturnValue" runat="server"></asp:TextBox>
               
            </td>
        </tr>
    </table>

</asp:Content>

