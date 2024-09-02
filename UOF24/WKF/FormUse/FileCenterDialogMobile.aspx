<%@ Page Title="" Language="C#" MasterPageFile="~/Master/MobileMasterPage.master" AutoEventWireup="true" CodeBehind="FileCenterDialogMobile.aspx.cs" Inherits="Ede.Uof.Web.WKF.FormUse.FileCenterDialogMobile" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" %>

<%@ Register Src="~/Common/FileCenter/V3/UC_FileCenter.ascx" TagPrefix="uc1" TagName="UC_FileCenter" %>
<%@ Register TagPrefix="cc2" Namespace="Ede.Uof.Controls.Upload" Assembly="Ede.Uof.Utility.Controls" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <style type="text/css"> 
            .formTitle {background-image: url(../../App_Themes/DefaultTheme/images/po_06.gif);text-align:center;height:20px}
            .formInfo {background-color:White;vertical-align:top}
             /*common*/

              .RadForm_MetroTouch  .rfdSelect  , .RadForm_Silk .rfdSelect,.RadForm_Silk .rfdSelectBox {
                  font-size:100% !important;
              }

             .rfdSelectBox li{
                 height : 1.8em;
                 line-height : 1em;
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
            
            padding: .5rem 1rem;           
            box-shadow: none;
            border-top: 1px solid #d4d4d5;
            border-left:1px solid #d4d4d5;
            border-right:1px solid #d4d4d5;
            margin: 20px 0 0 0 ;
            border-radius: .28571429rem .28571429rem 0 0;
            background: #7FB800;
            color:#fff;

        }
        .blockheader+.content{
           border: 1px solid #d4d4d5;
           border-radius: 0 0 .28571429rem .28571429rem ;
           padding:1em;
        }

        .content.nopadding{
           padding:1em 0;
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

        </style>
   <script type="text/javascript">
       window.history.forward();
       function Sure() {
            var ajaxManager = $find("<%= RadAjaxManager1.ClientID %>");
            ajaxManager.ajaxRequest(JSON.stringify({ "Key": "Sure", "Value": "" }));
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
    <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server" OnAjaxRequest="RadAjaxManager1_AjaxRequest" meta:resourcekey="RadAjaxManager1Resource1" ></telerik:RadAjaxManager>
    <asp:UpdatePanel ID="updatePanel1" runat="server"><ContentTemplate>
    <asp:Panel ID="pnlProxy" runat="server" meta:resourcekey="pnlProxyResource1">
        <div class="pageLayout" id="Div1" runat="server">
            <telerik:RadPageLayout runat="server" GridType="Fluid" ShowGrid="True" HtmlTag="None" EnableAjaxSkinRendering="False" EnableEmbeddedBaseStylesheet="True" EnableEmbeddedScripts="False" EnableEmbeddedSkins="False" meta:resourcekey="RadPageLayoutResource1" RegisterWithScriptManager="True" RenderMode="Classic">
                    <telerik:LayoutRow runat="server" AccessKey="" HiddenLg="False" HiddenMd="False" HiddenSm="False" HiddenXl="False" HiddenXs="False" HtmlTag="Div" meta:resourcekey="LayoutRowResource5" RowType="Generic" ToolTip="" WrapperHtmlTag="None">
                        <Rows>
                            <telerik:LayoutRow runat="server" AccessKey="" CssClass="content" HiddenLg="False" HiddenMd="False" HiddenSm="False" HiddenXl="False" HiddenXs="False" HtmlTag="Div" meta:resourcekey="LayoutRowResource4" RowType="Generic" ToolTip="" WrapperHtmlTag="None">
                                <Rows>
                                    <telerik:LayoutRow runat="server" AccessKey="" HiddenLg="False" HiddenMd="False" HiddenSm="False" HiddenXl="False" HiddenXs="False" HtmlTag="Div" meta:resourcekey="LayoutRowResource3" RowType="Container" ToolTip="" WrapperHtmlTag="Div">
                                        <Columns>
                                            <telerik:CompositeLayoutColumn runat="server" AccessKey="" HiddenLg="False" HiddenMd="False" HiddenSm="False" HiddenXl="False" HiddenXs="False" HtmlTag="Div" meta:resourcekey="CompositeLayoutColumnResource1" Offset="-1" OffsetLg="-1" OffsetMd="-1" OffsetSm="-1" OffsetXl="-1" OffsetXs="-1" Pull="-1" PullLg="-1" PullMd="-1" PullSm="-1" PullXl="-1" PullXs="-1" Push="-1" PushLg="-1" PushMd="-1" PushSm="-1" PushXl="-1" PushXs="-1" Span="12" SpanLg="0" SpanMd="0" SpanSm="0" SpanXl="0" SpanXs="0" ToolTip="">
                                                <Content>
                                                    <h3 class="blockheader">
                                                    <asp:Label ID="Label2" runat="server" Text="檔案上傳" meta:resourcekey="Label2Resource1"></asp:Label></h3>
                                                </Content>
                                                <Rows>
                                                    <telerik:LayoutRow runat="server" AccessKey="" CssClass="content" HiddenLg="False" HiddenMd="False" HiddenSm="False" HiddenXl="False" HiddenXs="False" HtmlTag="Div" meta:resourcekey="LayoutRowResource2" RowType="Generic" ToolTip="" WrapperHtmlTag="None">
                                                        <Rows>
                                                            <telerik:LayoutRow runat="server" AccessKey="" HiddenLg="False" HiddenMd="False" HiddenSm="False" HiddenXl="False" HiddenXs="False" HtmlTag="Div" meta:resourcekey="LayoutRowResource1" RowType="Row" ToolTip="" WrapperHtmlTag="None">
                                                                <Columns>
                                                                    <telerik:LayoutColumn runat="server" AccessKey="" HiddenLg="False" HiddenMd="False" HiddenSm="False" HiddenXl="False" HiddenXs="False" HtmlTag="Div" meta:resourcekey="LayoutColumnResource1" Offset="-1" OffsetLg="-1" OffsetMd="-1" OffsetSm="-1" OffsetXl="-1" OffsetXs="-1" Pull="-1" PullLg="-1" PullMd="-1" PullSm="-1" PullXl="-1" PullXs="-1" Push="-1" PushLg="-1" PushMd="-1" PushSm="-1" PushXl="-1" PushXs="-1" Span="12" SpanLg="0" SpanMd="0" SpanSm="0" SpanXl="0" SpanXs="0" ToolTip="">
                                                                       <asp:Label ID="lblLimitDiscription" runat="server" CssClass="SizeMemo" Visible="False" meta:resourcekey="lblLimitDiscriptionResource1"></asp:Label>
                                                                       <asp:Label ID="lblConstrain" runat="server" CssClass="SizeMemo" meta:resourceKey="lblConstrainResource1" Text="未購買文件轉檔服務時，只允許上傳PDF檔案。" Visible="False"></asp:Label>
                                                                       <uc1:UC_FileCenter ID="Uc_FileCenter1" runat="server" AllowedMultipleFileSelection="true" ProxyEnabled="true" />
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
    </asp:Panel>
        <asp:HiddenField ID="hfFileIdJson" runat="server" />
        </ContentTemplate></asp:UpdatePanel>
    <asp:Label ID="lblReturnTxt" runat="server" Text="返回" Visible="False" meta:resourcekey="lblReturnTxtResource1" ></asp:Label>
    <asp:Label ID="lblLimitDiscriptionText" runat="server" Text="※單一檔案大小不可超出 {0}" CssClass="SizeMemo" Visible="False" meta:resourcekey="lblLimitDiscriptionTextResource1"></asp:Label>
</asp:Content>
