<%@ Page Title="原因" Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" CodeBehind="DocChangeReason.aspx.cs" Inherits="Ede.Uof.Web.DMS.DocStore.DocChangeReason" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        &nbsp;<b><asp:Label ID="Label1" runat="server" Text="原因：" Height="30px" meta:resourcekey="Label1Resource1"></asp:Label></b><br />
      <div  style="background-color: white; overflow: auto; width: 100%; height:260px; border:2px inset;"  >
        <asp:Literal ID="Literal1" runat="server" meta:resourcekey="Literal1Resource1"></asp:Literal>
      </div>
</asp:Content>
