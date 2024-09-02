<%@ Page Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="DMS_DocStore_DocGradeDetail" Title="文件評分表" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" Codebehind="DocGradeDetail.aspx.cs" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Charting" TagPrefix="telerik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <center>
        <br />
        <table class="PopTable" cellspacing="1" style="width:80%; margin-bottom: 5px;">
            <tr>
                <td style="width: 20%" class="PopTableLeftTD">
                    <asp:Label ID="Label1" runat="server" Text="文件名稱" meta:resourcekey="Label1Resource1"></asp:Label></td>
                <td style="width: 65%; text-align: left;" class="PopTableRightTD">
                    <asp:Label ID="lblDocName" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <td style="width: 20%" class="PopTableLeftTD">
                    <asp:Label ID="Label2" runat="server" Text="版本" meta:resourcekey="Label2Resource1"></asp:Label></td>
                <td style="width: 65%; text-align: left;" class="PopTableRightTD">
                    <asp:Label ID="lblVerson" runat="server"></asp:Label></td>
            </tr>
        </table>
        <telerik:RadChart ID="ChartGrade" AutoLayout="True" Height="170px" runat="server">
            <Series>
                <telerik:ChartSeries Name="Series 1" DataYColumn="GRADE_NUM" ActiveRegionToolTip="#ITEM:#Y">
                    <Appearance ShowLabels="False">
                    </Appearance>
                </telerik:ChartSeries>
            </Series>
            <Legend Visible="False">
                <Appearance Visible="False">
                </Appearance>
            </Legend>
            <PlotArea>
                <EmptySeriesMessage Visible="True">
                    <Appearance Visible="True">
                    </Appearance>
                </EmptySeriesMessage>
                <XAxis DataLabelsColumn="ADJUSTER_GRADE" AutoScale="False" MaxValue="7" MinValue="0"
                    Step="1" IsZeroBased="False">
                    <Appearance MajorTick-Visible="False" CustomFormat="00">
                        <MajorGridLines Visible="False" />
                    </Appearance>
                    <Items>
                        <telerik:ChartAxisItem></telerik:ChartAxisItem>
                        <telerik:ChartAxisItem Value="1"></telerik:ChartAxisItem>
                        <telerik:ChartAxisItem Value="2"></telerik:ChartAxisItem>
                        <telerik:ChartAxisItem Value="3"></telerik:ChartAxisItem>
                        <telerik:ChartAxisItem Value="4"></telerik:ChartAxisItem>
                        <telerik:ChartAxisItem Value="5"></telerik:ChartAxisItem>
                        <telerik:ChartAxisItem Value="6"></telerik:ChartAxisItem>
                        <telerik:ChartAxisItem Value="7"></telerik:ChartAxisItem>
                    </Items>
                </XAxis>
                <YAxis AutoScale="False" MaxItemsCount="10" MaxValue="10" MinValue="0" Step="10">
                    <Appearance MinorTick-Visible="False" MajorTick-Visible="False">
                        <MinorGridLines Visible="False" />
                    </Appearance>
                    <Items>
                        <telerik:ChartAxisItem Value="0">
                        </telerik:ChartAxisItem>
                        <telerik:ChartAxisItem Value="2">
                        </telerik:ChartAxisItem>
                        <telerik:ChartAxisItem Value="4">
                        </telerik:ChartAxisItem>
                        <telerik:ChartAxisItem Value="6">
                        </telerik:ChartAxisItem>
                        <telerik:ChartAxisItem Value="8">
                        </telerik:ChartAxisItem>
                        <telerik:ChartAxisItem Value="10">
                        </telerik:ChartAxisItem>
                    </Items>
                </YAxis>
            </PlotArea>
            <ChartTitle Visible="False">
                <Appearance Visible="False">
                </Appearance>
            </ChartTitle>
        </telerik:RadChart>
        <table border="0" style="width: 80%; ">
            <tr>
                <td style="width:80%; height: 200px; text-align: left;">
                    <asp:Label ID="Label3" runat="server" Text="評比內容：" meta:resourcekey="Label3Resource1"></asp:Label>
                    <asp:TextBox ID="txtComment" runat="server" Height="174px" TextMode="MultiLine" Width="100%" ReadOnly="true"></asp:TextBox></td>
            </tr>
        </table>
    </center>
    <asp:Label ID="labChartTitle" runat="server" Text="文件評比" Visible="False" meta:resourcekey="labChartTitleResource1"></asp:Label>
    <asp:Label ID="lblGradeComment" runat="server" Text="評比意見" Visible="False" meta:resourcekey="lblGradeCommentResource1"></asp:Label>

</asp:Content>

