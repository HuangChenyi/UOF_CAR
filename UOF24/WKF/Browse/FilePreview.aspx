<%@ Page Title="" Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" CodeBehind="FilePreview.aspx.cs" Inherits="Ede.Uof.Web.WKF.Browse.FilePreview" %>

<%@ Register Src="~/Common/DCS/UC_XpsViewer.ascx" TagPrefix="uc1" TagName="UC_XpsViewer" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="background-color:white">
    <uc1:UC_XpsViewer runat="server" ID="UC_XpsViewer" />
        </div>
</asp:Content>
