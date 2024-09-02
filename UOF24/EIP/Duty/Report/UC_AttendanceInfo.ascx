<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UC_AttendanceInfo.ascx.cs" Inherits="Ede.Uof.Web.EIP.Duty.Report.UC_AttendanceInfo" %>
<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Ede" %>

<script>
    function UC_AttendanceInfo_ButtonClicking(sender, args) {
        var key = args.get_item().get_value();
        var HREnableDuty = "<%=HREnableDuty%>";
        if (key == "Detail") {
            var rdDate = $find("<%=RadToolBar1.ClientID%>").findItemByValue("Date").findControl("rdDate").get_dateInput().get_selectedDate().format("yyyy/MM/dd");
            if (HREnableDuty === 'false')
            {
                $uof.dialog.open2("~/EIP/Duty/Report/AttendanceDetail.aspx", args.get_item(), '<%=lblDetailTitle.Text%>', 1300, 700, OpenDialogResult, { DATE: rdDate });
            }
            else
            {
                $uof.dialog.open2("~/HR104/Duty/Report/AttendanceDetail.aspx", args.get_item(), '<%=lblDetailTitle.Text%>', 1300, 700, OpenDialogResult, { DATE: rdDate });
            }
        }
    }

    function OpenDialogResult(returnValue)
    {
        if (typeof (returnValue) == 'undefined' || returnValue == null)
            return false;
        else
            return true;
    }

    function OpenDetailDialog(applicant, selectdate,empName) {
        var HREnableDuty = "<%=HREnableDuty%>";       
        if (HREnableDuty === 'false')
        {
            $uof.dialog.open2("~/EIP/Duty/Report/AttendanceDetail.aspx", "", '<%=lblPersonalTitle.Text%>', 1300, 700, function (returnValue) { return false; }, { APPLICANT: applicant, DATE: selectdate, EMPLOYEE_CNAME : empName});                 
        }
        else
        {
            $uof.dialog.open2("~/HR104/Duty/Report/AttendanceDetail.aspx", "", '<%=lblPersonalTitle.Text%>', 1300, 700, function (returnValue) { return false; }, { EMPLOYEE_NO: applicant, DATE: selectdate, EMPLOYEE_CNAME: empName });
        }
        return false; 
    }
</script>

<telerik:RadToolBar ID="RadToolBar1" runat="server" Width="100%" OnButtonClick="RadToolBar1_ButtonClick" OnClientButtonClicking="UC_AttendanceInfo_ButtonClicking" meta:resourcekey="RadToolBar1Resource1" SingleClick="None">
    <Items>
        <telerik:RadToolBarButton runat="server" Value="Date" meta:resourcekey="RadToolBarButtonResource1">
            <ItemTemplate>
                <asp:Label ID="Label5" runat="server" Text="日期" meta:resourcekey="Label5Resource1"></asp:Label>
                <telerik:RadDatePicker ID="rdDate" runat="server" meta:resourcekey="rdDateResource1">
                    <Calendar EnableWeekends="True" FastNavigationNextText="&amp;lt;&amp;lt;" UseColumnHeadersAsSelectors="False" UseRowHeadersAsSelectors="False">
                    </Calendar>
                    <DateInput DateFormat="yyyy/M/d" DisplayDateFormat="yyyy/M/d" LabelWidth="64px" Width="">
                        <EmptyMessageStyle Resize="None" />
                        <ReadOnlyStyle Resize="None" />
                        <FocusedStyle Resize="None" />
                        <DisabledStyle Resize="None" />
                        <InvalidStyle Resize="None" />
                        <HoveredStyle Resize="None" />
                        <EnabledStyle Resize="None" />
                    </DateInput>
                    <DatePopupButton CssClass="" HoverImageUrl="" ImageUrl="" />
                </telerik:RadDatePicker>
            </ItemTemplate>
        </telerik:RadToolBarButton>
        <telerik:RadToolBarButton IsSeparator="True" meta:resourcekey="RadToolBarButtonResource2"></telerik:RadToolBarButton>
        <telerik:RadToolBarButton runat="server" Text="查詢" Value="Query" CheckedImageUrl="~/Common/Images/Icon/icon_m39.gif"
            DisabledImageUrl="~/Common/Images/Icon/icon_m39.gif" HoveredImageUrl="~/Common/Images/Icon/icon_m39.gif"
            ImageUrl="~/Common/Images/Icon/icon_m39.gif" meta:resourcekey="RadToolBarQueryResource1">
        </telerik:RadToolBarButton>
        <telerik:RadToolBarButton IsSeparator="true" meta:resourcekey="RadToolBarButtonResource4"></telerik:RadToolBarButton>
        <telerik:RadToolBarButton runat="server" Text="查看明細" Value="Detail" CheckedImageUrl="~/Common/Images/Icon/icon_m84.png"
            DisabledImageUrl="~/Common/Images/Icon/icon_m84.png" HoveredImageUrl="~/Common/Images/Icon/icon_m84.png"
            ImageUrl="~/Common/Images/Icon/icon_m84.png" meta:resourcekey="RadToolBarButtonResource6">
        </telerik:RadToolBarButton>
        <telerik:RadToolBarButton IsSeparator="true" meta:resourcekey="RadToolBarButtonResource5"></telerik:RadToolBarButton>
    </Items>
