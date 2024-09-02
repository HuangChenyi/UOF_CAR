<%@ Page Title="" Language="C#" MasterPageFile="~/Master/DefaultMasterPage.master" AutoEventWireup="true" CodeBehind="SpaceLend.aspx.cs" Inherits="System_SpaceLend" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" %>

<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Ede" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Charting" TagPrefix="telerik" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:UpdatePanel runat="server" ID="UpdatePanel1" style="height: 100%;">
        <ContentTemplate>
            <telerik:RadTabStrip runat="server" ID="RadTabStripSpaceLend" MultiPageID="RadMultiPageSpaceLend" BackColor="White" SelectedIndex="0" meta:resourcekey="RadTabStripSpaceLendResource1">
                <Tabs>
                    <telerik:RadTab Text="已用空間" Value="rtUsedSpace" Selected="True" meta:resourcekey="rtUsedSpaceResource1"></telerik:RadTab>
                    <telerik:RadTab Text="歷程記錄" Value="rtUsedSpaceHistory" meta:resourcekey="rtUsedSpaceHistoryResource1"></telerik:RadTab>
                </Tabs>
            </telerik:RadTabStrip>

            <telerik:RadMultiPage ID="RadMultiPageSpaceLend" runat="server" SelectedIndex="0" BackColor="White" meta:resourcekey="RadMultiPageSpaceLendResource1">
                <telerik:RadPageView ID="rpvUsedSpace" runat="server" Selected="True" meta:resourcekey="rpvUsedSpaceResource1">
                    <table style="width: 100%; height: 100%; background-color: white; padding-top: 15px;">
                        <tr style="height: 30px;">
                            <td style="padding: 15px;">
                                <asp:Label ID="lblSpaceUsedTitle" runat="server" Text="已用" Visible="false" meta:resourceKey="lblSpaceUsedTitleResource1"></asp:Label>
                                <asp:Label ID="lblSpaceUsed" runat="server" Visible="false" meta:resourceKey="lblSpaceUsedResource1"></asp:Label>

                                <table id="tbSpaceLend" runat="server" class="PopTable" style="width: 810px">
                                    <tr>
                                        <td style="white-space: nowrap; width: 81px;">
                                            <asp:Label ID="lblSpaceLendTitle" runat="server" Text="租用空間" meta:resourceKey="lblSpaceLendTitleResource1"></asp:Label>
                                        </td>
                                        <td style="text-align: right; width: 162px;">
                                            <asp:Label ID="lblSpaceLend" runat="server" meta:resourceKey="lblSpaceLendResource1"></asp:Label>
                                        </td>
                                        <td style="white-space: nowrap; width: 81px;">
                                            <asp:Label ID="lblSpaceReaminTitle" Text="剩餘空間" runat="server" meta:resourceKey="lblSpaceReaminTitleResource1"></asp:Label>
                                        </td>
                                        <td style="text-align: right; width: 162px;">
                                            <asp:Label ID="lblSpaceRemain" runat="server" meta:resourceKey="lblSpaceRemainResource1"></asp:Label>
                                        </td>
                                        <td style="white-space: nowrap; width: 81px;">
                                            <asp:Label ID="lblCreateDateTitle" runat="server" Text="最後更新時間" meta:resourceKey="lblCreateDateTitleResource1"></asp:Label>
                                        </td>
                                        <td style="text-align: center; width: 243px;">
                                            <asp:Label ID="lblCreateDate" runat="server" meta:resourceKey="lblCreateDateResource1"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="white-space: nowrap; vertical-align: middle;">
                                            <asp:Label ID="lblFileUsedTitle" runat="server" Text="檔案使用" meta:resourceKey="lblFileUsedTitleResource1"></asp:Label>
                                        </td>
                                        <td style="text-align: right; vertical-align: middle;">
                                            <asp:Label ID="lblFileUsed" runat="server" meta:resourceKey="lblFileUsedResource1"></asp:Label>
                                        </td>
                                        <td style="white-space: nowrap; vertical-align: middle;">
                                            <asp:Label ID="lblDBUsedTitle" runat="server" Text="資料庫使用" meta:resourceKey="lblDBUsedTitleResource1"></asp:Label>
                                        </td>
                                        <td style="text-align: right; vertical-align: middle;">
                                            <asp:Label ID="lblDBUsed" runat="server" meta:resourceKey="lblDBUsedResource1"></asp:Label>
                                        </td>
                                        <td style="white-space: nowrap; vertical-align: middle;"></td>
                                        <td style="text-align: center;">
                                            <asp:Button ID="btnUpdateInfo" runat="server" Text="更新資訊" OnClick="btnUpdateInfo_Click" meta:resourceKey="btnUpdateInfoResource1" />
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr style="display: none;">
                            <td style="padding-left: 15px; height: 30px; padding-bottom: 15px;">
                                <div class="k-content" style="float: left; width: 100%; max-width: 400px;">
                                    <telerik:RadProgressBar RenderMode="Lightweight" runat="server" ID="rpbSpaceLend" Skin="Silk" BarType="Percent" Width="400px" MaxValue="100" meta:resourcekey="rpbSpaceLendResource1">
                                    </telerik:RadProgressBar>

                                    <asp:HiddenField ID="hidSpaceUsed" runat="server" />
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td style="padding-left: 15px; vertical-align: middle;">
                                <telerik:RadChart ID="rcRound" runat="server" AutoLayout="True" OnItemDataBound="rcRound_ItemDataBound"
                                    Width="810px" Height="600px" DefaultType="Pie" meta:resourcekey="rcRoundResource1">
                                    <Series>
                                        <telerik:ChartSeries DataYColumn="Value"
                                            DefaultLabelValue="#%{#0.##%}" Name="Series 1" Type="Pie">
                                            <Appearance LegendDisplayMode="ItemLabels" ShowLabelConnectors="True" StartAngle="180">
                                                <EmptyValue>
                                                    <PointMark>
                                                        <FillStyle GammaCorrection="False">
                                                        </FillStyle>
                                                    </PointMark>
                                                </EmptyValue>
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
                        <tr>
                            <td style="text-align: center;">
                                <div style="width: 800px;">
                                    <asp:Label ID="lblChartTitle" runat="server" Text="租用空間使用狀況" CssClass="SizeMemo" Font-Size="X-Large" meta:resourceKey="lblChartTitleResource1"></asp:Label>
                                </div>
                            </td>
                        </tr>
                    </table>
                </telerik:RadPageView>
                <telerik:RadPageView ID="rpvUsedSpaceHistory" runat="server" meta:resourcekey="rpvUsedSpaceHistoryResource1">
                    <telerik:RadToolBar runat="server" ID="rtbSpaceLendHistory" OnButtonClick="rtbSpaceLendHistory_ButtonClick" SingleClick="None" Width="100%" meta:resourcekey="rtbSpaceLendHistoryResource1">
                        <Items>
                            <telerik:RadToolBarButton runat="server" Value="Time" meta:resourcekey="rtbbtnTimeResource1">
                                <ItemTemplate>
                                    <table>
                                        <tr>
                                            <td style="width: 20px;" runat="server">
                                                <asp:Label ID="lblCreateDateTitle2" runat="server" Text="更新時間:" meta:resourcekey="lblCreateDateTitle2Resource1"></asp:Label>
                                            </td>
                                            <td>
                                                <telerik:RadDatePicker runat="server" ID="rdStart"></telerik:RadDatePicker>
                                            </td>
                                            <td style="width: 10px;">
                                                <asp:Label ID="Label2" runat="server" Text="~"></asp:Label>
                                            </td>
                                            <td>
                                                <telerik:RadDatePicker runat="server" ID="rdEnd"></telerik:RadDatePicker>
                                            </td>
                                        </tr>
                                    </table>
                                </ItemTemplate>
                            </telerik:RadToolBarButton>
                            <telerik:RadToolBarButton runat="server" IsSeparator="true"></telerik:RadToolBarButton>
                            <telerik:RadToolBarButton runat="server" Text="查詢" Value="Query"
                                    CheckedImageUrl="~/Common/Images/Icon/icon_m39.png"
                                    DisabledImageUrl="~/Common/Images/Icon/icon_m39.png"
                                    HoveredImageUrl="~/Common/Images/Icon/icon_m39.png"
                                    ImageUrl="~/Common/Images/Icon/icon_m39.png"
                                    meta:resourcekey="rtbbtnQueryResource1">
                            </telerik:RadToolBarButton>
                            <telerik:RadToolBarButton runat="server" IsSeparator="true"></telerik:RadToolBarButton>
                        </Items>
                    </telerik:RadToolBar>

                    <Ede:Grid ID="grdSpaceLendHistory" runat="server" AutoGenerateCheckBoxColumn="False" AutoGenerateColumns="False" CustomDropDownListPage="False" DataKeyOnClientWithCheckBox="False" EmptyDataText="沒有資料" EnhancePager="True" KeepSelectedRows="False"
                        DefaultSortColumnName="CREATE_DATE" DefaultSortDirection="Descending" AllowSorting="true" OnSorting="grdSpaceLendHistory_Sorting"
                        AllowPaging="true" PageSize="15" OnPageIndexChanging="grdSpaceLendHistory_PageIndexChanging"
                        OnRowDataBound="grdSpaceLendHistory_RowDataBound" Width="100%" OnBeforeExport="grdSpaceLendHistory_BeforeExport"
                        meta:resourcekey="grdSpaceLendHistoryResource1">
                        <EnhancePagerSettings ShowHeaderPager="true"></EnhancePagerSettings>
                        <ExportExcelSettings AllowExportToExcel="true" ExportType="GridContent"></ExportExcelSettings>
                        <HeaderStyle Wrap="false" />
                        <RowStyle HorizontalAlign="Right" Wrap="false" />
                        <Columns>
                            <asp:TemplateField HeaderText="更新時間" SortExpression="CREATE_DATE" meta:resourcekey="TFCreateDateResource1">
                                <ItemTemplate>
                                    <asp:Label runat="server" ID="lblCreateDate"></asp:Label>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Left" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="執行者" SortExpression="SortUser" meta:resourcekey="TFSortUserResource1">
                                <ItemTemplate>
                                    <asp:Label runat="server" ID="lblCreator"></asp:Label>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Left" />
                            </asp:TemplateField>
                            <asp:BoundField HeaderText="租用空間(GB)" DataField="SPACE_LEND" SortExpression="SPACE_LEND" meta:resourcekey="BFSpaceLendResource1" />
                            <asp:BoundField HeaderText="剩餘空間(GB)" DataField="SPACE_REMAIN" DataFormatString="{0:N2}" SortExpression="SPACE_REMAIN" meta:resourcekey="BFSpaceRemainResource1" />
                            <asp:BoundField HeaderText="檔案使用(GB)" DataField="SPACE_DATA_USED" DataFormatString="{0:N2}" SortExpression="SPACE_DATA_USED" meta:resourcekey="BFSpaceDataUsedResource1" />
                            <asp:BoundField HeaderText="資料庫使用(GB)" DataField="SPACE_DB_USED" DataFormatString="{0:N2}" SortExpression="SPACE_DB_USED" meta:resourcekey="BFSpaceDbUsedResource1" />
                            <asp:BoundField HeaderText="已用空間比" DataField="SPACE_USED_PERCENT" DataFormatString="{0:N2}%" SortExpression="SPACE_USED_PERCENT" meta:resourcekey="BFSpaceUsedPercentResource1" />
                            <asp:BoundField HeaderText="相簿(MB)" DataField="ALBUM" DataFormatString="{0:N2}" SortExpression="ALBUM" meta:resourcekey="BFALBUMResource1" />
                            <asp:BoundField HeaderText="公事包(MB)" DataField="BRIEFCASE" DataFormatString="{0:N2}" SortExpression="BRIEFCASE" meta:resourcekey="BFBRIEFCASEResource1" />
                            <asp:BoundField HeaderText="公告(MB)" DataField="BULLETIN" DataFormatString="{0:N2}" SortExpression="BULLETIN" meta:resourcekey="BFBULLETINResource1" />
                            <asp:BoundField HeaderText="討論區(MB)" DataField="FORUM" DataFormatString="{0:N2}" SortExpression="FORUM" meta:resourcekey="BFFORUMResource1" />
                            <asp:BoundField HeaderText="影音(MB)" DataField="OMS" DataFormatString="{0:N2}" SortExpression="OMS" meta:resourcekey="BFOMSResource1" />
                            <asp:BoundField HeaderText="個人設定(MB)" DataField="PERSONAL" DataFormatString="{0:N2}" SortExpression="PERSONAL" meta:resourcekey="BFPERSONALResource1" />
                            <asp:BoundField HeaderText="場地設備管理(MB)" DataField="PLANT" DataFormatString="{0:N2}" SortExpression="PLANT" meta:resourcekey="BFPLANTResource1" />
                            <asp:BoundField HeaderText="私人訊息(MB)" DataField="PRIVATEMESSAGE" DataFormatString="{0:N2}" SortExpression="PRIVATEMESSAGE" meta:resourcekey="BFPRIVATEMESSAGEResource1" />
                            <asp:BoundField HeaderText="問卷調查(MB)" DataField="QUE" DataFormatString="{0:N2}" SortExpression="QUE" meta:resourcekey="BFQUEResource1" />
                            <asp:BoundField HeaderText="入口網站(MB)" DataField="EIP" DataFormatString="{0:N2}" SortExpression="EIP" meta:resourcekey="BFEIPResource1" />
                            <asp:BoundField HeaderText="文件管理(MB)" DataField="DMS" DataFormatString="{0:N2}" SortExpression="DMS" meta:resourcekey="BFDMSResource1" />
                            <asp:BoundField HeaderText="電子簽核(MB)" DataField="WKF" DataFormatString="{0:N2}" SortExpression="WKF" meta:resourcekey="BFWKFResource1" />
                            <asp:BoundField HeaderText="任務管理(MB)" DataField="PMS" DataFormatString="{0:N2}" SortExpression="PMS" meta:resourcekey="BFPMSResource1" />
                            <asp:BoundField HeaderText="龍捲風(MB)" DataField="TSP" DataFormatString="{0:N2}" SortExpression="TSP" meta:resourcekey="BFTSPResource1" />

                        </Columns>
                    </Ede:Grid>
                </telerik:RadPageView>
            </telerik:RadMultiPage>

        </ContentTemplate>
    </asp:UpdatePanel>

    <div runat="server" id="divLbl" style="display: none;">
        <asp:Label runat="server" ID="lblDB" Text="資料庫" meta:resourceKey="lblDBResource1"></asp:Label>
        <asp:Label runat="server" ID="lblALBUM" Text="相簿" meta:resourceKey="lblALBUMResource1"></asp:Label>
        <asp:Label runat="server" ID="lblBRIEFCASE" Text="公事包" meta:resourceKey="lblBRIEFCASEResource1"></asp:Label>
        <asp:Label runat="server" ID="lblBULLETIN" Text="公告" meta:resourceKey="lblBULLETINResource1"></asp:Label>
        <asp:Label runat="server" ID="lblDMS" Text="文件管理" meta:resourceKey="lblDMSResource1"></asp:Label>
        <asp:Label runat="server" ID="lblEIP" Text="入口網站" meta:resourceKey="lblEIPResource1"></asp:Label>
        <asp:Label runat="server" ID="lblFORUM" Text="討論區" meta:resourceKey="lblFORUMResource1"></asp:Label>
        <asp:Label runat="server" ID="lblOMS" Text="影音" meta:resourceKey="lblOMSResource1"></asp:Label>
        <asp:Label runat="server" ID="lblPERSONAL" Text="個人設定" meta:resourceKey="lblPERSONALResource1"></asp:Label>
        <asp:Label runat="server" ID="lblPLANT" Text="場地設備管理" meta:resourceKey="lblPLANTResource1"></asp:Label>
        <asp:Label runat="server" ID="lblPMS" Text="任務管理" meta:resourceKey="lblPMSResource1"></asp:Label>
        <asp:Label runat="server" ID="lblPRIVATEMESSAGE" Text="私人訊息" meta:resourceKey="lblPRIVATEMESSAGEResource1"></asp:Label>
        <asp:Label runat="server" ID="lblQUE" Text="問卷調查" meta:resourceKey="lblQUEResource1"></asp:Label>
        <asp:Label runat="server" ID="lblWKF" Text="電子簽核" meta:resourceKey="lblWKFResource1"></asp:Label>
        <asp:Label runat="server" ID="lblTSP" Text="龍捲風" meta:resourceKey="lblTSPResource1"></asp:Label>
        <asp:Label runat="server" ID="lblTask" Text="排程" meta:resourceKey="lblTaskResource1"></asp:Label>
    </div>
</asp:Content>
