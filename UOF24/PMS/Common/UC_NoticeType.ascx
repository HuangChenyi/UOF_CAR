<%@ Control Language="C#" AutoEventWireup="true" Inherits="PMS_Common_UC_NoticeType" Codebehind="UC_NoticeType.ascx.cs" %>
<table>
   <tr>
        <td><asp:CheckBox ID="cboxAudit" runat="server" Text="審核通知" Visible="False" meta:resourcekey="cboxAuditResource1" /></td>
    </tr>
    <tr>
        <td>
<asp:CheckBox ID="cboxStartProj" runat="server" Text="起案通知" OnCheckedChanged="cboxStartProj_CheckedChanged" meta:resourcekey="cboxStartProjResource1" /></td>
    </tr>
    <tr>
        <td>
            <table cellpadding="0" cellspacing="0" border="0">
                <tr>
                    <td >
                        <asp:CheckBox ID="cboxReminder" runat="server" Text="執行前通知" OnCheckedChanged="cboxReminder_CheckedChanged" meta:resourcekey="cboxReminderResource1" /></td>
                    <td >
        <asp:DropDownList ID="ddlReminderTime" runat="server" OnSelectedIndexChanged="ddlReminderTime_SelectedIndexChanged" meta:resourcekey="ddlReminderTimeResource1">
            <asp:ListItem Value="1440" meta:resourcekey="ListItemResource1">1天</asp:ListItem>
            <asp:ListItem Value="4320" meta:resourcekey="ListItemResource2">3天</asp:ListItem>
            <asp:ListItem Value="10080" meta:resourcekey="ListItemResource3">1週</asp:ListItem>
        </asp:DropDownList>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td>
<asp:CheckBox ID="cboxTimeOut" runat="server" Text="逾時通知" OnCheckedChanged="cboxTimeOut_CheckedChanged" meta:resourcekey="cboxTimeOutResource1" /></td>
    </tr>
    <tr>
        <td><asp:CheckBox ID="cboxOutcome" runat="server" Text="審核結果通知" OnCheckedChanged="cboxOutcome_CheckedChanged" meta:resourcekey="cboxOutcomeResource1" /></td>
    </tr>
    <tr>
        <td>
<asp:CheckBox ID="cboxProjTask" runat="server" Text="專案任務通知" OnCheckedChanged="cboxProjTask_CheckedChanged" meta:resourcekey="cboxProjTaskResource1" /></td>
    </tr>
</table>
