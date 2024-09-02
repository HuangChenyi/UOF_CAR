<%@ Page Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="EIP_Polling_SubjectMasterSetting" Title="管理員設定" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" Codebehind="SubjectMasterSetting.aspx.cs" %>

<%@ Register Src="../../Common/ChoiceCenter/UC_ChoiceList.ascx" TagName="UC_ChoiceList" TagPrefix="uc1" %>
    
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table width="100%">
        <tr>
            <td>
                <asp:ValidationSummary ID="ValidationSummary1" runat="server" meta:resourcekey="ValidationSummary1Resource1" BackColor="Red" ForeColor="White" />
                <asp:CustomValidator ID="CustomValidator1" runat="server" Display="None" ErrorMessage="無設定議題管理員權限" meta:resourcekey="CustomValidator1Resource1"></asp:CustomValidator></td>
        </tr>
        <tr>
            <td>
    <uc1:UC_ChoiceList ID="UC_ChoiceList1" runat="server" />
            
            </td>
        </tr>
    </table>
</asp:Content>

