<%@ Page Language="C#" MasterPageFile="~/Master/DefaultMasterPage.master" AutoEventWireup="true" Inherits="WKF_Admin_EndFormCallBack_MasterPage" Title="外部WS註冊" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" Codebehind="EndFormCallBack_MasterPage.aspx.cs" %>

<%@ Register Src="EndFormCallBack_WS.ascx" TagName="EndFormCallBack_WS" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc1:EndFormCallBack_WS ID="EndFormCallBack_WS1" runat="server" />
</asp:Content>

