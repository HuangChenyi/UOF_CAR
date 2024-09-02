<%@ Control Language="C#" AutoEventWireup="true" Inherits="PMS_Common_UC_ProjectMaintainToolbar" Codebehind="UC_ProjectMaintainToolbar.ascx.cs" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<script type="text/javascript" id="telerikClientEvents1">
	function RadToolBar1_ButtonClicking(sender,args)
	{
	    var projGUID = $('#<%= hidProjGUID.ClientID %>').val();
	    var value = args.get_item().get_value();

	    switch (value)
	    {
	        case "btnCreate"://新增專案
	            var Create = "Create";
	            args.set_cancel(true);
	            $uof.dialog.open2("~/PMS/Maintain/CreateProject.aspx", args.get_item(), "", 600, 600, openDialogResult, { "Mode": "Create" });
	            break;

	        case "btnExportExcel"://匯出Excel
	            var frame = "<iframe style=display:none src='../Query/ExportExcel.aspx?PROJECT_GUID=" + projGUID + "'></iframe>";
	            $('body').prepend(frame);
	            break;

	        case "btnProjectSetting"://專案設定
	            var AuditTrack = $('#<%= hidAuditTrack.ClientID %>').val();
	            var Update = "Update";
	           
	            if ($('#<%= hidProjView.ClientID %>').val() == "True") {
	                Update = "Show";
	            }
	            $uof.dialog.open2("~/PMS/Maintain/ProjectSetting.aspx", args.get_item(), "", 500, 665, openDialogResult,
                    { "Mode": Update, "PROJECT_GUID": projGUID, "AuditTrack": AuditTrack });
	            break;

	        case "btnGanttChart"://甘特圖
	            args.set_cancel(true);
	            $uof.dialog.open2("~/PMS/Query/GanttChart.aspx", args.get_item(), "", 1000, 600, function () { return false; }, { "PROJECT_GUID": projGUID });
	            break;

	        case "btnAudit"://送審專案
	            args.set_cancel(!confirm('<%=lblAuditMsg.Text %>'));
	            break;

	        case "btnStart"://啟動專案
	            args.set_cancel(!confirm('<%=lblStartMsg.Text %>'));
	            break;

	        case "btnSuspend"://中止專案
	            args.set_cancel(!confirm('<%=lblSuspendMsg.Text %>'));
	            break;

	        case "btnDelete"://專案刪除
	            args.set_cancel(!confirm('<%=lblDeleteMsg.Text %>'));
	            break;

	        case "btnClose"://專案結案
	            args.set_cancel(!confirm('<%=lblCloseMsg.Text %>'));
	            break;

	        case "btnAuditTrack"://審核歷程
	            var strType = "Project";
	            args.set_cancel(true);
	            $uof.dialog.open2("~/PMS/Audit/Track.aspx", args.get_item(), "", 500, 400, function () { return false; }, { "PROJECT_GUID": projGUID, "Type": strType, "GUID": projGUID });
	            break;

	        case "btnAuditProj"://審核專案
	            var strType = "Project";
	            var strMode = "Audit";
	            var strAuditGUID = $('#<%= hidAuditGUID.ClientID %>').val();
	                args.set_cancel(true);
	                $uof.dialog.open2("~/PMS/Audit/Outcome.aspx", args.get_item(), "", 500, 400, openDialogResult,
                        { "PROJECT_GUID": projGUID, "Type": strType, "GUID": projGUID, "AUDIT_GUID": strAuditGUID });
	            break;
	    }

	}

    function openDialogResult(returnValue){
        if (typeof (returnValue) == "undefined") {
            return false;
        }
        return true;
    }
</script>

