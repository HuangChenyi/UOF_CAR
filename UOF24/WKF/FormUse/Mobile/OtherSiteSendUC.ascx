<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="~/WKF/FormUse/DefinedTask/OtherSiteSendUC.ascx.cs" Inherits="WKF_FormUse_DefinedTask_OtherSiteSendUC" %>
<%@ Register Src="../../../Common/ChoiceCenter/UC_ChoiceOnce.ascx" TagName="UC_ChoiceOnce" TagPrefix="uc2" %>
<%@ Register Src="../../../Common/ChoiceCenter/UC_BtnChoiceOnce.ascx" TagName="UC_BtnChoiceOnce" TagPrefix="uc3" %>
<%@ Register Src="../../../Common/ChoiceCenter/UC_ChoiceList.ascx" TagName="UC_ChoiceList" TagPrefix="uc1" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register Src="~/Common/ChoiceCenter/UC_ChoiceListMobile.ascx" TagPrefix="uc1" TagName="UC_ChoiceListMobile" %>


<style type="text/css">
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
                                                <telerik:LayoutRow ID="lrSignType" runat="server">
                                                    <Columns>
                                                        <telerik:LayoutColumn Span="12">
                                                            <label class="title">
                                                               
                                                                <asp:Literal ID="lNextSiteSet" runat="server" EnableViewState="False" Text="簽核型態" meta:resourcekey="lblNextSiteSetResource1"></asp:Literal>
                                                            </label>
                                                        </telerik:LayoutColumn>
                                                        <telerik:LayoutColumn Span="12">
                                                            <asp:RadioButtonList ID="rblSignType" runat="server" 
                    RepeatDirection="Vertical" meta:resourcekey="rblSignTypeResource1" 
                    AutoPostBack="True" onselectedindexchanged="rblSignType_SelectedIndexChanged">
                    <asp:ListItem Value="General" Text="一般" meta:resourcekey="ListItemResource1"></asp:ListItem>
                    <asp:ListItem Value="Or" Text="並簽" meta:resourcekey="ListItemResource2"></asp:ListItem>
                    <asp:ListItem Value="And" Text="會簽" meta:resourcekey="ListItemResource3"></asp:ListItem>
                </asp:RadioButtonList>
                                                        </telerik:LayoutColumn>
                                                    </Columns>

                                                </telerik:LayoutRow>
                                                <telerik:LayoutRow>
                                                    <Columns>
                                                        <telerik:LayoutColumn Span="12">
                                                            <label class="title">

                                                                <asp:Literal ID="lblNextSiteSigner2" runat="server" EnableViewState="False"
                                                                    Text="簽核人員" meta:resourcekey="lblNextSiteSignerResource1"></asp:Literal>
                                                            </label>
                                                        </telerik:LayoutColumn>
                                                        <telerik:LayoutColumn Span="12">
                                                            <uc1:UC_ChoiceListMobile runat="server" ID="UC_ChoiceListMobile" ChoiceType="User" Visible="false"/>
                                                            <uc1:UC_ChoiceList ID="UC_ChoiceList_Signer" runat="server" ShowMember="false" />
                                                        </telerik:LayoutColumn>
                                                    </Columns>

                                                </telerik:LayoutRow>

                                                <telerik:LayoutRow>
                                                    <Columns>
                                                        <telerik:LayoutColumn Span="12">
                                                            <asp:Label ID="lblMsgAssignSite" runat="server" ForeColor="Blue" Text="下一站點為[指定式站點]，請設定站點資訊後送出!<br>" Visible="False" EnableViewState="False" meta:resourcekey="lblMsgAssignSiteResource1"></asp:Label>

                                                            <asp:Label ID="lblMsgMutiSignersNoSendExcept" runat="server"
                                                                ForeColor="Red" Text="一般站點不允許多人簽核，請修改下一站點資訊或聯絡管理人員修改流程!<br>" Visible="False"
                                                                EnableViewState="False"
                                                                meta:resourcekey="lblMsgMutiSignersNoSendExceptResource1"></asp:Label>
                                                            <asp:Label ID="lblMsgNoSignersNoSendExcept" runat="server" ForeColor="Red"
                                                                Text="沒有簽核人員，請修改下一站點資訊或聯絡管理人員修改流程!<br>" Visible="False" EnableViewState="False"
                                                                meta:resourcekey="lblMsgNoSignersNoSendExceptResource1"></asp:Label>
                                                            <asp:Label id="lblNotifyMsg" runat="server" CssClass="SizeMemo"></asp:Label>
                                                            <asp:Label ID="lblSignerSuspended" runat="server" Text="下一站簽核者帳號已被停用，表單送出後系統會同步通知管理員進行表單指定簽核，以避免影響簽核時效性。" Visible="False" meta:resourcekey="lblSignerSuspendedResource1"></asp:Label>
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
<table width="100%" class="PopTable" cellspacing="1" style="display:none">
        <colgroup class="PopTableLeftTD" style="width: 70px; text-align: right">
        </colgroup>
        <colgroup class="PopTableRightTD" style="width:200px">
        </colgroup>
        <colgroup class="PopTableLeftTD" style="width: 70px; text-align: right">
        </colgroup>
        <colgroup class="PopTableRightTD"  style="width:200px">
        </colgroup>
        <tr>
            <td class="PopTableHeader" colspan="4" style="height: 25px; text-align: center">
                
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
                <asp:TextBox ID="tbTimeoutCount" runat="server" Width="36px" 
                    meta:resourcekey="tbTimeoutCountResource1"></asp:TextBox>
                <asp:Label ID="Label2"
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
                
            </td>
            <td>
                
            </td>
            <td>
                <asp:Label ID="lblNextSiteAlerter" runat="server" EnableViewState="False" 
                    Text="知會人員" meta:resourcekey="lblNextSiteAlerterResource1"></asp:Label>
            </td>
            <td>
                <uc1:UC_ChoiceList ID="UC_ChoiceList_AlertUsers" runat="server" ShowMember="false"/>
            </td>
        </tr>

    </table>
 <asp:Label ID="lblNextSiteSet" runat="server" EnableViewState="False" Text="簽核型態" meta:resourcekey="lblNextSiteSetResource1" Visible="false"></asp:Label>
<asp:HiddenField ID="hfType" runat="server" Value="mobile"/>
