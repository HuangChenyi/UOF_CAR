<%@ Page Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="WKF_Admin_EndFormCallBack_Dialog" Title="設定Web Service 資訊" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" Codebehind="EndFormCallBack_Dialog.aspx.cs" %>

<%@ Register Src="EndFormCallBack_WS.ascx" TagName="EndFormCallBack_WS" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc1:EndFormCallBack_WS ID="EndFormCallBack_WS1" runat="server" />
</asp:Content>

