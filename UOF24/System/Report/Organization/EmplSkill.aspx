<%@ Page Language="C#" MasterPageFile="~/Master/DefaultMasterPage.master" AutoEventWireup="true" Inherits="System_Report_Organization_EmplSkill" Title="員工專長分析" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" Codebehind="EmplSkill.aspx.cs" %>
<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Charting" TagPrefix="telerik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
<asp:UpdatePanel ID="UpdatePanel1" runat="server" >
    <ContentTemplate>
    <telerik:RadToolBar ID="RadToolBar1" runat="server" Width="300px">
        <Items>
            <telerik:RadToolBarButton Value="skillData">
                <ItemTemplate>
                    <asp:Label ID="lblSkillType" runat="server" Text="專長類別：" meta:resourcekey="lblSkillTypeResource1"></asp:Label>
                    <asp:DropDownList ID="ddlSkillType" runat="server" OnSelectedIndexChanged="ddlSkillType_SelectedIndexChanged" AutoPostBack="True" meta:resourcekey="ddlSkillTypeResource1">
                    </asp:DropDownList>
                </ItemTemplate>
            </telerik:RadToolBarButton>
        </Items>
    </telerik:RadToolBar>
            <table >
                <tr>
                    <td style="text-align: left; vertical-align: top;">
                        <Fast:Grid ID="Grid1" runat="server" AllowPaging="True" AutoGenerateCheckBoxColumn="False" AutoGenerateColumns="False" AllowSorting="True" OnPageIndexChanging="Grid1_PageIndexChanging"
                            Width="300px" meta:resourcekey="Grid1Resource1" DataKeyOnClientWithCheckBox="False">
                            <Columns>
                                <asp:BoundField DataField="SKILL_NAME" HeaderText="專長名稱" meta:resourcekey="BoundFieldResource1" />
                                <asp:BoundField DataField="EMPL_COUNT" HeaderText="員工人數" meta:resourcekey="BoundFieldResource2" />
                            </Columns>
                        </Fast:Grid>
                    </td>
                    <td style="width: 5px;" ></td>
                    <td style="text-align: left; vertical-align: top;">
                        <asp:Label ID="lblNoDataMsg" runat="server" Text="沒有任何資料" Visible="False" meta:resourcekey="lblNoDataMsgResource1"></asp:Label>
                        <telerik:RadChart ID="rcEmplSkill" Width="529px" Height="442px" AutoLayout="True"
                            runat="server" DefaultType="Pie" IntelligentLabelsEnabled="True"
                            OnItemDataBound="rcEmplSkill_ItemDataBound">
                            <Series>
                                <telerik:ChartSeries Name="Series 1" DataYColumn="EMPL_COUNT" ActiveRegionToolTip="#ITEM:#Y" DefaultLabelValue="#ITEM:#%{#0.##%}" Type="Pie">
                                    <Appearance LegendDisplayMode="ItemLabels" ShowLabelConnectors="true">
                                        <LabelAppearance LabelLocation="Outside" LabelConnectorStyle-StartCap="Custom"></LabelAppearance>
                                    </Appearance>
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
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

