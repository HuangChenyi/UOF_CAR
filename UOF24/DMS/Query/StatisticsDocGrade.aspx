<%@ Page Language="C#" MasterPageFile="~/Master/DefaultMasterPage.master" AutoEventWireup="true" Inherits="DMS_Query_StatisticsDocGrade" Title="文件評比統計" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" Codebehind="StatisticsDocGrade.aspx.cs" %>
<%@ Register Assembly="System.Web, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a" Namespace="System.Web.UI" TagPrefix="cc1" %>
<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>
<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Charting" tagprefix="telerik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <telerik:RadToolBar ID="RadToolBar1" Width="100%" runat="server" 
                meta:resourcekey="RadToolBar1Resource1">
                <Items>
                    <telerik:RadToolBarButton runat="server" Value="btn1" Text="Button 0" 
                        meta:resourcekey="RadToolBarButtonResource1" Owner="">
                        <ItemTemplate>
                            <asp:DropDownList runat="server" ID="ddlGrade" 
                                AutoPostBack="True" OnSelectedIndexChanged="ddlGrade_SelectedIndexChanged" 
                                meta:resourcekey="ddlGradeResource1"><asp:ListItem Value="GradeTop" 
                                    meta:resourcekey="ListItemResource1" Text="評比最高的前10筆文件"></asp:ListItem>
                            <asp:ListItem Value="GradeLow" meta:resourcekey="ListItemResource2" 
                                    Text="評比最低的前10筆文件"></asp:ListItem>
                            </asp:DropDownList>
                        </ItemTemplate>
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton runat="server" IsSeparator="True" Text="Button 1" 
                        meta:resourcekey="RadToolBarButtonResource2" Owner="">
                    </telerik:RadToolBarButton>
                </Items>
            </telerik:RadToolBar>
            <table  border="0" cellpadding="0" cellspacing="0">
                <tr >
                    <td style=" text-align:left; vertical-align:top;">
                        <Fast:Grid ID="gridChart" runat="server" AutoGenerateCheckBoxColumn="False"
                            AllowSorting="True" AutoGenerateColumns="False"
                            DataKeyOnClientWithCheckBox="False" OnRowDataBound="gridChart_RowDataBound"
                            Width="448px"  DefaultSortDirection="Ascending"
                            EmptyDataText="沒有資料" EnhancePager="True" KeepSelectedRows="False"
                            meta:resourcekey="gridChartResource1" PageSize="15" 
                            >
                            <ExportExcelSettings AllowExportToExcel="False" />
                            <Columns>
                                <asp:TemplateField HeaderText="文件名稱" meta:resourcekey="TemplateFieldResource2">
                                    <EditItemTemplate>
                                        <asp:TextBox runat="server" Text='<%# Bind("DOC_NAME") %>' ID="TextBox2" meta:resourcekey="TextBox2Resource1"></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <span style="word-break: break-all; width: 250px;">
                                            <asp:Image runat="server" ID="docIcon" meta:resourcekey="docIconResource1"></asp:Image>
                                            <asp:Label runat="server" Text='<%#: Bind("DOC_NAME") %>' ID="Label2" meta:resourcekey="Label2Resource1"></asp:Label>                                            
                                        </span>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="文件評比" meta:resourcekey="BoundFieldResource1">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("DOC_AVG_GRADE") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="lblAvgGrade" runat="server" Text='<%# Bind("DOC_AVG_GRADE") %>'></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Right"/>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="作者" meta:resourcekey="TemplateFieldResource3">
                                    <EditItemTemplate>
                                        <asp:TextBox runat="server" Text='<%# Bind("DOC_AUTHOR") %>' ID="TextBox1" meta:resourcekey="TextBox1Resource1"></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label runat="server" Text='<%#: Bind("DOC_AUTHOR") %>' ID="lblAuthor" meta:resourcekey="lblAuthorResource1"></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                            <EnhancePagerSettings FirstAltImageUrl="" FirstImageUrl="" LastAltImage="" LastImageUrl=""
                                NextIAltImageUrl="" NextImageUrl="" PageInfoCssClass="" PageNumberCssClass=""
                                PageNumberCurrentCssClass="" PageRedirectCssClass="" PreviousAltImageUrl="" PreviousImageUrl=""
                                ShowHeaderPager="True" />
                            <HeaderStyle Wrap="False" />
                        </Fast:Grid>
                    </td>
                    <td style="width: 5px;" ></td>
                    <td style="text-align:left; vertical-align:top;">
                        <telerik:RadChart ID="rcDocGrade" AutoLayout="True" Height="436px" 
                            Width="540px" runat="server" onitemdatabound="rcDocGrade_ItemDataBound" 
                            meta:resourcekey="rcDocGradeResource1">
                            <Series>
                                <telerik:ChartSeries Name="Series 1" DataYColumn="DOC_AVG_GRADE" ActiveRegionToolTip="DOC_AVG_GRADE:#Y">
                                    <Appearance ShowLabels="False">
                                    
                                    </Appearance>
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
                                <YAxis>
                                    <Appearance MinorTick-Visible="False" MajorTick-Visible="False">
                                        <MinorGridLines Visible="False" />
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

