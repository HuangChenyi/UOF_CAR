<%@ Page Title="罐頭意見" Language="C#" MasterPageFile="~/Master/MobileMasterPage.master" AutoEventWireup="true" CodeBehind="SignComment.aspx.cs" Inherits="Ede.Uof.Web.WKF.FormUse.Mobile.SignComment" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <style type="text/css">
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

        .blockheader {
            padding: .71428571rem 1rem;
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

        .content .t-container {
            padding: 0;
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

        .MobileFormList {
            background-clip: padding-box;
            border-bottom-left-radius: 5px;
            border-bottom-right-radius: 5px;
            border-top-left-radius: 5px;
            border-top-right-radius: 5px;
            color: rgb(51, 51, 51);
            display: block;
            font-family: sans-serif;
            font-size: 16px;
            line-height: 20.8px;
            list-style-image: none;
            list-style-position: outside;
            list-style-type: none;
            margin-bottom: 16px;
            margin-left: 0px;
            margin-right: 0px;
            margin-top: 16px;
            padding-bottom: 0px;
            padding-left: 0px;
            padding-right: 0px;
            padding-top: 0px;
            text-shadow: rgb(243, 243, 243) 0px 1px 0px;
        }

            .MobileFormList .group {
                background-color: #7FB800;
                color: #fff;
                cursor: default;
                display: block;
                font-size: 1.3em;
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
                padding-left: 16.002px;
                padding-right: 16.002px;
                padding-top: 7px;
                position: relative;
                text-align: left;
                text-overflow: ellipsis;
                white-space: nowrap;
            }

            .MobileFormList .item {
                font-size: 1em;
                line-height: 1.2em;
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

                .MobileFormList .item:first-child a {
                    border-top-width: 0px;
                }

                .MobileFormList .item a {
                    border-top-color: rgb(221, 221, 221);
                    border-top-style: solid;
                    border-top-width: 1px;
                    color: rgb(51, 51, 51);
                    cursor: pointer;
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
                    padding-left: 24px;
                    padding-right: 8px;
                    padding-top: 11.2px;
                    position: relative;
                    text-align: left;
                    text-decoration: none;
                    text-overflow: ellipsis;
                    white-space: nowrap;
                    -webkit-user-select: none;
                }
    </style>

    <script type="text/javascript">

        window.history.forward();  //控制不可點瀏覽器的上一頁

        function SaveComment(commentId) {
            var ajaxManager = $find("<%= RadAjaxManager1.ClientID %>");
            ajaxManager.ajaxRequest(JSON.stringify({ "Key": "Sure", "Value": commentId }));
            return false;
        }

        function Return() {
            var ajaxManager = $find("<%= RadAjaxManager1.ClientID %>");
            ajaxManager.ajaxRequest(JSON.stringify({ "Key": "Return", "Value": "" }));
            return false;
        }

    </script>

    <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server" OnAjaxRequest="RadAjaxManager1_AjaxRequest"></telerik:RadAjaxManager>
    <div class="pageLayout">
        <telerik:RadPageLayout runat="server" GridType="Fluid" ShowGrid="True" HtmlTag="None" EnableAjaxSkinRendering="False" EnableEmbeddedBaseStylesheet="True" EnableEmbeddedScripts="False" EnableEmbeddedSkins="False" RegisterWithScriptManager="True" RenderMode="Classic">
            <Rows>
                <telerik:LayoutRow RowType="Generic">
                    <Rows>
                        <telerik:LayoutRow RowType="Generic" CssClass="content">
                            <Rows>
                                <telerik:LayoutRow RowType="Container" WrapperHtmlTag="Div" ID="layoutUser" runat="server" Visible="false">
                                    <Columns>
                                        <telerik:CompositeLayoutColumn Span="12">
                                            <Content>
                                                <h3 class="blockheader">
                                                    <asp:Label ID="lblCommentUserTitle" runat="server" Text="罐頭意見(個人)" meta:resourcekey="lblCommentUserTitleResource1"></asp:Label>
                                                </h3>
                                            </Content>
                                            <Rows>
                                                <telerik:LayoutRow RowType="Container" CssClass="content">
                                                    <Columns>
                                                        <telerik:CompositeLayoutColumn Span="12">
                                                            <Content>
                                                                <asp:Panel ID="pnlCommentUser" runat="server"></asp:Panel>
                                                            </Content>
                                                        </telerik:CompositeLayoutColumn>
                                                    </Columns>
                                                </telerik:LayoutRow>
                                            </Rows>
                                        </telerik:CompositeLayoutColumn>
                                    </Columns>
                                </telerik:LayoutRow>
                            </Rows>
                            <Rows>
                                <telerik:LayoutRow RowType="Container" WrapperHtmlTag="Div" ID="layoutSystem" runat="server" Visible="false">
                                    <Columns>
                                        <telerik:CompositeLayoutColumn Span="12">
                                            <Content>
                                                <h3 class="blockheader">
                                                    <asp:Label ID="lblCommentSysTitle" runat="server" Text="罐頭意見(系統)" meta:resourcekey="lblCommentSysTitleResource1"></asp:Label>
                                                </h3>
                                            </Content>
                                            <Rows>
                                                <telerik:LayoutRow RowType="Container" CssClass="content">
                                                    <Columns>
                                                        <telerik:CompositeLayoutColumn Span="12">
                                                            <Content>
                                                                <asp:Panel ID="pnlCommentSystem" runat="server"></asp:Panel>
                                                            </Content>
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
            </Rows>
        </telerik:RadPageLayout>
    </div>

    <asp:Label ID="lblReturn" runat="server" Text="返回" Visible="false" meta:resourcekey="lblReturnResource1"></asp:Label>
    <asp:Label ID="lblNoAuth" runat="server" meta:resourcekey="lblNoAuthResource1" Text="無權限處理或觀看此表單" Visible="False"></asp:Label>
</asp:Content>