<div style="padding-left: 0px; padding-top: 0px">
    <telerik:RadToolBar ID="barProject" runat="server" Width="100%" OnClientButtonClicking="RadToolBar1_ButtonClicking" OnButtonClick="barProject_ButtonClick" meta:resourcekey="barProjectResource1">
        <Items>
            <telerik:RadToolBarButton runat="server" Text="新增專案" Value="btnCreate"
                 ClickedImageUrl="~/Common/images/icon/icon_m161.gif" DisabledImageUrl="~/Common/images/icon/icon_m161.gif"
                 HoveredImageUrl="~/Common/images/icon/icon_m161.gif" ImageUrl="~/Common/images/icon/icon_m161.gif" meta:resourcekey="RadToolBarButtonResource1">
            </telerik:RadToolBarButton>
            <telerik:RadToolBarButton runat="server" IsSeparator="true" Value="sep6" meta:resourcekey="RadToolBarButtonResource2">
            </telerik:RadToolBarButton>
            <telerik:RadToolBarButton runat="server" Text="審核" Value="btnAuditProj"
                ClickedImageUrl="~/Common/images/icon/icon_m161.gif" DisabledImageUrl="~/Common/images/icon/icon_m161.gif"
                 HoveredImageUrl="~/Common/images/icon/icon_m161.gif" ImageUrl="~/Common/images/icon/icon_m161.gif" meta:resourcekey="RadToolBarButtonResource3">
            </telerik:RadToolBarButton>
            <telerik:RadToolBarButton runat="server" IsSeparator="true" Value="sep10" meta:resourcekey="RadToolBarButtonResource4">
            </telerik:RadToolBarButton>
            <telerik:RadToolBarButton runat="server" Text="Excel匯出" Value="btnExportExcel"
                ClickedImageUrl="~/Common/images/icon/icon_m110.gif" DisabledImageUrl="~/Common/images/icon/icon_m110.gif"
                 HoveredImageUrl="~/Common/images/icon/icon_m110.gif" ImageUrl="~/Common/images/icon/icon_m110.gif" meta:resourcekey="RadToolBarButtonResource5">
            </telerik:RadToolBarButton>
            <telerik:RadToolBarButton runat="server" IsSeparator="true" meta:resourcekey="RadToolBarButtonResource6">
            </telerik:RadToolBarButton>
            <telerik:RadToolBarButton runat="server" Text="專案送審" Value="btnAudit"
                ClickedImageUrl="~/Common/images/icon/icon_m157.gif" DisabledImageUrl="~/Common/images/icon/icon_m157.gif"
                 HoveredImageUrl="~/Common/images/icon/icon_m157.gif" ImageUrl="~/Common/images/icon/icon_m157.gif" meta:resourcekey="RadToolBarButtonResource7">
            </telerik:RadToolBarButton>
            <telerik:RadToolBarButton runat="server" IsSeparator="true" Value="sep8" meta:resourcekey="RadToolBarButtonResource8">
            </telerik:RadToolBarButton>
            <telerik:RadToolBarButton runat="server" Text="專案起動" Value="btnStart"
                ClickedImageUrl="~/Common/images/icon/icon_m165.gif" DisabledImageUrl="~/Common/images/icon/icon_m165.gif"
                 HoveredImageUrl="~/Common/images/icon/icon_m165.gif" ImageUrl="~/Common/images/icon/icon_m165.gif" meta:resourcekey="RadToolBarButtonResource9">
            </telerik:RadToolBarButton>
            <telerik:RadToolBarButton runat="server" IsSeparator="true" Value="sep1" meta:resourcekey="RadToolBarButtonResource10">
            </telerik:RadToolBarButton>
            <telerik:RadToolBarButton runat="server" Text="專案中止" Value="btnSuspend"
                ClickedImageUrl="~/Common/images/icon/icon_m168.gif" DisabledImageUrl="~/Common/images/icon/icon_m168.gif"
                 HoveredImageUrl="~/Common/images/icon/icon_m168.gif" ImageUrl="~/Common/images/icon/icon_m168.gif" meta:resourcekey="RadToolBarButtonResource11">
            </telerik:RadToolBarButton>
            <telerik:RadToolBarButton runat="server" IsSeparator="true" Value="sep2" meta:resourcekey="RadToolBarButtonResource12">
            </telerik:RadToolBarButton>
            <telerik:RadToolBarButton runat="server" Text="專案刪除" Value="btnDelete"
                ClickedImageUrl="~/Common/images/icon/icon_m46.gif" DisabledImageUrl="~/Common/images/icon/icon_m46.gif"
                 HoveredImageUrl="~/Common/images/icon/icon_m46.gif" ImageUrl="~/Common/images/icon/icon_m46.gif" meta:resourcekey="RadToolBarButtonResource13">
            </telerik:RadToolBarButton>
            <telerik:RadToolBarButton runat="server" IsSeparator="true" Value="sep3" meta:resourcekey="RadToolBarButtonResource14">
            </telerik:RadToolBarButton>
            <telerik:RadToolBarButton runat="server" Text="專案結案" Value="btnClose"
                ClickedImageUrl="~/Common/images/icon/icon_m172.gif" DisabledImageUrl="~/Common/images/icon/icon_m172.gif"
                 HoveredImageUrl="~/Common/images/icon/icon_m172.gif" ImageUrl="~/Common/images/icon/icon_m172.gif" meta:resourcekey="RadToolBarButtonResource15">
            </telerik:RadToolBarButton>
            <telerik:RadToolBarButton runat="server" IsSeparator="true" Value="sep7" meta:resourcekey="RadToolBarButtonResource16">
            </telerik:RadToolBarButton>
            <telerik:RadToolBarButton runat="server" Text="專案設定" Value="btnProjectSetting"
                ClickedImageUrl="~/Common/images/icon/icon_m43.gif" DisabledImageUrl="~/Common/images/icon/icon_m43.gif"
                 HoveredImageUrl="~/Common/images/icon/icon_m43.gif" ImageUrl="~/Common/images/icon/icon_m43.gif" meta:resourcekey="RadToolBarButtonResource17">
            </telerik:RadToolBarButton>
            <telerik:RadToolBarButton runat="server" IsSeparator="true" Value="sep4" meta:resourcekey="RadToolBarButtonResource18">
            </telerik:RadToolBarButton>
            <telerik:RadToolBarButton runat="server" Text="審核歷程" Value="btnAuditTrack"
                ClickedImageUrl="~/Common/images/icon/icon_m160.gif" DisabledImageUrl="~/Common/images/icon/icon_m160.gif"
                 HoveredImageUrl="~/Common/images/icon/icon_m160.gif" ImageUrl="~/Common/images/icon/icon_m160.gif" meta:resourcekey="RadToolBarButtonResource19">
            </telerik:RadToolBarButton>
            <telerik:RadToolBarButton runat="server" IsSeparator="true" Value="sep9" meta:resourcekey="RadToolBarButtonResource20">
            </telerik:RadToolBarButton>
            <telerik:RadToolBarButton runat="server" Text="專案甘特圖" Value="btnGanttChart"
                ClickedImageUrl="~/Common/images/icon/icon_m160.gif" DisabledImageUrl="~/Common/images/icon/icon_m160.gif"
                 HoveredImageUrl="~/Common/images/icon/icon_m160.gif" ImageUrl="~/Common/images/icon/icon_m160.gif" meta:resourcekey="RadToolBarButtonResource21">
            </telerik:RadToolBarButton>
            <telerik:RadToolBarButton runat="server" IsSeparator="true" Value="sep5" meta:resourcekey="RadToolBarButtonResource22">
            </telerik:RadToolBarButton>
        </Items>
    </telerik:RadToolBar>

