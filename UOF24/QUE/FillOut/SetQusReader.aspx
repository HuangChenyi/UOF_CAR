<%@ Page Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="QUE_FillOut_SetQusReader" Title="設定觀看權限" Codebehind="SetQusReader.aspx.cs" %>

<%@ Register src="../../Common/ChoiceCenter/UC_ChoiceList.ascx" tagname="UC_ChoiceList" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc1:UC_ChoiceList ID="UC_ChoiceList1" runat="server" ExpandToUser="false" />
</asp:Content>

