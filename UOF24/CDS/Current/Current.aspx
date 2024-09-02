<%@ Page Title="" Language="C#" MasterPageFile="~/Master/DefaultMasterPage.master" AutoEventWireup="true" CodeFile="Current.aspx.cs" Inherits="CDS_Current_Current" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<table class="PopTable">
        <tr>
            <td style="text-align:center" class="PopTableHeader"  colspan="2">
                <center>                <asp:Label ID="Label1" runat="server" Text="Current物件"></asp:Label>
                    </center>

            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label2" runat="server" Text="Login User Guid"></asp:Label>
            </td>
            <td>
                <asp:Label ID="lblUserGuid" runat="server" Text=""></asp:Label>

            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label3" runat="server" Text="Login User Name"></asp:Label>
            </td>
            <td>
                <asp:Label ID="lblName" runat="server" Text=""></asp:Label>

            </td>
        </tr>
                <tr>
            <td>
                <asp:Label ID="Label5" runat="server" Text="Login User IP"></asp:Label>
            </td>
            <td>
                <asp:Label ID="lblIP" runat="server" Text=""></asp:Label>

            </td>
        </tr>

    </table>
</asp:Content>

