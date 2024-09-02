<%@ Control Language="C#" AutoEventWireup="true" Inherits="Ede.Uof.EIP.Schedule.UI.UC_EventList" Codebehind="UC_EventList.ascx.cs" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register Assembly="System.Web, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a" Namespace="System.Web.UI" TagPrefix="cc1" %>
<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>

<script type="text/javascript" id="telerikClientEvents1">
    Sys.Application.add_load(function () {
        var eventid = "<%=Request.QueryString["eventid"]%>";
        var corp = "no";
        var isedit = "no";
        if (eventid !== "") {
            var is_Opened = $("#<%=hidIsOpened.ClientID%>");
            if (is_Opened.val() !== "True") {
                is_Opened.val("True");
                $uof.dialog.open2("~/EIP/OrganizationCalendar/ChangeEvent.aspx","","",500,500,
                    function(returnValue) {
                        if (returnValue == null) {
                            return false;
                        }
                        return true;
                    },
                    { "eventid": eventid,"corp":corp,"isedit":isedit });
            }
        }
    });
    function barEvent_ButtonClicking(sender, args)
	{
	    var value = args.get_item().get_value();
	    switch(value)
	    {
	        case "Delete":
	            args.set_cancel(!confirm('<%=msgDelconfirm.Text %>'));
	            break;
	        case "Create":
	            var groupID = $("#<%= hideGroupID.ClientID%>").val();

	            args.set_cancel(true);
	            $uof.dialog.open2("~/EIP/OrganizationCalendar/CreateEvent.aspx", args.get_item(), "", 500, 500, openDialogResult, { "groupid": groupID });
	            break;
	        case "ImportEvent":
	            var groupID = $("#<%= hideGroupID.ClientID%>").val();

	            args.set_cancel(true);
	            $uof.dialog.open2("~/EIP/OrganizationCalendar/ImportEvent.aspx", args.get_item(), "", 650, 380, openDialogResult, { "groupid": groupID });
	            break;
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
<asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>
<table border="0" cellpadding="0" cellspacing="0" width="100%">
<tr>
    <td>
        <telerik:RadToolBar ID="barEvent" runat="server" OnClientButtonClicking="barEvent_ButtonClicking" Width="100%" OnButtonClick="barEvent_ButtonClick" meta:resourcekey="RadToolBar1Resource1">
            <Items>
                <telerik:RadToolBarButton runat="server" Text="year" Value="selectYear" 
                    meta:resourcekey="RadToolBarButtonResource6" Owner="">
                    <ItemTemplate>
                        <table class="style1">
                            <tr>
                                <td>
                                    <asp:Label ID="lblYear" runat="server" Text="年度" 
                                        meta:resourcekey="lblYearResource1"></asp:Label>
                                </td>
                                <td>
                                    <asp:DropDownList ID="ddlYear" runat="server" AutoPostBack="True" 
                                        onselectedindexchanged="ddlYear_SelectedIndexChanged" 
                                        meta:resourcekey="ddlYearResource1">
                                    </asp:DropDownList>
                                </td>
                            </tr>
                        </table>
                    </ItemTemplate>
                </telerik:RadToolBarButton>
                <telerik:RadToolBarButton runat="server" IsSeparator="True" Value="sp0" 
                    Text="sp" meta:resourcekey="RadToolBarButtonResource7" Owner="">
                </telerik:RadToolBarButton>
                <telerik:RadToolBarButton runat="server" Text="新增事件" Value="Create" 
                    ClickedImageUrl="~/Common/Images/Icon/icon_m44.gif" DisabledImageUrl="~/Common/Images/Icon/icon_m44.gif" 
                    HoveredImageUrl="~/Common/Images/Icon/icon_m44.gif" 
                    ImageUrl="~/Common/Images/Icon/icon_m44.gif" 
                    meta:resourcekey="RadToolBarButtonResource1" Owner="">
                </telerik:RadToolBarButton>
                <telerik:RadToolBarButton runat="server" Value="sp1" IsSeparator="True" 
                    meta:resourcekey="RadToolBarButtonResource2" Owner="">
                </telerik:RadToolBarButton>
                <telerik:RadToolBarButton runat="server" HoveredImageUrl="~/Common/Images/Icon/icon_m110.gif"
                    ImageUrl="~/Common/Images/Icon/icon_m110.gif" Value="ImportEvent"
                    CheckedImageUrl="~/Common/Images/Icon/icon_m110.gif" Text="匯入事件"
                    meta:resourcekey="RadToolBarButtonResource8">
                </telerik:RadToolBarButton>
                <telerik:RadToolBarButton runat="server" Text="" IsSeparator="true" Value="sp3">
                </telerik:RadToolBarButton>
                <telerik:RadToolBarButton runat="server" Text="刪除選取項目" Value="Delete" 
                    ClickedImageUrl="~/Common/Images/Icon/icon_m03.gif" DisabledImageUrl="~/Common/Images/Icon/icon_m03.gif" 
                    HoveredImageUrl="~/Common/Images/Icon/icon_m03.gif" 
                    ImageUrl="~/Common/Images/Icon/icon_m03.gif" 
                    meta:resourcekey="RadToolBarButtonResource3" Owner="">
                </telerik:RadToolBarButton>
                <telerik:RadToolBarButton runat="server" Value="sp2" IsSeparator="True" 
                    meta:resourcekey="RadToolBarButtonResource4" Owner="">
                </telerik:RadToolBarButton>
                <telerik:RadToolBarButton runat="server" Value="DeleteErr" 
                    meta:resourcekey="RadToolBarButtonResource5" Owner="">
                    <ItemTemplate>
                        <table>
                            <tr>
                                <td>
                                    <asp:CustomValidator ID="CustomValidator1" runat="server" ErrorMessage="沒有權限刪除" Display="Dynamic" ForeColor="Red" meta:resourcekey="CustomValidator1Resource1"></asp:CustomValidator>
                                </td>
                            </tr>
                        </table>
                    </ItemTemplate>
                </telerik:RadToolBarButton>
            </Items>
        </telerik:RadToolBar>
</td></tr>
    <tr>
        <td>
            
            <Fast:Grid ID="EventGrid" runat="server" AllowSorting="True" AutoGenerateCheckBoxColumn="True"
                AutoGenerateColumns="False"  
                 Width="100%" AllowPaging="True" 
                        OnPageIndexChanging="Grid1_PageIndexChanging" DataKeyNames="EVENT_GUID" 
                        OnRowDataBound="Grid1_RowDataBound" OnSorting="Grid1_Sorting" 
                        DataKeyOnClientWithCheckBox="False" DefaultSortDirection="Ascending" 
                        EmptyDataText="沒有資料" EnhancePager="True" 
                        KeepSelectedRows="False" PageSize="15"  meta:resourcekey="Grid1Resource2"  >
                <EnhancePagerSettings ShowHeaderPager="True" FirstAltImageUrl="" 
                    FirstImageUrl="" LastAltImage="" LastImageUrl="" NextIAltImageUrl="" 
                    NextImageUrl="" PageInfoCssClass="" PageNumberCssClass="" 
                    PageNumberCurrentCssClass="" PageRedirectCssClass="" PreviousAltImageUrl="" 
                    PreviousImageUrl="" />
                <ExportExcelSettings AllowExportToExcel="False" />
                <Columns>
                    <asp:TemplateField HeaderText="主旨" SortExpression="SUBJECT" meta:resourcekey="TemplateFieldResource1">
                        <itemtemplate>
<asp:LinkButton runat="server" ID="LinkButton1" Text='<%#: Eval("SUBJECT") %>' meta:resourceKey="LinkButton1Resource1" OnClick="LinkButton1_Click"></asp:LinkButton>
 
</itemtemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="開始時間" SortExpression="START_TIME" meta:resourcekey="BoundFieldResource1">
                        <ItemTemplate>
                            <asp:Label ID="lblStartTime" runat="server"></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle Width="120px" Wrap="false" />
                        <ItemStyle Width="120px" Wrap="false" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="結束時間" SortExpression="END_TIME" meta:resourcekey="BoundFieldResource2">
                        <ItemTemplate>
                            <asp:Label ID="lblEndTime" runat="server"></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle Width="120px" Wrap="false" />
                        <ItemStyle Width="120px" Wrap="false" />
                    </asp:TemplateField>
                </Columns>
            </Fast:Grid>
                
        </td>
    </tr>
</table>
<input id="hideGroupID" runat="server" type="hidden" />
<input id="hideEdit" runat="server" type="hidden" />
<input id="hideUserid" runat="server" type="hidden" />
<asp:Label ID="msgDelconfirm" runat="server" Text="確定要刪除?" Visible="False" meta:resourcekey="msgDelconfirmResource1"></asp:Label>
<asp:HiddenField ID="hidIsOpened" runat="server" />
</ContentTemplate>
</asp:UpdatePanel>