<asp:CustomValidator ID="CustomValidator1" runat="server" ValidationGroup="Maintain" Display="None" ForeColor="Red" Visible="False" meta:resourcekey="CustomValidator1Resource1"></asp:CustomValidator>
<asp:HiddenField ID="hidEnable" runat="server" value="True" />
<asp:HiddenField ID="hidReadOnly" runat="server" value="False" />
<asp:HiddenField ID="hidProjGUID" runat="server" value="" />
<asp:HiddenField ID="hidPmRmId" runat="server" value="" />
<asp:HiddenField ID="hidAuditorGUID" runat="server" value="" />
<asp:HiddenField ID="hidProjStatus" runat="server" value="" />
<asp:HiddenField ID="hidProjView" runat="server" value="" />
<asp:HiddenField ID="hidAuditTrack" runat="server" value="" />
<asp:HiddenField ID="hidAuditGUID" runat="server" value="" />
<asp:Label ID="lblProjMsg" runat="server" Text="專案資訊" Visible="False" meta:resourcekey="lblProjMsgResource1"></asp:Label>
<asp:Label ID="lblProjAuditMsg" runat="server" Text="專案送審" Visible="False" meta:resourcekey="lblProjAuditMsgResource1"></asp:Label>
<asp:Label ID="lblProjStartMsg" runat="server" Text="專案起動" Visible="False" meta:resourcekey="lblProjStartMsgResource1"></asp:Label>
<asp:Label ID="lblAuditMsg" runat="server" Text="選擇確定後該專案將立即送審，請問您是否確定要繼續？" Visible="False" meta:resourcekey="lblAuditMsgResource1"></asp:Label>
<asp:Label ID="lblStartMsg" runat="server" Text="選擇確定後該專案將立即啟動，請問您是否確定要繼續？" Visible="False" meta:resourcekey="lblStartMsgResource1"></asp:Label>
<asp:Label ID="lblSuspendMsg" runat="server" Text="選擇確定後該專案將立即中止，請問您是否確定要繼續？" Visible="False" meta:resourcekey="lblSuspendMsgResource1"></asp:Label>
<asp:Label ID="lblCloseMsg" runat="server" Text="選擇確定後該專案將立即結案，請問您是否確定要繼續？" Visible="False" meta:resourcekey="lblCloseMsgResource1"></asp:Label>
<asp:Label ID="lblDeleteMsg" runat="server" Text="選擇確定後該專案將立即刪除，包含該專案的所有相關資料將一併被刪除，請問您是否確定要繼續？" Visible="False" meta:resourcekey="lblDeleteMsgResource1"></asp:Label> 
<asp:Label ID="lblDeleteNoAuthorityMsg" runat="server" Text="您沒有刪除該專案的權限！" Visible="False" meta:resourcekey="lblDeleteNoAuthorityMsgResource1"></asp:Label>
<asp:Label ID="lblDeleteNotAllowedStatusMsg" runat="server" Text="{0}狀態的專案不允許被刪除！" Visible="False" meta:resourcekey="lblDeleteNotAllowedStatusMsgResource1"></asp:Label>
<asp:Label ID="lblAuditNoAuthorityMsg" runat="server" Text="您沒有送審該專案的權限！" Visible="False" meta:resourcekey="lblAuditNoAuthorityMsgResource1"></asp:Label>
<asp:Label ID="lblStartNoAuthorityMsg" runat="server" Text="您沒有起動該專案的權限！" Visible="False" meta:resourcekey="lblStartNoAuthorityMsgResource1"></asp:Label>
<asp:Label ID="lblAuditNotAllowedStatusMsg" runat="server" Text="{0}狀態的專案不允許被送審！" Visible="False" meta:resourcekey="lblAuditNotAllowedStatusMsgResource1"></asp:Label>
<asp:Label ID="lblStartNotAllowedStatusMsg" runat="server" Text="{0}狀態的專案不允許被起動！" Visible="False" meta:resourcekey="lblStartNotAllowedStatusMsgResource1"></asp:Label>
<asp:Label ID="lblAuditProjIncompleteMsg" runat="server" Text="該專案沒有預計時程，不允許被送審！" Visible="False" meta:resourcekey="lblAuditProjIncompleteMsgResource1"></asp:Label>
<asp:Label ID="lblStartProjIncompleteMsg" runat="server" Text="該專案沒有預計時程，不允許被起動！" Visible="False" meta:resourcekey="lblStartProjIncompleteMsgResource1"></asp:Label>
<asp:Label ID="lblNoAuditorNotAuditMsg" runat="server" Text="該專案沒有設定審核者，不允許送審！" Visible="False" meta:resourcekey="lblNoAuditorNotAuditMsgResource1"></asp:Label>
<asp:Label ID="lblAuditorNotStartMsg" runat="server" Text="該專案已設定審核者，不允許直接起動！" Visible="False" meta:resourcekey="lblAuditorNotStartMsgResource1"></asp:Label>
<asp:Label ID="lblAuditTaskNoDateMsg" runat="server" Text="該專案有未設定日期的任務，不允許送審！" Visible="False" meta:resourcekey="lblAuditTaskNoDateMsgResource1"></asp:Label>
<asp:Label ID="lblStartTaskNoDateMsg" runat="server" Text="該專案有未設定日期的任務，不允許起動！" Visible="False" meta:resourcekey="lblStartTaskNoDateMsgResource1"></asp:Label>
<asp:Label ID="lblAuditNoTaskMsg" runat="server" Text="該專案至少需包含一個以上的任務，否則不允許送審" Visible="False" meta:resourcekey="lblAuditNoTaskMsgResource1"></asp:Label>
<asp:Label ID="lblStartNoTaskMsg" runat="server" Text="該專案至少需包含一個以上的任務，否則不允許起動" Visible="False" meta:resourcekey="lblStartNoTaskMsgResource1"></asp:Label>
<asp:Label ID="lblSuspendNoAuthorityMsg" runat="server" Text="您沒有中止該專案的權限！" Visible="False" meta:resourcekey="lblSuspendNoAuthorityMsgResource1"></asp:Label>
<asp:Label ID="lblSuspendNotAllowedStatusMsg" runat="server" Text="{0}狀態的專案不允許被中止！" Visible="False" meta:resourcekey="lblSuspendNotAllowedStatusMsgResource1"></asp:Label>
<asp:Label ID="lblCloseNoAuthorityMsg" runat="server" Text="您沒有結束該專案的權限！" Visible="False" meta:resourcekey="lblCloseNoAuthorityMsgResource1"></asp:Label>
<asp:Label ID="lblCloseNotAllowedStatusMsg" runat="server" Text="{0}狀態的專案不允許被結案！" Visible="False" meta:resourcekey="lblCloseNotAllowedStatusMsgResource1"></asp:Label>
<asp:Label ID="lblCloseUnCompleteMsg" runat="server" Text="該專案的工作項目尚未全部完成，不允許被結案！" Visible="False" meta:resourcekey="lblCloseUnCompleteMsgResource1"></asp:Label>
    <asp:Label ID="lblNoProjectMsg" runat="server" Text="請選擇專案" Visible="False" meta:resourcekey="lblNoProjectMsgResource1"></asp:Label>
   <asp:Label ID="lblActionAlertMsg" runat="server" Text="[{0}]專案已經{1}" Visible="False" meta:resourcekey="lblActionAlertMsgResource1"></asp:Label> 
   <asp:Label ID="lblStart" runat="server" Text="起動" Visible="False" meta:resourcekey="lblStartResource1"></asp:Label> 
   <asp:Label ID="lblSendAudit" runat="server" Text="送審" Visible="False" meta:resourcekey="lblSendAuditResource1"></asp:Label> 
   <asp:Label ID="lblDelete" runat="server" Text="刪除" Visible="False" meta:resourcekey="lblDeleteResource1"></asp:Label> 
   <asp:Label ID="lblSuspend" runat="server" Text="中止" Visible="False" meta:resourcekey="lblSuspendResource1"></asp:Label> 
   <asp:Label ID="lblClose" runat="server" Text="結案" Visible="False" meta:resourcekey="lblCloseResource1"></asp:Label> 
    <asp:Label ID="lblDraftStatus" runat="server" Text="草稿" Visible="False" meta:resourcekey="lblDraftStatusResource1"></asp:Label>
   <asp:Label ID="lblNotYetBeginStatus" runat="server" Text="尚未開始" Visible="False" meta:resourcekey="lblNotYetBeginStatusResource1"></asp:Label>
   <asp:Label ID="lblProceedingStatus" runat="server" Text="進行中" Visible="False" meta:resourcekey="lblProceedingStatusResource1"></asp:Label> 
   <asp:Label ID="lblAuditStatus" runat="server" Text="審核中" Visible="False" meta:resourcekey="lblAuditStatusResource1"></asp:Label> 
   <asp:Label ID="lblSuspendStatus" runat="server" Text="已中止" Visible="False" meta:resourcekey="lblSuspendStatusResource1"></asp:Label> 
   <asp:Label ID="lblCloseStatus" runat="server" Text="已結案" Visible="False" meta:resourcekey="lblCloseStatusResource1"></asp:Label> 
   
    <asp:Label ID="lblDisableMSDTCMsg" runat="server" Text=" 已停用分散式交易管理員 (MSDTC) 的網路存取，<br/>請通知系統管理員修正。" Visible="False" meta:resourcekey="lblDisableMSDTCMsgResource1"></asp:Label> 
   <asp:Label ID="lblMSDTCErrMsg" runat="server" Text=" 分散式交易管理員 (MSDTC) 的網路存取發生錯誤，<br/>請通知系統管理員修正。" Visible="False" meta:resourcekey="lblMSDTCErrMsgResource1"></asp:Label>  
</div>