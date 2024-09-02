<%@ Control Language="C#" AutoEventWireup="true" Inherits="Ede.Uof.EIP.Schedule.UI.UC_HolidayList" Codebehind="UC_HolidayList.ascx.cs" %>
<%@ Register Src="UC_SchClassList.ascx" TagName="UC_SchClassList" TagPrefix="uc2" %>
<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>
<%@ Register Src="~/eip/calendar/common/uc_schclass.ascx" TagName="UC_SchClass" TagPrefix="uc1" %>

<script id="HolidayListjs" type="text/javascript">
    Sys.Application.add_load(function () {
        var is_Editable = "<%=Request.QueryString["isEditable"]%>";
        var holidayGuid = "<%=Request.QueryString["HolidayGuid"]%>";
        var ownerGuid = "<%=Request.QueryString["OwnerGuid"]%>";
        var UserGuid = '<%=UserGuid%>';
        if (holidayGuid !== "") {
            var is_Opened = $("#<%=hidIsOpened.ClientID%>");
            if (is_Opened.val() !== "True") {
                is_Opened.val("True");
                if (UserGuid === "<%=Request.QueryString["OwnerGuid"]%>") {
                    $uof.dialog.open2("~/EIP/Calendar/CreateHoliday.aspx","","",600, 570,
                        function(returnValue) {
                            if (returnValue == null) {
                                return false;
                            }
                            return true;
                        },
                        { "HolidayGuid": holidayGuid, "OwnerGuid": ownerGuid, "isEditable": is_Editable });
                } else {
                    alert($("#<%=lblNotAllowViewHoliday.ClientID%>").text());
                }
            }
        }
    });
    function barHoliday_Click(sender, args) {

        var Key = args.get_item().get_value();
        if (Key == "delete") {
            if (confirm('<%=msgCancelconfirm.Text %>') == false)
                args.set_cancel(true);
        }
        else if (Key == "Create") {
            var UserGuid = '<%=UserGuid%>';
            var date = '<%= Ede.Uof.EIP.Organization.Util.UserTime.SetZone(Ede.Uof.EIP.SystemInfo.Current.UserGUID).GetNowForUi().ToString("yyyy/MM/dd HH:mm:dd") %>';

            args.set_cancel(true);
            $uof.dialog.open2("~/EIP/Calendar/CreateHoliday.aspx", args.get_item(), "", 600, 570, openDialogResult, { "OwnerGuid": UserGuid, "Date": date });
        }
    }

    function holidayRadsplitter2_clientLoaded(sender, args) {
        var radsplitter = $find("<%=holidayRadsplitter2.ClientID%>");
        var leftPane = $find("<%=leftPane.ClientID%>");
        var holidayRadpane = $find("<%=holidayRadpane2.ClientID%>");

        var width = radsplitter.get_width();
        if (leftPane == null) {
            radsplitter.set_width(1);
            radsplitter.set_width(width);

        }
        else {
            if (holidayRadpane.get_width() == width)
                holidayRadpane.set_width(width - leftPane.get_width() - 6);
        }

    }

    function openDialogResult(returnValue) {
        if (typeof (returnValue) == 'undefined' || returnValue == null)
            return false;
        else {
            return true;
        }
    }
</script>

