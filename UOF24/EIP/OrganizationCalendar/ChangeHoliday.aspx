<%@ Page Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="EIP_OrganizationCalendar_ChangeHoliday" Title="修改假日" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" CodeBehind="ChangeHoliday.aspx.cs" %>

<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <script type="text/javascript">
        function Calculate(sender, e) {
            var WT = $find("<%= txtWT.ClientID %>").get_timeView().getTime().format("HH:mm");
        var LTB = $find("<%= txtLTB.ClientID %>").get_timeView().getTime().format("HH:mm");
        var LTE = $find("<%= txtLTE.ClientID %>").get_timeView().getTime().format("HH:mm");
        var OT = $find("<%= txtOT.ClientID %>").get_timeView().getTime().format("HH:mm");

        var _WorkHour = $telerik.findControl(document.forms[0], "<%= txtWorkHour.ClientID %>");
        var data = ["", WT, LTB, LTE, OT];
        var WorkHour = $uof.pageMethod.sync("CalculateWorkHour", data);
        _WorkHour.set_value(WorkHour);
    }
    function OnValueChanging(sender, args) {
        if (args.get_newValue() == "" || args.get_newValue() == null) {
            args.set_newValue(0);
        }
    }
    function OnValueChanging(sender, args) {

        if (args.get_newValue() == "") {
            args.set_newValue("00:00");
        }
    }
    </script>
    <asp:CustomValidator ID="CustomValidator3" runat="server" Display="Dynamic" ErrorMessage="沒有權限設定" ForeColor="Red" meta:resourcekey="CustomValidator3Resource1"></asp:CustomValidator>
    <table class="PopTable" cellspacing="1" width="100%">
        <tr>
            <td>
                <font color="red">*</font>
                <asp:Label ID="Label1" runat="server" Text="主旨" meta:resourcekey="Label1Resource1"></asp:Label></td>
            <td>
                <asp:Label ID="lblSubject" runat="server" meta:resourcekey="lblSubjectResource1"></asp:Label>
                <asp:TextBox ID="txtSubject" runat="server" meta:resourcekey="txtSubjectResource1" MaxLength="50" Width="100%"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtSubject" ForeColor="Red"
                    Display="Dynamic" ErrorMessage="請填主旨" meta:resourcekey="RequiredFieldValidator1Resource1"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label2" runat="server" Text="說明" meta:resourcekey="Label2Resource1"></asp:Label></td>
            <td>
                <asp:TextBox ID="txtDescription" runat="server" Height="68px" TextMode="MultiLine"
                    Width="100%" meta:resourcekey="txtDescriptionResource1"></asp:TextBox></td>
        </tr>
        <tr runat="server" id="tr_DisplayTimeZone">
            <td>
                <asp:Label ID="Label14" runat="server" Text="時區" meta:resourcekey="Label14Resource1"></asp:Label>
            </td>
            <td>
                <asp:DropDownList ID="ddlDisplayTimeZone" runat="server" meta:resourcekey="ddlDisplayTimeZoneResource1"></asp:DropDownList>
                <asp:Label ID="lblDisplayTimeZone" runat="server" Visible="False" meta:resourcekey="lblDisplayTimeZoneResource1"></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="white-space: nowrap;">
                <font color="red">*</font>
                <asp:Label ID="Label3" runat="server" Text="開始時間" meta:resourcekey="Label3Resource1"></asp:Label></td>
            <td style="white-space: nowrap;">
                <table border="0" cellpadding="0" cellspacing="0">
                    <tr>
                        <td>
                            <asp:Label ID="lblStartTime" runat="server" Visible="False" meta:resourcekey="lblStartTimeResource1"></asp:Label>
                            <telerik:RadDatePicker ID="rdpStartDate" runat="server"
                                meta:resourcekey="rdpStartDateResource1" Culture="zh-TW">
                                <Calendar UseRowHeadersAsSelectors="False" UseColumnHeadersAsSelectors="False"></Calendar>

                                <DateInput LabelWidth="64px" Width="">
<EmptyMessageStyle Resize="None"></EmptyMessageStyle>

<ReadOnlyStyle Resize="None"></ReadOnlyStyle>

<FocusedStyle Resize="None"></FocusedStyle>

<DisabledStyle Resize="None"></DisabledStyle>

<InvalidStyle Resize="None"></InvalidStyle>

<HoveredStyle Resize="None"></HoveredStyle>

