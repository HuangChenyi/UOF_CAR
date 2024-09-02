<%@ Control Language="C#" AutoEventWireup="true" Inherits="WKF_Admin_FilingClassQuery" Codebehind="FilingClassQuery.ascx.cs" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register Assembly="System.Web, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a" Namespace="System.Web.UI.HtmlControls" TagPrefix="cc2" %>
<%@ Register Assembly="System.Web, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a" Namespace="System.Web.UI" TagPrefix="cc1" %>
<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<script type="text/javascript">

function workRadsplitter2_clientLoaded(sender, args) {
    var radsplitter = $find("<%=workRadsplitter2.ClientID%>");
    var leftPane = $find("<%=leftPane.ClientID%>");
    var workRadpane = $find("<%=workRadpane2.ClientID%>");

    var width = radsplitter.get_width();
    if (leftPane == null) {
        radsplitter.set_width(1);
        radsplitter.set_width(width);

    }
    else {
        if (workRadpane.get_width() == width)
            workRadpane.set_width(width - leftPane.get_width() - 6);
    }

}
</script>
<style type="text/css">
    /*解決網址無法折行造成過長問題*/
    .GridItemAlternating > td {
        word-break: break-all;
    }

    .GridItem > td {
        word-break: break-all;
    }
    .breakword {
        word-break: break-all;
    }

    body {
        overflow: hidden;
    }
</style>

