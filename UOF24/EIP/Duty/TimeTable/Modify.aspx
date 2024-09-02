<%@ Page Title="修改班表" Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="EIP_Duty_TimeTable_Modify" meta:resourcekey="PageResource1" Codebehind="Modify.aspx.cs" culture="auto" uiculture="auto" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <script type="text/javascript">

        function OnValueChanging(sender, args) {
            if (args.get_newValue() == "") {
                args.set_newValue(args.get_oldValue());
            }
        }

        function CalculateWhenTimeChanged() {
            if (wt && ltb && lte && ot) {
                var timeWT = wt.get_selectedDate().format('HH:mm');
                var timeLTB = ltb.get_selectedDate().format('HH:mm');
                var timeLTE = lte.get_selectedDate().format('HH:mm');
                var timeOT = ot.get_selectedDate().format('HH:mm');
                var data = ["", timeWT, timeLTB, timeLTE, timeOT];

                var WorkHour = $uof.pageMethod.sync("CalculateWorkHour", data);
                $find("<%=this.rdWorkHour.ClientID%>").set_value(WorkHour);
            }
        }

        var wt, ltb, lte, ot;
        function pageLoad(sender, args) {
            wt = $find("<%=this.rdWT.ClientID %>");
            ltb = $find("<%=this.rdLTB.ClientID %>");
            lte = $find("<%=this.rdLTE.ClientID %>");
            ot = $find("<%=this.rdOT.ClientID %>");
        }

    </script>

    <style type="text/css">
        .RightAligned {
            text-align: right;
        }
    </style>

    <table class="PopTable" cellspacing="1" style="width: 100%">
        <tr>
            <td nowrap="nowrap">
                <asp:Label ID="Label3" runat="server" Text="人員" meta:resourcekey="Label3Resource1"></asp:Label>
            </td>
            <td>
                <asp:Label ID="lbUser" runat="server" meta:resourcekey="lbUserResource1"></asp:Label>
            </td>
            <td nowrap="nowrap">
                <asp:Label ID="Label14" runat="server" Text="日期" meta:resourcekey="Label14Resource1"></asp:Label>
            </td>
            <td>
                <asp:Label ID="lbDate" runat="server" meta:resourcekey="lbDateResource1"></asp:Label>
                <asp:Label ID="lbWeek" runat="server" meta:resourcekey="lbWeekResource1"></asp:Label>
            </td>
        </tr>
    </table>
    <asp:CustomValidator ID="cvErrorSchedule" runat="server" Display="Dynamic" ErrorMessage="資料有誤，請檢查班表時間，後面時間需晚於等於前面時間" OnServerValidate="cvErrorSchedule_ServerValidate" ForeColor="Red" meta:resourcekey="cvErrorScheduleResource1"></asp:CustomValidator>
    <asp:CustomValidator ID="cvErrorHolidayType" runat="server" Display="Dynamic" ErrorMessage="類型選擇為工作日，則工時需大於0。" onservervalidate="cvErrorHolidayType_ServerValidate" meta:resourcekey="cvErrorHolidayTypeResource1"></asp:CustomValidator>
    <table class="NormalPopTable" cellspacing="1" width="100%">
        <tr class="PopTableLeftTD" style="text-align: center;">
            <td>
                <asp:Label ID="Label5" runat="server" Text="工時"
                    meta:resourcekey="Label5Resource1"></asp:Label>
            </td>
            <td class="PopTableLeftTD" style="text-align: center; width: 10%">
                <asp:Label ID="Label6" runat="server" Text="彈性最早上班時間"
                    meta:resourcekey="Label6Resource1"></asp:Label>
            </td>
            <td class="PopTableLeftTD" style="text-align: center; width: 10%">
                <asp:Label ID="Label8" runat="server" Text="上班時間"
                    meta:resourcekey="Label8Resource1"></asp:Label>
            </td>
            <td class="PopTableLeftTD" style="text-align: center; width: 10%">
                <asp:Label ID="Label7" runat="server" Text="彈性最晚上班時間"
                    meta:resourcekey="Label7Resource1"></asp:Label>
            </td>
            <td class="PopTableLeftTD" style="text-align: center; width: 10%">
                <asp:Label ID="Label9" runat="server" Text="休息開始時間"
                    meta:resourcekey="Label9Resource1"></asp:Label>
            </td>
            <td class="PopTableLeftTD" style="text-align: center; width: 10%">
                <asp:Label ID="Label10" runat="server" Text="休息結束時間"
                    meta:resourcekey="Label10Resource1"></asp:Label>
            </td>
            <td class="PopTableLeftTD" style="text-align: center; width: 10%">
                <asp:Label ID="Label11" runat="server" Text="彈性最早下班時間"
                    meta:resourcekey="Label11Resource1"></asp:Label>
            </td>
            <td class="PopTableLeftTD" style="text-align: center; width: 10%">
                <asp:Label ID="Label13" runat="server" Text="下班時間"
                    meta:resourcekey="Label13Resource1"></asp:Label>
            </td>
            <td class="PopTableLeftTD" style="text-align: center; width: 10%">
                <asp:Label ID="Label12" runat="server" Text="彈性最晚下班時間"
                    meta:resourcekey="Label12Resource1"></asp:Label>
            </td>
            <td class="PopTableLeftTD" style="text-align: center; width: 10%">
                <asp:Label ID="Label1" runat="server" Text="類型" meta:resourcekey="Label1Resource1"></asp:Label>
            </td>
            <td class="PopTableLeftTD" style="text-align: center; white-space: nowrap; width: 10%">
                <asp:Label ID="lblRemark" runat="server" Text="備註"
                    meta:resourcekey="lblRemarkResource1"></asp:Label>
            </td>
        </tr>
        <tr style="text-align: center;">
            <td style="vertical-align:middle">
                <table cellpadding="0" cellspacing="0">
                    <tr>
                        <td>
                            <telerik:RadNumericTextBox ID="rdWorkHour" runat="server" MaxLength="4" MaxValue="99" MinValue="0" Width="60px" ReadOnly="True" Value="0" Culture="zh-TW" DbValueFactor="1" LabelWidth="24px" meta:resourcekey="rdWorkHourResource1">
                                <NumberFormat ZeroPattern="n" DecimalDigits="1"></NumberFormat>
                            </telerik:RadNumericTextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:CustomValidator ID="cvErrorWorkHour" runat="server" Display="Dynamic" ErrorMessage="工時須為0.5的倍數" ForeColor="Red"
                                OnServerValidate="cvErrorWorkHour_ServerValidate" meta:resourcekey="cvErrorWorkHourResource1"></asp:CustomValidator>
                        </td>
                    </tr>
                </table>
            </td>
            <td style="vertical-align:middle">
                <telerik:RadTimePicker ID="rdWTE" runat="server" Width="80px" meta:resourcekey="rdWTEResource1" >
                    <Calendar UseColumnHeadersAsSelectors="False" UseRowHeadersAsSelectors="False">
                    </Calendar>
                    <DatePopupButton CssClass="" HoverImageUrl="" ImageUrl="" Visible="False" />
                    <TimeView CellSpacing="-1">
                    </TimeView>
                    <TimePopupButton CssClass="" HoverImageUrl="" ImageUrl="" />
                    <DateInput DateFormat="HH:mm" DisplayDateFormat="HH:mm" LabelWidth="64px" Width="" ClientEvents-OnValueChanging="OnValueChanging">
                    </DateInput>
                </telerik:RadTimePicker>
            </td>
            <td style="vertical-align:middle">
                <telerik:RadTimePicker ID="rdWT" runat="server" Width="80px" meta:resourcekey="rdWTResource1" >
                    <Calendar UseColumnHeadersAsSelectors="False" UseRowHeadersAsSelectors="False">
                    </Calendar>
                    <DatePopupButton CssClass="" HoverImageUrl="" ImageUrl="" Visible="False" />
                    <TimeView CellSpacing="-1">
                    </TimeView>
                    <TimePopupButton CssClass="" HoverImageUrl="" ImageUrl="" />
                    <DateInput DateFormat="HH:mm" DisplayDateFormat="HH:mm" LabelWidth="64px" Width="" ClientEvents-OnValueChanging="OnValueChanging">
                    </DateInput>
                    <ClientEvents OnDateSelected="CalculateWhenTimeChanged" />
                </telerik:RadTimePicker>
            </td>
            <td style="vertical-align:middle">
                <telerik:RadTimePicker ID="rdWTL" runat="server" Width="80px" meta:resourcekey="rdWTLResource1" >
                    <Calendar UseColumnHeadersAsSelectors="False" UseRowHeadersAsSelectors="False">
                    </Calendar>
                    <DatePopupButton CssClass="" HoverImageUrl="" ImageUrl="" Visible="False" />
                    <TimeView CellSpacing="-1">
                    </TimeView>
                    <TimePopupButton CssClass="" HoverImageUrl="" ImageUrl="" />
                    <DateInput DateFormat="HH:mm" DisplayDateFormat="HH:mm" LabelWidth="64px" Width="" ClientEvents-OnValueChanging="OnValueChanging">
                    </DateInput>
                </telerik:RadTimePicker>
            </td>
            <td style="vertical-align:middle">
                <telerik:RadTimePicker ID="rdLTB" runat="server" Width="80px" meta:resourcekey="rdLTBResource1" >
                    <Calendar UseColumnHeadersAsSelectors="False" UseRowHeadersAsSelectors="False">
                    </Calendar>
                    <DatePopupButton CssClass="" HoverImageUrl="" ImageUrl="" Visible="False" />
                    <TimeView CellSpacing="-1">
                    </TimeView>
                    <TimePopupButton CssClass="" HoverImageUrl="" ImageUrl="" />
                    <DateInput DateFormat="HH:mm" DisplayDateFormat="HH:mm" LabelWidth="64px" Width="" ClientEvents-OnValueChanging="OnValueChanging">
                    </DateInput>
                    <ClientEvents OnDateSelected="CalculateWhenTimeChanged" />
                </telerik:RadTimePicker>
            </td>
            <td style="vertical-align:middle">
                <telerik:RadTimePicker ID="rdLTE" runat="server" Width="80px" meta:resourcekey="rdLTEResource1" >
                    <Calendar UseColumnHeadersAsSelectors="False" UseRowHeadersAsSelectors="False">
                    </Calendar>
                    <DatePopupButton CssClass="" HoverImageUrl="" ImageUrl="" Visible="False" />
                    <TimeView CellSpacing="-1">
                    </TimeView>
                    <TimePopupButton CssClass="" HoverImageUrl="" ImageUrl="" />
                    <DateInput DateFormat="HH:mm" DisplayDateFormat="HH:mm" LabelWidth="64px" Width="" ClientEvents-OnValueChanging="OnValueChanging">
                    </DateInput>
                    <ClientEvents OnDateSelected="CalculateWhenTimeChanged" />
                </telerik:RadTimePicker>
            </td>
            <td style="vertical-align:middle">
                <telerik:RadTimePicker ID="rdOTE" runat="server" Width="80px" meta:resourcekey="rdOTEResource1" >
                    <Calendar UseColumnHeadersAsSelectors="False" UseRowHeadersAsSelectors="False">
                    </Calendar>
                    <DatePopupButton CssClass="" HoverImageUrl="" ImageUrl="" Visible="False" />
                    <TimeView CellSpacing="-1">
                    </TimeView>
                    <TimePopupButton CssClass="" HoverImageUrl="" ImageUrl="" />
                    <DateInput DateFormat="HH:mm" DisplayDateFormat="HH:mm" LabelWidth="64px" Width="" ClientEvents-OnValueChanging="OnValueChanging">
                    </DateInput>
                </telerik:RadTimePicker>
            </td>
            <td style="vertical-align:middle">
                <telerik:RadTimePicker ID="rdOT" runat="server" Width="80px" meta:resourcekey="rdOTResource1" >
                    <Calendar UseColumnHeadersAsSelectors="False" UseRowHeadersAsSelectors="False">
                    </Calendar>
                    <DatePopupButton CssClass="" HoverImageUrl="" ImageUrl="" Visible="False" />
                    <TimeView CellSpacing="-1">
                    </TimeView>
                    <TimePopupButton CssClass="" HoverImageUrl="" ImageUrl="" />
                    <DateInput DateFormat="HH:mm" DisplayDateFormat="HH:mm" LabelWidth="64px" Width="" ClientEvents-OnValueChanging="OnValueChanging">
                    </DateInput>
                    <ClientEvents OnDateSelected="CalculateWhenTimeChanged" />
                </telerik:RadTimePicker>
            </td>
            <td style="vertical-align:middle">
                <telerik:RadTimePicker ID="rdOTL" runat="server" Width="80px" meta:resourcekey="rdOTLResource1" >
                    <Calendar UseColumnHeadersAsSelectors="False" UseRowHeadersAsSelectors="False">
                    </Calendar>
                    <DatePopupButton CssClass="" HoverImageUrl="" ImageUrl="" Visible="False" />
                    <TimeView CellSpacing="-1">
                    </TimeView>
                    <TimePopupButton CssClass="" HoverImageUrl="" ImageUrl="" />
                    <DateInput DateFormat="HH:mm" DisplayDateFormat="HH:mm" LabelWidth="64px" Width="" ClientEvents-OnValueChanging="OnValueChanging">
                    </DateInput>
                </telerik:RadTimePicker>
            </td>
            <td  style="vertical-align:middle">
                <asp:DropDownList ID="ddlTimeTableType" runat="server" meta:resourcekey="ddlTimeTableTypeResource1">
                    <asp:ListItem Text="工作日" Value="Workday" meta:resourcekey="ListItemResource1"></asp:ListItem>
                    <asp:ListItem Text="休息日" Value="Dayoff" meta:resourcekey="ListItemResource2"></asp:ListItem>
                    <asp:ListItem Text="例假日" Value="Routine" meta:resourcekey="ListItemResource3"></asp:ListItem>
                    <asp:ListItem Text="國定假日" Value="OrgHoliday" meta:resourcekey="ListItemResource4" ></asp:ListItem>
                </asp:DropDownList>
            </td>
            <td style="vertical-align:middle">
                <asp:TextBox ID="txtRemark" runat="server" Rows="2" TextMode="MultiLine" MaxLength="255" meta:resourcekey="txtRemarkResource1"></asp:TextBox>
            </td>
        </tr>
    </table>
    <asp:Label ID="lblModifyDateTitle" runat="server" Text="修改時間:" meta:resourcekey="lblModifyDateTitleResource1"></asp:Label>
    <asp:Label ID="lblModifyDate" runat="server" meta:resourcekey="lblModifyDateResource1"></asp:Label>
    <BR />
    <asp:Label ID="lblModifierTitle" runat="server" Text="修改者:" meta:resourcekey="lblModifierTitleResource1"></asp:Label>
    <asp:Label ID="lblModifyer" runat="server" meta:resourcekey="lblModifyerResource1"></asp:Label>
</asp:Content>
