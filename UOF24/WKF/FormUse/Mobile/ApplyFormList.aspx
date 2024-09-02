<%@ Page Title="" Language="C#" MasterPageFile="~/Master/MobileMasterPage.master" AutoEventWireup="true" CodeBehind="ApplyFormList.aspx.cs" Inherits="Ede.Uof.Web.WKF.FormUse.Mobile.ApplyFormList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
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


                .MobileFormList .item .script {
                    border-top-width: 0px;
                    padding-top: 0px;
                    font-size: 15px;
                    text-align: right;
                }
    </style>
    <script>
        function RefreshPage() {
            location.replace(window.location.href);
        }
    </script>
    <asp:UpdatePanel ID="updatepanel1" runat="server">
        <ContentTemplate>
            <div class="pageLayout" id="layout" runat="server">
                <telerik:RadPageLayout runat="server" GridType="Fluid" ShowGrid="True" HtmlTag="None" EnableAjaxSkinRendering="False" EnableEmbeddedBaseStylesheet="True" EnableEmbeddedScripts="False" EnableEmbeddedSkins="False" meta:resourcekey="RadPageLayoutResource1" RegisterWithScriptManager="True" RenderMode="Classic">
                    <Rows>
                        <telerik:LayoutRow runat="server" AccessKey="" HiddenLg="False" HiddenMd="False" HiddenSm="False" HiddenXl="False" HiddenXs="False" HtmlTag="Div" meta:resourcekey="LayoutRowResource7" RowType="Generic" ToolTip="" WrapperHtmlTag="None">
                            <Rows>
                                <telerik:LayoutRow runat="server" AccessKey="" CssClass="header" HiddenLg="False" HiddenMd="False" HiddenSm="False" HiddenXl="False" HiddenXs="False" HtmlTag="Div" meta:resourcekey="LayoutRowResource2" RowType="Generic" ToolTip="" WrapperHtmlTag="None">
                                    <Rows>
                                        <telerik:LayoutRow runat="server" AccessKey="" HiddenLg="False" HiddenMd="False" HiddenSm="False" HiddenXl="False" HiddenXs="False" HtmlTag="Div" meta:resourcekey="LayoutRowResource1" RowType="Container" ToolTip="" WrapperHtmlTag="Div">
                                            <Columns>
                                                <telerik:LayoutColumn runat="server" AccessKey="" HiddenLg="False" HiddenMd="False" HiddenSm="False" HiddenXl="False" HiddenXs="False" HtmlTag="Div" meta:resourcekey="LayoutColumnResource1" Offset="-1" OffsetLg="-1" OffsetMd="-1" OffsetSm="-1" OffsetXl="-1" OffsetXs="-1" Pull="-1" PullLg="-1" PullMd="-1" PullSm="-1" PullXl="-1" PullXs="-1" Push="-1" PushLg="-1" PushMd="-1" PushSm="-1" PushXl="-1" PushXs="-1" Span="12" SpanLg="0" SpanMd="0" SpanSm="0" SpanXl="0" SpanXs="0" ToolTip="">
                                                    <h1>
                                                        <asp:Label ID="lblApplyForm" runat="server" EnableViewState="False" meta:resourcekey="lblApplyFormResource1" Text="表單申請"></asp:Label>
                                                    </h1>
                                                </telerik:LayoutColumn>
                                            </Columns>
                                        </telerik:LayoutRow>
                                    </Rows>
                                </telerik:LayoutRow>
                                <telerik:LayoutRow runat="server" AccessKey="" CssClass="content" HiddenLg="False" HiddenMd="False" HiddenSm="False" HiddenXl="False" HiddenXs="False" HtmlTag="Div" meta:resourcekey="LayoutRowResource6" RowType="Generic" ToolTip="" WrapperHtmlTag="None">
                                    <Rows>
                                        <telerik:LayoutRow runat="server" AccessKey="" HiddenLg="False" HiddenMd="False" HiddenSm="False" HiddenXl="False" HiddenXs="False" HtmlTag="Div" meta:resourcekey="LayoutRowResource5" RowType="Container" ToolTip="" WrapperHtmlTag="Div">
                                            <Columns>
                                                <telerik:CompositeLayoutColumn runat="server" AccessKey="" HiddenLg="False" HiddenMd="False" HiddenSm="False" HiddenXl="False" HiddenXs="False" HtmlTag="Div" meta:resourcekey="CompositeLayoutColumnResource1" Offset="-1" OffsetLg="-1" OffsetMd="-1" OffsetSm="-1" OffsetXl="-1" OffsetXs="-1" Pull="-1" PullLg="-1" PullMd="-1" PullSm="-1" PullXl="-1" PullXs="-1" Push="-1" PushLg="-1" PushMd="-1" PushSm="-1" PushXl="-1" PushXs="-1" Span="12" SpanLg="0" SpanMd="0" SpanSm="0" SpanXl="0" SpanXs="0" ToolTip="">
                                                    <Rows>
                                                        <telerik:LayoutRow runat="server" AccessKey="" CssClass="content" HiddenLg="False" HiddenMd="False" HiddenSm="False" HiddenXl="False" HiddenXs="False" HtmlTag="Div" meta:resourcekey="LayoutRowResource4" RowType="Generic" ToolTip="" WrapperHtmlTag="None">
                                                            <Rows>
                                                                <telerik:LayoutRow runat="server" AccessKey="" HiddenLg="False" HiddenMd="False" HiddenSm="False" HiddenXl="False" HiddenXs="False" HtmlTag="Div" meta:resourcekey="LayoutRowResource3" RowType="Row" ToolTip="" WrapperHtmlTag="None">
                                                                    <Columns>
                                                                        <telerik:LayoutColumn runat="server" AccessKey="" HiddenLg="False" HiddenMd="False" HiddenSm="False" HiddenXl="False" HiddenXs="False" HtmlTag="Div" meta:resourcekey="LayoutColumnResource2" Offset="-1" OffsetLg="-1" OffsetMd="-1" OffsetSm="-1" OffsetXl="-1" OffsetXs="-1" Pull="-1" PullLg="-1" PullMd="-1" PullSm="-1" PullXl="-1" PullXs="-1" Push="-1" PushLg="-1" PushMd="-1" PushSm="-1" PushXl="-1" PushXs="-1" Span="12" SpanLg="0" SpanMd="0" SpanSm="0" SpanXl="0" SpanXs="0" ToolTip="">
                                                                            <asp:Panel ID="Panel1" runat="server" meta:resourcekey="Panel1Resource1">
                                                                            </asp:Panel>
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
        </ContentTemplate>
    </asp:UpdatePanel>
    <asp:Label ID="lblFormDisable" runat="server" meta:resourcekey="lblFormDisableResource1" Text="表單已被停用" Visible="false"></asp:Label>
    <asp:Label ID="lblNoAuthApply" runat="server" meta:resourcekey="lblNoAuthApplyResource1" Text="無權限申請該張表單" Visible="false"></asp:Label>
    <asp:Label ID="lblDraft" runat="server" meta:resourcekey="lblDraftResource1" Text="草稿" Visible="false"></asp:Label>
</asp:Content>
