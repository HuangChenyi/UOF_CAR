<%@ Page Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="WKF_FlowManagement_SetFormField" Title="選擇表單欄位" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" Codebehind="SetFormField.aspx.cs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Table ID="Table1" runat="server" meta:resourcekey="Table1Resource1">
    </asp:Table>
    
    <asp:Label ID="lblFormId" runat="server" Text="欄位代號" Visible="False" 
        meta:resourcekey="lblFormIdResource1"></asp:Label>
    <asp:Label ID="lblFormName" runat="server" Text="欄位名稱" Visible="False" 
        meta:resourcekey="lblFormNameResource1"></asp:Label>
</asp:Content>

