<%@ Page Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="PMS_Maintain_TaskDetail" Title="" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" Codebehind="TaskDetail.aspx.cs" %>

<%@ Register Src="../Common/UC_TaskDetail.ascx" TagName="UC_TaskDetail" TagPrefix="uc1" %>
<%@ Register Src="~/Common/FileCenter/V3/UC_FileCenter.ascx" TagPrefix="uc2" TagName="UC_FileCenter" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <script type="text/javascript">

        function DialogAuditOutcome() {//審核
            var ProjGUID = $uof.tool.htmlDecode($('#<%= hidProjGUID.ClientID %>').val());
            var GUID = $uof.tool.htmlDecode($('#<%= hidGUID.ClientID %>').val());
            var Type = "Task";
            var mode = "Audit";
            var auditGUID = $uof.tool.htmlDecode($('#<%= hidAuditGUID.ClientID %>').val());
            $uof.dialog.open2("~/PMS/Audit/Outcome.aspx", this, "", 500, 400,
                function openDialogResult(returnValue) {
                    if (typeof (returnValue) == "undefined") {
                        return false;
                    }
                    $uof.dialog.set_returnValue("AuditOutcome");
                    $uof.dialog.close();
                    return true;
                },
                { "PROJECT_GUID": ProjGUID, "GUID": GUID, "Type": Type, "Mode": mode, "AUDIT_GUID": auditGUID });
            return false;
        }

        function DialogAuditTrack() {
            var projGUID = $uof.tool.htmlDecode($('#<%= hidProjGUID.ClientID %>').val());
            var strGUID = $uof.tool.htmlDecode($('#<%= hidGUID.ClientID %>').val());
            var strType = "Task";
            $uof.dialog.open2("~/PMS/Audit/Track.aspx", this, "", 500, 400, function () { return false; }, { "PROJECT_GUID": projGUID, "Type": strType, "GUID": strGUID });
            return false;
        }

        function DialogReportTrack() {
            var projGUID = $uof.tool.htmlDecode($('#<%= hidProjGUID.ClientID %>').val());
            var GUID = $('#<% = hidGUID.ClientID %>').val();
            var Type = "Task";
            $uof.dialog.open2("~/PMS/ReportBack/Track.aspx", this, "", 800, 400, function () { return false; }, { "PROJECT_GUID": projGUID, "Type": Type, "GUID": GUID });
            return false;
        }

        function DialogUrge() {
            var projGUID = $uof.tool.htmlDecode($('#<%= hidProjGUID.ClientID %>').val());
            var GUID = $('#<% = hidGUID.ClientID %>').val();            
            $uof.dialog.open2("~/PMS/Maintain/Urge.aspx", this, "", 500, 400, function () { return false; }, { "PROJECT_GUID": projGUID, "GUID": GUID });
            return false;
        }

        function DialogRemind() {
            var projGUID = $uof.tool.htmlDecode($('#<%= hidProjGUID.ClientID %>').val());
            var GUID = $('#<% = hidGUID.ClientID %>').val();
            $uof.dialog.open2("~/PMS/Maintain/Remind.aspx", this, "", 500, 300, function () { return false; }, { "PROJECT_GUID": projGUID, "TaskGUID": GUID });
            return false;
        }

        function Button4Click() {
            return confirm('<%=lblDelConfirmMsg.Text %>');
        }
    </script>   
    <asp:CustomValidator ID="cvMessage" runat="server" Display="Dynamic" meta:resourcekey="cvMessageResource1"></asp:CustomValidator>
    <uc1:UC_TaskDetail ID="ucTaskDetail" runat="server"></uc1:UC_TaskDetail>
    <asp:Label ID="lblEmptyMsg" runat="server" Text="沒有資料" Visible="False" meta:resourcekey="lblEmptyMsgResource1"></asp:Label>
    <asp:Label ID="lblReportTrack" runat="server" Text="回報歷程" Visible="False" meta:resourcekey="lblReportTrackResource1"></asp:Label>
    <asp:Label ID="lblAuditTrack" runat="server" Text="審核歷程" Visible="False" meta:resourcekey="lblAuditTrackResource1"></asp:Label>
    <asp:Label ID="lblAudit" runat="server" Text="審核" Visible="False" meta:resourcekey="lblAuditResource1"></asp:Label>
    <asp:Label ID="lblUrgeMsg" runat="server" Text="稽催" Visible="False" meta:resourcekey="lblUrgeMsgResource1"></asp:Label>
    <asp:Label ID="lblRemindMsg" runat="server" Text="提醒" Visible="False" meta:resourcekey="lblRemindMsgResource1"></asp:Label>
    <asp:Label ID="lblDelMsg" runat="server" Text="刪除" Visible="False" meta:resourcekey="lblDelMsgResource1"></asp:Label>
    <asp:Label ID="lblDelConfirmMsg" runat="server" Text="確定要刪除嗎？" Visible="False" meta:resourcekey="lblDelConfirmMsgResource1"></asp:Label>
    <asp:Label ID="lblRemindConfirmMsg" runat="server" Text="確定要提醒嗎？" Visible="False" meta:resourcekey="lblRemindConfirmMsgResource1"></asp:Label>
    <asp:Label ID="lblUrgeConfirmMsg" runat="server" Text="確定要送審嗎？" Visible="False" meta:resourcekey="lblUrgeConfirmMsgResource1"></asp:Label>
    <asp:Label ID="lblDelNotAllowedStatusMsg" runat="server" Text="{0}狀態的任務不能被刪除" Visible="False" meta:resourcekey="lblDelNotAllowedStatusMsgResource1"></asp:Label>
    <asp:Label ID="lblDelNoAuthorityMsg" runat="server" Text="您沒有刪除該任務的權限" Visible="False" meta:resourcekey="lblDelNoAuthorityMsgResource1"></asp:Label>
    <asp:Label ID="lblCreateChildNotAllowedStatusMsg" runat="server" Text="只有「尚未開始、進行中」狀態的階段可以新增子任務" Visible="False" meta:resourcekey="lblCreateChildNotAllowedStatusMsgResource1"></asp:Label>
    <asp:Label ID="lblUpdateNotAllowedStatusMsg" runat="server" Text="{0}狀態的任務不能被修改" Visible="False" meta:resourcekey="lblUpdateNotAllowedStatusMsgResource1"></asp:Label>
    <asp:Label ID="lblAddNotAllowedStatusMsg" runat="server" Text="{0}狀態的專案不能新增任務！" Visible="False" meta:resourcekey="lblAddNotAllowedStatusMsgResource1"></asp:Label>
    <asp:Label ID="lblNoAuthorityMsg" runat="server" Text="您沒有操作權限。" Visible="False" meta:resourcekey="lblNoAuthorityMsgResource1"></asp:Label>
    <asp:Label ID="lblProjectNotSetMsg" runat="server" Text="該任務所屬專案不存在或已被刪除。" Visible="False" meta:resourcekey="lblProjectNotSetMsgResource1"></asp:Label>
    <asp:Label ID="lblDataSetNoRowsMsg" runat="server" Text="該任務不存在或已被刪除。" Visible="False" meta:resourcekey="lblDataSetNoRowsMsgResource1"></asp:Label>

    <asp:Label ID="lblTaskNameEmptyMsg" runat="server" Text="請輸入任務名稱" Visible="False" meta:resourcekey="lblTaskNameEmptyMsgResource1"></asp:Label>
    <asp:Label ID="lblPredStartEmptyMsg" runat="server" Text="請選擇預計開始日" Visible="False" meta:resourcekey="lblPredStartEmptyMsgResource1"></asp:Label>
    <asp:Label ID="lblPredEndEmptyMsg" runat="server" Text="請選擇預計完成日" Visible="False" meta:resourcekey="lblPredEndEmptyMsgResource1"></asp:Label>
    <asp:Label ID="lblChoiceListEmptyMsg" runat="server" Text="請選擇任務負責人" Visible="False" meta:resourcekey="lblChoiceListEmptyMsgResource1"></asp:Label>
    <asp:Label ID="lblDateErrMsg" runat="server" Text="預計開始時間晚於預計結束時閒，請重新輸入" Visible="False" meta:resourcekey="lblDateErrMsgResource1"></asp:Label>

    <asp:HiddenField ID="hidProjGUID" runat="server" />
    <asp:HiddenField ID="hidProjName" runat="server" />
    <asp:HiddenField ID="hidIsDelay" runat="server" />
    <asp:HiddenField ID="hidTaskStatus" runat="server" />
    <asp:HiddenField ID="hidParentSeriesGUID" runat="server" />
    <asp:HiddenField ID="hidParentSeriesStatus" runat="server" />
    <asp:HiddenField ID="hidProjStatus" runat="server" />
    <asp:HiddenField ID="hidGUID" runat="server" />
    <asp:HiddenField ID="hidMode" runat="server" />
    <asp:HiddenField ID="hidSEQ" runat="server" />
    <asp:HiddenField ID="hidAuditGUID" runat="server" />
    <asp:Label ID="lblDraftStatus" runat="server" Text="草稿" Visible="False" meta:resourcekey="lblDraftStatusResource1"></asp:Label>
    <asp:Label ID="lblNotYetBeginStatus" runat="server" Text="尚未開始" Visible="False" meta:resourcekey="lblNotYetBeginStatusResource1"></asp:Label>
    <asp:Label ID="lblProceedingStatus" runat="server" Text="進行中" Visible="False" meta:resourcekey="lblProceedingStatusResource1"></asp:Label>
    <asp:Label ID="lblAuditStatus" runat="server" Text="審核中" Visible="False" meta:resourcekey="lblAuditStatusResource1"></asp:Label>
    <asp:Label ID="lblSuspendStatus" runat="server" Text="已中止" Visible="False" meta:resourcekey="lblSuspendStatusResource1"></asp:Label>
    <asp:Label ID="lblCloseStatus" runat="server" Text="已結案" Visible="False" meta:resourcekey="lblCloseStatusResource1"></asp:Label>
    <asp:Label ID="lblDisableMSDTCMsg" runat="server" Text=" 已停用分散式交易管理員 (MSDTC) 的網路存取，<br/>請通知系統管理員修正。" Visible="false"></asp:Label>
    <asp:Label ID="lblMSDTCErrMsg" runat="server" Text=" 分散式交易管理員 (MSDTC) 的網路存取發生錯誤，<br/>請通知系統管理員修正。" Visible="false"></asp:Label>

</asp:Content>

