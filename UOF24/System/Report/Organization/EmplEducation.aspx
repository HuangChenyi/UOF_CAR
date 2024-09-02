<%@ Page Language="C#" MasterPageFile="~/Master/DefaultMasterPage.master" AutoEventWireup="true" Inherits="System_Report_Organization_EmplEducation" Title="員工教育程度分析" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" Codebehind="EmplEducation.aspx.cs" %>

<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>
<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Charting" tagprefix="telerik" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table >
        <tr>
            <td  style="text-align:left; vertical-align:top;">
                <Fast:Grid ID="Grid1" runat="server" AutoGenerateCheckBoxColumn="False" 
                    AllowPaging="True" AutoGenerateColumns="False"    Width="50%" 
                    AllowSorting="True" meta:resourcekey="Grid1Resource1" 
                    DataKeyOnClientWithCheckBox="False" OnPageIndexChanging="Grid1_PageIndexChanging"
                    DefaultSortDirection="Ascending" EmptyDataText="沒有資料" 
                    EnhancePager="True" KeepSelectedRows="False" PageSize="15">
                    <Columns>
                        <asp:BoundField DataField="EDUC_NAME" HeaderText="學歷" meta:resourcekey="BoundFieldResource1" />
                        <asp:BoundField DataField="EMPL_COUNT" HeaderText="員工人數" meta:resourcekey="BoundFieldResource2" />
                    </Columns>
                </Fast:Grid>
            </td>
            <td style="width: 5px;" ></td>
            <td style=" text-align:left; vertical-align:top;">
                <asp:Label ID="lblNoDataMsg" runat="server" Text="沒有任何資料" Visible="False" meta:resourcekey="lblNoDataMsgResource1"></asp:Label>
                <telerik:RadChart ID="rcEmplEducation" Width="529px" Height="442px" AutoLayout="True" 
                                runat="server" DefaultType="Pie" IntelligentLabelsEnabled="true"
                                onitemdatabound="rcEmplEducation_ItemDataBound" 
                                meta:resourcekey="rcEmplEducationResource1">
                    <Series>
                        <telerik:ChartSeries Name="Series 1" DataYColumn="EMPL_COUNT" ActiveRegionToolTip="#ITEM:#Y" DefaultLabelValue="#ITEM:#%{#0.##%}"  Type="Pie">
                            <Appearance LegendDisplayMode="ItemLabels"  ShowLabelConnectors="true"></Appearance>
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

