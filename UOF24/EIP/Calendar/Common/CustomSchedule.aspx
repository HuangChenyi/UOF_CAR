<%@ Page Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="EIP_Calendar_Common_CustomSchedule" Title="" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" Codebehind="CustomSchedule.aspx.cs" %>
<%@ Register Src="UC_RemindTime.ascx" TagName="UC_RemindTime" TagPrefix="uc2" %>
<%@ Register Src="UC_PrivateEvent.ascx" TagName="UC_PrivateEvent" TagPrefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table class="PopTable" cellspacing="1" width="100%">
        <tr>
            <td>
                <asp:Label ID="lblSubject" runat="server" Text="主旨"
                    meta:resourcekey="lblSubjectResource1"></asp:Label></td>
            <td>
                <asp:TextBox ID="txtSubject" MaxLength="200" Width="100%" runat="server"
                    meta:resourcekey="txtSubjectResource1"></asp:TextBox></td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblDesc" runat="server" Text="說明"
                    meta:resourcekey="lblDescResource1"></asp:Label></td>
            <td>
                <asp:TextBox ID="txtDesc" TextMode="MultiLine" Rows="8" Width="100%"
                    runat="server" meta:resourcekey="txtDescResource1"></asp:TextBox></td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblStart" runat="server" Text="開始時間"
                    meta:resourcekey="lblStartResource1"></asp:Label></td>
            <td>

                <table>
                    <tr>
                        <td>
                            <telerik:RadDatePicker ID="rdStartDate" runat="server"></telerik:RadDatePicker>
                        </td>
                        <td>
                            <telerik:RadTimePicker ID="rdStartTime" runat="server"></telerik:RadTimePicker>
                        </td>
                        <td>
                            <asp:CheckBox ID="cbAllDay" runat="server" Text="全天" meta:resourcekey="cbAllDayResource1" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblEnd" runat="server" Text="結束時間"
                    meta:resourcekey="lblEndResource1"></asp:Label></td>
            <td>
                <table>
                    <tr>
                        <td>
                            <telerik:RadDatePicker ID="rdEndDate" runat="server"></telerik:RadDatePicker>
                        </td>
                        <td>
                            <telerik:RadTimePicker ID="rdEndTime" runat="server"></telerik:RadTimePicker>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblReminder" runat="server" Text="提醒"
                    meta:resourcekey="lblReminderResource1"></asp:Label></td>
            <td>
                <uc2:UC_RemindTime ID="UC_RemindTime1" runat="server"></uc2:UC_RemindTime>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblPersonal" runat="server" Text="私人"
                    meta:resourcekey="lblPersonalResource1"></asp:Label></td>
            <td>
                <uc1:UC_PrivateEvent ID="UC_PrivateEvent1" runat="server" />
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblCreater" runat="server" Text="建立人員"
                    meta:resourcekey="lblCreaterResource1"></asp:Label></td>
            <td>
                <asp:Label ID="lblCreaterName" runat="server"
                    meta:resourcekey="lblCreaterNameResource1"></asp:Label></td>
        </tr>
    </table>
</asp:Content>

