<%@ Page Language="C#" MasterPageFile="~/Master/DefaultMasterPage.master" AutoEventWireup="true" Inherits="WKF_Analysis_CountApplyForm" Title="" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" Codebehind="CountApplyForm.aspx.cs" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>

<%@ Register Assembly="System.Web, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a" Namespace="System.Web.UI" TagPrefix="cc1" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Charting" TagPrefix="telerik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <telerik:RadToolBar ID="RadToolBar1" runat="server" meta:resourcekey="UltraWebToolbar1Resource1" Width="100%" OnButtonClick="RadToolBar1_ButtonClick">
        <Items>
            <telerik:RadToolBarButton runat="server" Text="Button 0" Value="Category"
                meta:resourcekey="RadToolBarButtonResource1">
                <ItemTemplate>
                    <table>
                        <tr>
                            <td>
                                <asp:Label runat="server" Text="表單類別：" meta:resourcekey="TBLabelResource4"></asp:Label>
                            </td>
                            <td>
                                <asp:DropDownList runat="server" ID="ddlCategory" meta:resourceKey="ddlCategoryResource1">
                                    <asp:ListItem Text="全部類別" Value="all" meta:resourceKey="ListItemResource1"></asp:ListItem>
                                </asp:DropDownList>
                            </td>
                        </tr>
                    </table>
                </ItemTemplate>
            </telerik:RadToolBarButton>
            <telerik:RadToolBarButton runat="server" IsSeparator="True" Text="Button 1"
                Image="~/App_Themes/DefaultTheme/images/toolbarSp.jpg"
                meta:resourcekey="RadToolBarButtonResource2">
            </telerik:RadToolBarButton>
            <telerik:RadToolBarButton runat="server" Text="Button 2" Value="Time"
                meta:resourcekey="RadToolBarButtonResource3">
                <ItemTemplate>
                    <table>
                        <tr>
                            <td>
                                <asp:Label runat="server" Text="開始時間：" meta:resourceKey="TBLabelResource2"></asp:Label>
                            </td>
                            <td>
                                <telerik:RadDatePicker ID="rdpStartDate" runat="server" meta:resourcekey="rdpStartDateResource1">
                                    <Calendar UseColumnHeadersAsSelectors="False" UseRowHeadersAsSelectors="False">
                                    </Calendar>
                                    <DateInput LabelWidth="64px" Width="">
                                    </DateInput>
                                    <DatePopupButton CssClass="" HoverImageUrl="" ImageUrl="" />
                                </telerik:RadDatePicker>
                            </td>
                            <td>
                                <asp:Label runat="server" Text="結束時間：" meta:resourceKey="TBLabelResource3"></asp:Label>
                            </td>
                            <td>
                                <telerik:RadDatePicker ID="rdpEndDate" runat="server"
                                    meta:resourcekey="rdpEndDateResource1">
                                    <Calendar UseColumnHeadersAsSelectors="False" UseRowHeadersAsSelectors="False">
                                    </Calendar>
                                    <DateInput LabelWidth="64px"
                                        Width="">
                                    </DateInput>
                                    <DatePopupButton CssClass="" HoverImageUrl="" ImageUrl="" />
                                </telerik:RadDatePicker>
                            </td>
                        </tr>
                    </table>
                </ItemTemplate>
            </telerik:RadToolBarButton>
            <telerik:RadToolBarButton runat="server" IsSeparator="True" Text="Button 3"
                Image="~/App_Themes/DefaultTheme/images/toolbarSp.jpg"
                meta:resourcekey="RadToolBarButtonResource4">
            </telerik:RadToolBarButton>
            <telerik:RadToolBarButton runat="server" Text="查詢" Value="type"
                meta:resourcekey="RadToolBarButtonResource5">
                <ItemTemplate>
                    <asp:DropDownList runat="server" Width="120px" ID="ddlType" meta:resourcekey="ddlTypeResource1">
                        <asp:ListItem Value="count" meta:resourcekey="ListItemResource2" Text="使用次數"></asp:ListItem>
                        <asp:ListItem Value="rate" meta:resourcekey="ListItemResource3" Text="使用率"></asp:ListItem>
                    </asp:DropDownList>
                </ItemTemplate>
            </telerik:RadToolBarButton>
            <telerik:RadToolBarButton runat="server" IsSeparator="True" Text="Button 5"
                Image="~/App_Themes/DefaultTheme/images/toolbarSp.jpg"
                meta:resourcekey="RadToolBarButtonResource6">
            </telerik:RadToolBarButton>
            <telerik:RadToolBarButton runat="server" Text="查詢" Value="btnQuery" meta:resourceKey="TBarButtonResource20"
                ImageUrl="~/Common/Images/Icon/icon_m39.gif"
                HoveredImageUrl="~/Common/Images/Icon/icon_m39.gif"
                DisabledImageUrl="~/Common/Images/Icon/icon_m39.gif"
                CheckedImageUrl="~/Common/Images/Icon/icon_m39.gif">
            </telerik:RadToolBarButton>
            <telerik:RadToolBarButton runat="server" IsSeparator="True" Text="Button 7"
                Image="~/App_Themes/DefaultTheme/images/toolbarSp.jpg"
                meta:resourcekey="RadToolBarButtonResource7">
            </telerik:RadToolBarButton>
        </Items>
    </telerik:RadToolBar>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server" RenderMode="Inline" UpdateMode="Conditional">
        <ContentTemplate>
            <table style="width: 100%">
                <tr>
                    <td style="height: 327px;text-align:left; vertical-align:top;">

                        <asp:CustomValidator runat="server" ID="cvCheckStartTime" ErrorMessage="請輸入查詢日期(起)" OnServerValidate="CheckStartTime" Display="Dynamic" ForeColor="Red" meta:resourceKey="RequiredFieldValidator1Resource1"></asp:CustomValidator>
                        <asp:CustomValidator runat="server" ID="cvCheckEndTime" ErrorMessage="請輸入查詢日期(迄)" OnServerValidate="CheckEndTime" Display="Dynamic" ForeColor="Red" meta:resourceKey="RequiredFieldValidator2Resource1"></asp:CustomValidator>
                        <asp:CustomValidator ID="CustomValidator1" runat="server" Display="Dynamic" ErrorMessage="結束時間需晚於開始時間" ForeColor="Red" meta:resourcekey="CustomValidator1Resource1" OnServerValidate="CustomValidator1_ServerValidate"></asp:CustomValidator>
                        <Fast:Grid runat="server" EnhancePager="True" Width="575px"
                            DataKeyOnClientWithCheckBox="False" AllowSorting="True" PageSize="15"
                            AutoGenerateCheckBoxColumn="False" AutoGenerateColumns="False"
                            ID="DGListApplyCount" AllowPaging="True"
                            OnPageIndexChanging="DGListApplyCount_PageIndexChanging"
                            OnSorting="DGListApplyCount_Sorting" 
                            DefaultSortDirection="Ascending" EmptyDataText="沒有資料"
                            KeepSelectedRows="False" meta:resourcekey="DGListApplyCountResource2" CustomDropDownListPage="False" SelectedRowColor="" UnSelectedRowColor="" OnRowDataBound="DGListApplyCount_RowDataBound"
                             >
                            <EnhancePagerSettings ShowHeaderPager="True"></EnhancePagerSettings>
                            <ExportExcelSettings AllowExportToExcel="False" />
                            <Columns>
                                <asp:TemplateField HeaderText="類別" SortExpression="CATEGORY_NAME" meta:resourceKey="BoundFieldResource1">
                                    <ItemTemplate>
                                        <asp:Label ID="lblCateName" runat="server" Text='<%# Bind("CATEGORY_NAME") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="FORM_NAME" SortExpression="FORM_NAME" HeaderText="表單" meta:resourceKey="BoundFieldResource2"></asp:BoundField>
                                <asp:BoundField DataField="COUNT" SortExpression="COUNT" HeaderText="次數" meta:resourceKey="BoundFieldResource3">
                                    <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                </asp:BoundField>
                            </Columns>
                        </Fast:Grid>
                    </td>
                    <td style="width: 5px;" ></td>
                    <td rowspan="2" style="height: 327px; text-align:left; vertical-align:top;">
                        <asp:Label runat="server" Text="沒有資料" ID="lblNoData" Visible="False" meta:resourceKey="lblNoDataResource1"></asp:Label>
                        <telerik:RadChart ID="rcTimes" AutoLayout="True" runat="server" Height="500px"
                            OnItemDataBound="rcTimes_ItemDataBound"
                            meta:resourcekey="rcTimesResource1">
                            <Series>
                                <telerik:ChartSeries Name="Series 1" DataYColumn="COUNT" ActiveRegionToolTip="COUNT:#Y">
                                </telerik:ChartSeries>
                            </Series>
                            <Legend Visible="False">
                                <Appearance Visible="False">
                                </Appearance>
                            </Legend>
                            <PlotArea>
                                <XAxis DataLabelsColumn="FORM_NAME" AutoScale="False" MaxValue="7" MinValue="0"
                                    Step="1">
                                    <Appearance MajorTick-Visible="False">
                                        <MajorGridLines Visible="False" />
                                        <LabelAppearance RotationAngle="90">
                                        </LabelAppearance>
                                    </Appearance>
                                </XAxis>
                                <YAxis>
                                    <Appearance MajorTick-Visible="False" MinorTick-Visible="False">
                                        <MinorGridLines Visible="False" />
                                    </Appearance>
                                </YAxis>
                            </PlotArea>
                            <ChartTitle Visible="False">
                                <Appearance Visible="False">
                                </Appearance>
                            </ChartTitle>
                        </telerik:RadChart>
                        <telerik:RadChart ID="rcFrequency" Height="400px" Width="600px" runat="server"
                            IntelligentLabelsEnabled="True" AutoLayout="True"
                            DefaultType="Pie" OnItemDataBound="rcFrequency_ItemDataBound"
                            meta:resourcekey="rcFrequencyResource1">
                            <Series>
                                <telerik:ChartSeries Name="Series 1" DataYColumn="COUNT" ActiveRegionToolTip="#ITEM:#Y" DefaultLabelValue="#ITEM:#%{#0.##%}" Type="Pie">
                                    <Appearance ShowLabelConnectors="True" LegendDisplayMode="ItemLabels">
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
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="RadToolBar1" EventName="ButtonClick"></asp:AsyncPostBackTrigger>
        </Triggers>
    </asp:UpdatePanel>
</asp:Content>

