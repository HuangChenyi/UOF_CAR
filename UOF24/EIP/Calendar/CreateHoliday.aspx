<%@ Page Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="EIP_Calendar_CreateHoliday" Title="新增休假" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" CodeBehind="CreateHoliday.aspx.cs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table class="PopTable" cellspacing="1" width="100%">
        <tr>
            <td style="height: 24px">
                <span style="color: #ff0000">*</span><asp:Label ID="lbSubject" runat="server" Text="主旨" meta:resourcekey="lbSubjectResource1"></asp:Label></td>
            <td style="height: 24px">
                <asp:TextBox ID="txbSubject" runat="server" Width="100%" meta:resourcekey="txbSubjectResource1" MaxLength="255"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txbSubject"
                    Display="Dynamic" ErrorMessage="不允許空白" meta:resourcekey="RequiredFieldValidator1Resource1"></asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lbLeftDesc" runat="server" Text="說明" meta:resourcekey="lbLeftDescResource1"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txbDesc" runat="server" Rows="8" TextMode="MultiLine" Width="100%" meta:resourcekey="txbDescResource1"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td style="white-space: nowrap;">
                <span style="color: #ff0000">*</span><asp:Label ID="lbStartTime" runat="server" Text="開始時間" meta:resourcekey="lbStartTimeResource1"></asp:Label>

            </td>
            <td>
                <table border="0" cellpadding="0" cellspacing="0">
                    <tr>
                        <td>
                            <asp:Label ID="lblStartTime" runat="server" Visible="false"></asp:Label>
                            <telerik:RadDatePicker ID="rdpDateStart" runat="server"></telerik:RadDatePicker>
                        </td>
                        <td style="width: 5px;" align="center"></td>
                        <td>
                            <telerik:RadTimePicker ID="rtpTimeStart" runat="server"></telerik:RadTimePicker>
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
                <span style="color: #ff0000">*</span><asp:Label ID="lbEndTime" runat="server" Text="結束時間" meta:resourcekey="lbEndTimeResource1"></asp:Label></td>
            <td>
                <table border="0" cellpadding="0" cellspacing="0">
                    <tr>
                        <td>
                            <asp:Label ID="lblEndTime" runat="server" Visible="false"></asp:Label>
                            <telerik:RadDatePicker ID="rdpDateEnd" runat="server"></telerik:RadDatePicker>
                        </td>
                        <td style="width: 5px;" align="center"></td>
                        <td>

                            <telerik:RadTimePicker ID="rtpTimeEnd" runat="server"></telerik:RadTimePicker>
                        </td>
                        <td style="width: 5px;" align="center"></td>
                        <td></td>
                    </tr>
                </table>
                <asp:CustomValidator ID="CustomValidator3" runat="server" Display="Dynamic" ErrorMessage="請填入開始結束時間或勾選全天" OnServerValidate="CustomValidator3_ServerValidate" meta:resourcekey="CustomValidator3Resource1"></asp:CustomValidator>
                <asp:CustomValidator ID="CustomValidator4" runat="server" Display="Dynamic" ErrorMessage="請填入開始時間" OnServerValidate="CustomValidator4_ServerValidate" meta:resourcekey="CustomValidator4Resource1"></asp:CustomValidator>
                <asp:CustomValidator ID="CustomValidator5" runat="server" Display="Dynamic" ErrorMessage="請填入結束時間" OnServerValidate="CustomValidator5_ServerValidate" meta:resourcekey="CustomValidator5Resource1"></asp:CustomValidator>
                <asp:CustomValidator ID="CustomValidator1" runat="server" Display="Dynamic" ErrorMessage="結束時間需晚於開始時間" OnServerValidate="CustomValidator1_ServerValidate" meta:resourcekey="CustomValidator1Resource1"></asp:CustomValidator></td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lbLeftCreator" runat="server" Text="建立人員" meta:resourcekey="lbLeftCreatorResource1"></asp:Label></td>
            <td>
                <asp:Label ID="lbCreator" runat="server" meta:resourcekey="lbCreatorResource1"></asp:Label>
                <asp:Label ID="lbCreatorGuid" runat="server" Visible="False" meta:resourcekey="lbCreatorGuidResource1"></asp:Label></td>
        </tr>
    </table>
    <asp:Label ID="lbHolidayGuid" runat="server" Visible="False" meta:resourcekey="lbHolidayGuidResource1"></asp:Label>
    <asp:Label ID="lbOwnerGuid" runat="server" Visible="False" meta:resourcekey="lbOwnerGuidResource1"></asp:Label>
    <asp:Label ID="lbConfirmDelete" runat="server" Text="確定要刪除?" Visible="False" meta:resourcekey="lbConfirmDeleteResource1"></asp:Label>
    <asp:Label ID="lbDelete" runat="server" Text="刪除" Visible="False" meta:resourcekey="lbDeleteResource1"></asp:Label>
    <asp:HiddenField ID="hfCurrentUser" runat="server" />
    <script>
        function Button2Click() {
            return confirm('<%= lbConfirmDelete.Text %>');
        }
    </script>
</asp:Content>
