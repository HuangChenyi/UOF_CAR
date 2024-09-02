<%@ Page Language="C#" MasterPageFile="~/Master/TwoColumn.master" AutoEventWireup="true" Inherits="WKF_Analysis_AvgTimeOfProcessForm" Title="" Codebehind="AvgTimeOfProcessForm.aspx.cs" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Charting" TagPrefix="telerik" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ScriptContentPlaceHolder" runat="Server">
    <script id="AvgTimeOfProcessFormjs" type="text/javascript">

        //按下 node 事件
        function treeFormList_NodeClicking(sender, eventArgs) {
            var node = eventArgs.get_node();
            // ======= 第一層的不動作 (表單類別) =======
            if (node.get_level() == 0) {
                eventArgs.set_cancel(true);
            }
        }
    </script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ToolbarContentPlaceHolder" runat="Server">



    <telerik:RadToolBar ID="RadToolBar1" runat="server" Width="100%" meta:resourcekey="UltraWebToolbar1Resource1" OnButtonClick="RadToolBar1_ButtonClick">
        <Items>
            <telerik:RadToolBarButton runat="server" Text="Button 2" Value="Time">
                <ItemTemplate>
                    <asp:Label runat="server" Text="開始時間：" meta:resourceKey="TBLabelResource1"></asp:Label>
                    <telerik:RadDatePicker ID="wdcstartDate" runat="server"></telerik:RadDatePicker>
                    <asp:RequiredFieldValidator ID="cvCheckStartTime" runat="server" ErrorMessage="請輸入查詢日期(起)"
                        meta:resourceKey="RequiredFieldValidator1Resource1" Display="Dynamic"
                        ControlToValidate="wdcstartDate"></asp:RequiredFieldValidator>
                    &nbsp;
                                <asp:Label runat="server" Text="結束時間：" meta:resourceKey="TBLabelResource2"></asp:Label>
                    <telerik:RadDatePicker ID="wdcendDate" runat="server"></telerik:RadDatePicker>
                    <asp:RequiredFieldValidator ID="cvCheckEndTime" runat="server" ErrorMessage="請輸入查詢日期(迄)"
                        Display="Dynamic" meta:resourceKey="RequiredFieldValidator2Resource1" ControlToValidate="wdcendDate">
                    </asp:RequiredFieldValidator>
                    <asp:CompareValidator ID="CompareValidator" runat="server" ErrorMessage="結束時間需晚於開始時間"
                        OnServerValidate="CustomValidator1_ServerValidate" Display="Dynamic" ControlToCompare="wdcstartDate" ControlToValidate="wdcendDate" Operator="GreaterThan"></asp:CompareValidator>
                </ItemTemplate>

            </telerik:RadToolBarButton>
            <telerik:RadToolBarButton runat="server" IsSeparator="True" Text="Button 4" Image="~/App_Themes/DefaultTheme/images/toolbarSp.jpg">
            </telerik:RadToolBarButton>

            <telerik:RadToolBarButton runat="server" Text="Button 5" Value="linebase">
                <ItemTemplate>
                    <asp:Label runat="server" Text="格線基準：" meta:resourceKey="TBLabelResource3"></asp:Label>
                    <asp:DropDownList runat="server" ID="ddllinebase" meta:resourceKey="ddllinebaseResource1">
                        <asp:ListItem Text="5小時" Selected="True" Value="5" meta:resourceKey="ListItemResource1"></asp:ListItem>
                        <asp:ListItem Text="10小時" Value="10" meta:resourceKey="ListItemResource2"></asp:ListItem>
                        <asp:ListItem Text="15小時" Value="15" meta:resourceKey="ListItemResource3"></asp:ListItem>
                    </asp:DropDownList>
                </ItemTemplate>
            </telerik:RadToolBarButton>

            <telerik:RadToolBarButton runat="server" IsSeparator="True" Text="Button 6" Image="~/App_Themes/DefaultTheme/images/toolbarSp.jpg">
            </telerik:RadToolBarButton>
            <telerik:RadToolBarButton runat="server" Text="查詢" meta:resourceKey="TBarButtonResource20"
                ImageUrl="~/Common/Images/Icon/icon_m39.gif"
                HoveredImageUrl="~/Common/Images/Icon/icon_m39.gif"
                DisabledImageUrl="~/Common/Images/Icon/icon_m39.gif"
                CheckedImageUrl="~/Common/Images/Icon/icon_m39.gif"
                Value="btnQuery">
            </telerik:RadToolBarButton>

            <telerik:RadToolBarButton runat="server" IsSeparator="True" Text="Button 8" Image="~/App_Themes/DefaultTheme/images/toolbarSp.jpg">
            </telerik:RadToolBarButton>
        </Items>

    </telerik:RadToolBar>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="LeftContentPlaceHolder" runat="Server">
    <asp:Label ID="lblLeftTitle" runat="server" Text="分類列表" Visible="False" meta:resourcekey="lblLeftTitleResource1"></asp:Label>
    <telerik:RadTreeView ID="treeFormList" runat="server" EnableNodeTextHtmlEncoding="true" OnNodeClick="treeFormList_NodeClick" OnClientNodeClicking="treeFormList_NodeClicking"></telerik:RadTreeView>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="RightContentPlaceHolder" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server" RenderMode="Inline" UpdateMode="Conditional">
        <ContentTemplate>
            <asp:Label ID="lblNoData" runat="server" meta:resourcekey="lblNoDataResource1" Text="沒有資料" Visible="false" __designer:wfdid="w81"></asp:Label>
            <telerik:RadChart ID="RadChart1" runat="server" Height="500px" OnItemDataBound="RadChart1_ItemDataBound" AutoLayout="True">
                <Series>
                    <telerik:ChartSeries DataYColumn="HOUR" Name="Series 1" ActiveRegionToolTip="ACTUAL_SIGNER:#Y" />
                </Series>
                <Legend Visible="False">
                    <Appearance Visible="False">
                    </Appearance>
                </Legend>
                <PlotArea>
                    <XAxis AutoScale="False" DataLabelsColumn="ACTUAL_SIGNER" MaxValue="7" MinValue="1" Step="1" VisibleValues="All">
                        <Appearance MajorTick-Visible="False">
                            <LabelAppearance RotationAngle="90"></LabelAppearance>
                            <MajorGridLines Visible="False" />
                        </Appearance>
                    </XAxis>
                    <YAxis VisibleValues="Positive" AutoScale="False" MinValue="0" Step="5">
                        <%--<YAxis VisibleValues="Positive" AutoScale="True">--%>
                        <Appearance MinorTick-Visible="False" MajorTick-Visible="False">
                            <MinorGridLines Visible="False" />
                        </Appearance>
                    </YAxis>
                </PlotArea>

                <ChartTitle Visible="False">
                    <Appearance Visible="False" />
                </ChartTitle>

            </telerik:RadChart>


            <asp:Label ID="lblMaxValue" runat="server" Text="30" Visible="False"></asp:Label>
            <asp:Label ID="lblYAxisFormat" runat="server" Text="小時" Visible="false" meta:resourceKey="lblYAxisFormatResource1"></asp:Label>

        </ContentTemplate>        
    </asp:UpdatePanel>
</asp:Content>
