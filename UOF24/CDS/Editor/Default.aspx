<%@ Page Title="" Language="C#" MasterPageFile="~/Master/DefaultMasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="CDS_Editor_Default" %>

<%@ Register Src="~/Common/HtmlEditor/UC_HtmlEditor.ascx" TagPrefix="uc1" TagName="UC_HtmlEditor" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    <asp:Button ID="btnEditor" runat="server" Text="編輯文章" OnClick="btnEditor_Click" />

    <table class="PopTable">
        <tr>
            <td>
                <asp:Label ID="Label1" runat="server" Text="文章內容"></asp:Label>
            </td>
            <td>
                
                <asp:Label ID="lblHtml" runat="server" Text=""></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label3" runat="server" Text="原始Html內容"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtSourceHtml" runat="server" TextMode="MultiLine" Height="200px" Width="100%"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label2" runat="server" Text="Html內容"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtHtml" runat="server" TextMode="MultiLine" Height="200px" Width="100%"></asp:TextBox>
            </td>
        </tr>
               <tr>
            <td>
                <asp:Label ID="Label4" runat="server" Text="Html內容ForMessage"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtHtmlForMessage" runat="server" TextMode="MultiLine" Height="200px" Width="100%"></asp:TextBox>
            </td>
        </tr>
    </table>
</asp:Content>

