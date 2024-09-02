<%@ Page Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="WKF_FormUse_FormIQY_SetProposalForOpinion" Title="" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" Codebehind="SetProposalForOpinion.aspx.cs" %>

<%@ Register src="../../../Common/ChoiceCenter/UC_ChoiceList.ascx" tagname="UC_ChoiceList" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<table width="100%" cellpadding="0" cellspacing="1" border="0" class="PopTable">
    <tr>
        <td width="100%" class="PopTableHeader">
            <center>
            <asp:Label ID="lblTitle" runat="server" Text="建議徵詢人員設定" meta:resourcekey="lblTitleResource1"></asp:Label></center></td>

    </tr>
    <tr>
        <td class="PopTableRightTD" style="background-color: white; text-align:left">
            <asp:Label ID="lblMassage" runat="server" Text="此項目為建議徵詢人員，給簽核者參考用，不會真的發出徵詢。" 
                 CssClass="SizeMemo" meta:resourcekey="lblMassageResource1"></asp:Label> </td>
    </tr>
    <tr>
        <td class="PopTableRightTD" style="background-color: white; text-align:left">            
            <uc1:UC_ChoiceList ID="UC_ChoiceList1" runat="server" TreeHeight="165px" 
                ShowMember="False" />            
        </td>
    </tr>    
</table>
</asp:Content>

