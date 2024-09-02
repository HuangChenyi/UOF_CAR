<%@ Page Language="C#" MasterPageFile="~/Master/DefaultMasterPage.master" AutoEventWireup="true" Inherits="System_Report_Organization_EmplJobTitle" Title="員工職級分析" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" Codebehind="EmplJobTitle.aspx.cs" %>

<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>
<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Charting" tagprefix="telerik" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table >
        <tr>
            <td style="text-align:left; vertical-align:top;">
                <Fast:Grid ID="Grid1" runat="server" AutoGenerateCheckBoxColumn="False" 
                    AutoGenerateColumns="False" Width="265px" meta:resourcekey="Grid1Resource1" 
                    AllowSorting="True" DataKeyOnClientWithCheckBox="False" 
                     DefaultSortDirection="Ascending" AllowPaging="true" OnPageIndexChanging="Grid1_PageIndexChanging"
                    EmptyDataText="沒有資料" EnhancePager="True" KeepSelectedRows="False" 
                    PageSize="15"  >
                    <Columns>
                        <asp:BoundField DataField="TITLE_NAME" HeaderText="職級" meta:resourcekey="BoundFieldResource1" />
                        <asp:BoundField DataField="COUNT" HeaderText="員工人數" meta:resourcekey="BoundFieldResource2" />
                    </Columns>
                </Fast:Grid>
            </td>
            <td style="width: 5px;" ></td>
            <td style="text-align:left; vertical-align:top;">
                <asp:Label ID="lblNoDataMsg" runat="server" Text="沒有任何資料" Visible="False" meta:resourcekey="lblNoDataMsgResource1"></asp:Label>
                <telerik:RadChart ID="rcEmplJobTitle" Width="529px" Height="442px" AutoLayout="True" 
                                runat="server" DefaultType="Pie" IntelligentLabelsEnabled="True"
                    onitemdatabound="rcEmplJobTitle_ItemDataBound" 
                    meta:resourcekey="rcEmplJobTitleResource1" >
                    <Series>
                        <telerik:ChartSeries  Name="Series 1" DataYColumn="COUNT" ActiveRegionToolTip="#ITEM:#Y" DefaultLabelValue="#ITEM:#%{#0.##%}"  Type="Pie">
                            <Appearance LegendDisplayMode="ItemLabels" ShowLabelConnectors="true" ><LabelAppearance ></LabelAppearance></Appearance>
                        </telerik:ChartSeries>
                    </Series>
                    <ChartTitle Visible="False">
                        <Appearance Visible="False">
                        </Appearance>
                    </ChartTitle>
                </telerik:RadChart>
            </td>
        </tr>
    </table>
</asp:Content>
