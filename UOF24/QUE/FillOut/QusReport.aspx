<%@ Page Language="C#" Title="統計圖表" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="QUE_FillOut_QusReport" culture="auto" uiculture="auto" meta:resourcekey="PageResource1" Codebehind="QusReport.aspx.cs" %>

<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Charting" tagprefix="telerik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <telerik:RadTabStrip ID="rtsReport" MultiPageID="rmpReport" runat="server" 
        SelectedIndex="0" meta:resourcekey="rtsReportResource1">
        <Tabs>
            <telerik:RadTab Value="Rectangular" Selected="True" 
                meta:resourcekey="RadTabResource1"></telerik:RadTab>
            <telerik:RadTab Value="Round" meta:resourcekey="RadTabResource2"></telerik:RadTab>
            <telerik:RadTab Value="Properties" meta:resourcekey="RadTabResource3"></telerik:RadTab>
        </Tabs>
    </telerik:RadTabStrip>
    <telerik:RadMultiPage ID="rmpReport" runat="server" SelectedIndex="0" 
        meta:resourcekey="rmpReportResource1">
        <telerik:RadPageView ID="Rectangular" runat="server" 
            meta:resourcekey="RectangularResource2" Selected="True">
                    <asp:DataList ID="dsRectangular" Width="100%" 
                        style="visibility:hidden;display:none;" runat="server" 
                        OnItemDataBound="dsRectangular_ItemDataBound" 
                        meta:resourcekey="dsRectangularResource1">
                        <ItemStyle BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" />
                        <ItemTemplate>
                            <table style="width: 100%; margin-bottom:5px;" >
                                <tr>
                                    <td rowspan="2" style="width: 35px; vertical-align: top;">
                                        <asp:Label ID="lblSeq" runat="server" meta:resourceKey="lblSeqResource1"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:Label ID="lblItemName" runat="server" 
                                            meta:resourceKey="lblItemNameResource1"></asp:Label>
                                        &nbsp;&nbsp;&nbsp;&nbsp;
                                        <asp:LinkButton ID="lbtnCross" runat="server" 
                                            meta:resourceKey="lbtnCrossResource1" Text="交叉分析"></asp:LinkButton>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <asp:Literal ID="ltrAnswer" runat="server" 
                                            meta:resourceKey="ltrAnswerResource1"></asp:Literal>
                                        <asp:HiddenField ID="hiddenItemGuid" runat="server" />
                                    </td>
                                </tr>
                            </table>
                        </ItemTemplate>
                    </asp:DataList>
        </telerik:RadPageView>
        <telerik:RadPageView ID="Round" runat="server" 
            meta:resourcekey="RoundResource2">
                <div style="overflow:auto; height:100%">
                    <asp:DataList ID="dsRound" runat="server" 
                        onitemdatabound="dsRound_ItemDataBound" Width="100%" 
                        meta:resourcekey="dsRoundResource1">
                        <ItemStyle BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" />
                        <ItemTemplate>
                            <table style="width: 100%;margin-bottom:5px;">
                                <tr>
                                    <td rowspan="2" style="width: 35px; vertical-align: top;">
                                        <asp:Label ID="lblSeq" runat="server" meta:resourceKey="lblSeqResource2"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:Label ID="lblItemName" runat="server" 
                                            meta:resourceKey="lblItemNameResource2"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <telerik:RadChart ID="rcRound" runat="server" AutoLayout="True" 
                                            DefaultType="Pie" meta:resourcekey="rcRoundResource1" 
                                            OnItemDataBound="rcRound_ItemDataBound" Width="1024px" Height="768px">
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
                <div style="overflow:auto; height:600px">
                    <asp:DataList ID="dsProperties" runat="server" 
                        meta:resourceKey="dsPropertiesResource1" 
                        OnItemDataBound="dsProperties_ItemDataBound" Width="100%">
                        <ItemStyle BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" />
                        <ItemTemplate>
                            <table style="width: 100%;margin-bottom:5px;">
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
    
     <asp:Label ID="lblBarChart" runat="server" Visible="False" Text="長條圖統計" 
        meta:resourcekey="lblBarChartResource1"></asp:Label>
    <asp:Label ID="lblPieChart" runat="server" Visible="False" Text="圓餅圖統計" 
        meta:resourcekey="lblPieChartResource1"></asp:Label>
    <asp:Label ID="lblVoteChart" runat="server" Visible="False" Text="投票者分析" 
        meta:resourcekey="lblVoteChartResource1"></asp:Label>
    <asp:Label ID="lblAnsOpt" runat="server" Style="display: none;" Text="選項" 
        meta:resourcekey="lblAnsOptResource1"></asp:Label>
    <asp:Label ID="lblCount" runat="server" Style="display: none;" Text="票數" 
        meta:resourcekey="lblCountResource1"></asp:Label>
    <asp:Label ID="lblPercentage" runat="server" Style="display: none;" Text="百分比" 
        meta:resourcekey="lblPercentageResource1"></asp:Label>
    <asp:Label ID="lblCross" runat="server" Style="display: none;" Text="交叉分析" 
        meta:resourcekey="lblCrossResource1"></asp:Label>
        <asp:Label runat="server"  ID ="lblPageTitle" Text ="統計圖表" style="display:none" meta:resourcekey="lblPageTitleResource1"></asp:Label>
    <script type="text/javascript" language="javascript">
 
    document.onreadystatechange = 
    function ()
    {
        if(document.readyState=="complete")
        {
            window.setTimeout(VisibleRectangularDataList,10);//為了處理當頁面有ScrollBar的時候,拉動ScrollBar長條圖不跟著一起移動的問題.
        }
    }
        
function VisibleRectangularDataList()
{
    if($('#<%=this.dsRectangular.ClientID %>') != null)
    {
        $('#<%=this.dsRectangular.ClientID %>').css("display","");
        $('#<%=this.dsRectangular.ClientID %>').css("visibility","visible");
    }
}
    
    </script>
</asp:Content>
