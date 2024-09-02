<%@ Page Title="產生班表" Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="EIP_Duty_TimeTable_Apply" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" Codebehind="Apply.aspx.cs" %>
<%@ Register Src="../../../Common/ChoiceCenter/UC_ChoiceList.ascx" TagName="UC_ChoiceList" TagPrefix="uc1" %>
<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <script type="text/javascript">

        function Calculate(txtWorkHour, txtWT, txtLTB, txtLTE, txtOT) {

            var WT = $find(txtWT).get_selectedDate().format('HH:mm');
            var LTB = $find(txtLTB).get_selectedDate().format('HH:mm');
            var LTE = $find(txtLTE).get_selectedDate().format('HH:mm');
            var OT = $find(txtOT).get_selectedDate().format('HH:mm');
            var data = ["", WT, LTB, LTE, OT];

            var WorkHour = $uof.pageMethod.sync("CalculateWorkHour", data);
            $find(txtWorkHour).set_value(WorkHour);
        }

        function OnValueChanging(sender, args) {
            if (args.get_newValue() === "") {
                args.set_newValue(args.get_oldValue());
            }
        }

    </script>
    <style type="text/css">
        .RightAligned
        {
            text-align: right;
        }
    </style>
    <table class="PopTable" cellspacing="1">
        <tr>
            <td nowrap="nowrap">
                <asp:Label ID="Label1" runat="server" Text="日期範圍"
                    meta:resourcekey="Label1Resource1"></asp:Label>
            </td>
            <td>
                <table>
                    <tr>
                        <td>
                            <asp:RadioButton ID="rbRange1" runat="server" GroupName="range" Text="下個月"
                                Checked="True" meta:resourcekey="rbRange1Resource1" />
                        </td>
                        <td>
                            <asp:Label ID="lbNextMonthB" runat="server"
                                meta:resourcekey="lbNextMonthBResource1"></asp:Label>
                            ~
                            <asp:Label ID="lbNextMonthE" runat="server"
                                meta:resourcekey="lbNextMonthEResource1"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td style="height: 25px">
                            <asp:RadioButton ID="rbRange2" runat="server" GroupName="range" Text="下一年"
                                meta:resourcekey="rbRange2Resource1" />
                        </td>
                        <td style="height: 25px">
                            <asp:Label ID="lbNextYearB" runat="server"
                                meta:resourcekey="lbNextYearBResource1"></asp:Label>
                            ~
                            <asp:Label ID="lbNextYearE" runat="server"
                                meta:resourcekey="lbNextYearEResource1"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:RadioButton ID="rbRange3" runat="server" GroupName="range" Text="自訂"
                                meta:resourcekey="rbRange3Resource1" />
                        </td>
                        <td>
                            <table>
                                <tr>
                                    <td>
                                        <telerik:RadDatePicker ID="rdBeginDate" runat="server">
                                            <Calendar UseRowHeadersAsSelectors="False" UseColumnHeadersAsSelectors="False"></Calendar>
                                            <DateInput LabelWidth="40%" ClientEvents-OnValueChanging="OnValueChanging"></DateInput>
                                            <DatePopupButton ImageUrl="" HoverImageUrl=""></DatePopupButton>
                                        </telerik:RadDatePicker>
                                    </td>
                                    <td>~
                                    </td>
                                    <td>
                                         <telerik:RadDatePicker ID="rdEndDate" runat="server">
                                            <Calendar UseRowHeadersAsSelectors="False" UseColumnHeadersAsSelectors="False"></Calendar>
                                            <DateInput LabelWidth="40%" ClientEvents-OnValueChanging="OnValueChanging"></DateInput>
                                            <DatePopupButton ImageUrl="" HoverImageUrl=""></DatePopupButton>
                                        </telerik:RadDatePicker>
                                    </td>
                                </tr>
                            </table>

                        </td>
                        <td>
                            <asp:CustomValidator ID="CustomValidator2" runat="server" Display="Dynamic" ErrorMessage="後面日期需晚於等於前面日期" ForeColor="Red" meta:resourcekey="CustomValidator2Resource1"></asp:CustomValidator></td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td nowrap="nowrap">
                <asp:Label ID="Label2" runat="server" Text="班表來源"
                    meta:resourcekey="Label2Resource1"></asp:Label>
            </td>
            <td>
                <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional" RenderMode="Inline">
                    <contenttemplate>
                        <table style="width: 100%;">
                            <tr>
                                <td>
                                    <asp:RadioButtonList ID="rblSource" runat="server" AutoPostBack="True" OnSelectedIndexChanged="rblSource_SelectedIndexChanged"
                                        RepeatDirection="Horizontal" meta:resourcekey="rblSourceResource1">
                                        <asp:ListItem Selected="True" meta:resourcekey="ListItemResource1" Text="從班別主檔"></asp:ListItem>
                                        <asp:ListItem meta:resourcekey="ListItemResource2" Text="自訂班表"></asp:ListItem>
                                    </asp:RadioButtonList>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:DropDownList ID="ddlTTCode" runat="server" AutoPostBack="True" 
                                        OnSelectedIndexChanged="ddlTTCode_SelectedIndexChanged" 
                                        meta:resourcekey="ddlTTCodeResource1">
                                    </asp:DropDownList>
                                    <asp:CustomValidator ID="cvErrorSchedule" runat="server" Display="Dynamic" 
                                        ErrorMessage="資料有誤，請檢查班表時間，後面時間需晚於前面時間" ForeColor="Red"
                                        onservervalidate="cvErrorSchedule_ServerValidate" 
                                        meta:resourcekey="cvErrorScheduleResource1"></asp:CustomValidator>
                                    <asp:CustomValidator ID="cvErrorHolidayType" runat="server" Display="Dynamic" 
                                        ErrorMessage="類型選擇為工作日，則工時需大於0。"
                                        onservervalidate="cvErrorHolidayType_ServerValidate" 
                                        meta:resourcekey="cvErrorHolidayTypeResource1"></asp:CustomValidator>
                                    <asp:CustomValidator ID="CustomValidator3" runat="server" Display="Dynamic" 
                                        ErrorMessage="資料有誤，請檢查班表時間，必須為時間格式而且不允許空白。"
                                        onservervalidate="CustomValidator3_ServerValidate" 
                                       ></asp:CustomValidator>
                                    <br />
                                    <Fast:Grid ID="Grid1" runat="server" AutoGenerateCheckBoxColumn="False" AutoGenerateColumns="False"
                                         DataKeyNames="WD" DataKeyOnClientWithCheckBox="False"
                                        DefaultSortDirection="Ascending" EnhancePager="True"
                                        OnRowDataBound="Grid1_RowDataBound" PageSize="15"  
                                        Width="100%" EmptyDataText="沒有資料" 
                                        KeepSelectedRows="False" AllowSorting="True" 
                                        meta:resourcekey="Grid1Resource1" CustomDropDownListPage="False" SelectedRowColor="" UnSelectedRowColor=""   >
                                        <ExportExcelSettings AllowExportToExcel="False" />
                                        <Columns>
                                            <asp:BoundField DataField="WD" HeaderText="星期" meta:resourcekey="BoundFieldResource1"
                                                SortExpression="WD">
                                                <HeaderStyle Wrap="False" />
                                                <ItemStyle Wrap="False" />
                                            </asp:BoundField>
                                            <asp:TemplateField HeaderText="工時" meta:resourcekey="TemplateFieldResource1" >
                                                <ItemTemplate>
                                                    <telerik:RadNumericTextBox ID="rdWorkHour" Runat="server" ReadOnly="True" Value="0.0" Width="60px" Culture="zh-TW" DbValueFactor="1" LabelWidth="24px" DbValue='<%# Bind("WORK_HOUR") %>' CssClass="RightAligned">
                                                        <numberformat decimaldigits="1" zeropattern="n" />
                                                        <ClientEvents OnValueChanging="OnValueChanging"/>
                                                    </telerik:RadNumericTextBox>
                                                    <br />
                                                    <asp:CustomValidator ID="cvErrorWorkHour" runat="server" Display="Dynamic" ErrorMessage="工時須為0.5的倍數" meta:resourcekey="cvErrorWorkHourResource1"></asp:CustomValidator>
                                                </ItemTemplate>
                                                <HeaderStyle Wrap="False" />
                                                <ItemStyle Wrap="False" HorizontalAlign="Center"/>
                                            </asp:TemplateField>
                                          <asp:TemplateField HeaderText="彈性最早上班時間" 
                                                meta:resourcekey="TemplateFieldResource2" >
                                                <ItemTemplate>
                                                    <telerik:RadTimePicker ID="rdWTE" Runat="server" DbSelectedDate='<%# GetTime(Eval("WORK_TIME_ET")) %>'  Width="80px" >
                                                        <calendar usecolumnheadersasselectors="False" userowheadersasselectors="False">
                                                        </calendar>
                                                        <datepopupbutton cssclass="" hoverimageurl="" imageurl="" visible="False" />
                                                        <timeview cellspacing="-1" >
                                                        </timeview>
                                                        <timepopupbutton cssclass="" hoverimageurl="" imageurl="" />
                                                        <dateinput dateformat="HH:mm" displaydateformat="HH:mm" labelwidth="64px" width="" ClientEvents-OnValueChanging="OnValueChanging">
                                                        </dateinput>
                                                    </telerik:RadTimePicker>
                                                </ItemTemplate>
                                                <HeaderStyle Wrap="False" />
                                                <ItemStyle Wrap="False" HorizontalAlign="Center"/>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="上班時間" meta:resourcekey="TemplateFieldResource3" >
                                                <ItemTemplate>
                                                    <telerik:RadTimePicker ID="rdWT" Runat="server" DbSelectedDate='<%# GetTime(Eval("WORK_TIME")) %>' Width="80px" >
                                                        <calendar usecolumnheadersasselectors="False" userowheadersasselectors="False">
                                                        </calendar>
                                                        <datepopupbutton cssclass="" hoverimageurl="" imageurl="" visible="False" />
                                                        <timeview cellspacing="-1" >
                                                        </timeview>
                                                        <timepopupbutton cssclass="" hoverimageurl="" imageurl="" />
                                                        <dateinput dateformat="HH:mm" displaydateformat="HH:mm" labelwidth="64px" width="" ClientEvents-OnValueChanging="OnValueChanging">
                                                        </dateinput>
                                                    </telerik:RadTimePicker>
                                                </ItemTemplate>
                                                <HeaderStyle Wrap="False" />
                                                <ItemStyle Wrap="False" HorizontalAlign="Center"/>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="彈性最晚上班時間" 
                                                meta:resourcekey="TemplateFieldResource4" >
                                                <ItemTemplate>
                                                    <telerik:RadTimePicker ID="rdWTL" Runat="server"  DbSelectedDate='<%# GetTime(Eval("WORK_TIME_LT")) %>' Width="80px" SelectedTime="00:00">
                                                        <calendar usecolumnheadersasselectors="False" userowheadersasselectors="False">
                                                        </calendar>
                                                        <datepopupbutton cssclass="" hoverimageurl="" imageurl="" visible="False" />
                                                        <timeview cellspacing="-1" >
                                                        </timeview>
                                                        <timepopupbutton cssclass="" hoverimageurl="" imageurl="" />
                                                        <dateinput dateformat="HH:mm" displaydateformat="HH:mm" labelwidth="64px" width="" ClientEvents-OnValueChanging="OnValueChanging">
                                                        </dateinput>
                                                    </telerik:RadTimePicker>
                                                </ItemTemplate>                                                
                                                    <headerstyle wrap="False" />
                                                    <itemstyle wrap="False" HorizontalAlign="Center"/>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="休息開始時間" 
                                                meta:resourcekey="TemplateFieldResource5" >
                                                <ItemTemplate>
                                                    <telerik:RadTimePicker ID="rdLTB" Runat="server"  DbSelectedDate='<%# GetTime(Eval("LUNCH_TIME_BT")) %>' Width="80px" >
                                                        <calendar usecolumnheadersasselectors="False" userowheadersasselectors="False">
                                                        </calendar>
                                                        <datepopupbutton cssclass="" hoverimageurl="" imageurl="" visible="False" />
                                                        <timeview cellspacing="-1" >
                                                        </timeview>
                                                        <timepopupbutton cssclass="" hoverimageurl="" imageurl="" />
                                                        <dateinput dateformat="HH:mm" displaydateformat="HH:mm" labelwidth="64px" width="" ClientEvents-OnValueChanging="OnValueChanging">
                                                        </dateinput>
                                                    </telerik:RadTimePicker>
                                                </ItemTemplate>
                                                <HeaderStyle Wrap="False" />
                                                <ItemStyle Wrap="False" HorizontalAlign="Center"/>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="休息結束時間" 
                                                meta:resourcekey="TemplateFieldResource6" >
                                                <ItemTemplate>
                                                    <telerik:RadTimePicker ID="rdLTE" Runat="server" DbSelectedDate='<%# GetTime(Eval("LUNCH_TIME_ET")) %>' Width="80px" >
                                                        <calendar usecolumnheadersasselectors="False" userowheadersasselectors="False">
                                                        </calendar>
                                                        <datepopupbutton cssclass="" hoverimageurl="" imageurl="" visible="False" />
                                                        <timeview cellspacing="-1" >
                                                        </timeview>
                                                        <timepopupbutton cssclass="" hoverimageurl="" imageurl="" />
                                                        <dateinput dateformat="HH:mm" displaydateformat="HH:mm" labelwidth="64px" width="" ClientEvents-OnValueChanging="OnValueChanging">
                                                        </dateinput>
                                                    </telerik:RadTimePicker>
                                                </ItemTemplate>
                                                <HeaderStyle Wrap="False" />
                                                <ItemStyle Wrap="False" HorizontalAlign="Center"/>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="彈性最早下班時間" 
                                                meta:resourcekey="TemplateFieldResource7" >
                                                <ItemTemplate>
                                                    <telerik:RadTimePicker ID="rdOTE" Runat="server"  DbSelectedDate='<%# GetTime(Eval("OFF_TIME_ET")) %>' Width="80px" >
                                                        <calendar usecolumnheadersasselectors="False" userowheadersasselectors="False">
                                                        </calendar>
                                                        <datepopupbutton cssclass="" hoverimageurl="" imageurl="" visible="False" />
                                                        <timeview cellspacing="-1">
                                                        </timeview>
                                                        <timepopupbutton cssclass="" hoverimageurl="" imageurl="" />
                                                        <dateinput dateformat="HH:mm" displaydateformat="HH:mm" labelwidth="64px" width="" ClientEvents-OnValueChanging="OnValueChanging">
                                                        </dateinput>
                                                    </telerik:RadTimePicker>
                                                </ItemTemplate>
                                                <HeaderStyle Wrap="False" />
                                                <ItemStyle Wrap="False" HorizontalAlign="Center"/>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="下班時間" meta:resourcekey="TemplateFieldResource8" >
                                                <ItemTemplate>
                                                    <telerik:RadTimePicker ID="rdOT" Runat="server" DbSelectedDate='<%# GetTime(Eval("OFF_TIME")) %>' Width="80px" >
                                                        <calendar usecolumnheadersasselectors="False" userowheadersasselectors="False">
                                                        </calendar>
                                                        <datepopupbutton cssclass="" hoverimageurl="" imageurl="" visible="False" />
                                                        <timeview cellspacing="-1" >
                                                        </timeview>
                                                        <timepopupbutton cssclass="" hoverimageurl="" imageurl="" />
                                                        <dateinput dateformat="HH:mm" displaydateformat="HH:mm" labelwidth="64px" width="" ClientEvents-OnValueChanging="OnValueChanging">
                                                        </dateinput>
                                                    </telerik:RadTimePicker>
                                                </ItemTemplate>
                                                <HeaderStyle Wrap="False" />
                                                <ItemStyle Wrap="False" HorizontalAlign="Center"/>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="彈性最晚下班時間" 
                                                meta:resourcekey="TemplateFieldResource9" >
                                                <ItemTemplate>
                                                    <telerik:RadTimePicker ID="rdOTL" Runat="server" DbSelectedDate='<%# GetTime(Eval("OFF_TIME_LT")) %>' Width="80px" >
                                                        <calendar usecolumnheadersasselectors="False" userowheadersasselectors="False">
                                                        </calendar>
                                                        <datepopupbutton cssclass="" hoverimageurl="" imageurl="" visible="False" />
                                                        <timeview cellspacing="-1" >
                                                        </timeview>
                                                        <timepopupbutton cssclass="" hoverimageurl="" imageurl="" />
                                                        <dateinput dateformat="HH:mm" displaydateformat="HH:mm" labelwidth="64px" width="" ClientEvents-OnValueChanging="OnValueChanging">
                                                        </dateinput>
                                                    </telerik:RadTimePicker>
                                                </ItemTemplate>
                                                <HeaderStyle Wrap="False" />
                                                <ItemStyle Wrap="False" HorizontalAlign="Center"/>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="類型" meta:resourcekey="TemplateFieldResource11">
                                                <ItemTemplate>
                                                    <asp:DropDownList ID="ddlTimeTableType" runat="server" meta:resourcekey="ddlTimeTableTypeResource1">
                                                        <asp:ListItem Text="工作日" Value="Workday" meta:resourcekey="ListItemResource5"></asp:ListItem>
                                                        <asp:ListItem Text="休息日" Value="Dayoff" meta:resourcekey="ListItemResource6"></asp:ListItem>
                                                        <asp:ListItem Text="例假日" Value="Routine" meta:resourcekey="ListItemResource7"></asp:ListItem>
                                                         <asp:ListItem Text="國定假日" Value="OrgHoliday"  meta:resourcekey="ListItemResource8"></asp:ListItem>
                                                    </asp:DropDownList>
                                                    <asp:Label ID="lblTimeTableType" runat="server" Visible="False" meta:resourcekey="lblTimeTableTypeResource1"></asp:Label>
                                                </ItemTemplate>
                                                <HeaderStyle Wrap="False" />
                                                <ItemStyle Wrap="False"></ItemStyle>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="備註" meta:resourcekey="TemplateFieldResource10">
                                                <ItemTemplate>
                                                    <asp:TextBox ID="txtRemark" runat="server" Rows="2" MaxLength="255" TextMode="MultiLine" Text='<%# Eval("REMARK") %>' meta:resourcekey="txtRemarkResource1" ></asp:TextBox>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                        <EnhancePagerSettings
                                            ShowHeaderPager="True" FirstAltImageUrl="" FirstImageUrl="" LastAltImage="" LastImageUrl="" NextIAltImageUrl="" NextImageUrl="" PageInfoCssClass="" PageNumberCssClass="" PageNumberCurrentCssClass="" PageRedirectCssClass="" PreviousAltImageUrl="" PreviousImageUrl="" />
                                    </Fast:Grid>
                                </td>
                            </tr>
                        </table>
                        <asp:Label ID="lblWorkday" runat="server" Text="工作日" Visible="False" meta:resourcekey="lblWorkdayResource1"></asp:Label>
                        <asp:Label ID="lblDayoff" runat="server" Text="休息日" Visible="False" meta:resourcekey="lblDayoffResource1"></asp:Label>
                        <asp:Label ID="lblRoutine" runat="server" Text="例假日" Visible="False" meta:resourcekey="lblRoutineResource1"></asp:Label>
                        <asp:Label ID="lblOrgHoliday" runat="server" Text="國定假日" Visible="False" meta:resourcekey="lblOrgHolidayResource1"></asp:Label>
                    </contenttemplate>
                </asp:UpdatePanel>
        </tr>
        <tr>
            <td nowrap="nowrap">
                <asp:Label ID="Label3" runat="server" Text="考慮假日"
                    meta:resourcekey="Label3Resource1"></asp:Label>
            </td>
            <td>
                <asp:RadioButtonList ID="rblHoliday" runat="server"
                    RepeatDirection="Horizontal" meta:resourcekey="rblHolidayResource1">
                    <asp:ListItem Selected="True" Value="True" meta:resourcekey="ListItemResource3">是</asp:ListItem>
                    <asp:ListItem Value="False" meta:resourcekey="ListItemResource4">否</asp:ListItem>
                </asp:RadioButtonList>
                <asp:Label ID="Label5" runat="server" Text="如果為是,則遇到假日時優先採用該假日所設定的班表"
                    CssClass="SizeMemo" meta:resourcekey="Label5Resource1"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <font color="red">*</font>
                <asp:Label ID="Label4" runat="server" Text="人員"
                    meta:resourcekey="Label4Resource1"></asp:Label>
            </td>
            <td height="250" valign="top" style="line-height: normal;">
                <asp:CustomValidator ID="CustomValidator1" runat="server" Display="Dynamic"
                    ErrorMessage="請選擇人員" meta:resourcekey="CustomValidator1Resource1" ForeColor="Red"></asp:CustomValidator>
                <uc1:UC_ChoiceList ID="UC_ChoiceList1" runat="server" />
            </td>
        </tr>
    </table>
</asp:Content>

