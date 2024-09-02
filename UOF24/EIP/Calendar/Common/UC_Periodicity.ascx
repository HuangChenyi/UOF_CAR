<%@ Control Language="C#" AutoEventWireup="true"
    Inherits="Ede.Uof.Calendar.Common.UC_Periodicity" Codebehind="UC_Periodicity.ascx.cs" %>


<style type="text/css">
    .style1
    {
        height: 143px;
    }
</style>
<script type="text/javascript">
    function checkedChanged() {
        var rbForever = $("#<%=rbForever.ClientID %>");
        var wdpEnd = $find("<%=wdpEnd.ClientID %>");
        if (wdpEnd != null) {
            if (rbForever.is(":checked")) {
                wdpEnd.set_enabled(false);
            } else {
                wdpEnd.set_enabled(true);
            }
        }
    }
    Sys.Application.add_load(checkedChanged);
</script>
<asp:DropDownList ID="ddlRepeatType" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlRepeatType_SelectedIndexChanged" meta:resourcekey="ddlRepeatTypeResource1">
    <asp:ListItem Value="0" meta:resourcekey="ListItemResource1" Text="不重覆"></asp:ListItem>
    <asp:ListItem Value="1" meta:resourcekey="ListItemResource2" Text="每日"></asp:ListItem>
    <asp:ListItem Value="2" meta:resourcekey="ListItemResource3" Text="每週"></asp:ListItem>
    <asp:ListItem Value="3" meta:resourcekey="ListItemResource4" Text="每月"></asp:ListItem>
    <asp:ListItem Value="4" meta:resourcekey="ListItemResource5" Text="每年"></asp:ListItem>
