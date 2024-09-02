<%@ Page Title="" Language="C#" MasterPageFile="~/Master/MobileMasterPage.master" AutoEventWireup="true" CodeBehind="ScriptList.aspx.cs" Inherits="Ede.Uof.Web.WKF.FormUse.Mobile.ScriptList" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" %>
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
                    padding-left: 0px;
                    padding-right: 0px;
                    padding-top: 11.2px;
                    position: relative;
                    text-align: left;
                    text-decoration: none;
                    text-overflow: ellipsis;
                    white-space: nowrap;
                    -webkit-user-select: none;
                }

                .MobileFormList .item a > div > table {
                    table-layout:fixed;
                    width:100%
                }

                .MobileFormList .item a > div > table > tbody > tr:nth-child(1) > td {
                    display: block;
                     float:left;
                     font-weight: 600;
                }

                .MobileFormList .item a > div > table > tbody > tr:nth-child(2) > td {
                     display: block;
                    font-size : 95%;
                   float:right;
                   color:rgba(51,51,51,0.9);
                   padding-top:8px;
                }
                
    </style>

    <script>
        function Open(url) {
            location.replace(url);
            return false;
        }
    </script>

    <div class="pageLayout">
        <telerik:RadPageLayout runat="server" GridType="Fluid" ShowGrid="True" HtmlTag="None" EnableAjaxSkinRendering="False" EnableEmbeddedBaseStylesheet="True" EnableEmbeddedScripts="False" EnableEmbeddedSkins="False" RegisterWithScriptManager="True" RenderMode="Classic" meta:resourcekey="RadPageLayoutResource1">
            <Rows>
                <telerik:LayoutRow RowType="Generic" meta:resourcekey="LayoutRowResource3">
                    <Rows>
                        <telerik:LayoutRow RowType="Generic" CssClass="content" meta:resourcekey="LayoutRowResource2">
                            <Rows>
                                <telerik:LayoutRow RowType="Container" WrapperHtmlTag="Div" ID="layoutUser" runat="server" meta:resourcekey="layoutUserResource1">
                                    <Columns>
                                        <telerik:CompositeLayoutColumn Span="12" meta:resourcekey="CompositeLayoutColumnResource2">
                                            <Content>
                                                <h3 class="blockheader">
                                                    <asp:Label ID="lblScriptList" runat="server" Text="草稿列表" meta:resourcekey="lblScriptListResource1"></asp:Label>
                                                </h3>
                                            </Content>
                                            <Rows>
                                                <telerik:LayoutRow RowType="Container" CssClass="content" meta:resourcekey="LayoutRowResource1">
                                                    <Columns>
                                                        <telerik:CompositeLayoutColumn Span="12" meta:resourcekey="CompositeLayoutColumnResource1">
                                                            <Content>
                                                                <asp:Panel ID="pnlScriptList" runat="server"></asp:Panel>
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
</asp:Content>