<telerik:RadSplitter ID="workRadsplitter1" runat="server" Orientation="Horizontal"
    PanesBorderSize="0" Height="100%"
    BorderSize="0" LiveResize="True" ResizeWithParentPane="True" meta:resourcekey="workRadsplitter1Resource1"
    ResizeWithBrowserWindow="True">

    <telerik:RadPane ID="workToolbarPane" runat="server" Height="35px" Scrolling="None" Locked="True" meta:resourcekey="workToolbarPaneResource1">
        <asp:UpdatePanel ID="UpdatePanel3" runat="server" UpdateMode="Conditional">
            <ContentTemplate>
                <telerik:RadToolBar ID="RadToolBar1" Runat="server" meta:resourcekey="UltraWebToolbar1Resource1" OnButtonClick="RadToolBar1_ButtonClick" Width="100%">
                    <Items>
                        <telerik:RadToolBarButton runat="server" Value="StartDate" meta:resourcekey="RadToolBarButtonResource1">
                            <ItemTemplate>
                                <table>
                                    <tr>
                                        <td>
                                            <asp:Label runat="server" meta:resourcekey="TBLabelResource1" Text="開始時間：" ToolTip="開始時間"></asp:Label>
                                        </td>
                                        <td>
                                            <telerik:RadDatePicker ID="rdpStartDate" Runat="server" meta:resourcekey="rdpStartDateResource1">
                                            </telerik:RadDatePicker>
                                        </td>
                                    </tr>
                                </table>
                            </ItemTemplate>
                        </telerik:RadToolBarButton>
                        <telerik:RadToolBarButton runat="server" Value="EndDate" meta:resourcekey="RadToolBarButtonResource2">
                            <ItemTemplate>
                                <table>
                                    <tr>
                                        <td>
                                            <asp:Label runat="server" meta:resourcekey="TBLabelResource2" Text="結束時間：" ToolTip="結束時間"></asp:Label>
                                        </td>
                                        <td>
                                            <telerik:RadDatePicker ID="rdpEndDate" Runat="server" meta:resourcekey="rdpEndDateResource1">
                                            </telerik:RadDatePicker>
                                        </td>
                                    </tr>
                                </table>
                            </ItemTemplate>
                        </telerik:RadToolBarButton>
                        <telerik:RadToolBarButton runat="server" Value="FormStatus" meta:resourcekey="RadToolBarButtonResource3">
                            <ItemTemplate>
                                <asp:DropDownList ID="ddlStatus" runat="server" meta:resourcekey="ddlStatusResource1">
                                    <asp:ListItem meta:resourcekey="ListItemResource1" Value="0"></asp:ListItem>
                                    <asp:ListItem meta:resourcekey="ListItemResource2" Value="1"></asp:ListItem>
                                    <asp:ListItem meta:resourcekey="ListItemResource3" Value="2"></asp:ListItem>
                                </asp:DropDownList>
                            </ItemTemplate>
                        </telerik:RadToolBarButton>
                        <telerik:RadToolBarButton runat="server" CheckedImageUrl="~/Common/Images/Icon/icon_m39.gif" DisabledImageUrl="~/Common/Images/Icon/icon_m39.gif" HoveredImageUrl="~/Common/Images/Icon/icon_m39.gif" ImageUrl="~/Common/Images/Icon/icon_m39.gif" meta:resourcekey="TBarButtonResource2" Text="查詢" ToolTip="查詢" Value="btnQuery">
                        </telerik:RadToolBarButton>
                        <telerik:RadToolBarButton runat="server" IsSeparator="True" meta:resourcekey="RadToolBarButtonResource4">
                        </telerik:RadToolBarButton>
                        <telerik:RadToolBarButton runat="server" CheckedImageUrl="~/Common/Images/Icon/icon_m132.gif" DisabledImageUrl="~/Common/Images/Icon/icon_m132.gif" HoveredImageUrl="~/Common/Images/Icon/icon_m132.gif" ImageUrl="~/Common/Images/Icon/icon_m132.gif" meta:resourcekey="TBarButtonResource3" Text="標示為已處理" ToolTip="標示為已處理" Value="DoneSet">
                        </telerik:RadToolBarButton>
                        <telerik:RadToolBarButton runat="server" IsSeparator="True" meta:resourcekey="RadToolBarButtonResource5">
                        </telerik:RadToolBarButton>
                        <telerik:RadToolBarButton runat="server" CheckedImageUrl="~/Common/Images/Icon/icon_m133.gif" DisabledImageUrl="~/Common/Images/Icon/icon_m133.gif" Enabled="False" HoveredImageUrl="~/Common/Images/Icon/icon_m133.gif" ImageUrl="~/Common/Images/Icon/icon_m133.gif" meta:resourcekey="TBarButtonResource4" Text="標示為未處理" ToolTip="標示為未處理" Value="UntreatedSet">
                        </telerik:RadToolBarButton>
                        <telerik:RadToolBarButton runat="server" IsSeparator="True" meta:resourcekey="RadToolBarButtonResource6">
                        </telerik:RadToolBarButton>
                    </Items>
                </telerik:RadToolBar>
            </ContentTemplate>
        </asp:UpdatePanel>
    </telerik:RadPane>
    <telerik:RadPane ID="workRadpane12" runat="server" Scrolling="None" Index="1" meta:resourcekey="workRadpane12Resource1">
        <asp:UpdatePanel ID="UpdatePanel4" runat="server" UpdateMode="Conditional">
            <ContentTemplate>
                <telerik:RadSplitter ID="workRadsplitter2" runat="server" Height="100%" LiveResize="True" OnClientLoaded="workRadsplitter2_clientLoaded" meta:resourcekey="workRadsplitter2Resource1">
                    <telerik:RadPane ID="leftPane" runat="server" Width="15%" Height="100%" meta:resourcekey="leftPaneResource1">
                        <div class="LeftPaneBackground">
                            <telerik:RadSplitter ID="Radsplitter3" runat="server" Width="100%" Height="100%" Orientation="Horizontal"
                                BorderSize="0" PanesBorderSize="0" LiveResize="True" meta:resourcekey="Radsplitter3Resource1">
                                <telerik:RadPane ID="leftDownPane" runat="server" meta:resourcekey="leftDownPaneResource1">

                                    <telerik:RadTreeView ID="treeFormList" Runat="server" OnNodeClick="treeFormList_NodeClick" meta:resourcekey="treeFormListResource2">
                                    </telerik:RadTreeView>

                                </telerik:RadPane>
                            </telerik:RadSplitter>
                        </div>
                    </telerik:RadPane>
                    <telerik:RadSplitBar ID="RadSplitbar1" runat="server" CollapseMode="Forward" meta:resourcekey="RadSplitbar1Resource1">
                    </telerik:RadSplitBar>
                    <telerik:RadPane ID="workRadpane2" runat="server" meta:resourcekey="workRadpane2Resource1">
                        <table cellspacing="1" class="PopTable" width="100%">
                            <tr>
                                <td align="center" class="PopTableHeader" style="height: 21px; width: 100%">
                                    <center>
                                        <asp:Label ID="lblFormList" runat="server" meta:resourcekey="lblFormListResource1" Text="表單列表"></asp:Label>
                                    </center>
                                </td>
                            </tr>
                        </table>
                        <asp:UpdatePanel ID="UpdatePanel2" runat="server" RenderMode="Inline" UpdateMode="Conditional">
                            <contenttemplate>
                                <Fast:Grid ID="DGFormList" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateCheckBoxColumn="True" AutoGenerateColumns="False" DataKeyNames="TASK_ID" DataKeyOnClientWithCheckBox="False" DefaultSortDirection="Ascending" EmptyDataText="No data found" EnableModelValidation="True" EnhancePager="True" KeepSelectedRows="False" OnPageIndexChanging="DGFormList_PageIndexChanging" OnRowDataBound="DGFormList_RowDataBound" OnSorting="DGFormList_Sorting" PageSize="15" Width="100%" meta:resourcekey="DGFormListResource2">
                                    <enhancepagersettings firstaltimageurl="" firstimageurl="" lastaltimage="" lastimageurl="" nextialtimageurl="" nextimageurl="" pageinfocssclass="" pagenumbercssclass="" pagenumbercurrentcssclass="" pageredirectcssclass="" previousaltimageurl="" previousimageurl="" showheaderpager="True" />
                                    <Columns>
                                        <asp:TemplateField meta:resourceKey="TemplateFieldResource4">
                                            <ItemTemplate>
                                                <asp:Image ID="Image1" runat="server" meta:resourceKey="Image1Resource1" />
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Left" Width="20px" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="表單編號" meta:resourceKey="BoundFieldResource1"  SortExpression="DOC_NBR">
                                            <ItemTemplate>
                                                <asp:LinkButton id="lbtnDocNumber" runat="server"></asp:LinkButton>
                                            </ItemTemplate>
                                            <HeaderStyle Wrap="false" />
                                            <ItemStyle HorizontalAlign="Left" Width="120px" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="表單名稱" meta:resourceKey="TemplateFieldResource5">
                                            <ItemTemplate>
                                                <asp:Label ID="lblFormname" runat="server" meta:resourceKey="lblFormnameResource1"></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Left" Width="180px" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="標題" meta:resourceKey="TemplateFieldResource6">
                                            <ItemTemplate>
                                                <asp:Label ID="lblTitle" runat="server" meta:resourceKey="lblTitleResource1"></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Left" Width="200px" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="申請人" meta:resourceKey="TemplateFieldResource1">
                                            <ItemTemplate>
                                                <asp:Label ID="lblUser" runat="server" meta:resourceKey="lblUserResource1"></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Left" Width="220px" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="結果" meta:resourceKey="TemplateFieldResource2">
                                            <ItemTemplate>
                                                <asp:Label ID="lblResult" runat="server" meta:resourceKey="lblResultResource1"></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" Wrap="False" Width="50px" />
                                        </asp:TemplateField>
                                        <asp:TemplateField  HeaderText="申請日期" meta:resourceKey="BoundFieldResource3" SortExpression="BEGIN_TIME">
                                            <ItemTemplate>
                                                <asp:Label ID="lblBeginTime" runat="server"></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" Wrap="False" Width="110px" />
                                        </asp:TemplateField>
                                        <asp:TemplateField  HeaderText="結案日期" meta:resourceKey="BoundFieldResource4" SortExpression="END_TIME">
                                            <ItemTemplate>
                                                <asp:Label ID="lblEndTime" runat="server"  ></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" Wrap="False" Width="110px" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="操作" meta:resourceKey="TemplateFieldResource3">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="lbtnPrint" runat="server" meta:resourceKey="lbtnPrintResource1" Text="列印"></asp:LinkButton>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" Wrap="False" Width="30px" />
                                        </asp:TemplateField>
                                    </Columns>
                                    <PagerStyle HorizontalAlign="Left" />
                                </Fast:Grid>
                                <div style="width:100%;text-align:center;">
                                    <asp:CustomValidator ID="cvCheckStartTime" runat="server" Display="Dynamic" ErrorMessage="請輸入查詢日期(起)" ForeColor="Red" meta:resourceKey="RequiredFieldValidator1Resource1" OnServerValidate="CheckStartTime"></asp:CustomValidator>
                                    <asp:CustomValidator ID="cvCheckEndTime" runat="server" Display="Dynamic" ErrorMessage="請輸入查詢日期(迄)" ForeColor="Red" meta:resourceKey="RequiredFieldValidator2Resource1" OnServerValidate="CheckEndTime"></asp:CustomValidator>
                                    <asp:CustomValidator ID="CustomValidator1" runat="server" Display="Dynamic" ErrorMessage="結束時間需晚於開始時間" ForeColor="Red" meta:resourceKey="CustomValidator1Resource1" OnServerValidate="CustomValidator1_ServerValidate"></asp:CustomValidator>
                                </div>
                            </contenttemplate>
                            <triggers>
                                <asp:AsyncPostBackTrigger ControlID="treeFormList" EventName="NodeClick" />
                                <asp:AsyncPostBackTrigger ControlID="RadToolBar1" EventName="ButtonClick" />
                            </triggers>
                        </asp:UpdatePanel>
                    </telerik:RadPane>
                </telerik:RadSplitter>
            </ContentTemplate>
        </asp:UpdatePanel>
    </telerik:RadPane>