</asp:DropDownList>
<asp:Panel Width="100%" ID="Panel0" runat="server" meta:resourcekey="Panel0Resource1">
    <table width="100%" class="PopTable" runat="server">
        <tr runat="server" id="repeatTR">
            <td style="vertical-align: middle;">
                <asp:Label ID="lbRepeatSet" runat="server" Text="重覆設定" meta:resourcekey="lbRepeatSetResource1"></asp:Label>
            </td>
            <td>
                <asp:Panel ID="Panel1" runat="server" Height="80px" Width="100%" meta:resourcekey="Panel1Resource1">
                    <asp:Label ID="Label8" runat="server" Text="每隔" meta:resourcekey="Label8Resource1"></asp:Label>
                    <asp:DropDownList ID="ddlWeekInterval" runat="server" meta:resourcekey="ddlWeekIntervalResource1">
                        <asp:ListItem Value="0" meta:resourcekey="ListItemResource6" Text="一週"></asp:ListItem>
                        <asp:ListItem Value="1" meta:resourcekey="ListItemResource7" Text="二週"></asp:ListItem>
                        <asp:ListItem Value="2" meta:resourcekey="ListItemResource8" Text="三週"></asp:ListItem>
                        <asp:ListItem Value="3" meta:resourcekey="ListItemResource9" Text="四週"></asp:ListItem>
                    </asp:DropDownList><asp:Label ID="Label9" runat="server" Text="的" meta:resourcekey="Label9Resource1"></asp:Label><br />
                    <asp:CheckBox ID="cbSunday" runat="server" Text="星期日" meta:resourcekey="cbSundayResource1" />
                    <asp:CheckBox ID="cbMonday" runat="server" Text="星期一" meta:resourcekey="cbMondayResource1" />
                    <asp:CheckBox ID="cbTuesday" runat="server" Text="星期二" meta:resourcekey="cbTuesdayResource1" />
                    <asp:CheckBox ID="cbWednesday" runat="server" Text="星期三" meta:resourcekey="cbWednesdayResource1" /><asp:CheckBox ID="cbThursday" runat="server" Text="星期四" meta:resourcekey="cbThursdayResource1" />
                    <asp:CheckBox ID="cbFriday" runat="server" Text="星期五" meta:resourcekey="cbFridayResource1" />
                    <asp:CheckBox ID="cbSaturday" runat="server" Text="星期六" meta:resourcekey="cbSaturdayResource1" />
                    <asp:CustomValidator ID="CustomValidator2" runat="server" Display="Dynamic" ErrorMessage="請挑選星期"
                        meta:resourcekey="CustomValidator2Resource1" OnServerValidate="CustomValidator2_ServerValidate"></asp:CustomValidator>
                </asp:Panel>
                <asp:Panel ID="Panel2" runat="server" Height="50px" Width="100%" meta:resourcekey="Panel2Resource1">
                    <asp:RadioButton ID="rbEveryMonth" runat="server" GroupName="MonthRepeat" Text="每月的" meta:resourcekey="rbEveryMonthResource1" />
                    <asp:DropDownList ID="ddlOrder" runat="server" meta:resourcekey="ddlOrderResource1">
                        <asp:ListItem Value="0" meta:resourcekey="ListItemResource10" Text="第一個"></asp:ListItem>
                        <asp:ListItem Value="1" meta:resourcekey="ListItemResource11" Text="第二個"></asp:ListItem>
                        <asp:ListItem Value="2" meta:resourcekey="ListItemResource12" Text="第三個"></asp:ListItem>
                        <asp:ListItem Value="3" meta:resourcekey="ListItemResource13" Text="第四個"></asp:ListItem>
                        <asp:ListItem Value="4" meta:resourcekey="ListItemResource14" Text="最後一個"></asp:ListItem>
                    </asp:DropDownList>
                    <asp:DropDownList ID="ddlWeekList" runat="server" meta:resourcekey="ddlWeekListResource1">
                        <asp:ListItem Value="0" meta:resourcekey="ListItemResource15" Text="星期日"></asp:ListItem>
                        <asp:ListItem Value="1" meta:resourcekey="ListItemResource16" Text="星期一"></asp:ListItem>
                        <asp:ListItem Value="2" meta:resourcekey="ListItemResource17" Text="星期二"></asp:ListItem>
                        <asp:ListItem Value="3" meta:resourcekey="ListItemResource18" Text="星期三"></asp:ListItem>
                        <asp:ListItem Value="4" meta:resourcekey="ListItemResource19" Text="星期四"></asp:ListItem>
                        <asp:ListItem Value="5" meta:resourcekey="ListItemResource20" Text="星期五"></asp:ListItem>
                        <asp:ListItem Value="6" meta:resourcekey="ListItemResource21" Text="星期六"></asp:ListItem>
                    </asp:DropDownList><br />
                    <asp:RadioButton ID="rbThisDay" runat="server" GroupName="MonthRepeat" Text="在事件發生的這一天" meta:resourcekey="rbThisDayResource1" />
                </asp:Panel>
                <asp:Label ID="lbShowByYear" runat="server" Text="在事件發生的這一天重覆" meta:resourcekey="lbShowByYearResource1"></asp:Label></td>
        </tr>
        <tr>
            <td style="white-space: nowrap; vertical-align: middle;">
                <asp:Label ID="Label1" runat="server" Text="結束日期設定" meta:resourcekey="Label1Resource1"></asp:Label>
            </td>
            <td>
                <table>
                    <tr>
                        <td colspan="2" >
                            <asp:RadioButton ID="rbForever" runat="server" GroupName="repeat" Text="不結束" onclick="checkedChanged();" meta:resourcekey="rbForeverResource1"/></td>
                    </tr>
                    <tr>
                        <td>
                            <asp:RadioButton ID="rbToEnd" runat="server" GroupName="repeat" Text="重覆至" onclick="checkedChanged();" meta:resourcekey="rbToEndResource1"/></td>
                        <td style="width: 134px">
                            <telerik:RadDatePicker ID="wdpEnd" runat="server"></telerik:RadDatePicker>
                            <asp:CustomValidator ID="CustomValidator1" runat="server" Display="Dynamic" ErrorMessage="請輸入結束日期" meta:resourcekey="CustomValidator1Resource1"></asp:CustomValidator></td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</asp:Panel>
