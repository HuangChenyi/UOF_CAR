<%@ Page Language="C#" MasterPageFile="~/Master/DefaultMasterPage.master" AutoEventWireup="true" Inherits="System_Report_Forum_AllForumPostArticles" Title="討論區發表篇數統計" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" Codebehind="AllForumPostArticles.aspx.cs" %>

<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>
<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Charting" tagprefix="telerik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Label ID="lblNoDataMsg" runat="server" Text="沒有任何資料" Visible="False" meta:resourcekey="lblNoDataMsgResource1"></asp:Label>&nbsp;<br />
    <telerik:RadChart ID="rcPostArticles" AutoLayout="True" Width="988px" Height="379px"  
        runat="server" SeriesOrientation="Horizontal" 
        meta:resourcekey="rcPostArticlesResource1" 
        onitemdatabound="rcPostArticles_ItemDataBound">
        <Series>
            <telerik:ChartSeries DataYColumn="POST_TIMES" ActiveRegionToolTip="POST_TIMES:#Y" >
                <Appearance >
                    <LabelAppearance Visible="false"> 
                    </LabelAppearance>
                </Appearance>
            </telerik:ChartSeries>
        </Series>
        <Legend Visible="False">
            <Appearance Visible="False">
            </Appearance>
        </Legend>
        <PlotArea>
            <XAxis DataLabelsColumn="FORUM_BOARD_NAME">
            <Appearance MajorTick-Visible="false"></Appearance>
            </XAxis>
            <YAxis MinValue="0" AutoScale="false" ><Appearance MinorGridLines-Visible="false" MinorTick-Visible="false" MajorTick-Visible="false">
<MinorGridLines Visible="False"></MinorGridLines>
                </Appearance></YAxis>
        </PlotArea>
        <ChartTitle Visible="False">
            <Appearance Visible="False">
            </Appearance>
        </ChartTitle>
    </telerik:RadChart>
</asp:Content>

