<%@ Page Language="C#" MasterPageFile="~/Master/DefaultMasterPage.master" AutoEventWireup="true" Inherits="WKF_Analysis_AvgTimeOfEndForm" Title="" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" Codebehind="AvgTimeOfEndForm.aspx.cs" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>
<%@ Register Assembly="System.Web, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a" Namespace="System.Web.UI" TagPrefix="cc1" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Charting" TagPrefix="telerik" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <telerik:RadToolBar ID="RadToolBar1" runat="server" Width="100%" meta:resourcekey="UltraWebToolbar1Resource1" OnButtonClick="RadToolBar1_ButtonClick">
        <Items>
            <telerik:RadToolBarButton runat="server" Text="Button 0" Value="Category"
                meta:resourcekey="RadToolBarButtonResource1">
                <ItemTemplate>
                    <table>
                        <tr>
                            <td>
                                <asp:Label runat="server" Text="類別：" ToolTip="表單類別" meta:resourceKey="TBLabelResource1"></asp:Label>
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
                                <asp:Label runat="server" Text="開始" meta:resourceKey="TBLabelResource2"></asp:Label>
                            </td>
                            <td>&nbsp;
                                <telerik:RadDatePicker ID="rdpStartDate" runat="server"
                                    meta:resourcekey="rdpStartDateResource1">
                                    <Calendar UseColumnHeadersAsSelectors="False" UseRowHeadersAsSelectors="False">
                                    </Calendar>
                                    <DateInput LabelWidth="64px"
                                        Width="">
                                    </DateInput>
                                    <DatePopupButton CssClass="" HoverImageUrl="" ImageUrl="" />
                                </telerik:RadDatePicker>
                            </td>
                            <td>
                                <asp:Label runat="server" Text="結束" meta:resourceKey="TBLabelResource3"></asp:Label>
                            </td>
                            <td>&nbsp;
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
            <telerik:RadToolBarButton runat="server" IsSeparator="True" Text="Button 4"
                Image="~/App_Themes/DefaultTheme/images/toolbarSp.jpg"
                meta:resourcekey="RadToolBarButtonResource4">
            </telerik:RadToolBarButton>
            <telerik:RadToolBarButton runat="server" Text="Button 5" Value="linebase"
                meta:resourcekey="RadToolBarButtonResource5">
                <ItemTemplate>
                    <table>
                        <tr>
                            <td>
                                <asp:Label runat="server" Text="格線：" ToolTip="格線基準" meta:resourceKey="TBLabelResource4"></asp:Label>
                            </td>
                            <td>
                                <asp:DropDownList runat="server" ID="ddllinebase"
                                    meta:resourcekey="ddllinebaseResource2">
                                    <asp:ListItem Text="5小時" Selected="True" Value="5"
                                        meta:resourcekey="ListItemResource5">
                                    </asp:ListItem>
                                    <asp:ListItem Text="10小時" Value="10" meta:resourcekey="ListItemResource6"></asp:ListItem>
                                    <asp:ListItem Text="15小時" Value="15" meta:resourcekey="ListItemResource7"></asp:ListItem>
                                </asp:DropDownList>
                            </td>
                        </tr>
                    </table>
                </ItemTemplate>
            </telerik:RadToolBarButton>
            <telerik:RadToolBarButton runat="server" IsSeparator="True" Text="Button 6"
                Image="~/App_Themes/DefaultTheme/images/toolbarSp.jpg"
                meta:resourcekey="RadToolBarButtonResource6">
            </telerik:RadToolBarButton>
            <telerik:RadToolBarButton runat="server" Text="查詢" meta:resourceKey="TBarButtonResource20"
                ImageUrl="~/Common/Images/Icon/icon_m39.gif"
                HoveredImageUrl="~/Common/Images/Icon/icon_m39.gif"
                DisabledImageUrl="~/Common/Images/Icon/icon_m39.gif"
                CheckedImageUrl="~/Common/Images/Icon/icon_m39.gif"
                Value="btnQuery">
            </telerik:RadToolBarButton>
            <telerik:RadToolBarButton runat="server" IsSeparator="True" Text="Button 8"
                Image="~/App_Themes/DefaultTheme/images/toolbarSp.jpg"
                meta:resourcekey="RadToolBarButtonResource7">
            </telerik:RadToolBarButton>
        </Items>
    </telerik:RadToolBar>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server" RenderMode="Inline" UpdateMode="Conditional">
        <ContentTemplate>
            <table>
                <tr>
                    <td style="text-align:left;vertical-align:top;">
                        <asp:CustomValidator runat="server" ID="cvCheckStartTime" ErrorMessage="請輸入查詢日期(起)" OnServerValidate="CheckStartTime" Display="Dynamic" ForeColor="Red" meta:resourceKey="RequiredFieldValidator1Resource1"></asp:CustomValidator>
                        <asp:CustomValidator runat="server" ID="cvCheckEndTime" ErrorMessage="請輸入查詢日期(迄)" OnServerValidate="CheckEndTime" Display="Dynamic" ForeColor="Red" meta:resourceKey="RequiredFieldValidator2Resource1"></asp:CustomValidator>
                        <asp:CustomValidator ID="CustomValidator1" runat="server" Display="Dynamic" ErrorMessage="結束時間需晚於開始時間" ForeColor="Red" meta:resourcekey="CustomValidator1Resource1" OnServerValidate="CustomValidator1_ServerValidate"></asp:CustomValidator>
                        <Fast:Grid ID="DGListAvgTime" runat="server" Width="575px"
                            meta:resourceKey="DGListAvgTimeResource1" OnSorting="DGListAvgTime_Sorting"
                            OnPageIndexChanging="DGListAvgTime_PageIndexChanging" AllowPaging="True"
                            AutoGenerateColumns="False" AutoGenerateCheckBoxColumn="False"
                            AllowSorting="True" DataKeyOnClientWithCheckBox="False" PageSize="15"
                             DefaultSortDirection="Ascending"
                            EmptyDataText="沒有資料" EnhancePager="True" KeepSelectedRows="False" CustomDropDownListPage="False" SelectedRowColor="" UnSelectedRowColor=""
                             >
                            <EnhancePagerSettings ShowHeaderPager="True" />
                            <ExportExcelSettings AllowExportToExcel="False" />
                            <Columns>
                                <asp:TemplateField HeaderText="類別" SortExpression="CATEGORY_NAME" meta:resourceKey="BoundFieldResource1">
                                    <ItemTemplate>
                                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("CATEGORY_NAME") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="FORM_NAME" SortExpression="FORM_NAME" HeaderText="表單" meta:resourceKey="BoundFieldResource2"></asp:BoundField>
                                <asp:BoundField DataField="HOUR" SortExpression="HOUR" HeaderText="時間" meta:resourceKey="BoundFieldResource3">
                                    <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                </asp:BoundField>
                            </Columns>
                        </Fast:Grid>
                    </td>
                    <td style="width: 5px;" ></td>
                    <td style="text-align:left;vertical-align:top;">
                        <asp:Label ID="lblNoData" runat="server" Text="沒有資料" meta:resourceKey="lblNoDataResource1" Visible="False"></asp:Label>
                        <telerik:RadChart ID="rcAvgEndForm" Height="500px" AutoLayout="True"
                            runat="server" OnItemDataBound="rcAvgEndForm_ItemDataBound"
                            meta:resourcekey="rcAvgEndFormResource1">
                            <Series>
                                <telerik:ChartSeries Name="Series 1" DataYColumn="HOUR" ActiveRegionToolTip="HOUR:#Y">
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
                                        <LabelAppearance RotationAngle="90"></LabelAppearance>
                                    </Appearance>
                                </XAxis>
                                <YAxis AutoScale="False" MinValue="0" MaxValue="7" Step="1">
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
                    </td>
                </tr>
            </table>
        </ContentTemplate>
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="RadToolBar1" EventName="ButtonClick"></asp:AsyncPostBackTrigger>
        </Triggers>
    </asp:UpdatePanel>
    <asp:Label ID="lblYAxisFormat" runat="server" Text="小時" Visible="false" meta:resourceKey="lblYAxisFormatResource1"></asp:Label>
</asp:Content>

