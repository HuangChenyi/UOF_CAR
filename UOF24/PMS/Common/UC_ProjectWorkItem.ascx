<%@ Control Language="C#" AutoEventWireup="true" Inherits="PMS_Common_UC_ProjectWorkItem" Codebehind="UC_ProjectWorkItem.ascx.cs" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register Src="../../Common/ChoiceCenter/UC_ChoiceList.ascx" TagName="UC_ChoiceList" TagPrefix="uc1" %>
<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>


<script type="text/javascript" id="telerikClientEvents1">
    //<![CDATA[

    function utbarControl_ButtonClicking(sender, args) {
        var projGUID = $('#<% = hidProjGUID.ClientID %>').val();
        var projStatus = $('#<% = hidProjStatus.ClientID %>').val();
        var value = args.get_item().get_value();
        switch (value) {
            case "btnCreateSeries":
                var GUID = $('#<% = hidGUID.ClientID %>').val();
                if (GUID == "") {
                    var Add = 'Add';
                    args.set_cancel(true);
                    $uof.dialog.open2("~/PMS/Maintain/SeriesDetail.aspx", args.get_item(), "", 600, 600, openDialogResult, {"Mode":Add, "PROJECT_GUID":projGUID,"ProjStatus":projStatus});
                }
                else {
                    var Add = 'CreateChild';
                    args.set_cancel(true);
                    $uof.dialog.open2("~/PMS/Maintain/SeriesDetail.aspx", args.get_item(), "", 600, 600, openDialogResult, { "Mode": Add, "PROJECT_GUID": projGUID, "GUID": GUID, "ProjStatus": projStatus });
                }
                break;
            case "btnCreateTask":
                var GUID = $('#<% = hidGUID.ClientID %>').val();
                if (GUID == "") {
                    var Add = 'Add';
                    args.set_cancel(true);
                    $uof.dialog.open2("~/PMS/Maintain/TaskDetail.aspx", args.get_item(), "", 600, 600, openDialogResult, { "Mode": Add, "PROJECT_GUID": projGUID, "ProjStatus": projStatus });
                }
                else {
                    var Add = 'CreateChild';
                    args.set_cancel(true);
                    $uof.dialog.open2("~/PMS/Maintain/TaskDetail.aspx", args.get_item(), "", 600, 600, openDialogResult, { "Mode": Add, "PROJECT_GUID": projGUID, "GUID": GUID, "ProjStatus": projStatus });
                }
                break;
            case "btnMove":
                var Move = 'Move';
                args.set_cancel(true);
                $uof.dialog.open2("~/PMS/Maintain/Move.aspx", args.get_item(), "", 500, 600, openDialogResult, { "Mode": Move, "PROJECT_GUID": projGUID });
                break;
            case "btnRemind":
                var checkedRowKeys = $uof.fastGrid.getChecked('<%=grd.ClientID %>');

                if (checkedRowKeys == "") {
                    alert('<%=lblWorkSetListGUIDEmptyMsg.Text %>');
                    args.set_cancel(true);

                }
                else {
                    args.set_cancel(false);
                }

                break;
            case "btnDelete":
                args.set_cancel(!confirm('<%=lblDeleteMsg.Text %>'));
                break;
        }

    }
    function openDialogResult(returnValue) {
        if (typeof (returnValue) == "undefined") {
            return false;
        }
        return true;
    }
    //]]>
</script>

