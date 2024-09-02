<%@ Page Language="C#" MasterPageFile="~/Master/TwoColumn.master" AutoEventWireup="true" Inherits="EIP_OrganizationCalendar_Default" Title="組織行事曆" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" Codebehind="Default.aspx.cs" %>

<%@ Register Src="../Calendar/Common/UC_MonthList.ascx" TagName="UC_MonthList" TagPrefix="uc6" %>
<%@ Register Src="Common/UC_EventList.ascx" TagName="UC_EventList" TagPrefix="uc5" %>
<%@ Register Src="Common/UC_HolidayList.ascx" TagName="UC_HolidayList" TagPrefix="uc4" %>
<%@ Register Src="Common/UC_WorkingTime.ascx" TagName="UC_WorkingTime" TagPrefix="uc3" %>
<%@ Register Src="../../Common/ChoiceCenter/UC_ChoiceList.ascx" TagName="UC_ChoiceList" TagPrefix="uc1" %>
<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ScriptContentPlaceHolder" runat="Server">
    <script>

        function GetDialogStr(Key, args) {

            var date = $("#<%=Hidden1.ClientID%>").val();
            var groupid = $("#<%=hidguid.ClientID%>").val();

            if (Key == 'CreateOrgEvent') {
                $uof.dialog.open2("~/EIP/OrganizationCalendar/CreateEvent.aspx", args, "", 500, 550,
                            function (returnValue) {
                                if (typeof (returnValue) == 'undefined' || returnValue == null)
                                    return false;
                                else {
                                    setTimeout(function () {
                                        $('form').submit();
                                    }, 500);
                                }
                            },
                            { 'Date': date, 'groupid': groupid }
               );
            }
            else if (Key == 'CreateOrgHoliday') {
                $uof.dialog.open2("~/EIP/OrganizationCalendar/CreateHoliday.aspx", args, "", 1350, 450,
                            function (returnValue) {
                                if (typeof (returnValue) == 'undefined' || returnValue == null)
                                    return false;
                                else {
                                    setTimeout(function () {
                                        $('form').submit();
                                    }, 500);
                                }
                            },
                            { 'Date': date, 'groupid': groupid });
            }

            return false;
        }

        function rts1_TabSelecting(sender, args) {
            var tabIndex = args.get_tab().get_index();
            if (tabIndex != 0) {
                HideAnyPopups();
            }
        }

          function RadTreeView1_Selected(sender, args) {
              var node = args.get_node().get_index();
              if (node != undefined || node != null) {
                HideAnyPopups();
            }
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ToolbarContentPlaceHolder" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="LeftContentPlaceHolder" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div style="padding-left:5px">
                <asp:CheckBox ID="chbDisplayAllDept" s runat="server" Text="顯示已停用部門" AutoPostBack="true" OnCheckedChanged="chbDisplayAllDept_CheckedChanged" meta:resourcekey="chbDisplayAllDeptResource1" />            
            </div>
            <div>
                <telerik:RadTreeView ID="RadTreeView1" runat="server" OnClientNodeClicked="RadTreeView1_Selected"
                OnNodeClick="RadTreeView1_NodeClick" EnableNodeTextHtmlEncoding="True"
                meta:resourcekey="RadTreeView1Resource1">
                </telerik:RadTreeView>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="RightContentPlaceHolder" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel4" runat="server">
        <ContentTemplate>            
            <table border="0" cellpadding="0" cellspacing="0" width="100%">
                <tr>
                    <td>
                         <asp:CustomValidator ID="cvNoPermission" runat="server" Display="Dynamic" ErrorMessage="無觀看權限"
                                    meta:resourcekey="cvNoPermissionResource1">
                         </asp:CustomValidator>
                    </td>
                </tr>
                <tr>
                    <td style="vertical-align: top; height: 100%;width:80%">
                        <telerik:RadTabStrip ID="rstTab" MultiPageID="rmp" runat="server"
                            SelectedIndex="0" OnPreRender="rstTab_PreRender" OnClientTabSelecting="rts1_TabSelecting"
                            OnTabClick="rstTab_TabClick" meta:resourcekey="rstTabResource1">
                            <Tabs>
                                <telerik:RadTab runat="server" Value="Calendar" Selected="True"
                                    meta:resourcekey="RadTabResource1" Owner="">
                                </telerik:RadTab>
                                <telerik:RadTab runat="server" Value="EventList"
                                    meta:resourcekey="RadTabResource2" Owner="">
                                </telerik:RadTab>
                                <telerik:RadTab runat="server" Value="HolidayList"
                                    meta:resourcekey="RadTabResource3" Owner="">
                                </telerik:RadTab>
                                <telerik:RadTab runat="server" Value="WorkingTime" Visible="false"
                                    meta:resourcekey="RadTabResource4" Owner="">
                                </telerik:RadTab>
                                <telerik:RadTab runat="server" Value="Authority"
                                    meta:resourcekey="RadTabResource5" Owner="">
                                </telerik:RadTab>
                            </Tabs>
                        </telerik:RadTabStrip>
                        <telerik:RadMultiPage ID="rmp" runat="server"
                            SelectedIndex="0" meta:resourcekey="rmpResource1">
                            <telerik:RadPageView ID="rpvCalendar" runat="server"
                                meta:resourcekey="rpvCalendarResource1" Selected="True">
                                <uc6:UC_MonthList ID="UC_MonthList1" runat="server" />
                            </telerik:RadPageView>
                            <telerik:RadPageView ID="rpvEventList" runat="server"
                                meta:resourcekey="rpvEventListResource1">
                                <uc5:UC_EventList ID="UC_EventList1" runat="server" />
                            </telerik:RadPageView>
                            <telerik:RadPageView ID="rpvHolidayList" runat="server"
                                meta:resourcekey="rpvHolidayListResource1">
                                <uc4:UC_HolidayList ID="UC_HolidayList1" runat="server" />
                            </telerik:RadPageView>
                            <telerik:RadPageView ID="rpvWorkingTime" runat="server"
                                meta:resourcekey="rpvWorkingTimeResource1">
                                <uc3:UC_WorkingTime ID="UC_WorkingTime1" runat="server" />
                            </telerik:RadPageView>
                            <telerik:RadPageView ID="rpvAuthority" runat="server"
                                meta:resourcekey="rpvAuthorityResource1">
                                <asp:CustomValidator ID="CustomValidator1" runat="server" Display="Dynamic" ErrorMessage="沒有設定的權限"
                                    meta:resourcekey="CustomValidator1Resource1"></asp:CustomValidator>
                                <uc1:UC_ChoiceList ID="UC_ChoiceList1" runat="server" />
                            </telerik:RadPageView>
                        </telerik:RadMultiPage>
                    </td>
                </tr>
            </table>
            <input id="hideGroupid" runat="server" type="hidden" />
            <input id="Hidden1" runat="server" type="hidden" />
            <input id="Hidden2" runat="server" type="hidden" />            
            <asp:HiddenField ID="hiditem" runat="server" />    
            <asp:HiddenField ID="hidguid" runat="server" />
        </ContentTemplate>
    </asp:UpdatePanel>

    <div class="contextMenu" id="contextRoleC" style="display: none; left: 870px; top: 69px;">
        <table cellspacing="0" cellpadding="0" border="0">
            <tbody>
                <tr>
                    <td align="center" colspan="2" style="background-color: darkolivegreen" valign="top">
                        <nobr><SPAN style="COLOR: #ffffff"><asp:Label id="Label2" runat="server" Text="新增" meta:resourcekey="Label2Resource1"></asp:Label></SPAN></nobr>
                    </td>
                </tr>
                <tr>
                    <td class="menuItem" onclick="SetDialogType('DialogOrgEvent')" valign="top" style="background-color: #ececec">
                        <table cellpadding="0" cellspacing="0" border="0" width="100%">
                            <tr>
                                <td width="3" runat="server" id="MenuEvent">&nbsp;
                                </td>
                                <td style=" white-space:nowrap;">&nbsp;<asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="#" Text="事件" meta:resourcekey="HyperLink1Resource1"></asp:HyperLink>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td class="menuItem" onclick="SetDialogType('DialogOrgHoliday')" valign="top" style="background-color: #ececec">
                        <table cellpadding="0" cellspacing="0" border="0" width="100%">
                            <tr>
                                <td width="3" runat="server" id="MenuCorporationHoliday">&nbsp;
                                </td>
                                <td style=" white-space:nowrap;">&nbsp;<asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="#" Text="假日" meta:resourcekey="HyperLink2Resource1"></asp:HyperLink>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
        </table>
    </div>

    <asp:Label ID="msgCalendar" runat="server" Text="行事曆" Visible="False" meta:resourcekey="msgCalendarResource1"></asp:Label>
    <asp:Label ID="msgEvent" runat="server" Text="事件清單" Visible="False" meta:resourcekey="msgEventResource1"></asp:Label>
    <asp:Label ID="msgHoliday" runat="server" Text="假日清單" Visible="False" meta:resourcekey="msgHolidayResource1"></asp:Label>
    <asp:Label ID="msgWorktime" runat="server" Text="工作時間" Visible="False" meta:resourcekey="msgWorktimeResource1"></asp:Label>
    <asp:Label ID="msgAuthority" runat="server" Text="權限設定" Visible="False" meta:resourcekey="msgAuthorityResource1"></asp:Label>
    <asp:Label ID="lblTitle" Visible="false" runat="server" meta:resourcekey="Label1Resource1" Text="內部組織結構列表"></asp:Label>    
    <asp:HiddenField ID="hfCurrentUser" runat="server" />
    <asp:HiddenField ID="hfIsAdmin" runat="server" />
</asp:Content>
