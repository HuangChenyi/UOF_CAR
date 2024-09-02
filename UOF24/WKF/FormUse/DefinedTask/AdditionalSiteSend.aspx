<%@ Page Title="" Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="WKF_FormUse_DefinedTask_AdditionalSiteSend" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" Codebehind="AdditionalSiteSend.aspx.cs" %>

<%@ Register Src="../../../Common/ChoiceCenter/UC_ChoiceOnce.ascx" TagName="UC_ChoiceOnce" TagPrefix="uc2" %>
<%@ Register Src="../../../Common/ChoiceCenter/UC_BtnChoiceOnce.ascx" TagName="UC_BtnChoiceOnce" TagPrefix="uc3" %>
<%@ Register Src="../../../Common/ChoiceCenter/UC_ChoiceList.ascx" TagName="UC_ChoiceList" TagPrefix="uc1" %>
<%@ Register Src="~/WKF/FlowManagement/UC_SignDirections.ascx" TagPrefix="uc1" TagName="UC_SignDirections" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <style>
        .panelDiv {padding:0px;border:solid 1px black;vertical-align:top;display:none}
    </style>
    
    <script id="AdditionalSiteSendjs" type="text/javascript">
        function RadToolBar1_ButtonClicking(sender, args)
        {
            var value = args.get_item().get_value();
            var taskId = $uof.tool.htmlDecode('<%=System.Web.Security.AntiXss.AntiXssEncoder.HtmlEncode(taskId,true)%>');
            var formVersionId = $uof.tool.htmlDecode('<%=System.Web.Security.AntiXss.AntiXssEncoder.HtmlEncode(formVersionId,true)%>');
            var dialogTitleName = $uof.tool.htmlDecode('<%=System.Web.Security.AntiXss.AntiXssEncoder.HtmlEncode(dialogTitleName,true)%>');
            var custSiteId = $uof.tool.htmlDecode('<%=System.Web.Security.AntiXss.AntiXssEncoder.HtmlEncode(HiddenCustSiteId.Value,true)%>');
            var srcSiteId = $uof.tool.htmlDecode('<%=System.Web.Security.AntiXss.AntiXssEncoder.HtmlEncode(HiddenSrcSiteId.Value,true)%>');

           if(value == "ReturnForm")
           {
           }           
           else if(value=="ShowFlow")
           {
               args.set_cancel(true);
               $uof.dialog.open2("~/WKF/Browse/ViewMasterFlow.aspx?formVersionId=" + formVersionId, args.get_item(), dialogTitleName, 1280, 1080, openDialogResult);
            }
            else if(value=="CustSite")
	        {	    
                args.set_cancel(true);
                $uof.dialog.open2("~/WKF/Custom/SelectCustSite.aspx?custSiteId=" + custSiteId, args.get_item(), args.get_item().get_text(), 1280, 1080, openDialogResult);
            }
	        else if(value=="GroupSite")
	        {	    
	            args.set_cancel(true);
                $uof.dialog.open2("~/WKF/Custom/SelectGroupSite.aspx?srcSiteId=" + srcSiteId + "&taskId=" + taskId, args.get_item(), args.get_item().get_text(), 1280, 1080, openDialogResult);
	        }
        }

        function openDialogResult(returnValue) {
            //判斷是否PostBack
            if (typeof (returnValue) == 'undefined')
                return false;
            else
                return true;
        }

    function NotifyAdmin(taskId)
    { 
        $uof.dialog.open2("~/WKF/FormUse/DefinedTask/NotifyAdmin.aspx", '', '', 550, 390, openDialogResult, { 'taskId': taskId });
    }

    function ConfirmExceptionSend() 
    {
        alert('<%=lblExceptionStopSendMsg.Text%>');
        return false;
    }
    
    function IfExceptionSend() {
        return confirm('<%=lblAlertSendByExcept.Text%>');
    }
    
    function CheckLoading()
    {
       alert(document.body.readyState);

    }
    
    function checkEnd()
    {
        if($('#<%= rblMasterFlow.ClientID  %>')!=null)
        {
            if('<%=rblMasterFlow.SelectedValue %>'=='Y')
            {
            }
         }
    }
    </script>

    <telerik:RadToolBar ID="RadToolBar1" runat="server" OnButtonClick="RadToolBar1_ButtonClick" OnClientButtonClicking="RadToolBar1_ButtonClicking">
        <Items>
            <telerik:RadToolBarButton runat="server" ImageUrl="~/Common/Images/Icon/icon_m101.gif" Value="ShowFlow" HoveredImageUrl="~/Common/Images/Icon/icon_m101.gif" CheckedImageUrl="~/Common/Images/Icon/icon_m101.gif" Text="觀看表單流程">
            </telerik:RadToolBarButton>
            <telerik:RadToolBarButton runat="server" IsSeparator="True" Text="Button 1" Value="SeparatorC">
            </telerik:RadToolBarButton>
            <telerik:RadToolBarButton runat="server" 
                ImageUrl="~/Common/Images/Icon/icon_m101.gif" 
                Value="CustSite" 
                HoveredImageUrl="~/Common/Images/Icon/icon_m101.gif" 
                CheckedImageUrl="~/Common/Images/Icon/icon_m101.gif" 
                Text="定義自訂流程" 
                DisabledImageUrl="~/Common/Images/Icon/icon_m101.gif" Visible="false">
            </telerik:RadToolBarButton>
            <telerik:RadToolBarButton runat="server" ImageUrl="~/Common/Images/Icon/icon_m101.gif" Value="GroupSite" HoveredImageUrl="~/Common/Images/Icon/icon_m101.gif" CheckedImageUrl="~/Common/Images/Icon/icon_m101.gif" Text="定義自選流程" Visible="false">
            </telerik:RadToolBarButton>
        </Items>
    </telerik:RadToolBar>
    
    <table width="100%" class="PopTable" cellspacing="1">
        <colgroup class="PopTableLeftTD" style="width: 70px; text-align: right">
        </colgroup>
        <colgroup class="PopTableRightTD" style="width:200px">
        </colgroup>
        <colgroup class="PopTableLeftTD" style="width: 70px; text-align: right">
        </colgroup>
        <colgroup class="PopTableRightTD"  style="width:200px">
        </colgroup>
        <tr>
            <td colspan=4 class=PopTableHeader style="height: 25px; text-align: center">
                <asp:Label ID="lblFlowControl" runat="server" EnableViewState="False" 
                    Text="流程切換" meta:resourcekey="lblFlowControlResource1"></asp:Label>
            </td>
            </tr>
            <tr>
                <td><asp:Label ID="lblMasterFlow" runat="server" EnableViewState="False" Text="主流程" 
                        meta:resourcekey="lblMasterFlowResource1"></asp:Label></td>
                <td><asp:Panel ID="panelMasterSelect" runat="server" Width="100%" meta:resourcekey="panelMasterSelectResource1">
                                <asp:RadioButtonList ID="rblMasterFlow" runat="server" 
                                    RepeatDirection="Horizontal" AutoPostBack="True"
                                    meta:resourcekey="rblMasterFlowResource1">
                                    <asp:ListItem Value="Y" Text="結案" meta:resourcekey="rblMasterFlowItem1Resource"></asp:ListItem>
                                    <asp:ListItem Value="N" Text="下一站點" meta:resourcekey="rblMasterFlowItem2Resource"></asp:ListItem>
                                </asp:RadioButtonList>
                            </asp:Panel></td>
                <td><asp:Label ID="lobSubFlow" runat="server" EnableViewState="False" Text="副流程" 
                        meta:resourcekey="lobSubFlowResource1"></asp:Label></td>
                <td><asp:Panel ID="panelSubSelect" runat="server" Width="100%" meta:resourcekey="panelSubSelectResource1">
                                <asp:RadioButtonList ID="rblSubFlow" runat="server" 
                                    RepeatDirection="Horizontal" AutoPostBack="True"
                                    meta:resourcekey="rblSubFlowResource1">
                                    <asp:ListItem Value="Y" Text="結束" meta:resourcekey="rblSubFlowItem1Resource"></asp:ListItem>
                                    <asp:ListItem Value="N" Text="下一站點" meta:resourcekey="rblSubFlowItem2Resource" ></asp:ListItem>
                                </asp:RadioButtonList>
                            </asp:Panel>
                            </td>
            </tr>
    <asp:Panel ID="PanelNextSite" runat="server" Width="100%" meta:resourcekey="PanelNextSiteResource1" CssClass="panelDiv">
        <tr>
            <td class="PopTableHeader" colspan="4" style="height: 25px; text-align: center">
                <asp:Label ID="Label5" runat="server" Text="下一站點資訊" meta:resourcekey="Label5Resource1"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblNextSiteSet" runat="server" EnableViewState="False" 
                    Text="簽核型態" meta:resourcekey="lblNextSiteSetResource1"></asp:Label>
            </td>
            <td style="white-space:nowrap">
                <asp:RadioButtonList ID="rblSignType" runat="server" RepeatDirection="Horizontal"
                    AutoPostBack="True" OnSelectedIndexChanged="rblSignType_SelectedIndexChanged"
                    meta:resourcekey="rblSignTypeResource1">
                    <asp:ListItem Selected="True" Value="General" Text="一般" meta:resourcekey="ListItemResource8"></asp:ListItem>
                    <asp:ListItem Value="Or" Text="並簽" meta:resourcekey="ListItemResource9"></asp:ListItem>
                    <asp:ListItem Value="And" Text="會簽" meta:resourcekey="ListItemResource10"></asp:ListItem>
                </asp:RadioButtonList>
                <uc1:UC_SignDirections runat="server" ID="UC_SignDirections" />
            </td>
            <td>
                <asp:Label ID="lblTimeoutTitle" runat="server" EnableViewState="False" Text="逾時設定"
                    meta:resourcekey="lblTimeoutTitleResource1"></asp:Label>
            </td>
            <td valign="middle">
                <asp:TextBox ID="tbTimeoutCount" runat="server" MaxLength="4" Width="30px" Style="text-align: right"
                    Text="0" meta:resourcekey="tbTimeoutCountResource1"></asp:TextBox><asp:Label ID="Label2"
                        runat="server" Text="小時" meta:resourcekey="Label2Resource1"></asp:Label>
                <br /><asp:Label ID="lblTimeOutComment" runat="server" Text="[0表示不會逾時]" 
                    ForeColor=Blue meta:resourcekey="lblTimeOutCommentResource1"></asp:Label>
                <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="tbTimeoutCount"
                    Display="Dynamic" ErrorMessage="此數字需介於0-1000" MaximumValue="1000" MinimumValue="0"
                    Type="Integer" meta:resourcekey="RangeValidator1Resource1"></asp:RangeValidator>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblNextSiteSigner" runat="server" EnableViewState="False" 
                    Text="簽核人員" meta:resourcekey="lblNextSiteSignerResource1"></asp:Label>
            </td>
            <td>
                <uc1:UC_ChoiceList ID="UC_ChoiceList_Signer" runat="server" ShowMember="false"/>
            </td>
            <td>
                <asp:Label ID="lblNextSiteAlerter" runat="server" EnableViewState="False" 
                    Text="知會人員" meta:resourcekey="lblNextSiteAlerterResource1"></asp:Label>
            </td>
            <td>
                <uc1:UC_ChoiceList ID="UC_ChoiceList_AlertUsers" runat="server" ShowMember="false"/>
            </td>
        </tr>
    </asp:Panel>
    </table>
    
    <div id=hiddenFieldDiv style="display:none">
        <asp:HiddenField ID="HiSrcSiteId" runat="server" />
        <asp:HiddenField ID="HiSrcParentSiteId" runat="server" />
        <asp:HiddenField ID="HiSubFlowId" runat="server" />
        <asp:HiddenField ID="HiSubFlowType" runat="server" Value="0" />
        <asp:HiddenField ID="HiSubFlowName" runat="server" />
        <asp:HiddenField ID="HiStartGroupId" runat="server" />
        <asp:HiddenField ID="HiJobTitleId" runat="server" />
        <asp:HiddenField ID="HiSiteKind" runat="server" Value="0" />
        <asp:HiddenField ID="HiSendByExcept" runat="server" Value="N" />
        <asp:HiddenField ID="HiIsEndMasterFlow" runat="server" />
        <asp:HiddenField ID="HiIsEndSubFlow" runat="server" />
        <asp:HiddenField ID="HiddenCustSiteId" runat="server" />
        <asp:HiddenField ID="HiddenIsCustSite" runat="server" />
        <asp:HiddenField ID="HiddenSrcSiteId" runat="server" />
        <asp:HiddenField ID="HiddenSrcParentSiteId" runat="server" />
        <asp:HiddenField ID="HiddenStartGroupId" runat="server" />
        <asp:HiddenField ID="HiddenStartJobTitleId" runat="server" />
        <asp:HiddenField ID="HiddenSubFlowId" runat="server" />
        <asp:HiddenField ID="HiddenSubFlowName" runat="server" />
        <asp:HiddenField ID="HiddenCustFlowId" runat="server" />
        <asp:HiddenField ID="HiddenGroupSiteId" runat="server" />
        <asp:HiddenField ID="HiddenIsGroupSite" runat="server" />
        <asp:Label ID="lblMsgNextSiteAtMaster" runat="server" Text="此站點屬於主流程站點" meta:resourcekey="lblMsgNextSiteAtMasterResource1"></asp:Label>
