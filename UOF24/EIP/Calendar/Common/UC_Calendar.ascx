<%@ Control Language="C#" AutoEventWireup="true" Inherits="EIP_Calendar_Common_UC_Calendar" Codebehind="UC_Calendar.ascx.cs" %>

<script id="Calendarjs" type="text/javascript">
    function RadCalendar1_OnDateSelecting(sender, args) {
        var dates = args.get_renderDay().get_date();

        var dfi = sender.DateTimeFormatInfo;
        var formattedDate = dfi.FormatDate(dates, dfi.ShortDatePattern);

        if (args.get_isSelecting()) {
            SetDay(formattedDate);
        }
    }
    function DateSelected(sender, eventArgs) {

        //<!--為了解決值不見的問題要用TEXTBOX暫存-->
        $('#<%= TextBox1.ClientID %>').val(eventArgs.get_renderDay().get_date());
    }

</script>

<telerik:RadCalendar ID="RadCalendar1" runat="server" EnableMultiSelect="False" AutoPostBack="true" Width="250px" OnSelectionChanged="RadCalendar1_SelectionChanged">

<FastNavigationStyle CssClass="RadCalendarMonthView RadCalendarMonthView_Default"></FastNavigationStyle>

    <ViewSelectorStyle BackColor="Yellow" ForeColor="Black" BorderColor="#BB5503" BorderStyle="Solid" BorderWidth="2px" />
    <OtherMonthDayStyle ForeColor="#ACA899" />
    <CalendarTableStyle BackColor="White" BorderColor="#7F9DB9" BorderStyle="Solid"
        Font-Names="Tahoma,Verdana" Font-Size="8pt" Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False" Width="100%" />

<OutOfRangeDayStyle CssClass="rcOutOfRange"></OutOfRangeDayStyle>

<DisabledDayStyle CssClass="rcDisabled"></DisabledDayStyle>

    <SelectedDayStyle ForeColor="Black" BorderColor="#BB5503" BorderStyle="Solid" BorderWidth="2px" />
    <WeekendDayStyle BackColor="PapayaWhip" />

<DayOverStyle CssClass="rcHover"></DayOverStyle>

    <TitleStyle BackColor="#9EBEF5" />
    <ClientEvents OnDateClick="DateSelected" OnDateSelecting="RadCalendar1_OnDateSelecting" />
</telerik:RadCalendar>
<asp:TextBox ID="TextBox1" runat="server" Style="display: none"></asp:TextBox>