<table width="100%">
    <tr>
        <td style="line-height: 1.5em">
            <telerik:RadToolBar ID="utbarControl" runat="server" Width="100%" OnButtonClick="utbarControl_ButtonClick" OnClientButtonClicking="utbarControl_ButtonClicking" meta:resourcekey="utbarControlResource2" SingleClick="None">
                <Items>
                    <telerik:RadToolBarButton runat="server" Text="新增階段" Value="btnCreateSeries"
                        ClickedImageUrl="~/Common/Images/Icon/icon_m44.gif" DisabledImageUrl="~/Common/Images/Icon/icon_m44.gif"
                        HoveredImageUrl="~/Common/Images/Icon/icon_m44.gif" ImageUrl="~/Common/Images/Icon/icon_m44.gif" meta:resourcekey="RadToolBarButtonResource1">
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton runat="server" IsSeparator="true" Value="sep1" meta:resourcekey="RadToolBarButtonResource2">
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton runat="server" Text="新增任務" Value="btnCreateTask"
                        ClickedImageUrl="~/Common/Images/Icon/icon_m148.gif" DisabledImageUrl="~/Common/Images/Icon/icon_m148.gif"
                        HoveredImageUrl="~/Common/Images/Icon/icon_m148.gif" ImageUrl="~/Common/Images/Icon/icon_m148.gif" meta:resourcekey="RadToolBarButtonResource3">
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton runat="server" IsSeparator="true" Value="sep2" meta:resourcekey="RadToolBarButtonResource4">
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton runat="server" Text="刪除階段/任務" Value="btnDelete"
                        ClickedImageUrl="~/Common/Images/Icon/icon_m03.gif" DisabledImageUrl="~/Common/Images/Icon/icon_m03.gif"
                        HoveredImageUrl="~/Common/Images/Icon/icon_m03.gif" ImageUrl="~/Common/Images/Icon/icon_m03.gif" meta:resourcekey="RadToolBarButtonResource5">
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton runat="server" IsSeparator="true" Value="sep3" meta:resourcekey="RadToolBarButtonResource6">
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton runat="server" Text="搬移階段/任務" Value="btnMove"
                        ClickedImageUrl="~/Common/Images/Icon/icon_m26.gif" DisabledImageUrl="~/Common/Images/Icon/icon_m26.gif"
                        HoveredImageUrl="~/Common/Images/Icon/icon_m26.gif" ImageUrl="~/Common/Images/Icon/icon_m26.gif" meta:resourcekey="RadToolBarButtonResource7">
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton runat="server" IsSeparator="true" Value="sep4" meta:resourcekey="RadToolBarButtonResource8">
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton runat="server" Text="提醒" Value="btnRemind"
                        ClickedImageUrl="~/Common/Images/Icon/icon_m60.gif" DisabledImageUrl="~/Common/Images/Icon/icon_m60.gif"
                        HoveredImageUrl="~/Common/Images/Icon/icon_m60.gif" ImageUrl="~/Common/Images/Icon/icon_m60.gif" meta:resourcekey="RadToolBarButtonResource9">
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton runat="server" IsSeparator="true" Value="sep5" meta:resourcekey="RadToolBarButtonResource10">
                    </telerik:RadToolBarButton>
                </Items>
            </telerik:RadToolBar>
            <Fast:Grid ID="grd" runat="server" DataKeyNames="GUID,TYPE" AllowSorting="True" AutoGenerateCheckBoxColumn="True" AutoGenerateColumns="False" DataKeyOnClientWithCheckBox="False" HeaderStyle-Wrap="false"
                OnRowDataBound="grd_RowDataBound" EnhancePager="True" PageSize="15" Width="100%"  DefaultSortDirection="Ascending" EmptyDataText="沒有資料" KeepSelectedRows="False" meta:resourcekey="grdResource2"  >

                <ExportExcelSettings AllowExportToExcel="False"></ExportExcelSettings>
                <Columns>
                    <asp:BoundField HeaderText="GUID" DataField="GUID" Visible="False" meta:resourcekey="BoundFieldResource1" />
                    <asp:TemplateField meta:resourcekey="TemplateFieldResource1">
                        <ItemTemplate>
                            <asp:Image runat="server" ImageUrl="~/Common/Images/Icon/icon_m173.gif" Height="16px" Width="16px" ID="imgCompleted" meta:resourcekey="imgCompletedResource1"></asp:Image>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="名稱" meta:resourcekey="TemplateFieldResource2">
                        <ItemTemplate>
                            <asp:Image runat="server" Height="16px" Width="16px" ID="imgType" meta:resourcekey="imgTypeResource1"></asp:Image>
                            <asp:LinkButton runat="server" Text='<%# Bind("NAME") %>' ID="lbtName" meta:resourcekey="lbtNameResource1" OnClick="lbtName_Click"></asp:LinkButton>
                            <asp:Image runat="server" AlternateText="手動送審" ImageUrl="~/Common/Images/Icon/icon_m167.gif" ID="imgHand" meta:resourcekey="imgHandResource1"></asp:Image>
                        </ItemTemplate>
                        <HeaderStyle Wrap="false" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="狀態" meta:resourcekey="TemplateFieldResource3">
                        <ItemTemplate>
                            <asp:Label runat="server" ID="lblStatus" meta:resourcekey="lblStatusResource1"></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle Wrap="false" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="進度" meta:resourcekey="TemplateFieldResource4">
                        <ItemTemplate>
                            <asp:Label runat="server" Text='<%# Bind("PROGRESS") %>' ID="lblProgress" meta:resourcekey="lblProgressResource1"></asp:Label>
                            <asp:Label runat="server" Text="%" ID="lblPercent" meta:resourcekey="lblPercentResource1"></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle Wrap="false" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="預計時程" meta:resourcekey="TemplateFieldResource5">
                        <ItemTemplate>
                            <asp:Label runat="server" ID="lblExpectedStartDate" meta:resourcekey="lblExpectedStartDateResource1"></asp:Label>
                            <asp:Label runat="server" Text="~" ID="lblExpected" meta:resourcekey="lblExpectedResource1"></asp:Label>
                            <asp:Label runat="server" ID="lblExpectedEndDate" meta:resourcekey="lblExpectedEndDateResource1"></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle Wrap="false" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="實際時程" meta:resourcekey="TemplateFieldResource6">
                        <ItemTemplate>
                            <asp:Label runat="server" ID="lblPracticalStartlDate" meta:resourcekey="lblPracticalStartlDateResource1"></asp:Label>
                            <asp:Label runat="server" Text="~" ID="lblPractical" meta:resourcekey="lblPracticalResource1"></asp:Label>
                            <asp:Label runat="server" ID="lblPracticalEndDate" meta:resourcekey="lblPracticalEndDateResource1"></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle Wrap="false" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="負責人" meta:resourcekey="TemplateFieldResource7">
                        <ItemTemplate>
                            <asp:Label runat="server" ID="lblDirectorNames" meta:resourcekey="lblDirectorNamesResource1"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="預估成本" meta:resourcekey="lblBCWSResource1">
                        <ItemTemplate>
                            <asp:Label runat="server" ID="lblBCWS" Text='<%# Bind("BCWS") %>'  ></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle Wrap="false" />
                        <ItemStyle HorizontalAlign="Right" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="實際成本" meta:resourcekey="lblBCWPResource1">
                        <ItemTemplate>
                            <asp:Label runat="server" ID="lblBCWP" Text='<%# Bind("BCWP") %>' ></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle Wrap="false" />
                        <ItemStyle HorizontalAlign="Right" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="已執行成本" meta:resourcekey="lblACWPResource1">
                        <ItemTemplate>
                            <asp:Label runat="server" ID="lblACWP" Text='<%# Bind("ACWP") %>' ></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle Wrap="false" />
                        <ItemStyle HorizontalAlign="Right" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="操作" meta:resourcekey="TemplateFieldResource8">
                        <ItemTemplate>
                            <asp:ImageButton runat="server" AlternateText="新增子階段" ImageUrl="~/Common/Images/Icon/icon_m163.gif" ID="btnCreateSeries" meta:resourcekey="btnCreateSeriesResource1" OnClick="btnRefreshGrid_Click"></asp:ImageButton>
                            <asp:ImageButton runat="server" AlternateText="新增子任務" ImageUrl="~/Common/Images/Icon/icon_m164.gif" ID="btnCreateTask" meta:resourcekey="btnCreateTaskResource1" OnClick="btnRefreshGrid_Click"></asp:ImageButton>
                            <asp:ImageButton runat="server" AlternateText="搬移子階段/任務" ImageUrl="~/Common/Images/Icon/icon_m26.gif" ID="btnMove" meta:resourcekey="btnMoveResource1" OnClick="btnRefreshGrid_Click"></asp:ImageButton>
                        </ItemTemplate>
                        <HeaderStyle Wrap="false" />
                    </asp:TemplateField>
                    <asp:BoundField DataField="TYPE" HeaderText="TYPE" Visible="False" meta:resourcekey="BoundFieldResource2" />
                </Columns>
                <EnhancePagerSettings ShowHeaderPager="True" />
            </Fast:Grid>
        </td>
    </tr>
