﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Master/MobileMasterPage.master" AutoEventWireup="true" CodeBehind="SignFormList.aspx.cs" Inherits="Ede.Uof.Web.WKF.FormUse.Mobile.SignFormList" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style type="text/css">

        .footer {
            /* 隱藏底下button bar*/
            display:none;
        }

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
            background: #fff;
            padding: .71428571rem 1rem;
            box-shadow: none;
            border: 1px solid #d4d4d5;
            margin: 20px 0 0 0;
            border-radius: .28571429rem;
            background: #f3f4f5;
            font-size: 1.8em;
        }

            .blockheader + .content {
                /*border: 1px solid #d4d4d5;*/
                border-radius: 0 0 .28571429rem .28571429rem;
                /*padding:1em;*/
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
               color:#fff;             
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
                    padding-left: 8px;
                    padding-right: 8px;
                    padding-top: 11.2px;
                    position: relative;
                    text-align: left;
                    text-decoration: none;
                    
                    -webkit-user-select: none;
                }

                
                .MobileFormList .item a span:nth-child(1){
                    display: block;
                     float:left;
                     font-weight: 600;
                }

                .MobileFormList .item a span:nth-child(2){
                     display: block;
                    font-size : 95%;
                   float:right;
                   color:rgba(51,51,51,0.9);
                }
                .MobileFormList .item a span:nth-child(3){
                     display: block;
                    font-size :95%;
                     clear:both;
                    padding:0.5em 0 0 0 ;
                     color:rgba(51,51,51,0.9);
                }
    </style>
    <script>
        function Open(url)
        {
            location.replace(url);
            return false;
        }
        function Close() {
            $uof.dialog.close();
            var mobileRoot = $uof.tool.htmlDecode('<%=System.Web.Security.AntiXss.AntiXssEncoder.HtmlEncode(m_MobileRoot,true)%>');
            location.replace(mobileRoot);
            return false;
        }

        function OpenView(url) {
            $uof.window.open(url, 0, 0, false);
        }
    </script>
    <asp:UpdatePanel ID="updatepanel1" runat="server">
        <ContentTemplate>
            <div class="pageLayout" id="layout" runat="server">
                <telerik:RadPageLayout runat="server" GridType="Fluid" ShowGrid="true" HtmlTag="None">
                    <telerik:LayoutRow RowType="Generic">
                        <Rows>
                            <telerik:LayoutRow RowType="Generic" CssClass="header">
                                <Rows>
                                    <telerik:LayoutRow RowType="Container" WrapperHtmlTag="Div">
                                        <Columns>
                                            <telerik:LayoutColumn Span="12">
                                                <h1><asp:Label ID="lblFormList" runat="server" EnableViewState="False" Text=""  meta:resourcekey="lblFormListResource1"></asp:Label></h1>
                                            </telerik:LayoutColumn>
                                        </Columns>
                                    </telerik:LayoutRow>
                                </Rows>
                            </telerik:LayoutRow>
                            <telerik:LayoutRow RowType="Generic" CssClass="content">
                                <Rows>
                                    <telerik:LayoutRow RowType="Container" WrapperHtmlTag="Div">
                                        <Columns>
                                            <telerik:CompositeLayoutColumn Span="12">
                                                <Rows>
                                                    <telerik:LayoutRow RowType="Generic" CssClass="content">
                                                        <Rows>
                                                            <telerik:LayoutRow>
                                                                <Columns>
                                                                    <telerik:LayoutColumn Span="12">
                                                                        <asp:Panel ID="Panel1" runat="server" meta:resourcekey="Panel1Resource1"></asp:Panel>
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
            <asp:Label ID="lblSignList" runat="server" EnableViewState="False" Text="待簽表單" Visible="false" meta:resourcekey="lblSignListResource1"></asp:Label>
            <asp:Label ID="lblAgentList" runat="server" EnableViewState="False" Text="代理表單" Visible="false" meta:resourcekey="lblAgentListResource1"></asp:Label>
            
            <asp:Label ID="lblReturnList" runat="server" EnableViewState="False" Text="被退回表單" Visible="false" meta:resourcekey="lblReturnListResource1"></asp:Label>
            
            <asp:Label ID="lblTimeOut" runat="server" EnableViewState="False" Text="逾時" Visible="false" meta:resourcekey="lblTimeOutResource1"></asp:Label>
            <asp:Label ID="lblMostUrgent" runat="server" EnableViewState="False" Text="緊急" Visible="false" meta:resourcekey="lblMostUrgentResource1"></asp:Label>
            <asp:Label ID="lblUrgent" runat="server" EnableViewState="False" Text="急" Visible="false" meta:resourcekey="lblUrgentResource1"></asp:Label>
            <asp:Label ID="lblNormal" runat="server" EnableViewState="False" Text="普通" Visible="false" meta:resourcekey="lblNormalResource1"></asp:Label>
            <asp:Label ID="lblClose" runat="server" EnableViewState="False" Text="關閉" Visible="false" meta:resourcekey="lblCloseResource1"></asp:Label>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
