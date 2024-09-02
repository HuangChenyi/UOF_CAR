<%@ Page Title="" Language="C#" MasterPageFile="~/Master/DefaultMasterPage.master" AutoEventWireup="true" CodeFile="Default2.aspx.cs" Inherits="CDS_WebPage_Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table class="PopTable"  style="width:600px" >
        <tr>
            <td class="PopTableHeader" colspan="2">
                <center>
                    <asp:Label ID="Label5" runat="server" Text="個人資料"></asp:Label>
                </center>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label1" runat="server" Text="姓名"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox1" runat="server" Text="Chenyi Huang"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label3" runat="server" Text="性別"></asp:Label>
            </td>
            <td>
                <asp:RadioButtonList ID="RadioButtonList1" runat="server" RepeatDirection="Horizontal">
                    <asp:ListItem Text="男" Value="0"></asp:ListItem>
                     <asp:ListItem Text="女" Value="1"></asp:ListItem>
                </asp:RadioButtonList>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label2" runat="server" Text="Email"></asp:Label>
            </td>
            <td>
                 <asp:TextBox ID="TextBox2" runat="server" Text="abc@edetw.com"></asp:TextBox>
            </td>
        </tr>
         <tr>
            <td>
                <asp:Label ID="Label4" runat="server" Text="專長"></asp:Label>
            </td>
            <td>
                 <asp:TextBox ID="TextBox3" runat="server" Text="吃飯"></asp:TextBox>
            </td>
        </tr>
    </table>
</asp:Content>

