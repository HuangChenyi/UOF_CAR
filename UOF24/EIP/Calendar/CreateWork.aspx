<%@ Page Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="EIP_Calendar_CreateWork" Title="新增工作" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" Codebehind="CreateWork.aspx.cs" %>

<%@ Register Src="Common/UC_PrivateEvent.ascx" TagName="UC_PrivateEvent" TagPrefix="uc3" %>

<%@ Register Src="Common/UC_RemindTime.ascx" TagName="UC_RemindTime" TagPrefix="uc2" %>

<%@ Register Src="Common/UC_Periodicity.ascx" TagName="UC_Periodicity" TagPrefix="uc1" %>

<%@ Register Src="UC_WorkClassIcon.ascx" TagName="UC_WorkClassIcon" TagPrefix="uc4" %>
<%@ Register Src="~/Common/FileCenter/V3/UC_FileCenter.ascx" TagPrefix="uc1" TagName="UC_FileCenter" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <script id="CreateWorkjs" type="text/javascript">
<!--
    function DisableTime() {
        if ($("#<%=CheckBox1.ClientID%>").prop("checked")) {



    }
    else {
        alert('no');
    }
}// -->
    </script>
    <table class="PopTable" style="border-spacing: 1px; width:100%">

        <tr>
            <td>
                <font color="red">*</font><asp:Label ID="Label1" runat="server" Text="主旨" meta:resourcekey="Label1Resource1"></asp:Label></td>
            <td>
                <asp:TextBox ID="txtSubject" runat="server" meta:resourcekey="txtSubjectResource1" Width="100%" MaxLength="255"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtSubject"
                    Display="Dynamic" ErrorMessage="請填入主旨" meta:resourcekey="RequiredFieldValidator1Resource1"></asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label2" runat="server" Text="說明" meta:resourcekey="Label2Resource1"></asp:Label></td>
            <td>
                <asp:TextBox ID="txtDescription" runat="server" Rows="8" TextMode="MultiLine" Width="100%" meta:resourcekey="txtDescriptionResource1"></asp:TextBox></td>
        </tr>
        <tr id="workClassDr" runat="server" style="white-space: nowrap;">
            <td>
                <asp:Label ID="Label9" runat="server" Text="工作類別" meta:resourcekey="Label9Resource1"></asp:Label>
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
                            <telerik:RadDatePicker ID="rdpDateStart" runat="server" ></telerik:RadDatePicker>
                        </td>
                        <td>
                            <telerik:RadTimePicker ID="rdpTimeStart" runat="server" ></telerik:RadTimePicker>
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
                <table border="0" cellpadding="0" cellspacing="0" width="240px">
                    <tr>
                        <td>
                            <telerik:RadDatePicker ID="rdpDateEnd" runat="server" ></telerik:RadDatePicker>
                        </td>
                        <td style="width: 5px;" align="center"></td>
                        <td>
                            <telerik:RadTimePicker ID="rdpTimeEnd" runat="server" ></telerik:RadTimePicker>

                        </td>
                        <td style="width: 5px;" align="center"></td>
                        <td style="width: 100px;" align="center"></td>
                    </tr>
                    <tr>
                        <td colspan="3">
                            <asp:CustomValidator ID="CustomValidator2" runat="server" Display="Dynamic" ErrorMessage="請填入開始時間" meta:resourcekey="CustomValidator2Resource1"></asp:CustomValidator>
                            <asp:CustomValidator ID="CustomValidator3" runat="server" Display="Dynamic" ErrorMessage="請填入結束時間" meta:resourcekey="CustomValidator3Resource1"></asp:CustomValidator>
                            <asp:CustomValidator ID="CustomValidator4" runat="server" Display="Dynamic" ErrorMessage="結束時間需晚於開始時間" meta:resourcekey="CustomValidator4Resource1"></asp:CustomValidator>
                            <asp:CustomValidator ID="CustomValidator1" runat="server" Display="Dynamic" ErrorMessage="週期性事件僅限當日" OnServerValidate="CustomValidator1_ServerValidate" meta:resourcekey="CustomValidator1Resource1"></asp:CustomValidator></td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label10" runat="server" Text="附件" meta:resourcekey="Label10Resource1"></asp:Label>
            </td>
            <td>
                <uc1:UC_FileCenter runat="server" ID="UC_FileCenter" ModuleName="EIP" />
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label5" runat="server" Text="私人" meta:resourcekey="Label5Resource1"></asp:Label></td>
            <td>
                <uc3:UC_PrivateEvent ID="UC_PrivateEvent1" runat="server"></uc3:UC_PrivateEvent>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label6" runat="server" Text="週期性" meta:resourcekey="Label6Resource1"></asp:Label></td>
            <td>
                <uc1:UC_Periodicity ID="UC_Periodicity1" runat="server"></uc1:UC_Periodicity>
                <asp:CustomValidator ID="cvRepeatCheckLater" runat="server" Display="Dynamic" ErrorMessage="結束時間不可早於開始時間" meta:resourcekey="cvRepeatCheckLaterResource1"></asp:CustomValidator>                
            </td>
        </tr>
        <tr>
            <td style="height: 67px">
                <asp:Label ID="Label7" runat="server" Text="提醒時間" meta:resourcekey="Label7Resource1"></asp:Label></td>
            <td style="height: 67px">
                <uc2:UC_RemindTime ID="UC_RemindTime1" runat="server" />
                <asp:CustomValidator ID="CustomValidator5" runat="server" Display="Dynamic"
                    ErrorMessage="沒有設定開始時間不可設定提醒時間" OnServerValidate="CustomValidator5_ServerValidate" meta:resourcekey="CustomValidator5Resource1"></asp:CustomValidator></td>
        </tr>
        <tr>
            <td style="height: 21px">
                <asp:Label ID="Label8" runat="server" Text="建立人員" meta:resourcekey="Label8Resource1"></asp:Label></td>
            <td style="height: 21px">
                <asp:Label ID="lblCreateUser" runat="server" meta:resourcekey="lblCreateUserResource1"></asp:Label></td>
        </tr>
    </table>
    <asp:Label ID="lbOwnerGuid" runat="server" Visible="False" meta:resourcekey="lbOwnerGuidResource1"></asp:Label>
    <asp:Label ID="lblRemindNotice" Text ="*有設定提醒時間的週期性工作，只會發送一次提醒通知。" runat="server" Visible="False" meta:resourcekey="lblRemindNoticeResource1"></asp:Label>
    <asp:HiddenField ID="hfCurrentUser" runat="server" />
</asp:Content>
