<%@ Page Title="" Language="C#" MasterPageFile="~/Master/MobileMasterPage.master" AutoEventWireup="true" CodeBehind="FreeOtherSiteSend.aspx.cs" Inherits="Ede.Uof.Web.WKF.FormUse.Mobile.FreeOtherSiteSend" %>
<%@ Register Src="../../../Common/ChoiceCenter/UC_ChoiceList.ascx" TagName="UC_ChoiceList" TagPrefix="uc1" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register Src="~/Common/ChoiceCenter/UC_ChoiceListMobile.ascx" TagPrefix="uc1" TagName="UC_ChoiceListMobile" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
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
<script id="SendOtherSitejs" type="text/javascript">
<!--
    function checkEnd()
    {
        
    }
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

     $(function() {
         if ($uof.tool.htmlDecode('<%=System.Web.Security.AntiXss.AntiXssEncoder.HtmlEncode(Request.QueryString["isMNext"],true)%>').toLowerCase() == 'true') {
            window.close = function () {
                setInterval(function () {
                    window.location.href = '#InAppBrowserClosed';
                }, 300);
            };
        }
    });
// -->
</script>
    <div class="pageLayout" id="layout" runat="server" >
        <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server" OnAjaxRequest="RadAjaxManager1_AjaxRequest"></telerik:RadAjaxManager>
        <asp:UpdatePanel ID="updatepanel1" runat="server"><ContentTemplate>
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
                                                    <telerik:LayoutRow>
                                                        <Columns>
                                                            <telerik:LayoutColumn Span="12">
                                                                <label class="title">
                                                                    <asp:Literal ID="lblSign" runat="server" Text="核准"
                                                                        meta:resourcekey="lblSignResource1"></asp:Literal>
                                                                </label>
                                                            </telerik:LayoutColumn>
                                                            <telerik:LayoutColumn Span="12">
                                                                <asp:RadioButtonList ID="rbListSignResult" runat="server" AutoPostBack="True" OnSelectedIndexChanged="rbListSignResult_SelectedIndexChanged"
                                                                    RepeatDirection="Vertical" meta:resourcekey="rbListSignResultResource1">
                                                                    <asp:ListItem Selected="True" Value="Approve" meta:resourcekey="ListItemResource1"
                                                                        Text="同意"></asp:ListItem>
                                                                    <asp:ListItem Value="Disapprove" meta:resourcekey="ListItemResource2" Text="否決"></asp:ListItem>
                                                                </asp:RadioButtonList>
                                                            </telerik:LayoutColumn>
                                                        </Columns>
                                                    </telerik:LayoutRow>
                                                    <telerik:LayoutRow>
                                                        <Columns>
                                                            <telerik:LayoutColumn Span="12">
                                                                <label class="title">
                                                                    <asp:Literal ID="lblMaster" runat="server" Text="主流程"
                                                                        meta:resourcekey="lblMasterResource1"></asp:Literal>
                                                                </label>
                                                            </telerik:LayoutColumn>
                                                            <telerik:LayoutColumn Span="12">
                                                                <asp:RadioButtonList ID="rblEndType" runat="server" RepeatDirection="Vertical"
                                                                    AutoPostBack="True" OnSelectedIndexChanged="rblEndType_SelectedIndexChanged"
                                                                    meta:resourcekey="rblEndTypeResource1">
                                                                    <asp:ListItem Value="Y" meta:resourcekey="ListItemResource4" Text="結案"></asp:ListItem>
                                                                    <asp:ListItem Value="N" Selected="True" meta:resourcekey="ListItemResource5" Text="往下一站點"></asp:ListItem>
                                                                </asp:RadioButtonList>
                                                            </telerik:LayoutColumn>
                                                        </Columns>
                                                    </telerik:LayoutRow>
                                                    <telerik:LayoutRow ID="SiteType" runat="server">
                                                        <Columns>
                                                            <telerik:LayoutColumn Span="12">
                                                                <label class="title">
                                                                    <asp:Literal ID="lblSiteType" runat="server" EnableViewState="False" Text="型態"
                                                                        meta:resourcekey="lblSiteTypeResource2"></asp:Literal>
                                                                </label>
                                                            </telerik:LayoutColumn>
                                                            <telerik:LayoutColumn Span="12">
                                                                <asp:RadioButtonList ID="rblSignType" runat="server" RepeatDirection="Vertical"
                                                                    meta:resourcekey="rblSignTypeResource1">
                                                                    <asp:ListItem Selected="True" Value="General" meta:resourcekey="ListItemResource6"
                                                                        Text="一般"></asp:ListItem>
                                                                    <asp:ListItem Value="Or" meta:resourcekey="ListItemResource7" Text="並簽"></asp:ListItem>
                                                                    <asp:ListItem Value="And" meta:resourcekey="ListItemResource8" Text="會簽"></asp:ListItem>
                                                                </asp:RadioButtonList>
                                                            </telerik:LayoutColumn>
                                                        </Columns>
                                                    </telerik:LayoutRow>                                               
                                                    <telerik:LayoutRow ID="PanelNextSite" runat="server">
                                                        <Columns>
                                                            <telerik:LayoutColumn Span="12">
                                                                <label class="title">
                                                                    <asp:Literal ID="Label3" runat="server" EnableViewState="False" Text="簽核" meta:resourcekey="Label3Resource2"></asp:Literal>                                                                    
                                                                </label>
                                                            </telerik:LayoutColumn>
                                                            <telerik:LayoutColumn Span="12">
                                                                <uc1:UC_ChoiceListMobile runat="server" ID="UC_ChoiceList1" ChoiceType="User"/>
                                                            </telerik:LayoutColumn>
                                                        </Columns>
                                                    </telerik:LayoutRow>
                                                    

                                                    <telerik:LayoutRow >
                                                        <Columns>
                                                            <telerik:LayoutColumn Span="12">
                                                                <asp:Label ID="lblNoSignerMsg" runat="server" Text="至少需有一名簽核人員" EnableViewState="False"
                                                                    ForeColor="Red" Visible="False" meta:resourcekey="lblNoSignerMsgResource1"></asp:Label>
                                                                <asp:Label ID="lblSiteGeneralMsg" runat="server" EnableViewState="False" ForeColor="Red"
                                                                    Text="一般簽核只能有一個人" Visible="False" meta:resourcekey="lblSiteGeneralMsgResource1"></asp:Label>

                                                                <asp:Label ID="lblMsgNonResult" runat="server" EnableViewState="False" ForeColor="Red"
                                                                    meta:resourcekey="lblMsgNonResultResource1" Text="!!目前站點尚未形成簽核共識，請點選送出，等待其他人簽核!<br>"
                                                                    Visible="False"></asp:Label>
                                                                <asp:Label ID="lblMsgDisapprove" runat="server" EnableViewState="False"
                                                                    ForeColor="Red" meta:resourcekey="lblMsgDisapproveResource1" Text="!!你選擇了否決此張表單，此張表單將在此結案!<br>"
                                                                    Visible="False"></asp:Label>
                                                                
                                                                
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
            </ContentTemplate></asp:UpdatePanel>
    </div>

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
                <asp:Label ID="lblFlowControl" runat="server" EnableViewState="False" 
                    Text="流程切換" meta:resourcekey="lblFlowControlResource1"></asp:Label></center>
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
      <asp:Panel ID="pnlVisibleCtrl" runat="server" Width="100%" meta:resourcekey="pnlVisibleCtrlResource1" CssClass="panelDiv">
        <tr>
            <td colspan="4" class="PopTableHeader" style="height: 25px; text-align: center">
            <center>
                <asp:Label ID="lblNextSite" runat="server" EnableViewState="False" Text="下一站點" 
                    meta:resourcekey="lblNextSiteResource1"></asp:Label></center>
            </td>
        </tr>
        <tr>
            <td>
                
            </td>
            <td>
                
            </td>
            <td>
                <asp:Label ID="lblTimeout" runat="server" EnableViewState="False" Text="逾時" 
                    meta:resourcekey="lblTimeoutResource2"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="tbTimeoutCount" runat="server" MaxLength="4" Width="40px" Style="text-align: right"
                    meta:resourcekey="tbTimeoutCountResource1" Text="0"></asp:TextBox><asp:Label ID="Label2"
                        runat="server" Text="小時" meta:resourcekey="Label2Resource1"></asp:Label>
                <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="tbTimeoutCount"
                    Display="Dynamic" ErrorMessage="此數字需介於0-1000" MaximumValue="1000" MinimumValue="0"
                    Type="Integer" meta:resourcekey="RangeValidator1Resource1"></asp:RangeValidator>
            </td>
        </tr>
        <tr>
            <td>
                
            </td>
            <td>
               
            </td>
            <td>
                <asp:Label ID="Label4" runat="server" EnableViewState="False" Text="知會" 
                    meta:resourcekey="Label4Resource2"></asp:Label>
            </td>
            <td>
                <uc1:UC_ChoiceList ID="UC_ChoiceList_AlertUsers" runat="server" ShowMember="false"/>
            </td>
        </tr>
    </asp:Panel>

    </table>
                      
    
    
    <asp:Panel ID="panelAgent" runat="server" Width="100%" Visible="False" meta:resourcekey="panelAgentResource1">
        <table width="100%">
            <tr>
                <td style="background-color: white">
                    </td>
            </tr>
            <tr>
                <td>
                    <asp:TextBox ID="tbAgent" runat="server" Width="100%" Height="50px" EnableViewState="False"
                        meta:resourcekey="tbAgentResource1"></asp:TextBox></td>
            </tr>
        </table>
    </asp:Panel>
    <asp:Panel ID="PanelMessage" runat="server" Height="50px" Visible="False" Width="125px" meta:resourcekey="PanelMessageResource1">
        <asp:Label ID="lblSendMsg" runat="server" Text="送出" meta:resourcekey="lblSendMsgResource1"></asp:Label>
        <asp:Label ID="lblReturnMsg" runat="server" Text="返回" meta:resourcekey="lblReturnMsgResource1"></asp:Label>
        
        <asp:Label ID="lblSendContinue" runat="server" Text="確定後繼續" meta:resourcekey="lblSendContinueResource1" ></asp:Label>
        <asp:Label ID="lblNoAuth" runat="server" meta:resourcekey="lblNoAuthResource1" Text="無權限處理或觀看此表單" Visible="False"></asp:Label>
        </asp:Panel>

</asp:Content>
