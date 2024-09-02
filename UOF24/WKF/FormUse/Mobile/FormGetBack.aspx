<%@ Page Language="C#" MasterPageFile="~/Master/MobileMasterPage.master" AutoEventWireup="true" CodeBehind="FormGetBack.aspx.cs" Inherits="Ede.Uof.Web.WKF.FormUse.Mobile.FormGetBack" Culture="auto" meta:resourcekey="PageResource2" UICulture="auto" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

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
                padding-bottom: 5px;
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
                    padding-bottom: 5px;
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
                        color: rgba(51,51,51,0.9);
                    }

                    .MobileFormList .item div span:nth-child(4) {
                        display: block;
                        font-size: 90%;
                        font-weight: normal;
                    }

        .AgentNonScriptCss {
            padding-left: 1em;
        }

        .EnableCss {
            opacity: 0.5;
        }
    </style>

    <div class="pageLayout" id="layoutGetBack" runat="server">
        <telerik:RadPageLayout ID="rplGetBack" runat="server" GridType="Fluid" ShowGrid="True" HtmlTag="None" EnableAjaxSkinRendering="False" EnableEmbeddedBaseStylesheet="True" EnableEmbeddedScripts="False" EnableEmbeddedSkins="False" meta:resourcekey="rplGetBackResource2" RegisterWithScriptManager="True" RenderMode="Classic">
            <telerik:LayoutRow RowType="Generic">
                <Rows>
                    <telerik:LayoutRow RowType="Generic" CssClass="content">
                        <Rows>
                            <telerik:LayoutRow RowType="Container" WrapperHtmlTag="Div">
                                <Columns>
                                    <telerik:CompositeLayoutColumn Span="12">
                                        <Content>
                                            <h3 class="blockheader">
                                                <asp:Label ID="lblGetBack" runat="server" Text="取回" meta:resourcekey="lblGetBackResource1"></asp:Label></h3>
                                        </Content>
                                        <Rows>
                                            <telerik:LayoutRow RowType="Generic" CssClass="content">
                                                <Rows>
                                                    <telerik:LayoutRow>
                                                        <Columns>
                                                            <telerik:LayoutColumn Span="12">
                                                                <label>
                                                                    <asp:Label ID="lblGetBackConfirm" runat="server" Text="確定要取回表單?" Font-Size="1.4em" meta:resourcekey="lblGetBackConfirmResource1"></asp:Label>
                                                                </label>
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

    <div class="pageLayout" id="layoutFormVoid" runat="server">
        <telerik:RadPageLayout ID="rplFormVoid" runat="server" GridType="Fluid" ShowGrid="True" HtmlTag="None" EnableAjaxSkinRendering="False" EnableEmbeddedBaseStylesheet="True" EnableEmbeddedScripts="False" EnableEmbeddedSkins="False" meta:resourcekey="rplFormVoidResource2" RegisterWithScriptManager="True" RenderMode="Classic">
            <telerik:LayoutRow RowType="Generic">
                <Rows>
                    <telerik:LayoutRow RowType="Generic">
                        <Rows>
                            <telerik:LayoutRow RowType="Container" WrapperHtmlTag="Div">
                                <Columns>
                                    <telerik:CompositeLayoutColumn Span="12">
                                        <Content>
                                            <h3 class="blockheader">
                                                <asp:Label ID="lblFormVoid" runat="server" Text="作廢表單" meta:resourcekey="lblFormVoidResource1"></asp:Label>
                                            </h3>
                                        </Content>
                                        <Rows>
                                            <telerik:LayoutRow RowType="Generic" CssClass="content">
                                                <Rows>
                                                    <telerik:LayoutRow>
                                                        <Columns>
                                                            <telerik:LayoutColumn Span="12">
                                                                <asp:RadioButton ID="rbSaveApplyForm" Text="作廢後存回草稿匣" Checked="true" Font-Bold="true" Font-Size="1.4em" runat="server" GroupName="GetBack" meta:resourcekey="rbSaveApplyFormResource1"/>
                                                                <br />
                                                                <div style="padding-left: 20px; padding-right: 5px; padding-bottom: 5px;">
                                                                    <div style="padding-bottom: 2px;">
                                                                        <asp:Label ID="Label1" Text="草稿名稱" Font-Size="1.1em" runat="server" meta:resourcekey="Label1Resource1"></asp:Label>
                                                                    </div>


                                                                    <asp:TextBox ID="tbScriptName" runat="server" MaxLength="50" Width="100%"></asp:TextBox>

                                                                    <div style="padding-top: 2px;">
                                                                        <asp:Label ID="lblScriptNameNull" runat="server" Font-Size="1.1em" Text="請輸入草稿名稱" ForeColor="Red" Visible="False" meta:resourcekey="lblScriptNameNullResource1"></asp:Label>
                                                                    </div>
                                                                </div>


                                                                <div style="padding-bottom: 5px;">
                                                                    <asp:RadioButton ID="rbDeleteApplyForm" Font-Size="1.4em" runat="server" Text="作廢此表單" Font-Bold="true" GroupName="GetBack" meta:resourcekey="rbDeleteApplyFormResource1" />
                                                                </div>

                                                                <div style="border-top: 1px solid #ccc; line-height: 1em; margin: 0px; padding: 0px;" />
                                                                <br />
                                                                <div style="padding-bottom: 5px;">
                                                                    <asp:Label ID="Label3" Text="*" Font-Size="1.1em" ForeColor="Red" runat="server"></asp:Label>
                                                                    <asp:Label ID="lblVoidReason" Text="作廢原因" Font-Size="1.1em" runat="server" meta:resourcekey="lblVoidReasonResource1"></asp:Label>
                                                                </div>

                                                                <asp:TextBox ID="txtReason" TextMode="MultiLine" Rows="3" MaxLength="50" Width="100%" runat="server"></asp:TextBox><br />
                                                                <div style="padding-top: 2px;">
                                                                    <asp:Label ID="lblCancelForm" runat="server" Text="作廢原因必填" Font-Size="1.1em" ForeColor="Red" Visible="False" meta:resourcekey="lblCancelFormResource1"></asp:Label>
                                                                </div>
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
    <br />
     <asp:Label ID="lbldeleteScript" CssClass="AgentNonScriptCss" runat="server" Text="此表單不允許作廢後存回草稿匣" Font-Size="1.1em" ForeColor="Blue" Visible="False" meta:resourcekey="lbldeleteScriptProcessingResource1"></asp:Label>
    <asp:Label ID="lblAgentNonScript" CssClass="AgentNonScriptCss" runat="server" Text="代理填寫的表單不支援作廢後存回草稿匣" Font-Size="1.1em" ForeColor="Blue" Visible="False" meta:resourcekey="lblAgentNonScriptResource1"></asp:Label>

    <asp:Label ID="lblReturnTxt" runat="server" Text="返回" Visible="False" meta:resourcekey="lblReturnTxtResource1"></asp:Label>
    <asp:Label ID="lblTaskOperateFailTxt" runat="server" Text="表單已由下一站人員簽核或鎖定，故無法取回" Visible="False" meta:resourcekey="lblTaskOperateFailTxtResource1"></asp:Label>
    <asp:Label ID="lblBackgoundProcessingTxt" runat="server" Text="此表單正在進行背景簽核，無法取回" Visible="False" meta:resourcekey="lblBackgoundProcessingTxtResource1"></asp:Label>
    <asp:Label ID="lblFormEnd" runat="server" Text="此表單已結案，故無法作廢" Visible="False" meta:resourcekey="lblFormEndResource1"></asp:Label>
    <asp:Label ID="lblFormGetBackExaminedForBackgoundProcessing" runat="server" Text="此表單正在進行背景簽核，無法作廢" Visible="False" meta:resourcekey="lblFormGetBackExaminedForBackgoundProcessingResource1"></asp:Label>

</asp:Content>
