<%@ Page Title="" Language="C#" MasterPageFile="~/Master/TwoColumn.master" AutoEventWireup="true" CodeFile="TwoColumn.aspx.cs" Inherits="CDS_WebPage_TwoColumn" %>

<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>

<%@ Register src="../../Common/Organization/DepartmentTree.ascx" tagname="DepartmentTree" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ScriptContentPlaceHolder" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ToolbarContentPlaceHolder" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="LeftContentPlaceHolder" Runat="Server">
    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
        <ContentTemplate>
    <uc1:DepartmentTree ID="DepartmentTree1" runat="server" UpdateMode="Conditional" />
    </ContentTemplate></asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="RightContentPlaceHolder" Runat="Server">

    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
               <asp:Label ID="lblTreeValue" runat="server" Text=""></asp:Label>
                <Fast:Grid ID="Grid1" runat="server" AutoGenerateCheckBoxColumn="false" AutoGenerateColumns="false">
                    <Columns>
                        <asp:BoundField HeaderText="帳號" DataField="ACCOUNT" ItemStyle-Width="200px" />
                         <asp:BoundField HeaderText="姓名" DataField="NAME" ItemStyle-Width="200px" />
                    </Columns>
                </Fast:Grid>
        </ContentTemplate>
    </asp:UpdatePanel>

    <asp:Label ID="lblTitle" runat="server" Text="標題"  Visible="false" ></asp:Label>
</asp:Content>


