<%@ Page Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="WKF_FlowManagement_SelectBranchNode" Title="流程選擇"  Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" Codebehind="SelectBranchNode.aspx.cs" %>

<%@ Register Src="UC_SelectSubFlow.ascx" TagName="UC_SelectSubFlow" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<br />
<div style="text-align:center">
    <table cellspacing="1" class="PopTable" style="width: 400px; height: 500px">
        <tr>
            <td align="center" style="background-image: url(../../App_Themes/DefaultTheme/images/po_06.gif);
                height: 27px">
                <asp:Label ID="lblSubFlow" runat="server" Text="流程選擇" meta:resourcekey="lblSubFlowResource1"></asp:Label>
                <asp:CustomValidator ID="CustomValidatorSubFlow" runat="server" Display="Dynamic"
                    ErrorMessage="請選擇副流程" meta:resourcekey="CustomValidatorSubFlowResource1"></asp:CustomValidator></td>
        </tr>
        <tr>
            <td align="center" class="PopTableRightTD" valign="top">
    <uc1:UC_SelectSubFlow ID="UC_SelectSubFlow1" runat="server" />
            </td>
        </tr>
    </table>
</div>
</asp:Content>

