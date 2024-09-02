<%@ Page Title="" Language="C#" MasterPageFile="~/Master/DefaultMasterPage.master" AutoEventWireup="true" CodeBehind="ShowSetting.aspx.cs" Inherits="System_LocationTimeZone_ShowSetting" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:DropDownList ID="ddlTimeZone" runat="server" OnSelectedIndexChanged="ddlTimeZone_SelectedIndexChanged" AutoPostBack="true">
    </asp:DropDownList>
    <br />
    <asp:TextBox ID="txtTimeZoneXml" runat="server" ReadOnly="true" TextMode="MultiLine" Rows="20" Width="800px"></asp:TextBox>
</asp:Content>
