<%@ Page Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="WKF_FormUse_ChoiceOfAnAgent" Title="代理申請" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" Codebehind="ChoiceOfAnAgent.aspx.cs" %>

<%@ Register src="../../Common/ChoiceCenter/UC_ChoiceOnce.ascx" tagname="UC_ChoiceOnce" tagprefix="uc1" %>
<%@ Register src="../../Common/ChoiceCenter/UC_ChoiceOnceByGroup.ascx" tagname="UC_ChoiceOnceByGroup" tagprefix="uc2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <table width="100%" cellpadding="0" cellspacing="0" border="0">
        <tr>
            <td width="100%">
                <uc2:UC_ChoiceOnceByGroup ID="UC_ChoiceOnceByGroup1" runat="server" />
            </td>
        </tr>
    </table>

    <asp:Label ID="lblNoGroupIdMsg" runat="server" Text="並未選擇任何人員!!" 
        Visible="False" meta:resourcekey="lblNoGroupIdMsgResource1">
    </asp:Label>
</asp:Content>