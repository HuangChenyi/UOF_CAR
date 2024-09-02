<%@ Control Language="C#" AutoEventWireup="true" Inherits="EIP_Calendar_Common_UC_RepeatRange" Codebehind="UC_RepeatRange.ascx.cs" %>

<asp:UpdatePanel ID="UpdatePanel1" runat="server">
<ContentTemplate>
<asp:DropDownList ID="ddlSelectRange" runat="server" AutoPostBack="True" 
    onselectedindexchanged="ddlSelectRange_SelectedIndexChanged" 
    meta:resourcekey="ddlSelectRangeResource1" >
    <asp:ListItem Value="0" Text="請選擇" meta:resourcekey="ListItemResource1"></asp:ListItem>
    <asp:ListItem Value="1" Text="每日" meta:resourcekey="ListItemResource2"></asp:ListItem>
    <asp:ListItem Value="2" Text="每週" meta:resourcekey="ListItemResource3"></asp:ListItem>
    <asp:ListItem Value="3" Text="每月" meta:resourcekey="ListItemResource4"></asp:ListItem>
</asp:DropDownList>

<asp:Panel ID="Panel2" runat="server" meta:resourcekey="Panel2Resource1">
<table class="PopTable" cellspacing="1" style="width:100%;">
    <tr>
        <td style="white-space:nowrap; width:120px;">
            <asp:Label ID="Label3" runat="server" Text="日期設定" 
                meta:resourceKey="Label3Resource1"></asp:Label>
        </td>
        <td>
            <table style="width:100%;">
                <tr>
                    <td>
                        <asp:Label ID="Label4" runat="server" Text="每隔" 
                            meta:resourceKey="Label4Resource1"></asp:Label>
                        <asp:DropDownList ID="ddlWeekInterval" runat="server" 
                            meta:resourceKey="ddlWeekIntervalResource1">
                            <asp:ListItem Value="0" meta:resourceKey="ListItemResource5" Text="一週"></asp:ListItem>
                            <asp:ListItem Value="1" meta:resourceKey="ListItemResource6" Text="二週"></asp:ListItem>
                            <asp:ListItem Value="2" meta:resourceKey="ListItemResource7" Text="三週"></asp:ListItem>
                            <asp:ListItem Value="3" meta:resourceKey="ListItemResource8" Text="四週"></asp:ListItem>
                        </asp:DropDownList>
                        <asp:Label ID="Label5" runat="server" Text="的" 
                            meta:resourceKey="Label5Resource1"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:CheckBoxList ID="chbSelectWeekDays" runat="server" 
                            RepeatDirection="Horizontal" RepeatColumns="4" 
                            meta:resourceKey="chbSelectWeekDaysResource1">
                            <asp:ListItem Value="Sun" meta:resourceKey="ListItemResource9" Text="星期日"></asp:ListItem>
                            <asp:ListItem Value="Mon" meta:resourceKey="ListItemResource10" Text="星期一"></asp:ListItem>
                            <asp:ListItem Value="Tue" meta:resourceKey="ListItemResource11" Text="星期二"></asp:ListItem>
                            <asp:ListItem Value="Med" meta:resourceKey="ListItemResource12" Text="星期三"></asp:ListItem>
                            <asp:ListItem Value="Thu" meta:resourceKey="ListItemResource13" Text="星期四"></asp:ListItem>
                            <asp:ListItem Value="May" meta:resourceKey="ListItemResource14" Text="星期五"></asp:ListItem>
                            <asp:ListItem Value="Sat" meta:resourceKey="ListItemResource15" Text="星期六"></asp:ListItem>
                        </asp:CheckBoxList>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>
</asp:Panel>
<asp:Panel ID="Panel3" runat="server" meta:resourcekey="Panel3Resource1">
<table class="PopTable" cellspacing="1" style="width: 100%;">
    <tr>
        <td style=" white-space:nowrap;width:120px;">
            <asp:Label ID="Label7" runat="server" Text="日期設定" 
                meta:resourceKey="Label7Resource1"></asp:Label>
        </td>
        <td>
           <table style="width:100%;">
                <tr>
                    <td>
                        <asp:RadioButton ID="rbEveryMonth" runat="server" Text="每月的" 
                            GroupName="MonthRepeat" meta:resourceKey="rbEveryMonthResource1"/>
                         <asp:DropDownList ID="ddlOrder" runat="server" 
                            meta:resourceKey="ddlOrderResource1" >
                    <asp:ListItem Value="0" Text="第一個" meta:resourceKey="ListItemResource16"></asp:ListItem>
                    <asp:ListItem Value="1" Text="第二個" meta:resourceKey="ListItemResource17"></asp:ListItem>
                    <asp:ListItem Value="2" Text="第三個" meta:resourceKey="ListItemResource18"></asp:ListItem>
                    <asp:ListItem Value="3" Text="第四個" meta:resourceKey="ListItemResource19"></asp:ListItem>
                    <asp:ListItem Value="4" Text="最後一個" meta:resourceKey="ListItemResource20"></asp:ListItem>
                </asp:DropDownList>
                <asp:DropDownList ID="ddlWeekList" runat="server" 
                            meta:resourceKey="ddlWeekListResource1" >
                    <asp:ListItem Value="0" Text="星期日" meta:resourceKey="ListItemResource21"></asp:ListItem>
                    <asp:ListItem Value="1" Text="星期一" meta:resourceKey="ListItemResource22"></asp:ListItem>
                    <asp:ListItem Value="2" Text="星期二" meta:resourceKey="ListItemResource23"></asp:ListItem>
                    <asp:ListItem Value="3" Text="星期三" meta:resourceKey="ListItemResource24"></asp:ListItem>
                    <asp:ListItem Value="4" Text="星期四" meta:resourceKey="ListItemResource25"></asp:ListItem>
                    <asp:ListItem Value="5" Text="星期五" meta:resourceKey="ListItemResource26"></asp:ListItem>
                    <asp:ListItem Value="6" Text="星期六" meta:resourceKey="ListItemResource27"></asp:ListItem>
                </asp:DropDownList><br />
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:RadioButton ID="rbThisDay" runat="server" Text="在事件發生的這一天" 
                            GroupName="MonthRepeat" meta:resourceKey="rbThisDayResource1"/>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    </table>
</asp:Panel>
<asp:Panel ID="Panel1" runat="server" meta:resourcekey="Panel1Resource1">
<table class="PopTable" cellspacing="1" style="width: 100%;">
    <tr>
        <td style=" white-space:nowrap;width:120px;">
            <asp:Label ID="Label1" runat="server" Text="重覆至" meta:resourceKey="Label1Resource1"></asp:Label>
        </td>
        <td >
        <telerik:RadDatePicker ID="rdpDateRepeat" Runat="server"></telerik:RadDatePicker>
        </td>
    </tr>
    </table>
</asp:Panel>
</ContentTemplate>
</asp:UpdatePanel>