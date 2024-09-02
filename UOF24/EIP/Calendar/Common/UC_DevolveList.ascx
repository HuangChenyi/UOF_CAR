<%@ Control Language="C#" AutoEventWireup="true" Inherits="Ede.Uof.EIP.Schedule.UI.UC_DevolveList" Codebehind="UC_DevolveList.ascx.cs" %>
<%--<%@ Register Assembly="System.Web.Extensions" Namespace="System.Web.UI" TagPrefix="asp" %>--%>
<%@ Register Src="UC_SchClassList.ascx" TagName="UC_SchClassList" TagPrefix="uc3" %>
<%@ Register Assembly="System.Web, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a" Namespace="System.Web.UI" TagPrefix="cc1" %>
<%@ Register Src="../../../Common/ChoiceCenter/UC_ChoiceList.ascx" TagName="UC_ChoiceList" TagPrefix="uc1" %>
<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>
<%@ Register Src="~/eip/calendar/common/uc_schclass.ascx" TagName="UC_SchClass" TagPrefix="uc2" %>
<%@ Register Assembly="System.Web, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a" Namespace="System.Web.UI.HtmlControls" TagPrefix="cc2" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<style type="text/css">
    .centerText
    {
        text-align: center;
    }

    body
    {
        overflow: hidden;
    }
</style>
<script id="DevolveListjs" type="text/javascript">
    function barDevolve_Click(sender, args) {
        var Key = args.get_item().get_value();
        if (Key == "Create") {
            args.set_cancel(true);
            var OwnerGuid = '<%=OwnerGuid%>';
            var MeetingGuid = '<%=MeetingGuid%>';
            var date = '<%= Ede.Uof.EIP.Organization.Util.UserTime.SetZone(Ede.Uof.EIP.SystemInfo.Current.UserGUID).GetNowForUi().ToString("yyyy/MM/dd HH:mm:dd") %>';

            if (MeetingGuid !== '')
                $uof.dialog.open2("~/EIP/Calendar/CreateDevolve.aspx", args.get_item(), "", 500, 600, openDialogResult, { "MeetingGuid": MeetingGuid, "OwnerGuid": OwnerGuid, "Date": date });
            else
                $uof.dialog.open2("~/EIP/Calendar/CreateDevolve.aspx", args.get_item(), "", 500, 600, openDialogResult, { "OwnerGuid": OwnerGuid, 'Date': date });
        }
        else if (Key == "Delete") {
            if (confirm('<%=msgDelconfirm.Text %>') == false)
                args.set_cancel(true);
        }
    }

    function openDialogResult(returnValue) {
        if (typeof (returnValue) == 'undefined' || returnValue == null)
            return false;
        else
            return true;
    }
</script>

