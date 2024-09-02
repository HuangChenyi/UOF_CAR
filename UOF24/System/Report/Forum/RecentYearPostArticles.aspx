<%@ Page Language="C#" MasterPageFile="~/Master/DefaultMasterPage.master" AutoEventWireup="true" Inherits="System_Report_Forum_RecentYearPostArticles" Title="最近一年發表篇數統計" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" Codebehind="RecentYearPostArticles.aspx.cs" %>

<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>
<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Charting" tagprefix="telerik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Label ID="lblNoDataMsg" runat="server" Text="沒有任何資料" Visible="False" meta:resourcekey="lblNoDataMsgResource1"></asp:Label><br />
    <telerik:RadChart ID="rcYearPostArticles" AutoLayout="True" Height="391px" Width="732px" 
        runat="server" onitemdatabound="rcYearPostArticles_ItemDataBound" 
        meta:resourcekey="rcYearPostArticlesResource1">
        <Series>
            <telerik:ChartSeries Name="Series 1" DataYColumn="POST_TIMES"  ActiveRegionToolTip="#ITEM:#Y" >
            </telerik:ChartSeries>
        </Series>
        <Legend Visible="False">
            <Appearance Visible="False">
            </Appearance>
        </Legend>
        <PlotArea>
            <XAxis DataLabelsColumn="MONTH">
                <Appearance  MajorTick-Visible="false">
                <MajorGridLines Visible="false" />
                </Appearance>
            </XAxis>
            <YAxis MinValue="0" AutoScale="false">
                <Appearance MinorGridLines-Visible="false" MinorTick-Visible="false" MajorTick-Visible="false">
                    <MinorGridLines Visible="False"></MinorGridLines>
                </Appearance>
            </YAxis>
        </PlotArea>
        <ChartTitle Visible="False">
            <Appearance Visible="False">
            </Appearance>
        </ChartTitle>
    </telerik:RadChart>
    &nbsp;
    <asp:Label ID="lblMonth" runat="server" Text="月份" Visible="False" meta:resourcekey="lblMonthResource1"></asp:Label>
    <asp:Label ID="lblPostArticles" runat="server" Text="發表篇數" Visible="False" meta:resourcekey="lblPostArticlesResource1"></asp:Label>
</asp:Content>

