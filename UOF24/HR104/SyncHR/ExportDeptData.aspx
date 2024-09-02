<%@ Page Title="" Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" CodeBehind="ExportDeptData.aspx.cs" Inherits="Ede.Uof.Web.HR104.SyncHR.ExportDeptData" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <telerik:RadTreeView ID="treeDepartment" Visible="False" runat="server" Height="100%" Width="100%" ShowLineImages="False" meta:resourcekey="treeDepartmentResource1" ></telerik:RadTreeView>
    <asp:label ID="lblInfo" Text="說明：已停用部門以灰色標示" runat="server" Visible="False" meta:resourcekey="lblInfoResource1"/>
</asp:Content>
