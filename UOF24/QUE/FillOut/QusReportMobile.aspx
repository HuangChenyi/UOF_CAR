<%@ Page Title="" Language="C#" MasterPageFile="~/Master/MobileMasterPage.master" AutoEventWireup="true" CodeBehind="QusReportMobile.aspx.cs" Inherits="QUE_FillOut_QusReportMobile" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Charting" TagPrefix="telerik" %>

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

                    .MobileFormList .item a span:nth-child(1) {
                        display: block;
                        float: left;
                        font-weight: 600;
                    }

                    .MobileFormList .item a span:nth-child(2) {
                        display: block;
                        font-size: 95%;
                        clear: both;
                        padding: 0.5em 0 0 0;
                        color: rgba(51,51,51,0.9);
                    }

                    .MobileFormList .item a span:nth-child(3) {
                        display: block;
                        font-size: 95%;
                        clear: both;
                        padding: 0.5em 0 0 0;
                        color: rgba(51,51,51,0.9);
                    }

                .MobileFormList .item p {
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


                    .MobileFormList .item p span:nth-child(1) {
                        display: block;
                        float: left;
                        font-weight: 600;
                    }

                    .MobileFormList .item p span:nth-child(2) {
                        display: block;
                        font-size: 95%;
                        clear: both;
                        padding: 0.5em 0 0 0;
                        color: rgba(51,51,51,0.9);
                    }

                    .MobileFormList .item p span:nth-child(3) {
                        display: block;
                        font-size: 95%;
                        clear: both;
                        padding: 0.5em 0 0 0;
                        color: rgba(51,51,51,0.9);
                    }
    </style>
     <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server" OnAjaxRequest="RadAjaxManager1_AjaxRequest" meta:resourcekey="RadAjaxManager1Resource1">
        
     </telerik:RadAjaxManager>
    <div class="pageLayout" id="layout" runat="server">
        <telerik:RadPageLayout ID="RadPageLayout1" runat="server" GridType="Fluid" ShowGrid="True" HtmlTag="None" EnableAjaxSkinRendering="False" EnableEmbeddedBaseStylesheet="True" EnableEmbeddedScripts="False" EnableEmbeddedSkins="False" meta:resourcekey="RadPageLayout1Resource1" RegisterWithScriptManager="True" RenderMode="Classic">
            <telerik:LayoutRow RowType="Generic">
                <Rows>
                    <telerik:LayoutRow RowType="Generic" CssClass="content">
                        <Rows>
                            <telerik:LayoutRow RowType="Container" WrapperHtmlTag="Div">
                                <Columns>
                                    <telerik:CompositeLayoutColumn Span="12">
                                        <Rows>
                                            <telerik:LayoutRow RowType="Generic" CssClass="content">
                                                <Rows>
                                                    <telerik:LayoutRow RowType="Generic">
                                                        <Columns>
                                                            <telerik:LayoutColumn Span="12">
                                                                <telerik:RadTabStrip ID="rtsReport" MultiPageID="rmpReport" runat="server"
                                                                    SelectedIndex="0" meta:resourcekey="rtsReportResource1">
                                                                    <Tabs>
                                                                        <telerik:RadTab Value="Rectangular" Selected="True"
                                                                            meta:resourcekey="RadTabResource1">
                                                                        </telerik:RadTab>
                                                                        <telerik:RadTab Value="Round" meta:resourcekey="RadTabResource2"></telerik:RadTab>
                                                                        <telerik:RadTab Value="Properties" meta:resourcekey="RadTabResource3"></telerik:RadTab>
                                                                    </Tabs>
                                                                </telerik:RadTabStrip>
                                                                <telerik:RadMultiPage ID="rmpReport" runat="server" SelectedIndex="0" meta:resourcekey="rmpReportResource1">
                                                                    <telerik:RadPageView ID="Rectangular" runat="server" meta:resourcekey="RectangularResource2" Selected="True">
                                                                        <asp:DataList ID="dsRectangular" Width="100%" Style="visibility: hidden; display: none;" runat="server"
                                                                            OnItemDataBound="dsRectangular_ItemDataBound" meta:resourcekey="dsRectangularResource1">
                                                                            <ItemStyle BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" />
                                                                            <ItemTemplate>
                                                                                <table style="width: 100%; margin-bottom: 5px;">
                                                                                    <tr>
                                                                                        <td style="vertical-align: top; width:35px">
                                                                                            <asp:Label ID="lblSeq" runat="server" meta:resourceKey="lblSeqResource1"></asp:Label>
                                                                                        </td>
                                                                                        <td style="text-align:left">
                                                                                            <asp:Label ID="lblItemName" runat="server" meta:resourceKey="lblItemNameResource1"></asp:Label>
                                                                                        </td>
                                                                                    </tr>
                                                                                    <tr>
                                                                                        <td colspan="2"  style="padding-left: 10px; padding-right: 10px"> 
                                                                                            <asp:Panel ID="Panel1" runat="server"></asp:Panel>
                                                                                              
                                                                                        </td>
                                                                                    </tr>
                                                                                    <tr>
                                                                                        <td colspan="2" style="padding-left: 10px; padding-right: 10px">
                                                                                            <asp:Literal ID="ltrAnswer" runat="server" meta:resourceKey="ltrAnswerResource1"></asp:Literal>
                                                                                            <asp:HiddenField ID="hiddenItemGuid" runat="server" />
                                                                                        </td>
                                                                                    </tr>
                                                                                </table>
                                                                            </ItemTemplate>
                                                                        </asp:DataList>
                                                                    </telerik:RadPageView>
                                                                    <telerik:RadPageView ID="Round" runat="server" meta:resourcekey="RoundResource2">
                                                                        <div>
                                                                            <asp:DataList ID="dsRound" runat="server" OnItemDataBound="dsRound_ItemDataBound" Width="100%" meta:resourcekey="dsRoundResource1">
                                                                                <ItemStyle BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" />
                                                                                <ItemTemplate>
                                                                                    <table style="width: 100%; margin-bottom: 5px;">
                                                                                        <tr>
                                                                                            <td style="width:35px; vertical-align: top;">
                                                                                                <asp:Label ID="lblSeq" runat="server" meta:resourceKey="lblSeqResource2"></asp:Label>
                                                                                            </td>
                                                                                            <td>
                                                                                                <asp:Label ID="lblItemName" runat="server" meta:resourceKey="lblItemNameResource2"></asp:Label>
                                                                                            </td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <td colspan="2" style="padding-left:10px; padding-right:10px">
                                                                                                <telerik:RadChart ID="rcRound" runat="server" AutoLayout="true" DefaultType="Pie" Width="300px" meta:resourcekey="rcRoundResource1" OnItemDataBound="rcRound_ItemDataBound">                                                                                        
                                                                                                    <Series>
                                                                                                        <telerik:ChartSeries ActiveRegionToolTip="#Y" DataYColumn="Percentage"
                                                                                                            DefaultLabelValue="#%{#0.##%}" Name="Series 1" Type="Pie">
                                                                                                            <Appearance LegendDisplayMode="ItemLabels" ShowLabelConnectors="True">
                                                                                                                
                                                                                                                <EmptyValue>
                                                                                                                    <PointMark>
                                                                                                                        <FillStyle GammaCorrection="False">
                                                                                                                        </FillStyle>
                                                                                                                    </PointMark>
                                                                                                                </EmptyValue>
                                                                                                            </Appearance>
                                                                                                        </telerik:ChartSeries>
                                                                                                    </Series>
                                                                                                    <ChartTitle Visible="False">
                                                                                                        <Appearance Visible="False">
                                                                                                        </Appearance>                                                                                                       
                                                                                                    </ChartTitle>
                                                                                                </telerik:RadChart>
                                                                                                <asp:HiddenField ID="hiddenItemGuid" runat="server" />
                                                                                            </td>
                                                                                        </tr>
                                                                                    </table>
                                                                                </ItemTemplate>
                                                                            </asp:DataList>
                                                                        </div>
                                                                    </telerik:RadPageView>
                                                                    <telerik:RadPageView ID="Properties" runat="server"
                                                                        meta:resourcekey="PropertiesResource2">
                                                                        <div>
                                                                            <asp:DataList ID="dsProperties" runat="server"
                                                                                meta:resourceKey="dsPropertiesResource1"
                                                                                OnItemDataBound="dsProperties_ItemDataBound" Width="100%">
                                                                                <ItemStyle BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" />
                                                                                <ItemTemplate>
                                                                                    <table style="width: 100%; margin-bottom: 5px;">
                                                                                        <tr>
                                                                                            <td>
                                                                                                <asp:Label ID="lblPropertyName" runat="server"
                                                                                                    meta:resourceKey="lblPropertyNameResource1"></asp:Label>
                                                                                            </td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <td>
                                                                                                <telerik:RadChart ID="rcProperties" runat="server" AutoLayout="True"
                                                                                                    DefaultType="Pie" meta:resourcekey="rcPropertiesResource1"
                                                                                                    OnItemDataBound="rcProperties_ItemDataBound" Width="600px">
                                                                                                    <Series>
                                                                                                        <telerik:ChartSeries ActiveRegionToolTip="#Y" DataYColumn="Percentage"
                                                                                                            DefaultLabelValue="#%{#0.##%}" Name="Series 1" Type="Pie">
                                                                                                            <Appearance LegendDisplayMode="ItemLabels" ShowLabelConnectors="True">
                                                                                                            </Appearance>
                                                                                                        </telerik:ChartSeries>
                                                                                                    </Series>
                                                                                                    <ChartTitle Visible="False">
                                                                                                        <Appearance Visible="False">
                                                                                                        </Appearance>
                                                                                                    </ChartTitle>
                                                                                                </telerik:RadChart>
                                                                                                <asp:HiddenField ID="hiddenPropertyGuid" runat="server" />
                                                                                            </td>
                                                                                        </tr>
                                                                                    </table>
                                                                                </ItemTemplate>
                                                                            </asp:DataList>
                                                                        </div>
                                                                    </telerik:RadPageView>
                                                                </telerik:RadMultiPage>
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
    <asp:Label ID="lblBarChart" runat="server" Visible="False" Text="長條圖統計" meta:resourcekey="lblBarChartResource1"></asp:Label>
    <asp:Label ID="lblPieChart" runat="server" Visible="False" Text="圓餅圖統計" meta:resourcekey="lblPieChartResource1"></asp:Label>
    <asp:Label ID="lblVoteChart" runat="server" Visible="False" Text="投票者分析" meta:resourcekey="lblVoteChartResource1"></asp:Label>
    <asp:Label ID="lblAnsOpt" runat="server" Style="display: none;" Text="選項" meta:resourcekey="lblAnsOptResource1"></asp:Label>
    <asp:Label ID="lblCount" runat="server" Style="display: none;" Text="票數" meta:resourcekey="lblCountResource1"></asp:Label>
    <asp:Label ID="lblPercentage" runat="server" Style="display: none;" Text="百分比" meta:resourcekey="lblPercentageResource1"></asp:Label>
    <asp:Label ID="lblCross" runat="server" Style="display: none;" Text="交叉分析" meta:resourcekey="lblCrossResource1"></asp:Label>
    <asp:Label runat="server" ID="lblPageTitle" Text="統計圖表" Style="display: none" meta:resourcekey="lblPageTitleResource1"></asp:Label>
    <asp:Label runat="server" ID="lblbReturn" Text="返回" Style="display: none" meta:resourcekey="lblbReturnResource1"></asp:Label>
    <asp:Label ID="lblCrossTitle" runat="server" Text="交叉分析" Visible="False" meta:resourcekey="lblCrossTitleResource1"></asp:Label>

    <script type="text/javascript">

        document.onreadystatechange =
        function () {
            if (document.readyState == "complete") {
                window.setTimeout(VisibleRectangularDataList, 10);//為了處理當頁面有ScrollBar的時候,拉動ScrollBar長條圖不跟著一起移動的問題.
            }
        }

        function VisibleRectangularDataList() {
            if ($('#<%=this.dsRectangular.ClientID %>') != null) {
                $('#<%=this.dsRectangular.ClientID %>').css("display", "");
                $('#<%=this.dsRectangular.ClientID %>').css("visibility", "visible");
            }
        }

        window.history.forward();
        var ajaxManager;
        function ReturnClick() {
            if (ajaxManager == null)
                ajaxManager = $find("<%= RadAjaxManager1.ClientID %>");
            ajaxManager.ajaxRequest(JSON.stringify({ "Key": "ReturnClick", "Value": "" }));
            return false;
        }

        function Open(url) {
           
            var m_width = $(window).width();
            url = url.replace("MWidth", "MWidth=" + m_width);
            location.replace(url);
            return false;
        }
    </script>
</asp:Content>
