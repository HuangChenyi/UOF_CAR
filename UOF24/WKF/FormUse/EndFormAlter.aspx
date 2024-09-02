<%@ Page Title="表單結案知會人員" Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="WKF_FormUse_EndFormAlter" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" Codebehind="EndFormAlter.aspx.cs" %>

<%@ Register src="../../Common/ChoiceCenter/UC_ChoiceList.ascx" tagname="UC_ChoiceList" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<table class="PopTable" cellpadding=0 cellspacing=1>
    <tr>
        <td class="PopTableLeftTD" nowrap=nowrap>
            <asp:Label ID="Label1" runat="server" Text="知會人員" 
                meta:resourcekey="Label1Resource1"></asp:Label>        
        </td>
        <td class="PopTableRightTD">
            <uc1:UC_ChoiceList ID="UC_ChoiceList1" runat="server" ExpandToUser=false ShowMember=false />
        </td>
    </tr>
    
</table>
</asp:Content>

