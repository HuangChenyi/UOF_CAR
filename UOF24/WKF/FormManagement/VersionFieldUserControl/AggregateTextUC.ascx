<%@ Control Language="C#" AutoEventWireup="true" Inherits="WKF_FormManagement_VersionFieldUserControl_AggregateTextUC" CodeBehind="AggregateTextUC.ascx.cs" %>
<%@ Reference Control="~/WKF/FormManagement/VersionFieldUserControl/VersionFieldUC.ascx" %>

<%-- 為了避免designer錯誤，所以要與Mobile元件同步 --%>
<asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate></ContentTemplate>
</asp:UpdatePanel>
<asp:Panel ID="PanelNormal" runat="server" Width="100%" meta:resourcekey="PanelNormalResource1">

    <table border="0" cellpadding="0" cellspacing="0">
        <tr>
            <td id="tdInvisible" runat="server">
                <asp:Label ID="lblInvisible" runat="server" Text="******"></asp:Label>
            </td>
            <td id="tdVisible" runat="server">
                <asp:Label ID="lblAggResult" runat="server" Visible="False" meta:resourcekey="lblAggResultResource1"></asp:Label>
                <telerik:RadNumericTextBox ID="tbxCountResult" runat="server" ReadOnly="True"></telerik:RadNumericTextBox>
                &nbsp;&nbsp;
            </td>
            <td>
                <asp:Label ID="lblAggFormula" runat="server" Font-Bold="False" ForeColor="Gray" Font-Underline="False" meta:resourcekey="lblAggFormulaResource1"></asp:Label>
                <asp:Label ID="lblForumlaMsg" runat="server" Text="公式" Visible="False" meta:resourcekey="lblForumlaMsgResource1"></asp:Label>
                <asp:TextBox ID="TextBox1" runat="server" Height="0px" OnTextChanged="TextBox1_TextChanged1" Width="0px" Style="display: none"></asp:TextBox>
            </td>
        </tr>
    </table>

</asp:Panel>

<asp:Panel ID="PanelCond" runat="server" Visible="False" meta:resourcekey="PanelCondResource1">
    <telerik:RadNumericTextBox ID="WebNumericEditAgg" runat="server"></telerik:RadNumericTextBox>
</asp:Panel>
