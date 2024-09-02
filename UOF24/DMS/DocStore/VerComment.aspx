<%@ Page Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="DMS_DocStore_VerComment" Title="版本備註" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" Codebehind="VerComment.aspx.cs" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    &nbsp;<b><asp:Label ID="Label1" runat="server" Text="版本備註：" meta:resourcekey="Label1Resource1" Height="30px"></asp:Label></b>

    <br />
    <asp:Panel ID="pnlLiteral" runat="server">
        <div  style="background-color: white; overflow: auto; width: 100%; height:260px; border:2px inset;"  >
            <asp:Literal ID="Literal1" runat="server"></asp:Literal>
        </div>
    </asp:Panel>

    <asp:Panel ID="pnlTextBox" runat="server">
        <asp:TextBox ID="tbComment" Width="100%" Height="260" TextMode="MultiLine" runat="server"></asp:TextBox>
    </asp:Panel>

    <asp:HiddenField ID="hfDocId" runat="server" Value=""/>
    <asp:HiddenField ID="hfDocStatus" runat="server" Value=""/>
</asp:Content>

