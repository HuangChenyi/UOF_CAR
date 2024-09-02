<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CalculateTextUC.ascx.cs" Inherits="WKF_FormManagement_VersionFieldUserControl_CalculateTextUC" %>
<%@ Reference Control="~/WKF/FormManagement/VersionFieldUserControl/VersionFieldUC.ascx" %>


<asp:Panel ID="PanelNormal" runat="server" Width="100%" meta:resourcekey="PanelNormalResource1">
    <table border="0" cellpadding="0" cellspacing="0" style="width: 97%" id="tbField" runat="server">
        <tr>
            <td id="tdInvisible" runat="server">
                <asp:Label ID="lblInvisible" runat="server" Text="******"></asp:Label>
            </td>
            <td id="tdVisible" runat="server">
                <asp:Label ID="lblCalculateResult" runat="server" meta:resourcekey="lblCalculateResultResource1" Width="100%" style="text-align:right;padding-right:5px;padding-left:5px;padding-top:2px;padding-bottom:1px;"></asp:Label>
                <telerik:RadNumericTextBox ID="tbxCountResult" runat="server" ReadOnly="True" Width="100%" Display="False"></telerik:RadNumericTextBox>
            </td>
        </tr>
        <tr>
            <td colspan="2" id="tdFormula"  runat="server">
                <asp:Label ID="lblDivZeroAlert" runat="server" Font-Bold="True" ForeColor="Red" style="display:none;" Text="(注意!計算結果為零)" meta:resourcekey="lblDivZeroAlertResource1"></asp:Label>
                <asp:Label ID="lblFormula" runat="server" ForeColor="Gray" Font-Bold="False" Font-Underline="False" meta:resourcekey="lblFormulaResource1"></asp:Label>
                <asp:Label ID="lblForumlaMsg" runat="server" Text="公式" Visible="False" meta:resourcekey="lblForumlaMsgResource1"></asp:Label>
            </td>
        </tr>
    </table>
</asp:Panel>

<asp:Panel ID="PanelCond" runat="server" Visible="False" meta:resourcekey="PanelCondResource1">
    <table border="0" cellpadding="0" cellspacing="0" style="width: 100%">
        <tr>
            <td>
                <telerik:RadNumericTextBox ID="RadNumericTextBoxCalc" runat="server" Value="0"></telerik:RadNumericTextBox>
            </td>
        </tr>
    </table>
</asp:Panel>