</table>
<table>
    <tr>
        <td style="width: 19px; padding: 3px; vertical-align: middle; text-align: center;">
            <asp:Image ID="Image2" runat="server" Height="16px" Width="16px" ImageUrl="~/Common/Images/Icon/icon_m88.gif" meta:resourcekey="Image2Resource1"></asp:Image></td>
        <td style="padding: 2px; vertical-align: middle; text-align: center;">
            <asp:Label ID="Label5" runat="server" Text="階段" meta:resourcekey="Label5Resource1"></asp:Label></td>
        <td style="width: 19px; padding: 3px; vertical-align: middle; text-align: center;">
            <asp:Image ID="Image3" runat="server" Height="16px" Width="16px" ImageUrl="~/Common/Images/Icon/icon_m147.gif" meta:resourcekey="Image3Resource1"></asp:Image></td>
        <td style="padding: 2px; vertical-align: middle; text-align: center;">
            <asp:Label ID="Label3" runat="server" Text="任務" meta:resourcekey="Label3Resource1"></asp:Label></td>
    </tr>
</table>
<asp:HiddenField ID="hidReadOnly" runat="server" value="False"/>
<asp:HiddenField ID="hidProjGUID" runat="server" />
<asp:HiddenField ID="hidProjStatus" runat="server" />
<asp:HiddenField ID="hidGUID" runat="server" />
<asp:HiddenField ID="hidListSeriesGUID" runat="server" />
<asp:HiddenField ID="hidListTaskGUID" runat="server" />
<asp:Label ID="lblDeleteMsg" runat="server" Text="確定刪除？" Visible="False" meta:resourcekey="lblDeleteMsgResource1"></asp:Label>
<asp:Label ID="lblLaterMsg1" runat="server" Text="(逾時" Visible="False" meta:resourcekey="lblLaterMsg1Resource1"></asp:Label>
<asp:Label ID="lblLaterMsg2" runat="server" Text="天)" Visible="False" meta:resourcekey="lblLaterMsg2Resource1"></asp:Label>
<asp:Label ID="lblAuditMsg" runat="server" Text="審核中" Visible="False" meta:resourcekey="lblAuditMsgResource1"></asp:Label>
<asp:Label ID="lblCompletedMsg" runat="server" Text="已完成" Visible="False" meta:resourcekey="lblCompletedMsgResource1"></asp:Label>
<asp:Label ID="lblNotYetBeginMsg" runat="server" Text="尚未開始" Visible="False" meta:resourcekey="lblNotYetBeginMsgResource1"></asp:Label>
<asp:Label ID="lblProceedingMsg" runat="server" Text="進行中" Visible="False" meta:resourcekey="lblProceedingMsgResource1"></asp:Label>

