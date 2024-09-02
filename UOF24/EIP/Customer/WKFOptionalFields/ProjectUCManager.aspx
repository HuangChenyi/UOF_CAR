<%@ Page Title="" Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="EIP_Customer_WKFOptionalFields_ProjectUCManager" Codebehind="ProjectUCManager.aspx.cs" %>

<%@ Register Src="~/EIP/Customer/Control/UC_Project.ascx" TagPrefix="uc1" TagName="UC_Project" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc1:UC_Project runat="server" ID="UC_Project" Source="WKF" />
</asp:Content>

