<%@ Page Title="" Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="WKF_FormUse_DefinedTask_FirstSiteSend_Parallel" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" Codebehind="FirstSiteSend_Parallel.aspx.cs" %>
<%@ Reference Control="~/WKF/FormUse/DefinedTask/OtherSiteSendUC.ascx" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <style type="text/css"> 
        
        .formTitle {background-image: url(../../App_Themes/DefaultTheme/images/po_06.gif);text-align:center;height:20px}
        
        .formInfo {background-color:White;vertical-align:top}
         /*common*/

        .RadForm_MetroTouch  .rfdSelect  , .RadForm_Silk .rfdSelect,.RadForm_Silk .rfdSelectBox {
            font-size:100% !important;
        }

        .rfdSelectBox li{
            height : 1.8em;
            line-height : 1em;
        }

        .RadForm_MetroTouch label {
            font-size: 100% !important;
            font-weight: 700 !important;
            margin: 0 0 .28571429rem !important;
        }

        .pageLayout {
            font: 16px 'Segoe UI', Arial, sans-serif;
        }

        .pageLayout h1,
        .pageLayout h2 {
            font-weight: normal;
        }

        .pageLayout h1 {
            margin: 0;
            font-size: 200%;
        }

        .pageLayout h2 {
            font-size: 180%;
        }

        .pageLayout h3 {
            font-size: 133%;
        }

        .pageLayout .riTextBox {
            width: 100%;
            -moz-box-sizing: border-box;
            -webkit-box-sizing: border-box;
            box-sizing: border-box;
        }

        .pageLayout .radios td {
            padding-right: 15px;
        }

        .pageLayout .t-row {
            padding-bottom: 15px;
        }
        /*header*/
        .pageLayout .header {
            /*background-color: #e2e2dc;*/
            background-color: #ee6e73;
            color: #ffffff;
            line-height: 56px;
            width: 100%;
            font-size: 20px;
        }

        .pageLayout .header p {
            font-size: 1.43em;
        }

        .pageLayout .header img {
            width: 100%;
            display: block;
        }

        /*content*/
        /*.content {
    text-align: center;
}*/
        .blockheader {
            background: #fff;
            padding: .71428571rem 1rem;
            box-shadow: none;
            border-top: 1px solid #d4d4d5;
            border-left:1px solid #d4d4d5;
            border-right:1px solid #d4d4d5;
            margin: 20px 0 0 0 ;
            border-radius: .28571429rem .28571429rem 0 0;
            background: #f3f4f5;
        }

        .blockheader+.content{
           border: 1px solid #d4d4d5;
           border-radius: 0 0 .28571429rem .28571429rem ;
           padding:1em;
        }

        .content .t-container {
            padding: 0;
        }

        .t-container .t-container-static .t-col {
            padding: 0px;
        }

        .t-container.t-container-static {
            padding: 15px 0px 0px 0px !important;
        }


        .noPadding {
            padding: 0px;
        }

        @media only screen and (min-width: 769px) {

            .pageLayout .header {
                padding: 4% 4% 0;
            }
        }

        @media only screen and (max-width: 768px) {

            .pageLayout .header {
                text-align: center;
            }
        }

    </style>
    <script id="Paralleljs" type="text/javascript">

        var ajaxManager;

        function Send() {
            if (ajaxManager == null)
                ajaxManager = $find("<%= RadAjaxManager1.ClientID %>");
            ajaxManager.ajaxRequest(JSON.stringify({ "Key": "Send", "Value": "" }));
            return false;
        }

        function Return() {
            if (ajaxManager == null)
                ajaxManager = $find("<%= RadAjaxManager1.ClientID %>");
            ajaxManager.ajaxRequest(JSON.stringify({ "Key": "Return", "Value": "" }));
            return false;
        }

        function OnBarMainClick(sender, args) {
            var formVersionId = $uof.tool.htmlDecode('<%=System.Web.Security.AntiXss.AntiXssEncoder.HtmlEncode(formVersionId,true)%>');
            var dialogTitleName = $uof.tool.htmlDecode('<%=System.Web.Security.AntiXss.AntiXssEncoder.HtmlEncode(dialogTitleName,true)%>');

            if (args.get_item().get_value() == "ShowFlow") {
                args.set_cancel(true);
                $uof.dialog.open2("~/WKF/Browse/ViewMasterFlow.aspx", args.get_item(), dialogTitleName, 1280, 1080, openDialogResult, { "formVersionId": formVersionId });
            }
        }
    
        function NotifyAdmin(taskId) {
            $uof.dialog.open2("~/WKF/FormUse/DefinedTask/NotifyAdmin.aspx", "", "", 550, 390, function checkReturn(returnValue) {
                if (typeof (returnValue) != undefined) {
                    $uof.dialog.close();
                }
            }, { "taskId": taskId });
        }

        function openDialogResult(returnValue) {
            if (typeof (returnValue) == "undefined") {
                return false;
            }
            return true;
        }
    </script>

    <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server" OnAjaxRequest="RadAjaxManager1_AjaxRequest"></telerik:RadAjaxManager>
    <telerik:RadToolBar ID="webToolBar" runat="server" OnClientButtonClicking="OnBarMainClick"
        OnButtonClick="webToolBar_ButtonClick" Width="100%">
        <Items>
            <telerik:RadToolBarButton runat="server"  
                meta:resourceKey="TBarButtonResource1"
                CheckedImageUrl="~/Common/Images/Icon/icon_m101.gif"
                DisabledImageUrl="~/Common/Images/Icon/icon_m101.gif" 
                HoveredImageUrl="~/Common/Images/Icon/icon_m101.gif"
                ImageUrl="~/Common/Images/Icon/icon_m101.gif" Text="觀看表單流程" Value="ShowFlow" >
            </telerik:RadToolBarButton>
            <telerik:RadToolBarButton runat="server" IsSeparator="true" Value="sShowFlow" >
            </telerik:RadToolBarButton>
        </Items>
    </telerik:RadToolBar>

    <asp:Table ID="Table1" runat="server" meta:resourcekey="Table1Resource1" Width="100%"></asp:Table>
    <div id="hiddenFieldDiv" style="display:none">
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
        <asp:HiddenField ID="HiddenSiteType" runat="server" />
        <asp:HiddenField ID="HiddenIsWait" runat="server" />
        <asp:HiddenField ID="hfIsSuspended" runat="server" />
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
        <asp:RadioButtonList ID="rblSignResult" runat="server" RepeatDirection="Horizontal" meta:resourcekey="rblSignResultResource1">
            <asp:ListItem Selected="True" Value="Approve" Text="同意" meta:resourcekey="ListItemResource1"></asp:ListItem>
            <asp:ListItem Value="DisApprove" Text="否決" meta:resourcekey="ListItemResource2"></asp:ListItem>
            <asp:ListItem Value="Pass" Text="無意見" meta:resourcekey="ListItemResource3"></asp:ListItem>
        </asp:RadioButtonList>
    </div>
    <asp:Label ID="lblSendContinue" runat="server" Text="確定後繼續" Visible="False" meta:resourcekey="lblSendContinueResource1"></asp:Label>
    <asp:Label ID="lblSignFail" runat="server" Text="簽核失敗，可能同時間有人異動表單狀態" Visible="False" meta:resourcekey="lblSignFailResource1" ></asp:Label>
    <asp:Label ID="lblSubmitTxt" runat="server" Text="確定" Visible="False" meta:resourcekey="lblSubmitTxtResource1"></asp:Label>
    <asp:Label ID="lblSendMsg" runat="server" meta:resourcekey="lblSendMsgResource1" Text="表單 {0} 已建立"  Visible="False"></asp:Label>
    <asp:Label ID="lblFormNum" runat="server" meta:resourcekey="lblFormNumResource1" Text="表單編號為:" Visible="False"></asp:Label>
    <asp:Label ID="lblNotifyAdmin" runat="server" Text="通知管理員" Visible="False" meta:resourcekey="lblNotifyAdminResource1" ></asp:Label>
    <asp:Label ID="lblReturn" runat="server" Text="返回" Visible="False" ></asp:Label>
    <asp:Label ID="lblCustomAutoNumberCreateFailed" runat="server" Text="自訂編號錯誤：" Visible="False" meta:resourcekey="lblCustomAutoNumberCreateFailedResource1" ></asp:Label>

    <asp:Label ID="lblFormIsApproval" runat="server" ForeColor="Red" Text="表單審核中，不可重複送審。" Visible="False" meta:resourcekey="lblFormIsApprovalResource1"></asp:Label>
    <asp:Label ID="lblFormWaitRelease" runat="server" ForeColor="Red" Text="表單待發佈中，不可重複送審。" Visible="False" meta:resourcekey="lblFormWaitReleaseResource1"></asp:Label>
    <asp:Label ID="lblFormSettingDisabledForApply" runat="server" ForeColor="Red" Text="已關閉表單審核功能，無法申請。" Visible="False" meta:resourcekey="lblFormSettingDisabledForApplyResource1"></asp:Label>
    <asp:Label ID="lblNoAllowApply" runat="server" Text="此張表單目前不允許申請" Visible="False" meta:resourcekey="lblNoAllowApplyResource1"></asp:Label>

</asp:Content>