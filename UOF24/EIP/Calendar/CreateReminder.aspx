<%@ Page Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="EIP_Calendar_CreateReminder" Title="新增備忘" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" Codebehind="CreateReminder.aspx.cs" %>

<%@ Register Src="Common/UC_RemindTime.ascx" TagName="UC_RemindTime" TagPrefix="uc3" %>

<%@ Register Src="Common/UC_PrivateEvent.ascx" TagName="UC_PrivateEvent" TagPrefix="uc1" %>
<%@ Register Src="Common/UC_Periodicity.ascx" TagName="UC_Periodicity" TagPrefix="uc2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table class="PopTable" cellspacing="0" style="width:100%; border-spacing:1px;">
        <tr>
            <td >
                <font color="red">*</font><asp:Label ID="Label1" runat="server" Text="主旨" meta:resourcekey="Label1Resource1"></asp:Label></td>
            <td >
                <asp:TextBox ID="txtSubject" runat="server" MaxLength="255" Width="100%" meta:resourcekey="txtSubjectResource1"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" Display="Dynamic"
                    ErrorMessage="請填入主旨" ControlToValidate="txtSubject" meta:resourcekey="RequiredFieldValidator1Resource1"></asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label2" runat="server" Text="說明" meta:resourcekey="Label2Resource1"></asp:Label></td>
            <td>
                <asp:TextBox ID="txtDescription" runat="server" Rows="8" TextMode="MultiLine" Width="100%" meta:resourcekey="txtDescriptionResource1"></asp:TextBox></td>
        </tr>
        <tr>
            <td style="white-space:nowrap;">
                <asp:Label ID="Label3" runat="server" Text="開始時間" meta:resourcekey="Label3Resource1"></asp:Label></td>
            <td>
                <table border="0" cellpadding="0" cellspacing="0">
                    <tr>
                      <td >
                          <telerik:RadDatePicker ID="rdpDateStart" runat="server"  ></telerik:RadDatePicker>
                       </td>
                       <td style="width: 5px;" align="center">
                       </td>
                       <td>
                           <telerik:RadTimePicker ID="rtpTimeStart" runat="server"></telerik:RadTimePicker>
                        </td>
                       <td style="width: 5px;" align="center">
                        </td>
                        <td >
                            <asp:CheckBox ID="CheckBox1" runat="server" Text="全天" AutoPostBack="True" OnCheckedChanged="CheckBox1_CheckedChanged" meta:resourcekey="CheckBox1Resource1" />
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
                <td >
                    <telerik:RadDatePicker ID="rdpDateEnd" runat="server" ></telerik:RadDatePicker>
                </td>
                <td style="width: 5px;" align="center">
                </td>
                <td>
                    <telerik:RadTimePicker ID="rtpTimeEnd" runat="server"></telerik:RadTimePicker>
                </td>
                <td style="width: 5px;" align="center">
                </td>
                <td >
                </td>
                </tr>
                <tr>
                <td colspan="3">
                <asp:CustomValidator ID="CustomValidator2" runat="server" Display="Dynamic" ErrorMessage="填入結束時間也需填入開始時間" OnServerValidate="CustomValidator2_ServerValidate" meta:resourcekey="CustomValidator2Resource1"></asp:CustomValidator>
                <asp:CustomValidator ID="CustomValidator3" runat="server" Display="Dynamic" ErrorMessage="請填入結束時間" OnServerValidate="CustomValidator3_ServerValidate" meta:resourcekey="CustomValidator3Resource1"></asp:CustomValidator>
                <asp:CustomValidator ID="CustomValidator4" runat="server" Display="Dynamic" ErrorMessage="結束時間需晚於開始時間" OnServerValidate="CustomValidator4_ServerValidate" meta:resourcekey="CustomValidator4Resource1"></asp:CustomValidator></td>
                </tr>
                </table>
                <asp:CustomValidator ID="CustomValidator1" runat="server" Display="Dynamic" ErrorMessage="週期性事件僅限當日" OnServerValidate="CustomValidator1_ServerValidate" meta:resourcekey="CustomValidator1Resource1"></asp:CustomValidator></td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label5" runat="server" Text="私人" meta:resourcekey="Label5Resource1"></asp:Label></td>
            <td>
                <uc1:UC_PrivateEvent ID="UC_PrivateEvent1" runat="server" />
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label6" runat="server" Text="週期性" meta:resourcekey="Label6Resource1"></asp:Label></td>
            <td>
                <uc2:UC_Periodicity ID="UC_Periodicity1" runat="server" />
                <asp:CustomValidator ID="cvRepeatCheckLater" runat="server" Display="Dynamic" ErrorMessage="結束時間不可早於開始時間" meta:resourcekey="cvRepeatCheckLaterResource1"></asp:CustomValidator>                
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label8" runat="server" Text="提醒時間" meta:resourcekey="Label8Resource1"></asp:Label></td>
            <td>
                <uc3:UC_RemindTime ID="UC_RemindTime1" runat="server" />
                <asp:CustomValidator ID="CustomValidator5" runat="server" Display="Dynamic"
                    ErrorMessage="沒有設定開始時間不可設定提醒時間" OnServerValidate="CustomValidator5_ServerValidate" meta:resourcekey="CustomValidator5Resource1"></asp:CustomValidator></td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label7" runat="server" Text="建立人員" meta:resourcekey="Label7Resource1"></asp:Label></td>
            <td>
                <asp:Label ID="lblCreateUser" runat="server" meta:resourcekey="lblCreateUserResource1"></asp:Label></td>
        </tr>
    </table>
    <asp:Label ID="lbOwnerGuid" runat="server" Visible="False" meta:resourcekey="lbOwnerGuidResource1"></asp:Label>
    <asp:Label ID="lblRemindNotice" Text ="*有設定提醒時間的週期性備忘，只會發送一次提醒通知。" runat="server" Visible="False" meta:resourcekey="lblRemindNoticeResource1"></asp:Label>
    <asp:HiddenField ID="hfCurrentUser" runat="server" />
    <asp:HiddenField ID="hfMemoGuid" runat="server" />
</asp:Content>

