<%@ Control Language="C#" AutoEventWireup="true"
    Inherits="WKF_FlowManagement_UC_BranchNode" Codebehind="UC_BranchNode.ascx.cs" %>
<table>
    <tr>
        <td align="center" class="PopFlowTableHeader">
            <asp:Label ID="lblCondition" runat="server" Text="lblCondition" meta:resourcekey="lblConditionResource1"></asp:Label></td>
        <td colspan="2" class="PopTableRightTD">
            <asp:Label ID="lblFormula" runat="server" Text="lblFormula" meta:resourcekey="lblFormulaResource1"></asp:Label></td>
    </tr>
    <tr>
        <td align="center" class="PopTableLeftTD">
            <div align="center">
                <asp:Label ID="lblGoBackFlowTitle" runat="server" Text="回到主流程" meta:resourcekey="lblGoBackFlowTitleResource1"></asp:Label></div>
        </td>
        <td align="center" class="PopTableLeftTD">
            <div align="center">
                <asp:Label ID="lblUseFlowTitle" runat="server" Text="流程" meta:resourcekey="lblUseFlowTitleResource1"></asp:Label></div>
        </td>
        <td align="center" style="width: 248px;" class="PopTableLeftTD">
            <div align="center">
                <asp:Label ID="lblhandleTitle" runat="server" Text="操作" meta:resourcekey="lblhandleTitleResource1"></asp:Label></div>
        </td>
    </tr>
    <tr>
        <td align="center" style="height: 40px" class="PopTableRightTD">
            <asp:Label ID="lblIsGoBackFlow" runat="server" Text="lblIsGoBackFlow" meta:resourcekey="lblIsGoBackFlowResource1"></asp:Label></td>
        <td align="center" style="height: 40px" class="PopTableRightTD">
            <asp:Label ID="lblUseFlow" runat="server" Text="lblUseFlow" meta:resourcekey="lblUseFlowResource1"></asp:Label></td>
        <td align="center" style="width: 248px; height: 40px" class="PopTableRightTD">
            <telerik:RadButton ID="ibtnSetupSubFlow" runat="server" meta:resourcekey="ibtnSetupSubFlowResource1"></telerik:RadButton>
            &nbsp;
            <telerik:RadButton ID="ibtnDelete" runat="server" meta:resourcekey="ibtnDeleteResource1"></telerik:RadButton>
        </td>
    </tr>
</table>
<asp:Label ID="lblSetupSubFlow" runat="server" Text="設定副流程" Visible="False" meta:resourcekey="lblSetupSubFlowResource1"></asp:Label>
<asp:Label ID="lblDelete" runat="server" Text="刪除" Visible="False" meta:resourcekey="lblDeleteResource1"></asp:Label>