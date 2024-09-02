<%@ Page Title="" Language="C#" MasterPageFile="~/Master/MobileMasterPage.master" AutoEventWireup="true" CodeBehind="ChooseFormListMobile.aspx.cs" Inherits="Ede.Uof.Web.WKF.FormManagement.WKF_OptionalFields.ChooseFormListMobile" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server" OnAjaxRequest="RadAjaxManager1_AjaxRequest" meta:resourcekey="RadAjaxManager1Resource1">
    </telerik:RadAjaxManager>
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
                        font-size: 95%;
                        margin-bottom: 3px;
                        text-shadow: rgb(243, 243, 243) 0px 1px 0px;
                        font-weight: 600;
                    }

                    .MobileFormList .item div span:nth-child(2) {
                        font-size: 95%;
                        float: right;
                        font-weight: normal;
                    }

                    .MobileFormList .item div span:nth-child(3) {
                        font-size: 90%;
                        clear: both;
                        color: rgba(51,51,51,0.9);
                    }

                    .MobileFormList .item div span:nth-child(4) {
                        font-size: 90%;
                        font-weight: normal;
                    }

        div.JustAddBorder table tr td {
            border-width: 1px;
            border-style: solid;
        }
    </style>
    <script type="text/javascript">
        var ajaxManager;
        function Close() {
            $uof.dialog.close();
            setInterval(function () {
                window.location.href = '#InAppBrowserClosed';
            }, 300);
            return false;
        }


        

        function doReturn() {
            if (ajaxManager == null)
                ajaxManager = $find("<%= RadAjaxManager1.ClientID %>");

            ajaxManager.ajaxRequest(JSON.stringify({ "Key": "Return", "Value": "" }));
            return false;
        }

        function SelectFormReference(taskId) {
            if (ajaxManager == null)
                ajaxManager = $find("<%= RadAjaxManager1.ClientID %>");

            ajaxManager.ajaxRequest(JSON.stringify({ "Key": "SelectForm", "Value": taskId }));
            return false;
        }
    </script>
      <div class="pageLayout" id="layout" runat="server">
        <telerik:RadPageLayout runat="server" GridType="Fluid" ShowGrid="true" HtmlTag="None">
            <telerik:LayoutRow RowType="Generic">
                <Rows>
                    <telerik:LayoutRow RowType="Generic" CssClass="content">
                        <Rows>
                            <telerik:LayoutRow RowType="Container" WrapperHtmlTag="Div">
                                <Columns>
                                    <telerik:CompositeLayoutColumn>
                                        <Content>
                                            <h3 class="blockheader">
                                                <asp:Label ID="lblFormChoose" runat="server" Text="表單選取" meta:resourcekey="lblFormChooseResource1" ></asp:Label>
                                            </h3>
                                        </Content>
                                        <Rows>
                                            <telerik:LayoutRow RowType="Container" CssClass="content">
                                                <Columns>
                                                    <telerik:CompositeLayoutColumn>
                                                        <Rows>
                                                            <telerik:LayoutRow>
                                                                <Columns>
                                                                    <telerik:LayoutColumn>
                                                                        <asp:Panel ID="Panel1" runat="server">
                                                                            <asp:Label ID="lblNoData" runat="server" Text="沒有資料" ForeColor="red" Visible="false" meta:resourcekey="lblNoDataResource1"></asp:Label>
                                                                        </asp:Panel>
                                                                    </telerik:LayoutColumn>
                                                                </Columns>
                                                            </telerik:LayoutRow>
                                                        </Rows>
                                                    </telerik:CompositeLayoutColumn>
                                                </Columns>
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

    <asp:Label ID="lblReturn" runat="server" Text="返回" Visible="False" meta:resourcekey="lblReturnResource1"></asp:Label>
    <asp:Label ID="lblSearch" runat="server" Text="查詢" Visible="False" meta:resourcekey="lblSearchResource1"></asp:Label>
    <asp:Label ID="lblError" runat="server" Text="異常" Visible="False" meta:resourcekey="lblErrorResource1"></asp:Label>
    <asp:Label ID="lblSigning" runat="server" Text="簽核中" Visible="False" meta:resourcekey="lblSigningResource1"></asp:Label>
    <asp:Label ID="lblAgreed" runat="server" Text="同意" Visible="False" meta:resourcekey="lblAgreedResource1"></asp:Label>
    <asp:Label ID="lblRejected" runat="server" Text="否決" Visible="False" meta:resourcekey="lblRejectedResource1"></asp:Label>
    <asp:Label ID="lblVoid" runat="server" Text="作廢" Visible="False" meta:resourcekey="lblVoidResource1"></asp:Label>
    <asp:Label ID="lblReturnToApplicant" runat="server" Text="退回申請者" Visible="False" meta:resourcekey="lblReturnToApplicantResource1"></asp:Label>
    <asp:Label ID="lblFormStatus" runat="server" Text="表單狀態:" Visible="False" meta:resourcekey="lblFormStatusResource1"></asp:Label>
    <asp:HiddenField ID="hfFieldId" runat="server" />
    <asp:HiddenField ID="hfTaskId" runat="server" />
    <asp:HiddenField ID="hfScriptId" runat="server" />
    <asp:HiddenField ID="hfFormVersionId" runat="server" /> 
    <asp:HiddenField ID="hfSiteId" runat="server" />
    <asp:HiddenField ID="hfNodeSeq" runat="server" />
    <asp:HiddenField ID="hfReturn" runat="server" />
</asp:Content>
