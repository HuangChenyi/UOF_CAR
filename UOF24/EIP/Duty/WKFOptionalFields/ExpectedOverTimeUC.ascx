<%@ Control Language="C#" AutoEventWireup="true" Inherits="WKF_OptionalFields_ExpectedOverTimeUC" Codebehind="ExpectedOverTimeUC.ascx.cs" %>
<%@ Register assembly="System.Web.Extensions" namespace="System.Web.UI" tagprefix="asp" %>
<%@ Reference Control="~/WKF/FormManagement/VersionFieldUserControl/VersionFieldUC.ascx" %>

<script type="text/javascript">
    String.format = function()
    {
        if (arguments.length == 0)
        {
            return null;
        }
        var str = arguments[0];
        for (var i=1;i<arguments.length;i++)
        {
            var re = new RegExp('\\{' + (i-1) + '\\}','gm');
            str = str.replace(re, arguments[i]);
        }
        return str;
    }

    function ExceptedOverTime_<%=CheckScriptFunctionName%>(e, args) 
    {
        var startDate = $find("<%=rdStartDate.ClientID%>").get_selectedDate();
        if (startDate != null) startDate = startDate.format('yyyy/MM/dd');

        var startTime = $find("<%=rdExceptedStartTime.ClientID%>").get_selectedDate();
        if (startTime != null) startTime = startTime.format('HH:mm');

        var endTime = $find("<%=rdExceptedEndTime.ClientID%>").get_selectedDate();
        if (endTime != null) endTime = endTime.format('HH:mm');

        var Hours = $find("<%=rdHours.ClientID%>").get_value();
        var data = ["" + startTime + "", "" + endTime + "", "" + Hours + ""];
        var sBool = $uof.pageMethod.syncUc("EIP/Duty/WKFOptionalFields/ExpectedOverTimeUC.ascx", "CheckHours", data);

        if (sBool == "false")
        {
            args.IsValid = false;
            return;
        }
    }

    function tbxExceptedTime_Blur(sender, args)
    {
        var startTime = $find("<%=rdExceptedStartTime.ClientID%>").get_selectedDate();
        if (startTime != null) startTime = startTime.format('HH:mm');

        var endTime = $find("<%=rdExceptedEndTime.ClientID%>").get_selectedDate();
        if (endTime != null) endTime = endTime.format('HH:mm');


        if (startTime != null && endTime != null) {
            var data = ["" + startTime + "", "" + endTime + ""];
            var sValue = $uof.pageMethod.syncUc("EIP/Duty/WKFOptionalFields/ExpectedOverTimeUC.ascx", "GetHours", data);
            var Hours = $find("<%=rdHours.ClientID%>");
            Hours.set_value(sValue);
        }
    }

    function OnValueChanging(sender, args) {
        if (args.get_newValue() == "") {
            args.set_newValue(args.get_oldValue());
        }
    }

    function CheckExceptedOverTime_<%=CheckOverTimeRepet%>(e, args)
    {
        var startDate = $find("<%=rdStartDate.ClientID%>").get_selectedDate();
        if (startDate != null) startDate = startDate.format('yyyy/MM/dd');

        var startTime = $find("<%=rdExceptedStartTime.ClientID%>").get_selectedDate();
        if (startTime != null) startTime = startTime.format('HH:mm');

        var endTime = $find("<%=rdExceptedEndTime.ClientID%>").get_selectedDate();
        if (endTime != null) endTime = endTime.format('HH:mm');

        var data = ["" + startDate + "", "" + startTime + "", "" + endTime + "", "<%=m_Applicant%>", "<%=m_TaskID%>"];
        var sValue = $uof.pageMethod.syncUc("EIP/Duty/WKFOptionalFields/ExpectedOverTimeUC.ascx", "CheckIsRepet", data);
        if (sValue != "")
        {
            var lblErrorMessageObj = $("#<%=CustomValidator2.ClientID%>");
            var lblErrorMFormet = $("#<%=lblCustVailMsg.ClientID%>");
            //alert(lblErrorMFormet.innerText);
            lblErrorMessageObj.text(String.format(lblErrorMFormet.text(),sValue));
            args.IsValid = false;
            return;
        }
    }

    function CheckIsClose_<%=CheckIsCloseMonth%>(e, args)
    {
        var startDate = $find("<%=rdStartDate.ClientID%>").get_selectedDate();
        if (startDate != null) startDate = startDate.format('yyyy/MM/dd');

        var startTime = $find("<%=rdExceptedStartTime.ClientID%>").get_selectedDate();
        if (startTime != null) startTime = startTime.format('HH:mm');

        var data = ["" + startDate + "", "" + startTime + "","<%=m_Applicant%>"];
        var sBool = $uof.pageMethod.syncUc("EIP/Duty/WKFOptionalFields/ExpectedOverTimeUC.ascx", "CheckIsClose", data);

        if (sBool == "true")
        {
            args.IsValid = false;
            return;
        }
    }

    function CheckIsZero_<%=CheckIsZero%>(e, args)
    {
        var Hours = $find("<%=rdHours.ClientID%>");
        if (Hours.get_value() * 1 <= 0)
        {
            args.IsValid = false;
            return;
        }
    }
