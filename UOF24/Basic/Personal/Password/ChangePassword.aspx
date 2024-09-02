<%@ Page Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="Basic_Personal_ChangePassword" Title="變更密碼" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" Codebehind="ChangePassword.aspx.cs" %>

<%@ Register Src="UC_ChangePassword.ascx" TagName="UC_ChangePassword" TagPrefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
   
    <uc1:UC_ChangePassword id="UC_ChangePassword1" runat="server">
    </uc1:UC_ChangePassword>
 
</asp:Content>
