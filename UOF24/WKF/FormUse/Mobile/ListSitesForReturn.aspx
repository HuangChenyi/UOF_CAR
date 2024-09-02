<%@ Page Title="" Language="C#" MasterPageFile="~/Master/MobileMasterPage.master" AutoEventWireup="true" CodeBehind="ListSitesForReturn.aspx.cs" Inherits="Ede.Uof.Web.WKF.FormUse.Mobile.ListSitesForReturn" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" %>

<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
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

               /*站點備註*/
               .MobileFormList .item .SiteRemarkBlock {
                   border-style: none !important;                   
                   padding-top: 0px;
                   padding-bottom: 20px;                   
                   padding-left: 50px;
                   padding-right: 50px; 
               }

                    .MobileFormList .item .SiteRemarkBlock div{
                        background-color: lightgray;
                        padding-top: 0px;
                        padding-bottom: 0px;
                        max-height: 70px;                        
                    }

                    .MobileFormList .item .SiteRemarkBlock div span{                        
                        width: 100%;                                
                    }                                        

                    .SiteRemark{
                        width: 100%;                        
                    }

                    .SiteRemark:after {                        
                        content: '\2228';                         
                        font-weight: bold;                        
                        float: right;                       
                    }

                    .SiteRemarkActive:after {
                        content: "\2227";                        
                    }
    </style>
    
    <script>
        var ajaxManager;
        function Return()
        {
            if (ajaxManager == null)
                ajaxManager = $find("<%= RadAjaxManager1.ClientID %>");
            ajaxManager.ajaxRequest(JSON.stringify({ "Key": "PrevPageClick", "Value": "" }));
            return false;
        }

        function ReturnToApplicant() {
            if (confirm("<%=lblCheckReturn.Text%>") == false) { return false; }
            if (ajaxManager == null)
                ajaxManager = $find("<%= RadAjaxManager1.ClientID %>");
            ajaxManager.ajaxRequest(JSON.stringify({ "Key": "ReturnToApplicantClick", "Value": "" }));
            return false;
        }

        function ReturnSign(siteId) {
            if (confirm("<%=lblCheckReturn.Text%>") == false) { return false; }
            if (ajaxManager == null)
                ajaxManager = $find("<%= RadAjaxManager1.ClientID %>");
            ajaxManager.ajaxRequest(JSON.stringify({ "Key": "ReturnSignClick", "Value": siteId }));
            return false;
        }

        function MemberReturnSign() {
            var lastSiteId = $uof.tool.htmlDecode($('#<%=hfLastSiteId.ClientID %>').val());
            if (lastSiteId === null || lastSiteId === "") {
                return ReturnToApplicant();
            } else {
                return ReturnSign(lastSiteId);
            }
        }

        //站點備註
        function GetSiteRemark(sender) {                    
            var siteRemarkDiv = $(sender).parents(".SiteRemarkBlock > div");
            $(sender).toggleClass("SiteRemarkActive");

            if (siteRemarkDiv.attr("style")) {                                
                siteRemarkDiv.removeAttr("style");                    
            } else {               
                siteRemarkDiv.css("max-height", siteRemarkDiv.prop("scrollHeight"));                  
            }
        }        
    </script>
            <div class="pageLayout" id="layout" runat="server">
                 <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server" OnAjaxRequest="RadAjaxManager1_AjaxRequest" meta:resourcekey="RadAjaxManager1Resource1"></telerik:RadAjaxManager>
                <div id="divReturnSign" runat="server">
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
                                                        <asp:Label ID="lblReturnSiteList" runat="server" Text="可退回站點列表" meta:resourcekey="lblReturnSiteListResource1"></asp:Label>
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
                                                                            <asp:Panel ID="pnlReturnSiteList" runat="server" meta:resourcekey="Panel1Resource1">
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
                <div id="divMemberReturn" runat="server">
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
                                                        <asp:Label ID="lblLastSigner" runat="server" Text="退簽對象" meta:resourcekey="lblLastSignerResource1"></asp:Label>
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
                                                                            <asp:Panel ID="pnlLastSiteForMember" runat="server">
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
            </div>
    
        <asp:Label ID="lblRetutn" runat="server" Text="返回" Visible="False" meta:resourcekey="lblRetutnResource1" ></asp:Label>
        <asp:Label ID="lblGeneral" runat="server" Text="一般" Visible="False" meta:resourcekey="lblGeneralResource1" ></asp:Label>
        <asp:Label ID="lblOr" runat="server" Text="並簽" Visible="False" meta:resourcekey="lblOrResource1" ></asp:Label>
        <asp:Label ID="lblAnd" runat="server" Text="會簽" Visible="False" meta:resourcekey="lblAndResource1" ></asp:Label>
        <asp:Label ID="lblApplicant" runat="server" Text="申請者" Visible="False" meta:resourcekey="lblApplicantResource1" ></asp:Label>
        <asp:Label ID="lblReturnToApplicant" runat="server" Text="退回申請者" Visible="False" meta:resourcekey="lblReturnToApplicantResource1"></asp:Label>        
        <asp:Label ID="lblReturnMsg" runat="server" Text="返回" Visible="False" meta:resourcekey="lblReturnMsgResource1" ></asp:Label>
        <asp:Label ID="lblCheckReturn" runat="server" Text="確定退簽至此站點？" Visible="False" meta:resourcekey="lblCheckReturnResource1"></asp:Label>
        <asp:Label ID="lblSignFail" runat="server" meta:resourcekey="lblSignFailResource1" Text="簽核失敗，可能是重複簽核或表單已被取回" Visible ="False" ></asp:Label>
        <asp:Label ID="lblNoAuth" runat="server" meta:resourcekey="lblNoAuthResource1" Text="無權限處理或觀看此表單" Visible="False"></asp:Label>
        <asp:Label ID="lblSiteRemark" runat="server" Text="站點備註" Visible="False" meta:resourcekey="lblSiteRemarkResource1"></asp:Label>
        <asp:Label ID="lblAllowRA" runat="server" Text="*表單已被設定為不允許退回申請者。" Visible="false" ForeColor="Blue" meta:resourcekey="lblAllowRAResource1"></asp:Label>
        <asp:Label ID="lblAllowRAMember" runat="server" Text="表單已被設定為不允許退回申請者，無法退簽。" Visible="false" ForeColor="Blue" meta:resourcekey="lblAllowRAMemberResource1"></asp:Label>
        <asp:HiddenField ID="hfLastSiteId" runat="server" />
</asp:Content>
