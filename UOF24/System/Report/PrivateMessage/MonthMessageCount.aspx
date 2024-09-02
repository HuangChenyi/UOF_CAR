<%@ Page Language="C#" MasterPageFile="~/Master/DefaultMasterPage.master" AutoEventWireup="true" Inherits="System_Report_PrivateMessage_MonthMessageCount" Title="最近一個月訊息統計" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" Codebehind="MonthMessageCount.aspx.cs" %>
<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>
<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Charting" tagprefix="telerik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<center style="text-align: left">
    <asp:Label ID="lblNoDataMsg" runat="server" Text="沒有任何資料" Visible="False" meta:resourcekey="lblNoDataMsgResource1"></asp:Label>&nbsp;</center>
    <center style="text-align: left">
        <telerik:RadChart AutoLayout="True" ID="rcMessageCount" runat="server" 
            onitemdatabound="rcMessageCount_ItemDataBound" 
            meta:resourcekey="rcMessageCountResource1">
            <Series>
                <telerik:ChartSeries DataYColumn="MESSAGE_TIMES" ActiveRegionToolTip="MESSAGE_TIMES:#Y" Type="Line">
                    <Appearance>
                        <PointMark  Visible="True" Dimensions-AutoSize="true">
                             <FillStyle FillType="solid"></FillStyle>
                        </PointMark>
                    </Appearance>
                </telerik:ChartSeries>
            </Series>
            <Legend Visible="False">
                <Appearance Visible="False">
                </Appearance>
            </Legend>
            <PlotArea>
                <XAxis LayoutMode="Inside" DataLabelsColumn="SEND_DAY" >
                    <Appearance>
                        <LabelAppearance RotationAngle="270"></LabelAppearance>
                    </Appearance>
                </XAxis>
                <YAxis AutoScale="false" MinValue="0">
                    <Appearance MinorTick-Visible="false" MinorGridLines-Visible="false" >
                    </Appearance>
                </YAxis>
            </PlotArea>
            <ChartTitle Visible="False">
                <Appearance Visible="False">
                </Appearance>
            </ChartTitle>
        </telerik:RadChart>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    </center>
    <asp:HiddenField ID="hfCurrentGUID" runat="server" />
</asp:Content>