<asp:CustomValidator ID="CustomValidator1" runat="server" ValidationGroup="Maintain" Display="None" Visible="False" meta:resourcekey="CustomValidator1Resource1"></asp:CustomValidator>
<asp:Label ID="lblNoAuthorityMsg" runat="server" Text="您沒有此操作權限。" Visible="False" meta:resourcekey="lblNoAuthorityMsgResource1"></asp:Label>
<asp:Label ID="lblWorkSetDeleteEmptyMsg" runat="server" Text="尚未選擇要刪除的階段或任務" Visible="False" meta:resourcekey="lblWorkSetDeleteEmptyMsgResource1"></asp:Label>
<asp:Label ID="lblWorkSetDeleteNoAuthorityMsg" runat="server" Text="您沒有刪除該階段或任務的權限！" Visible="False" meta:resourcekey="lblWorkSetDeleteNoAuthorityMsgResource1"></asp:Label>
<asp:Label ID="lblWorkSetDeleteNotAllowedStatusMsg" runat="server" Text="只有「尚未開始」狀態的階段或任務可以被刪除！" Visible="False" meta:resourcekey="lblWorkSetDeleteNotAllowedStatusMsgResource1"></asp:Label>
<asp:Label ID="lblProjectDeleteNotAllowedStatusMsg" runat="server" Text="{0}狀態的專案不能刪除其階段或任務！" Visible="False" meta:resourcekey="lblProjectDeleteNotAllowedStatusMsgResource1"></asp:Label>
<asp:Label ID="lblProjectNotSetMsg" runat="server" Text="該任務所屬專案不存在或已被刪除。" Visible="False" meta:resourcekey="lblProjectNotSetMsgResource1"></asp:Label>
<asp:Label ID="lblDataSetNoRowsMsg" runat="server" Text="所選擇的階段或任務不存在或已被刪除。" Visible="False" meta:resourcekey="lblDataSetNoRowsMsgResource1"></asp:Label>
<asp:Label ID="lblWorkSetListGUIDEmptyMsg" runat="server" Text="尚未選擇要提醒的階段或任務" Visible="False" meta:resourcekey="lblWorkSetListGUIDEmptyMsgResource1"></asp:Label>

<asp:Label ID="lblNotYetBeginStatus" runat="server" Text="尚未開始" Visible="False" meta:resourcekey="lblNotYetBeginStatusResource1"></asp:Label>
<asp:Label ID="lblProceedingStatus" runat="server" Text="進行中" Visible="False" meta:resourcekey="lblProceedingStatusResource1"></asp:Label>
<asp:Label ID="lblAuditStatus" runat="server" Text="審核中" Visible="False" meta:resourcekey="lblAuditStatusResource1"></asp:Label>
<asp:Label ID="lblSuspendStatus" runat="server" Text="已中止" Visible="False" meta:resourcekey="lblSuspendStatusResource1"></asp:Label>
<asp:Label ID="lblCloseStatus" runat="server" Text="已結案" Visible="False" meta:resourcekey="lblCloseStatusResource1"></asp:Label>
