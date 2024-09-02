<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UC_MoreMeetingList.ascx.cs" Inherits="Ede.Uof.Web.EIP.Calendar.Common.UC_MoreMeetingList" %>
<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Ede" %>
<script type="text/javascript">
    function ToolBar_Click(sender, args) {
        var key = args.get_item().get_value();
        var UserGuid = '<%=UserGuid%>';
        var date = '<%= Ede.Uof.EIP.Organization.Util.UserTime.SetZone(Ede.Uof.EIP.SystemInfo.Current.UserGUID).GetNowForUi().ToString("yyyy/MM/dd HH:mm:dd") %>';
        args.set_cancel(true);
        if (key === "Creat") {
            $uof.dialog.open2("~/EIP/Calendar/CreateMoreMeeting.aspx", args.get_item(), "", 950, 700, openDialogResult, { "OwnerGuid": UserGuid, "Date": date });
        }
        else if (key === "Delete") {
             if (confirm('<%=msgCancelconfirm.Text%>'))
                args.set_cancel(false);
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
<asp:UpdatePanel ID="udpGrid" runat="server">
    <ContentTemplate>
        <table> 
            <tr>
                <telerik:RadToolBar ID="rdTooBar" runat="server" Width="100%" OnClientButtonClicking="ToolBar_Click" OnButtonClick="rdTooBar_ButtonClick" meta:resourcekey="rdTooBarResource1" SingleClick="None">
                    <Items>
                        <telerik:RadToolBarButton runat="server" Value="Creat" Text="新增週期性會議" 
                            DisabledImageUrl="~/Common/Images/Icon/icon_m04.png" HoveredImageUrl="~/Common/Images/Icon/icon_m04.png" 
                            ImageUrl="~/Common/Images/Icon/icon_m04.png" CheckedImageUrl="~/Common/Images/Icon/icon_m04.png" meta:resourcekey="RadToolBarButtonResource1">
                        </telerik:RadToolBarButton>
                        <telerik:RadToolBarButton runat="server" IsSeparator="True" meta:resourcekey="RadToolBarButtonResource2"></telerik:RadToolBarButton>
                        <telerik:RadToolBarButton runat="server" Value="Delete" Text="取消會議"
                            DisabledImageUrl="~/Common/Images/Icon/icon_m03.png" HoveredImageUrl="~/Common/Images/Icon/icon_m03.png" 
                            ImageUrl="~/Common/Images/Icon/icon_m03.png" CheckedImageUrl="~/Common/Images/Icon/icon_m03.png" meta:resourcekey="RadToolBarButtonResource3">
                        </telerik:RadToolBarButton>
                        <telerik:RadToolBarButton runat="server" IsSeparator="True" meta:resourcekey="RadToolBarButtonResource4"></telerik:RadToolBarButton>                      
                    </Items>
                </telerik:RadToolBar>
            </tr>
            <tr>
                <Ede:Grid ID="grdMoreList" runat="server" AutoGenerateColumns="False" AutoGenerateCheckBoxColumn="True" AllowPaging="True"  OnRowDataBound="grdMoreList_RowDataBound" Width="100%"
                          PageSize="15"  DefaultSortDirection="Descending" DataKeyNames="MEETING_GUID" EmptyDataText="沒有資料" KeepSelectedRows="False" AllowSorting="True" CustomDropDownListPage="False" DataKeyOnClientWithCheckBox="False" EnhancePager="True" SelectedRowColor="" UnSelectedRowColor=""
                    DefaultSortColumnName="START_TIME" OnPageIndexChanging="grdMoreList_PageIndexChanging" OnSorting="grdMoreList_Sorting" meta:resourcekey="grdMoreListResource1" >
                    <EnhancePagerSettings  ShowHeaderPager="True" FirstAltImageUrl="" FirstImageUrl="" LastAltImage="" LastImageUrl="" NextIAltImageUrl="" NextImageUrl="" PageInfoCssClass="" PageNumberCssClass="" PageNumberCurrentCssClass="" PageRedirectCssClass="" PreviousAltImageUrl="" PreviousImageUrl="" />
                    <ExportExcelSettings AllowExportToExcel="False" />
                    <Columns>
                        <asp:TemplateField HeaderText="主旨" SortExpression="SUBJECT" meta:resourcekey="TemplateFieldResource1">                           
                            <ItemTemplate>
                                <asp:LinkButton ID="lbtnSubject" runat="server" Text='<%#: Eval("SUBJECT") %>' meta:resourcekey="lbtnSubjectResource1"></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="開始日期" SortExpression="START_TIME" meta:resourcekey="TemplateFieldResource2">
                            <ItemTemplate>
                                <asp:Label ID="lblStart" runat="server" meta:resourcekey="lblStartResource1"></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle Width="180px" Wrap="False"/>
                            <ItemStyle Width="180px" Wrap="False"/>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="結束日期" SortExpression="EXPIRE_DATE" meta:resourcekey="TemplateFieldResource3">
                            <ItemTemplate>
                                <asp:Label ID="lblEnd" runat="server" meta:resourcekey="lblEndResource1"></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle Width="180px" Wrap="False"/>
                            <ItemStyle Width="180px" Wrap="False"/>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="週期性" SortExpression="REPEAT_TYPE" meta:resourcekey="TemplateFieldResource4">                          
                            <ItemTemplate>
                                <asp:Label ID="lblRepeatType" runat="server" meta:resourcekey="lblRepeatTypeResource1" ></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle Width="80px" />
                            <ItemStyle Width="80px" />
                        </asp:TemplateField>
                    </Columns>
                </Ede:Grid>
            </tr>
        </table>
        <asp:Label ID="lbUserGuid" runat="server" Visible="False" meta:resourcekey="lbUserGuidResource1"></asp:Label>      
    </ContentTemplate>
</asp:UpdatePanel>
<asp:Label ID="msgCancelconfirm" runat="server" Text="確定要取消?" Visible="False" meta:resourcekey="msgCancelconfirmResource1" ></asp:Label>
<asp:Label ID="lblMeetingList" runat="server" Text="會議清單" Visible="False" meta:resourcekey="lblMeetingListResource1" ></asp:Label>
<asp:Label ID="lblDay" runat="server" Text="每日" Visible="False" meta:resourcekey="lblDayResource1"></asp:Label>
<asp:Label ID="lblWeek" runat="server" Text="每週" Visible="False" meta:resourcekey="lblWeekResource1"></asp:Label>
<asp:Label ID="lblMonth" runat="server" Text="每月" Visible="False" meta:resourcekey="lblMonthResource1"></asp:Label>
<asp:Label ID="lblDeleteMeetingError" runat="server" Text="刪除會議失敗!!" Visible="False" meta:resourcekey="lblDeleteMeetingErrorResource1"></asp:Label>
<asp:Label ID="lblCheckConnection" runat="server" Text="異動線上會議失敗。請檢查Meeting Server的連線資訊是否正確，包含位置、帳號及密碼！(請注意Meeting Server的帳號不能被停用)" Visible="False" meta:resourcekey="lblCheckConnectionResource1" ></asp:Label>
<asp:Label ID="lblMeetingConnectionError" runat="server" Text="呼叫WebService失敗。請檢查Meeting Server的連線資訊是否正確，包含位置、帳號及密碼！(請注意Meeting Server的帳號不能被停用)" Visible="False" meta:resourcekey="lblMeetingConnectionErrorResource1"></asp:Label>

