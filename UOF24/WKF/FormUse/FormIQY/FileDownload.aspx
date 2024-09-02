<%@ Page Title="" Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="WKF_FormUse_FormIQY_FileDownload" Codebehind="FileDownload.aspx.cs" %>

<%@ Register Src="~/Common/FileCenter/V3/UC_FileCenter.ascx" TagPrefix="uc1" TagName="UC_FileCenter" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc1:UC_FileCenter runat="server" ID="UC_FileCenter" ModuleName="WKF" Editable="false" ProxyEnabled="true"/>
</asp:Content>

