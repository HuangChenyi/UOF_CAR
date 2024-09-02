<%@ Page Title="手動起單" Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" CodeBehind="OverAttendExecuteForm.aspx.cs" Inherits="Ede.Uof.Web.HR104.Duty.Manage.OverAttendExcuteForm" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" %>
<%@ Register Src="~/Common/ChoiceCenter/UC_ChoiceList.ascx" TagPrefix="uc1" TagName="UC_ChoiceList" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <table class="PopTable">
        <tr>
            <td style="white-space:nowrap;width: 25%;">
                <asp:Label ID="lblOverAttendDateRequired" runat="server" Text="*" ForeColor="Red" meta:resourcekey="lblOverAttendDateRequiredResource1"></asp:Label>
                <asp:Label ID="lblOverAttendDateTitle" runat="server" Text="超時出勤時間" meta:resourcekey="lblOverAttendDateTitleResource1"></asp:Label>
            </td>
            <td>
                <table>
                    <tr>
                        <td>
                            <telerik:RadDatePicker ID="rdStartDate" runat="server" meta:resourcekey="rdStartDateResource1">
                            </telerik:RadDatePicker>
                        </td>
                        <td>
                            <asp:Label ID="Label2" runat="server" Text="~" meta:resourcekey="Label2Resource1"></asp:Label>
                        </td>
                        <td>
                            <telerik:RadDatePicker ID="rdEndDate" runat="server" meta:resourcekey="rdEndDateResource1">
                            </telerik:RadDatePicker>
                        </td>
                        <td>
                            <asp:Label ID="lblDateRange" runat="server" CssClass="SizeMemo"></asp:Label>
                        </td>
                    </tr>
                </table>
                <asp:CompareValidator ID="cvDateCompare" runat="server" Type="Date" Operator="LessThanEqual" ControlToCompare="rdEndDate" ControlToValidate="rdStartDate" display="Dynamic" ErrorMessage="超時出勤時間的開始日期不可以晚於結束日期" meta:resourcekey="cvDateCompareResource1"></asp:CompareValidator>
                <asp:CustomValidator ID="cvDateRange" runat="server" Display="Dynamic" ErrorMessage="查詢區間不可大於一個月" OnServerValidate="cvDateRange_ServerValidate" meta:resourcekey="cvDateRangeResource1"></asp:CustomValidator>
            </td>
        </tr>
        <tr>
            <td style="white-space:nowrap;">
                <asp:Label ID="lblOverAttendUsersRequired" runat="server" Text="*" ForeColor="Red" meta:resourcekey="lblOverAttendUsersRequiredResource1"></asp:Label>
                <asp:Label ID="lblOverAttendUsersTitle" runat="server" Text="申請對象" meta:resourcekey="lblOverAttendUsersTitleResource1"></asp:Label>
            </td>
            <td>
                <uc1:UC_ChoiceList runat="server" ID="UC_ExecuteUsers" ExpandToUser="false" ShowMember="false" />
                <asp:CustomValidator ID="cvExecuteUsers" runat="server" Display="Dynamic" ErrorMessage="請選擇人員" OnServerValidate="cvExecuteUsers_ServerValidate" meta:resourcekey="cvExecuteUsersResource1"></asp:CustomValidator>
            </td>
        </tr>
    </table>

    <asp:Label ID="lblMemo1" runat="server" Text="1.可幫申請對象在指定區間內未回報的超時出勤記錄建立超時出勤回報申請單。" CssClass="SizeMemo" meta:resourcekey="lblMemo1Resource1"></asp:Label><br />
    <asp:Label ID="lblMemo2" runat="server" Text="2.申請對象中若包含不需回報人員，系統不會代為申請回報單。" CssClass="SizeMemo" meta:resourcekey="lblMemo2Resource1"></asp:Label>

    <asp:Label ID="lblProcessTaskMsg" runat="server" Text="已有起單排程處理中" Visible="False" meta:resourcekey="lblProcessTaskMsgResource1"></asp:Label><br />
    <asp:Label ID="lblReportDisabledMsg" runat="server" Text="目前不可進行超時出勤原因回報起單，請檢查104及超時出勤相關設定是否開啟。" Visible="false" meta:resourcekey="lblReportDisabledMsgResource1"></asp:Label>
    <asp:HiddenField ID="hfCurrentUser" runat="server" />

</asp:Content>
