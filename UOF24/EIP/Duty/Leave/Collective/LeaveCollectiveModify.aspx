<%@ Page Title="維護扣假明細" Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="EIP_Duty_Leave_Collective_LeaveCollectiveModify" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" Codebehind="LeaveCollectiveModify.aspx.cs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <style type="text/css">
        .RightAligned
        {
            text-align: right;
        }
    </style>

    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <table class="PopTable">
                <tr>
                    <td style="white-space: nowrap;">
                        <asp:Label ID="lblDateTime" runat="server" Text="扣假時間"
                            meta:resourcekey="lblDateTimeResource1"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="lblCollectiveDate" runat="server"
                            meta:resourcekey="lblCollectiveDateResource1"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td style="white-space: nowrap;">
                        <asp:Label ID="lblMember" runat="server" meta:resourcekey="lblMemberResource1"
                            Text="人員"></asp:Label>
                    </td>
                    <td style="white-space: nowrap;">
                        <asp:LinkButton ID="lbtnMember" runat="server"
                            meta:resourcekey="lbtnMemberResource1"></asp:LinkButton>
                    </td>
                </tr>
                <tr>
                    <td style="white-space: nowrap;">
                        <asp:Label ID="lblLeaveCode" runat="server"
                            meta:resourcekey="lblLeaveCodeResource1" Text="假別"></asp:Label>
                    </td>
                    <td style="white-space: nowrap;">
                        <asp:DropDownList ID="ddlLeaveCode" runat="server" AutoPostBack="True"
                            meta:resourcekey="ddlLeaveCodeResource1"
                            OnSelectedIndexChanged="ddlLeaveCode_SelectedIndexChanged">
                        </asp:DropDownList>
                        <asp:CustomValidator ID="cvNoCode" runat="server" ForeColor="Red"
                            meta:resourcekey="cvNoCodeResource1"></asp:CustomValidator>
                        <asp:CustomValidator ID="cvLeaveNotInRange" runat="server" ForeColor="Red"
                            meta:resourcekey="cvLeaveNotInRangeResource1"></asp:CustomValidator>
                    </td>
                </tr>
                <tr>
                    <td style="white-space: nowrap;">
                        <asp:Label ID="lblDayHour" runat="server"
                            meta:resourcekey="lblDayHourResource1" Text="天(時)數"></asp:Label>
                    </td>
                    <td style="white-space: nowrap;">
                        <telerik:RadNumericTextBox ID="rdHr" runat="server" Width="50pt" DataType="System.Decimal" CssClass="RightAligned" Culture="zh-TW" DbValueFactor="1" LabelCssClass="" LabelWidth="64px" meta:resourcekey="rdHrResource1">
                            <NumberFormat DecimalDigits="1" ZeroPattern="n" />
                        </telerik:RadNumericTextBox>
                        <asp:Label ID="lblUnit" runat="server" meta:resourcekey="lblUnitResource1"
                            Text="Label"></asp:Label>
                        <asp:CustomValidator ID="cvHourDay" runat="server" ForeColor="Red"
                            meta:resourcekey="cvHourDayResource1"></asp:CustomValidator>
                    </td>
                </tr>
                <tr>
                    <td style="white-space: nowrap;">
                        <asp:Label ID="lSblReson" runat="server" Text="事由"
                            meta:resourcekey="lblResonResource1"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="lblRemark" runat="server"
                            meta:resourcekey="lblRemarkResource1"></asp:Label>
                    </td>
                </tr>
            </table>
            <asp:CustomValidator ID="cvCheckProbation" runat="server" Display="Dynamic" ErrorMessage="未滿足該假別的到職限制或無設定到職日，無法申請" meta:resourcekey="cvCheckProbationResource1"></asp:CustomValidator>
            <asp:CustomValidator ID="cvCheckNoLeaveCodeLimit" runat="server" Display="Dynamic" ErrorMessage="未符合此假別的申請及性別限制，無法申請" meta:resourcekey="cvCheckNoLeaveCodeLimitResource1"></asp:CustomValidator>

            <div style="display: none">
                <asp:Label ID="lblDay" runat="server" Text="天" Visible="False" meta:resourcekey="lblDayResource1"></asp:Label>
                <asp:Label ID="lblHour" runat="server" Text="小時" Visible="False" meta:resourcekey="lblHourResource1"></asp:Label>
                <asp:Label ID="lblSelect" runat="server" Text="請選擇" Visible="False" meta:resourcekey="lblSelectResource1"></asp:Label>
                <asp:Label ID="lblDayZero" runat="server" Text="請假天數必須大於0" meta:resourcekey="lblDayZeroResource1"></asp:Label>
                <asp:Label ID="lblHrZero" runat="server" Text="請假時數必須大於0" meta:resourcekey="lblHrZeroResource1"></asp:Label>
                <asp:Label ID="lblNoActiveLeave" runat="server" Text="原先假別已停用，請重新選擇" meta:resourcekey="lblNoActiveLeaveResource1"></asp:Label>
                <asp:Label ID="lblNoCode" runat="server" Text="請選擇假別" meta:resourcekey="lblNoCodeResource1"></asp:Label>
                <asp:Label ID="lblNoRemain" runat="server" Text="假別餘額不足" meta:resourcekey="lblNoRemainResource1"></asp:Label>
                <asp:Label ID="lblLeaCodeExist" runat="server" Text="假別已存在於扣假明細中，請重新選擇" meta:resourcekey="lblLeaCodeExistResource1"></asp:Label>
                <asp:Label ID="lblLeaveNotInRange" runat="server" Text="請假時間(訖)已超過可用年休使用期限" meta:resourcekey="lblLeaveNotInRangeResource1"></asp:Label>
            </div>
            <asp:HiddenField ID="hfGetUserGuid" runat="server" />
            <asp:HiddenField ID="hfStartDateTime" runat="server" />
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

