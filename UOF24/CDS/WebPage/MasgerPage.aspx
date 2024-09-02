<%@ Page Title="" Language="C#" MasterPageFile="~/Master/DefaultMasterPage.master" AutoEventWireup="true" CodeFile="MasgerPage.aspx.cs" Inherits="CDS_WebPage_MasgerPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
 <table class="PopTable" >
        <tr>
            <td class="PopTableLeftTD">
                <asp:Label ID="Label1" runat="server" Text="佈景主題ThemePage路徑"></asp:Label>
            </td>
            <td class="PopTableRightTD">
                <asp:Label ID="lblTheme" runat="server" Text=""></asp:Label>
            </td>            
        </tr>
         <tr>
             <td class="PopTableHeader" colspan="2">
                 <asp:Label ID="Label2" runat="server" Text="Class=PopTableHeader"></asp:Label>
             </td>
         </tr>
         <tr>
             <td>
                 <asp:Label ID="Label3" runat="server" Text="Class=PopTableLeftTD"></asp:Label>

             </td>
             <td>
                 <asp:Label ID="Label4" runat="server" Text="Class=PopTableRightTD"></asp:Label>
             </td>
         </tr>
         </table>

</asp:Content>

