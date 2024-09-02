<%@ Page Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="EIP_Calendar_WorkDetail" Title="修改工作" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" Codebehind="WorkDetail.aspx.cs" %>

<%@ Register Src="Common/UC_Periodicity.ascx" TagName="UC_Periodicity" TagPrefix="uc1" %>
<%@ Register Src="Common/UC_PrivateEvent.ascx" TagName="UC_PrivateEvent" TagPrefix="uc2" %>
<%@ Register Src="Common/UC_RemindTime.ascx" TagName="UC_RemindTime" TagPrefix="uc3" %>
<%@ Register TagPrefix="uc4" TagName="UC_WorkClassIcon" Src="~/EIP/Calendar/UC_WorkClassIcon.ascx" %>
<%@ Register Src="~/Common/FileCenter/V3/UC_FileCenter.ascx" TagPrefix="uc1" TagName="UC_FileCenter" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:CustomValidator ID="CustomValidator1" runat="server" Display="Dynamic" ErrorMessage="此為交辦事項不可修改" meta:resourcekey="CustomValidator1Resource1"></asp:CustomValidator>
    <asp:CustomValidator ID="CustomValidator6" runat="server" Display="Dynamic" ErrorMessage="交辦工作已被取消" meta:resourcekey="CustomValidator6Resource1"></asp:CustomValidator>
    <asp:Label ID="lblMsg" runat="server" ForeColor="Red" Text="該交辦已被取消" Visible="False" meta:resourcekey="lblMsgResource1"></asp:Label>
    <table class="PopTable" cellspacing="1" width="100%">
        <tr>
            <td>
                <font color="red">*</font>
                <asp:Label ID="Label1" runat="server" Text="主旨" meta:resourcekey="Label1Resource1"></asp:Label></td>
            <td>
                <asp:TextBox ID="txtSubject" runat="server" MaxLength="255" meta:resourcekey="txtSubjectResource1" Width="100%"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtSubject"
                    Display="Dynamic" ErrorMessage="請填入主旨" meta:resourcekey="RequiredFieldValidator1Resource1"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label2" runat="server" Text="說明" meta:resourcekey="Label2Resource1"></asp:Label></td>
            <td>
                <asp:TextBox ID="txtDescription" runat="server" Rows="8" TextMode="MultiLine" Width="100%" meta:resourcekey="txtDescriptionResource1"></asp:TextBox></td>
        </tr>
        <tr id="workClassDr" runat="server">
            <td>
                <asp:Label ID="Label11" runat="server" Text="工作類別" meta:resourcekey="Label11Resource1"></asp:Label>
            </td>
            <td>
                <uc4:UC_WorkClassIcon ID="UC_WorkClassIcon1" runat="server" />
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label3" runat="server" Text="開始時間" meta:resourcekey="Label3Resource1"></asp:Label></td>
            <td>
                <table border="0" cellpadding="0" cellspacing="0">
                    <tr>
                        <td>
                            <telerik:RadDatePicker ID="rdpDateStart" runat="server"></telerik:RadDatePicker>
                            <asp:Label ID="lblStartTime" runat="server" Visible="false"></asp:Label>
                        </td>
                        <td>
                            <telerik:RadTimePicker ID="rtpTimeStart" runat="server"></telerik:RadTimePicker>
                        </td>
                        <td>
                            <asp:CheckBox ID="CheckBox1" runat="server" Text="全天" AutoPostBack="True" OnCheckedChanged="CheckBox1_CheckedChanged" style="margin-left:5px" meta:resourcekey="CheckBox1Resource1" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label4" runat="server" Text="結束時間" meta:resourcekey="Label4Resource1"></asp:Label></td>
            <td>
                <table border="0" cellpadding="0" cellspacing="0">
                    <tr>
                        <td>
                            <telerik:RadDatePicker ID="rdpDateEnd" runat="server"></telerik:RadDatePicker>
                        </td>
                        <td>
                            <telerik:RadTimePicker ID="rtpTimeEnd" runat="server"></telerik:RadTimePicker>
                            <asp:Label ID="lblEndTime" runat="server" Visible="false"></asp:Label>
                        </td>
                        <td></td>
                    </tr>
                    <tr>
                        <td colspan="3">
                            <asp:CustomValidator ID="CustomValidator3" runat="server" Display="Dynamic" ErrorMessage="請填入開始時間" meta:resourcekey="CustomValidator3Resource1"></asp:CustomValidator>
                            <asp:CustomValidator ID="CustomValidator4" runat="server" Display="Dynamic" ErrorMessage="請填入結束時間" meta:resourcekey="CustomValidator4Resource1"></asp:CustomValidator>
                            <asp:CustomValidator ID="CustomValidator5" runat="server" Display="Dynamic" ErrorMessage="結束時間需晚於開始時間" meta:resourcekey="CustomValidator5Resource1"></asp:CustomValidator>
                            <asp:CustomValidator ID="CustomValidator2" runat="server" Display="Dynamic" ErrorMessage="週期性事件僅限當日" OnServerValidate="CustomValidator2_ServerValidate" meta:resourcekey="CustomValidator2Resource1"></asp:CustomValidator>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label12" runat="server" Text="附件" meta:resourcekey="Label12Resource1"></asp:Label>
            </td>
            <td>
                <uc1:UC_FileCenter runat="server" ID="UC_FileCenter" ModuleName="EIP"/>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label5" runat="server" Text="狀態" meta:resourcekey="Label5Resource1"></asp:Label></td>
            <td>
                <table style="width: 100%">
                    <tr>
                        <td style="width: 100%">
                            <asp:Label ID="lblAudit" runat="server" Text="審核中" meta:resourcekey="lblAuditResource1"></asp:Label>
                            <asp:DropDownList ID="dwnStatus" runat="server" meta:resourcekey="dwnStatusResource1" OnSelectedIndexChanged="dwnStatus_SelectedIndexChanged" AutoPostBack="True">
                                <asp:ListItem Value="NotYetBegin" meta:resourcekey="ListItemResource1" Text="尚未開始"></asp:ListItem>
                                <asp:ListItem Value="Proceeding" meta:resourcekey="ListItemResource2" Text="進行中"></asp:ListItem>
                                <asp:ListItem Value="Completed" meta:resourcekey="ListItemResource3" Text="已完成"></asp:ListItem>
                            </asp:DropDownList>
                            <asp:LinkButton ID="lbtnReportRecord" runat="server" meta:resourcekey="lbtnReportRecordResource1">工作回報歷程</asp:LinkButton>
                            &nbsp;&nbsp;
                            <asp:LinkButton ID="lbtnDovolveForum" runat="server" Text="交辦討論"  meta:resourcekey="lbtnDovolveForumResource1"></asp:LinkButton>
                            <asp:TextBox ID="txtDesc" runat="server" Width="100%" TextMode="MultiLine" meta:resourcekey="txtDescResource1"></asp:TextBox>
                            <uc1:UC_FileCenter runat="server" ID="workDetail_FileCenter" />
                        </td>
                    </tr>
                </table>
                <asp:CustomValidator ID="CustomValidator8" runat="server" Display="Dynamic" ErrorMessage="需填寫說明" meta:resourcekey="CustomValidator8Resource1"></asp:CustomValidator>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label6" runat="server" Text="私人" meta:resourcekey="Label6Resource1"></asp:Label></td>
            <td>
                <uc2:UC_PrivateEvent ID="UC_PrivateEvent1" runat="server" />
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label7" runat="server" Text="週期性" meta:resourcekey="Label7Resource1"></asp:Label></td>
            <td>
                <uc1:UC_Periodicity ID="UC_Periodicity1" runat="server" />
                <asp:CustomValidator ID="cvRepeatCheckLater" runat="server" Display="Dynamic" ErrorMessage="結束時間不可早於開始時間" meta:resourcekey="cvRepeatCheckLaterResource1"></asp:CustomValidator>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label8" runat="server" Text="提醒時間" meta:resourcekey="Label8Resource1"></asp:Label></td>
            <td>
                <uc3:UC_RemindTime ID="UC_RemindTime1" runat="server" />
                <asp:CustomValidator ID="CustomValidator7" runat="server" Display="Dynamic" ErrorMessage="沒有設定開始時間不可設定提醒時間" OnServerValidate="CustomValidator7_ServerValidate" meta:resourcekey="CustomValidator7Resource1"></asp:CustomValidator>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label9" runat="server" Text="建立人員" meta:resourcekey="Label9Resource1"></asp:Label></td>
            <td>
                <asp:Label ID="lblCreateuser" runat="server" meta:resourcekey="lblCreateuserResource1"></asp:Label></td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label10" runat="server" Text="來源" meta:resourcekey="Label10Resource1"></asp:Label></td>
            <td>
                <asp:Label ID="lblSource" runat="server" meta:resourcekey="lblSourceResource1"></asp:Label></td>
        </tr>
    </table>

    <asp:Label ID="lbOwnerGuid" runat="server" Visible="False" meta:resourcekey="lbOwnerGuidResource1"></asp:Label>
    <asp:Label ID="msgMywork" runat="server" Text="自己的工作" Visible="False" meta:resourcekey="msgMyworkResource1"></asp:Label>
    <asp:Label ID="msgDevolve" runat="server" Text="交辦" Visible="False" meta:resourcekey="msgDevolveResource1"></asp:Label>
    <asp:Label ID="msgMeeting" runat="server" Text="會議" Visible="False" meta:resourcekey="msgMeetingResource1"></asp:Label>
    <asp:Label ID="msgSelf" runat="server" Text="自己" Visible="False" meta:resourcekey="msgSelfResource1"></asp:Label>
    <asp:Label ID="lbConfirmDelete" runat="server" Text="確定要刪除?" Visible="False" meta:resourcekey="lbConfirmDeleteResource1"></asp:Label>
    <asp:Label ID="lbDelete" runat="server" Text="刪除" Visible="False" meta:resourcekey="lbDeleteResource1"></asp:Label>
    <asp:Label ID="lblLoginAlert" runat="server" Text="登入者非該工作執行者,所以無法連結此工作 !" Visible="False" meta:resourcekey="lblLoginAlertResource1"></asp:Label>
    <asp:Label ID="lblLinkTitle" runat="server" Text="工作回報記錄歷程" Visible="False" meta:resourcekey="lblLinkTitleResource1"></asp:Label>
    <asp:Label ID="lblbtnDevolveTitle" runat="server" Text="轉交辦" Visible="False" meta:resourcekey="lblbtnDevolveTitleResource1"></asp:Label>
    <asp:Label ID="lblForumTitle" runat="server" Text="交辦討論" Visible="False"></asp:Label>
    <asp:Label ID="lblRemindNotice" Text ="*有設定提醒時間的週期性工作，只會發送一次提醒通知。" runat="server" Visible="False" meta:resourcekey="lblRemindNoticeResource1"></asp:Label>    

    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
        <ContentTemplate>
            <asp:HiddenField ID="hideStatus" runat="server" />
            <asp:HiddenField ID="hideCancel" runat="server" />
            <asp:HiddenField ID="hidType" runat="server" />
            <asp:HiddenField ID="hidIsExpire" runat="server" />
            <asp:HiddenField ID="hidExpire" runat="server" />
            <asp:HiddenField ID="hidInterval" runat="server" />
            <asp:HiddenField ID="hidWeekDayArray" runat="server" />
            <asp:HiddenField ID="hidMonthWeekOrder" runat="server" />
            <asp:HiddenField ID="hidMonthWeekDay" runat="server" />
            <asp:HiddenField ID="hidStatus" runat="server" />
            <asp:HiddenField ID="hfCurrentUser" runat="server" />
        </ContentTemplate>
    </asp:UpdatePanel>
    <script>
        function Button2Click() {
            return confirm('<%= lbConfirmDelete.Text %>');
        }
        function NewDevolveClick()
        {
            var ownerGuid = '<%=Page.User.Identity.Name%>';;
            var date = '<%= Ede.Uof.EIP.Organization.Util.UserTime.SetZone(Ede.Uof.EIP.SystemInfo.Current.UserGUID).GetNowForUi().ToString("yyyy/MM/dd HH:mm:dd") %>';
            var subjectClientID = '<%= txtSubject.ClientID %>';
            var descriptionClientID = '<%= txtDescription.ClientID %>'; 

            var startDateTime = "";
            var endDateTime = "";

            var lblStartTime = $("#<%= lblStartTime.ClientID %>").text();
            var lblEndTime = $("#<%= lblEndTime.ClientID %>").text();     

            if (lblStartTime == "") {
                //原本的方法
                var startDate = $find("<%= rdpDateStart.ClientID %>").get_selectedDate();
                if (startDate != null) startDate = startDate.format('yyyy/MM/dd');

                var rtpTimeStart = $find("<%= rtpTimeStart.ClientID %>");
                if (rtpTimeStart != null) {
                    var startTime = rtpTimeStart.get_selectedDate();
                    if (startTime != null) {
                        startTime = startTime.format('HH:mm');
                    }
                    else {
                        startTime = '00:00';
                    }
                }
                else {
                    startTime = '00:00';
                }

                var endDate = $find("<%= rdpDateEnd.ClientID %>").get_selectedDate();
                if (endDate != null) endDate = endDate.format('yyyy/MM/dd');

                var rtpTimeEnd = $find("<%= rtpTimeEnd.ClientID %>");
                if (rtpTimeEnd != null) {
                    var endTime = rtpTimeEnd.get_selectedDate();
                    if (endTime != null) {
                        endTime = endTime.format('HH:mm');
                    }
                    else {
                        endTime = '23:59';
                    }
                }
                else {
                    endTime = '23:59';
                }

                var startDateTime = startDate + " " + startTime;
                var endDateTime = endDate + " " + endTime;
                //end原本的方法
            }
            else {
                startDateTime = lblStartTime.substring(0, 16);
                endDateTime = lblEndTime.substring(0, 16);
            }

            var allDay = $("#<%= CheckBox1.ClientID %>").is(":checked"); 

            var file = $find("<%=UC_FileCenter.ClientID%>");
            var fileGroupID = file.get_fileGroupId();
            $uof.dialog.open2("~/EIP/Calendar/CreateDevolve.aspx", "", "", 500, 600, function (returnValue) { return true; },
                {
                    "OwnerGuid": ownerGuid,
                    "Date": date,
                    "Subject": subjectClientID,
                    "Description": descriptionClientID,
                    "StartDateTime": startDateTime,
                    "EndDateTime": endDateTime,
                    "FileGroupID": fileGroupID,
                    "AllDay": allDay
                });
            return false;
        }
    </script>
</asp:Content>

