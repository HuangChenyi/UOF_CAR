<%@ Page Title="批次類別維護發佈對象" Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="EIP_Bulletin_ModifyPublishersByClass" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" Codebehind="ModifyPublishersByClass.aspx.cs" %>
<%@ Register src="../../Common/ChoiceCenter/UC_ChoiceList.ascx" tagname="UC_ChoiceList" tagprefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc1:UC_ChoiceList ID="UC_ChoiceList1" runat="server" ChioceType="All" 
        ExpandToUser="False" />
    <asp:HiddenField ID="hfClassID" runat="server" />
    <asp:HiddenField ID="hfType" runat="server" />
    <asp:Label ID="lblErrorMsg" runat="server" Text="修改失敗!" Visible="False" 
        meta:resourcekey="lblErrorMsgResource1"></asp:Label>
    <asp:Label ID="lblSubmitMsg" runat="server" Text="修改成功!" Visible="False" 
        meta:resourcekey="lblSubmitMsgResource1"></asp:Label>
</asp:Content>

