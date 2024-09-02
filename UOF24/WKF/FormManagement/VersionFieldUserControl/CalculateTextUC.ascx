<%@ Control Language="C#" AutoEventWireup="true" Inherits="WKF_FormManagement_VersionFieldUserControl_CalculateTextUC" CodeBehind="CalculateTextUC.ascx.cs" %>
<%@ Reference Control="~/WKF/FormManagement/VersionFieldUserControl/VersionFieldUC.ascx" %>

<%-- 為了避免designer錯誤，所以要與Mobile元件同步 --%>

<asp:Panel ID="PanelNormal" runat="server" Width="100%" meta:resourcekey="PanelNormalResource1">
    <table border="0" cellpadding="0" cellspacing="0" id="tbField" runat="server">
        <tr>
            <td id="tdInvisible" runat="server">
                <asp:Label ID="lblInvisible" runat="server" Text="******"></asp:Label>
            </td>
            <td id="tdVisible" runat="server">
                <asp:Label ID="lblCalculateResult" runat="server" meta:resourcekey="lblCalculateResultResource1" Width="100%" style="text-align:right;padding-right:5px;padding-left:5px;padding-top:2px;padding-bottom:1px;"></asp:Label>
                <telerik:RadNumericTextBox ID="tbxCountResult" runat="server" ReadOnly="True" Display="False"></telerik:RadNumericTextBox>
                &nbsp;&nbsp;
            </td>
            <td id="tdFormula"  runat="server">
                <asp:Label ID="lblDivZeroAlert" runat="server" Font-Bold="True" ForeColor="Red" style="display:none;" Text="(注意!計算結果為零)" meta:resourcekey="lblDivZeroAlertResource1"></asp:Label>
                <asp:Label ID="lblFormula" runat="server" ForeColor="Gray" Font-Bold="False" Font-Underline="False" meta:resourcekey="lblFormulaResource1"></asp:Label>
                <asp:Label ID="lblForumlaMsg" runat="server" Text="公式" Visible="False" meta:resourcekey="lblForumlaMsgResource1"></asp:Label>
            </td>
        </tr>
    </table>

</asp:Panel>

<asp:Panel ID="PanelCond" runat="server" Visible="False" meta:resourcekey="PanelCondResource1">
    <telerik:RadNumericTextBox ID="RadNumericTextBoxCalc" runat="server" Value="0"></telerik:RadNumericTextBox>
</asp:Panel>
