<%@ Page Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" Title="專案甘特圖" AutoEventWireup="true" Inherits="PMS_Query_GanttChart"  Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" Codebehind="GanttChart.aspx.cs" %>

<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Charting" tagprefix="telerik" %>
<%--<%@ Register Assembly="System.Web.Extensions" Namespace="System.Web.UI" TagPrefix="asp" %>    --%>
   
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<asp:UpdatePanel id="UpdatePanel1" runat="server">
    <contenttemplate>
    <table class="PopTable">
        <tr>
            <td>
                <asp:Label ID="Label1" runat="server" Text="專案名稱" meta:resourcekey="Label1Resource1"></asp:Label></td>
            <td>
                <asp:Label ID="lblProjName" runat="server" meta:resourcekey="lblProjNameResource1"></asp:Label></td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label2" runat="server" Text="查詢方式" meta:resourcekey="Label2Resource1"></asp:Label></td>
            <td>
                <asp:DropDownList ID="ddlQueryPeriod" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlQueryPeriod_SelectedIndexChanged" meta:resourcekey="ddlQueryPeriodResource1">
                    <asp:ListItem Value="day" meta:resourcekey="ListItemResource1" Text="日"></asp:ListItem>
                    <asp:ListItem Value="week" Selected="True" meta:resourcekey="ListItemResource2" 
                        Text="週"></asp:ListItem>
                    <asp:ListItem Value="month" meta:resourcekey="ListItemResource3" Text="月"></asp:ListItem>
                    <asp:ListItem Value="season" meta:resourcekey="ListItemResource4" Text="季"></asp:ListItem>
                    <asp:ListItem Value="year" meta:resourcekey="ListItemResource5" Text="年"></asp:ListItem>
                </asp:DropDownList></td>
        </tr>
    </table>
        <telerik:RadChart ID="ganttChart" runat="server" DefaultType="Gantt" SeriesOrientation="Horizontal" AutoLayout="True" >  
            <ChartTitle Visible="false">
                <Appearance Visible="False">
                </Appearance>
            </ChartTitle>
            <Series>
                <telerik:ChartSeries Name="Series 1" Type="Gantt" DataYColumn="TMP_START_DATE" DataYColumn2="TMP_END_DATE" DataLabelsColumn="NAME" >
                    <Appearance>
                        <LabelAppearance Visible="False">
                        </LabelAppearance>
                    </Appearance>
                </telerik:ChartSeries>
            </Series>
            <Legend Visible="false">
                <Appearance Visible="False">
                </Appearance>
            </Legend> 
            <PlotArea>
                <XAxis DataLabelsColumn="NAME" Appearance-LabelAppearance-Position-AlignedPosition="Left" LayoutMode="Inside">
                   <AxisLabel Visible="true" Appearance-Position-AlignedPosition="top">
                   </AxisLabel>
                </XAxis>
                <YAxis  Appearance-LabelAppearance-RotationAngle="90">
                    <Appearance MinorTick-Visible="false" MajorTick-Visible="false" MinorGridLines-Visible="false">
                        <LabelAppearance RotationAngle="90">
                        </LabelAppearance>
                    </Appearance>
                    <AxisLabel Visible="true">
                        <Appearance RotationAngle="0" Visible="True">
                        </Appearance>
                    </AxisLabel>
                </YAxis>
                <YAxis2>
                    <AxisLabel>
                        <Appearance RotationAngle="0">
                        </Appearance>
                    </AxisLabel>
                </YAxis2>
            </PlotArea>
        </telerik:RadChart>
   

</contenttemplate></asp:UpdatePanel>    
    <asp:HiddenField ID="hidProguid" runat="server" />
    <asp:HiddenField ID="hidProDataCount" runat="server" />
    <asp:Label runat="server" Visible="False" ID="lblYAxisTitle" Text="階段/任務" 
        meta:resourcekey="lblYAxisTitleResource1"></asp:Label>
    <asp:Label runat="server" Visible="False" ID="lblXAxisTitle" Text="日期" 
        meta:resourcekey="lblXAxisTitleResource1"></asp:Label>
</asp:Content>