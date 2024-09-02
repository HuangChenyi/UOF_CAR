<%@ Page Title="觀看簽核意見" Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="WKF_FormUse_TaskSiteSignInfo_SignComment" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" Codebehind="SignComment.aspx.cs" %>

<%@ Register src="UC_SignComment.ascx" tagname="UC_SignComment" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<script type="text/jscript">
    function CopyToClipBoard() {
        clipboardData.setData("Text", event.srcElement.innerText);
    }
</script>
    <uc1:UC_SignComment ID="UC_SignComment1" runat="server" />

</asp:Content>

