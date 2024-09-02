<%@ Page Title="" Language="C#" MasterPageFile="~/Master/DefaultMasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="CDS_XML_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:TextBox ID="txtXML" runat="server"  TextMode="MultiLine" Width="300px" Height="300px" ></asp:TextBox>
    <asp:TextBox ID="txtID" runat="server"></asp:TextBox>
    <asp:Button ID="btnGetValue" runat="server" Text="取得值" OnClick="btnGetValue_Click" />
    <asp:TextBox ID="txtValue" runat="server"></asp:TextBox>
</asp:Content>

