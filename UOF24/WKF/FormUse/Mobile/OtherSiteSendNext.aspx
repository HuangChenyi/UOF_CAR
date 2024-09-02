<%@ Page Title="" Language="C#" MasterPageFile="~/Master/MobileMasterPage.master" AutoEventWireup="true" CodeBehind="OtherSiteSend.aspx.cs" Inherits="Ede.Uof.Web.WKF.FormUse.Mobile.OtherSiteSend" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" %>
<%@ Register Src="~/Common/ChoiceCenter/UC_ChoiceList.ascx" TagName="UC_ChoiceList" TagPrefix="uc1" %>
<%@ Register Src="~/Common/ChoiceCenter/UC_ChoiceListMobile.ascx" TagPrefix="uc1" TagName="UC_ChoiceListMobile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        .panelDiv {padding:0px;border:solid 1px black;vertical-align:top;display:none}
        .formTitle {
            background-image: url(../../App_Themes/DefaultTheme/images/po_06.gif);
            text-align: center;
            height: 20px;
        }

        .formInfo {
            background-color: White;
            vertical-align: top;
        }
        /*common*/

        .RadForm_MetroTouch .rfdSelect, .RadForm_Silk .rfdSelect, .RadForm_Silk .rfdSelectBox {
            font-size: 100% !important;
        }

        .rfdSelectBox li {
            height: 1.8em;
            line-height: 1em;
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
                font-size: 133%;
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
                background-color: #F6511D;
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
            border-left: 1px solid #d4d4d5;
            border-right: 1px solid #d4d4d5;
            margin: 20px 0 0 0;
            border-radius: .28571429rem .28571429rem 0 0;
            background: #7FB800;
            color: #fff;
        }

            .blockheader + .content {
                border: 1px solid #d4d4d5;
                border-radius: 0 0 .28571429rem .28571429rem;
                padding: 1em;
            }

        .content.nopadding {
            padding: 1em 0;
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

        .MobileFormList {
            background-clip: padding-box;
            border-bottom-left-radius: 5px;
            border-bottom-right-radius: 5px;
            border-top-left-radius: 5px;
            border-top-right-radius: 5px;
            color: rgb(51, 51, 51);
            display: block;
            font-family: sans-serif;
            font-size: 14px;
            line-height: 20.8px;
            list-style-image: none;
            list-style-position: outside;
            list-style-type: none;
            margin-bottom: 0px;
            margin-left: 0px;
            margin-right: 0px;
            margin-top: 0px;
            padding-bottom: 0px;
            padding-left: 0px;
            padding-right: 0px;
            padding-top: 0px;
            text-shadow: rgb(243, 243, 243) 0px 1px 0px;
        }

            .MobileFormList .group {
                cursor: default;
                display: block;
                font-size: 1.0em;
                font-weight: bold;
                line-height: 1.3em;
                list-style-image: none;
                list-style-position: outside;
                list-style-type: none;
                margin-bottom: 0px;
                margin-left: 0px;
                margin-right: 0px;
                margin-top: 0px;
                outline-color: rgb(51, 51, 51);
                outline-style: none;
                outline-width: 0px;
                overflow-x: hidden;
                overflow-y: hidden;
                padding-bottom: 7px;
                padding-left: 4px;
                padding-right: 8px;
                padding-top: 7px;
                position: relative;
                text-align: left;
                border-bottom-color: #999;
                border-bottom-style: solid;
                border-bottom-width: 1.5px;
            }

            .MobileFormList .item {
                font-size: 1em;
                line-height: 1.0em;
                display: block;
                list-style-image: none;
                list-style-position: outside;
                list-style-type: none;
                margin-bottom: 0px;
                margin-left: 0px;
                margin-right: 0px;
                margin-top: 0px;
                overflow-x: visible;
                overflow-y: visible;
                padding-bottom: 0px;
                padding-left: 0px;
                padding-right: 0px;
                padding-top: 0px;
                position: relative;
                text-align: left;
                text-shadow: rgb(243, 243, 243) 0px 1px 0px;
            }

                .MobileFormList .item div {
                    border-top-color: rgb(221, 221, 221);
                    border-top-style: solid;
                    border-top-width: 1px;
                    color: rgb(51, 51, 51);
                    display: block;
                    font-size: 16px;
                    line-height: 20.8px;
                    list-style-image: none;
                    list-style-position: outside;
                    list-style-type: none;
                    margin-bottom: 0px;
                    margin-left: 0px;
                    margin-right: 0px;
                    margin-top: 0px;
                    overflow-x: hidden;
                    overflow-y: hidden;
                    padding-bottom: 11.2px;
                    padding-left: 16px;
                    padding-right: 8px;
                    padding-top: 11.2px;
                    position: relative;
                    text-align: left;
                    text-decoration: none;                    
                }

                    .MobileFormList .item div span:nth-child(1) {
                        display: block;
                        font-size: 95%;
                        float: left;
                        margin-bottom: 3px;
                        text-shadow: rgb(243, 243, 243) 0px 1px 0px;
                        font-weight: 600;
                    }

                    .MobileFormList .item div span:nth-child(2) {
                        display: block;
                        font-size: 95%;
                        float: right;
                       font-weight: normal;
                    }

                    .MobileFormList .item div span:nth-child(3) {
                        display: block;
                        font-size: 90%;
                        clear: both;
                        color:rgba(51,51,51,0.9);
                    }

                    .MobileFormList .item div span:nth-child(4) {
                        display: block;
                        font-size: 90%;
                        font-weight: normal;
                    }
    </style>
    <script>
        var ajaxManager;
        $(function() {
            if ($uof.tool.htmlDecode('<%=System.Web.Security.AntiXss.AntiXssEncoder.HtmlEncode(Request.QueryString["isMNext"],true)%>').toLowerCase() == 'true') {
                window.close = function () {
                    setInterval(function () {
                        window.location.href = '#InAppBrowserClosed';
                    }, 300);
                };
            }
        });
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
    </script>
    <div id="Ajax" runat="server">

    </div>
        <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server" OnAjaxRequest="RadAjaxManager1_AjaxRequest"></telerik:RadAjaxManager>
    <asp:UpdatePanel ID="updatepanel1" runat="server"><ContentTemplate>
    <div class="pageLayout" id="layout" runat="server">
        
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
                                                <asp:Label ID="Label5" runat="server" Text="下一站點資訊" meta:resourcekey="Label5Resource1"></asp:Label>
                                            </h3>
                                        </Content>
                                        <Rows>
                                            <telerik:LayoutRow RowType="Generic" CssClass="content">
                                                <Rows>
                                                    <telerik:LayoutRow ID="masterSelect" runat="server">
                                                        <Columns>
                                                            <telerik:LayoutColumn Span="12">
                                                                <label class="title">
                                                                    <asp:Literal ID="lblMasterFlow" runat="server" EnableViewState="False" Text="主流程" meta:resourcekey="lblMasterFlowResource1"></asp:Literal>
                                                                </label>
                                                            </telerik:LayoutColumn>
                                                            <telerik:LayoutColumn Span="12">
                                                                <asp:RadioButtonList ID="rblMasterFlow" runat="server" RepeatDirection="Vertical"
                                                                    OnSelectedIndexChanged="rblMasterFlow_SelectedIndexChanged" AutoPostBack="True"
                                                                    meta:resourcekey="rblMasterFlowResource1">
                                                                    <asp:ListItem Value="Y" Text="結案" meta:resourcekey="rblMasterFlowItem1Resource"></asp:ListItem>
                                                                    <asp:ListItem Value="N" Text="下一站點" meta:resourcekey="rblMasterFlowItem2Resource"></asp:ListItem>
                                                                </asp:RadioButtonList>
                                                            </telerik:LayoutColumn>
                                                        </Columns>
                                                    </telerik:LayoutRow>
                                                    <telerik:LayoutRow ID="subSelect" runat="server">
                                                        <Columns>
                                                            <telerik:LayoutColumn Span="12">
                                                                <label class="title">
                                                                    <asp:Literal ID="lobSubFlow" runat="server" EnableViewState="False" Text="副流程" meta:resourcekey="lobSubFlowResource1"></asp:Literal>
                                                                </label>
                                                            </telerik:LayoutColumn>
                                                            <telerik:LayoutColumn Span="12">
                                                                <asp:RadioButtonList ID="rblSubFlow" runat="server" RepeatDirection="Vertical"
                                                                    OnSelectedIndexChanged="rblSubFlow_SelectedIndexChanged" AutoPostBack="True"
                                                                    meta:resourcekey="rblSubFlowResource1">
                                                                    <asp:ListItem Value="Y" Text="結束" meta:resourcekey="rblSubFlowItem1Resource"></asp:ListItem>
                                                                    <asp:ListItem Value="N" Text="下一站點" meta:resourcekey="rblSubFlowItem2Resource"></asp:ListItem>
                                                                </asp:RadioButtonList>
                                                            </telerik:LayoutColumn>
                                                        </Columns>
                                                    </telerik:LayoutRow>
                                                    <telerik:LayoutRow ID="LayoutRow1" runat="server">
                                                        <Columns>
                                                            <telerik:LayoutColumn Span="12">
                                                                <label class="title">
                                                                    <asp:Literal ID="lblNextSiteSet" runat="server" EnableViewState="False" Text="簽核型態"
                                                                        meta:resourcekey="lblNextSiteSetResource1"></asp:Literal>
                                                                </label>
                                                            </telerik:LayoutColumn>
                                                            <telerik:LayoutColumn Span="12">
                                                                <asp:RadioButtonList ID="rblSignType" runat="server" RepeatDirection="Vertical"
                                                                    AutoPostBack="True" OnSelectedIndexChanged="rblSignType_SelectedIndexChanged"
                                                                    meta:resourcekey="rblSignTypeResource1">
                                                                    <asp:ListItem Selected="True" Value="General" Text="一般" meta:resourcekey="ListItemResource8"></asp:ListItem>
                                                                    <asp:ListItem Value="Or" Text="並簽" meta:resourcekey="ListItemResource9"></asp:ListItem>
                                                                    <asp:ListItem Value="And" Text="會簽" meta:resourcekey="ListItemResource10"></asp:ListItem>
                                                                </asp:RadioButtonList>
                                                            </telerik:LayoutColumn>
                                                        </Columns>
                                                    </telerik:LayoutRow>
                                                    <telerik:LayoutRow ID="PanelNextSite" runat="server">
                                                        <Columns>
                                                            <telerik:LayoutColumn Span="12">
                                                                <label class="title">
                                                                    <asp:Literal ID="lblNextSiteSigner" runat="server" EnableViewState="False" Text="簽核人員"
                                                                        meta:resourcekey="lblNextSiteSignerResource1"></asp:Literal>
                                                                </label>
                                                            </telerik:LayoutColumn>
                                                            <telerik:LayoutColumn Span="12">
                                                                <uc1:UC_ChoiceListMobile runat="server" ID="UC_ChoiceListMobile" Visible="false" />
                                                                <uc1:UC_ChoiceList ID="UC_ChoiceList_Signer" runat="server" ShowMember="false" Visible="true" />
                                                            </telerik:LayoutColumn>
                                                        </Columns>
                                                    </telerik:LayoutRow>
                                                    <telerik:LayoutRow>
                                                        <Columns>
                                                            <telerik:LayoutColumn Span="12">
                                                                <asp:Label ID="lblNotifyMsg" runat="server" CssClass="SizeMemo" meta:resourcekey="lblNotifyMsgResource1"></asp:Label>
                                                                <asp:Label ID="lblNoTitle" runat="server" ForeColor="Red" Text="找不到簽核者的職級，下一站點為副流程且起始依據為上一站點簽核者的部門及職級!<br>"
                                                                    Visible="False" EnableViewState="False" meta:resourcekey="lblNoTitleResource2"></asp:Label>
                                                                <asp:Label ID="lblParallelFlowAndCustSite" runat="server" Text="平行流程站點，不支援自訂流程！"
                                                                    Visible="False" ForeColor="Red" meta:resourcekey="lblParallelFlowAndCustSiteResource1"></asp:Label>
                                                                <asp:Label ID="lblMsgSubFlowNotSupportAndSite" runat="server" ForeColor="Red" Text="會簽站點不支援起始依據為上一站點簽核者的部門和職級!<br>"
                                                                    Visible="False" EnableViewState="False" meta:resourcekey="lblMsgSubFlowNotSupportAndSiteResource1"></asp:Label>
                                                                <asp:Label ID="lblMsgAssignSite" runat="server" ForeColor="Blue" Text="下一站點為[指定式站點]，請設定站點資訊後送出!<br>"
                                                                    Visible="False" EnableViewState="False" meta:resourcekey="lblMsgAssignSiteResource1"></asp:Label>
                                                                <asp:Label ID="lblMsgFreeSite" runat="server" ForeColor="Blue" Text="下一站點為[自由流程站點]，請設定站點資訊後送出!<br>"
                                                                    Visible="False" EnableViewState="False" meta:resourcekey="lblMsgFreeSiteResource1"></asp:Label>
                                                                <asp:Label ID="lblSysMsg" runat="server" EnableViewState="False" meta:resourcekey="lblSysMsgResource1"></asp:Label><br/>
                                                                <asp:Label ID="lblMsg" runat="server" ForeColor="Red" meta:resourcekey="lblMsgResource1"></asp:Label>                                                                
                                                                <asp:CustomValidator ID="CustomValidatorCustSite" runat="server" Display="Dynamic" EnableTheming="true"
                                                                    ErrorMessage="下一站為自訂流程站點，行動裝置不支援" meta:resourcekey="CustomValidatorCustSiteResource1"></asp:CustomValidator>
                                                                <asp:CustomValidator ID="CustomValidatorGroupSite" runat="server" Display="Dynamic"  EnableTheming="true"
                                                                    ErrorMessage="下一站為自選流程站點，行動裝置不支援" meta:resourcekey="CustomValidatorGroupSiteResource1"></asp:CustomValidator>
                                                                <asp:CustomValidator ID="CustomValidatorAdditionalSite" runat="server" Display="Dynamic"  EnableTheming="true"
                                                                    ErrorMessage="加簽站點至少需要有一名簽核人員!" meta:resourcekey="CustomValidatorAdditionalSiteResource1"></asp:CustomValidator>
                                                                <asp:Label ID="lblMsgAgentExcept" runat="server" ForeColor="Red" Text="下列人員有啟動代理設定，但系統找不到他的代理人，表單將只會送給原簽核者!"
                                                                    Visible="False" EnableViewState="False" meta:resourcekey="lblMsgAgentExceptResource1"></asp:Label>
                                                                <asp:Panel ID="panelAgent" runat="server" Width="100%" meta:resourcekey="panelAgentResource1">
                                                                    <asp:Label ID="lblAgentList" runat="server" ForeColor="Red" Text="" EnableViewState="False"
                                                                        meta:resourcekey="lblAgentListResource1"></asp:Label>
                                                                </asp:Panel>
                                                                <asp:Label ID="lblMsgLastSite" runat="server" ForeColor="Red" Text="目前站點為流程中可簽核的最後一個站點，你確定要結案嗎？"
                                                                    Visible="False" EnableViewState="False" meta:resourcekey="lblMsgLastSiteResource1"></asp:Label>
                                                                <asp:Label ID="lblMsgLastSubSite" runat="server" ForeColor="Red" Text="目前站點為副流程的最後一個站點!"
                                                                    Visible="False" EnableViewState="False" meta:resourcekey="lblMsgLastSubSiteResource1"></asp:Label>
                                                                <asp:Label ID="lblMsgNonResult" runat="server" ForeColor="Red" Text="目前簽核狀況尚未達成簽核共識，請點選送出，等待其他人員簽核!"
                                                                    Visible="False" EnableViewState="False" meta:resourcekey="lblMsgNonResultResource1"></asp:Label>
                                                                <asp:Label ID="lblMsgDisapprove" runat="server" ForeColor="Red" Text="你選擇了否決此張表單，表單將在此結案，你確定嗎？"
                                                                    Visible="False" EnableViewState="False" meta:resourcekey="lblMsgDisapproveResource1"></asp:Label>
                                                                <asp:Label ID="lblMsgNonFoundNextSite" runat="server" ForeColor="Red" Text="主流程中，已無更適合簽核的職級！你確定在此結案嗎？<br>"
                                                                    Visible="False" EnableViewState="False" meta:resourcekey="lblMsgNonFoundNextSiteResource1"></asp:Label>
                                                                <asp:Label ID="lblMsgNonFoundNextSubSite" runat="server" ForeColor="Blue" Text="副流程中已無更適合簽核的職級!<br>"
                                                                    Visible="False" EnableViewState="False" meta:resourcekey="lblMsgNonFoundNextSubSiteResource1"></asp:Label>
                                                                <asp:Label ID="lblMsgEndMasterByChoice" runat="server" ForeColor="Blue" Text="結案選項被勾選，你確定要結案嗎？<br>"
                                                                    Visible="False" EnableViewState="False" meta:resourcekey="lblMsgEndMasterByChoiceResource1"></asp:Label>
                                                                <asp:Label ID="lblMsgEndSubByChoice" runat="server" ForeColor="Blue" Text="副流程結束選項被勾選，副流程將會在此結束<br>"
                                                                    Visible="False" EnableViewState="False" meta:resourcekey="lblMsgEndSubByChoiceResource1"></asp:Label>
                                                                <asp:Label ID="lblMsgFlowBaseExcept" runat="server" ForeColor="Red" Text="下一站點的流程起始依據異常，請選擇起始群組與職級，如果你選擇異常送出，則表單會由管理人員進行後續處理!<br>"
                                                                    Visible="False" EnableViewState="False" meta:resourcekey="lblMsgFlowBaseExceptResource1"></asp:Label>
                                                                <asp:Label ID="lblMsgConditionExcept" runat="server" ForeColor="Red" Text="流程條件異常，請修正表單或聯絡管理人員修改流程，如果你選擇異常送出，則表單會由管理人員處理!"
                                                                    Visible="False" EnableViewState="False" meta:resourcekey="lblMsgConditionExceptResource1"></asp:Label>
                                                                <asp:Label ID="lblMsgApExcept" runat="server" ForeColor="Red" Text="系統無法正確取得組織流程資訊，請選擇異常送出，由管理人員進行後續處理!"
                                                                    Visible="False" EnableViewState="False" meta:resourcekey="lblMsgApExceptResource1"></asp:Label>
                                                                <asp:Label ID="lblMsgMutiSignersExcept" runat="server" ForeColor="Red" Text="一般站點不允許多人簽核，請修改下一站點資訊或聯絡管理人員修改流程，如果你選擇異常送出，則表單會由管理人員進行後續處理!<br>"
                                                                    Visible="False" EnableViewState="False" meta:resourcekey="lblMsgMutiSignersExceptResource1"></asp:Label>
                                                                <asp:Label ID="lblMsgNoSignersExcept" runat="server" ForeColor="Red" Text="沒有簽核人員，請修改下一站點資訊或聯絡管理人員修改流程，如果你選擇異常送出，則表單會由管理人員進行後續處理!<br>"
                                                                    Visible="False" EnableViewState="False" meta:resourcekey="lblMsgNoSignersExceptResource1"></asp:Label>
                                                                <asp:Label ID="lblMsgNoSignersExceptByNonActive" runat="server" ForeColor="Red" Text="簽核人員帳號已被停用，請修改下一站點資訊或聯絡管理人員修改設定，如果你選擇異常送出，則表單會由管理人員進行後續處理!<br>"
                                                                    Visible="False" EnableViewState="False" meta:resourcekey="lblMsgNoSignersExceptByNonActiveResource1"></asp:Label>
                                                                <asp:Label ID="lblMsgFlowBaseNoSendExcept" runat="server" ForeColor="Red" Text="下一站點的流程起始依據異常，請選擇起始群組與職級!請聯絡管理人員!<br>"
                                                                    Visible="False" EnableViewState="False" meta:resourcekey="lblMsgFlowBaseNoSendExceptResource1"></asp:Label>
                                                                <asp:Label ID="lblMsgConditionNoSendExcept" runat="server" ForeColor="Red" Text="流程條件異常，請修正表單或聯絡管理人員修改流程!"
                                                                    Visible="False" EnableViewState="False" meta:resourcekey="lblMsgConditionNoSendExceptResource1"></asp:Label>
                                                                <asp:Label ID="lblMsgApNoSendExcept" runat="server" ForeColor="Red" Text="系統無法正確取得組織流程資訊!請聯絡管理人員!"
                                                                    Visible="False" EnableViewState="False" meta:resourcekey="lblMsgApNoSendExceptResource1"></asp:Label>
                                                                <asp:Label ID="lblMsgMutiSignersNoSendExcept" runat="server" ForeColor="Red" Text="一般站點不允許多人簽核，請修改下一站點資訊或聯絡管理人員修改流程!<br>"
                                                                    Visible="False" EnableViewState="False" meta:resourcekey="lblMsgMutiSignersNoSendExceptResource1"></asp:Label>
                                                                <asp:Label ID="lblMsgNoSignersNoSendExcept" runat="server" ForeColor="Red" Text="沒有簽核人員，請修改下一站點資訊或聯絡管理人員修改流程!<br>"
                                                                    Visible="False" EnableViewState="False" meta:resourcekey="lblMsgNoSignersNoSendExceptResource1"></asp:Label>
                                                                <asp:Label ID="lblJump" runat="server" Text="跳簽" Visible="False" meta:resourcekey="lblJumpResource1"></asp:Label>
                                                                <asp:Label ID="lblExcept" runat="server" Text="表單異常" Visible="False" meta:resourcekey="lblExceptResource1"></asp:Label>
                                                                <asp:Label ID="lblSend" runat="server" Text="送出" Visible="False" meta:resourcekey="lblSendResource1"></asp:Label>
                                                                <asp:Label ID="lblStartGroupExcept" runat="server" Text="異常群組" Visible="False" meta:resourcekey="lblStartGroupExceptResource1"></asp:Label>
                                                                <asp:Label ID="lblStartJobTitleExcept" runat="server" Text="異常職級" Visible="False"
                                                                    meta:resourcekey="lblStartJobTitleExceptResource1"></asp:Label>
                                                                <asp:Label ID="lblAlertSendByExcept" runat="server" Text="你選擇了異常送出，表單將會送給電子簽核管理者，由其將表單轉為自由流程後送出，確定嗎？"
                                                                    Visible="False" meta:resourcekey="lblAlertSendByExceptResource1"></asp:Label>
                                                                <asp:Label ID="lblReturnTxt" runat="server" Text="返回" Visible="False" meta:resourcekey="lblReturnTxtResource1"></asp:Label>
                                                                <asp:Label ID="lblSubmitTxt" runat="server" Text="確定" Visible="False" meta:resourcekey="lblSubmitTxtResource1"></asp:Label>
                                                                <asp:Label ID="lblSignFail" runat="server" Text="簽核失敗，可能同時間有人異動表單狀態" Visible="False"
                                                                    meta:resourcekey="lblSignFailResource1"></asp:Label>
                                                                <asp:Label ID="lblEndAlert" runat="server" Text="這張表單將在此結案，確定嗎?" Visible="False"
                                                                    meta:resourcekey="lblEndAlertResource1"></asp:Label>
                                                                <asp:Label ID="lblSendContinue" runat="server" Text="確定後繼續" Visible="False" meta:resourcekey="lblSendContinueResource1"></asp:Label>
                                                                <asp:Label ID="lblExceptionStopSendMsg" runat="server" Text="表單發生異常，請聯絡管理人員！" Visible="False"
                                                                    meta:resourcekey="lblExceptionStopSendMsgResource1"></asp:Label>
                                                                <asp:Label ID="lblExceptionSend" runat="server" Text="異常送出" Visible="False" meta:resourcekey="lblExceptionSendResource1"></asp:Label>
                                                                <asp:Label ID="lblNotifyAdmin" runat="server" Text="通知管理員" Visible="False" meta:resourcekey="lblNotifyAdminResource1"></asp:Label>
                                                                <asp:Label ID="lblWaitOtherSubFlowMsg" runat="server" Text="平行流程站點，需等待其他流程完成！" Visible="False"
                                                                    meta:resourcekey="lblWaitOtherSubFlowMsgResource1"></asp:Label>
                                                                <asp:Label ID="lblExternalDllFormatErrorMsg" runat="server" EnableViewState="False"
                                                                    ForeColor="Red" Text="下一站點為[應用程式站點]，組件回傳的XML結構有誤，請聯絡管理人員!<br>" Visible="False"
                                                                    meta:resourcekey="lblExternalDllFormatErrorMsgResource1"></asp:Label>
                                                                <asp:Label ID="lblExternalAccountNotExistMsg" runat="server" EnableViewState="False"
                                                                    ForeColor="Red" Text="下一站點為[應用程式站點]，組件回傳的XML結構中的人員帳號未存在UOF系統中，請聯絡管理人員!<br>" Visible="False"
                                                                    meta:resourcekey="lblExternalAccountNotExistMsgResource1"></asp:Label>
                                                                <asp:Label ID="lblJobTitleErrorMsg" runat="server" Text="人員組織異常，找不到簽核者的職級！<br>" BorderColor="Red" Visible="false"></asp:Label>
                                                                <asp:HiddenField ID="hfIsPreAdditionalSite" runat="server" />
                                                                <asp:HiddenField ID="hfPreAdditionalFlow" runat="server" />
                                                                <asp:HiddenField ID="hfGetMethodName" runat="server" />
                                                                <asp:HiddenField ID="hfHasSubSite" runat="server" Value="false" />
                                                                <asp:HiddenField ID="hfTempUserSet" runat="server" />
                                                                <asp:Label ID="lblNoAuth" runat="server" meta:resourcekey="lblNoAuthResource1" Text="無權限處理或觀看此表單" Visible="False"></asp:Label>
                                                                <asp:Label ID="lblSiteExceptMsg2" runat="server" Text="站點異常：找不到任何一位簽核者" Visible="False" meta:resourcekey="lblSiteExceptMsg2Resource1"></asp:Label>
                                                                <asp:Label ID="lblSignerSuspended" runat="server" Text="下一站簽核者帳號已被停用，表單送出後系統會同步通知管理員進行表單指定簽核，以避免影響簽核時效性。" Visible="False" meta:resourcekey="lblSignerSuspendedResource1"></asp:Label>
                                                                <asp:Label ID="lblAdditionalSign" runat="server" Text="由 {#User} 加簽" Visible="False" meta:resourcekey="lblAdditionalSignResource1" ></asp:Label>
                                                                <asp:Label ID="lblExtAccountGroupNotExist" runat="server" EnableViewState="False" ForeColor="Red"   
                                                                    Text="下一站點為[應用程式站點]，組件回傳的XML結構中的簽核者資訊不正確，請聯絡管理人員!<br>" Visible="False" meta:resourcekey="lblExtAccountGroupNotExistResource1"  >
                                                                </asp:Label>
                                                                <asp:Label ID="lblExtAccountTitleNotExist" runat="server" EnableViewState="False" ForeColor="Red"   
                                                                    Text="下一站點為[應用程式站點]，組件回傳的XML結構中的簽核者資訊不正確，請聯絡管理人員!<br>" Visible="False" meta:resourcekey="lblExtAccountTitleNotExistResource1"  >
                                                                </asp:Label>
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
        <div style="margin-left:15px;margin-top:-25px;">
            <asp:Label ID="lblAdditionalSignUser" runat="server" Visible="false" ForeColor="Blue"></asp:Label>
        </div>
    </div>

   
    <table width="100%" class="PopTable" cellspacing="1" style="display:none">
        <tr>
            <td colspan="4" class="PopTableHeader" style="height: 25px; text-align: center">
                <center>
                    <asp:Label ID="lblFlowControl" runat="server" EnableViewState="False" Text="流程切換"
                        meta:resourcekey="lblFlowControlResource1"></asp:Label>
                </center>
            </td>
        </tr>
        <tr>
            <td>
                
            </td>
            <td>
                
            </td>
            <td>
                
            </td>
            <td>
                
            </td>
        </tr>
        
            <tr>
                <td class="PopTableHeader" colspan="4" style="height: 25px; text-align: center">
                    <center>
                        </center>
                </td>
            </tr>
            <tr>
                <td>
                    
                </td>
                <td>
                  
                </td>
                <td>
                    <asp:Label ID="lblTimeoutTitle" runat="server" EnableViewState="False" Text="逾時設定"
                        meta:resourcekey="lblTimeoutTitleResource1"></asp:Label>
                </td>
                <td valign="middle">
                    <telerik:RadNumericTextBox ID="tbTimeoutCount" runat="server" Width="60px" MinValue="0" Value="0" DataType="System.String" Culture="zh-TW" DbValueFactor="1" LabelCssClass="" LabelWidth="64px" meta:resourcekey="tbTimeoutCountResource2">
                        <NegativeStyle Resize="None" />
                        <NumberFormat ZeroPattern="n" AllowRounding="False" DecimalDigits="0"  ></NumberFormat>
                        <EmptyMessageStyle Resize="None" />
                        <ReadOnlyStyle Resize="None" />
                        <FocusedStyle Resize="None" />
                        <DisabledStyle Resize="None" />
                        <InvalidStyle Resize="None" />
                        <HoveredStyle Resize="None" />
                        <EnabledStyle Resize="None" />
                    </telerik:RadNumericTextBox>
                    <asp:Label ID="Label2" runat="server" Text="小時" meta:resourcekey="Label2Resource1"></asp:Label>
                    <asp:Label ID="Label10" runat="server" Text="[0表示不設定]" CssClass="SizeMemo" meta:resourcekey="Label10Resource1"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label3" runat="server" Text="簽核提醒頻率" meta:resourcekey="Label3Resource1"></asp:Label>
                </td>
                <td>
                    <telerik:RadNumericTextBox ID="txtCycleAlert" runat="server" Width="60px" MinValue="0" Value="0" DataType="System.String" Culture="zh-TW" DbValueFactor="1" LabelCssClass="" LabelWidth="64px" meta:resourcekey="txtCycleAlertResource1">
                        <NegativeStyle Resize="None" />
                        <NumberFormat ZeroPattern="n" AllowRounding="False" DecimalDigits="0"  ></NumberFormat>
                        <EmptyMessageStyle Resize="None" />
                        <ReadOnlyStyle Resize="None" />
                        <FocusedStyle Resize="None" />
                        <DisabledStyle Resize="None" />
                        <InvalidStyle Resize="None" />
                        <HoveredStyle Resize="None" />
                        <EnabledStyle Resize="None" />
                    </telerik:RadNumericTextBox>
                    <asp:Label ID="Label6" runat="server" Text="小時" meta:resourcekey="Label2Resource1"></asp:Label>
                    <asp:Label ID="Label7" runat="server" Text="[0表示不設定]" CssClass="SizeMemo" meta:resourcekey="Label7Resource1"></asp:Label>
                </td>
                <td>
                    <asp:Label ID="Label4" runat="server" Text="自動送至下一站" meta:resourcekey="Label4Resource1"></asp:Label>
                </td>
                <td>
                    <telerik:RadNumericTextBox ID="txtAutoSign" runat="server" Width="60px" MinValue="0" Value="0" DataType="System.String" Culture="zh-TW" DbValueFactor="1" LabelCssClass="" LabelWidth="64px" meta:resourcekey="txtAutoSignResource1">
                        <NegativeStyle Resize="None" />
                        <NumberFormat ZeroPattern="n" AllowRounding="False" DecimalDigits="0"  ></NumberFormat>
                        <EmptyMessageStyle Resize="None" />
                        <ReadOnlyStyle Resize="None" />
                        <FocusedStyle Resize="None" />
                        <DisabledStyle Resize="None" />
                        <InvalidStyle Resize="None" />
                        <HoveredStyle Resize="None" />
                        <EnabledStyle Resize="None" />
                    </telerik:RadNumericTextBox>
                    <asp:Label ID="Label8" runat="server" Text="小時" meta:resourcekey="Label2Resource1"></asp:Label>
                    <asp:Label ID="Label9" runat="server" Text="[0表示不設定]" CssClass="SizeMemo" meta:resourcekey="Label9Resource1"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    
                </td>
                <td colspan="3">
                    
                </td>
            </tr>
            <tr>
                <td nowrap="nowrap">
                    <asp:Label ID="lblNextSiteAlerter" runat="server" EnableViewState="False" Text="下一站知會人員"
                        meta:resourcekey="lblNextSiteAlerterResource1"></asp:Label>
                </td>
                <td colspan="3">
                    <uc1:UC_ChoiceList ID="UC_ChoiceList_AlertUsers" runat="server" ShowMember="false" />
                </td>
            </tr>
            <tr>
                <td nowrap="nowrap">
                    <asp:Label ID="Label1" runat="server" Text="本站點結束知會人員" meta:resourcekey="Label1Resource1"></asp:Label>
                </td>
                <td colspan="3">
                    <uc1:UC_ChoiceList ID="UC_ChoiceList_SiteAlertUsers" runat="server" ShowMember="false"
                        IsAllowEdit="false" />
                </td>
            </tr>
    </table>
    <div id="hiddenFieldDiv" style="display: none">
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
        <asp:HiddenField ID="HiddenExternalSiteId" runat="server" />
        <asp:HiddenField ID="HiddenExternalFlowId" runat="server" />
        <asp:HiddenField ID="HiddenExterSiteInfo" runat="server" />
        <asp:HiddenField ID="HiddenIsExternalSite" runat="server" />
        <asp:HiddenField ID="hfIsSuspended" runat="server" />
        <asp:Label ID="lblMsgNextSiteAtMaster" runat="server" Text="此站點屬於主流程站點" meta:resourcekey="lblMsgNextSiteAtMasterResource1"></asp:Label>
    </div>
    <div style="display: none">
        <asp:Panel ID="PanelNextSiteBelongSubFlow" runat="server" Width="100%" meta:resourcekey="PanelNextSiteBelongSubFlowResource1">
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
  </ContentTemplate></asp:UpdatePanel>
</asp:Content>