<EnabledStyle Resize="None"></EnabledStyle>
                                </DateInput>

                                <DatePopupButton ImageUrl="" HoverImageUrl="" CssClass=""></DatePopupButton>
                            </telerik:RadDatePicker>
                        </td>
                        <td style="width: 5px;" align="center"></td>
                        <td>
                            <telerik:RadTimePicker ID="rdpStartTime" runat="server"
                                meta:resourcekey="rdpStartTimeResource1" Culture="zh-TW">
                                <Calendar runat="server" UseRowHeadersAsSelectors="False" UseColumnHeadersAsSelectors="False"></Calendar>

                                <DatePopupButton Visible="False" CssClass="" ImageUrl="" HoverImageUrl=""></DatePopupButton>

                                <TimeView runat="server" CellSpacing="-1" Columns="6" TimeFormat="HH:mm"></TimeView>

                                <TimePopupButton CssClass="" ImageUrl="" HoverImageUrl=""></TimePopupButton>

                                <DateInput runat="server" Width="" DisplayDateFormat="HH:mm" DateFormat="HH:mm" LabelWidth="64px"></DateInput>
                            </telerik:RadTimePicker>
                        </td>
                        <td style="width: 5px;" align="center"></td>
                        <td>
                            <asp:CheckBox ID="CheckBox1" runat="server" Text="全天" AutoPostBack="True" OnCheckedChanged="CheckBox1_CheckedChanged" meta:resourcekey="CheckBox1Resource1" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                <font color="red">*</font>
                <asp:Label ID="Label4" runat="server" Text="結束時間" meta:resourcekey="Label4Resource1"></asp:Label>
            </td>
            <td>
                <asp:Label ID="lblEndTime" runat="server" Visible="False" meta:resourcekey="lblEndTimeResource1"></asp:Label>
                <table border="0" cellpadding="0" cellspacing="0">
                    <tr>
                        <td>
                            <telerik:RadDatePicker ID="rdpEndDate" runat="server"
                                meta:resourcekey="rdpEndDateResource1" Culture="zh-TW">
                                <Calendar UseRowHeadersAsSelectors="False" UseColumnHeadersAsSelectors="False"></Calendar>

                                <DateInput LabelWidth="64px" Width="">
<EmptyMessageStyle Resize="None"></EmptyMessageStyle>

<ReadOnlyStyle Resize="None"></ReadOnlyStyle>

<FocusedStyle Resize="None"></FocusedStyle>

<DisabledStyle Resize="None"></DisabledStyle>

<InvalidStyle Resize="None"></InvalidStyle>

<HoveredStyle Resize="None"></HoveredStyle>

