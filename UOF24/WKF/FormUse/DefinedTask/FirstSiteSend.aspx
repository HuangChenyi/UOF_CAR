<%@ Page Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="WKF_FormUse_DefinedTask_FirstSiteSend" Title="表單簽核" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" Codebehind="FirstSiteSend.aspx.cs" %>
<%@ Register Src="../../../Common/ChoiceCenter/UC_ChoiceList.ascx" TagName="UC_ChoiceList" TagPrefix="uc1" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register Src="~/WKF/FlowManagement/UC_SignDirections.ascx" TagPrefix="uc1" TagName="UC_SignDirections" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

<script id="FirstSiteSendjs" type="text/javascript">
    function OnBarMainClick(sender, args) {
        var formVersionId = $uof.tool.htmlDecode('<%=System.Web.Security.AntiXss.AntiXssEncoder.HtmlEncode(formVersionId,true)%>');
        var flowId = $uof.tool.htmlDecode('<%=System.Web.Security.AntiXss.AntiXssEncoder.HtmlEncode(flowId,true)%>');
        var scriptId = $uof.tool.htmlDecode('<%=System.Web.Security.AntiXss.AntiXssEncoder.HtmlEncode(scriptId,true)%>');
        var dialogTitleName = $uof.tool.htmlDecode('<%=System.Web.Security.AntiXss.AntiXssEncoder.HtmlEncode(dialogTitleName,true)%>');
        var srcSiteId = $uof.tool.htmlDecode('<%=System.Web.Security.AntiXss.AntiXssEncoder.HtmlEncode(HiddenSrcSiteId.Value,true)%>');
        var custSiteId = $uof.tool.htmlDecode('<%=System.Web.Security.AntiXss.AntiXssEncoder.HtmlEncode(HiddenCustSiteId.Value,true)%>');
        if (args.get_item().get_value() == "ReturnForm") {

        }
        else if (args.get_item().get_value() == "ShowFlow") {
            args.set_cancel(true);
            $uof.dialog.open2("~/WKF/Browse/ViewMasterFlow.aspx", args.get_item(), dialogTitleName, 1280, 1080, openDialogResult, {
                "formVersionId": formVersionId,
                "flowId": flowId
            });
        }
        else if (args.get_item().get_value() == "CustSite") {
            args.set_cancel(true);
            $uof.dialog.open2("~/WKF/Custom/SelectCustSite.aspx", args.get_item(), args.get_item().get_text(), 1280, 1080, openDialogResult, {
                "custSiteId": custSiteId,
                "formVersionId": formVersionId
            });
        }
        else if (args.get_item().get_value() == "GroupSite") {
            args.set_cancel(true);
            $uof.dialog.open2("~/WKF/Custom/SelectGroupSite.aspx", args.get_item(), args.get_item().get_text(), 1280, 1080, openDialogResult, {
                "srcSiteId": srcSiteId,
                "taskId": scriptId
            });
        }
    }
    
    function ConfirmExceptionSend() {
        alert('<%=lblExceptionStopSendMsg.Text%>');
        return false;
    }

    function IfExceptionSend() {
        return confirm('<%=lblAlertSendByExcept.Text%>');
        }
    
    //2010/02/25 modify by Lichan 新增通知管理員按鈕
    function NotifyAdmin(FormName) {
        $uof.dialog.open2("~/WKF/FormUse/DefinedTask/NotifyAdmin.aspx", "", "", 550, 390, function checkReturn(returnValue) {
            if (typeof (returnValue) != undefined) {
                $uof.dialog.close();
            }
        }, { "FormName": FormName });
    }

    function openDialogResult(returnValue) {
        if (typeof (returnValue) == "undefined") {
            return false;
        }
        return true;
    }