<telerik:RadSplitter ID="devRadsplitter1" runat="server" Orientation="Horizontal"
    PanesBorderSize="0" Height="100%"
    BorderSize="0" LiveResize="True" meta:resourcekey="devRadsplitter1Resource1" SplitBarsSize="">

    <telerik:RadPane ID="devToolbarPane" runat="server" Height="35px" Scrolling="None" Index="0" Locked="true" meta:resourcekey="devToolbarPaneResource1">
        <table style="width: 100%">
            <tr>
                <td style="width: 5%">
                    <uc2:UC_SchClass ID="UC_SchClass_D" runat="server" />
                </td>
                <td>
                    <telerik:RadToolBar ID="barDevolve" runat="server" Width="100%" OnClientButtonClicking="barDevolve_Click"
                        OnButtonClick="barDevolve_ButtonClick" meta:resourcekey="barDevolveResource1" SingleClick="None">
                        <Items>
                            <telerik:RadToolBarButton runat="server" HoveredImageUrl="~/Common/Images/Icon/icon_m27.png"
                                ImageUrl="~/Common/Images/Icon/icon_m27.png" Value="Create" CheckedImageUrl="~/Common/Images/Icon/icon_m27.png"
                                Text="新增交辦事項" meta:resourcekey="TBarButtonResource1">
                            </telerik:RadToolBarButton>
                            <telerik:RadToolBarButton runat="server" IsSeparator="True" Value="s1" meta:resourcekey="RadToolBarButtonResource1">
                            </telerik:RadToolBarButton>
                            <telerik:RadToolBarButton runat="server" HoveredImageUrl="~/Common/Images/Icon/icon_m03.png"
                                ImageUrl="~/Common/Images/Icon/icon_m03.png" Value="Delete" CheckedImageUrl="~/Common/Images/Icon/icon_m03.png"
                                Text="刪除選取項目" meta:resourcekey="TBarButtonResource2">
                            </telerik:RadToolBarButton>
                            <telerik:RadToolBarButton runat="server" IsSeparator="True" Value="s2" meta:resourcekey="RadToolBarButtonResource2">
                            </telerik:RadToolBarButton>
                        </Items>
                    </telerik:RadToolBar>
                </td>
            </tr>
        </table>

    </telerik:RadPane>
    <telerik:RadPane ID="devRadpane12" runat="server" Scrolling="None" Index="1" meta:resourcekey="devRadpane12Resource1">
        <telerik:RadSplitter ID="devRadsplitter2" runat="server" Height="100%" LiveResize="True" meta:resourcekey="devRadsplitter2Resource1" SplitBarsSize="">
            <telerik:RadPane ID="leftPane" runat="server" Width="15%" Index="0" meta:resourcekey="leftPaneResource1">
                <div class="LeftPaneBackground">
                    <telerik:RadSplitter ID="Radsplitter3" runat="server" Width="100%" Height="100%" Orientation="Horizontal"
                        BorderSize="0" PanesBorderSize="0" LiveResize="True" FullScreenMode="True" meta:resourcekey="Radsplitter3Resource1" SplitBarsSize="">
                        <telerik:RadPane ID="leftDownPane" runat="server" Index="0" meta:resourcekey="leftDownPaneResource1">
                            <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                                <ContentTemplate>
                                    <uc3:UC_SchClassList ID="UC_SchClassList1" runat="server" />
                                </ContentTemplate>
                                <Triggers>
                                    <asp:AsyncPostBackTrigger ControlID="UC_SchClass_D" EventName="BarClassButtonClick" />
                                    <asp:AsyncPostBackTrigger ControlID="barDevolve" EventName="ButtonClick" />
                                </Triggers>
                            </asp:UpdatePanel>
                        </telerik:RadPane>
                    </telerik:RadSplitter>
                </div>
            </telerik:RadPane>
            <telerik:RadSplitBar ID="RadSplitbar1" runat="server" CollapseMode="Forward" Index="1" meta:resourcekey="RadSplitbar1Resource1">
            </telerik:RadSplitBar>
            <telerik:RadPane ID="devRadpane2" runat="server" Index="2" meta:resourcekey="devRadpane2Resource1">
                <telerik:RadSplitter ID="devRadsplitter4" runat="server" Width="100%" Height="100%" Orientation="Horizontal"
                    BorderSize="0" PanesBorderSize="0" LiveResize="True" FullScreenMode="True" meta:resourcekey="devRadsplitter4Resource1" SplitBarsSize="">

                    <telerik:RadPane ID="devRadpane4" runat="server" Height="35px" Scrolling="None" Locked="True" Index="0" meta:resourcekey="devRadpane4Resource1">

                        <telerik:RadToolBar ID="RadToolBar1" runat="server" Width="100%" OnButtonClick="RadToolBar1_ButtonClick" meta:resourcekey="RadToolBar1Resource1" SingleClick="None">
                            <Items>
                                <telerik:RadToolBarButton runat="server" Text="交辦時間" Value="DevolveTime" meta:resourcekey="RadToolBarButtonResource3">
                                    <ItemTemplate>
                                        <table>
                                            <tr>
                                                <td>
                                                    <asp:Label ID="Label3" runat="server" Text="交辦時間 : " meta:resourcekey="Label3Resource1"></asp:Label>
                                                </td>
                                                <td>
                                                    <telerik:RadDatePicker ID="rdpDateStart" runat="server" meta:resourcekey="rdpDateStartResource1">
                                                    </telerik:RadDatePicker>
                                                </td>
                                                <td style="padding-left: 1px; padding-right: 1px">
                                                    <asp:Label ID="Label1" runat="server" Text="~" meta:resourcekey="Label1Resource1"></asp:Label>
                                                </td>
                                                <td>
                                                    <telerik:RadDatePicker ID="rdpDateEnd" runat="server" meta:resourcekey="rdpDateEndResource1">
                                                    </telerik:RadDatePicker>
                                                </td>
                                            </tr>
                                        </table>
                                    </ItemTemplate>
                                </telerik:RadToolBarButton>
                                <telerik:RadToolBarButton runat="server" IsSeparator="True" Text="sp" meta:resourcekey="RadToolBarButtonResource4">
                                </telerik:RadToolBarButton>
                                <telerik:RadToolBarButton runat="server" Text="狀態" Value="DevolveStatus" meta:resourcekey="RadToolBarButtonResource5">
                                    <ItemTemplate>
                                        <asp:Label ID="Label4" runat="server" Text="狀態:" meta:resourcekey="Label4Resource1"></asp:Label>
                                        <asp:DropDownList ID="ddlStatus" runat="server" meta:resourcekey="ddlStatusResource1">
                                            <asp:ListItem Value="All" meta:resourcekey="ListItemResource1">全部</asp:ListItem>
                                            <asp:ListItem Value="Audit" meta:resourcekey="ListItemResource2">待審核</asp:ListItem>
                                            <asp:ListItem Value="Completed" meta:resourcekey="ListItemResource3">已完成</asp:ListItem>
                                            <asp:ListItem Value="Proceeding" meta:resourcekey="ListItemResource4">未完成</asp:ListItem>
                                        </asp:DropDownList>
                                    </ItemTemplate>
                                </telerik:RadToolBarButton>
                                <telerik:RadToolBarButton runat="server" IsSeparator="True" Text="sp" meta:resourcekey="RadToolBarButtonResource6">
                                </telerik:RadToolBarButton>
                                <telerik:RadToolBarButton runat="server" Text="查詢" Value="Query" ImageUrl="~/Common/Images/Icon/icon_m39.png" meta:resourcekey="RadToolBarButtonResource7">
                                </telerik:RadToolBarButton>
                                <telerik:RadToolBarButton runat="server" IsSeparator="True" Text="sp" meta:resourcekey="RadToolBarButtonResource8">
                                </telerik:RadToolBarButton>
                            </Items>
                        </telerik:RadToolBar>
                    </telerik:RadPane>
                    <telerik:RadPane ID="devRadpane3" runat="server" Index="1" meta:resourcekey="devRadpane3Resource1">
                        <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
                            <ContentTemplate>
                                <Fast:Grid ID="gridDevolve" runat="server" AllowPaging="True" AllowSorting="True"
                                    AutoGenerateCheckBoxColumn="True" AutoGenerateColumns="False" DataKeyNames="DEVOLVE_GUID"
                                    OnRowDataBound="gridDevolve_RowDataBound" Width="100%" OnRowCommand="gridDevolve_RowCommand"
                                    DataKeyOnClientWithCheckBox="False" DefaultSortDirection="Ascending" EmptyDataText="沒有資料"
                                    EnhancePager="True" KeepSelectedRows="False" PageSize="15" OnSorting="gridDevolve_Sorting" OnPageIndexChanging="gridDevolve_PageIndexChanging"
                                      DataSourceID="objDsDevolve" OnBeforeExport="gridDevolve_BeforeExport" meta:resourcekey="gridDevolveResource2">
                                    <EnhancePagerSettings
                                        ShowHeaderPager="True" />
                                    <ExportExcelSettings AllowExportToExcel="True" />
                                    <Columns>
                                        <asp:TemplateField HeaderText="主旨" SortExpression="SUBJECT" meta:resourcekey="TemplateFieldResource1">
                                            <ItemTemplate>
                                                <asp:LinkButton runat="server" ID="btnEditDevolve" Text='<%#: Eval("SUBJECT") %>'
                                                    CommandName="EditDetail" meta:resourceKey="btnEditDevolveResource1"></asp:LinkButton>
                                            </ItemTemplate>
                                            <HeaderStyle Width="30%" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="開始時間" SortExpression="START_TIME" meta:resourcekey="BoundFieldResource1">
                                            <ItemTemplate>
                                                <asp:Label ID="lblStartTime" runat="server"></asp:Label>
                                            </ItemTemplate>
                                            <HeaderStyle Width="120px" Wrap="false"/>
                                            <ItemStyle Width="120px" Wrap="false"/>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="結束時間" SortExpression="END_TIME" meta:resourcekey="BoundFieldResource2">
                                            <ItemTemplate>
                                                <asp:Label ID="lblEndTime" runat="server"></asp:Label>
                                            </ItemTemplate>
                                            <HeaderStyle Width="120px" Wrap="false"/>
                                            <ItemStyle Width="120px" Wrap="false"/>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="逾時(天)" meta:resourcekey="TemplateFieldResource5">
                                            <ItemTemplate>
                                                <asp:Label ID="lblDelayTime" runat="server" meta:resourcekey="Label2Resource1"></asp:Label>
                                            </ItemTemplate>
                                            <HeaderStyle Wrap="False" />
                                            <ItemStyle HorizontalAlign="Right" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="交辦對象" meta:resourcekey="TemplateFieldResource2">
                                            <ItemTemplate>
                                                <uc1:UC_ChoiceList runat="server" ID="UC_ChoiceList1" IsAllowEdit="false" TreeHeight="100"></uc1:UC_ChoiceList>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="交辦對象" Visible="False" meta:resourcekey="TemplateFieldResource6">
                                            <ItemTemplate>
                                                <asp:Label ID="lblUser" runat="server" meta:resourcekey="lblUserResource1"></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="狀態" SortExpression="IS_COMPLETE" meta:resourcekey="TemplateFieldResource3">
                                            <ItemTemplate>
                                                <asp:Label runat="server" ID="lblStatus" meta:resourceKey="lblStatusResource1"></asp:Label>
                                            </ItemTemplate>
                                            <HeaderStyle Width="80px" Wrap="false"/>
                                            <ItemStyle Width="80px" Wrap="false"/>
                                        </asp:TemplateField>
                                        <asp:TemplateField ShowHeader="False" meta:resourcekey="TemplateFieldResource4">
                                            <ItemTemplate>
                                                <asp:LinkButton runat="server" ID="btnViewProgress" Text="工作進度" CausesValidation="False"
                                                    meta:resourceKey="btnViewProgressResource1"></asp:LinkButton>
                                                <br/>
                                                <asp:LinkButton runat="server" ID="lbtnForum" Text="交辦討論" CausesValidation="False" meta:resourceKey="lbtnForumResource1"></asp:LinkButton>
                                            </ItemTemplate>
                                            <HeaderStyle Width="80px" />
                                            <ItemStyle Width="80px" Wrap="False" />
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="USER_SET" HeaderText="USER_SET" meta:resourceKey="BoundFieldResource3"
                                            SortExpression="USER_SET" Visible="False"></asp:BoundField>
                                    </Columns>
                                </Fast:Grid>
                                <asp:ObjectDataSource ID="objDsDevolve" runat="server">
                                </asp:ObjectDataSource>
                            </ContentTemplate>
                            <Triggers>
                                <asp:AsyncPostBackTrigger ControlID="UC_SchClass_D" EventName="BarClassButtonClick" />
                                <asp:AsyncPostBackTrigger ControlID="barDevolve" EventName="ButtonClick" />
                                <asp:AsyncPostBackTrigger ControlID="UC_SchClassList1" EventName="NodeOnClick" />
                                <asp:AsyncPostBackTrigger ControlID="UC_SchClass_D" EventName="SelectedOnChanged" />
                                <asp:AsyncPostBackTrigger ControlID="RadToolBar1" EventName="ButtonClick" />
                                <asp:AsyncPostBackTrigger ControlID="gridDevolve" EventName="BeforeExport" />
                            </Triggers>
                        </asp:UpdatePanel>
                        &nbsp;<asp:Label ID="lblNoticeDevolveCantDelete" runat="server" Text="被知會的交辦無維護權限" ForeColor="Blue" meta:resourcekey="lblNoticeDevolveCantDeleteResource1"></asp:Label>
                        <asp:Label ID="lbOwnerGuid" runat="server" Visible="False" meta:resourcekey="lbOwnerGuidResource1"></asp:Label>
                        <asp:Label ID="lbMeetingGuid" runat="server" Visible="False" meta:resourcekey="lbMeetingGuidResource1"></asp:Label>
                        <br />
                        <asp:Label ID="msgDelconfirm" runat="server" Text="確定要刪除?" Visible="False" meta:resourcekey="msgDelconfirmResource1"></asp:Label>
                        <asp:Label ID="msgUncomplete" runat="server" Text="未完成" Visible="False" meta:resourcekey="msgUncompleteResource1"></asp:Label>
                        <asp:Label ID="msgComplete" runat="server" Text="已完成" Visible="False" meta:resourcekey="msgCompleteResource1"></asp:Label>
                       
                        <asp:HiddenField ID="hideIsEditable" runat="server" Value="false" />
                        <asp:HiddenField ID="hideShowSchClass" runat="server" Value="True" />

                        <asp:Label ID="msgAudit" runat="server" meta:resourceKey="msgAuditResource1" Text="待審核" Visible="False"></asp:Label>
                        <asp:Label ID="lblNotice" runat="server" meta:resourceKey="lblNoticeResource1" Text="[知會]" Visible="False"></asp:Label>
                        <asp:Label ID="lblForumTitle" runat="server" Text="交辦討論" Visible="False"></asp:Label>
                    </telerik:RadPane>
                </telerik:RadSplitter>
            </telerik:RadPane>
        </telerik:RadSplitter>
    </telerik:RadPane>
</telerik:RadSplitter>