</div>      
<div style="display:none">
    <asp:Panel ID="PanelNextSiteBelongSubFlow" runat="server" Width="100%" 
        meta:resourcekey="PanelNextSiteBelongSubFlowResource1">
        <table cellpadding="0" cellspacing="0" width="100%">
            <tr>
                <td nowrap width="100%" align="left">
                    <asp:Label ID="lblMsgNextSiteAtSub" runat="server" Text="此站點屬於副流程站點" meta:resourcekey="lblMsgNextSiteAtSubResource1"></asp:Label>：<asp:Label
                        ID="lblSubFlowName" runat="server" ForeColor="Blue" meta:resourcekey="lblSubFlowNameResource1"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblFlowBase" runat="server" Text="流程起始依據" meta:resourcekey="lblFlowBaseResource1"></asp:Label>：
                    <asp:Label ID="lblStartGroup" runat="server" ForeColor="Blue" meta:resourcekey="lblStartGroupResource1"></asp:Label>
                    &nbsp; &nbsp; &nbsp;<asp:Label ID="lblJobTitle" runat="server" ForeColor="Blue" meta:resourcekey="lblJobTitleResource1"></asp:Label>&nbsp;
                </td>
            </tr>
        </table>
    </asp:Panel>
    <asp:RadioButtonList ID="rblSignResult" runat="server" RepeatDirection="Horizontal"
        meta:resourcekey="rblSignResultResource1">
        <asp:ListItem Selected="True" Value="Approve" Text="同意" meta:resourcekey="ListItemResource1"></asp:ListItem>
        <asp:ListItem Value="DisApprove" Text="否決" meta:resourcekey="ListItemResource2"></asp:ListItem>
        <asp:ListItem Value="Pass" Text="無意見" meta:resourcekey="ListItemResource3"></asp:ListItem>
    </asp:RadioButtonList>
