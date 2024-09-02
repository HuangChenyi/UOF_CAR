<%@ Page Language="C#" MasterPageFile="~/Master/DefaultMasterPage.master" AutoEventWireup="true" Inherits="EIP_Customer_Charts_GlobalDataStatisticsChart" Title="" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" Codebehind="GlobalDataStatisticsChart.aspx.cs" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Charting" TagPrefix="telerik" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <telerik:RadTabStrip ID="rts1" MultiPageID="rmp1" runat="server" SelectedIndex="0" meta:resourcekey="rts1Resource1">
        <Tabs>
            <telerik:RadTab runat="server" Text="地區別分析" Value="Area" PageViewID="rpvArea" meta:resourcekey="RadTabResource1" Selected="True">
            </telerik:RadTab>
            <telerik:RadTab runat="server" Text="等級分析" Value="Grade" PageViewID="rpvGrade" meta:resourcekey="RadTabResource2">
            </telerik:RadTab>
            <telerik:RadTab runat="server" Text="類別分析" Value="Class" PageViewID="rpvClass" meta:resourcekey="RadTabResource3">
            </telerik:RadTab>
            <telerik:RadTab runat="server" Text="行業別分析" Value="Industry" PageViewID="rpvIndustry" meta:resourcekey="RadTabResource4">
            </telerik:RadTab>
            <telerik:RadTab runat="server" Text="資本額分析" Value="Capital" PageViewID="rpvCapital" meta:resourcekey="RadTabResource5">
            </telerik:RadTab>
        </Tabs>
    </telerik:RadTabStrip>
    <telerik:RadMultiPage ID="rmp1" runat="server" BackColor="White" meta:resourcekey="RadMultiPage1Resource1" SelectedIndex="0">
        <telerik:RadPageView ID="rpvArea" runat="server" meta:resourcekey="rpvAreaResource1">
            <table>
                <tr>
                    <td>
                        <telerik:RadChart ID="rdAreaPie" runat="server" Height="500px" Width="600px" AutoLayout="true" Style="margin: 0 auto" IntelligentLabelsEnabled="true" DefaultType="Pie" OnItemDataBound="rdAreaPie_ItemDataBound">
                            <Appearance>
                                <Border Visible="False" />
                                <Shadow Color="Black" />
                            </Appearance>
                            <Series>
                                <telerik:ChartSeries DataYColumn="CUST_COUNT" Type="Pie" DefaultLabelValue="#%{#0.##%}" Appearance-LegendDisplayMode="SeriesName">
                                    <Appearance LegendDisplayMode="ItemLabels" ShowLabelConnectors="true">
                                        <FillStyle FillType="Solid">
                                        </FillStyle>
                                        <Border Color="Black" />
                                        <Shadow Color="White" />
                                    </Appearance>
                                </telerik:ChartSeries>
                            </Series>
                            <Legend>
                                <Appearance Position-AlignedPosition="TopRight">
                                    <Shadow Color="White" />
                                </Appearance>
                            </Legend>
                            <PlotArea>
                                <Appearance Dimensions-Margins="20px, 120px, 120px, 20px">
                                    <FillStyle FillType="Image" MainColor="White">
                                    </FillStyle>
                                    <Border Color="White" />
                                    <Shadow Color="White" />
                                </Appearance>
                                <XAxis DataLabelsColumn="AREA_NAME">
                                    <Appearance>
                                        <LabelAppearance RotationAngle="90" Dimensions-Margins="10px, 1px, 1px, 1px">
                                        </LabelAppearance>
                                        <TextAppearance TextProperties-Color="Black">
                                        </TextAppearance>
                                    </Appearance>
                                    <AxisLabel Visible="True">
                                        <Appearance Visible="True">
                                        </Appearance>
                                        <TextBlock>
                                            <Appearance AutoTextWrap="False">
                                            </Appearance>
                                        </TextBlock>
                                    </AxisLabel>
                                </XAxis>
                                <YAxis AutoScale="True" MinValue="0" Step="1" Visible="False">
                                </YAxis>
                            </PlotArea>
                            <ChartTitle Visible="False">
                                <Appearance Visible="False">
                                    <Shadow Color="White" />
                                </Appearance>
                            </ChartTitle>
                        </telerik:RadChart>
                        <br />
                    </td>
                </tr>
                <tr>
                    <td>

                        <telerik:RadChart ID="rdareachartbar" runat="server" AutoTextWrap="false" OnItemDataBound="rdareachartbar_ItemDataBound" Style="margin: 0 auto" Height="400px">
                            <Appearance>
                                <Border Visible="False" />
                            </Appearance>
                            <Series>
                                <telerik:ChartSeries DataYColumn="CUST_COUNT" ActiveRegionToolTip="#ITEM:#Y" Type="Bar" Appearance-ExplodePercent="100" Appearance-LegendDisplayMode="Nothing">
                                    <Appearance LegendDisplayMode="Nothing">
                                        <FillStyle FillType="Solid">
                                        </FillStyle>
                                        <Border Color="Black" />
                                    </Appearance>
                                </telerik:ChartSeries>
                            </Series>
                            <Legend>
                                <Appearance>
                                </Appearance>
                            </Legend>
                            <PlotArea>
                                <Appearance>
                                    <FillStyle FillType="Image" MainColor="White">
                                    </FillStyle>
                                </Appearance>
                                <XAxis DataLabelsColumn="AREA_NAME">
                                    <Appearance>
                                        <LabelAppearance RotationAngle="90">
                                        </LabelAppearance>
                                        <TextAppearance TextProperties-Color="Black">
                                        </TextAppearance>
                                    </Appearance>
                                    <AxisLabel Visible="True">
                                        <Appearance Visible="True">
                                        </Appearance>
                                        <TextBlock>
                                            <Appearance AutoTextWrap="False">
                                            </Appearance>
                                        </TextBlock>
                                    </AxisLabel>
                                </XAxis>
                                <YAxis AutoScale="true" MinValue="0" VisibleValues="Positive">
                                    <Appearance MajorGridLines-Color="Silver" MinorTick-Visible="False" MajorTick-Visible="False" MajorGridLines-Width="1" MajorGridLines-PenStyle="Solid"></Appearance>
                                </YAxis>
                            </PlotArea>
                            <ChartTitle Visible="False">
                                <Appearance Visible="False">
                                </Appearance>
                            </ChartTitle>
                        </telerik:RadChart>
                    </td>
                </tr>
            </table>
        </telerik:RadPageView>
        <telerik:RadPageView ID="rpvGrade" runat="server" meta:resourcekey="rpvGradeResource1">
            <table>
                <tr>
                    <td>
                        <telerik:RadChart ID="rdGradePie" runat="server" Height="500px" Width="600px" AutoLayout="true" Style="margin: 0 auto" IntelligentLabelsEnabled="true" DefaultType="Pie" OnItemDataBound="rdGradePie_ItemDataBound">
                            <Appearance>
                                <Border Visible="False" />
                                <Shadow Color="Black" />
                            </Appearance>
                            <Series>
                                <telerik:ChartSeries DataYColumn="CUST_COUNT" Type="Pie" DefaultLabelValue="#%{#0.##%}">
                                    <Appearance LegendDisplayMode="ItemLabels" ShowLabelConnectors="true">
                                        <FillStyle FillType="Solid">
                                        </FillStyle>
                                        <Border Color="Black" />
                                        <Shadow Color="White" />
                                    </Appearance>
                                </telerik:ChartSeries>
                            </Series>
                            <Legend>
                                <Appearance Position-AlignedPosition="TopRight">
                                    <Shadow Color="White" />
                                </Appearance>
                            </Legend>
                            <PlotArea>
                                <Appearance Dimensions-Margins="20px, 120px, 120px, 20px">
                                    <FillStyle FillType="Image" MainColor="White">
                                    </FillStyle>
                                    <Border Color="White" />
                                    <Shadow Color="White" />
                                </Appearance>
                                <XAxis DataLabelsColumn="AREA_NAME">
                                    <Appearance>
                                        <LabelAppearance RotationAngle="90" Dimensions-Margins="10px, 1px, 1px, 1px">
                                        </LabelAppearance>
                                        <TextAppearance TextProperties-Color="Black">
                                        </TextAppearance>
                                    </Appearance>
                                    <AxisLabel Visible="True">
                                        <Appearance Visible="True">
                                        </Appearance>
                                        <TextBlock>
                                            <Appearance AutoTextWrap="False">
                                            </Appearance>
                                        </TextBlock>
                                    </AxisLabel>
                                </XAxis>
                                <YAxis AutoScale="true" MinValue="0" Step="1" Visible="False">
                                </YAxis>
                            </PlotArea>
                            <ChartTitle Visible="False">
                                <Appearance Visible="False">
                                    <Shadow Color="White" />
                                </Appearance>
                            </ChartTitle>
                        </telerik:RadChart>
                    </td>
                </tr>
                <tr>
                    <td>
                        <telerik:RadChart ID="rdgradechartbar" runat="server" Height="500px" Width="950px" AutoLayout="True" Style="margin: 0 auto" IntelligentLabelsEnabled="True" OnItemDataBound="rdgradechartbar_ItemDataBound">
                            <Appearance>
                                <Border Visible="False" />
                            </Appearance>
                            <Series>
                                <telerik:ChartSeries DataYColumn="CUST_COUNT" ActiveRegionToolTip="#ITEM:#Y" Type="Bar">
                                    <Appearance LegendDisplayMode="ItemLabels">
                                        <FillStyle FillType="Solid">
                                        </FillStyle>
                                        <Border Color="Black" />
                                    </Appearance>
                                </telerik:ChartSeries>
                            </Series>
                            <Legend Visible="False">
                                <Appearance Position-AlignedPosition="TopRight" Visible="False">
                                </Appearance>
                            </Legend>
                            <PlotArea>
                                <Appearance>
                                    <FillStyle FillType="Image" MainColor="White">
                                    </FillStyle>
                                </Appearance>
                                <XAxis DataLabelsColumn="GRADE_NAME">
                                    <Appearance>
                                        <LabelAppearance RotationAngle="90">
                                        </LabelAppearance>
                                        <TextAppearance TextProperties-Color="Black">
                                        </TextAppearance>
                                    </Appearance>
                                    <AxisLabel Visible="True">
                                        <Appearance Visible="True">
                                        </Appearance>
                                        <TextBlock>
                                            <Appearance AutoTextWrap="False">
                                            </Appearance>
                                        </TextBlock>
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
                                <YAxis AutoScale="true" MinValue="0" Step="1" VisibleValues="Positive">
                                    <Appearance MajorGridLines-Color="Silver" MinorTick-Visible="False" MajorTick-Visible="False" MajorGridLines-Width="1" MajorGridLines-PenStyle="Solid">
                                        <MajorGridLines Color="Silver" PenStyle="Solid" />
                                    </Appearance>
                                </YAxis>
                            </PlotArea>
                            <ChartTitle Visible="False">
                                <Appearance Visible="False">
                                </Appearance>
                            </ChartTitle>
                        </telerik:RadChart>
                    </td>
                </tr>
            </table>
        </telerik:RadPageView>
        <telerik:RadPageView ID="rpvClass" runat="server" meta:resourcekey="rpvClassResource1">
            <table>
                <tr>
                    <td>
                        <telerik:RadChart ID="rdClassPie" runat="server" Height="500px" Width="600px" AutoLayout="true" Style="margin: 0 auto" IntelligentLabelsEnabled="true" OnItemDataBound="rdClassPie_ItemDataBound">
                            <Appearance>
                                <Border Visible="False" />
                                <Shadow Color="Black" />
                            </Appearance>
                            <Series>
                                <telerik:ChartSeries DataYColumn="CUST_COUNT" Type="Pie" DefaultLabelValue="#%{#0.##%}">
                                    <Appearance LegendDisplayMode="ItemLabels" ShowLabelConnectors="true">
                                        <FillStyle FillType="Solid">
                                        </FillStyle>
                                        <Border Color="Black" />
                                        <Shadow Color="White" />
                                    </Appearance>
                                </telerik:ChartSeries>
                            </Series>
                            <Legend>
                                <Appearance Position-AlignedPosition="TopRight">
                                    <Shadow Color="White" />
                                </Appearance>
                            </Legend>
                            <PlotArea>
                                <Appearance Dimensions-Margins="20px, 120px, 120px, 20px">
                                    <FillStyle FillType="Image" MainColor="White">
                                    </FillStyle>
                                    <Border Color="White" />
                                    <Shadow Color="White" />
                                </Appearance>
                                <XAxis DataLabelsColumn="CLASS_NAME">
                                    <Appearance>
                                        <LabelAppearance RotationAngle="90" Dimensions-Margins="10px, 1px, 1px, 1px">
                                        </LabelAppearance>
                                        <TextAppearance TextProperties-Color="Black">
                                        </TextAppearance>
                                    </Appearance>
                                    <AxisLabel Visible="True">
                                        <Appearance Visible="True">
                                        </Appearance>
                                        <TextBlock>
                                            <Appearance AutoTextWrap="False">
                                            </Appearance>
                                        </TextBlock>
                                    </AxisLabel>
                                </XAxis>
                                <YAxis AutoScale="false" MinValue="0" Step="1" Visible="False">
                                </YAxis>
                            </PlotArea>
                            <ChartTitle Visible="False">
                                <Appearance Visible="False">
                                    <Shadow Color="White" />
                                </Appearance>
                            </ChartTitle>
                        </telerik:RadChart>
                        <br />
                    </td>
                </tr>
                <tr>
                    <td>
                        <telerik:RadChart ID="rdclasschartbar" runat="server" Height="500px" Width="950px" AutoLayout="true" Style="margin: 0 auto" IntelligentLabelsEnabled="true" OnItemDataBound="rdclasschartbar_ItemDataBound">
                            <Appearance>
                                <Border Visible="False" />
                            </Appearance>
                            <Series>
                                <telerik:ChartSeries DataYColumn="CUST_COUNT" ActiveRegionToolTip="#ITEM:#Y" Type="Bar" Appearance-LegendDisplayMode="Nothing">
                                    <Appearance LegendDisplayMode="Nothing">
                                        <FillStyle FillType="Solid">
                                        </FillStyle>
                                        <Border Color="Black" />
                                    </Appearance>
                                </telerik:ChartSeries>
                            </Series>
                            <Legend>
                                <Appearance Position-AlignedPosition="TopRight">
                                </Appearance>
                            </Legend>
                            <PlotArea>
                                <Appearance>
                                    <FillStyle FillType="Image" MainColor="White">
                                    </FillStyle>
                                </Appearance>
                                <XAxis DataLabelsColumn="CLASS_NAME">
                                    <Appearance>
                                        <LabelAppearance RotationAngle="90">
                                        </LabelAppearance>
                                        <TextAppearance TextProperties-Color="Black">
                                        </TextAppearance>
                                    </Appearance>
                                    <AxisLabel Visible="True">
                                        <Appearance Visible="True">
                                        </Appearance>
                                        <TextBlock>
                                            <Appearance AutoTextWrap="False">
                                            </Appearance>
                                        </TextBlock>
                                    </AxisLabel>
                                </XAxis>
                                <YAxis AutoScale="true" MinValue="0" Step="1" VisibleValues="Positive">
                                    <Appearance MajorGridLines-Color="Silver" MinorTick-Visible="False" MajorTick-Visible="False" MajorGridLines-Width="1" MajorGridLines-PenStyle="Solid"></Appearance>

                                </YAxis>
                            </PlotArea>
                            <ChartTitle Visible="False">
                                <Appearance Visible="False">
                                </Appearance>
                            </ChartTitle>
                        </telerik:RadChart>
                    </td>
                </tr>
            </table>
        </telerik:RadPageView>
        <telerik:RadPageView ID="rpvIndustry" runat="server" meta:resourcekey="rpvIndustryResource1">
            <table>
                <tr>
                    <td>
                        <telerik:RadChart ID="rdIndustryPie" runat="server" Height="500px" Width="600px" AutoLayout="true" Style="margin: 0 auto" DefaultType="Pie" IntelligentLabelsEnabled="true" OnItemDataBound="rdIndustryPie_ItemDataBound">
                            <Appearance>
                                <Border Visible="False" />
                                <Shadow Color="Black" />
                            </Appearance>
                            <Series>
                                <telerik:ChartSeries DataYColumn="CUST_COUNT" Type="Pie" DefaultLabelValue="#%{#0.##%}">
                                    <Appearance LegendDisplayMode="ItemLabels" ShowLabelConnectors="true">
                                        <FillStyle FillType="Solid">
                                        </FillStyle>
                                        <Border Color="Black" />
                                        <Shadow Color="White" />
                                    </Appearance>
                                </telerik:ChartSeries>
                            </Series>
                            <Legend>
                                <Appearance Position-AlignedPosition="TopRight">
                                    <Shadow Color="White" />
                                </Appearance>
                            </Legend>
                            <PlotArea>
                                <Appearance Dimensions-Margins="20px, 120px, 120px, 20px">
                                    <FillStyle FillType="Image" MainColor="White">
                                    </FillStyle>
                                    <Border Color="White" />
                                    <Shadow Color="White" />
                                </Appearance>
                                <XAxis DataLabelsColumn="INDUSTRY_NAME">
                                    <Appearance>
                                        <LabelAppearance RotationAngle="90" Dimensions-Margins="10px, 1px, 1px, 1px">
                                        </LabelAppearance>
                                        <TextAppearance TextProperties-Color="Black">
                                        </TextAppearance>
                                    </Appearance>
                                    <AxisLabel Visible="True">
                                        <Appearance Visible="True">
                                        </Appearance>
                                        <TextBlock>
                                            <Appearance AutoTextWrap="False">
                                            </Appearance>
                                        </TextBlock>
                                    </AxisLabel>
                                </XAxis>
                                <YAxis AutoScale="false" MinValue="0" Step="1" Visible="False">
                                </YAxis>
                            </PlotArea>
                            <ChartTitle Visible="False">
                                <Appearance Visible="False">
                                    <Shadow Color="White" />
                                </Appearance>
                            </ChartTitle>
                        </telerik:RadChart>
                    </td>
                </tr>
                <tr>
                    <td>
                        <telerik:RadChart ID="rdIndustrychartBar" runat="server" Height="500px" Width="950px" AutoLayout="True" Style="margin: 0 auto" IntelligentLabelsEnabled="True" OnItemDataBound="rdIndustrychartBar_ItemDataBound">
                            <Appearance>
                                <Border Visible="False" />
                            </Appearance>
                            <Series>
                                <telerik:ChartSeries DataYColumn="CUST_COUNT" ActiveRegionToolTip="#ITEM:#Y" Type="Bar" Appearance-LegendDisplayMode="Nothing">
                                    <Appearance LegendDisplayMode="Nothing">
                                        <FillStyle FillType="Solid">
                                        </FillStyle>
                                        <Border Color="Black" />
                                    </Appearance>
                                </telerik:ChartSeries>
                            </Series>
                            <Legend Visible="False">
                                <Appearance Position-AlignedPosition="TopRight" Visible="False">
                                </Appearance>
                            </Legend>
                            <PlotArea>
                                <Appearance>
                                    <FillStyle FillType="Image" MainColor="White">
                                    </FillStyle>
                                </Appearance>
                                <XAxis DataLabelsColumn="INDUSTRY_NAME">
                                    <Appearance>
                                        <LabelAppearance RotationAngle="90">
                                        </LabelAppearance>
                                        <TextAppearance TextProperties-Color="Black">
                                        </TextAppearance>
                                    </Appearance>
                                    <AxisLabel Visible="True">
                                        <Appearance Visible="True">
                                        </Appearance>
                                        <TextBlock>
                                            <Appearance AutoTextWrap="False">
                                            </Appearance>
                                        </TextBlock>
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
                                <YAxis AutoScale="true" MinValue="0" Step="1" VisibleValues="Positive">
                                    <Appearance MajorGridLines-Color="Silver" MinorTick-Visible="False" MajorTick-Visible="False" MajorGridLines-Width="1" MajorGridLines-PenStyle="Solid">
                                        <MajorGridLines Color="Silver" PenStyle="Solid" />
                                    </Appearance>
                                </YAxis>
                            </PlotArea>
                            <ChartTitle Visible="False">
                                <Appearance Visible="False">
                                </Appearance>
                            </ChartTitle>
                        </telerik:RadChart>
                    </td>
                </tr>
            </table>
        </telerik:RadPageView>
        <telerik:RadPageView ID="rpvCapital" runat="server" meta:resourcekey="rpvCapitalResource1">
            <table>
                <tr>
                    <td>
                        <telerik:RadChart ID="rdCapPie" runat="server" Height="500px" Width="600px" AutoLayout="true" Style="margin: 0 auto" DefaultType="Pie" IntelligentLabelsEnabled="true" OnItemDataBound="rdCapPie_ItemDataBound">
                            <Appearance>
                                <Border Visible="False" />
                                <Shadow Color="Black" />
                            </Appearance>
                            <Series>
                                <telerik:ChartSeries DataYColumn="CUST_COUNT" Type="Pie" DefaultLabelValue="#%{#0.##%}">
                                    <Appearance LegendDisplayMode="ItemLabels" ShowLabelConnectors="true">
                                        <FillStyle FillType="Solid">
                                        </FillStyle>
                                        <Border Color="Black" />
                                        <Shadow Color="White" />
                                    </Appearance>
                                </telerik:ChartSeries>
                            </Series>
                            <Legend>
                                <Appearance Position-AlignedPosition="TopRight">
                                    <Shadow Color="White" />
                                </Appearance>
                            </Legend>
                            <PlotArea>
                                <Appearance Dimensions-Margins="20px, 120px, 120px, 20px">
                                    <FillStyle FillType="Image" MainColor="White">
                                    </FillStyle>
                                    <Border Color="White" />
                                    <Shadow Color="White" />
                                </Appearance>
                                <XAxis DataLabelsColumn="RANGE">
                                    <Appearance>
                                        <LabelAppearance RotationAngle="90" Dimensions-Margins="10px, 1px, 1px, 1px">
                                        </LabelAppearance>
                                        <TextAppearance TextProperties-Color="Black">
                                        </TextAppearance>
                                    </Appearance>
                                    <AxisLabel Visible="True">
                                        <Appearance Visible="True">
                                        </Appearance>
                                        <TextBlock>
                                            <Appearance AutoTextWrap="False">
                                            </Appearance>
                                        </TextBlock>
                                    </AxisLabel>
                                </XAxis>
                                <YAxis AutoScale="false" MinValue="0" Step="1" Visible="False">
                                </YAxis>
                            </PlotArea>
                            <ChartTitle Visible="False">
                                <Appearance Visible="False">
                                    <Shadow Color="White" />
                                </Appearance>
                            </ChartTitle>
                        </telerik:RadChart>
                    </td>
                </tr>
                <tr>
                    <td>
                        <telerik:RadChart ID="rdcapchartBar" runat="server" Height="500px" Width="950px" AutoLayout="true" Style="margin: 0 auto" IntelligentLabelsEnabled="true" OnItemDataBound="rdcapchartBar_ItemDataBound">
                            <Appearance>
                                <Border Visible="False" />
                            </Appearance>
                            <Series>
                                <telerik:ChartSeries DataYColumn="CUST_COUNT" ActiveRegionToolTip="#ITEM:#Y" Type="Bar" Appearance-LegendDisplayMode="Nothing">
                                    <Appearance LegendDisplayMode="Nothing">
                                        <FillStyle FillType="Solid">
                                        </FillStyle>
                                        <Border Color="Black" />
                                    </Appearance>
                                </telerik:ChartSeries>
                            </Series>
                            <Legend></Legend>
                            <PlotArea>
                                <Appearance>
                                    <FillStyle FillType="Image" MainColor="White">
                                    </FillStyle>
                                </Appearance>
                                <XAxis DataLabelsColumn="RANGE">
                                    <Appearance>
                                        <LabelAppearance RotationAngle="90">
                                        </LabelAppearance>
                                        <TextAppearance TextProperties-Color="Black" Position-AlignedPosition="Left">
                                        </TextAppearance>
                                    </Appearance>
                                    <AxisLabel Visible="True">
                                        <Appearance Visible="True">
                                        </Appearance>
                                        <TextBlock>
                                            <Appearance AutoTextWrap="False">
                                            </Appearance>
                                        </TextBlock>
                                    </AxisLabel>
                                </XAxis>
                                <YAxis AutoScale="true" MinValue="0" Step="1" VisibleValues="Positive">
                                    <Appearance MajorGridLines-Color="Silver" MinorTick-Visible="False" MajorTick-Visible="False" MajorGridLines-Width="1" MajorGridLines-PenStyle="Solid"></Appearance>
                                </YAxis>
                            </PlotArea>
                            <ChartTitle Visible="False">
                                <Appearance Visible="False">
                                </Appearance>
                            </ChartTitle>
                        </telerik:RadChart>
                    </td>
                </tr>
            </table>
        </telerik:RadPageView>
    </telerik:RadMultiPage>

    <asp:Label ID="Label1" runat="server" Text="無設定" Visible="False" meta:resourcekey="Label1Resource1"></asp:Label>
    <asp:Label ID="Label2" runat="server" Text="1000萬以下" Visible="False" meta:resourcekey="Label2Resource1"></asp:Label>
    <asp:Label ID="Label3" runat="server" Text="1000~5000萬" Visible="False" meta:resourcekey="Label3Resource1"></asp:Label>
    <asp:Label ID="Label4" runat="server" Text="5000萬~1億" Visible="False" meta:resourcekey="Label4Resource1"></asp:Label>
    <asp:Label ID="Label5" runat="server" Text="1~5億" Visible="False" meta:resourcekey="Label5Resource1"></asp:Label>
    <asp:Label ID="Label6" runat="server" Text="5~10億" Visible="False" meta:resourcekey="Label6Resource1"></asp:Label>
    <asp:Label ID="Label7" runat="server" Text="10~100億" Visible="False" meta:resourcekey="Label7Resource1"></asp:Label>
    <asp:Label ID="Label8" runat="server" Text="100億以上" Visible="False" meta:resourcekey="Label8Resource1"></asp:Label>
    <asp:Label ID="lblCustCount" runat="server" Text="客戶數" Visible="False" meta:resourcekey="lblCustCountResource1"></asp:Label>
    <asp:Label ID="lblIndustry" runat="server" Text="行業別" Visible="False" meta:resourcekey="lblIndustryResource1"></asp:Label>
    <asp:Label ID="lblCap" runat="server" Text="資本額" Visible="False" meta:resourcekey="lblCapResource1"></asp:Label>
    <asp:Label ID="lblClass" runat="server" Text="類別" Visible="False" meta:resourcekey="lblClassResource1"></asp:Label>
    <asp:Label ID="lblArea" runat="server" Text="地區別" Visible="False" meta:resourcekey="lblAreaResource1"></asp:Label>
    <asp:Label ID="lblGrade" runat="server" Text="等級" Visible="False" meta:resourcekey="lblGradeResource1"></asp:Label>

</asp:Content>

