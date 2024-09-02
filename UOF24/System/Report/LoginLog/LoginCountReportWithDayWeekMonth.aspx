<%@ Page Title="使用者登入次數統計表" Language="C#" MasterPageFile="~/Master/DefaultMasterPage.master" AutoEventWireup="true" CodeBehind="LoginCountReportWithDayWeekMonth.aspx.cs" Inherits="System_Report_LoginLog_LoginCountReportWithDayWeekMonth" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" %>

<%@ Register Src="../../../Common/Organization/GroupTree.ascx" TagName="GroupTree" TagPrefix="uc2" %>
<%@ Register Src="../../../Common/Organization/DepartmentTree.ascx" TagName="DepartmentTree" TagPrefix="uc1" %>
<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Charting" TagPrefix="telerik" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <link rel="stylesheet" href="LoginCountReport.css" />

    <script>
        function rtbLoginCountOnClick(sender, args) {

            switch (args.get_item().get_value()) {

                case 'ExportPDF':
                    const hfGridInnerHtml = $("#<%=hfGridInnerHtml.ClientID%>");
                    hfGridInnerHtml.val("<div>" + $("#<%=divTableLoginCount.ClientID%>").html() + "</div>");
                    break;
            }
        }
    </script>

    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <telerik:RadToolBar ID="rtbLoginCount" runat="server" Width="100%" OnClientButtonClicking="rtbLoginCountOnClick" OnButtonClick="rtbLoginCount_ButtonClick" meta:resourcekey="rtbLoginCountResource1" SingleClick="None">
                <Items>
                    <telerik:RadToolBarButton runat="server" Text="日期格式" Value="DateFormatType" meta:resourcekey="RadToolBarButtonResource1">
                        <ItemTemplate>
                            <table>
                                <tr>
                                    <td>
                                        <asp:Label ID="lblReport" runat="server" Text="報表：" meta:resourcekey="lblReportResource1"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="ddlDateFormatType" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlDateFormatType_SelectedIndexChanged" meta:resourcekey="ddlDateFormatTypeResource1">
                                            <Items>
                                                <asp:ListItem Text="週報表" Value="Week" Selected="True" meta:resourcekey="ListItemWeekResource1"></asp:ListItem>
                                                <asp:ListItem Text="日報表" Value="Day" meta:resourcekey="ListItemDayResource1"></asp:ListItem>
                                                <asp:ListItem Text="月報表" Value="Month" meta:resourcekey="ListItemMonthResource1"></asp:ListItem>
                                            </Items>
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                            </table>
                        </ItemTemplate>
                    </telerik:RadToolBarButton>

                    <telerik:RadToolBarButton runat="server" IsSeparator="True" meta:resourcekey="RadToolBarButtonResource2"></telerik:RadToolBarButton>

                    <telerik:RadToolBarButton runat="server" Text="週報表日期查詢" Value="Week" meta:resourcekey="RadToolBarButtonResource3">
                        <ItemTemplate>
                            <table>
                                <tr>
                                    <td>
                                        <asp:Label ID="lblStartDate" runat="server" Text="起始日期：" meta:resourceKey="lblStartDateResource1"></asp:Label>
                                    </td>
                                    <td>
                                        <telerik:RadDatePicker ID="rdpWeekStartDate" runat="server"></telerik:RadDatePicker>
                                    </td>
                                    <td>
                                        &nbsp;
                                        <asp:Label ID="lblWeekRange" runat="server" Text="週數：" meta:resourceKey="lblWeekRangeResource1"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="ddlWeekRange" runat="server" meta:resourcekey="ddlWeekRangeResource1"></asp:DropDownList>
                                    </td>
                                </tr>
                            </table>
                        </ItemTemplate>
                    </telerik:RadToolBarButton>

                    <telerik:RadToolBarButton runat="server" Text="日報表日期查詢" Value="Day" meta:resourcekey="RadToolBarButtonResource4">
                        <ItemTemplate>
                            <table>
                                <tr>
                                    <td>
                                        <asp:Label ID="lblYearAndMonth" runat="server" Text="年度／月份：" meta:resourceKey="lblYearAndMonthResource1"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="ddlStartYear" runat="server" meta:resourcekey="ddlStartYearResource1"></asp:DropDownList>
                                    </td>
                                    <td>
                                        <asp:Label ID="lblSlash" runat="server" Text="／" meta:resourceKey="lblSlashResource1"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="ddlStartMonth" runat="server" meta:resourcekey="ddlStartMonthResource1"></asp:DropDownList>                                      
                                    </td>
                                </tr>
                            </table>
                        </ItemTemplate>
                    </telerik:RadToolBarButton>

                    <telerik:RadToolBarButton runat="server" Text="月報表日期查詢" Value="Month" meta:resourcekey="RadToolBarButtonResource5">
                        <ItemTemplate>
                            <table>
                                <tr>
                                    <td>
                                        <asp:Label ID="lblTilde" runat="server" Text="～" meta:resourceKey="lblTildeResource1"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="ddlEndYear" runat="server" meta:resourcekey="ddlEndYearResource1"></asp:DropDownList>
                                    </td>
                                    <td>
                                        <asp:Label ID="lblSlash2" runat="server" Text="／" meta:resourceKey="lblSlashResource1"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="ddlEndMonth" runat="server" meta:resourcekey="ddlEndMonthResource1"></asp:DropDownList>
                                    </td>
                                </tr>
                            </table>
                        </ItemTemplate>
                    </telerik:RadToolBarButton>

                    <telerik:RadToolBarButton runat="server" IsSeparator="True" meta:resourcekey="RadToolBarButtonResource6"></telerik:RadToolBarButton>

                    <telerik:RadToolBarButton runat="server" Text="查詢" Value="Query"
                        CheckedImageUrl="~/Common/Images/Icon/icon_m39.gif"
                        DisabledImageUrl="~/Common/Images/Icon/icon_m39.gif"
                        HoveredImageUrl="~/Common/Images/Icon/icon_m39.gif"
                        ImageUrl="~/Common/Images/Icon/icon_m39.gif"
                        meta:resourcekey="rtbQueryResource1">
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton runat="server" IsSeparator="True" meta:resourcekey="RadToolBarButtonResource7"></telerik:RadToolBarButton>

                    <telerik:RadToolBarButton runat="server" Text="匯出PDF" Value="ExportPDF"
                        ImageUrl="~/Common/Images/Icon/pdf.gif"
                        HoveredImageUrl="~/Common/Images/Icon/pdf.gif"
                        DisabledImageUrl="~/Common/Images/Icon/pdf.gif"
                        CheckedImageUrl="~/Common/Images/Icon/pdf.gif"
                        meta:resourcekey="rtbExportPDFResource1">
                    </telerik:RadToolBarButton>

                    <telerik:RadToolBarButton runat="server" IsSeparator="True" meta:resourcekey="RadToolBarButtonResource8"></telerik:RadToolBarButton>

                    <telerik:RadToolBarButton runat="server" Text="驗證月報表區間" Value="Validator" meta:resourcekey="RadToolBarButtonResource9">
                        <ItemTemplate>
                            &nbsp;
                            <asp:CustomValidator ID="cvCheckRangeInOneYear" runat="server" Visible="false" ErrorMessage="查詢區間不可大於一年" ForeColor="Red" Display="Dynamic" meta:resourcekey="cvCheckRangeInOneYearResource1"></asp:CustomValidator>
                            <asp:CustomValidator ID="cvCheckEndDateGreaterThanStartDate" runat="server" Visible="false" ErrorMessage="結束年月不可早於開始年月" ForeColor="Red" Display="Dynamic" meta:resourcekey="cvCheckEndDateGreaterThanStartDateResource1"></asp:CustomValidator>
                        </ItemTemplate>
                    </telerik:RadToolBarButton>

                </Items>
            </telerik:RadToolBar>

            <div style="float:left;">
                <table style="margin: 0px auto;">
                    <tr>
                        <td>
                            <div style="text-align:left;">
                                <asp:Label ID="lblNoData" runat="server" Text="沒有資料" Visible="False" meta:resourceKey="lblNoDataResource1"></asp:Label>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <br />
                            <div id="divTableLoginCount" runat="server">
                                <table id="tbLoginCount" class="LoignCountReport" runat="server"></table>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <div id="divRadChart" runat="server">
                                <br />

                                <telerik:RadChart ID="rcLoginCount" AutoLayout="True" Visible="false" runat="server" meta:resourcekey="rcLoginCountResource1" >
                                    <Appearance>
                                        <Border Visible="false" />
                                    </Appearance>

                                    <ChartTitle>
                                        <TextBlock>
                                            <Appearance TextProperties-Color="Black" TextProperties-Font="微軟正黑體, 18pt"></Appearance>
                                        </TextBlock>
                                    </ChartTitle>

                                    <Series>
                                        <telerik:ChartSeries Name="Series 1" Type="Line" DataYColumn="LOGIN_TIMES" ActiveRegionToolTip="#Y">
                                            <Appearance>
                                                <PointMark Visible="true" Dimensions-AutoSize="false" Dimensions-Height="7" Dimensions-Width="7" >
                                                    <FillStyle MainColor="#0073E6" FillType="Solid" ></FillStyle>
                                                </PointMark>
                                                
                                                <TextAppearance TextProperties-Color="Black" TextProperties-Font="微軟正黑體, 10pt"></TextAppearance>
                                            </Appearance>
                                        </telerik:ChartSeries>
                                    </Series>

                                    <Legend Visible="False">
                                        <Appearance Visible="False"></Appearance>
                                    </Legend>

                                    <PlotArea>
                                        <Appearance Border-Visible="false" Border-Color="Gray" Border-Width="3">
                                            <FillStyle FillType="Solid" MainColor="White"></FillStyle>
                                        </Appearance>
                                        
                                        <XAxis LayoutMode="Inside" DataLabelsColumn="X_AXIS">
                                            <Appearance>
                                                <TextAppearance TextProperties-Color="Black"></TextAppearance>
                                            </Appearance>
                                            
                                            <AxisLabel Visible="True">
                                                <Appearance Visible="True"></Appearance>
                                                <TextBlock>
                                                    <Appearance TextProperties-Color="Black" TextProperties-Font="微軟正黑體, 12pt"></Appearance>
                                                </TextBlock>
                                            </AxisLabel>
                                        </XAxis>

                                        <YAxis>
                                            <Appearance>
                                                <MajorGridLines Visible="false" />
                                                <TextAppearance TextProperties-Color="Black" TextProperties-Font="微軟正黑體, 10pt"></TextAppearance>
                                            </Appearance>

                                            <AxisLabel Visible="True">
                                                <Appearance RotationAngle="0" Visible="True"></Appearance>
                                                <TextBlock>
                                                    <Appearance TextProperties-Color="Black" TextProperties-Font="微軟正黑體, 12pt"></Appearance>
                                                </TextBlock>
                                            </AxisLabel>
                                        </YAxis>
                                    </PlotArea>

                                </telerik:RadChart>
                            </div>
                        </td>
                    </tr>
                </table>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
    
    <asp:Label ID="lblDayTitle" runat="server" Text="日" Visible="False" meta:resourcekey="lblDayTitleResource1" ></asp:Label>
    <asp:Label ID="lblWeekTitle" runat="server" Text="週" Visible="False" meta:resourcekey="lblWeekTitleResource1" ></asp:Label>
    <asp:Label ID="lblMonthTitle" runat="server" Text="月" Visible="False" meta:resourcekey="lblMonthTitleResource1" ></asp:Label>
    <asp:Label ID="lblYearTitle" runat="server" Text="年度" Visible="False" meta:resourcekey="lblYearTitleResource1" ></asp:Label>
    <asp:Label ID="lblDateTitle" runat="server" Text="日期" Visible="False" meta:resourcekey="lblDateTitleResource1" ></asp:Label>
    <asp:Label ID="lblCountTitle" runat="server" Text="次數" Visible="False" meta:resourcekey="lblCountTitleResource1" ></asp:Label>
    <asp:Label ID="lblChartTitle" runat="server" Text="使用者登入次數統計表" Visible="False" meta:resourcekey="lblChartTitleResource1"></asp:Label>
    <asp:Label ID="lblXaxisTitle" runat="server" Text="登入區間（計算單位：#）" Visible="False" meta:resourcekey="lblXaxisTitleResource1"></asp:Label>
    <asp:Label ID="lblYaxisTitle" runat="server" Text="使用者登入次數（單位：次）" Visible="False" meta:resourcekey="lblYaxisTitleResource1"></asp:Label>

    <asp:HiddenField ID="hfGridInnerHtml" runat="server" />
</asp:Content>
