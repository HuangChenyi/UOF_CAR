<%@ Control Language="C#" AutoEventWireup="true" Inherits="EIP_Calendar_UC_AllScheduleList" Codebehind="UC_AllScheduleList.ascx.cs" %>
<%@ Register Assembly="System.Web.Extensions" Namespace="System.Web.UI" TagPrefix="asp" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>
<%@ Register Assembly="System.Web, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a" Namespace="System.Web.UI.HtmlControls" TagPrefix="cc1" %>
<%@ Register Assembly="System.Web, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a" Namespace="System.Web.UI" TagPrefix="cc2" %>
<style type="text/css">
    .style1
    {
        width: 82%;
    }

    .style2
    {
        width: 14px;
    }

    .style4
    {
        width: 32px;
    }
</style>
<script id="Schedulejs" type="text/javascript">

    function bar3_Click(sander, args) {
        var UserGuid = $uof.tool.htmlDecode('<%=System.Web.Security.AntiXss.AntiXssEncoder.HtmlEncode(Page.User.Identity.Name, true)%>');
        var date = '<%= Ede.Uof.EIP.Organization.Util.UserTime.SetZone(Ede.Uof.EIP.SystemInfo.Current.UserGUID).GetNowForUi().ToString("yyyy/MM/dd HH:mm:dd") %>';
        var key = args.get_item().get_value();
        if (key == "CreateWork") {
            args.set_cancel(true);
            $uof.dialog.open2("~/EIP/Calendar/CreateWork.aspx", args.get_item(), "", 600, 600, openDialogResult, { "OwnerGuid": UserGuid, "Date": date });
        }
        else if (key == "CreateMemo") {
            args.set_cancel(true);
            $uof.dialog.open2("~/EIP/Calendar/CreateReminder.aspx", args.get_item(), "", 600, 550, openDialogResult, { "OwnerGuid": UserGuid, "Date": date });
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
<asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
    <contenttemplate>
        <table width="100%" cellpadding="0" cellspacing="0">
            <tr>
                <td style="height: 30px; vertical-align: top">
                    <telerik:RadToolBar ID="RadToolBar1" Runat="server"  Width="100%"
                        OnClientButtonClicking="bar3_Click" 
                        onbuttonclick="RadToolBar1_ButtonClick" meta:resourcekey="RadToolBar1Resource1">
                        <Items>
                            <telerik:RadToolBarButton runat="server" Text="新增工作" Value="CreateWork"
                                 CheckedImageUrl="~/Common/Images/Icon/icon_m71.png"
                                 DisabledImageUrl="~/Common/Images/Icon/icon_m71.png"
                                 HoveredImageUrl="~/Common/Images/Icon/icon_m71.png"
                                 ImageUrl="~/Common/Images/Icon/icon_m71.png" 
                                meta:resourcekey="RadToolBarButtonResource1" Owner=""
                            >
                            </telerik:RadToolBarButton>
                            <telerik:RadToolBarButton runat="server" IsSeparator="True" Text="Button 1" 
                                meta:resourcekey="RadToolBarButtonResource2" Owner="">
                            </telerik:RadToolBarButton>
                            <telerik:RadToolBarButton runat="server" Text="新增備忘" Value="CreateMemo"
                                CheckedImageUrl="~/Common/Images/Icon/icon_m67.png"
                                 DisabledImageUrl="~/Common/Images/Icon/icon_m67.png"
                                 HoveredImageUrl="~/Common/Images/Icon/icon_m67.png"
                                 ImageUrl="~/Common/Images/Icon/icon_m67.png" 
                                meta:resourcekey="RadToolBarButtonResource3" Owner=""
                            >
                            </telerik:RadToolBarButton>
                            <telerik:RadToolBarButton runat="server" IsSeparator="True" Text="Button 3" 
                                meta:resourcekey="RadToolBarButtonResource4" Owner="">
                            </telerik:RadToolBarButton>
                            <telerik:RadToolBarButton Value="selectDate" runat="server" Text="Button 4" 
                                meta:resourcekey="RadToolBarButtonResource5" Owner="">
                                <ItemTemplate>
                                    <table runat="server">
                                        <tr runat="server">
                                            <td runat="server" class="style2" style="padding-right: 2px;" valign="middle">
                                                <asp:ImageButton ID="igbPre" runat="server" ImageAlign="Middle" 
                                                    ImageUrl="~/EIP/Calendar/images/pre.jpg" OnClick="igbPre_Click" />
                                            </td>
                                            <td runat="server" align="center">
                                                <telerik:RadDatePicker ID="rdpDate" Runat="server" AutoPostBack="True" OnSelectedDateChanged="rdpDate_SelectedDateChanged">
                                                </telerik:RadDatePicker>
                                            </td>
                                            <td runat="server" class="style2" style="padding-left: 2px;" valign="middle">
                                                <asp:ImageButton ID="igbNext" runat="server" ImageAlign="Middle" 
                                                    ImageUrl="~/EIP/Calendar/images/next.jpg" OnClick="igbNext_Click" />
                                            </td>
                                        </tr>
                                    </table>
                                </ItemTemplate>
                            </telerik:RadToolBarButton>
                            <telerik:RadToolBarButton runat="server" IsSeparator="True" Text="Button 5" 
                                meta:resourcekey="RadToolBarButtonResource6" Owner="">
                            </telerik:RadToolBarButton>
                            <telerik:RadToolBarButton runat="server" Text="checkState" Value="checkState" meta:resourcekey="RadToolBarButtonResource7">
                                <ItemTemplate>
                                    <table runat="server">
                                        <tr runat="server">
                                            <td runat="server" style="width:20px;text-align:center">
                                                <asp:CheckBox runat="server" ID="cbState" AutoPostBack="True" OnCheckedChanged="cbState_CheckedChanged"></asp:CheckBox>
                                            </td>
                                            <td runat="server" style="width:80px;text-align:center">
                                                <asp:Label ID="Label3" runat="server" Text="含已完成的工作" meta:resourcekey="Label3Resource1"></asp:Label>
                                            </td>                                            
                                        </tr>
                                    </table>
                                </ItemTemplate>
                            </telerik:RadToolBarButton>
                            <telerik:RadToolBarButton runat="server" IsSeparator="True" Text="Button 6" Owner="" meta:resourcekey="RadToolBarButtonResource8">
                            </telerik:RadToolBarButton>
                        </Items>
                    </telerik:RadToolBar>
                </td>
            </tr>
        </table>
        <Fast:Grid ID="Grid1" runat="server" AllowSorting="True" AutoGenerateCheckBoxColumn="False"
            AutoGenerateColumns="False"  
            ShowHeader="False"  Width="100%" OnRowDataBound="Grid1_RowDataBound"
            BorderStyle="None" BorderWidth="0px" SkinID="HomepageBlockStyle" DataKeyOnClientWithCheckBox="False"
            OnPageIndexChanging="Grid1_PageIndexChanging" DefaultSortDirection="Ascending"
            EnhancePager="True" PageSize="15"  
            EmptyDataText="沒有資料" KeepSelectedRows="False" 
            meta:resourcekey="Grid1Resource2"  >
            <EnhancePagerSettings ShowHeaderPager="True" FirstAltImageUrl="" 
                FirstImageUrl="" LastAltImage="" LastImageUrl="" NextIAltImageUrl="" 
                NextImageUrl="" PageInfoCssClass="" PageNumberCssClass="" 
                PageNumberCurrentCssClass="" PageRedirectCssClass="" PreviousAltImageUrl="" 
                PreviousImageUrl="" />
            <ExportExcelSettings AllowExportToExcel="False" /><Columns>
                <asp:TemplateField meta:resourcekey="TemplateFieldResource1">
                    <ItemTemplate>
                        <table width="100%" border="0">
                            <tr>
                                <td width="16px" style="min-width:16px">
                                    <img height="16px" src="<%=ResolveUrl("~/common/images/icon/icon02.png")%>" width="16px" />
                               </td>
                                <td width="50%">
                                    <asp:LinkButton runat="server" ID="LinkButton1"  Text='<%#: Eval("SUBJECT") %>' meta:resourceKey="LinkButton1Resource1" OnClick="LinkButton1_Click"></asp:LinkButton>
                                </td>
                                <td width="10%">
                                    <asp:Label runat="server" ID="lblScheduletype" meta:resourceKey="lblScheduletypeResource1"></asp:Label>
                                </td>
                                <td width="20%">
                                    <asp:Label runat="server" ID="lblStartTime" Text='<%# Eval("START_TIME") %>' 
                                        meta:resourcekey="lblStartTimeResource1"></asp:Label>
                                </td>
                                <td width="20%" >
                                    <asp:Label runat="server" ID="lblEndTime" Text='<%# Eval("END_TIME") %>' 
                                        meta:resourcekey="lblEndTimeResource1"></asp:Label>
                                </td >
                                <td width="10%" >
                                    <asp:LinkButton runat="server" ID="linkbtnMeeting" Text="線上會議"   
                                        meta:resourceKey="linkbtnMeetingResource1" Visible="False"></asp:LinkButton>
                                </td>
                            </tr>
                        </table>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </Fast:Grid>
    </contenttemplate>
    <triggers>
        <asp:AsyncPostBackTrigger ControlID="RadToolBar1" EventName="ButtonClick" />
    </triggers>
</asp:UpdatePanel>

<asp:Label ID="msgWork" runat="server" Text="工作" Visible="False" meta:resourcekey="msgWorkResource1"></asp:Label>
<asp:Label ID="msgMeeting" runat="server" Text="會議" Visible="False" meta:resourcekey="msgMeetingResource1"></asp:Label>
<asp:Label ID="msgMemo" runat="server" Text="備忘" Visible="False" meta:resourcekey="msgMemoResource1"></asp:Label>
<asp:Label ID="msgDevolve" runat="server" Text="交辦事項" Visible="False" meta:resourcekey="msgDevolveResource1"></asp:Label>
<asp:Label ID="msgBorrow" runat="server" Text="借用" Visible="False" meta:resourcekey="msgBorrowResource1"></asp:Label>
<asp:Label ID="msgMyholiday" runat="server" Text="我的假日" Visible="False" meta:resourcekey="msgMyholidayResource1"></asp:Label>
<asp:Label ID="msgCompanyholiday" runat="server" Text="公司假日" Visible="False" meta:resourcekey="msgCompanyholidayResource1"></asp:Label>
<asp:Label ID="msgCompanyevent" runat="server" Text="公司事件" Visible="False" meta:resourcekey="msgCompanyeventResource1"></asp:Label>
<asp:Label ID="msgCustomSchedule" runat="server" Text="自訂行事曆" Visible="False" meta:resourcekey="msgCustomScheduleResource1"></asp:Label>
<asp:Label ID="msgPmstask" runat="server" Text="專案" Visible="False" meta:resourcekey="msgPmstaskResource1"></asp:Label>
<asp:Label ID="Label1" runat="server" Text="前一天" Visible="False"
    meta:resourcekey="Label1Resource1"></asp:Label>
<asp:Label ID="Label2" runat="server" Text="後一天" Visible="False"
    meta:resourcekey="Label2Resource1"></asp:Label>