</div>

    <asp:Label ID="lblNoTitle" runat="server" ForeColor="Red" 
        Text="找不到簽核者的職級，下一站點為副流程且起始依據為上一站點簽核者的部門及職級!<br>" Visible="False" 
        EnableViewState="False" meta:resourcekey="lblNoTitleResource1"  ></asp:Label>
    <asp:Label ID="lblMsgSubFlowNotSupportAndSite" runat="server" ForeColor="Red" Text="會簽站點不支援起始依據為上一站點簽核者的部門和職級!<br>" Visible="False" EnableViewState="False" meta:resourcekey="lblMsgSubFlowNotSupportAndSiteResource1" ></asp:Label>
    <asp:Label ID="lblMsgAssignSite" runat="server" ForeColor="Blue" Text="下一站點為[指定式站點]，請設定站點資訊後送出!<br>" Visible="False" EnableViewState="False" meta:resourcekey="lblMsgAssignSiteResource1"></asp:Label>
    <asp:Label ID="lblMsgFreeSite" runat="server" ForeColor="Blue" Text="下一站點為[自由流程站點]，請設定站點資訊後送出!<br>" Visible="False" EnableViewState="False" meta:resourcekey="lblMsgFreeSiteResource1"></asp:Label>
    <asp:Label ID="lblSysMsg" runat="server" EnableViewState="False" meta:resourcekey="lblSysMsgResource1"></asp:Label>
    <asp:CustomValidator ID="CustomValidatorCustSite" runat="server" Display="Dynamic" ErrorMessage="下一站為自訂流程站點，請先定義自訂流程" meta:resourcekey="CustomValidatorCustSiteResource1"></asp:CustomValidator>
    <asp:CustomValidator ID="CustomValidatorGroupSite" runat="server" Display="Dynamic" ErrorMessage="下一站為自選流程站點，請先定義自選流程" meta:resourcekey="CustomValidatorGroupSiteResource1"></asp:CustomValidator>
    <asp:CustomValidator ID="CustomValidatorAdditionalSite" runat="server" Display="Dynamic" ErrorMessage="加簽站點至少需要有一名簽核人員!" meta:resourcekey="CustomValidatorAdditionalSiteResource1"></asp:CustomValidator>
    <asp:Panel ID="panelAgent" runat="server" Width="100%" meta:resourcekey="panelAgentResource1">
        <asp:Label ID="lblMsgAgentExcept" runat="server" ForeColor="Red" Text="下列人員有啟動代理設定，但系統找不到他的代理人，表單將只會送給原簽核者!" Visible="False" EnableViewState="False" meta:resourcekey="lblMsgAgentExceptResource1"></asp:Label><br>
        <asp:Label ID="lblAgentList" runat="server" ForeColor="Blue" Text="&lt;br&gt;" EnableViewState="False" meta:resourcekey="lblAgentListResource1"></asp:Label>
    </asp:Panel>
    
    <asp:Label ID="lblMsgLastSite" runat="server" ForeColor="Red" Text="目前站點為流程中可簽核的最後一個站點，你確定要結案嗎？" Visible="False" EnableViewState="False" meta:resourcekey="lblMsgLastSiteResource1"></asp:Label>
    <asp:Label ID="lblMsgLastSubSite" runat="server" ForeColor="Red" Text="目前站點為副流程的最後一個站點!" Visible="False" EnableViewState="False" meta:resourcekey="lblMsgLastSubSiteResource1" ></asp:Label>
    <asp:Label ID="lblMsgNonResult" runat="server" ForeColor="Red" Text="目前簽核狀況尚未達成簽核共識，請點選送出，等待其他人員簽核!" Visible="False" EnableViewState="False" meta:resourcekey="lblMsgNonResultResource1" ></asp:Label>
    <asp:Label ID="lblMsgDisapprove" runat="server" ForeColor="Red" Text="你選擇了否決此張表單，表單將在此結案，你確定嗎？" Visible="False" EnableViewState="False" meta:resourcekey="lblMsgDisapproveResource1" ></asp:Label>
    <asp:Label ID="lblMsgNonFoundNextSite" runat="server" ForeColor="Red" Text="主流程中，已無更適合簽核的職級！你確定在此結案嗎？<br>" Visible="False" EnableViewState="False" meta:resourcekey="lblMsgNonFoundNextSiteResource1"></asp:Label>
    <asp:Label ID="lblMsgNonFoundNextSubSite" runat="server" ForeColor="Blue" Text="副流程中已無更適合簽核的職級!<br>" Visible="False" EnableViewState="False" meta:resourcekey="lblMsgNonFoundNextSubSiteResource1"></asp:Label>
    <asp:Label ID="lblMsgEndMasterByChoice" runat="server" ForeColor="Blue" Text="結案選項被勾選，你確定要結案嗎？<br>" Visible="False" EnableViewState="False" meta:resourcekey="lblMsgEndMasterByChoiceResource1" ></asp:Label>
    <asp:Label ID="lblMsgEndSubByChoice" runat="server" ForeColor="Blue" Text="副流程結束選項被勾選，副流程將會在此結束<br>" Visible="False" EnableViewState="False" meta:resourcekey="lblMsgEndSubByChoiceResource1" ></asp:Label>
    
    <asp:Label ID="lblMsgFlowBaseExcept" runat="server" ForeColor="Red" Text="下一站點的流程起始依據異常，請選擇起始群組與職級，如果你選擇異常送出，則表單會由管理人員進行後續處理!<br>" Visible="False" EnableViewState="False" meta:resourcekey="lblMsgFlowBaseExceptResource1" ></asp:Label>
    <asp:Label ID="lblMsgConditionExcept" runat="server" ForeColor="Red" Text="流程條件異常，請修正表單或聯絡管理人員修改流程，如果你選擇異常送出，則表單會由管理人員處理!" Visible="False" EnableViewState="False" meta:resourcekey="lblMsgConditionExceptResource1" ></asp:Label>
    <asp:Label ID="lblMsgApExcept" runat="server" ForeColor="Red" Text="系統無法正確取得組織流程資訊，請選擇異常送出，由管理人員進行後續處理!" Visible="False" EnableViewState="False" meta:resourcekey="lblMsgApExceptResource1" ></asp:Label>
    <asp:Label ID="lblMsgMutiSignersExcept" runat="server" ForeColor="Red" Text="一般站點不允許多人簽核，請修改下一站點資訊或聯絡管理人員修改流程，如果你選擇異常送出，則表單會由管理人員進行後續處理!<br>" Visible="False" EnableViewState="False" meta:resourcekey="lblMsgMutiSignersExceptResource1" ></asp:Label>
    <asp:Label ID="lblMsgNoSignersExcept" runat="server" ForeColor="Red" Text="沒有簽核人員，請修改下一站點資訊或聯絡管理人員修改流程，如果你選擇異常送出，則表單會由管理人員進行後續處理!<br>" Visible="False" EnableViewState="False" meta:resourcekey="lblMsgNoSignersExceptResource1" ></asp:Label>
    
    <asp:Label ID="lblMsgFlowBaseNoSendExcept" runat="server" ForeColor="Red" Text="下一站點的流程起始依據異常，請選擇起始群組與職級!請聯絡管理人員!<br>" Visible="False" EnableViewState="False" meta:resourcekey="lblMsgFlowBaseNoSendExceptResource1" ></asp:Label>
    <asp:Label ID="lblMsgConditionNoSendExcept" runat="server" ForeColor="Red" Text="流程條件異常，請修正表單或聯絡管理人員修改流程!" Visible="False" EnableViewState="False" meta:resourcekey="lblMsgConditionNoSendExceptResource1" ></asp:Label>
    <asp:Label ID="lblMsgApNoSendExcept" runat="server" ForeColor="Red" Text="系統無法正確取得組織流程資訊!請聯絡管理人員!" Visible="False" EnableViewState="False" meta:resourcekey="lblMsgApNoSendExceptResource1" ></asp:Label>
    <asp:Label ID="lblMsgMutiSignersNoSendExcept" runat="server" ForeColor="Red" Text="一般站點不允許多人簽核，請修改下一站點資訊或聯絡管理人員修改流程!<br>" Visible="False" EnableViewState="False" meta:resourcekey="lblMsgMutiSignersNoSendExceptResource1" ></asp:Label>
    <asp:Label ID="lblMsgNoSignersNoSendExcept" runat="server" ForeColor="Red" Text="沒有簽核人員，請修改下一站點資訊或聯絡管理人員修改流程!<br>" Visible="False" EnableViewState="False" meta:resourcekey="lblMsgNoSignersNoSendExceptResource1" ></asp:Label>

    <asp:Label ID="lblJump" runat="server" Text="跳簽" Visible="False" meta:resourcekey="lblJumpResource1"></asp:Label>
    <asp:Label ID="lblExcept" runat="server" Text="表單異常" Visible="False" meta:resourcekey="lblExceptResource1"></asp:Label>
    <asp:Label ID="lblSend" runat="server" Text="送出" Visible="False" meta:resourcekey="lblSendResource1"></asp:Label>
    <asp:Label ID="lblStartGroupExcept" runat="server" Text="異常群組" Visible="False" meta:resourcekey="lblStartGroupExceptResource1"></asp:Label>
    <asp:Label ID="lblStartJobTitleExcept" runat="server" Text="異常職級" Visible="False" meta:resourcekey="lblStartJobTitleExceptResource1"></asp:Label>
    <asp:Label ID="lblAlertSendByExcept" runat="server" Text="你選擇了異常送出，表單將會送給電子簽核管理者，由其將表單轉為自由流程後送出，確定嗎？" Visible="False" meta:resourcekey="lblAlertSendByExceptResource1"></asp:Label>
    <asp:Label ID="lblReturnTxt" runat="server" Text="返回" Visible="False" meta:resourcekey="lblReturnTxtResource1"></asp:Label>
    <asp:Label ID="lblSubmitTxt" runat="server" Text="確定" Visible="False" meta:resourcekey="lblSubmitTxtResource1"></asp:Label>
    <asp:Label ID="lblSignFail" runat="server" Text="簽核失敗，可能同時間有人異動表單狀態" Visible="False" meta:resourcekey="lblSignFailResource1" ></asp:Label>
    <asp:Label ID="lblEndAlert" runat="server" Text="這張表單將在此結案，確定嗎?" Visible="False" meta:resourcekey="lblEndAlertResource1" ></asp:Label>       
    <asp:Label ID="lblSendContinue" runat="server" Text="確定後繼續" Visible="False" meta:resourcekey="lblSendContinueResource1"></asp:Label>
    <asp:Label ID="lblExceptionStopSendMsg" runat="server" Text="表單發生異常，請聯絡管理人員！" Visible="False" meta:resourcekey="lblExceptionStopSendMsgResource1"></asp:Label>
    <asp:Label ID="lblExceptionSend" runat="server" Text="異常送出" Visible="False" meta:resourcekey="lblExceptionSendResource1"></asp:Label>
    <asp:Label ID="lblNotifyAdmin" runat="server" Text="通知管理員" Visible="False" meta:resourcekey="lblNotifyAdminResource1"></asp:Label>
</asp:Content>

