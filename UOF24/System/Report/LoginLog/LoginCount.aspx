<%@ Page Language="C#" MasterPageFile="~/Master/TwoColumn.master" AutoEventWireup="true" Inherits="System_Report_LoginLog_LoginCount" Title="最近一個月登入使用者統計" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" Codebehind="LoginCount.aspx.cs" %>

<%@ Register Src="../../../Common/Organization/GroupTree.ascx" TagName="GroupTree"
    TagPrefix="uc2" %>
<%@ Register Src="../../../Common/Organization/DepartmentTree.ascx" TagName="DepartmentTree"
    TagPrefix="uc1" %>
<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Charting" TagPrefix="telerik" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ScriptContentPlaceHolder" runat="Server">
    <script language="javascript" type="text/javascript">
        function OnValueChanging(sender, args) {
            if (args.get_newValue() === "") {
                args.set_newValue(args.get_oldValue());
            }
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ToolbarContentPlaceHolder" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
        <ContentTemplate>
            <telerik:RadTabStrip ID="rtsLoginCount" MultiPageID="mtpLoginCount" AutoPostBack="True"
                runat="server" SelectedIndex="0" OnTabClick="rtsLoginCount_TabClick"
                meta:resourcekey="rtsLoginCountResource1">
                <Tabs>
                    <telerik:RadTab Value="byTime" Selected="True" runat="server"
                        meta:resourcekey="RadTabResource1" Owner="">
                    </telerik:RadTab>
                    <telerik:RadTab Value="byEmp" runat="server" meta:resourcekey="RadTabResource2"
                        Owner="">
                    </telerik:RadTab>
                    <telerik:RadTab Value="byMemb" runat="server"
                        meta:resourcekey="RadTabResource3" Owner="">
                    </telerik:RadTab>
                </Tabs>
            </telerik:RadTabStrip>
        </ContentTemplate>
    </asp:UpdatePanel>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="LeftContentPlaceHolder" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel3" UpdateMode="Conditional" runat="server">
        <ContentTemplate>
            <telerik:RadMultiPage ID="rmpTree" BackColor="White" runat="server"
                SelectedIndex="0">
                <telerik:RadPageView ID="RadPageView1" runat="server" >
                </telerik:RadPageView>
                <telerik:RadPageView ID="RadPageView2" runat="server" >
                    <uc1:DepartmentTree ID="DepartmentTree1" runat="server" DisplayActiveControl="true"/>
                </telerik:RadPageView>
                <telerik:RadPageView ID="RadPageView3" runat="server"
                    meta:resourcekey="byMembResource2">
                    <uc2:GroupTree ID="GroupTree1" runat="server" />
                </telerik:RadPageView>
            </telerik:RadMultiPage>
        </ContentTemplate>
    </asp:UpdatePanel>

</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="RightContentPlaceHolder" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional" RenderMode="Inline">
        <ContentTemplate>
        
            <telerik:RadMultiPage ID="mtpLoginCount" BackColor="White" runat="server"
                SelectedIndex="0" meta:resourcekey="mtpLoginCountResource1">
                <telerik:RadPageView ID="byTime" runat="server"
                    meta:resourcekey="byTimeResource1" Selected="True">
                    <asp:Label ID="lblNoDataMsg" runat="server" Text="沒有任何資料" Visible="False" meta:resourcekey="lblNoDataMsgResource1"></asp:Label>
                    <telerik:RadChart AutoLayout="True" ID="rcLoginCount" runat="server"
                        meta:resourcekey="rcLoginCountResource1"
                        OnItemDataBound="rcLoginCount_ItemDataBound">
                        <Series>
                            <telerik:ChartSeries DataYColumn="LOGIN_TIMES"
                                ActiveRegionToolTip="LOGIN_TIMES:#Y" Type="Line">
                                <Appearance>
                                    <PointMark Visible="True">
                                    </PointMark>
                                </Appearance>
                            </telerik:ChartSeries>
                        </Series>
                        <Legend Visible="False">
                            <Appearance Visible="False">
                            </Appearance>
                        </Legend>
                        <PlotArea>
                            <XAxis LayoutMode="Inside" DataLabelsColumn="LOGIN_DAYS" AutoScale="False"
                                MaxValue="7" MinValue="0" Step="1">
                                <Appearance>
                                    <LabelAppearance RotationAngle="270"></LabelAppearance>
                                </Appearance>
                            </XAxis>
                            <YAxis AutoScale="False" MinValue="0" MaxValue="7" Step="1">
                                <Appearance MinorTick-Visible="False" MinorGridLines-Visible="false">
                                </Appearance>
                            </YAxis>
                        </PlotArea>
                        <ChartTitle Visible="False">
                            <Appearance Visible="False">
                            </Appearance>
                        </ChartTitle>
                    </telerik:RadChart>
                </telerik:RadPageView>
                <telerik:RadPageView ID="byEmp" runat="server"
                    meta:resourcekey="byEmpResource1">
                    <table width="100%">
                        <tr>
                            <td valign="top" align="left" width="80%">
                                <telerik:RadToolBar ID="RadToolBar1" runat="server" Width="100%"
                                    OnButtonClick="RadToolBar1_ButtonClick" meta:resourcekey="RadToolBar1Resource1">
                                    <Items>
                                        <telerik:RadToolBarButton runat="server" Value="Query1"
                                            meta:resourcekey="RadToolBarButtonResource1" Owner="">
                                            <ItemTemplate>
                                                <table>
                                                    <tr>
                                                        <td style="padding-left: 2px; padding-right: 1px">
                                                            <asp:Label ID="Label1" runat="server" Text="開始時間" meta:resourcekey="TBLabelResource1"></asp:Label></td>
                                                        <td style="padding-left: 2px; padding-right: 1px">
                                                            <telerik:RadDatePicker ID="rdpStart" runat="server" meta:resourcekey="rdpStartResource1">
                                                                <Calendar UseColumnHeadersAsSelectors="False" UseRowHeadersAsSelectors="False">
                                                                </Calendar>
                                                                <DateInput LabelWidth="64px" ClientEvents-OnValueChanging="OnValueChanging" Width="">
                                                                </DateInput>
                                                                <DatePopupButton CssClass="" HoverImageUrl="" ImageUrl="" />
                                                            </telerik:RadDatePicker>
                                                        </td>
                                                        <td style="padding-left: 2px; padding-right: 1px">~</td>
                                                        <td style="padding-left: 2px; padding-right: 1px">
                                                            <asp:Label ID="Label2" runat="server" Text="結束時間" meta:resourcekey="TBLabelResource2"></asp:Label></td>
                                                        <td style="padding-left: 2px; padding-right: 1px">
                                                            <telerik:RadDatePicker ID="rdpEnd" runat="server" meta:resourcekey="rdpEndResource1">
                                                                <Calendar UseColumnHeadersAsSelectors="False" UseRowHeadersAsSelectors="False">
                                                                </Calendar>
                                                                <DateInput LabelWidth="64px" ClientEvents-OnValueChanging="OnValueChanging" Width="">
                                                                </DateInput>
                                                                <DatePopupButton CssClass="" HoverImageUrl="" ImageUrl="" />
                                                            </telerik:RadDatePicker>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </ItemTemplate>
                                        </telerik:RadToolBarButton>
                                        <telerik:RadToolBarButton runat="server" IsSeparator="True" Value="s1"
                                            meta:resourcekey="RadToolBarButtonResource2" Owner="">
                                        </telerik:RadToolBarButton>
                                        <telerik:RadToolBarButton runat="server" DisabledImageUrl="~/Common/Images/Icon/icon_m39.gif"
                                            HoveredImageUrl="~/Common/Images/Icon/icon_m39.gif"
                                            ImageUrl="~/Common/Images/Icon/icon_m39.gif"
                                            CheckedImageUrl="~/Common/Images/Icon/icon_m39.gif"
                                            Text="查詢" Value="btnQuery" meta:resourcekey="TBarButtonResource1"
                                            Owner="">
                                        </telerik:RadToolBarButton>
                                        <telerik:RadToolBarButton runat="server" IsSeparator="True" Value="s2"
                                            meta:resourcekey="RadToolBarButtonResource3" Owner="">
                                        </telerik:RadToolBarButton>
                                    </Items>
                                </telerik:RadToolBar>
                                <Fast:Grid ID="gridByEmp" runat="server" AutoGenerateCheckBoxColumn="False"
                                    AllowSorting="True" AutoGenerateColumns="False"
                                    DataKeyOnClientWithCheckBox="False" PageSize="15"
                                    OnPageIndexChanging="gridByEmp_PageIndexChanging" OnSorting="gridByEmp_Sorting"
                                     DefaultSortDirection="Ascending"
                                    EmptyDataText="沒有資料" EnhancePager="True" KeepSelectedRows="False"
                                    meta:resourcekey="gridByEmpResource2" 
                                    >
                                    <EnhancePagerSettings FirstAltImageUrl="" FirstImageUrl="" LastAltImage=""
                                        LastImageUrl="" NextIAltImageUrl="" NextImageUrl="" PageInfoCssClass=""
                                        PageNumberCssClass="" PageNumberCurrentCssClass="" PageRedirectCssClass=""
                                        PreviousAltImageUrl="" PreviousImageUrl="" ShowHeaderPager="True" />
                                    <ExportExcelSettings AllowExportToExcel="False" />
                                    <Columns>
                                        <asp:BoundField DataField="NAME" HeaderText="使用者名稱" SortExpression="NAME" meta:resourcekey="BoundFieldResource1">
                                            <ItemStyle HorizontalAlign="Right" Width="200px" />
                                            <HeaderStyle HorizontalAlign="Right" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="LOGIN_TIMES" HeaderText="登入次數" SortExpression="LOGIN_TIMES" meta:resourcekey="BoundFieldResource2">
                                            <ItemStyle HorizontalAlign="Center" Width="100px" />
                                        </asp:BoundField>
                                    </Columns>
                                </Fast:Grid>
                            </td>
                        </tr>
                    </table>
                </telerik:RadPageView>
                <telerik:RadPageView ID="byMemb" runat="server"
                    meta:resourcekey="byMembResource2">
                    <table width="100%">
                        <tr>
                            <td valign="top" align="left" width="80%">
                                <telerik:RadToolBar ID="RadToolBar2" runat="server" Width="100%"
                                    OnButtonClick="RadToolBar2_ButtonClick" meta:resourcekey="RadToolBar2Resource1">
                                    <Items>
                                        <telerik:RadToolBarButton runat="server" Value="Query2"
                                            meta:resourcekey="RadToolBarButtonResource4" Owner="">
                                            <ItemTemplate>
                                                <table>
                                                    <tr>
                                                        <td style="padding-left: 2px; padding-right: 1px">
                                                            <asp:Label ID="Label3" runat="server" Text="開始時間" meta:resourcekey="TBLabelResource3"></asp:Label></td>
                                                        <td style="padding-left: 2px; padding-right: 1px">
                                                            <telerik:RadDatePicker ID="rdpStart2" runat="server" meta:resourcekey="rdpStart2Resource1">
                                                                <Calendar UseColumnHeadersAsSelectors="False" UseRowHeadersAsSelectors="False">
                                                                </Calendar>
                                                                <DateInput LabelWidth="64px" ClientEvents-OnValueChanging="OnValueChanging" Width="">
                                                                </DateInput>
                                                                <DatePopupButton CssClass="" HoverImageUrl="" ImageUrl="" />
                                                            </telerik:RadDatePicker>
                                                        </td>
                                                        <td style="padding-left: 2px; padding-right: 1px">~</td>
                                                        <td style="padding-left: 2px; padding-right: 1px">
                                                            <asp:Label ID="Label4" runat="server" Text="結束時間" meta:resourcekey="TBLabelResource4"></asp:Label></td>
                                                        <td style="padding-left: 2px; padding-right: 1px">
                                                            <telerik:RadDatePicker ID="rdpEnd2" runat="server"
                                                                meta:resourcekey="rdpEnd2Resource1">
                                                                <Calendar UseColumnHeadersAsSelectors="False" UseRowHeadersAsSelectors="False">
                                                                </Calendar>
                                                                <DateInput LabelWidth="64px" ClientEvents-OnValueChanging="OnValueChanging"
                                                                    Width="">
                                                                </DateInput>
                                                                <DatePopupButton CssClass="" HoverImageUrl="" ImageUrl="" />
                                                            </telerik:RadDatePicker>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </ItemTemplate>
                                        </telerik:RadToolBarButton>
                                        <telerik:RadToolBarButton runat="server" IsSeparator="True" Value="s1"
                                            meta:resourcekey="RadToolBarButtonResource5" Owner="">
                                        </telerik:RadToolBarButton>
                                        <telerik:RadToolBarButton runat="server" DisabledImageUrl="~/Common/Images/Icon/icon_m39.gif"
                                            HoveredImageUrl="~/Common/Images/Icon/icon_m39.gif"
                                            ImageUrl="~/Common/Images/Icon/icon_m39.gif"
                                            CheckedImageUrl="~/Common/Images/Icon/icon_m39.gif"
                                            Text="查詢" Value="btnQuery" meta:resourcekey="TBarButtonResource2"
                                            Owner="">
                                        </telerik:RadToolBarButton>
                                        <telerik:RadToolBarButton runat="server" IsSeparator="True" Value="s2"
                                            meta:resourcekey="RadToolBarButtonResource6" Owner="">
                                        </telerik:RadToolBarButton>
                                    </Items>

                                </telerik:RadToolBar>
                                <Fast:Grid ID="gridByMemb" runat="server" AutoGenerateCheckBoxColumn="False"
                                    AllowSorting="True" AutoGenerateColumns="False"
                                    DataKeyOnClientWithCheckBox="False" PageSize="15"
                                    OnPageIndexChanging="gridByMemb_PageIndexChanging"
                                    OnSorting="gridByMemb_Sorting" 
                                    DefaultSortDirection="Ascending" EmptyDataText="沒有資料"
                                    EnhancePager="True" KeepSelectedRows="False"
                                    meta:resourcekey="gridByMembResource2" 
                                    >
                                    <EnhancePagerSettings FirstAltImageUrl="" FirstImageUrl="" LastAltImage=""
                                        LastImageUrl="" NextIAltImageUrl="" NextImageUrl="" PageInfoCssClass=""
                                        PageNumberCssClass="" PageNumberCurrentCssClass="" PageRedirectCssClass=""
                                        PreviousAltImageUrl="" PreviousImageUrl="" ShowHeaderPager="True" />
                                    <ExportExcelSettings AllowExportToExcel="False" />
                                    <Columns>
                                        <asp:BoundField DataField="NAME" HeaderText="使用者名稱" SortExpression="NAME" meta:resourcekey="BoundFieldResource3">
                                            <ItemStyle HorizontalAlign="Left" Width="200px" />
                                            <HeaderStyle HorizontalAlign="Left" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="LOGIN_TIMES" HeaderText="登入次數" SortExpression="LOGIN_TIMES" meta:resourcekey="BoundFieldResource4">
                                            <HeaderStyle Wrap="False" />
                                            <ItemStyle HorizontalAlign="Center" Width="100px" />
                                        </asp:BoundField>
                                    </Columns>
                                </Fast:Grid>
                            </td>
                        </tr>
                    </table>
                </telerik:RadPageView>
            </telerik:RadMultiPage>
        </ContentTemplate>
    </asp:UpdatePanel>
    <asp:Label ID="lblByTime" runat="server" Text="依時間" meta:resourcekey="lblByTimeResource1" Visible="False"></asp:Label>
    <asp:Label ID="lblByEmp" runat="server" Text="依內部員工" meta:resourcekey="lblByEmpResource1" Visible="False"></asp:Label>
    <asp:Label ID="lblByMemb" runat="server" Text="依外部會員" meta:resourcekey="lblByMembResource1" Visible="False"></asp:Label>
    <asp:HiddenField ID="hfCurrentGUID" runat="server" />
</asp:Content>