</telerik:RadSplitter>

<asp:Label ID="lblPass" runat="server" Text="通過" Visible="False" meta:resourcekey="lblPassResource1"></asp:Label>
<asp:Label ID="lblReject" runat="server" Text="否決" Visible="False" meta:resourcekey="lblRejectResource1"></asp:Label>
<asp:Label ID="lblDone" runat="server" Text="已處理" Visible="False" meta:resourcekey="lblDoneResource1"></asp:Label>
<asp:Label ID="lblInvalid" runat="server" Text="作廢" Visible="False" meta:resourcekey="lblInvalidResource1"></asp:Label>
<asp:Label ID="lblUntreated" runat="server" Text="未處理" Visible="False" meta:resourcekey="lblUntreatedResource1"></asp:Label>
<asp:Label ID="lblThreeDays" runat="server" Text="三天內" Visible="False" meta:resourcekey="lblThreeDaysResource1"></asp:Label>
<asp:Label ID="lblOneWeek" runat="server" Text="一週內" Visible="False" meta:resourcekey="lblOneWeekResource1"></asp:Label>
<asp:Label ID="lblOneMonth" runat="server" Text="一個月內" Visible="False" meta:resourcekey="lblOneMonthResource1"></asp:Label>


<asp:Label ID="lblClassQuery" runat="server" Text="分類查詢" Visible="False" meta:resourcekey="lblClassQueryResource1"></asp:Label>
<asp:Label ID="lblCondQuery" runat="server" Text="條件查詢" Visible="False" meta:resourcekey="lblCondQueryResource1"></asp:Label>
<asp:Label ID="lblFormExport" runat="server" Text="表單匯出" Visible="False" meta:resourcekey="lblFormExportResource1"></asp:Label>
<asp:Label ID="lblDownload" runat="server" Text="下載匯出報表" Visible="False" meta:resourcekey="lblDownloadResource1"></asp:Label>