</script>
<style type="text/css">
 
    .RightAligned
 
    { 
        text-align: right; 
    }
 
</style>
<table border="0" cellpadding="0" cellspacing="0" id="OverTimeTABLEInfo" runat="server">
    <tr>
        <td>
        </td>
        <td>
            <asp:Label runat="server" ID="lblMoreThanLawHoursMsg" Visible="false"  Text="員工每月加班總時數不得超過{0}小時，此員工當月累積加班已達{1}小時" CssClass="SizeMemo" meta:resourcekey="lblMoreThanLawHoursMsgResource1"></asp:Label>
        </td>
    </tr>
    <tr>
        <td nowrap=nowrap>
            <asp:LinkButton ID="lnk_Edit" runat="server" onclick="lnk_Edit_Click" Visible="False" CausesValidation="False" meta:resourcekey="lnk_EditResource1">[修改]</asp:LinkButton>
            <asp:LinkButton ID="lnk_Cannel" runat="server" onclick="lnk_Cannel_Click" Visible="False" CausesValidation="False" meta:resourcekey="lnk_CannelResource1">[取消]</asp:LinkButton>
            <asp:LinkButton ID="lnk_Submit" runat="server" onclick="lnk_Submit_Click" Visible="False" CausesValidation="False" meta:resourcekey="lnk_SubmitResource1">[確定]</asp:LinkButton>
        </td>
        <td nowrap=nowrap>
            <table style="width:600px" cellpadding="0" cellspacing="0" class="PopTable">
                <tr>
                    <td style="height:30px; width:120px" class="PopTableLeftTD" nowrap=nowrap><asp:Label ID="Label1" 
                            runat="server" Text="預計加班日期" meta:resourcekey="Label1Resource1"></asp:Label></td>
                    <td style="height:30px" class="PopTableRightTD" colspan="3" nowrap=nowrap>
                        <asp:Label ID="lblStartDate" runat="server" 
                            meta:resourcekey="lblStartDateResource1"></asp:Label>
                        <telerik:RadDatePicker ID="rdStartDate" runat="server" >
                            <Calendar UseRowHeadersAsSelectors="False" UseColumnHeadersAsSelectors="False"></Calendar>
                            <DateInput  LabelWidth="40%"></DateInput>
                            <DatePopupButton ImageUrl="" HoverImageUrl=""></DatePopupButton>
                        </telerik:RadDatePicker>
                    </td>
                </tr>
                <tr>
                    <td style="height:30px; width:120px" class="PopTableLeftTD" nowrap=nowrap><asp:Label ID="Label2" 
                            runat="server" Text="加班時間(起)" meta:resourcekey="Label2Resource1"></asp:Label></td>
                    <td style="height:30px" class="PopTableRightTD" nowrap=nowrap>
                        <asp:Label ID="lblExceptedStartTime" runat="server" meta:resourcekey="lblExceptedStartTimeResource1"></asp:Label>
                        <telerik:RadTimePicker ID="rdExceptedStartTime" runat="server" Culture="zh-TW" Width="80px" SelectedTime="00:00:00">
                            <Calendar UseRowHeadersAsSelectors="False" UseColumnHeadersAsSelectors="False"></Calendar>
                            <DatePopupButton Visible="False" CssClass="" ImageUrl="" HoverImageUrl=""></DatePopupButton>
                            <TimeView CellSpacing="-1" Culture="zh-TW"></TimeView>
                            <TimePopupButton CssClass="" ImageUrl="" HoverImageUrl=""></TimePopupButton>
                            <DateInput DisplayDateFormat="HH:mm" DateFormat="HH:mm" LabelWidth="64px" ClientEvents-OnValueChanging="OnValueChanging">
                                <ClientEvents OnValueChanging="OnValueChanging"/>
                            </DateInput>
                            <ClientEvents OnDateSelected="tbxExceptedTime_Blur"/>
                        </telerik:RadTimePicker>                       
                    </td>
                    <td style="height:30px; width:120px" class="PopTableLeftTD" nowrap=nowrap>
                        <asp:Label ID="Label3" runat="server" Text="加班時間(訖)" meta:resourcekey="Label3Resource1"></asp:Label>
                    </td>
                    <td style="height:30px" class="PopTableRightTD" nowrap=nowrap>
                        <asp:Label ID="lblExceptedEndTime" runat="server" meta:resourcekey="lblExceptedEndTimeResource1"></asp:Label>
                        <telerik:RadTimePicker ID="rdExceptedEndTime" runat="server" Culture="zh-TW" Width="80px" SelectedTime="00:00:00">
                            <Calendar UseRowHeadersAsSelectors="False" UseColumnHeadersAsSelectors="False"></Calendar>
                            <DatePopupButton Visible="False" CssClass="" ImageUrl="" HoverImageUrl=""></DatePopupButton>
                            <TimeView CellSpacing="-1" Culture="zh-TW"></TimeView>
                            <TimePopupButton CssClass="" ImageUrl="" HoverImageUrl=""></TimePopupButton>
                            <DateInput DisplayDateFormat="HH:mm" DateFormat="HH:mm" LabelWidth="64px" ClientEvents-OnValueChanging="OnValueChanging"></DateInput>
                            <ClientEvents OnDateSelected="tbxExceptedTime_Blur"/>
                        </telerik:RadTimePicker>
                      </td>
                </tr>
                <tr>
                    <td style="height:30px" class="PopTableLeftTD" nowrap=nowrap><asp:Label ID="Label4" 
                            runat="server" Text="加班時數" meta:resourcekey="Label4Resource1"></asp:Label></td>
                    <td style="height:30px" class="PopTableRightTD" colspan="3" nowrap=nowrap>
                        <asp:Label ID="lblHours" runat="server" meta:resourcekey="lblHoursResource1"></asp:Label>
                        <telerik:RadNumericTextBox ID="rdHours" runat="server" Width="50px" DataType="System.Int32" DbValueFactor="1" Value="0"  CssClass="RightAligned">
                            <NumberFormat ZeroPattern="n" DecimalDigits="1"></NumberFormat>
                        </telerik:RadNumericTextBox>
                        <asp:Label ID="Label5" runat="server" Text="小時" meta:resourcekey="Label5Resource1"></asp:Label>
                    </td>
                </tr>
            </table>
        </td>
        <td nowrap=nowrap>
            <asp:Label ID="lblHasNoAuthority" runat="server" Text="無填寫權限" ForeColor="Red" 
                Visible="False" meta:resourcekey="lblHasNoAuthorityResource1"></asp:Label>
            <asp:Label ID="lblToolTipMsg" runat="server" Text="不允許修改(唯讀)" Visible="False" 
                meta:resourcekey="lblToolTipMsgResource1"></asp:Label>
            <asp:Label ID="lblFiller" CssClass="FillerVisible" runat="server" 
                meta:resourcekey="lblFillerResource1"></asp:Label>
            <asp:Label ID="lblModifier" runat="server" Visible="False" 
                meta:resourcekey="lblModifierResource1"></asp:Label>
            <asp:Label ID="lblMsgSigner" runat="server" Text="填寫者" Visible="False" 
                meta:resourcekey="lblMsgSignerResource1"></asp:Label>
            <asp:Label ID="lblMsgEditor" runat="server" Text="修改者" Visible="False" 
                meta:resourcekey="lblMsgEditorResource1"></asp:Label>
            <asp:Label ID="lblAuthorityMsg" runat="server" Text="具填寫權限人員" Visible="False" 
                meta:resourcekey="lblAuthorityMsgResource1"></asp:Label>
        </td>
    </tr>
    <tr>
        <td>
        </td>
        <td>
            
            <table style="width:100%;">
                <tr>
                    <td>
                        <asp:CustomValidator ID="CustomValidator1" runat="server" ForeColor="Red" ErrorMessage="加班時數必須小於實際加班時數" Display="Dynamic" meta:resourcekey="CustomValidator1Resource1"></asp:CustomValidator>
                    </td>
                </tr>
                <tr>
                    <td>            
                        <asp:CustomValidator ID="CustomValidator2" runat="server" ForeColor="Red" ErrorMessage="加班日期已和表單編號({0})重複!" Display="Dynamic" meta:resourcekey="CustomValidator2Resource1"></asp:CustomValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:CustomValidator ID="CustomValidator3" runat="server" ForeColor="Red" ErrorMessage="日期欄位不可空白!" Display="Dynamic" meta:resourcekey="CustomValidator3Resource1"></asp:CustomValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:CustomValidator ID="CustomValidator4" runat="server" ForeColor="Red" ErrorMessage="開始時間欄位不可空白!" Display="Dynamic" meta:resourcekey="CustomValidator4Resource1"></asp:CustomValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:CustomValidator ID="CustomValidator5" runat="server" ForeColor="Red" ErrorMessage="結束時間欄位不可空白!" Display="Dynamic" meta:resourcekey="CustomValidator5Resource1"></asp:CustomValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:CustomValidator ID="CustomValidator6" runat="server" ForeColor="Red" ErrorMessage="已鎖單或已關帳月份不允許申請!" Display="Dynamic" meta:resourcekey="CustomValidator6Resource1"></asp:CustomValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:CustomValidator ID="CustomValidator7" runat="server" ForeColor="Red" ErrorMessage="加班時數不可等於零!" Display="Dynamic" meta:resourcekey="CustomValidator7Resource1"></asp:CustomValidator>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>
<asp:Label ID="lblCustVailMsg" runat="server" Text="加班日期已和表單編號({0})重複!"  style="display:none;" meta:resourcekey="lblCustVailMsgResource1"></asp:Label>
<asp:Label ID="lblExpectedOverTime" runat="server" Text="預計加班時間:" Visible="False" meta:resourcekey="lblExpectedOverTimeResource1"></asp:Label>
<asp:Label ID="lblSexM" runat="server" Text="男性" Visible="False" meta:resourcekey="lblSexMResource1"></asp:Label>
<asp:Label ID="lblSexF" runat="server" Text="女性" Visible="False" meta:resourcekey="lblSexFResource1"></asp:Label>