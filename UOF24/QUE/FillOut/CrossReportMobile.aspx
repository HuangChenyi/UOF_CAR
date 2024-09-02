<%@ Page Title="" Language="C#" MasterPageFile="~/Master/MobileMasterPage.master" AutoEventWireup="true" CodeBehind="CrossReportMobile.aspx.cs" Inherits="QUE_FillOut_CrossReportMobile" %>

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
    <script type="text/javascript">
        window.history.forward();
        var ajaxManager;
        function ReturnClick() {
            if (ajaxManager == null)
                ajaxManager = $find("<%= RadAjaxManager1.ClientID %>");
            ajaxManager.ajaxRequest(JSON.stringify({ "Key": "ReturnClick", "Value": "" }));
            return false;
        }
    </script>
    <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server" OnAjaxRequest="RadAjaxManager1_AjaxRequest"></telerik:RadAjaxManager>
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
                                                                <asp:Label ID="lblItemName" runat="server" Style="font-size: 16px; color: Blue; margin-left: 5px;" Text=""></asp:Label>
                                                                <asp:DataList ID="dsCross" Width="100%" runat="server" OnItemDataBound="dsCross_ItemDataBound">
                                                                    <ItemTemplate>
                                                                        <table style="width: 100%;">
                                                                            <tr>
                                                                                <td style="padding-left: 5px">
                                                                                    <asp:Label ID="lblPropertyName" runat="server" Text=""></asp:Label>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td style="padding-left: 10px">
                                                                                    <telerik:RadChart ID="chart" runat="server" DefaultType="StackedBar100" Width="600px">
                                                                                        <ChartTitle Visible="false">
                                                                                            <Appearance Visible="False">
                                                                                            </Appearance>
                                                                                        </ChartTitle>
                                                                                        <Series>
                                                                                            <telerik:ChartSeries Name="Series 1" Type="StackedBar100">
                                                                                            </telerik:ChartSeries>
                                                                                            <telerik:ChartSeries Name="Series 2" Type="StackedBar100">
                                                                                            </telerik:ChartSeries>
                                                                                        </Series>
                                                                                        <PlotArea>
                                                                                            <XAxis DataLabelsColumn="PROPERTY_NAME">
                                                                                                <AxisLabel>
                                                                                                    <Appearance Visible="false"></Appearance>
                                                                                                </AxisLabel>
                                                                                                <Items>
                                                                                                    <telerik:ChartAxisItem>
                                                                                                    </telerik:ChartAxisItem>
                                                                                                    <telerik:ChartAxisItem Value="1">
                                                                                                    </telerik:ChartAxisItem>
                                                                                                    <telerik:ChartAxisItem Value="2">
                                                                                                    </telerik:ChartAxisItem>
                                                                                                    <telerik:ChartAxisItem Value="3">
                                                                                                    </telerik:ChartAxisItem>
                                                                                                    <telerik:ChartAxisItem Value="4">
                                                                                                    </telerik:ChartAxisItem>
                                                                                                    <telerik:ChartAxisItem Value="5">
                                                                                                    </telerik:ChartAxisItem>
                                                                                                    <telerik:ChartAxisItem Value="6">
                                                                                                    </telerik:ChartAxisItem>
                                                                                                    <telerik:ChartAxisItem Value="7">
                                                                                                    </telerik:ChartAxisItem>
                                                                                                </Items>
                                                                                            </XAxis>
                                                                                            <YAxis AutoScale="false" MaxValue="100" MinValue="0" Step="10" IsZeroBased="true">
                                                                                                <Items>
                                                                                                    <telerik:ChartAxisItem Value="0" TextBlock-Text="%">
                                                                                                    </telerik:ChartAxisItem>
                                                                                                    <telerik:ChartAxisItem Value="10" TextBlock-Text="10">
                                                                                                    </telerik:ChartAxisItem>
                                                                                                    <telerik:ChartAxisItem Value="20" TextBlock-Text="20">
                                                                                                    </telerik:ChartAxisItem>
                                                                                                    <telerik:ChartAxisItem Value="30" TextBlock-Text="30">
                                                                                                    </telerik:ChartAxisItem>
                                                                                                    <telerik:ChartAxisItem Value="40" TextBlock-Text="40">
                                                                                                    </telerik:ChartAxisItem>
                                                                                                    <telerik:ChartAxisItem Value="50" TextBlock-Text="50">
                                                                                                    </telerik:ChartAxisItem>
                                                                                                    <telerik:ChartAxisItem Value="60" TextBlock-Text="60">
                                                                                                    </telerik:ChartAxisItem>
                                                                                                    <telerik:ChartAxisItem Value="70" TextBlock-Text="70">
                                                                                                    </telerik:ChartAxisItem>
                                                                                                    <telerik:ChartAxisItem Value="80" TextBlock-Text="80">
                                                                                                    </telerik:ChartAxisItem>
                                                                                                    <telerik:ChartAxisItem Value="90" TextBlock-Text="90">
                                                                                                    </telerik:ChartAxisItem>
                                                                                                    <telerik:ChartAxisItem Value="100" TextBlock-Text="100">
                                                                                                    </telerik:ChartAxisItem>
                                                                                                </Items>
                                                                                            </YAxis>
                                                                                        </PlotArea>
                                                                                    </telerik:RadChart>
                                                                                </td>
                                                                            </tr>
                                                                        </table>
                                                                    </ItemTemplate>
                                                                    <ItemStyle BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" />
                                                                </asp:DataList>
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
    <asp:Label ID="lblReturn" runat="server" Text="返回" Visible="false"  meta:resourcekey="lblReturnResource1"></asp:Label>
</asp:Content>
