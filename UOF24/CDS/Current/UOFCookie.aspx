<%@ Page Title="" Language="C#" MasterPageFile="~/Master/DefaultMasterPage.master" AutoEventWireup="true" CodeFile="UOFCookie.aspx.cs" Inherits="CDS_Utility_UOFCookie" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table class="PopTable">

         <tr>
            <td>
                <asp:Button ID="btnSet" runat="server" Text="Set" OnClick="btnSet_Click" />
              
                <asp:Button ID="btnGet" runat="server" Text="Get" OnClick="btnGet_Click"   />

                 <asp:Button ID="btnRemove" runat="server" Text="Remove" OnClick="btnRemove_Click"   />
            </td>
              <td>
                <asp:Label ID="Label1" runat="server" Text="Key"></asp:Label>
                <asp:TextBox ID="txtKey" runat="server"></asp:TextBox>
                <asp:Label ID="Label2" runat="server" Text="Value"></asp:Label>
                <asp:TextBox ID="txtValue" runat="server"></asp:TextBox>
            </td>
             </tr>
    </table>
</asp:Content>

