<%@ Page Language="C#" MasterPageFile="~/Master/OneColumn.master" AutoEventWireup="true" Inherits="EIP_Calendar_Default" Title="行事曆" EnableEventValidation="false" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" Codebehind="Default.aspx.cs" %>

<%--<%@ Register Assembly="System.Web.Extensions" Namespace="System.Web.UI" TagPrefix="asp" %>--%>
<%@ Register Src="Common/UC_DeptHolidayList.ascx" TagName="UC_DeptHolidayList" TagPrefix="uc11" %>
<%@ Register Src="../OrganizationCalendar/Common/UC_EventList.ascx" TagName="UC_EventList" TagPrefix="uc10" %>
<%@ Register Src="Common/UC_MonthListWithMenu.ascx" TagName="UC_MonthListWithMenu" TagPrefix="uc3" %>
<%@ Register Src="Common/UC_MeetingList.ascx" TagName="UC_MeetingList" TagPrefix="uc7" %>
<%@ Register Src="Common/UC_HolidayList.ascx" TagName="UC_HolidayList" TagPrefix="uc8" %>
<%@ Register Src="Common/UC_DevolveList.ascx" TagName="UC_DevolveList" TagPrefix="uc9" %>
<%@ Register Src="Common/UC_MemoList.ascx" TagName="UC_MemoList" TagPrefix="uc6" %>
<%@ Register Src="Common/UC_BorrowList.ascx" TagName="UC_BorrowList" TagPrefix="uc5" %>
<%@ Register Src="Common/UC_WeekList.ascx" TagName="UC_WeekList" TagPrefix="uc2" %>
<%@ Register Src="Common/UC_WorkList.ascx" TagName="UC_WorkList" TagPrefix="uc4" %>
<%@ Register Src="Common/UC_DayList.ascx" TagName="UC_DayList" TagPrefix="uc1" %>
<%@ Register Src="Common/UC_MoreMeetingList.ascx" TagPrefix="uc10" TagName="UC_MoreMeetingList" %>
<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ScriptContentPlaceHolder" runat="Server">
   
    <style>
       .work-line {
            text-decoration:line-through !important; 
        }
        .work-line-off {
        text-decoration:none;
        }
         .IsCompleteWorkNolink
        {
          color:orange ;    
        }   
         a.IsCompleteWork:link
        {
          color:orange ;    
        }   
    </style>
    <script type="text/javascript">
        Sys.Application.add_load(function () {
            var is_Editable = "<%=Request.QueryString["isEditable"]%>";
            //連結會議清單 與 被徵詢 需放入自己的UC 做開窗 否則無法更新畫面
            //其中加入tbx_HiddenField 的目的是用來限定利用傳過來的參數,只可以開窗一次,以避免切換tab時,又造成開窗
            <%--//連結會議清單     
            var Meet_Guid = "<%=Request.QueryString["MeetGuid"]%>";
            if ((Meet_Guid != "") & ($("#<%=tbx_HiddenField.ClientID%>").val() == 'True')) {
                $("#<%=tbx_HiddenField.ClientID%>").val('False');
               
                $uof.dialog.open2("~/EIP/Calendar/CreateMeeting.aspx", "", "", 950, 700,
                    function (returnValue) {
                        if (returnValue == null || typeof (returnValue) == 'undefined') { return false ;}
                             $("#<%=Button1.ClientID%>").click();
                       
                      
                    },
                    { "MeetingGuid": Meet_Guid, "isEditable": is_Editable, "IsMyMeeting": "0", "isFromLink": "True" });
            }
            //連結會議清單的被徵詢
            var Inquiry_Guid = "<%=Request.QueryString["InquiryGuid"]%>";
            if ((Inquiry_Guid != "") & ($("#<%=tbx_HiddenField.ClientID%>").val() == 'True')) {
                $("#<%=tbx_HiddenField.ClientID%>").val('False');

                $uof.dialog.open2("~/EIP/Calendar/ReplyInquiry.aspx", "", "", 950, 600,
                    function (returnValue) { if (returnValue == null || typeof (returnValue) == 'undefined') { return false } return true },
                    { "InquiryGuid": Inquiry_Guid });
            }--%>
            //連結工作清單
            var work_id = "<%=Request.QueryString["workid"]%>";
            var Owner_Guid = "<%=Request.QueryString["OwnerGuid"]%>";
            if ((work_id != "") & (Owner_Guid != "") & ($("#<%=tbx_HiddenField.ClientID%>").val() == 'True')) {
                $("#<%=tbx_HiddenField.ClientID%>").val('False');

                //避免訊息連結被他人取得, 直接進入工作頁
                if ($("#<%=hfCurrentUser.ClientID%>").val() == "<%=Request.QueryString["OwnerGuid"]%>") {
                    $uof.dialog.open2("~/EIP/Calendar/WorkDetail.aspx", "", "", 600, 650,
                        function (returnValue) { if (returnValue == null || typeof (returnValue) == 'undefined') { return false } return true },
                        { "workid": work_id, "OwnerGuid": Owner_Guid, "isEditable": is_Editable });
                }
                else {
                    alert($("#<%=lblNotAllowViewWork.ClientID%>").text());
                }
            }
            //連結交辦清單
            var devolveGuid = "<%=Request.QueryString["devolveGuid"]%>";
            var Owner_Guid = "<%=Request.QueryString["OwnerGuid"]%>";
            if ((devolveGuid != "") & (Owner_Guid != "") & ($("#<%=tbx_HiddenField.ClientID%>").val() == 'True')) {
                $("#<%=tbx_HiddenField.ClientID%>").val('False');

                $uof.dialog.open2("~/EIP/Calendar/CreateDevolve.aspx", "", "", 460, 520,
                    function (returnValue) { if (returnValue == null || typeof (returnValue) == 'undefined') { return false } return true },
                    { "devolveGuid": devolveGuid, "OwnerGuid": Owner_Guid, "isEditable": is_Editable});
            }
        });

        function SetTabsVisible(isVisible) {
            var webTab = $find("<%=rts1.ClientID %>");
            if (webTab.get_allTabs().length > 3) {
                for (var i = 3; i <= 11; i++) {
                    webTab.get_allTabs()[i].set_visible(isVisible);
                }
            }
        }
        function AddOtherCalenderSiteMap() {
            var name = '<%=Ede.Uof.Utility.Page.Common.Resource.GetLocalResource("MaintainOtherCalender") %>';
            AddSiteMapNode(name);
        }
        function AddManyOthersCalendarSiteMap() {
            var name = '<%=Ede.Uof.Utility.Page.Common.Resource.GetLocalResource("ManyOthersCalendar") %>';
        AddSiteMapNode(name);
    }
    function AddActiveTabText() {
        var webTab = $find("<%=rts1.ClientID %>");
       var activeTab = webTab.get_selectedTab();
       if (activeTab != null) {
           AddSiteMapNode(activeTab.get_text());
       }
   }
   function rts1_TabSelecting(sender, args) {
       $("#<%= hidPreviousTab.ClientID%>").val(sender.get_selectedTab().get_value());
   }


        function onclientresize(width, height) {
            
                var splitter = $find("<%= Radsplitter1.ClientID %>");
                splitter.set_height(height - 1);
            
        }


    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
    <telerik:RadSplitter ID="Radsplitter1" runat="server" Orientation="Horizontal"
        Width="100%" PanesBorderSize="0" Height="100%"
        BorderSize="0" LiveResize="True" ResizeWithParentPane="True"
        ResizeWithBrowserWindow="True">
        <telerik:RadPane ID="toolbarPane" runat="server" Height="26" Locked="true">
            <telerik:RadTabStrip ID="rts1" MultiPageID="rmp1" runat="server" OnTabClick="rts1_TabClick" OnClientTabSelecting="rts1_TabSelecting" meta:resourcekey="rts1Resource1" SelectedIndex="0">
                <Tabs>
                    <telerik:RadTab runat="server" Text="日" Value="Day" PageViewID="rpvDay" meta:resourcekey="RadTabResource1" Selected="True">
                    </telerik:RadTab>
                    <telerik:RadTab runat="server" Text="週" Value="Week" PageViewID="rpvWeek" meta:resourcekey="RadTabResource2">
                    </telerik:RadTab>
                    <telerik:RadTab runat="server" Text="月" Value="Month" PageViewID="rpvMonth" meta:resourcekey="RadTabResource3">
                    </telerik:RadTab>
                    <telerik:RadTab runat="server" Text="工作清單" Value="WorkList" PageViewID="rpvWorkList" meta:resourcekey="RadTabResource4">
                    </telerik:RadTab>
                    <telerik:RadTab runat="server" Text="借用清單" Value="BorrowList" PageViewID="rpvBorrowList" meta:resourcekey="RadTabResource5">
                    </telerik:RadTab>
                    <telerik:RadTab runat="server" Text="備忘清單" Value="ReminderList" PageViewID="rpvReminderList" meta:resourcekey="RadTabResource6">
                    </telerik:RadTab>
                    <telerik:RadTab runat="server" Text="會議清單" Value="MeetingList" PageViewID="rpvMeetingList" meta:resourcekey="RadTabResource7">
                    </telerik:RadTab>
                    <telerik:RadTab runat="server" Text="週期會議清單" Value="MoreMeetingList" PageViewID="rpvMoreMeetingList" meta:resourcekey="RadTabResource12">
                    </telerik:RadTab>
                    <telerik:RadTab runat="server" Text="個人休假" Value="HolidayList" PageViewID="rpvHolidayList" meta:resourcekey="RadTabResource8">
                    </telerik:RadTab>
                    <telerik:RadTab runat="server" Text="交辦事項" Value="DevolveList" PageViewID="rpvDevolveList" meta:resourcekey="RadTabResource9">
                    </telerik:RadTab>
                    <telerik:RadTab runat="server" Text="組織事件" Value="DepartmentList" PageViewID="rpvDepartmentList" meta:resourcekey="RadTabResource10">
                    </telerik:RadTab>
                    <telerik:RadTab runat="server" Text="組織休假" Value="DeptHolidayList" PageViewID="rpvDeptHolidayList" meta:resourcekey="RadTabResource11">
                    </telerik:RadTab>
                </Tabs>
            </telerik:RadTabStrip>
        </telerik:RadPane>


        <telerik:RadPane ID="RadPane2" runat="server" Height="100%">
            <telerik:RadMultiPage ID="rmp1" runat="server" meta:resourcekey="rmp1Resource1" SelectedIndex="0">
                <telerik:RadPageView ID="rpvDay" runat="server" meta:resourcekey="rpvDayResource1">
                </telerik:RadPageView>
                <telerik:RadPageView ID="rpvWeek" runat="server" meta:resourcekey="rpvWeekResource1">
                </telerik:RadPageView>
                <telerik:RadPageView ID="rpvMonth" runat="server" meta:resourcekey="rpvMonthResource1">
                </telerik:RadPageView>
                <telerik:RadPageView ID="rpvWorkList" runat="server" meta:resourcekey="rpvWorkListResource1">
                </telerik:RadPageView>
                <telerik:RadPageView ID="rpvBorrowList" runat="server" meta:resourcekey="rpvBorrowListResource1">
                </telerik:RadPageView>
                <telerik:RadPageView ID="rpvReminderList" runat="server" meta:resourcekey="rpvReminderListResource1">
                </telerik:RadPageView>
                <telerik:RadPageView ID="rpvMeetingList" runat="server" meta:resourcekey="rpvMeetingListResource1">
                </telerik:RadPageView>
                <telerik:RadPageView ID="rpvMoreMeetingList" runat="server">
                </telerik:RadPageView>
                <telerik:RadPageView ID="rpvHolidayList" runat="server" meta:resourcekey="rpvHolidayListResource1">
                </telerik:RadPageView>
                <telerik:RadPageView ID="rpvDevolveList" runat="server" meta:resourcekey="rpvDevolveListResource1">
                </telerik:RadPageView>
                <telerik:RadPageView ID="rpvDepartmentList" runat="server" meta:resourcekey="rpvDepartmentListResource1">
                </telerik:RadPageView>
                <telerik:RadPageView ID="rpvDeptHolidayList" runat="server" meta:resourcekey="rpvDeptHolidayListResource1">
                </telerik:RadPageView>

            </telerik:RadMultiPage>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <asp:Label ID="lbUserGuid" runat="server" Visible="False" meta:resourcekey="lbUserGuidResource1"></asp:Label>
                    <asp:HiddenField ID="Hidden1" runat="server" />
                    <asp:HiddenField ID="Hidden2" runat="server" />
                    <asp:HiddenField ID="hideShowEndDate" runat="server" />
                    <asp:HiddenField ID="hideDisableCreate" runat="server" />
                    <asp:HiddenField ID="HiddenSelectedTime" runat="server" />
                    <asp:HiddenField ID="hfOwnerGuid" runat="server" />
                    <asp:HiddenField ID="hideWhosCalendar" runat="server" />

                    <asp:Label ID="lbMeetingType" runat="server" meta:resourceKey="lbMeetingTypeResource1" Visible="False"></asp:Label>
                    <br />
                    <asp:HiddenField ID="hiddenXML" runat="server" />
                    <asp:HiddenField ID="hiddenDecodeXML" runat="server" />
                    <asp:HiddenField ID="hiddenTabClick" runat="server" />
                    <asp:HiddenField ID="hiddenTabListClick" runat="server" />
                    <asp:HiddenField ID="hfSaveTypes" runat="server"  />
                    <asp:Button ID="Button1" runat="server" Text="Button" Style="display:none" OnClick="Button1_Click" />
                </ContentTemplate>
            </asp:UpdatePanel>
            <asp:Label ID="lblTitleCreateMoreMeeting" runat="server" Text="新增週期會議" Visible="False" meta:resourcekey="lblTitleCreateMoreMeetingResource1"></asp:Label>
            <asp:Label ID="lblNotAllowViewWork" runat="server" Text="工作負責人與登入者不一致,不允許觀看" Style="display:none;" meta:resourcekey="lblNotAllowViewWorkResource1"></asp:Label>
            <asp:HiddenField ID="hidPreviousTab" Value="True" runat="server" />
            <asp:HiddenField ID="tbx_HiddenField" Value="True" runat="server" />
            <asp:HiddenField ID="hfMeetingListBind" runat="server" />
            <asp:HiddenField ID="hidReturnValue" runat="server" Value="NeedPostBack" />
            <asp:HiddenField ID="hfCurrentUser" runat="server" Value="NeedPostBack" />           
        </telerik:RadPane>

    </telerik:RadSplitter>
</asp:Content>
