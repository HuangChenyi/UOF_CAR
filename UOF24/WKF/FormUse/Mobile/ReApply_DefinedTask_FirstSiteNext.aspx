<%@ Page Title="" Language="C#" MasterPageFile="~/Master/MobileMasterPage.master" AutoEventWireup="true" CodeBehind="ReApply_DefinedTask_FirstSite.aspx.cs" Inherits="Ede.Uof.Web.WKF.FormUse.Mobile.ReApply_DefinedTask_FirstSite" %>
<%@ Register Src="~/Common/ChoiceCenter/UC_ChoiceList.ascx" TagName="UC_ChoiceList" TagPrefix="uc1" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register Src="~/Common/ChoiceCenter/UC_ChoiceListMobile.ascx" TagPrefix="uc1" TagName="UC_ChoiceListMobile" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
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
        }
        .RadForm_MetroTouch label.title {
            font-size: 100% !important;
            font-weight: 700 !important;
                
            margin: 0 0 .28571429rem !important;
        }

        .pageLayout {
            
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
                /*background-color: #ee6e73;*/
                background-color:#F6511D;
                color: #ffffff;
                line-height: 40px;
                width: 100%;
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
            
            padding: .5rem 1rem;           
            box-shadow: none;
            border-top: 1px solid #d4d4d5;
            border-left:1px solid #d4d4d5;
            border-right:1px solid #d4d4d5;
            margin: 20px 0 0 0 ;
            border-radius: .28571429rem .28571429rem 0 0;
            background: #7FB800;
            color:#fff;

        }
        .blockheader+.content{
           border: 1px solid #d4d4d5;
           border-radius: 0 0 .28571429rem .28571429rem ;
           padding:1em;
        }

        .content.nopadding{
           padding:1em 0;
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

        

        @media only screen and (min-width: 769px) {

            /*.pageLayout .header {
                padding: 4% 4% 0;
            }*/
            .pageLayout .header {
                text-align: center;
            }
        }

        @media only screen and (max-width: 768px) {

            .pageLayout .header {
                text-align: center;
            }
        }

        </style>
    <script id="mainjs" type="text/javascript">
        $(function () {
            if ($uof.tool.htmlDecode('<%=System.Web.Security.AntiXss.AntiXssEncoder.HtmlEncode(Request.QueryString["isMNext"],true)%>').toLowerCase() == 'true') {
                window.close = function () {
                    setInterval(function () {
                        window.location.href = '#InAppBrowserClosed';
                    }, 300);
                };
            };
        })
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
            var srcSiteId = $uof.tool.htmlDecode('<%=System.Web.Security.AntiXss.AntiXssEncoder.HtmlEncode(HiddenSrcSiteId.Value,true)%>');
            var custSiteId = $uof.tool.htmlDecode('<%=System.Web.Security.AntiXss.AntiXssEncoder.HtmlEncode(HiddenCustSiteId.Value,true)%>');
            var taskId = $uof.tool.htmlDecode('<%=System.Web.Security.AntiXss.AntiXssEncoder.HtmlEncode(taskId,true)%>');
            if (args.get_item().get_value() == "ReturnForm") {
                args.set_cancel(true);

            }
            else if (args.get_item().get_value() == "ShowFlow") {
                args.set_cancel(true);
                $uof.dialog.open2('~/WKF/Browse/ViewMasterFlow.aspx', args.get_item(), dialogTitleName, 800, 650, openDialogResult, { "formVersionId": formVersionId, "flowId": flowId });
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
            $uof.dialog.open2('~/WKF/FormUse/DefinedTask/NotifyAdmin.aspx', '', 255, 320,
                function getReturn(returnValue) {
                    if (typeof (returnValue) != "undefined") {
                        $uof.dialog.close();
                        return true;
                    }
                    return false;
                });
        }

    </script>
    <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server" OnAjaxRequest="RadAjaxManager1_AjaxRequest" ></telerik:RadAjaxManager>
    <div class="pageLayout" id="layout" runat="server" visible="false">
        <telerik:RadPageLayout runat="server" GridType="Fluid" ShowGrid="true" HtmlTag="None">
            <telerik:LayoutRow RowType="Generic">
                <Rows>
                    <telerik:LayoutRow RowType="Generic" CssClass="content">
                        <Rows>
                            <telerik:LayoutRow RowType="Container" WrapperHtmlTag="Div">
                                <Columns>
                                    <telerik:CompositeLayoutColumn Span="12">
                                        <Content>
                                            <h3 class="blockheader">
                                                <asp:Label ID="lblNextSiteInfo" runat="server" EnableViewState="False" Text="下一站點資訊"
                                                    meta:resourcekey="lblNextSiteInfoResource1"></asp:Label>
                                            </h3>
                                        </Content>
                                        <Rows>
                                            <telerik:LayoutRow RowType="Generic" CssClass="content">
                                                <Rows>
                                                    <telerik:LayoutRow  ID="lrSignType" runat="server">
                                                        <Columns>
                                                            <telerik:LayoutColumn Span="12" ID="lcSignType" runat="server" Visible="false">
                                                                <label class="title">
                                                                    <asp:Literal ID="lblTitleSignKing" runat="server" Text="簽核" meta:resourcekey="lblTitleSignKingResource1"></asp:Literal>
                                                                </label>
                                                            </telerik:LayoutColumn>
                                                            <telerik:LayoutColumn Span="12">
                                                                <asp:RadioButtonList ID="rblSignType" runat="server" meta:resourcekey="rblSignTypeResource1"
                                                                    RepeatDirection="Horizontal" AutoPostBack="True" OnSelectedIndexChanged="rblSignType_SelectedIndexChanged">
                                                                    <asp:ListItem meta:resourcekey="ListItemResource6" Selected="True" Value="General"
                                                                        Text="一般"></asp:ListItem>
                                                                    <asp:ListItem meta:resourcekey="ListItemResource7" Value="Or" Text="並簽"></asp:ListItem>
                                                                    <asp:ListItem meta:resourcekey="ListItemResource8" Value="And" Text="會簽"></asp:ListItem>
                                                                </asp:RadioButtonList>
                                                            </telerik:LayoutColumn>
                                                        </Columns>
                                                    </telerik:LayoutRow>
                                                    <telerik:LayoutRow>
                                                        <Columns>
                                                            <telerik:LayoutColumn Span="12">
                                                                <label class="title">
                                                                    <asp:Literal ID="lblSignerHead" runat="server" Text="簽核" meta:resourcekey="lblSignerHeadResource2"></asp:Literal>
                                                                </label>
                                                            </telerik:LayoutColumn>
                                                            <telerik:LayoutColumn Span="12">
                                                                <uc1:UC_ChoiceListMobile runat="server" ID="UC_ChoiceListMobile" Visible="false" />
                                                                <uc1:UC_ChoiceList ID="UC_ChoiceListAllSigner" runat="server" ShowMember="False" Visible="true" />
                                                            </telerik:LayoutColumn>
                                                        </Columns>
                                                    </telerik:LayoutRow>
                                                    <telerik:LayoutRow>
                                                        <Columns>
                                                            <telerik:LayoutColumn Span="12">
                                                                <asp:Label ID="lblAssignAbleSite" runat="server" Text="下一站點為[指定式站點]，請設定站點資訊後送出!<br>"
                                                                    Visible="False" meta:resourcekey="lblAssignAbleSiteResource1"></asp:Label>
                                                                <asp:Label ID="lblFreeSite" runat="server" Text="下一站點為[自由流程站點]，請設定站點資訊後送出!<br>" Visible="False"
                                                                    meta:resourcekey="lblFreeSiteResource1"></asp:Label>
                                                                <asp:Label ID="lblSiteKind" runat="server" meta:resourcekey="lblSiteKindResource1"></asp:Label>
                                                                <asp:Label ID="lblMsg" runat="server" ForeColor="Red" meta:resourcekey="lblMsgResource1"></asp:Label>
                                                                <asp:Label id="lblNotifyMsg" runat="server" CssClass="SizeMemo"></asp:Label>
                                                                <asp:CustomValidator ID="CustomValidatorCustSite" runat="server" ErrorMessage="下一站為自訂流程站點，行動裝置不支援"
                                                                    Display="Dynamic" meta:resourcekey="CustomValidatorCustSiteResource1" EnableTheming="true"></asp:CustomValidator>
                                                                <asp:CustomValidator ID="CustomValidatorGroupSite" runat="server" ErrorMessage="下一站為自選流程站點，行動裝置不支援"
                                                                    Display="Dynamic" meta:resourcekey="CustomValidatorGroupSiteResource1" EnableTheming="true"></asp:CustomValidator>
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
                                                                <asp:HiddenField ID="hfHasSkippedSite" runat="server" Value="False" />
                                                                <asp:Label ID="lblGeneralSite" runat="server" Text="一般站點" Visible="False" meta:resourcekey="lblGeneralSiteResource1"></asp:Label>
                                                                <asp:Label ID="lblEroMsgCondExec" runat="server" Text="條件異常" Visible="False" meta:resourcekey="lblEroMsgCondExecResource1"></asp:Label>
                                                                <asp:Label ID="lblSend" runat="server" Text="送出" Visible="False" meta:resourcekey="lblSendResource1"></asp:Label>&nbsp;
                                                                <asp:Label ID="lblJump" runat="server" Text="跳簽" Visible="False" meta:resourcekey="lblJumpResource1"></asp:Label>
                                                                <asp:Label ID="lblException" runat="server" Text="異常送出" Visible="False" meta:resourcekey="lblExceptionResource1"></asp:Label>&nbsp;
                                                                <asp:Label ID="lblNoSignerMsg" runat="server" EnableViewState="False" ForeColor="Red" Text="至少需有一名簽核人員，才能送往下一站點！" Visible="False" meta:resourcekey="lblNoSignerMsgResource1"></asp:Label>
                                                                <asp:Label ID="lblSiteGeneralMsg" runat="server" EnableViewState="False" ForeColor="Red" meta:resourcekey="lblSiteGeneralMsgResource1" Text="一般站點不允許多人簽核，請修改下一站點資訊或聯絡管理人員修改流程!<br>" Visible="False"></asp:Label>
                                                                <asp:Label ID="lblEndSiteMsg" runat="server" Text="找不到下一站點！此人已是最末站點，按下送出即結案！" Visible="False"
                                                                    meta:resourcekey="lblEndSiteMsgResource1"></asp:Label>
                                                                <asp:Label ID="lblMsgConditionExcept" runat="server" EnableViewState="False" ForeColor="Red"
                                                                    Text="流程條件異常，所以不能正確取得下一站點資訊，請修正表單，或按下異常送出，由管理人員將此表單轉成自由流程送出！<br>" Visible="False"
                                                                    meta:resourcekey="lblMsgConditionExceptResource1"></asp:Label>
                                                                <asp:Label ID="lbeAgentMsg" runat="server" meta:resourcekey="lbeAgentMsgResource1"
                                                                    Text="下列人員有啟動代理設定，但系統找不到他的代理人，表單將只會送給原簽核者!" Visible="False"></asp:Label>
                                                                <asp:Label ID="lblSendMsg" runat="server" meta:resourcekey="lblSendMsgResource1" Text="表單已送出" Visible="False"></asp:Label>
                                                                <asp:Label ID="lblFormNum" runat="server" meta:resourcekey="lblFormNumResource1" Text="表單編號為:" Visible="False"></asp:Label>
                                                                <asp:Label ID="lblGeneral" runat="server" meta:resourcekey="lblGeneralResource1" Text="一般" Visible="False"></asp:Label>
                                                                <asp:Label ID="lblAnd" runat="server" meta:resourcekey="lblAndResource1" Text="會簽" Visible="False"></asp:Label>
                                                                <asp:Label ID="lblOr" runat="server" meta:resourcekey="lblOrResource1" Text="並簽" Visible="False"></asp:Label>
                                                                <asp:Label ID="lblSiteExceptMsg1" runat="server" Text="站點異常：簽核型態為一般，簽核者只允許一位" Visible="False"
                                                                    meta:resourcekey="lblSiteExceptMsg1Resource1"></asp:Label>
                                                                <asp:Label ID="lblSiteExceptMsg2" runat="server" Text="站點異常：找不到任何一位簽核者" Visible="False" meta:resourcekey="lblSiteExceptMsg2Resource1"></asp:Label>
                                                                <asp:Label ID="lblSignerSuspended" runat="server" Text="下一站簽核者帳號已被停用，表單送出後系統會同步通知管理員進行表單指定簽核，以避免影響簽核時效性。" Visible="False" meta:resourcekey="lblSignerSuspendedResource1"></asp:Label>
                                                                <asp:Label ID="lblJobTitleMsg" runat="server" Text="此人無設定職級，無法尋找節點！" Visible="False" meta:resourcekey="lblJobTitleMsgResource1"></asp:Label>
                                                                <asp:Label ID="lblAlertSendByExcept" runat="server" meta:resourcekey="lblAlertSendByExceptResource1" Text="你選擇了異常送出，表單將會送給電子簽核管理者，由其將表單轉為自由流程後送出，確定嗎？" Visible="False"></asp:Label>
                                                                <asp:Label ID="lblNotifyAdmin" runat="server" Text="通知管理員" Visible="False" meta:resourcekey="lblNotifyAdminResource1"></asp:Label>
                                                                <asp:Label ID="lblExternalDllFormatErrorMsg" runat="server" EnableViewState="False" ForeColor="Red" Text="下一站點為[應用程式站點]，組件回傳的XML結構有誤，請聯絡管理人員!<br>" Visible="False"
                                                                    meta:resourcekey="lblExternalDllFormatErrorMsgResource1"></asp:Label>
                                                                <asp:Label ID="lblExternalAccountNotExistMsg" runat="server" EnableViewState="False" ForeColor="Red" Text="下一站點為[應用程式站點]，組件回傳的XML結構中的人員帳號未存在UOF系統中，請聯絡管理人員!<br>" Visible="False"
                                                                    meta:resourcekey="lblExternalAccountNotExistMsgResource1"></asp:Label>
                                                                <asp:Label ID="Label1" runat="server" ForeColor="Red" meta:resourcekey="lblMsgResource1"></asp:Label>
                                                                <asp:HiddenField ID="hidSignedAlertXml" runat="server" />
                                                                <asp:Label ID="lblNoAuth" runat="server" meta:resourcekey="lblNoAuthResource1" Text="無權限處理或觀看此表單" Visible="False"></asp:Label>
                                                            </telerik:LayoutColumn>
                                                        </Columns>
                                                    </telerik:LayoutRow>
                                                </Rows>
                                            </telerik:LayoutRow>
                                        </Rows>

                                    </telerik:CompositeLayoutColumn>


                                </Columns>
                            </telerik:LayoutRow>
                        </Rows>
                    </telerik:LayoutRow>
                </Rows>
            </telerik:LayoutRow>
        </telerik:RadPageLayout>
    </div>

    <table cellpadding="0" cellspacing="0" width="100%" style="display:none">
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
    <table width="100%" class="PopTable" cellspacing="1" style="display:none">
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
                    </center>
            </td>
        </tr>
        <tr>
            <td>
                
            </td>
            <td>
                <asp:Label ID="lblSignType" runat="server" meta:resourcekey="lblSignTypeResource1"></asp:Label>
              
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
                
            </td>
            <td>
                
            </td>
            <td>
                <asp:Label ID="lblAlertHead" runat="server" Text="知會" meta:resourcekey="lblAlertHeadResource1"></asp:Label>
            </td>
            <td>
                <uc1:UC_ChoiceList ID="UC_ChoiceListAllAlert" runat="server" ShowMember="False" />
            </td>
        </tr>
    </table>
   
</asp:Content>