<EnabledStyle Resize="None"></EnabledStyle>
                                </DateInput>

                                <DatePopupButton ImageUrl="" HoverImageUrl="" CssClass=""></DatePopupButton>
                            </telerik:RadDatePicker>
                        </td>
                        <td style="width: 5px;" align="center"></td>
                        <td>
                            <telerik:RadTimePicker ID="rdpEndTime" runat="server"
                                meta:resourcekey="rdpEndTimeResource1" Culture="zh-TW">
                                <Calendar ID="Calendar1" runat="server" UseRowHeadersAsSelectors="False" UseColumnHeadersAsSelectors="False"></Calendar>

                                <DatePopupButton Visible="False" CssClass="" ImageUrl="" HoverImageUrl=""></DatePopupButton>

                                <TimeView ID="TimeView1" runat="server" CellSpacing="-1" Columns="6" TimeFormat="HH:mm"></TimeView>

                                <TimePopupButton CssClass="" ImageUrl="" HoverImageUrl=""></TimePopupButton>

                                <DateInput ID="DateInput1" runat="server" Width="" DisplayDateFormat="HH:mm" DateFormat="HH:mm" LabelWidth="64px"></DateInput>
                            </telerik:RadTimePicker>
                        </td>
                        <td style="width: 5px;" align="center"></td>
                        <td style="width: 100px;" align="center"></td>
                    </tr>
                    <tr>
                        <td colspan="3">
                            <asp:CustomValidator ID="CustomValidator1" runat="server" Display="Dynamic" ErrorMessage="請填入開始結束時間或勾選全天" ForeColor="Red" OnServerValidate="CustomValidator1_ServerValidate" meta:resourcekey="CustomValidator1Resource1"></asp:CustomValidator>
                            <asp:CustomValidator ID="CustomValidator2" runat="server" Display="Dynamic" ErrorMessage="請填入開始時間" ForeColor="Red" OnServerValidate="CustomValidator2_ServerValidate" meta:resourcekey="CustomValidator2Resource1"></asp:CustomValidator>
                            <asp:CustomValidator ID="CustomValidator4" runat="server" Display="Dynamic" ErrorMessage="請填入結束時間" ForeColor="Red" OnServerValidate="CustomValidator4_ServerValidate" meta:resourcekey="CustomValidator4Resource1"></asp:CustomValidator>
                            <asp:CustomValidator ID="CustomValidator5" runat="server" Display="Dynamic" ErrorMessage="開始時間需在結束時間之前" ForeColor="Red" OnServerValidate="CustomValidator5_ServerValidate" meta:resourcekey="CustomValidator5Resource1"></asp:CustomValidator>
                        </td>
                    </tr>

                </table>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label15" runat="server" Text="類型" meta:resourcekey="Label15Resource1"></asp:Label>
            </td>
            <td>
                <asp:DropDownList ID="ddlTimeTableType" runat="server" meta:resourcekey="ddlTimeTableTypeResource1">
                    <asp:ListItem Text="國定假日" Value="OrgHoliday" meta:resourcekey="ListItemResource1"></asp:ListItem>
                    <asp:ListItem Text="休息日" Value="Dayoff" meta:resourcekey="ListItemResource2"></asp:ListItem>
                    <asp:ListItem Text="例假日" Value="Routine" meta:resourcekey="ListItemResource3"></asp:ListItem>
                </asp:DropDownList>
                <asp:Label ID="lblTimeTableType" runat="server" Visible="False" meta:resourcekey="lblTimeTableTypeResource1"></asp:Label>
            </td>
        </tr>
    </table>
    <br />
    <asp:Panel ID="plTimeTable" runat="server"
        meta:resourcekey="plTimeTableResource1">
        <table class="NormalPopTable" cellspacing="1" width="100%">
            <tr>
                <td class="PopTableLeftTD" style="text-align: center; width: 10%">
                    <asp:Label ID="Label5" runat="server" Text="工時" meta:resourcekey="Label5Resource1"></asp:Label>
                </td>
                <td class="PopTableLeftTD" style="text-align: center; width: 10%">
                    <asp:Label ID="Label6" runat="server" Text="彈性最早上班時間" meta:resourcekey="Label6Resource1"></asp:Label>
                </td>
                <td class="PopTableLeftTD" style="text-align: center; width: 10%">
                    <asp:Label ID="Label8" runat="server" Text="上班時間" meta:resourcekey="Label8Resource1"></asp:Label>
                </td>
                <td class="PopTableLeftTD" style="text-align: center; width: 10%">
                    <asp:Label ID="Label7" runat="server" Text="彈性最晚上班時間" meta:resourcekey="Label7Resource1"></asp:Label>
                </td>
                <td class="PopTableLeftTD" style="text-align: center; width: 10%">
                    <asp:Label ID="Label9" runat="server" Text="休息開始時間" meta:resourcekey="Label9Resource1"></asp:Label>
                </td>
                <td class="PopTableLeftTD" style="text-align: center; width: 10%">
                    <asp:Label ID="Label10" runat="server" Text="休息結束時間" meta:resourcekey="Label10Resource1"></asp:Label>
                </td>
                <td class="PopTableLeftTD" style="text-align: center; width: 10%">
                    <asp:Label ID="Label11" runat="server" Text="彈性最早下班時間" meta:resourcekey="Label11Resource1"></asp:Label>
                </td>
                <td class="PopTableLeftTD" style="text-align: center; width: 10%">
                    <asp:Label ID="Label13" runat="server" Text="下班時間" meta:resourcekey="Label13Resource1"></asp:Label>
                </td>
                <td class="PopTableLeftTD" style="text-align: center; width: 10%">
                    <asp:Label ID="Label12" runat="server" Text="彈性最晚下班時間" meta:resourcekey="Label12Resource1"></asp:Label>
                </td>
            </tr>
            <tr>
                <td style="text-align: center; background-color: #FFFFFF;">
                    <telerik:RadNumericTextBox ID="txtWorkHour" runat="server" Height="20px"
                        ReadOnly="True" Value="0"
                        Width="60px" DataType="System.Int32" Culture="zh-TW" DbValueFactor="1"
                        LabelCssClass="" LabelWidth="64px" meta:resourcekey="txtWorkHourResource1">
                        <NegativeStyle Resize="None" />
                        <NumberFormat DecimalDigits="1" ZeroPattern="n" />
                        <ClientEvents OnValueChanging="OnValueChanging" />
                        <EmptyMessageStyle Resize="None" />
                        <ReadOnlyStyle Resize="None" />
                        <FocusedStyle Resize="None" />
                        <DisabledStyle Resize="None" />
                        <InvalidStyle Resize="None" />
                        <HoveredStyle Resize="None" />
                        <EnabledStyle Resize="None" />
                    </telerik:RadNumericTextBox>
                    <asp:CustomValidator ID="cvErrorWorkHour" runat="server" Display="Dynamic"
                        ErrorMessage="工時須為0.5的倍數" ForeColor="Red"
                        OnServerValidate="cvErrorWorkHour_ServerValidate"
                        meta:resourcekey="cvErrorWorkHourResource1"></asp:CustomValidator>
                </td>
                <td style="text-align: center; background-color: #FFFFFF;">
                    <telerik:RadTimePicker ID="txtWTE" runat="server"
                        PopupDirection="TopRight" Width="75px" meta:resourcekey="txtWTEResource1" Culture="zh-TW">
                        <Calendar UseColumnHeadersAsSelectors="False"
                            UseRowHeadersAsSelectors="False" EnableWeekends="True" FastNavigationNextText="&amp;lt;&amp;lt;">
                        </Calendar>
                        <DatePopupButton CssClass="" HoverImageUrl="" ImageUrl="" Visible="False" />
                        <TimeView CellSpacing="-1" Columns="6"
                            TimeFormat="HH:mm" Culture="zh-TW">
                        </TimeView>
                        <TimePopupButton CssClass="" HoverImageUrl="" ImageUrl="" />
                        <DateInput
                            DateFormat="HH:mm" DisplayDateFormat="HH:mm" LabelWidth="64px" Width="">
                            <ClientEvents OnValueChanging="OnValueChanging" />
                            <EmptyMessageStyle Resize="None" />
                            <ReadOnlyStyle Resize="None" />
                            <FocusedStyle Resize="None" />
                            <DisabledStyle Resize="None" />
                            <InvalidStyle Resize="None" />
                            <HoveredStyle Resize="None" />
                            <EnabledStyle Resize="None" />
                        </DateInput>
                    </telerik:RadTimePicker>
                </td>
                <td style="text-align: center; background-color: #FFFFFF;">
                    <telerik:RadTimePicker ID="txtWT" runat="server"
                        PopupDirection="TopRight" Width="75px" meta:resourcekey="txtWTResource1" Culture="zh-TW">
                        <Calendar UseColumnHeadersAsSelectors="False"
                            UseRowHeadersAsSelectors="False" EnableWeekends="True" FastNavigationNextText="&amp;lt;&amp;lt;">
                        </Calendar>
                        <DatePopupButton CssClass="" HoverImageUrl="" ImageUrl="" Visible="False" />
                        <TimeView CellSpacing="-1" Columns="6"
                            TimeFormat="HH:mm" Culture="zh-TW">
                        </TimeView>
                        <TimePopupButton CssClass="" HoverImageUrl="" ImageUrl="" />
                        <DateInput
                            DateFormat="HH:mm" DisplayDateFormat="HH:mm" LabelWidth="64px" Width="">
                            <ClientEvents OnValueChanging="OnValueChanging" />
                            <EmptyMessageStyle Resize="None" />
                            <ReadOnlyStyle Resize="None" />
                            <FocusedStyle Resize="None" />
                            <DisabledStyle Resize="None" />
                            <InvalidStyle Resize="None" />
                            <HoveredStyle Resize="None" />
                            <EnabledStyle Resize="None" />
                        </DateInput>
                    </telerik:RadTimePicker>
                </td>
                <td style="text-align: center; background-color: #FFFFFF;">
                    <telerik:RadTimePicker ID="txtWTL" runat="server"
                        PopupDirection="TopRight" Width="75px" meta:resourcekey="txtWTLResource1" Culture="zh-TW">
                        <Calendar UseColumnHeadersAsSelectors="False"
                            UseRowHeadersAsSelectors="False" EnableWeekends="True" FastNavigationNextText="&amp;lt;&amp;lt;">
                        </Calendar>
                        <DatePopupButton CssClass="" HoverImageUrl="" ImageUrl="" Visible="False" />
                        <TimeView CellSpacing="-1" Columns="6"
                            TimeFormat="HH:mm" Culture="zh-TW">
                        </TimeView>
                        <TimePopupButton CssClass="" HoverImageUrl="" ImageUrl="" />
                        <DateInput
                            DateFormat="HH:mm" DisplayDateFormat="HH:mm" LabelWidth="64px" Width="">
                            <ClientEvents OnValueChanging="OnValueChanging" />
                            <EmptyMessageStyle Resize="None" />
                            <ReadOnlyStyle Resize="None" />
                            <FocusedStyle Resize="None" />
                            <DisabledStyle Resize="None" />
                            <InvalidStyle Resize="None" />
                            <HoveredStyle Resize="None" />
                            <EnabledStyle Resize="None" />
                        </DateInput>
                    </telerik:RadTimePicker>
                </td>
                <td style="text-align: center; background-color: #FFFFFF;">
                    <telerik:RadTimePicker ID="txtLTB" runat="server"
                        PopupDirection="TopRight" Width="75px" meta:resourcekey="txtLTBResource1" Culture="zh-TW">
                        <Calendar UseColumnHeadersAsSelectors="False"
                            UseRowHeadersAsSelectors="False" EnableWeekends="True" FastNavigationNextText="&amp;lt;&amp;lt;">
                        </Calendar>
                        <DatePopupButton CssClass="" HoverImageUrl="" ImageUrl="" Visible="False" />
                        <TimeView CellSpacing="-1" Columns="6"
                            TimeFormat="HH:mm" Culture="zh-TW">
                        </TimeView>
                        <TimePopupButton CssClass="" HoverImageUrl="" ImageUrl="" />
                        <DateInput
                            DateFormat="HH:mm" DisplayDateFormat="HH:mm" LabelWidth="64px" Width="">
                            <ClientEvents OnValueChanging="OnValueChanging" />
                            <EmptyMessageStyle Resize="None" />
                            <ReadOnlyStyle Resize="None" />
                            <FocusedStyle Resize="None" />
                            <DisabledStyle Resize="None" />
                            <InvalidStyle Resize="None" />
                            <HoveredStyle Resize="None" />
                            <EnabledStyle Resize="None" />
                        </DateInput>
                    </telerik:RadTimePicker>
                </td>
                <td style="text-align: center; background-color: #FFFFFF;">
                    <telerik:RadTimePicker ID="txtLTE" runat="server"
                        PopupDirection="TopRight" Width="75px" meta:resourcekey="txtLTEResource1" Culture="zh-TW">
                        <Calendar UseColumnHeadersAsSelectors="False"
                            UseRowHeadersAsSelectors="False" EnableWeekends="True" FastNavigationNextText="&amp;lt;&amp;lt;">
                        </Calendar>
                        <DatePopupButton CssClass="" HoverImageUrl="" ImageUrl="" Visible="False" />
                        <TimeView CellSpacing="-1" Columns="6"
                            TimeFormat="HH:mm" Culture="zh-TW">
                        </TimeView>
                        <TimePopupButton CssClass="" HoverImageUrl="" ImageUrl="" />
                        <DateInput
                            DateFormat="HH:mm" DisplayDateFormat="HH:mm" LabelWidth="64px" Width="">
                            <ClientEvents OnValueChanging="OnValueChanging" />
                            <EmptyMessageStyle Resize="None" />
                            <ReadOnlyStyle Resize="None" />
                            <FocusedStyle Resize="None" />
                            <DisabledStyle Resize="None" />
                            <InvalidStyle Resize="None" />
                            <HoveredStyle Resize="None" />
                            <EnabledStyle Resize="None" />
                        </DateInput>
                    </telerik:RadTimePicker>
                </td>
                <td style="text-align: center; background-color: #FFFFFF;">
                    <telerik:RadTimePicker ID="txtOTE" runat="server"
                        PopupDirection="TopRight" Width="75px" meta:resourcekey="txtOTEResource1" Culture="zh-TW">
                        <Calendar UseColumnHeadersAsSelectors="False"
                            UseRowHeadersAsSelectors="False" EnableWeekends="True" FastNavigationNextText="&amp;lt;&amp;lt;">
                        </Calendar>
                        <DatePopupButton CssClass="" HoverImageUrl="" ImageUrl="" Visible="False" />
                        <TimeView CellSpacing="-1" Columns="6"
                            TimeFormat="HH:mm" Culture="zh-TW">
                        </TimeView>
                        <TimePopupButton CssClass="" HoverImageUrl="" ImageUrl="" />
                        <DateInput
                            DateFormat="HH:mm" DisplayDateFormat="HH:mm" LabelWidth="64px" Width="">
                            <ClientEvents OnValueChanging="OnValueChanging" />
                            <EmptyMessageStyle Resize="None" />
                            <ReadOnlyStyle Resize="None" />
                            <FocusedStyle Resize="None" />
                            <DisabledStyle Resize="None" />
                            <InvalidStyle Resize="None" />
                            <HoveredStyle Resize="None" />
                            <EnabledStyle Resize="None" />
                        </DateInput>
                    </telerik:RadTimePicker>
                </td>
                <td style="text-align: center; background-color: #FFFFFF;">
                    <telerik:RadTimePicker ID="txtOT" runat="server"
                        PopupDirection="TopRight" Width="75px" meta:resourcekey="txtOTResource1" Culture="zh-TW">
                        <Calendar UseColumnHeadersAsSelectors="False"
                            UseRowHeadersAsSelectors="False" EnableWeekends="True" FastNavigationNextText="&amp;lt;&amp;lt;">
                        </Calendar>
                        <DatePopupButton CssClass="" HoverImageUrl="" ImageUrl="" Visible="False" />
                        <TimeView CellSpacing="-1" Columns="6"
                            TimeFormat="HH:mm" Culture="zh-TW">
                        </TimeView>
                        <TimePopupButton CssClass="" HoverImageUrl="" ImageUrl="" />
                        <DateInput
                            DateFormat="HH:mm" DisplayDateFormat="HH:mm" LabelWidth="64px" Width="">
                            <ClientEvents OnValueChanging="OnValueChanging" />
                            <EmptyMessageStyle Resize="None" />
                            <ReadOnlyStyle Resize="None" />
                            <FocusedStyle Resize="None" />
                            <DisabledStyle Resize="None" />
                            <InvalidStyle Resize="None" />
                            <HoveredStyle Resize="None" />
                            <EnabledStyle Resize="None" />
                        </DateInput>
                    </telerik:RadTimePicker>
                </td>
                <td style="text-align: center; background-color: #FFFFFF;">
                    <telerik:RadTimePicker ID="txtOTL" runat="server"
                        PopupDirection="TopRight" Width="75px" meta:resourcekey="txtOTLResource1" Culture="zh-TW">
                        <Calendar UseColumnHeadersAsSelectors="False"
                            UseRowHeadersAsSelectors="False" EnableWeekends="True" FastNavigationNextText="&amp;lt;&amp;lt;">
                        </Calendar>
                        <DatePopupButton CssClass="" HoverImageUrl="" ImageUrl="" Visible="False" />
                        <TimeView CellSpacing="-1" Columns="6"
                            TimeFormat="HH:mm" Culture="zh-TW">
                        </TimeView>
                        <TimePopupButton CssClass="" HoverImageUrl="" ImageUrl="" />
                        <DateInput
                            DateFormat="HH:mm" DisplayDateFormat="HH:mm" LabelWidth="64px" Width="">
                            <ClientEvents OnValueChanging="OnValueChanging" />
                            <EmptyMessageStyle Resize="None" />
                            <ReadOnlyStyle Resize="None" />
                            <FocusedStyle Resize="None" />
                            <DisabledStyle Resize="None" />
                            <InvalidStyle Resize="None" />
                            <HoveredStyle Resize="None" />
                            <EnabledStyle Resize="None" />
                        </DateInput>
                    </telerik:RadTimePicker>
                </td>
            </tr>
        </table>
    </asp:Panel>
    <asp:CustomValidator ID="cvErrorSchedule" runat="server" Display="Dynamic" ErrorMessage="資料有誤，請檢查時間，後面時間需晚於等於前面時間" ForeColor="Red" OnServerValidate="cvErrorSchedule_ServerValidate" meta:resourcekey="cvErrorScheduleResource1"></asp:CustomValidator>
    <asp:HiddenField ID="hfCurrentUser" runat="server" />
    <asp:Label ID="lblSelect" runat="server" Text="請選擇" Visible="False" meta:resourcekey="lblSelectResource1"></asp:Label>
</asp:Content>

