<%@ Page Title="" Language="C#" MasterPageFile="~/Master/DefaultMasterPage.master" AutoEventWireup="true" CodeFile="Default2.aspx.cs" Inherits="CDS_Grid_Default2" %>
<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Ede" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <Ede:Grid ID="grid" runat="server" AutoGenerateColumns="true" AutoGenerateCheckBoxColumn="false"></Ede:Grid>

</asp:Content>

