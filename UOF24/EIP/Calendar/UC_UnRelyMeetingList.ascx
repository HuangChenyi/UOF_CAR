<%@ Control Language="C#" AutoEventWireup="true" Inherits="EIP_Calendar_UC_UnRelyMeetingList" Codebehind="UC_UnRelyMeetingList.ascx.cs" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>
<script id="UnRelyMeetingjs" type="text/javascript">
<!--
    function bar2_Click(sender, args) {
        var key = args.get_item().get_value();
        var UserGuid = '<%=Ede.Uof.EIP.SystemInfo.Current.UserGUID %>';
        var date = '<%= Ede.Uof.EIP.Organization.Util.UserTime.SetZone(Ede.Uof.EIP.SystemInfo.Current.UserGUID).GetNowForUi().ToString("yyyy/MM/dd HH:mm:dd") %>';
        var isEditable = "2";
        args.set_cancel(true);

        if (key == "Create") {
            
            $uof.dialog.open2('~/EIP/Calendar/CreateMeeting.aspx', args.get_item(), "", 950, 700, openDialogResult, { "OwnerGuid": UserGuid, "Date": date });
        }
        else if (key == "CreateInquiry") {           

            $uof.dialog.open2('~/EIP/Calendar/CreateInquiry.aspx', args.get_item(), "", 950, 700, openDialogResult, { "OwnerGuid": UserGuid, "Date": date, "isEditable": isEditable });
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

<table width="100%" cellpadding="0" cellspacing="0">
    <tr>
        <td colspan="11" style="vertical-align: top">
            <telerik:RadToolBar ID="RadToolBar1" runat="server" Width="100%" OnClientButtonClicking="bar2_Click"
                OnButtonClick="RadToolBar1_ButtonClick">
                <Items>
                    <telerik:RadToolBarButton runat="server" Text="新增會議" Value="Create" meta:resourcekey="TBarButtonResource3"
                        CheckedImageUrl="~/Common/Images/Icon/icon_m71.png"
                        DisabledImageUrl="~/Common/Images/Icon/icon_m71.png"
                        HoveredImageUrl="~/Common/Images/Icon/icon_m71.png"
                        ImageUrl="~/Common/Images/Icon/icon_m71.png">
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton runat="server" IsSeparator="True" Text="Button 1">
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton runat="server" Text="新增徵詢" Value="CreateInquiry" meta:resourcekey="TBarButtonResource4"
                        CheckedImageUrl="~/Common/Images/Icon/icon_m59.png"
                        DisabledImageUrl="~/Common/Images/Icon/icon_m59.png"
                        HoveredImageUrl="~/Common/Images/Icon/icon_m59.png"
                        ImageUrl="~/Common/Images/Icon/icon_m59.png">
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton runat="server" IsSeparator="True" Text="Button 3">
                    </telerik:RadToolBarButton>
                </Items>
            </telerik:RadToolBar>
        </td>
    </tr>
    <tr>
        <td nowrap width="120" class="SizeSB">
            <asp:Label ID="lblUnReplyMeeting" runat="server" Font-Bold="True"
                Text="未回覆會議" meta:resourcekey="lblUnReplyMeetingResource1"></asp:Label>
        </td>
    </tr>
</table>

<asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
    <ContentTemplate>
        <Fast:Grid ID="Grid1" runat="server" AllowSorting="True" AutoGenerateCheckBoxColumn="False" meta:resourcekey="Grid1Resource1"
            AutoGenerateColumns="False"
            SkinID="HomepageBlockStyle" Width="100%" AllowPaging="True"
            ShowHeader="False" OnRowDataBound="Grid1_RowDataBound" BorderStyle="None"
            BorderWidth="0px"
            OnPageIndexChanging="Grid1_PageIndexChanging"
            DataKeyOnClientWithCheckBox="False" DefaultSortDirection="Ascending"
            EnhancePager="True" PageSize="15">
            <EnhancePagerSettings ShowHeaderPager="True" />
            <ExportExcelSettings AllowExportToExcel="False" />
            <Columns>
                <asp:TemplateField meta:resourcekey="TemplateFieldResource2">
                    <ItemTemplate>
                        <table width="100%" border="0">
                            <tr>
                                <td width="16" style="min-width:16px">
                                    <img height="16" src="<%=ResolveUrl("~/common/images/icon/icon02.png") %>" width="16" />
                                </td>
                                <td width="50%">
                                    <asp:LinkButton runat="server" ID="LinkButton1" Text='<%#: Eval("SUBJECT") %>'
                                        meta:resourcekey="LinkButton1Resource2" OnClick="LinkButton1_Click"></asp:LinkButton>


                                </td>
                                <td width="20%">
                                    <asp:Label runat="server" ID="lblCreateuser"
                                        meta:resourcekey="lblCreateuserResource2"></asp:Label>


                                </td>
                                <td width="30%">
                                    <asp:Label runat="server" Text='<%# Eval("START_TIME") %>' ID="lblStarttime"
                                        meta:resourcekey="lblStarttimeResource2"></asp:Label>


                                </td>
                            </tr>
                        </table>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </Fast:Grid>
        <asp:Label ID="lblUnReplyInquiry" runat="server" Font-Bold="True" CssClass="SizeSB" Text="未回覆徵詢"
            meta:resourcekey="lblUnReplyInquiryResource1"></asp:Label>
        <Fast:Grid ID="Grid2" runat="server" AllowSorting="True" AutoGenerateCheckBoxColumn="False" meta:resourcekey="Grid2Resource1"
            AutoGenerateColumns="False"
            SkinID="HomepageBlockStyle" Width="100%" AllowPaging="True"
            ShowHeader="False" BorderStyle="None" BorderWidth="0px"
            OnPageIndexChanging="Grid2_PageIndexChanging"
            OnRowDataBound="Grid2_RowDataBound" DataKeyOnClientWithCheckBox="False"
            DefaultSortDirection="Ascending" EnhancePager="True"
            PageSize="15">
            <EnhancePagerSettings ShowHeaderPager="True" FirstAltImageUrl=""
                FirstImageUrl="" LastAltImage="" LastImageUrl="" NextIAltImageUrl=""
                NextImageUrl="" PageInfoCssClass="" PageNumberCssClass=""
                PageNumberCurrentCssClass="" PageRedirectCssClass="" PreviousAltImageUrl=""
                PreviousImageUrl="" />
            <ExportExcelSettings AllowExportToExcel="False" />
            <Columns>
                <asp:TemplateField meta:resourcekey="TemplateFieldResource3">
                    <ItemTemplate>
                        <table width="100%" border="0">
                            <tr>
                                <td width="16" style="min-width:16px">
                                    <img height="16" src="<%=ResolveUrl("~/common/images/icon/icon02.png") %>" width="16" />
                                </td>
                                <td width="50%">
                                    <asp:LinkButton runat="server" ID="LinkButton1" Text='<%#: Eval("SUBJECT") %>'
                                        meta:resourcekey="LinkButton1Resource3" OnClick="LinkButton1_Click"></asp:LinkButton>
                                </td>
                                <td width="20%">
                                    <asp:Label runat="server" ID="lblCreateuser"
                                        meta:resourcekey="lblCreateuserResource3"></asp:Label>
                                </td>
                                <td width="30%">
                                    <asp:Label runat="server" Text='<%# Eval("INQUIRY_DEADLINE") %>'
                                        ID="lblStarttime" meta:resourcekey="lblStarttimeResource3"></asp:Label>
                                </td>
                            </tr>
                        </table>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </Fast:Grid>
    </ContentTemplate>
    <Triggers>
        <asp:AsyncPostBackTrigger ControlID="RadToolBar1" EventName="ButtonClick" />
    </Triggers>
</asp:UpdatePanel>
