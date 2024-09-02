<%@ Page Language="C#" MasterPageFile="~/Master/DefaultMasterPage.master" AutoEventWireup="true" Inherits="DMS_Query_StatisticsDocDownloadRate" Title="文件下載統計" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" Codebehind="StatisticsDocDownloadRate.aspx.cs" %>

<%@ Register Assembly="System.Web, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
    Namespace="System.Web.UI" TagPrefix="cc1" %>
<%@ Register Assembly="System.Web.Extensions"
    Namespace="System.Web.UI" TagPrefix="asp" %>

<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>

<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Charting" tagprefix="telerik" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">    
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <telerik:RadToolBar ID="RadToolBar1" Width="100%" runat="server" 
                meta:resourcekey="RadToolBar1Resource1" >
                <Items>
                    <telerik:RadToolBarButton runat="server" Value="btn1" Text="Button 0" 
                        meta:resourcekey="RadToolBarButtonResource1" Owner="" >
                        <ItemTemplate>
                            <asp:DropDownList ID="ddlChoiceType" runat="server"
                                AutoPostBack="True" OnSelectedIndexChanged="ddlChoiceType_SelectedIndexChanged" 
                                meta:resourcekey="ddlChoiceTypeResource1">
                                <asp:ListItem Value="dlMoreDocs" meta:resourcekey="ListItemResource1" 
                                    Text="最常下載的前10筆文件"></asp:ListItem>
                                <asp:ListItem Value="dlLessDocs" meta:resourcekey="ListItemResource2" 
                                    Text="最少下載的前10筆文件"></asp:ListItem>
                            </asp:DropDownList>
                        </ItemTemplate>
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton runat="server" IsSeparator="True" Text="Button 1" 
                        meta:resourcekey="RadToolBarButtonResource2" Owner="" >
                    </telerik:RadToolBarButton>
                </Items>    
            </telerik:RadToolBar>
            <table>    
                <tr style="height:80%;">
                    <td style="width: 40%; height: 100%;padding: 5px" valign="top">
                        <Fast:Grid ID="gridChart" runat="server" AutoGenerateCheckBoxColumn="False" 
                            AllowSorting="True" AutoGenerateColumns="False"  
                            DataKeyOnClientWithCheckBox="False" OnRowDataBound="gridChart_RowDataBound"   
                            Width="437px" EnhancePager="True" PageSize="15"  
                            DefaultSortDirection="Ascending" EmptyDataText="沒有資料" 
                            KeepSelectedRows="False" meta:resourcekey="gridChartResource1" 
                              >
                            <ExportExcelSettings AllowExportToExcel="False" />
                            <Columns>
                                <asp:TemplateField HeaderText="文件名稱" meta:resourcekey="TemplateFieldResource1">
                                    <edititemtemplate><span style="word-break:break-all; width:100px;">
                                <asp:TextBox runat="server" Text='<%# Bind("DOC_NAME") %>' ID="TextBox2" 
                                            __designer:wfdid="w4" meta:resourcekey="TextBox2Resource1"></asp:TextBox>
                                </span>
 
                                </edititemtemplate>
                                                    <headerstyle width="150px" />
                                                    <itemtemplate><span style="word-break:break-all; width:150px;">
                                <asp:Image runat="server" ID="docIcon" __designer:wfdid="w2" meta:resourcekey="docIconResource1"></asp:Image>
                                 <asp:Label runat="server" Text='<%#: Bind("DOC_NAME") %>' ID="Label1" __designer:wfdid="w3" 
                                                            meta:resourcekey="Label1Resource1"></asp:Label>
                                </span> 
                                </itemtemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="MANUAL_VERSION" HeaderText="版本" meta:resourcekey="TemplateFieldResource3">
                                    <headerstyle width="50px" />
                                </asp:BoundField>
                                <asp:TemplateField HeaderText="作者" meta:resourcekey="TemplateFieldResource2">
                                    <edititemtemplate>
                                <asp:TextBox runat="server" Text='<%# Bind("DOC_AUTHOR") %>' ID="TextBox1" 
                                            __designer:wfdid="w4" meta:resourcekey="TextBox1Resource1"></asp:TextBox>
                                </edititemtemplate>
                                                    <itemtemplate>
                                <asp:Label runat="server" Text='<%#: Bind("DOC_AUTHOR") %>' ID="lblAuthor" __designer:wfdid="w3" 
                                                            meta:resourcekey="lblAuthorResource1"></asp:Label>
                                </itemtemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="downloadrate" HeaderText="下載數" meta:resourcekey="BoundFieldResource1">
                                    <itemstyle horizontalalign="Center" />
                                    <headerstyle width="60px" />
                                </asp:BoundField>
                            </Columns>
                            <EnhancePagerSettings
                                ShowHeaderPager="True" />
                            <HeaderStyle Wrap="False" />
                        </Fast:Grid>
                    </td>
                    <td valign="top" style="height: 434px;padding: 5px">           
                        <telerik:RadChart ID="rcDownloadRate"  AutoLayout="True"  Height="433px" 
                            Width="509px"  runat="server" onitemdatabound="rcDownloadRate_ItemDataBound" 
                            meta:resourcekey="rcDownloadRateResource1" >
                            <Series>
                                <telerik:ChartSeries Name="Series 1" DataYColumn="downloadrate" ActiveRegionToolTip="downloadrate:#Y">
                                </telerik:ChartSeries>
                            </Series>
                            <Legend Visible="False">
                                <Appearance Visible="False">
                                </Appearance>
                            </Legend>
                            <PlotArea>
                                <XAxis DataLabelsColumn="DOC_NAME" AutoScale="False" MaxValue="7" MinValue="0" 
                                    Step="1">
                                    <Appearance MajorTick-Visible="False">
                                        <LabelAppearance RotationAngle="90"></LabelAppearance>
                                        <MajorGridLines Visible="False" />
                                    </Appearance>
                                </XAxis>
                                <YAxis AutoScale="False" MinValue="0" Step="1" MaxValue="7">
                                    <Appearance MinorTick-Visible="False" MajorTick-Visible="False">
                                        <MinorGridLines Visible="False" />
                                        <LabelAppearance Visible="False"></LabelAppearance>
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
    
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

