<%@ Page Title="我的公文" Language="C#" MasterPageFile="~/Master/DefaultMasterPage.master" AutoEventWireup="true" CodeBehind="PersonalEdoc.aspx.cs" Inherits="Ede.Uof.Web.Edoc.Personal.PersonalEdoc" %>

<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Ede" %>
<%@ Register Src="~/Edoc/SendDoc/UC_SendEdocList.ascx" TagName="UC_SendEdocList" TagPrefix="uc1" %>
<%@ Register Src="~/Edoc/Common/UC_EdocViewer.ascx" TagPrefix="uc2" TagName="UC_EdocViewer" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <uc1:UC_SendEdocList ID="UC_SendEdocList1" runat="server" />

</asp:Content>
