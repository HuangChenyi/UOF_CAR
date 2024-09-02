<%@ Page Title="公文檔製作" Language="C#" MasterPageFile="~/Master/DefaultMasterPage.master" AutoEventWireup="true" CodeBehind="SendEdoc.aspx.cs" Inherits="Ede.Uof.Web.Edoc.SendDoc.SendEdoc" %>

<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Ede" %>
<%@ Register Src="~/Edoc/SendDoc/UC_SendEdocList.ascx" TagName="UC_SendEdocList" TagPrefix="uc1" %>
<%@ Register Src="~/Edoc/Common/UC_EdocViewer.ascx" TagPrefix="uc2" TagName="UC_EdocViewer" %>

<asp:content id="content1" contentplaceholderid="ContentPlaceHolder1" runat="server">
    
    <uc1:UC_SendEdocList ID="UC_SendEdocList1" runat="server" />

</asp:content>
