<%@ Control Language="C#" AutoEventWireup="true" Inherits="EIP_Calendar_Common_UC_PrivateEvent" Codebehind="UC_PrivateEvent.ascx.cs" %>

<table border=0>
    <tr>
        <td style="white-space:nowrap">
<asp:Label ID="Label1" runat="server" Text="當別人查閱我的行事曆時" meta:resourcekey="Label1Resource1"></asp:Label></td>
        <td>
<asp:DropDownList ID="ddlEventType" runat="server" meta:resourcekey="ddlEventTypeResource1">
    <asp:ListItem Value="Display" Text="顯示事件" meta:resourcekey="ListItemResource1" ></asp:ListItem>
    <asp:ListItem Value="DisplayAsBusy" Text="顯示為忙碌" meta:resourcekey="ListItemResource2" ></asp:ListItem>
    <asp:ListItem Value="DisplayAsInMeeting" Text="顯示為會議中" meta:resourcekey="ListItemResource3" ></asp:ListItem>
    <asp:ListItem Value="DisplayAsOut" Text="顯示為不在辦公室" meta:resourcekey="ListItemResource4" ></asp:ListItem>
    <asp:ListItem Value="NotDisplay" Text="不顯示此事件" meta:resourcekey="ListItemResource5" ></asp:ListItem>
</asp:DropDownList></td>
    </tr>
</table>