</script>

    <table cellpadding="0" cellspacing="0" width="100%">
        <tr>
            <td>
                <telerik:RadToolBar ID="webToolBar" runat="server" OnClientButtonClicking="OnBarMainClick"
                    OnButtonClick="webToolBar_ButtonClick" Width="100%" meta:resourcekey="webToolBarResource1" SingleClick="None">
                    <Items>
                        <telerik:RadToolBarButton runat="server"  
                            meta:resourceKey="TBarButtonResource2"
                            CheckedImageUrl="~/Common/Images/Icon/icon_m101.gif"
                            DisabledImageUrl="~/Common/Images/Icon/icon_m101.gif" 
                            HoveredImageUrl="~/Common/Images/Icon/icon_m101.gif"
                            ImageUrl="~/Common/Images/Icon/icon_m101.gif" Text="觀看表單流程" Value="ShowFlow" >
                        </telerik:RadToolBarButton>
                        <telerik:RadToolBarButton runat="server" IsSeparator="true" Value="sShowFlow" meta:resourcekey="RadToolBarButtonResource1" >
                        </telerik:RadToolBarButton>
                        <telerik:RadToolBarButton runat="server"  
                            meta:resourceKey="TBarButtonResource3"
                            CheckedImageUrl="~/Common/Images/Icon/icon_m101.gif"
                            DisabledImageUrl="~/Common/Images/Icon/icon_m101.gif" 
                            HoveredImageUrl="~/Common/Images/Icon/icon_m101.gif" Visible="false"
                            ImageUrl="~/Common/Images/Icon/icon_m101.gif" Text="定義自訂流程" Value="CustSite" >
                        </telerik:RadToolBarButton>
                        <telerik:RadToolBarButton runat="server" IsSeparator="true" Value="sCustSite" Visible="false" meta:resourcekey="RadToolBarButtonResource2" >
                        </telerik:RadToolBarButton>
                        <telerik:RadToolBarButton runat="server"  
                            meta:resourceKey="TBarButtonResource4" Visible=false
                            CheckedImageUrl="~/Common/Images/Icon/icon_m101.gif"
                            DisabledImageUrl="~/Common/Images/Icon/icon_m101.gif" 
                            HoveredImageUrl="~/Common/Images/Icon/icon_m101.gif"
                            ImageUrl="~/Common/Images/Icon/icon_m101.gif" Text="定義自選流程" Value="GroupSite" >
                        </telerik:RadToolBarButton>
                        <telerik:RadToolBarButton runat="server" IsSeparator="true" Value="sGroupSite" Visible="false" meta:resourcekey="RadToolBarButtonResource3" >
                        </telerik:RadToolBarButton>
                        <telerik:RadToolBarButton runat="server" 
                            meta:resourceKey="TBarButtonResource5" 
                            CheckedImageUrl="~/Common/Images/Icon/icon_m101.gif"
                            DisabledImageUrl="~/Common/Images/Icon/icon_m101.gif"
                            HoveredImageUrl="~/Common/Images/Icon/icon_m101.gif" 
                            ImageUrl="~/Common/Images/Icon/icon_m101.gif" Text="模擬流程" Value="SimulationFlow" >
                        </telerik:RadToolBarButton>
                        <telerik:RadToolBarButton runat="server" IsSeparator="True" Value="sSimulationFlow" meta:resourcekey="RadToolBarButtonResource4">
                        </telerik:RadToolBarButton>    
                    </Items>
                </telerik:RadToolBar>
            </td>
        </tr>
    </table>
        
    <table width="100%" class="PopTable" cellspacing="1">
        <tr>
            <td colspan="4" class="PopTableHeader" style="height: 25px; text-align: center">
                <asp:Label ID="lblNextSiteInfo" runat="server" EnableViewState="False"
                    Text="下一站點資訊" meta:resourcekey="lblNextSiteInfoResource1"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblTitleSignKing" runat="server" Text="簽核型態" meta:resourcekey="lblTitleSignKingResource2"></asp:Label>
            </td>
            <td style="white-space:nowrap">
                <asp:Label ID="lblSignType" runat="server" meta:resourcekey="lblSignTypeResource1"></asp:Label>
                <asp:RadioButtonList ID="rblSignType" runat="server" meta:resourcekey="rblSignTypeResource1"
                    RepeatDirection="Horizontal" AutoPostBack="True" OnSelectedIndexChanged="rblSignType_SelectedIndexChanged">
                    <asp:ListItem meta:resourcekey="ListItemResource6" Selected="True" Value="General"
                        Text="一般"></asp:ListItem>
                    <asp:ListItem meta:resourcekey="ListItemResource7" Value="Or" Text="並簽"></asp:ListItem>
                    <asp:ListItem meta:resourcekey="ListItemResource8" Value="And" Text="會簽"></asp:ListItem>
                </asp:RadioButtonList>
                <uc1:UC_SignDirections runat="server" ID="UC_SignDirections" />
            </td>
            <td>
                <asp:Label ID="lblTitleTimeOutCount" runat="server" Text="逾時設定" meta:resourcekey="lblTitleTimeOutCountResource2"></asp:Label>
            </td>
            <td>
                <telerik:RadNumericTextBox ID="tbTimeoutCount" runat="server" Width="60px" MinValue="0" Value="0" DataType="System.String" Culture="zh-TW" DbValueFactor="1" LabelWidth="24px" meta:resourcekey="tbTimeoutCountResource2">
                    <NumberFormat ZeroPattern="n" AllowRounding="False" DecimalDigits="0"  ></NumberFormat>
                </telerik:RadNumericTextBox>
                <asp:Label ID="lblHour" runat="server" Text="小時" meta:resourcekey="lblHourResource1"></asp:Label>
                <asp:Label ID="Label7" runat="server" Text="[0表示不設定]" CssClass="SizeMemo" meta:resourcekey="Label7Resource1"></asp:Label>
                <div><asp:RequiredFieldValidator ID="rfvTimeoutCount" runat="server" ControlToValidate="tbTimeoutCount" ErrorMessage="請輸入數字"  meta:resourcekey="rfvTimeoutCountResource1"></asp:RequiredFieldValidator></div>

            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label1" runat="server" Text="簽核提醒頻率" meta:resourcekey="Label1Resource2"></asp:Label>
            </td>
            <td>
                <telerik:RadNumericTextBox ID="txtCycleAlert" runat="server" Width="60px" MinValue="0" Value="0" DataType="System.String" Culture="zh-TW" DbValueFactor="1" LabelWidth="24px" meta:resourcekey="txtCycleAlertResource1">
                    <NumberFormat ZeroPattern="n" AllowRounding="False" DecimalDigits="0"  ></NumberFormat>
                </telerik:RadNumericTextBox>
                <asp:Label ID="Label4" runat="server" Text="小時" meta:resourcekey="Label4Resource1"></asp:Label>
                <asp:Label ID="Label5" runat="server" Text="[0表示不設定]" CssClass="SizeMemo" meta:resourcekey="Label5Resource1"></asp:Label>
                <div><asp:RequiredFieldValidator ID="rfvCycleAlert" runat="server" ControlToValidate="txtCycleAlert" ErrorMessage="請輸入數字"  meta:resourcekey="rfvTimeoutCountResource1"></asp:RequiredFieldValidator></div>

            </td>
            <td>
                <asp:Label ID="Label2" runat="server" Text="自動送至下一站" meta:resourcekey="Label2Resource1"></asp:Label>
            </td>
            <td>
                <telerik:RadNumericTextBox ID="txtAutoSign" runat="server" Width="60px" MinValue="0" Value="0" DataType="System.String" Culture="zh-TW" DbValueFactor="1" LabelWidth="24px" meta:resourcekey="txtAutoSignResource1">
                    <NumberFormat ZeroPattern="n" AllowRounding="False" DecimalDigits="0"  ></NumberFormat>
                </telerik:RadNumericTextBox>
                <asp:Label ID="Label3" runat="server" Text="小時" meta:resourcekey="lblHourResource1"></asp:Label>
                <asp:Label ID="Label6" runat="server" Text="[0表示不設定]" CssClass="SizeMemo" meta:resourcekey="Label6Resource1"></asp:Label>
                <div><asp:RequiredFieldValidator ID="rfvAutoSign" runat="server" ControlToValidate="txtAutoSign" ErrorMessage="請輸入數字"  meta:resourcekey="rfvTimeoutCountResource1"></asp:RequiredFieldValidator></div>

            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblSignerHead" runat="server" Text="簽核人員" meta:resourcekey="lblSignerHeadResource2"></asp:Label>
            </td>
            <td colspan="3">
                <uc1:UC_ChoiceList ID="UC_ChoiceListAllSigner" runat="server" ShowMember="False" />
                <asp:Label ID="lblAdditionalSignUser" runat="server" Visible="false" ForeColor="Blue"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblAlertHead" runat="server" Text="知會人員" meta:resourcekey="lblAlertHeadResource2"></asp:Label>
            </td>
            <td colspan="3">
                <uc1:UC_ChoiceList ID="UC_ChoiceListAllAlert" runat="server"
                    ShowMember="False" />
            </td>
        </tr>
    </table>
            
    
    <asp:Label ID="lblAssignAbleSite" runat="server" EnableViewState="False" Text="下一站點為[指定式站點]，請設定站點資訊後送出!<br>"  Visible="False" meta:resourcekey="lblAssignAbleSiteResource2"></asp:Label>
    <asp:Label ID="lblFreeSite" runat="server" Text="下一站點為[自由流程站點]，請設定站點資訊後送出!<br>"   Visible="False" meta:resourcekey="lblFreeSiteResource2"></asp:Label>
            
    <asp:Label ID="lblSiteKind" runat="server" meta:resourcekey="lblSiteKindResource2" ></asp:Label>
    <asp:Label ID="lblMsg" runat="server" ForeColor="Red" meta:resourcekey="lblMsgResource1"></asp:Label>
    <asp:Label id="lblNotifyMsg" runat="server" CssClass="SizeMemo"></asp:Label>
    <asp:CustomValidator ID="CustomValidatorCustSite" runat="server" ErrorMessage="下一站為自訂流程站點，請先定義自訂流程"  Display="Dynamic" meta:resourcekey="CustomValidatorCustSiteResource1"></asp:CustomValidator>
    <asp:CustomValidator ID="CustomValidatorGroupSite" runat="server" ErrorMessage="下一站為自選流程站點，請先定義自選流程" Display="Dynamic" meta:resourcekey="CustomValidatorGroupSiteResource1"></asp:CustomValidator>
        
    <asp:Label ID="lblIsModify" runat="server" Visible="False" meta:resourcekey="lblIsModifyResource1"></asp:Label>
    <asp:Label ID="lblIsEndSite" runat="server" Visible="False" meta:resourcekey="lblIsEndSiteResource1"></asp:Label>
    <asp:Label ID="lblReturnTxt" runat="server" Text="返回" Visible="False" meta:resourcekey="lblReturnTxtResource1"></asp:Label>
    <asp:Label ID="lblSubmitTxt" runat="server" Text="確定" Visible="False" meta:resourcekey="lblSubmitTxtResource1"></asp:Label>

    <asp:HiddenField ID="HiddenCustSiteId" runat="server" />
    <asp:HiddenField ID="HiddenSrcSiteId" runat="server" />
    <asp:HiddenField ID="HiddenIsCustSite" runat="server" />
    <asp:HiddenField ID="HiddenSrcParentSiteId" runat="server" />
    <asp:HiddenField ID="HiddenStartGroupId" runat="server" />
    <asp:HiddenField ID="HiddenStartJobTitleId" runat="server" />
    <asp:HiddenField ID="HiddenSubFlowId" runat="server" />
    <asp:HiddenField ID="HiddenSubFlowName" runat="server" />
    <asp:HiddenField ID="HiddenCustFlowId" runat="server" />
    <asp:HiddenField ID="HiddenGroupSiteId" runat="server" />
    <asp:HiddenField ID="HiddenIsGroupSite" runat="server" />
    <asp:HiddenField ID="HiddenExternalSiteId" runat="server" />
    <asp:HiddenField ID="HiddenExternalFlowId" runat="server" />
    <asp:HiddenField ID="HiddenExterSiteInfo" runat="server" />

    
    <asp:Label ID="lblGeneralSite" runat="server" Text="一般站點"  Visible="False" meta:resourcekey="lblGeneralSiteResource1"></asp:Label>
    <asp:Label ID="lblEroMsgCondExec" runat="server" Text="條件異常" Visible="False" meta:resourcekey="lblEroMsgCondExecResource1"></asp:Label>
    <asp:Label ID="lblSend" runat="server" Text="送出" Visible="False" meta:resourcekey="lblSendResource1"></asp:Label>&nbsp;
    <asp:Label ID="lblJump" runat="server" Text="跳簽" Visible="False" meta:resourcekey="lblJumpResource1"></asp:Label>
    <asp:Label ID="lblException" runat="server" Text="表單異常" Visible="False" meta:resourcekey="lblExceptionResource1"></asp:Label>
    
    <asp:Label ID="lblEndSiteMsg" runat="server" Text="目前站點為流程中可簽核的最後一個站點，你確定要結案嗎？" Visible="False" meta:resourcekey="lblEndSiteMsgResource1"></asp:Label>
    <asp:Label ID="lbeAgentMsg" runat="server" meta:resourcekey="lbeAgentMsgResource1" Text="下列人員有啟動代理設定，但系統找不到他的代理人，表單將只會送給原簽核者!" Visible="False"></asp:Label>
    <asp:Label ID="lblSendMsg" runat="server" meta:resourcekey="lblSendMsgResource1" Text="表單 {0} 已建立"  Visible="False"></asp:Label>
    <asp:Label ID="lblFormNum" runat="server" meta:resourcekey="lblFormNumResource1" Text="表單編號為:" Visible="False"></asp:Label>
    <asp:Label ID="lblGeneral" runat="server" meta:resourcekey="lblGeneralResource1"   Text="一般" Visible="False"></asp:Label>
    <asp:Label ID="lblAnd" runat="server" meta:resourcekey="lblAndResource1" Text="會簽"   Visible="False"></asp:Label>
    <asp:Label ID="lblOr" runat="server" meta:resourcekey="lblOrResource1" Text="並簽" Visible="False"></asp:Label>
    <asp:Label ID="lblSiteExceptMsg1" runat="server" Text="站點異常：簽核型態為一般，簽核者只允許一位" Visible="False"   meta:resourcekey="lblSiteExceptMsg1Resource1"></asp:Label>
    <asp:Label ID="lblSiteExceptMsg2" runat="server" Text="站點異常：找不到任何一位簽核者" Visible="False" meta:resourcekey="lblSiteExceptMsg2Resource1"></asp:Label>
    <asp:Label ID="lblSignerSuspended" runat="server" Text="下一站簽核者帳號已被停用，表單送出後系統會同步通知管理員進行表單指定簽核，以避免影響簽核時效性。" Visible="False" meta:resourcekey="lblSignerSuspendedResource1"></asp:Label>
    <asp:Label ID="lblJobTitleMsg" runat="server" Text="此人無設定職級，無法尋找節點！" Visible="False" meta:resourcekey="lblJobTitleMsgResource1"></asp:Label>
    <asp:Label ID="lblAlertSendByExcept" runat="server" meta:resourcekey="lblAlertSendByExceptResource1"  Text="你選擇了異常送出，表單將會送給電子簽核管理者，由其將表單轉為自由流程後送出，確定嗎？" Visible="False"></asp:Label>
    <asp:Label ID="lblExceptionStopSendMsg" runat="server" Text="表單發生異常，請聯絡管理人員！" Visible="False" meta:resourcekey="lblExceptionStopSendMsgResource1"></asp:Label>
    <asp:Label ID="lblExceptionSend" runat="server" Text="異常送出" Visible="False" meta:resourcekey="lblExceptionSendResource1"></asp:Label>
    <asp:Label ID="lblNotifyAdmin" runat="server" Text="通知管理員" Visible="False" meta:resourcekey="lblNotifyAdminResource1"></asp:Label>

    <asp:Label ID="lblNoSignerMsg" runat="server" EnableViewState="False" ForeColor="Red"  Text="沒有簽核人員，請修改下一站點資訊或聯絡管理人員修改流程，如果你選擇異常送出，則表單會由管理人員進行後續處理!<br>"  Visible="False" meta:resourcekey="lblNoSignerMsgResource2"></asp:Label>
    <asp:Label ID="lblSiteGeneralMsg" runat="server" EnableViewState="False" ForeColor="Red" Text="一般站點不允許多人簽核，請修改下一站點資訊或聯絡管理人員修改流程，如果你選擇異常送出，則表單會由管理人員進行後續處理!<br>"   Visible="False" meta:resourcekey="lblSiteGeneralMsgResource2"></asp:Label>
    <asp:Label ID="lblMsgConditionExcept" runat="server" EnableViewState="False" ForeColor="Red"  Text="流程條件異常，請修正表單或聯絡管理人員修改流程，如果你選擇異常送出，則表單會由管理人員進行後續處理！<br>"  Visible="False" meta:resourcekey="lblMsgConditionExceptResource2"></asp:Label>
    
    <asp:Label ID="lblExtDllFormatError" runat="server" EnableViewState="False" ForeColor="Red" 
        Text="下一站點為[應用程式站點]，組件回傳的XML結構有誤，請聯絡管理人員!<br>"  Visible="False" meta:resourcekey="lblExtDllFormatErrorResource1" >
    </asp:Label>
    <asp:Label ID="lblExtAccountNotExist" runat="server" EnableViewState="False" ForeColor="Red"   
        Text="下一站點為[應用程式站點]，組件回傳的XML結構中的人員帳號未存在UOF系統中，請聯絡管理人員!<br>" Visible="False" meta:resourcekey="lblExtAccountNotExistResource1"  >
    </asp:Label>
    <asp:Label ID="lblExtAccountGroupNotExist" runat="server" EnableViewState="False" ForeColor="Red"   
        Text="下一站點為[應用程式站點]，組件回傳的XML結構中的簽核者資訊不正確，請聯絡管理人員!<br>" Visible="False" meta:resourcekey="lblExtAccountGroupNotExistResource1"  >
    </asp:Label>
        <asp:Label ID="lblExtAccountTitleNotExist" runat="server" EnableViewState="False" ForeColor="Red"   
        Text="下一站點為[應用程式站點]，組件回傳的XML結構中的簽核者資訊不正確，請聯絡管理人員!<br>" Visible="False" meta:resourcekey="lblExtAccountTitleNotExistResource1"  >
    </asp:Label>
    <asp:Label ID="lblNoSignerNoSendMsg" runat="server" EnableViewState="False" ForeColor="Red"  Text="沒有簽核人員，請修改下一站點資訊或聯絡管理人員修改流程!<br>"  Visible="False" meta:resourcekey="lblNoSignerNoSendMsgResource1" ></asp:Label>
    <asp:Label ID="lblSiteGeneralNoSendMsg" runat="server" EnableViewState="False" ForeColor="Red" Text="一般站點不允許多人簽核，請修改下一站點資訊或聯絡管理人員修改流程!<br>"   Visible="False" meta:resourcekey="lblSiteGeneralNoSendMsgResource1" ></asp:Label>
    <asp:Label ID="lblMsgConditionNoSendExcept" runat="server" EnableViewState="False" ForeColor="Red"  Text="流程條件異常，請修正表單或聯絡管理人員修改流程!<br>"  Visible="False" meta:resourcekey="lblMsgConditionNoSendExceptResource1" ></asp:Label>
    
    <asp:HiddenField ID="hidSiteKind" runat="server" />
    <asp:HiddenField ID="hidSignedAlertXml" runat="server" />
    <asp:HiddenField ID="hfIsSuspended" runat="server" />
    <asp:HiddenField ID="hfHasSkippedSite" runat="server" Value="False" />
    
    <asp:Label ID="lblAlertSiteUserSet" runat="server" Visible="False" meta:resourcekey="lblAlertSiteUserSetResource1"></asp:Label>
    <asp:Label ID="lblMsgUserDeptChange" runat="server" Text="申請者部門已變更！請關閉並重新申請。" Visible="False" meta:resourcekey="lblMsgUserDeptChangeResource1"></asp:Label>
    <asp:Label ID="lblAdditionalSign" runat="server" Text="由 {#User} 加簽" Visible="False" meta:resourcekey="lblAdditionalSignResource1" ></asp:Label>
    <asp:Label ID="lblCustomAutoNumberCreateFailed" runat="server" Text="自訂編號錯誤：" Visible="False" meta:resourcekey="lblCustomAutoNumberCreateFailedResource1" ></asp:Label>
    <asp:Label ID="lblFormIsApproval" runat="server" Text="表單審核中，不可重複送審。" Visible="False" meta:resourcekey="lblFormIsApprovalResource1"></asp:Label>
    <asp:Label ID="lblFormWaitRelease" runat="server" Text="表單待發佈中，不可重複送審。" Visible="False" meta:resourcekey="lblFormWaitReleaseResource1"></asp:Label>
    <asp:Label ID="lblFormSettingDisabledForApply" runat="server" Text="已關閉表單審核功能，無法申請。" Visible="False" meta:resourcekey="lblFormSettingDisabledForApplyResource1"></asp:Label>
    <asp:Label ID="lblNoAllowApply" runat="server" Text="此張表單目前不允許申請" Visible="False" meta:resourcekey="lblNoAllowApplyResource1"></asp:Label>
</asp:Content>