<telerik:RadSplitter ID="holidayRadsplitter1" runat="server" Orientation="Horizontal"
    PanesBorderSize="0" Height="100%"
    BorderSize="0" LiveResize="True" ResizeWithParentPane="True"
    ResizeWithBrowserWindow="True">

    <telerik:RadPane ID="holidayToolbarPane" runat="server" Height="35" Scrolling="None" Locked="true">
        <table style="width: 100%">
            <tr>
                <td style="width: 5%">
                    <uc1:UC_SchClass ID="UC_SchClass_H" runat="server" />
                </td>
                <td>
                    <telerik:RadToolBar ID="RadToolBar1" runat="server" Width="100%" OnClientButtonClicking="barHoliday_Click"
                        OnButtonClick="RadToolBar1_ButtonClick"
                        meta:resourcekey="RadToolBar1Resource1">
                        <Items>
                            <telerik:RadToolBarButton runat="server" Value="Create" Text="新增休假" DisabledImageUrl="~/Common/Images/Icon/icon_m76.gif"
                                HoveredImageUrl="~/Common/Images/Icon/icon_m76.gif" ImageUrl="~/Common/Images/Icon/icon_m76.gif"
                                CheckedImageUrl="~/Common/Images/Icon/icon_m76.gif" meta:resourcekey="TBarButtonResource3">
                            </telerik:RadToolBarButton>
                            <telerik:RadToolBarButton runat="server" IsSeparator="True" Value="s1"
                                meta:resourcekey="RadToolBarButtonResource5">
                            </telerik:RadToolBarButton>
                            <telerik:RadToolBarButton runat="server" HoveredImageUrl="~/Common/Images/Icon/icon_m03.gif" ImageUrl="~/Common/Images/Icon/icon_m03.gif"
                                Value="delete" CheckedImageUrl="~/Common/Images/Icon/icon_m03.gif" Text="取消休假" DisabledImageUrl="~/Common/Images/Icon/icon_m03.gif"
                                meta:resourcekey="TBarButtonResource4">
                            </telerik:RadToolBarButton>
                            <telerik:RadToolBarButton runat="server" IsSeparator="True" Value="s2"
                                meta:resourcekey="RadToolBarButtonResource6">
                            </telerik:RadToolBarButton>
                        </Items>
                    </telerik:RadToolBar>
                </td>
            </tr>


        </table>
    </telerik:RadPane>
    <telerik:RadPane ID="holidayRadpane12" runat="server" Scrolling="none" Height="100%">
        <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
            <ContentTemplate>
                <telerik:RadSplitter ID="holidayRadsplitter2" runat="server" Height="100%" LiveResize="True" OnClientLoaded="holidayRadsplitter2_clientLoaded">
                    <telerik:RadPane ID="leftPane" runat="server" Width="15%" Height="100%">
                        <div class="LeftPaneBackground">
                            <telerik:RadSplitter ID="Radsplitter3" runat="server" Width="100%" Height="100%" Orientation="Horizontal"
                                BorderSize="0" PanesBorderSize="0" LiveResize="True" ResizeWithParentPane="True"
                                ResizeWithBrowserWindow="True">
                                <telerik:RadPane ID="leftDownPane" runat="server" Height="100%">
                                    <uc2:UC_SchClassList ID="UC_SchClassList1" runat="server" />
                                </telerik:RadPane>
                            </telerik:RadSplitter>
                        </div>
                    </telerik:RadPane>
                    <telerik:RadSplitBar ID="RadSplitbar1" runat="server" CollapseMode="Forward">
                    </telerik:RadSplitBar>
                    <telerik:RadPane ID="holidayRadpane2" runat="server" Height="100%">
                        <telerik:RadSplitter ID="holidayRadsplitter4" runat="server" Width="100%" Height="100%" Orientation="Horizontal"
                            BorderSize="0" PanesBorderSize="0" LiveResize="True" ResizeWithParentPane="True"
                            ResizeWithBrowserWindow="True">

                            <telerik:RadPane ID="holidayRadpane4" runat="server" Scrolling="None" Height="30" Locked="true">
                                <telerik:RadToolBar ID="YearHolidayToolbar" runat="server" Width="100%" OnButtonClick="YearHolidayToolbar_ButtonClick"
                                    meta:resourcekey="YearHolidayToolbarResource1">
                                    <Items>
                                        <telerik:RadToolBarButton runat="server" Value="selectYear" Text="Button 0"
                                            meta:resourcekey="RadToolBarButtonResource7" Owner="">
                                            <ItemTemplate>
                                                <table class="style1">
                                                    <tr>
                                                        <td>
                                                            <asp:Label ID="lblYear1" runat="server" Text="年度"
                                                                meta:resourcekey="lblYear1Resource1"></asp:Label>
                                                        </td>
                                                        <td>
                                                            <asp:DropDownList ID="ddlYear" runat="server" AutoPostBack="True"
                                                                OnSelectedIndexChanged="ddlYear_SelectedIndexChanged"
                                                                meta:resourcekey="ddlYearResource2">
                                                            </asp:DropDownList>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </ItemTemplate>
                                        </telerik:RadToolBarButton>
                                        <telerik:RadToolBarButton runat="server" IsSeparator="True" Text="Button 1"
                                            meta:resourcekey="RadToolBarButtonResource8" Owner="">
                                        </telerik:RadToolBarButton>
                                    </Items>
                                </telerik:RadToolBar>
                            </telerik:RadPane>
                            <telerik:RadPane ID="holidayRadpane3" runat="server" Height="100%">

                                <Fast:Grid ID="HolidayGrid" runat="server" AllowSorting="True" AutoGenerateCheckBoxColumn="True"
                                    AutoGenerateColumns="False" DataKeyNames="HOLIDAY_GUID" DataSourceID="ObjectDataSource1"
                                    Width="100%" AllowPaging="True" OnRowDataBound="Grid1_RowDataBound" OnRowCommand="Grid1_RowCommand"
                                    DataKeyOnClientWithCheckBox="False" DefaultSortDirection="Ascending"
                                    EmptyDataText="沒有資料" EnhancePager="True" KeepSelectedRows="False"
                                    PageSize="15" 
                                    meta:resourcekey="HolidayGridResource1" 
                                    >
                                    <EnhancePagerSettings
                                        ShowHeaderPager="True" />
                                    <ExportExcelSettings AllowExportToExcel="False" />
                                    <Columns>
                                        <asp:TemplateField HeaderText="主旨" SortExpression="SUBJECT"
                                            meta:resourcekey="TemplateFieldResource1">
                                            <ItemTemplate>
                                                <asp:LinkButton runat="server" ID="LinkButton1" Text='<%#: Eval("SUBJECT") %>' CommandName="EditHoliday"
                                                    meta:resourceKey="LinkButton1Resource1"></asp:LinkButton>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="開始時間" SortExpression="START_TIME"
                                            meta:resourcekey="BoundFieldResource1">
                                            <ItemTemplate>
                                                <asp:Label ID="lblStartTime" runat="server"></asp:Label>
                                            </ItemTemplate>
                                            <HeaderStyle Width="120px" Wrap="false"/>
                                            <ItemStyle Width="120px" Wrap="false"/>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="結束時間" SortExpression="END_TIME"
                                            meta:resourcekey="BoundFieldResource2">
                                            <ItemTemplate>
                                                <asp:Label ID="lblEndTime" runat="server"></asp:Label>
                                            </ItemTemplate>
                                            <HeaderStyle Width="120px" Wrap="false"/>
                                            <ItemStyle Width="120px" Wrap="false"/>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="IS_PERSONAL" HeaderText="類型" SortExpression="IS_PERSONAL"
                                            meta:resourcekey="BoundFieldResource3">
                                            <HeaderStyle Width="80px" />
                                            <ItemStyle Width="80px" />
                                        </asp:BoundField>
                                    </Columns>
                                </Fast:Grid>
                                <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" OldValuesParameterFormatString="original_{0}"
                                    SelectMethod="GetMyHoliday" TypeName="Ede.Uof.EIP.Schedule.Holiday.ReadHolidayUCO">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="lbUserGuid" Name="userGUID" PropertyName="Text"
                                            Type="String" />
                                    </SelectParameters>
                                </asp:ObjectDataSource>

                                <asp:Label ID="lbUserGuid" runat="server" Visible="False" meta:resourcekey="lbUserGuidResource1"></asp:Label>
                                <asp:Label ID="msgCancelconfirm" runat="server" Text="確定要取消?" Visible="False" meta:resourcekey="msgCancelconfirmResource1"></asp:Label>
                                <asp:Label ID="lbCompany" runat="server" Text="公司" Visible="False" meta:resourcekey="lbCompanyResource1"></asp:Label>
                                <asp:Label ID="lbPersonal" runat="server" Text="個人" Visible="False" meta:resourcekey="lbPersonalResource1"></asp:Label>
                                <asp:Label ID="lblyear" runat="server" Visible="False" meta:resourcekey="lblyearResource2"></asp:Label>
                                <asp:HiddenField ID="hideStatus" runat="server" />
                                <asp:HiddenField ID="hidIsOpened" runat="server" />
                                <asp:Label ID="lblNotAllowViewHoliday" runat="server" Text="休假的擁有者與登入者不一致,不允許觀看" Style="display:none;" meta:resourcekey="lblNotAllowViewHolidayResource1"></asp:Label>
                            </telerik:RadPane>
                        </telerik:RadSplitter>

                    </telerik:RadPane>
                </telerik:RadSplitter>
            </ContentTemplate>
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="UC_SchClass_H" EventName="BarClassButtonClick" />
                <asp:AsyncPostBackTrigger ControlID="RadToolBar1" EventName="ButtonClick" />
                <asp:AsyncPostBackTrigger ControlID="UC_SchClassList1" EventName="NodeOnClick" />
                <asp:AsyncPostBackTrigger ControlID="UC_SchClass_H" EventName="SelectedOnChanged" />
            </Triggers>
        </asp:UpdatePanel>
    </telerik:RadPane>
</telerik:RadSplitter>