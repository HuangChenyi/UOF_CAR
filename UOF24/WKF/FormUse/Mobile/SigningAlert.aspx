<%@ Page Title="" Language="C#" MasterPageFile="~/Master/MobileMasterPage.master" AutoEventWireup="true" CodeBehind="SigningAlert.aspx.cs" Inherits="Ede.Uof.Web.WKF.FormUse.Mobile.SigningAlert" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" %>

<%@ Register Src="~/Common/ChoiceCenter/UC_ChoiceListMobile.ascx" TagPrefix="uc1" TagName="UC_ChoiceListMobile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <style type="text/css">
        .formTitle {
            background-image: url(../../App_Themes/DefaultTheme/images/po_06.gif);
            text-align: center;
            height: 20px
        }

        .formInfo {
            background-color: White;
            vertical-align: top
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
                margin-left: 0;
                margin-right: 0;
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

        .TokensContainer {
            height: 150px !important;
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
    <script type="text/javascript">
        window.history.forward();
        function Sure() {

            var noAlerterID = '<%= CustomValidator1.ClientID %>';
            var noAlerter = document.getElementById(noAlerterID);
           

            var selected = $("#<%=UC_ChoiceListMobile.ClientID%>" + "_hiddenSelected").val();

            if (typeof selected !== "undefined" && selected !== "") {
                 noAlerter.IsValid = true;
                var ajaxManager = $find("<%= RadAjaxManager1.ClientID %>");
                ajaxManager.ajaxRequest(JSON.stringify({ "Key": "Sure", "Value": "" }));
            }
            else {
                noAlerter.style.display = 'inherit';
                noAlerter.IsValid = false;
            }

            return false;
        }
        function Return() {
            var ajaxManager = $find("<%= RadAjaxManager1.ClientID %>");
            ajaxManager.ajaxRequest(JSON.stringify({ "Key": "Return", "Value": "" }));
            return false;
        }
        function SaveFile() {
            var ajaxManager = $find("<%= RadAjaxManager1.ClientID %>");
            ajaxManager.ajaxRequest(JSON.stringify({ "Key": "SaveFile", "Value": "" }));
            return 'done:' + '<%=_url%>';
        }



    </script>
    <asp:Panel ID="pnlMultiSite" runat="server" meta:resourcekey="pnlMultiSiteResource1">
    </asp:Panel>
    <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server" OnAjaxRequest="RadAjaxManager1_AjaxRequest" meta:resourcekey="RadAjaxManager1Resource1"></telerik:RadAjaxManager>
    <asp:UpdatePanel ID="updatePanel1" runat="server">
        <ContentTemplate>
            <asp:Panel ID="pnlProxy" runat="server" meta:resourcekey="pnlProxyResource1">
                <div class="pageLayout" id="Div1" runat="server">
                    <telerik:RadPageLayout runat="server" GridType="Fluid" ShowGrid="True" HtmlTag="None" EnableAjaxSkinRendering="False" EnableEmbeddedBaseStylesheet="True" EnableEmbeddedScripts="False" EnableEmbeddedSkins="False" meta:resourcekey="RadPageLayoutResource1" RegisterWithScriptManager="True" RenderMode="Classic">
                        <Rows>
                        <telerik:LayoutRow runat="server" HtmlTag="Div" meta:resourcekey="LayoutRowResource5" RowType="Generic" WrapperHtmlTag="None">
                            <Rows>
                                <telerik:LayoutRow runat="server" CssClass="content" RowType="Generic" WrapperHtmlTag="None">
                                    <Rows>
                                        <telerik:LayoutRow runat="server" RowType="Container" WrapperHtmlTag="Div">
                                            <Columns>
                                                <telerik:CompositeLayoutColumn runat="server" HtmlTag="Div">
                                                    <Content>
                                                        <h3 class="blockheader">
                                                            <asp:Label ID="lblSendNotify" runat="server" Text="發出知會" meta:resourcekey="lblSendNotifyResource1"></asp:Label></h3>
                                                    </Content>
                                                    <Rows>
                                                        <telerik:LayoutRow runat="server" CssClass="content" HtmlTag="Div">
                                                            <Rows>
                                                                <telerik:LayoutRow runat="server" HtmlTag="Div" RowType="Row" WrapperHtmlTag="None">
                                                                    <Columns>
                                                                        <telerik:LayoutColumn runat="server" HtmlTag="Div">
                                                                            <asp:Label ID="lblUsers" runat="server" meta:resourcekey="lblUsersResource1" Text="知會人員"></asp:Label>
                                                                            <uc1:UC_ChoiceListMobile ID="UC_ChoiceListMobile" runat="server" />
                                                                            <asp:CustomValidator ID="CustomValidator1" runat="server" Display="Dynamic" ErrorMessage="請選擇知會人員" meta:resourcekey="CustomValidator1Resource1" ForeColor="Red"></asp:CustomValidator>
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
                        </Rows>
                    </telerik:RadPageLayout>
                </div>
            </asp:Panel>
            <asp:HiddenField ID="hfFileIdJson" runat="server" />
        </ContentTemplate>
    </asp:UpdatePanel>
    <asp:Label ID="lblReturnTxt" runat="server" Text="返回" Visible="False" meta:resourcekey="lblReturnTxtResource1"></asp:Label>

</asp:Content>
