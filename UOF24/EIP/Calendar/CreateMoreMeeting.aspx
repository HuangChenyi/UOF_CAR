<%@ Page Title="新增週期會議" Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="EIP_Calendar_CreateMoreMeeting" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" CodeBehind="CreateMoreMeeting.aspx.cs" %>

<%@ Register Src="../../Common/ChoiceCenter/UC_BtnChoiceOnce.ascx" TagName="UC_BtnChoiceOnce" TagPrefix="uc7" %>
<%@ Register Src="../../Common/ChoiceCenter/UC_ChoiceList.ascx" TagName="UC_ChoiceList" TagPrefix="uc1" %>
<%@ Register Src="Common/UC_PrivateEvent.ascx" TagName="UC_PrivateEvent" TagPrefix="uc2" %>
<%@ Register Src="Common/UC_RemindTime.ascx" TagName="UC_RemindTime" TagPrefix="uc4" %>
<%@ Register Src="Common/UC_RepeatRange.ascx" TagName="UC_RepeatRange" TagPrefix="uc3" %>
<%@ Register Src="~/Common/FileCenter/V3/UC_FileCenter.ascx" TagPrefix="uc1" TagName="UC_FileCenter" %>
<%@ Register Src="~/EIP/Plant/UC_EquipmentEdit.ascx" TagPrefix="uc5" TagName="UC_EquipmentEdit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <script type="text/javascript">
        
        Sys.Application.add_load(CheckRdNoticeStatus);
        
        function CheckRdNoticeStatus() {
            var rbNoticeRightNow = $("#<%=rbNoticeRightNow.ClientID %>").is(":checked");
            var rbNoticeBefore = $("#<%=rbNoticeBefore.ClientID %>").is(":checked");

            if (rbNoticeRightNow) {
                noticeBeforeDiv.style.display = "none";
            }
            if (rbNoticeBefore) {
                noticeBeforeDiv.style.display = "";
            }
        }

        function OpenDialog(meetingClientId,remindTime,hasremindTime) {
            $uof.dialog.open2("~/EIP/Calendar/MeetingPlantDetail.aspx", "", '<%=lblMoreDetailTitle.Text%>', 1280, 800,
                openDialogResult
                , {
                    "meetingClientId": meetingClientId,
                    "RepeatType": $("#<%=hfRepeatType.ClientID%>").val(), 
                    "RepeatGuid": $("#<%=hfRepeatGuid.ClientID%>").val(),
                    "RemindTime": remindTime,
                    "HasRemindTime": hasremindTime,
                    "AllowRepeat" : $("#<%=hfAllowRepeat.ClientID%>").val()
                   });
        
        }

        function openDialogResult(returnValue) {
            if (returnValue == 'SaveSuccess') {               
                $("#<%=btnOpenDialog.ClientID%>").click();
            }
          else if (typeof (returnValue) == 'undefined' || returnValue == null) {
                return false;
            }
            else  {
                return true;
            }
        }
    </script>
    <table width="100%" runat="server">
        <tbody>
            <tr>
                <td style="width: 50%">
                    <table class="PopTable" cellspacing="1" width="100%">
                        <tr>
                            <td style="white-space: nowrap;">
                                <asp:Label ID="Label16" runat="server" Text="*" ForeColor="Red"
                                    meta:resourcekey="Label16Resource1"></asp:Label>
                                <asp:Label ID="lblChair" runat="server" Text="主席" meta:resourcekey="lblChairResource1"></asp:Label>
                            </td>
                            <td>
                                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                    <ContentTemplate>
                                        <asp:Label ID="lblSelChair" runat="server" meta:resourcekey="lblSelChairResource1"></asp:Label>
                                        <asp:Label ID="lblSelChairGUID" runat="server" Visible="False" meta:resourcekey="lblSelChairGUIDResource1"></asp:Label>
                                        <uc7:UC_BtnChoiceOnce ID="UC_BtnChoiceOnce1" runat="server" />
                                        <asp:CustomValidator ID="cvCheckChair" runat="server" Display="Dynamic" ErrorMessage="主席不允許空白" meta:resourcekey="cvCheckChairResource1"></asp:CustomValidator>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <span style="color: #ff0000">*</span>
                                <asp:Label ID="Label2" runat="server" Text="主旨" meta:resourcekey="Label2Resource1"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="txbSubject" runat="server" Width="100%" MaxLength="200" meta:resourcekey="txbSubjectResource1"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txbSubject" Display="Dynamic" ErrorMessage="不允許空白" meta:resourcekey="RequiredFieldValidator2Resource1"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="Label4" runat="server" Text="說明" meta:resourcekey="Label4Resource1"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="txbDescription" runat="server" Height="100px" TextMode="MultiLine" Width="100%" meta:resourcekey="txbDescriptionResource1"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <span style="color: #ff0000">*</span>
                                <asp:Label ID="Label3" runat="server" Text="地點" meta:resourcekey="Label3Resource1"></asp:Label>
                            </td>
                            <td>
                                <table width="100%" cellpadding="0" cellspacing="0" border="0">
                                    <tr>
                                        <td>
                                            <asp:RadioButtonList ID="rbBorrowRoom" runat="server"
                                                RepeatDirection="Horizontal" AutoPostBack="True"
                                                OnSelectedIndexChanged="rbBorrowRoom_SelectedIndexChanged">
                                                <asp:ListItem Text="借用會議室" Value="Y" meta:resourcekey="ListItemResource1"></asp:ListItem>
                                                <asp:ListItem Text="其他地點" Value="N" Selected="True" meta:resourcekey="ListItemResource2">
                                                </asp:ListItem>
                                            </asp:RadioButtonList>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2">
                                            <asp:UpdatePanel ID="UpdatePanel4" runat="server">
                                                <ContentTemplate>
                                                    <asp:Label ID="lblLocation" runat="server" Text="" Visible="false"></asp:Label>
                                                    <asp:TextBox ID="txbLocation" runat="server" Width="100%" MaxLength="50"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txbLocation" Display="Dynamic" ErrorMessage="不允許空白" meta:resourcekey="RequiredFieldValidator2Resource1"></asp:RequiredFieldValidator>
                                                </ContentTemplate>
                                            </asp:UpdatePanel>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <span style="color: #ff0000">*</span>
                                <asp:Label ID="Label5" runat="server" Text="日期時間" meta:resourcekey="Label5Resource1"></asp:Label>
                            </td>
                            <td>
                                <table border="0" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td>
                                            <telerik:RadDatePicker ID="rdpDateStart" runat="server"></telerik:RadDatePicker>
                                        </td>
                                        <td style="width: 5px;" align="center"></td>
                                        <td>
                                            <telerik:RadTimePicker ID="rtpTimeStart" runat="server"></telerik:RadTimePicker>
                                        </td>
                                        <td>
                                            <asp:Label ID="Label10" runat="server" Text="~" meta:resourcekey="Label10Resource1"></asp:Label>
                                        </td>
                                        <td>
                                            <telerik:RadTimePicker ID="rtpTimeEnd" runat="server"></telerik:RadTimePicker>
                                        </td>
                                    </tr>
                                </table>
                                <asp:CustomValidator ID="CustomValidator4" runat="server" Display="Dynamic" ErrorMessage="請填入日期" meta:resourcekey="CustomValidator4Resource1"></asp:CustomValidator>
                                <asp:CustomValidator ID="CustomValidator7" runat="server" Display="Dynamic" ErrorMessage="結束時間需晚於開始時間" meta:resourcekey="CustomValidator7Resource1"></asp:CustomValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <span style="color: #ff0000">*</span>
                                <asp:Label ID="Label6" runat="server" Text="週期性" meta:resourcekey="Label6Resource1"></asp:Label>
                            </td>
                            <td>
                                <uc3:UC_RepeatRange ID="UC_RepeatRange1" runat="server" />
                                <asp:Label ID="lblMeetingRepeatLimit" runat="server" CssClass="SizeMemo"
                                    meta:resourcekey="lblMeetingRepeatLimitResource1"></asp:Label>
                                <asp:CustomValidator ID="CustomValidator8" runat="server" ErrorMessage="請選擇週期性" Display="Dynamic" meta:resourcekey="CustomValidator8Resource1"></asp:CustomValidator>
                                <asp:CustomValidator ID="cvRepeatCheckLater" runat="server" Display="Dynamic" ErrorMessage="結束時間不可早於開始時間" meta:resourcekey="cvRepeatCheckLaterResource1"></asp:CustomValidator>
                            </td>
                        </tr>
                        <tr>
                            <td style="white-space: nowrap;">
                                <span style="color: #ff0000">*</span>
                                <asp:Label ID="Label1" runat="server" Text="預計參加人員" meta:resourcekey="Label1Resource1"></asp:Label>
                            </td>
                            <td>
                                <uc1:UC_ChoiceList ID="UC_ChoiceList1" runat="server" ShowMember="False" TreeHeight="100px" />
                                <asp:CustomValidator ID="CustomValidator1" runat="server" Display="Dynamic" ErrorMessage="參加人員不允許空白" meta:resourcekey="CustomValidator1Resource1"></asp:CustomValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblmeetingRecorder" runat="server" Text="會議記錄人員" meta:resourcekey="lblmeetingRecorderResource1"></asp:Label>
                            </td>
                            <td style="white-space: nowrap">
                                <uc1:UC_ChoiceList ID="UC_ChoiceListMeetingRecorder" runat="server" ChioceType="User" ShowMember="False" TreeHeight="100px" />
                                <asp:CustomValidator ID="cvMeetingRecorderValid" runat="server" Display="Dynamic" ErrorMessage="會議記錄人員需為主席或預計參加人員" meta:resourcekey="CustomValidator9Resource1"></asp:CustomValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblContact" runat="server" Text="會議連絡人" meta:resourcekey="lblContactResource1"></asp:Label>
                            </td>
                            <td>
                                <uc1:UC_ChoiceList ID="UC_ChoiceList3" runat="server" ChioceType="User" ShowMember="False" TreeHeight="100px" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblFile" runat="server" Text="附件" meta:resourcekey="lblFileResource1"></asp:Label></td>
                            <td>
                                <uc1:UC_FileCenter runat="server" ID="UC_FileCenter" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="Label17" runat="server" Text="會議通知時間" meta:resourcekey="Label17Resource1"></asp:Label>
                            </td>
                            <td style="white-space: nowrap;">
                                <table style="padding: 0; width: 150px;">
                                    <tr>
                                        <td colspan="2">
                                            <asp:RadioButton ID="rbNoticeRightNow" runat="server" Text="立即通知" GroupName="RbNoticeGroup" Checked="true" onclick="CheckRdNoticeStatus()" meta:resourcekey="rbNoticeRightNowResource1" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="width: 70px">
                                            <asp:RadioButton ID="rbNoticeBefore" runat="server" Text="開始前" GroupName="RbNoticeGroup" onclick="CheckRdNoticeStatus()" meta:resourcekey="rbNoticeBeforeResource1" />
                                        </td>
                                        <td>
                                            <div id="noticeBeforeDiv" style="display: none">
                                                <asp:DropDownList ID="ddlNoticeTime" runat="server">
                                                    <asp:ListItem Value="10" Text="10分" meta:resourcekey="NoticeTimeListItem1Resource1"></asp:ListItem>
                                                    <asp:ListItem Value="30" Text="30分" meta:resourcekey="NoticeTimeListItem2Resource1"></asp:ListItem>
                                                    <asp:ListItem Value="60" Text="1小時" meta:resourcekey="NoticeTimeListItem3Resource1"></asp:ListItem>
                                                    <asp:ListItem Value="120" Text="2小時" meta:resourcekey="NoticeTimeListItem4Resource1"></asp:ListItem>
                                                    <asp:ListItem Value="1440" Text="1天" meta:resourcekey="NoticeTimeListItem5Resource1"></asp:ListItem>
                                                    <asp:ListItem Value="4320" Text="3天" meta:resourcekey="NoticeTimeListItem6Resource1"></asp:ListItem>
                                                    <asp:ListItem Value="10080" Text="1週" meta:resourcekey="NoticeTimeListItem7Resource1"></asp:ListItem>
                                                </asp:DropDownList>
                                            </div>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="Label8" runat="server" Text="提醒時間" meta:resourcekey="Label8Resource1"></asp:Label></td>
                            <td>
                                <uc4:UC_RemindTime ID="UC_RemindTime1" runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="Label7" runat="server" Text="私人" meta:resourcekey="Label7Resource1"></asp:Label></td>
                            <td>
                                <uc2:UC_PrivateEvent ID="UC_PrivateEvent1" runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="Label9" runat="server" Text="建立人員" meta:resourcekey="Label9Resource1"></asp:Label>
                            </td>
                            <td>
                                <asp:Label ID="lbCreateUser" runat="server" meta:resourcekey="lbCreateUserResource1"></asp:Label>
                            </td>
                        </tr>
                    </table>
                </td>
                <td style="width: 50%">
                    <table style="width: 100%">
                        <tr>
                            <td>
                                <asp:UpdatePanel ID="UpdatePanel6" runat="server">
                                    <ContentTemplate>
                                        <uc5:UC_EquipmentEdit runat="server" ID="equipmentEdit" />
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </tbody>
    </table>
    <asp:Label ID="lbUserGuid" runat="server" Visible="False" meta:resourcekey="lbUserGuidResource1"></asp:Label>
    <asp:Label ID="lbOwnerGuid" runat="server" Visible="False" meta:resourcekey="lbOwnerGuidResource1"></asp:Label>
    <asp:Label ID="lbMeetingGuid" runat="server" Visible="False" meta:resourcekey="lbMeetingGuidResource1"></asp:Label>
    <asp:Label ID="lblMsg1" runat="server" Text="只允許新增{0}天內會議" Visible="False" meta:resourcekey="lblMsg1Resource1"></asp:Label>
    <asp:Label ID="lblMsg2" runat="server" Text="只允許新增當日會議" Visible="False" meta:resourcekey="lblMsg2Resource1"></asp:Label>
    <asp:HiddenField ID="hfCurrentUser" runat="server" />
    <asp:Label ID="lblDialogTitle" runat="server" Text="借用設備" Visible="False" meta:resourcekey="lblDialogTitleResource1"></asp:Label>
    <asp:Button ID="btnOpenDialog" runat="server" Text="Button" Style="display: none;" OnClick="btnOpenDialog_Click" meta:resourcekey="btnOpenDialogResource1" />
    <asp:HiddenField ID="hfMeetingList" runat="server" />
    <asp:HiddenField ID="hfRepeatGuid" runat="server" />
    <asp:HiddenField ID="hfRepeatType" runat="server" />
    <asp:HiddenField ID="hfAllowRepeat" runat="server" />
    <asp:Label ID="lblMoreDetailTitle" runat="server" Text="週期會議借用設備" Visible="False" meta:resourcekey="lblMoreDetailTitleResource1"></asp:Label>
    <asp:Label ID="lblNoMeetRoomMsg" runat="server" Text="尚未借用會議室" Visible="False" meta:resourcekey="lblNoMeetRoomMsgResource1" ForeColor="Red"></asp:Label>
    <asp:Label ID="lblNoEmptyMsg" runat="server" Text="不允許空白" Visible="False" meta:resourcekey="lblNoEmptyMsgResource1" ForeColor="Red"></asp:Label>
    <asp:Label ID="lblNext" runat="server" Text="下一步" Visible="False" meta:resourcekey="lblNextResource1"></asp:Label>
</asp:Content>
