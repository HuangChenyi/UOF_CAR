<%@ Page Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="PMS_ReportBack_Task" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" Codebehind="Task.aspx.cs" %>

<%@ Register Src="../Common/UC_RemindTime.ascx" TagName="UC_RemindTime" TagPrefix="uc1" %>
<%@ Register Src="../Common/UC_TaskDetail.ascx" TagName="UC_TaskDetail" TagPrefix="uc4" %>
<%@ Register Src="../../Common/ChoiceCenter/UC_ChoiceList.ascx" TagName="UC_ChoiceList" TagPrefix="uc2" %>
<%@ Register Src="../../EIP/Calendar/Common/UC_PrivateEvent.ascx" TagName="UC_PrivateEvent" TagPrefix="uc5" %>
<%@ Register Src="~/Common/FileCenter/V3/UC_FileCenter.ascx" TagPrefix="uc6" TagName="UC_FileCenter" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <script type="text/javascript">
        function DialogAuditTrack() {
            var projGUID = $uof.tool.htmlDecode($('#<%= hidProjGUID.ClientID %>').val());
            var taskGUID = $uof.tool.htmlDecode($('#<%= hidTaskGUID.ClientID %>').val());
            var type = "Task";
            $uof.dialog.open2("~/PMS/Audit/Track.aspx", this, "", 450, 400, function () { return false; }, { "Type": type, "PROJECT_GUID": projGUID, "GUID": taskGUID });
            return false;
        }

        function DialogReportTrack() {
            var projGUID = $uof.tool.htmlDecode($('#<%= hidProjGUID.ClientID %>').val());
            var taskGUID = $uof.tool.htmlDecode($('#<%= hidTaskGUID.ClientID %>').val());
            var type = "Task";
            $uof.dialog.open2("~/PMS/ReportBack/Track.aspx", this, "", 800, 400, function () { return false; }, { "Type": type, "PROJECT_GUID": projGUID, "GUID": taskGUID });
            return false;
        }
    </script>

    <asp:CustomValidator ID="cvNoAuthority" runat="server" Display="Dynamic" ErrorMessage="您沒有回報任務的權限" meta:resourcekey="cvNoAuthorityResource1"></asp:CustomValidator>
    <asp:CustomValidator ID="cvProjectNotSet" runat="server" Display="Dynamic" ErrorMessage="該任務所屬專案不存在或已被刪除" meta:resourcekey="cvProjectNotSetResource1"></asp:CustomValidator>
    <asp:CustomValidator ID="cvDataSetNoRows" runat="server" Display="Dynamic" ErrorMessage="該任務不存在或已被刪除" meta:resourcekey="cvDataSetNoRowsResource1"></asp:CustomValidator>
    <asp:CustomValidator ID="cvDisableMSDTC" runat="server" Display="Dynamic"
        ErrorMessage=" 已停用分散式交易管理員 (MSDTC) 的網路存取，<br/>請通知系統管理員修正。"
        meta:resourcekey="cvDisableMSDTCResource1">
    </asp:CustomValidator>
    <asp:CustomValidator ID="cvMSDTCErr" runat="server" Display="Dynamic"
        ErrorMessage=" 分散式交易管理員 (MSDTC) 的網路存取發生錯誤，<br/>請通知系統管理員修正。"
        meta:resourcekey="cvMSDTCErrResource1">
    </asp:CustomValidator>

    <asp:CustomValidator ID="cvStastuTask" runat="server" Display="Dynamic" ErrorMessage="該任務已被修改,請重新查看任務狀態" meta:resourcekey="cvStastuTaskResource1"></asp:CustomValidator>
    <asp:CustomValidator ID="cvProjectStatuError" runat="server" Display="Dynamic" ErrorMessage="該專案狀態已被修改,請重新查看專案狀態" meta:resourcekey="cvProjectStatuErrorResource1"></asp:CustomValidator>
    <asp:CustomValidator ID="cvAuditorError" runat="server" Display="Dynamic" ErrorMessage="階段/專案負責人資料不存在, 無法送審"></asp:CustomValidator>
    <table width="100%">
        <tr>
            <td style="vertical-align: top; width: 50%;">
                <uc4:UC_TaskDetail ID="UC_TaskDetail1" runat="server" ReadOnly="true" />
            </td>
            <td style="vertical-align: top;">
                <asp:Label ID="lblDataSetNoRowsMsg" runat="server" Text="該任務不存在或已被刪除。" ForeColor="Blue" meta:resourcekey="lblDataSetNoRowsMsgResource1"></asp:Label>
                <asp:Label ID="lblDirectorChangeMsg" runat="server" Text="該任務負責人已被更換。" ForeColor="Blue" meta:resourcekey="lblDirectorChangeMsgResource1"></asp:Label>
                <asp:Label ID="lblStatusNotReport" runat="server" Text="審核中或已完成的任務不可做回報" ForeColor="Blue" meta:resourcekey="lblStatusNotReportResource1"></asp:Label>
                <asp:Label ID="lblSuspendProjMsg" runat="server" Text="該專案已中止，其任務不可回報" ForeColor="Blue" meta:resourcekey="lblSuspendProjMsgResource1"></asp:Label>
                <asp:Label ID="lblDirectorNotFound" runat="server" ForeColor="Red"
                    Text="無法回報任務!! 可能是審核者帳號已失效,請洽系統管理員."
                    meta:resourcekey="lblDirectorNotFoundResource1"></asp:Label>
                <asp:Panel ID="panReportTask" runat="server" meta:resourcekey="panReportTaskResource1">
                    <table class="PopTable" cellspacing="1">
                        <tr>
                            <td style="white-space: nowrap;">
                                <span style="color: #ff0000">*</span><asp:Label ID="Label14" runat="server" Text="回報狀態" meta:resourcekey="Label14Resource1"></asp:Label></td>
                            <td>
                                <asp:RadioButtonList ID="rbtStatus" runat="server" AutoPostBack="True" OnSelectedIndexChanged="rbtStatus_SelectedIndexChanged" meta:resourcekey="rbtStatusResource1">
                                    <asp:ListItem Text="尚未開始" Value="NotYetBegin" meta:resourcekey="ListItemResource1"></asp:ListItem>
                                    <asp:ListItem Text="進行中" Value="Proceeding" meta:resourcekey="ListItemResource2"></asp:ListItem>
                                    <asp:ListItem Text="已完成" Value="Completed" meta:resourcekey="ListItemResource3"></asp:ListItem>
                                </asp:RadioButtonList>
                                <asp:RequiredFieldValidator ID="rfvStatus" runat="server" ControlToValidate="rbtStatus"
                                    Display="Dynamic" ErrorMessage="請選擇回報狀態" meta:resourcekey="rfvStatusResource1">
                                </asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="Label17" runat="server" Text="回報說明" meta:resourcekey="Label17Resource1"></asp:Label></td>
                            <td>
                                <asp:TextBox ID="txtReportDesc" runat="server" TextMode="MultiLine" Rows="3" Columns="20" Width="100%" meta:resourcekey="txtReportDescResource1"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td>
                                <span style="color: #ff0000">*</span><asp:Label ID="Label20" runat="server" Text="回報進度" meta:resourcekey="Label20Resource1"></asp:Label></td>
                            <td>
                                <asp:TextBox ID="txtCompleteRate" runat="server" Columns="1" MaxLength="3" meta:resourcekey="txtCompleteRateResource1"></asp:TextBox>%<asp:RangeValidator
                                    ID="rvRate" runat="server" ControlToValidate="txtCompleteRate" ErrorMessage="請輸入0~100的整數"
                                    MaximumValue="100" MinimumValue="0" Type="Integer" meta:resourcekey="rvRateResource1"></asp:RangeValidator></td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="Label32" runat="server" Text="回報附件" meta:resourcekey="Label32Resource1"></asp:Label></td>
                            <td>                                
                                <uc6:UC_FileCenter runat="server" ID="UC_FileCenter" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="Label37" runat="server" Text="回報者" meta:resourcekey="Label37Resource1"></asp:Label></td>
                            <td>
                                <asp:Label ID="lblReporter" runat="server" meta:resourcekey="lblReporterResource1"></asp:Label></td>
                        </tr>
                    </table>
                </asp:Panel>
                <table class="PopTable" cellspacing="1">
                    <tr>
                        <td>
                            <asp:Label ID="Label1" runat="server" Text="私人" meta:resourcekey="Label1Resource1"></asp:Label>
                        </td>
                        <td>
                            <uc5:UC_PrivateEvent ID="UC_PrivateEvent1" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label23" runat="server" Text="任務開始前提醒時間" meta:resourcekey="Label23Resource1"></asp:Label></td>
                        <td>
                            <uc1:UC_RemindTime ID="UC_RemindTime1" runat="server" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>

    <asp:Label ID="lblReportTrack" runat="server" Text="回報歷程" Visible="False" meta:resourcekey="lblReportTrackResource1"></asp:Label>
    <asp:Label ID="lblAuditTrack" runat="server" Text="審核歷程" Visible="False" meta:resourcekey="lblAuditTrackResource1"></asp:Label>
    <asp:Label ID="lblDeleteMsg" runat="server" Text="刪除" Visible="False" meta:resourcekey="lblDeleteMsgResource1"></asp:Label>

    <asp:HiddenField ID="hidTaskGUID" runat="server" />
    <asp:HiddenField ID="hidProjGUID" runat="server" />
    <asp:HiddenField ID="hidScheduleGUID" runat="server" />
    <asp:HiddenField ID="hidAllowOK" runat="server" value="true" />
    <asp:HiddenField ID="hidAllowDelete" runat="server" value="false" />
    <asp:HiddenField ID="hidReadReportTrack" runat="server" value="true" />
    <asp:HiddenField ID="hidReadAuditTrack" runat="server" value="true" />
</asp:Content>