</telerik:RadToolBar>

<asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>
        <table width="100%">
            <tr>
                <td>
                    <asp:Label ID="Label1" runat="server" Text="請假人員" Font-Bold="True" meta:resourcekey="Label1Resource1"></asp:Label>
                    <asp:Label ID="lblLeaveUserCount" runat="server" CssClass="SizeMemo"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <Ede:Grid ID="grdLeave" runat="server" AutoGenerateColumns="False" AutoGenerateCheckBoxColumn="False" SkinID="HomepageBlockStyle"
                        ShowHeader="False" BorderStyle="None" BorderWidth="0px" Width="100%" DataKeyOnClientWithCheckBox="False"
                        EnhancePager="True" EmptyDataText="沒有資料"
                        OnRowDataBound="grdLeave_RowDataBound" AllowSorting="True"
                        CustomDropDownListPage="False" DefaultSortDirection="Ascending" KeepSelectedRows="False" SelectedRowColor="" UnSelectedRowColor="" meta:resourcekey="grdLeaveResource1" PageSize="15">
                        <EnhancePagerSettings ShowHeaderPager="True" FirstAltImageUrl="" FirstImageUrl="" LastAltImage="" LastImageUrl="" NextIAltImageUrl="" NextImageUrl="" PageInfoCssClass="" PageNumberCssClass="" PageNumberCurrentCssClass="" PageRedirectCssClass="" PreviousAltImageUrl="" PreviousImageUrl="" />
                        <ExportExcelSettings AllowExportToExcel="False" />
                        <Columns>
                            <asp:TemplateField meta:resourcekey="TemplateFieldResource1">
                                <ItemTemplate>
                                    <asp:Label ID="lblLeaveApplicant" runat="server"></asp:Label>
                                </ItemTemplate>
                                <ItemStyle CssClass="breakword" />
                            </asp:TemplateField>
                        </Columns>
                    </Ede:Grid>
                    <asp:Label ID="lblGetDataError1" runat="server" Text="未能取得出勤資料，請重新查詢" Visible="False"  meta:resourcekey="lblGetDataErrorResource1" ForeColor="Blue"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <br />
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label2" runat="server" Text="出差人員" Font-Bold="True" meta:resourcekey="Label2Resource1"></asp:Label>
                    <asp:Label ID="lblTravelUserCount" runat="server" CssClass="SizeMemo"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <Ede:Grid ID="grdTravel" runat="server" AutoGenerateColumns="False" AutoGenerateCheckBoxColumn="False" SkinID="HomepageBlockStyle"
                        ShowHeader="False" BorderStyle="None" BorderWidth="0px" Width="100%" DataKeyOnClientWithCheckBox="False"
                        EnhancePager="True" EmptyDataText="沒有資料"
                        OnRowDataBound="grdTravel_RowDataBound" AllowSorting="True"
                        CustomDropDownListPage="False" DefaultSortDirection="Ascending" KeepSelectedRows="False" SelectedRowColor="" UnSelectedRowColor="" meta:resourcekey="grdTravelResource1">
                        <EnhancePagerSettings FirstAltImageUrl="" FirstImageUrl="" LastAltImage="" LastImageUrl="" NextIAltImageUrl="" NextImageUrl="" PageInfoCssClass="" PageNumberCssClass="" PageNumberCurrentCssClass="" PageRedirectCssClass="" PreviousAltImageUrl="" PreviousImageUrl="" ShowHeaderPager="True" />
                        <ExportExcelSettings AllowExportToExcel="False" />
                        <Columns>
                            <asp:TemplateField meta:resourcekey="TemplateFieldResource2">
                                <ItemTemplate>
                                    <asp:Label ID="lblTravelApplicant" runat="server"></asp:Label>
                                </ItemTemplate>
                                <ItemStyle CssClass="breakword" />
                            </asp:TemplateField>
                        </Columns>
                    </Ede:Grid>
                    <asp:Label ID="lblGetDataError2" runat="server" Text="未能取得出勤資料，請重新查詢" Visible="False"  meta:resourcekey="lblGetDataErrorResource1" ForeColor="Blue"></asp:Label>
                </td>
            </tr>
        </table>
    </ContentTemplate>
</asp:UpdatePanel>
<asp:Label ID="lblPersonalTitle" runat="server" Text="個人明細" Visible="false" meta:resourcekey="lblPersonalTitleResource1"></asp:Label>
<asp:Label ID="lblDetailTitle" runat="server" Text="所有明細" Visible="false" meta:resourcekey="lblDetailTitleResource1"></asp:Label>