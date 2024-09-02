<%@ Page Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="WKF_FormUse_BatchSign_SignComment" Title="各站點簽核意見" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" Codebehind="SignComment.aspx.cs" %>

<%@ Register src="../TaskSiteSignInfo/UC_SignComment.ascx" tagname="UC_SignComment" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<table width="100%" cellpadding="0" cellspacing="0" border="0">
    <tr>
        <td>
            <uc1:UC_SignComment ID="UC_SignComment1" runat="server" />
        </td>
    </tr>
</table>
</asp:Content>

