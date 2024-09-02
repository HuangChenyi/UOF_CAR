<%@ Control Language="C#" AutoEventWireup="true" CodeFile="UC_WebPart.ascx.cs" Inherits="CDS_WebPart_UC_WebPart" %>
<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Ede" %>
<asp:Label ID="lblAlert" runat="server" Text="您沒有權限觀看!" Visible="false"></asp:Label>
<Ede:Grid ID="Grid1" runat="server" AutoGenerateCheckBoxColumn="false"></Ede:Grid>
