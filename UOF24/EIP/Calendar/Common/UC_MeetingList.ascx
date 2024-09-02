<%@ Control Language="C#" AutoEventWireup="true" Inherits="Ede.Uof.EIP.Schedule.UI.UC_MeetingList" Codebehind="UC_MeetingList.ascx.cs" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%--<%@ Register Assembly="System.Web.Extensions" Namespace="System.Web.UI" TagPrefix="asp" %>--%>
<%@ Register Src="UC_SchClassList.ascx" TagName="UC_SchClassList" TagPrefix="uc2" %>
<%@ Register Assembly="System.Web, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a" Namespace="System.Web.UI" TagPrefix="cc1" %>
<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>
<%@ Register Src="~/eip/calendar/common/uc_schclass.ascx" TagName="UC_SchClass" TagPrefix="uc1" %>

<script id="MeetingListjs" type="text/javascript">
    Sys.Application.add_load(function () {
        var is_Editable = "<%=Request.QueryString["isEditable"]%>";

        //連結會議清單
        var Meet_Guid = "<%=Request.QueryString["MeetGuid"]%>";
        var isMyMeeting = "<%=Request.QueryString["IsMyMeeting"]%>";

        if (Meet_Guid != "") {
            var is_Opened = $("#<%=hidIsOpened.ClientID%>");
            var meetingTab = $("#<%=hideMeetingTab.ClientID%>");

            if (is_Opened.val() !== "True") {
                is_Opened.val("True");
                $uof.dialog.open2("~/EIP/Calendar/CreateMeeting.aspx", "", "", 0, 0,
                    function (returnValue) {
                        if (returnValue == null || typeof (returnValue) == 'undefined') { return false; }

                        $("#<%=Button1.ClientID%>").click();
                    return true;
                    },
                    { "MeetingGuid": Meet_Guid, "isEditable": is_Editable, "IsMyMeeting": isMyMeeting, "isFromLink": "True", "Tab": meetingTab.val()});
            }            
        }

        //連結會議清單的被徵詢
            var Inquiry_Guid = "<%=Request.QueryString["InquiryGuid"]%>";
            if (Inquiry_Guid != "") {
                var is_Opened = $("#<%=hidIsOpened.ClientID%>");

                if (is_Opened.val() !== "True") {
                    is_Opened.val("True");
                    $uof.dialog.open2("~/EIP/Calendar/ReplyInquiry.aspx", "", "", 950, 600,
                    function (returnValue) {
                        if (returnValue == null || typeof (returnValue) == 'undefined') { return false }
                        $("#<%=Button1.ClientID%>").click();
                        return true
                    },
                    { "InquiryGuid": Inquiry_Guid });
                }
                
            }
    });
    function bar2_Click(sender, args) {
        var Key = args.get_item().get_value();
        var UserGuid = '<%=UserGuid%>';
        var date = '<%= Ede.Uof.EIP.Organization.Util.UserTime.SetZone(Ede.Uof.EIP.SystemInfo.Current.UserGUID).GetNowForUi().ToString("yyyy/MM/dd HH:mm:dd") %>';
        args.set_cancel(true);
        if (Key == "delete") {
            if (confirm('<%=msgCancelconfirm.Text %>'))
                args.set_cancel(false);
        }
        else if (Key == "Create") {
                        
            $uof.dialog.open2("~/EIP/Calendar/CreateMeeting.aspx", args.get_item(), "", 950, 700, openDialogResult, { "OwnerGuid": UserGuid, "Date": date });
        }
        else if (Key == "CreateMore") {
            $uof.dialog.open2("~/EIP/Calendar/CreateMoreMeeting.aspx", args.get_item(), "", 950, 700, openDialogResult, { "OwnerGuid": UserGuid, "Date": date });
        }
        else if (Key == "Export") {

            var guids = $uof.fastGrid.getChecked("<%= Grid5.ClientID%>");
            if (guids == "") {
                alert("<%=msgExport.Text %>");
            }
            else {
                $("#<%=hideMeetingIDs.ClientID %>").val(guids);

                $uof.dialog.open2("~/EIP/Calendar/Common/ExportProgress.aspx", args.get_item(), "<%=lbUserGuid.Text%>", 400, 200, openDialogResult, { "userID": '<%=lbUserGuid.Text%>', "hideClientID": '<%=hideMeetingIDs.ClientID %>' });                
            }            
        }
    }

    function bar3_Click(sender, args) {
        var Key = args.get_item().get_value();

        if (Key == "delete") {
            if (confirm('<%=msgCancelconfirm.Text %>') == false)
                args.set_cancel(true);
        }
        else if (Key == "Create") {
            var UserGuid = '<%=UserGuid%>';
            var date = '<%= Ede.Uof.EIP.Organization.Util.UserTime.SetZone(Ede.Uof.EIP.SystemInfo.Current.UserGUID).GetNowForUi().ToString("yyyy/MM/dd HH:mm:dd") %>';

            args.set_cancel(true);
            //isEditable=2代表新增(不含上步鈕)
            $uof.dialog.open2("~/EIP/Calendar/CreateInquiry.aspx", args.get_item(), "", 950, 700, openDialogResult, { "OwnerGuid": UserGuid, "Date": date, "isEditable": 2 });
        }
    }

    function Radsplitter_clientLoaded(sender, args) {

        var radsplitter = $find("<%=Radsplitter17.ClientID%>");
        var leftPane = $find("<%=RadPane16.ClientID%>");
        var meetingRadpane = $find("<%=Radpane25.ClientID%>");

        var width = radsplitter.get_width();
        if (leftPane == null) {
            radsplitter.set_width(1);
            radsplitter.set_width(width);
        }
        else {
            if (meetingRadpane.get_width() == width)
                meetingRadpane.set_width(width - leftPane.get_width() - 6);
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
<style>
    body {
        overflow: hidden;
    }
</style>

<script type="text/javascript" id="telerikClientEvents1">

    function UC_MeetingList_TabSelecting(sender, args) {
        //Add JavaScript handler code here
        var tabValue = args.get_tab().get_value();
        $('#ctl00_ctl00_ContentPlaceHolder1_MainContentPlaceHolder_Hidden2').val(tabValue);
    }

</script>

<asp:UpdatePanel ID="UpdatePanel5" runat="server">
    <ContentTemplate>
        <telerik:RadSplitter ID="Radsplitter15" runat="server" Orientation="Horizontal"
            PanesBorderSize="0" Height="100%" Width="100%"
            BorderSize="0" LiveResize="True" OnClientLoaded="Radsplitter_clientLoaded" FullScreenMode="True" meta:resourcekey="Radsplitter15Resource1" OnClientLoad="Radsplitter_clientLoaded" SplitBarsSize="">
            <telerik:RadPane ID="RadPane22" runat="server" Height="26px" Scrolling="None" Locked="True" Index="0" meta:resourcekey="RadPane22Resource1">
                <telerik:RadTabStrip ID="rts1" runat="server" MultiPageID="rpm1" OnTabClick="rts1_TabClick" SelectedIndex="0" meta:resourcekey="rts1Resource1" OnClientTabSelecting="UC_MeetingList_TabSelecting">
                    <Tabs>
                        <telerik:RadTab runat="server" Text="被邀請" Value="ShowOtherMeeting" PageViewID="rpvShowOtherMeeting" Selected="True" meta:resourcekey="RadTabResource1">
                        </telerik:RadTab>
                        <telerik:RadTab runat="server" Text="我召開" Value="ShowMyMeeting" PageViewID="rpvShowMyMeeting" meta:resourcekey="RadTabResource2">
                        </telerik:RadTab>
                        <telerik:RadTab runat="server" Text="被徵詢" Value="ShowOtherInquiry" PageViewID="rpvShowOtherInquiry" meta:resourcekey="RadTabResource3">
                        </telerik:RadTab>
                        <telerik:RadTab runat="server" Text="徵詢" Value="ShowMyInquiry" PageViewID="rpvShowMyInquiry" meta:resourcekey="RadTabResource4">
                        </telerik:RadTab>
                    </Tabs>
                </telerik:RadTabStrip>
            </telerik:RadPane>
            <telerik:RadPane ID="RadPane23" runat="server" Scrolling="None" Index="1" meta:resourcekey="RadPane23Resource1">
                <telerik:RadSplitter ID="Radsplitter16" runat="server" Orientation="Horizontal"
                    Width="100%" PanesBorderSize="0" Height="100%"
                    BorderSize="0" LiveResize="True" FullScreenMode="True" meta:resourcekey="Radsplitter16Resource1" SplitBarsSize="">

                    <telerik:RadPane ID="RadPane5" runat="server" Height="35px" Scrolling="None" Index="0" MinHeight="35" meta:resourcekey="RadPane5Resource1"> 
                        <telerik:RadMultiPage ID="toolbarRmp" runat="server" SelectedIndex="0" meta:resourcekey="toolbarRmpResource1">
                            <telerik:RadPageView ID="rpv1" runat="server" Selected="True" meta:resourcekey="rpv1Resource1">
                               <table style="width:100%">
                                   <tr>
                                       <td style="width:5%">
                                            <uc1:UC_SchClass ID="UC_SchClass1" runat="server" />
                                       </td>
                                       <td>
                                             <telerik:RadToolBar ID="rdTBMeetingTime" runat="server" Width="100%" OnButtonClick="rdTBMeetingTime_ButtonClick" SingleClick="None">
                                                <Items>
                                                    <telerik:RadToolBarButton runat="server" Text="會議時間" Value="MeetingTime">
                                                        <ItemTemplate>
                                                            <table>
                                                                <tr>
                                                                    <td>
                                                                        <asp:Label ID="Label3" runat="server" Text="會議時間:" meta:resourcekey="Label3Resource1"></asp:Label>
                                                                    </td>
                                                                    <td>
                                                                        <telerik:RadDatePicker ID="rdpDateStart" runat="server" >
                                                                        </telerik:RadDatePicker>
                                                                    </td>
                                                                    <td style="padding-left: 1px; padding-right: 1px">
                                                                        <asp:Label ID="Label1" runat="server" Text="~" ></asp:Label>
                                                                    </td>
                                                                    <td>
                                                                        <telerik:RadDatePicker ID="rdpDateEnd" runat="server">
                                                                        </telerik:RadDatePicker>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </ItemTemplate>
                                                    </telerik:RadToolBarButton>
                                                    <telerik:RadToolBarButton runat="server" IsSeparator="True" Text="sp" >
                                                    </telerik:RadToolBarButton>
                                                    <telerik:RadToolBarButton runat="server" Text="狀態" Value="Status">
                                                        <ItemTemplate>
                                                            <asp:Label ID="Label4" runat="server" Text="狀態:" meta:resourcekey="Label4Resource1"></asp:Label>
                                                            <asp:DropDownList ID="ddlStatus" runat="server" >
                                                                <asp:ListItem Value="2" meta:resourcekey="ALL">全部</asp:ListItem>                                                                
                                                                <asp:ListItem Value="1" meta:resourcekey="lblJoinResource1">參加</asp:ListItem>
                                                                <asp:ListItem Value="0" meta:resourcekey="lblNoJoinResource1">不參加</asp:ListItem>
                                                                <asp:ListItem Value="3" meta:resourcekey="lblNoReplyResource1">尚未回覆</asp:ListItem>
                                                            </asp:DropDownList>
                                                        </ItemTemplate>
                                                    </telerik:RadToolBarButton>
                                                    <telerik:RadToolBarButton runat="server" IsSeparator="True" Text="sp">
                                                    </telerik:RadToolBarButton>
                                                    <telerik:RadToolBarButton runat="server" Text="查詢" Value="Query" ImageUrl="~/Common/Images/Icon/icon_m39.png" meta:resourcekey="btnSearchResource1" >
                                                    </telerik:RadToolBarButton>
                                                    <telerik:RadToolBarButton runat="server" IsSeparator="True" Text="sp" >
                                                    </telerik:RadToolBarButton>
                                                </Items>
                                            </telerik:RadToolBar>
                                       </td>
                                   </tr>
                               </table>                               
                            </telerik:RadPageView>
                            <telerik:RadPageView ID="rpv2" runat="server" meta:resourcekey="rpv2Resource1">
                                <table style="width: 100%">
                                    <tr>
                                        <td style="width: 5%">
                                            <uc1:UC_SchClass ID="UC_SchClass2" runat="server" />
                                        </td>
                                        <td>
                                            <telerik:RadToolBar ID="RadToolBar2" runat="server" OnButtonClick="RadToolBar2_ButtonClick" Width="100%"
                                                OnClientButtonClicking="bar2_Click" meta:resourcekey="RadToolBar2Resource1" SingleClick="None">
                                                <Items>
                                                    <telerik:RadToolBarButton runat="server" Value="Create" Text="新增會議" DisabledImageUrl="~/Common/Images/Icon/icon_m71.png"
                                                        HoveredImageUrl="~/Common/Images/Icon/icon_m71.png" ImageUrl="~/Common/Images/Icon/icon_m71.png"
                                                        CheckedImageUrl="~/Common/Images/Icon/icon_m71.png" meta:resourcekey="RadToolBarButtonResource7">
                                                    </telerik:RadToolBarButton>
                                                    <telerik:RadToolBarButton runat="server" IsSeparator="True" Value="s2" meta:resourcekey="RadToolBarButtonResource1"></telerik:RadToolBarButton>
                                                    <telerik:RadToolBarButton runat="server" Value="CreateMore" Text="新增週期會議" DisabledImageUrl="~/Common/Images/Icon/icon_m04.png"
                                                        HoveredImageUrl="~/Common/Images/Icon/icon_m04.png" ImageUrl="~/Common/Images/Icon/icon_m04.png"
                                                        CheckedImageUrl="~/Common/Images/Icon/icon_m04.png" meta:resourcekey="RadToolBarButtonResource8">
                                                    </telerik:RadToolBarButton>
                                                    <telerik:RadToolBarButton runat="server" IsSeparator="True" Value="s2" meta:resourcekey="RadToolBarButtonResource2"></telerik:RadToolBarButton>
                                                    <telerik:RadToolBarButton runat="server" HoveredImageUrl="~/Common/Images/Icon/icon_m03.png"
                                                        ImageUrl="~/Common/Images/Icon/icon_m03.png" Value="delete" CheckedImageUrl="~/Common/Images/Icon/icon_m03.png"
                                                        Text="取消會議" DisabledImageUrl="~/Common/Images/Icon/icon_m03.png" meta:resourcekey="RadToolBarButtonResource9">
                                                    </telerik:RadToolBarButton>
                                                    <telerik:RadToolBarButton runat="server" IsSeparator="True" Value="s3" meta:resourcekey="RadToolBarButtonResource3"></telerik:RadToolBarButton>
                                                    <telerik:RadToolBarButton runat="server" HoveredImageUrl="~/Common/Images/Icon/icon_m144.png"
                                                        ImageUrl="~/Common/Images/Icon/icon_m144.png" CheckedImageUrl="~/Common/Images/Icon/icon_m144.png"
                                                        DisabledImageUrl="~/Common/Images/Icon/icon_m144.png" Value="Export" Text="匯出Excel" meta:resourcekey="RadToolBarButtonResource10">
                                                    </telerik:RadToolBarButton>
                                                    <telerik:RadToolBarButton runat="server" IsSeparator="True" Value="s4" meta:resourcekey="RadToolBarButtonResource4"></telerik:RadToolBarButton>
                                                </Items>
                                            </telerik:RadToolBar>
                                        </td>
                                    </tr>
                                </table>
                            </telerik:RadPageView>
                            <telerik:RadPageView ID="rpv3" runat="server" meta:resourcekey="rpv3Resource1">
                                <uc1:UC_SchClass ID="UC_SchClass4" runat="server" BarSkinID="" />
                            </telerik:RadPageView>
                            <telerik:RadPageView ID="rpv4" runat="server" meta:resourcekey="rpv4Resource1">
                                <table style="width: 100%">
                                    <tr>
                                        <td style="width: 5%">
                                            <uc1:UC_SchClass ID="UC_SchClass3" runat="server" />
                                        </td>
                                        <td>
                                            <telerik:RadToolBar ID="RadToolBar3" runat="server" OnButtonClick="RadToolBar3_ButtonClick" Width="100%"
                                                OnClientButtonClicking="bar3_Click" meta:resourcekey="RadToolBar3Resource1" SingleClick="None">
                                                <Items>
                                                    <telerik:RadToolBarButton runat="server" Value="Create" Text="新增徵詢" DisabledImageUrl="~/Common/Images/Icon/icon_m59.png"
                                                        HoveredImageUrl="~/Common/Images/Icon/icon_m59.png" ImageUrl="~/Common/Images/Icon/icon_m59.png"
                                                        CheckedImageUrl="~/Common/Images/Icon/icon_m59.png" meta:resourcekey="RadToolBarButtonResource11">
                                                    </telerik:RadToolBarButton>
                                                    <telerik:RadToolBarButton runat="server" IsSeparator="True" Value="s1" meta:resourcekey="RadToolBarButtonResource5"></telerik:RadToolBarButton>
                                                    <telerik:RadToolBarButton runat="server" Value="delete" Text="刪除徵詢" CheckedImageUrl="~/Common/Images/Icon/icon_m03.png"
                                                        HoveredImageUrl="~/Common/Images/Icon/icon_m03.png" ImageUrl="~/Common/Images/Icon/icon_m03.png"
                                                        DisabledImageUrl="~/Common/Images/Icon/icon_m03.png" meta:resourcekey="RadToolBarButtonResource12">
                                                    </telerik:RadToolBarButton>
                                                    <telerik:RadToolBarButton runat="server" IsSeparator="True" Value="s2" meta:resourcekey="RadToolBarButtonResource6"></telerik:RadToolBarButton>
                                                </Items>
                                            </telerik:RadToolBar>
                                        </td>
                                    </tr>
                                </table>
                            </telerik:RadPageView>
                        </telerik:RadMultiPage>
                    </telerik:RadPane>
                    <telerik:RadPane ID="Radpane10" runat="server" Scrolling="None" Index="1" meta:resourcekey="Radpane10Resource1">
                        <telerik:RadSplitter ID="Radsplitter17" runat="server" Height="100%" LiveResize="True" OnClientLoaded="Radsplitter_clientLoaded" meta:resourcekey="Radsplitter17Resource1" OnClientLoad="Radsplitter_clientLoaded" SplitBarsSize="">
                            <telerik:RadPane ID="RadPane16" runat="server" Width="15%" Scrolling="None" Index="0" meta:resourcekey="RadPane16Resource1">
                                <div class="LeftPaneBackground">
                                    <telerik:RadSplitter ID="Radsplitter18" runat="server" Width="100%" Height="100%" Orientation="Horizontal"
                                        BorderSize="0" PanesBorderSize="0" LiveResize="True" FullScreenMode="True" meta:resourcekey="Radsplitter18Resource1" SplitBarsSize="">
                                        <telerik:RadPane ID="RadPane24" runat="server" Index="0" meta:resourcekey="RadPane24Resource1">
                                            <telerik:RadMultiPage ID="treeRmp" runat="server" SelectedIndex="0" meta:resourcekey="treeRmpResource1">
                                                <telerik:RadPageView ID="rpv5" runat="server" Selected="True" meta:resourcekey="rpv5Resource1">
                                                    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                                                        <ContentTemplate>
                                                            <uc2:UC_SchClassList ID="meeting_UC_SchClassList1" runat="server" />
                                                        </ContentTemplate>
                                                        <Triggers>
                                                            <asp:AsyncPostBackTrigger ControlID="UC_SchClass1" EventName="BarClassButtonClick" />
                                                        </Triggers>
                                                    </asp:UpdatePanel>
                                                </telerik:RadPageView>
                                                <telerik:RadPageView ID="rpv6" runat="server" meta:resourcekey="rpv6Resource1">
                                                    <uc2:UC_SchClassList ID="meeting_UC_SchClassList2" runat="server" />
                                                </telerik:RadPageView>
                                                <telerik:RadPageView ID="rpv7" runat="server" meta:resourcekey="rpv7Resource1">
                                                    <uc2:UC_SchClassList ID="meeting_UC_SchClassList4" runat="server" />
                                                </telerik:RadPageView>
                                                <telerik:RadPageView ID="rpv8" runat="server" meta:resourcekey="rpv8Resource1">
                                                    <uc2:UC_SchClassList ID="meeting_UC_SchClassList3" runat="server" />
                                                </telerik:RadPageView>
                                            </telerik:RadMultiPage>
                                        </telerik:RadPane>
                                    </telerik:RadSplitter>
                                </div>
                            </telerik:RadPane>
                            <telerik:RadSplitBar ID="RadSplitbar1" runat="server" CollapseMode="Forward" Index="1" meta:resourcekey="RadSplitbar1Resource1">
                            </telerik:RadSplitBar>
                            <telerik:RadPane ID="Radpane25" runat="server" Scrolling="None" Index="2" meta:resourcekey="Radpane25Resource1">
                                <telerik:RadSplitter ID="Radsplitter90" runat="server" Orientation="Horizontal" PanesBorderSize="0" Height="100%"
                                    BorderSize="0" LiveResize="True" meta:resourcekey="Radsplitter90Resource1" SplitBarsSize="">
                                    <telerik:RadPane ID="Radpane1" runat="server" Index="0" meta:resourcekey="Radpane1Resource1">
                                        <Fast:Grid ID="gridOtherMeeting" runat="server" AllowSorting="True" AutoGenerateCheckBoxColumn="True"
                                            AutoGenerateColumns="False" DataKeyNames="MEETING_GUID" Width="100%" AllowPaging="True"
                                            OnRowDataBound="gridOtherMeeting_RowDataBound" OnRowCommand="gridOtherMeeting_RowCommand"
                                            DataSourceID="ObjectDataSource1" DataKeyOnClientWithCheckBox="False" DefaultSortDirection="Ascending"
                                            EnhancePager="True" PageSize="15" EmptyDataText="沒有資料"
                                            KeepSelectedRows="False"  meta:resourcekey="gridOtherMeetingResource3" CustomDropDownListPage="False" SelectedRowColor="" UnSelectedRowColor=""  >
                                            <EnhancePagerSettings ShowHeaderPager="True" FirstAltImageUrl="" FirstImageUrl="" LastAltImage="" LastImageUrl="" NextIAltImageUrl="" NextImageUrl="" PageInfoCssClass="" PageNumberCssClass="" PageNumberCurrentCssClass="" PageRedirectCssClass="" PreviousAltImageUrl="" PreviousImageUrl="" />
                                            <ExportExcelSettings AllowExportToExcel="False" />
                                            <Columns>
                                                <asp:TemplateField HeaderText="主旨" SortExpression="SUBJECT" meta:resourcekey="TemplateFieldResource3">
                                                    <ItemTemplate>
                                                        <asp:LinkButton runat="server" ID="btnViewOther" Text='<%#: Eval("SUBJECT") %>' meta:resourcekey="btnViewOtherResource2"></asp:LinkButton>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="開始時間" SortExpression="START_TIME" meta:resourcekey="BoundFieldResource9">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblStartTime" runat="server"></asp:Label>
                                                    </ItemTemplate>
                                                    <HeaderStyle Width="120px" Wrap="false"/>
                                                    <ItemStyle Width="120px" Wrap="false"/>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="結束時間" SortExpression="END_TIME" meta:resourcekey="BoundFieldResource10">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblEndTime" runat="server"></asp:Label>
                                                    </ItemTemplate>
                                                    <HeaderStyle Width="120px" Wrap="false"/>
                                                    <ItemStyle Width="120px" Wrap="false"/>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="召集人" SortExpression="CREATE_USER" meta:resourcekey="BoundFieldResource11">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblCreateUser" runat="server"></asp:Label>
                                                    </ItemTemplate>
                                                    <HeaderStyle Width="150px" />
                                                    <ItemStyle Width="150px" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="狀態" SortExpression="REPLY_STATE" meta:resourcekey="BoundFieldResource12">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblReplyState" runat="server"></asp:Label>
                                                    </ItemTemplate>
                                                    <HeaderStyle Width="80px" />
                                                    <ItemStyle Width="80px" />
                                                </asp:TemplateField>
                                            </Columns>
                                        </Fast:Grid>

                                        <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" OldValuesParameterFormatString="original_{0}"
                                            SelectMethod="GetAllMeetingInvited" TypeName="Ede.Uof.EIP.Schedule.Meeting.MeetingManagementUCO">
                                            <SelectParameters>
                                                <asp:ControlParameter ControlID="lbUserGuid" Name="userGUID" PropertyName="Text" Type="String" />
                                            </SelectParameters>
                                        </asp:ObjectDataSource>
                                    </telerik:RadPane>
                                </telerik:RadSplitter>
                                <telerik:RadSplitter ID="Radsplitter91" runat="server" Orientation="Horizontal" PanesBorderSize="0" Height="100%"
                                    BorderSize="0" LiveResize="True" Visible="False" meta:resourcekey="Radsplitter91Resource1" SplitBarsSize="">
                                    <telerik:RadPane ID="Radpane19" runat="server" Index="0" meta:resourcekey="Radpane19Resource1">
                                        <Fast:Grid ID="Grid5" runat="server" AllowSorting="True" AutoGenerateCheckBoxColumn="True"
                                            AutoGenerateColumns="False" DataKeyNames="MEETING_GUID" Width="100%" AllowPaging="True"
                                            DataSourceID="ObjectDataSource2" EmptyDataText="沒有資料" OnRowDataBound="Grid5_RowDataBound"
                                            OnRowCommand="Grid5_RowCommand" DataKeyOnClientWithCheckBox="True" DefaultSortDirection="Ascending"
                                            EnhancePager="True" meta:resourcekey="Grid5Resource2" PageSize="15"
                                            KeepSelectedRows="False"   >
                                            <EnhancePagerSettings ShowHeaderPager="True" FirstAltImageUrl="" FirstImageUrl="" LastAltImage="" LastImageUrl="" NextIAltImageUrl="" NextImageUrl="" PageInfoCssClass="" PageNumberCssClass="" PageNumberCurrentCssClass="" PageRedirectCssClass="" PreviousAltImageUrl="" PreviousImageUrl="" />
                                            <ExportExcelSettings AllowExportToExcel="False" />
                                            <Columns>
                                                <asp:TemplateField HeaderText="主旨" SortExpression="SUBJECT" meta:resourcekey="TemplateFieldResource4">
                                                    <ItemTemplate>
                                                        <asp:LinkButton runat="server" ID="btnViewMine" Text='<%#: Eval("SUBJECT") %>' meta:resourcekey="btnViewMineResource2"></asp:LinkButton>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="開始時間" SortExpression="START_TIME" meta:resourcekey="BoundFieldResource13">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblStartTime" runat="server"></asp:Label>
                                                    </ItemTemplate>
                                                    <HeaderStyle Width="120px" />
                                                    <ItemStyle Width="120px" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="結束時間" SortExpression="END_TIME" meta:resourcekey="BoundFieldResource14">
                                                    <ItemTemplate>    
                                                        <asp:Label ID="lblEndTime" runat="server"></asp:Label>
                                                    </ItemTemplate>
                                                    <HeaderStyle Width="120px" />
                                                    <ItemStyle Width="120px" />
                                                </asp:TemplateField>
                                                <asp:BoundField DataField="LOCATION" HeaderText="地點" SortExpression="LOCATION" meta:resourcekey="BoundFieldResource15">
                                                    <HeaderStyle Width="180px" />
                                                    <ItemStyle Width="180px" />
                                                </asp:BoundField>
                                                <asp:BoundField HeaderText="人數" DataField="USER_COUNT" SortExpression="USER_COUNT" meta:resourcekey="BoundFieldResource16">
                                                    <HeaderStyle Width="50px" />
                                                    <ItemStyle Width="50px" />
                                                </asp:BoundField>
                                            </Columns>
                                        </Fast:Grid>
                                        <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" OldValuesParameterFormatString="original_{0}"
                                            SelectMethod="GetAllMyMeeting" TypeName="Ede.Uof.EIP.Schedule.Meeting.MeetingManagementUCO">
                                            <SelectParameters>
                                                <asp:ControlParameter ControlID="lbUserGuid" Name="userGUID" PropertyName="Text" Type="String" />
                                            </SelectParameters>
                                        </asp:ObjectDataSource>
                                    </telerik:RadPane>
                                </telerik:RadSplitter>
                                <telerik:RadSplitter ID="Radsplitter92" runat="server" Orientation="Horizontal" PanesBorderSize="0" Height="100%"
                                    BorderSize="0" LiveResize="True" Visible="False" meta:resourcekey="Radsplitter92Resource1" SplitBarsSize="">
                                    <telerik:RadPane ID="Radpane2" runat="server" Index="0" meta:resourcekey="Radpane2Resource1">
                                        <Fast:Grid ID="grdOtherInquiry" runat="server" AllowSorting="True" AutoGenerateCheckBoxColumn="True"
                                            AutoGenerateColumns="False" DataKeyNames="INQUIRY_GUID" Width="100%" AllowPaging="True"
                                            DataSourceID="ObjectDataSource4" DataKeyOnClientWithCheckBox="False" EnhancePager="True"
                                            PageSize="15" OnRowCommand="grdOtherInquiry_RowCommand" OnRowDataBound="grdOtherInquiry_RowDataBound"
                                            DefaultSortDirection="Ascending"  EmptyDataText="沒有資料" KeepSelectedRows="False" meta:resourcekey="grdOtherInquiryResource2"  >
                                            <EnhancePagerSettings ShowHeaderPager="True" />
                                            <ExportExcelSettings AllowExportToExcel="False" />
                                            <Columns>
                                                <asp:TemplateField HeaderText="主旨" SortExpression="SUBJECT" meta:resourcekey="TemplateFieldResource5">
                                                    <ItemTemplate>
                                                        <asp:LinkButton runat="server" ID="btnViewMine" Text='<%#: Eval("SUBJECT") %>' meta:resourcekey="btnViewMineResource3"></asp:LinkButton>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="徵詢截止時間" SortExpression="INQUIRY_DEADLINE" meta:resourcekey="BoundFieldResource17">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblInquiryDeadline" runat="server" ></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="召集人" SortExpression="CREATE_USER" meta:resourcekey="TemplateFieldResource6">
                                                    <ItemTemplate>
                                                        <asp:LinkButton ID="lbtnCreateUser" runat="server" Text='<%# Eval("CREATE_USER") %>' meta:resourcekey="lbtnCreateUserResource1"></asp:LinkButton>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="會議狀態" meta:resourcekey="TemplateFieldResource7">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblState" runat="server" meta:resourcekey="lblStateResource1"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                            </Columns>
                                        </Fast:Grid>
                                        <asp:ObjectDataSource ID="ObjectDataSource4" runat="server" OldValuesParameterFormatString="original_{0}"
                                            SelectMethod="GetAllInquiryInvited" TypeName="Ede.Uof.EIP.Schedule.Meeting.InquiryManagementUCO">
                                            <SelectParameters>
                                                <asp:ControlParameter ControlID="lbUserGuid" Name="userGUID" PropertyName="Text" Type="String" />
                                            </SelectParameters>
                                        </asp:ObjectDataSource>
                                    </telerik:RadPane>
                                </telerik:RadSplitter>
                                <telerik:RadSplitter ID="Radsplitter93" runat="server" Orientation="Horizontal" PanesBorderSize="0" Height="100%"
                                    BorderSize="0" LiveResize="True" Visible="False" meta:resourcekey="Radsplitter93Resource1" SplitBarsSize="">

                                    <telerik:RadPane ID="Radpane21" runat="server" Index="0" meta:resourcekey="Radpane21Resource1">
                                        <Fast:Grid ID="grdMyInquiry" runat="server" AllowSorting="True" AutoGenerateCheckBoxColumn="True"
                                            AutoGenerateColumns="False" DataKeyNames="INQUIRY_GUID" Width="100%" AllowPaging="True"
                                            DataKeyOnClientWithCheckBox="False" DataSourceID="ObjectDataSource3" PageSize="15"
                                            EnhancePager="True" OnRowDataBound="grdMyInquiry_RowDataBound" OnRowCommand="grdMyInquiry_RowCommand"
                                            DefaultSortDirection="Ascending" EmptyDataText="沒有資料"
                                            KeepSelectedRows="False"  meta:resourcekey="grdMyInquiryResource2"  >
                                            <EnhancePagerSettings ShowHeaderPager="True" />

                                            <ExportExcelSettings AllowExportToExcel="False" />
                                            <Columns>
                                                <asp:TemplateField HeaderText="主旨" SortExpression="SUBJECT" meta:resourcekey="TemplateFieldResource8">
                                                    <ItemTemplate>
                                                        <asp:LinkButton runat="server" ID="btnViewMine" Text='<%#: Eval("SUBJECT") %>' meta:resourcekey="btnViewMineResource4"></asp:LinkButton>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="徵詢截止時間" SortExpression="INQUIRY_DEADLINE" meta:resourcekey="BoundFieldResource18">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblInquiryDeadline" runat="server" ></asp:Label>
                                                    </ItemTemplate>
                                                    <HeaderStyle Width="120px" />
                                                    <ItemStyle Width="120px" Wrap="false" />
                                                </asp:TemplateField>
                                                <asp:BoundField DataField="LOCATION" HeaderText="地點" SortExpression="LOCATION" meta:resourcekey="BoundFieldResource19">
                                                    <HeaderStyle Width="180px" />
                                                    <ItemStyle Width="180px" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="USER_COUNT" HeaderText="回覆人數" SortExpression="USER_COUNT" meta:resourcekey="BoundFieldResource20">
                                                    <HeaderStyle Width="80px" />
                                                    <ItemStyle Width="80px" />
                                                </asp:BoundField>
                                                <asp:TemplateField HeaderText="會議狀態" meta:resourcekey="TemplateFieldResource9">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblMeeting" runat="server" Text='<%# Eval("MEETING") %>' meta:resourcekey="lblMeetingResource1"></asp:Label>
                                                    </ItemTemplate>
                                                    <HeaderStyle Width="80px" />
                                                    <ItemStyle Width="80px" />
                                                </asp:TemplateField>
                                            </Columns>
                                        </Fast:Grid>

                                        <asp:ObjectDataSource ID="ObjectDataSource3" runat="server" OldValuesParameterFormatString="original_{0}"
                                            SelectMethod="GetAllMyInquiry" TypeName="Ede.Uof.EIP.Schedule.Meeting.InquiryManagementUCO">
                                            <SelectParameters>
                                                <asp:ControlParameter ControlID="lbUserGuid" Name="userGUID" PropertyName="Text" Type="String" />
                                            </SelectParameters>
                                        </asp:ObjectDataSource>
                                    </telerik:RadPane>
                                </telerik:RadSplitter>
                            </telerik:RadPane>
                        </telerik:RadSplitter>
                    </telerik:RadPane>
                </telerik:RadSplitter>

            </telerik:RadPane>
        </telerik:RadSplitter>
        <asp:Button ID="Button1" runat="server" Style="display:none;" OnClick="Button1_Click"/>
        <asp:HiddenField ID="hidIsOpened" runat="server" />
        <asp:HiddenField ID="hidMeeting" runat="server" />
    </ContentTemplate>
</asp:UpdatePanel>
<asp:Label ID="lbUserGuid" runat="server" Visible="False" meta:resourcekey="lbUserGuidResource2"></asp:Label>
<br />

<asp:Label ID="msgCancelconfirm" runat="server" Text="確定要取消?" Visible="False" meta:resourcekey="msgCancelconfirmResource2"></asp:Label>
<asp:Label ID="msgExport" runat="server" Text="請選擇要匯出的會議" Visible="False" meta:resourcekey="msgExportResource2"></asp:Label>
<asp:Label ID="lblCheckConnection" runat="server" Text="異動線上會議失敗。請檢查Meeting Server的連線資訊是否正確，包含位置、帳號及密碼！(請注意Meeting Server的帳號不能被停用)" Visible="False" meta:resourcekey="lblCheckConnectionResource1"></asp:Label>
<asp:Label ID="lblMeetingConnectionError" runat="server" Text="呼叫WebService失敗。請檢查Meeting Server的連線資訊是否正確，包含位置、帳號及密碼！(請注意Meeting Server的帳號不能被停用)" Visible="False" meta:resourcekey="lblMeetingConnectionErrorResource1"></asp:Label>
<asp:Label ID="lblDeleteMeetingError" runat="server" Text="刪除會議失敗!!" Visible="False" meta:resourcekey="lblDeleteMeetingErrorResource1"></asp:Label>
<asp:Label ID="lblNoConvene" runat="server" Text="未召開" Visible="False" meta:resourcekey="lblNoConveneResource1"></asp:Label>
<asp:Label ID="lblConvene" runat="server" Text="已召開" Visible="False" meta:resourcekey="lblConveneResource1"></asp:Label>
<asp:Label ID="lblNoReply" runat="server" Text="尚未回覆" Visible="False" meta:resourcekey="lblNoReplyResource1"></asp:Label>
<asp:Label ID="lblNoJoin" runat="server" Text="不參加" Visible="False" meta:resourcekey="lblNoJoinResource1"></asp:Label>
<asp:Label ID="lblJoin" runat="server" Text="參加" Visible="False" meta:resourcekey="lblJoinResource1"></asp:Label>
<asp:Label ID="lblReplyInquiry" runat="server" Text="回覆徵詢" Visible="False" meta:resourcekey="lblReplyInquiryResource1"></asp:Label>
<asp:HiddenField ID="hideMeetingTab" runat="server" />
<asp:HiddenField ID="hideMeetingIDs" runat="server" />

