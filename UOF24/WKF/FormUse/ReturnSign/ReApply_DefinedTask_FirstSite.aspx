<%@ Page Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="WKF_FormUse_ReturnSign_ReApply_DefinedTask_FirstSite" Title="" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" Codebehind="ReApply_DefinedTask_FirstSite.aspx.cs" %>
<%@ Register Src="~/Common/ChoiceCenter/UC_ChoiceList.ascx" TagName="UC_ChoiceList" TagPrefix="uc1" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register Src="~/WKF/FlowManagement/UC_SignDirections.ascx" TagPrefix="uc1" TagName="UC_SignDirections" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <script id="mainjs" type="text/javascript">

        function OnBarMainClick(sender, args) {
            var formversionId = $uof.tool.htmlDecode('<%=System.Web.Security.AntiXss.AntiXssEncoder.HtmlEncode(formVersionId,true)%>');
            var flowId = $uof.tool.htmlDecode('<%=System.Web.Security.AntiXss.AntiXssEncoder.HtmlEncode(flowId,true)%>');
            var title = $uof.tool.htmlDecode('<%=System.Web.Security.AntiXss.AntiXssEncoder.HtmlEncode(dialogTitleName, true)%>');
            var taskId = $uof.tool.htmlDecode('<%=System.Web.Security.AntiXss.AntiXssEncoder.HtmlEncode(taskId, true)%>');
            var custSiteId = $uof.tool.htmlDecode('<%=System.Web.Security.AntiXss.AntiXssEncoder.HtmlEncode(HiddenCustSiteId.Value, true)%>');
            var srcSiteId = $uof.tool.htmlDecode('<%=System.Web.Security.AntiXss.AntiXssEncoder.HtmlEncode(HiddenSrcSiteId.Value, true)%>');
            if (args.get_item().get_value() == "ReturnForm") {
                args.set_cancel(true);

            }
            else if (args.get_item().get_value() == "ShowFlow") {
                args.set_cancel(true);
                $uof.dialog.open2('~/WKF/Browse/ViewMasterFlow.aspx', args.get_item(), title, 800, 650, openDialogResult, { "formVersionId": formversionId, "flowId": flowId });
            }
            else if (args.get_item().get_value() == "CustSite") {
                args.set_cancel(true);
                $uof.dialog.open2('~/WKF/Custom/SelectCustSite.aspx', args.get_item(), args.get_item().get_text(), 650, 600, openDialogResult, { "custSiteId": custSiteId });
            }
            else if (args.get_item().get_value() == "GroupSite") {
                args.set_cancel(true);
                $uof.dialog.open2('~/WKF/Custom/SelectGroupSite.aspx', args.get_item(), args.get_item().get_text(), 700, 500, openDialogResult, { "srcSiteId": srcSiteId, "taskId": taskId });
            }
        }

        function openDialogResult(returnValue) {
            if (typeof(returnValue) == 'undefined'){
                return false;
            }
            return true;
        }
    
    
        function ConfirmExceptionSend() {
            if (!confirm('<%=lblAlertSendByExcept.Text%>'))
                return false;
        }
    
    //2010/06/17 add by Lichan 新增通知管理員按鈕
        function NotifyAdmin(FormName) {
            $uof.dialog.open2('~/WKF/FormUse/DefinedTask/NotifyAdmin.aspx', '', 550, 390,
                function getReturn(returnValue) {
                    if (typeof (returnValue) != "undefined") {
                        $uof.dialog.close();
                        return true;
                    }
                    return false;
                });
        }

    </script>
    <div id="contentDV" style="display:none">
    <table cellpadding="0" cellspacing="0" width="100%">
        <tr>
            <td>
            
                <telerik:RadToolBar ID="webToolBar" runat="server" OnClientButtonClicking="OnBarMainClick" meta:resourcekey="UltraWebToolbar1Resource1"
                                            OnButtonClick="webToolBar_ButtonClick" Width="100%" SingleClick="None">    
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
                    meta:resourceKey="TBarButtonResource4"
                        CheckedImageUrl="~/Common/Images/Icon/icon_m101.gif"
                        DisabledImageUrl="~/Common/Images/Icon/icon_m101.gif" 
                        HoveredImageUrl="~/Common/Images/Icon/icon_m101.gif" Visible="false"
                        ImageUrl="~/Common/Images/Icon/icon_m101.gif" Text="定義自選流程" Value="GroupSite" >
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton runat="server" IsSeparator="true" Value="sGroupSite" Visible="false" meta:resourcekey="RadToolBarButtonResource3" >
                    </telerik:RadToolBarButton>
                </Items>
                </telerik:RadToolBar>
      
            </td>
        </tr>
    </table>
    <table width="100%" class="PopTable" cellspacing="1">
        <colgroup class="PopTableLeftTD" style="width: 70px; text-align: right">
        </colgroup>
        <colgroup class="PopTableRightTD" style="width: 200px">
        </colgroup>
        <colgroup class="PopTableLeftTD" style="width: 70px; text-align: right">
        </colgroup>
        <colgroup class="PopTableRightTD" style="width: 200px">
        </colgroup>
        <tr>
            <td colspan="4" class="PopTableHeader" style="height: 25px; text-align: center">
                <center>
                    <asp:Label ID="lblNextSiteInfo" runat="server" EnableViewState="False" Text="下一站點資訊"
                        meta:resourcekey="lblNextSiteInfoResource1"></asp:Label></center>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblTitleSignKing" runat="server" Text="型態" meta:resourcekey="lblTitleSignKingResource1"></asp:Label>
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
                <asp:Label ID="lblTitleTimeOutCount" runat="server" Text="逾時" meta:resourcekey="lblTitleTimeOutCountResource1"></asp:Label>
            </td>
            <td>
                <telerik:RadNumericTextBox ID="tbTimeoutCount" runat="server" Width="60px" MinValue="0" Value="0" DataType="System.String" Culture="zh-TW" DbValueFactor="1" LabelWidth="24px" meta:resourcekey="tbTimeoutCountResource2">
                    <NumberFormat ZeroPattern="n" AllowRounding="False" DecimalDigits="0"  ></NumberFormat>
                </telerik:RadNumericTextBox>
                <asp:Label ID="lblHour" runat="server" Text="小時" meta:resourcekey="lblHourResource1"></asp:Label>
                <asp:Label ID="lblTimeoutMemo" runat="server" Text="[0表示不設定]" CssClass="SizeMemo" meta:resourcekey="lblTimeoutMemoResource1"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label2" runat="server" Text="簽核提醒頻率" meta:resourcekey="Label2Resource1"></asp:Label>
            </td>
            <td>
                <telerik:RadNumericTextBox ID="txtCycleAlert" runat="server" Width="60px" MinValue="0" Value="0" DataType="System.String" Culture="zh-TW" DbValueFactor="1" LabelWidth="24px" meta:resourcekey="txtCycleAlertResource1">
                    <NumberFormat ZeroPattern="n" AllowRounding="False" DecimalDigits="0"  ></NumberFormat>
                </telerik:RadNumericTextBox>
                <asp:Label ID="Label4" runat="server" Text="小時" meta:resourcekey="lblHourResource1"></asp:Label>
                <asp:Label ID="lblCycleAlertMemo" runat="server" Text="[0表示不設定]" CssClass="SizeMemo" meta:resourcekey="lblCycleAlertMemoResource1"></asp:Label>
            </td>
            <td>
                <asp:Label ID="Label3" runat="server" Text="自動送至下一站" meta:resourcekey="Label3Resource1"></asp:Label>
            </td>
            <td>
                <telerik:RadNumericTextBox ID="txtAutoSign" runat="server" Width="60px" MinValue="0" Value="0" DataType="System.String" Culture="zh-TW" DbValueFactor="1" LabelWidth="24px" meta:resourcekey="txtAutoSignResource1">
                    <NumberFormat ZeroPattern="n" AllowRounding="False" DecimalDigits="0"  ></NumberFormat>
                </telerik:RadNumericTextBox>
                <asp:Label ID="Label5" runat="server" Text="小時" meta:resourcekey="lblHourResource1"></asp:Label>
                <asp:Label ID="lblAutoSignMemo" runat="server" Text="[0表示不設定]" CssClass="SizeMemo" meta:resourcekey="lblAutoSignMemoResource1"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblSignerHead" runat="server" Text="簽核" meta:resourcekey="lblSignerHeadResource1"></asp:Label>
            </td>
            <td>
                <uc1:UC_ChoiceList ID="UC_ChoiceListAllSigner" runat="server" ShowMember="False" />
            </td>
            <td>
                <asp:Label ID="lblAlertHead" runat="server" Text="知會" meta:resourcekey="lblAlertHeadResource1"></asp:Label>
            </td>
            <td>
                <uc1:UC_ChoiceList ID="UC_ChoiceListAllAlert" runat="server" ShowMember="False" />
            </td>
        </tr>
    </table>
    </div>
    <asp:Label ID="lblAssignAbleSite" runat="server" Text="下一站點為[指定式站點]，請設定站點資訊後送出!<br>"
        Visible="False" meta:resourcekey="lblAssignAbleSiteResource1"></asp:Label>
    <asp:Label ID="lblFreeSite" runat="server" Text="下一站點為[自由流程站點]，請設定站點資訊後送出!<br>" Visible="False"
        meta:resourcekey="lblFreeSiteResource1"></asp:Label>
    <asp:Label ID="lblSiteKind" runat="server" meta:resourcekey="lblSiteKindResource1"></asp:Label>
    <asp:Label ID="lblMsg" runat="server" ForeColor="Red" meta:resourcekey="lblMsgResource1"></asp:Label>
    <asp:Label id="lblNotifyMsg" runat="server" CssClass="SizeMemo"></asp:Label>
    <asp:CustomValidator ID="CustomValidatorCustSite" runat="server" ErrorMessage="下一站為自訂流程站點，請先定義自訂流程"
        Display="Dynamic" meta:resourcekey="CustomValidatorCustSiteResource1"></asp:CustomValidator>
    <asp:CustomValidator ID="CustomValidatorGroupSite" runat="server" ErrorMessage="下一站為自選流程站點，請先定義自選流程"
        Display="Dynamic" meta:resourcekey="CustomValidatorGroupSiteResource1"></asp:CustomValidator>
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
    <asp:HiddenField ID="hfIsSuspended" runat="server" />
    <asp:Label ID="lblGeneralSite" runat="server" Text="一般站點" Visible="False" meta:resourcekey="lblGeneralSiteResource1"></asp:Label>
    <asp:Label ID="lblEroMsgCondExec" runat="server" Text="條件異常" Visible="False" meta:resourcekey="lblEroMsgCondExecResource1"></asp:Label>
    <asp:Label ID="lblSend" runat="server" Text="送出" Visible="False" meta:resourcekey="lblSendResource1"></asp:Label>&nbsp;
    <asp:Label ID="lblJump" runat="server" Text="跳簽" Visible="False" meta:resourcekey="lblJumpResource1"></asp:Label>
    <asp:Label ID="lblException" runat="server" Text="異常送出" Visible="False" meta:resourcekey="lblExceptionResource1"></asp:Label>&nbsp;
    <asp:Label ID="lblNoSignerMsg" runat="server" EnableViewState="False" ForeColor="Red"
        Text="至少需有一名簽核人員，才能送往下一站點！" Visible="False" meta:resourcekey="lblNoSignerMsgResource1"></asp:Label>
    <asp:Label ID="lblSiteGeneralMsg" runat="server" EnableViewState="False" ForeColor="Red"
        meta:resourcekey="lblSiteGeneralMsgResource1" Text="一般站點不允許多人簽核，請修改下一站點資訊或聯絡管理人員修改流程!<br>"
        Visible="False"></asp:Label>
    <asp:Label ID="lblEndSiteMsg" runat="server" Text="找不到下一站點！此人已是最末站點，按下送出即結案！" Visible="False"
        meta:resourcekey="lblEndSiteMsgResource1"></asp:Label>
    <asp:Label ID="lblMsgConditionExcept" runat="server" EnableViewState="False" ForeColor="Red"
        Text="流程條件異常，所以不能正確取得下一站點資訊，請修正表單，或按下異常送出，由管理人員將此表單轉成自由流程送出！<br>" Visible="False"
        meta:resourcekey="lblMsgConditionExceptResource1"></asp:Label>
    <asp:Label ID="lbeAgentMsg" runat="server" meta:resourcekey="lbeAgentMsgResource1"
        Text="下列人員有啟動代理設定，但系統找不到他的代理人，表單將只會送給原簽核者!" Visible="False"></asp:Label>
    <asp:Label ID="lblSendMsg" runat="server" meta:resourcekey="lblSendMsgResource1" Text="表單 {0} 已建立" Visible="False"></asp:Label>
    <asp:Label ID="lblFormNum" runat="server" meta:resourcekey="lblFormNumResource1" Text="表單編號為:" Visible="False"></asp:Label>
    <asp:Label ID="lblGeneral" runat="server" meta:resourcekey="lblGeneralResource1" Text="一般" Visible="False"></asp:Label>
    <asp:Label ID="lblAnd" runat="server" meta:resourcekey="lblAndResource1" Text="會簽" Visible="False"></asp:Label>
    <asp:Label ID="lblOr" runat="server" meta:resourcekey="lblOrResource1" Text="並簽" Visible="False"></asp:Label>
    <asp:Label ID="lblSiteExceptMsg1" runat="server" Text="站點異常：簽核型態為一般，簽核者只允許一位" Visible="False" meta:resourcekey="lblSiteExceptMsg1Resource1"></asp:Label>
    <asp:Label ID="lblSiteExceptMsg2" runat="server" Text="站點異常：找不到任何一位簽核者" Visible="False" meta:resourcekey="lblSiteExceptMsg2Resource1"></asp:Label>
    <asp:Label ID="lblSignerSuspended" runat="server" Text="下一站簽核者帳號已被停用，表單送出後系統會同步通知管理員進行表單指定簽核，以避免影響簽核時效性。" Visible="False" meta:resourcekey="lblSignerSuspendedResource1"></asp:Label>
    <asp:Label ID="lblJobTitleMsg" runat="server" Text="此人無設定職級，無法尋找節點！" Visible="False" meta:resourcekey="lblJobTitleMsgResource1"></asp:Label>
    <asp:Label ID="lblAlertSendByExcept" runat="server" meta:resourcekey="lblAlertSendByExceptResource1"
        Text="你選擇了異常送出，表單將會送給電子簽核管理者，由其將表單轉為自由流程後送出，確定嗎？" Visible="False"></asp:Label>
    <asp:Label ID="lblNotifyAdmin" runat="server" Text="通知管理員" Visible="False" meta:resourcekey="lblNotifyAdminResource1"></asp:Label>
    <asp:Label ID="lblExternalDllFormatErrorMsg" runat="server" EnableViewState="False"
        ForeColor="Red" Text="下一站點為[應用程式站點]，組件回傳的XML結構有誤，請聯絡管理人員!<br>" Visible="False"
        meta:resourcekey="lblExternalDllFormatErrorMsgResource1"></asp:Label>
    <asp:Label ID="lblExternalAccountNotExistMsg" runat="server" EnableViewState="False"
        ForeColor="Red" Text="下一站點為[應用程式站點]，組件回傳的XML結構中的人員帳號未存在UOF系統中，請聯絡管理人員!<br>" Visible="False"
        meta:resourcekey="lblExternalAccountNotExistMsgResource1"></asp:Label>
    <asp:Label ID="Label1" runat="server" ForeColor="Red" meta:resourcekey="lblMsgResource1"></asp:Label>
    <asp:Label ID="lblNotSop" runat="server" meta:resourcekey="lblNotSopResource1"
                    Text="非正常程序開啟表單" Visible="False"></asp:Label>
    <asp:HiddenField ID="hidSignedAlertXml" runat="server" />
    <asp:Label ID="lblNoAuth" runat="server" meta:resourcekey="lblNoAuthResource1" Text="無權限處理或觀看此表單" Visible="False"></asp:Label>
    <asp:HiddenField ID="hfHasSkippedSite" runat="server" Value="False"/>
</asp:Content>
