<%@ Page Title="" Language="C#" MasterPageFile="~/Master/MobileMasterPage.master" AutoEventWireup="true" CodeBehind="SignNodeComment.aspx.cs" Inherits="Ede.Uof.Web.WKF.FormUse.Mobile.SignNodeComment" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" %>

<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register src="~/WKF/FormUse/TaskSiteSignInfo/UC_SignComment.ascx" tagname="UC_SignComment" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
       
    <style type="text/css">
                
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

        .mobileToolBar {
            padding-top:15px
        }

        .mobileToolBar .menuList {
                border-width: 1px;
                border-style: solid;
                border-color: lightgray;
                border-radius: .28571429rem;
        }

        .mobileToolBar .menuList .menuButton {
            height: 32px;
            border-radius: .2em;
            display: inline-block;
            background-image: none !important;
            background-color: #2185D0;
            color: #fff !important;
            padding: 0.4em 0.3em 0.4em 0.3em !important;
            border-radius: .28571429rem;
            vertical-align: baseline;
            margin: 2px;
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
          font-weight: 600;
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
        <telerik:RadPageLayout runat="server" GridType="Fluid" ShowGrid="True" HtmlTag="None" EnableAjaxSkinRendering="False" EnableEmbeddedBaseStylesheet="True" EnableEmbeddedScripts="False" EnableEmbeddedSkins="False" meta:resourcekey="RadPageLayoutResource1" RegisterWithScriptManager="True" RenderMode="Classic">
            <telerik:LayoutRow RowType="Container" WrapperHtmlTag="Div">
                <Columns>
                    <telerik:CompositeLayoutColumn Span="12">
                        <Content>
                            <h3 class="blockheader">
                                <asp:Label ID="lblFormViewSignNodeComment" runat="server" Text="觀看簽核意見" meta:resourcekey="lblFormViewSignNodeCommentResource1"></asp:Label></h3>
                        </Content>
                        <Rows>
                            <telerik:LayoutRow RowType="Generic" CssClass="content nopadding">
                                <Columns>
                                    <telerik:LayoutColumn Span="12" CssClass="scrollx">
                                        <uc1:UC_SignComment ID="UC_SignComment" runat="server" MobileUI="true" />
                                    </telerik:LayoutColumn>
                                </Columns>
                            </telerik:LayoutRow>
                        </Rows>
                    </telerik:CompositeLayoutColumn>
                </Columns>
            </telerik:LayoutRow>
        </telerik:RadPageLayout>
    </div>

    <asp:Label ID="lblBack" runat="server" Text="返回" Visible="False" meta:resourcekey="lblBackResource1"></asp:Label>

</asp:Content>
