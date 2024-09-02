<%@ Control Language="C#" AutoEventWireup="true" Inherits="EIP_OrganizationCalendar_Common_UC_HolidayList" Codebehind="UC_HolidayList.ascx.cs" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register Assembly="System.Web.Extensions" Namespace="System.Web.UI" TagPrefix="asp" %>
<%@ Register Assembly="System.Web, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a" Namespace="System.Web.UI" TagPrefix="cc1" %>
<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>
<style type="text/css">
    .style1
    {
        width: 100%;
    }
</style>
<script type="text/javascript" id="telerikClientEvents1">
    //<![CDATA[
    function RadToolBar1_ButtonClicking(sender,args)
    {
        var value = args.get_item().get_value();
        switch(value)
        {
            case "Delete":
                args.set_cancel(!confirm('<%=msgDelconfirm.Text %>'))
                break;
            case "Create":
                var groupID = $("#<%= hideGroupID.ClientID %>").val();
                args.set_cancel(true);
                $uof.dialog.open2("~/EIP/OrganizationCalendar/CreateHoliday.aspx", args.get_item(), "", 1350, 450, openDialogResult, { "groupid": groupID });

                break;
            case "ImportHoliday":
                var groupID = $("#<%= hideGroupID.ClientID %>").val();
                args.set_cancel(true);
                $uof.dialog.open2("~/EIP/OrganizationCalendar/ImportHoliday.aspx", args.get_item(), "", 650, 380, openDialogResult, { "groupid": groupID });
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


<table border="0" cellpadding="0" cellspacing="0" width="100%">
    <tr>
        <td>
            <telerik:RadToolBar ID="HolidayToolbar" runat="server" OnClientButtonClicking="RadToolBar1_ButtonClicking" Width="100%" OnButtonClick="RadToolBar1_ButtonClick" meta:resourcekey="HolidayToolbarResource2" SingleClick="None">
                <Items>
                    <telerik:RadToolBarButton runat="server" Value="selectYear" Text="Button 7" 
                        meta:resourcekey="RadToolBarButtonResource8">
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
                    <telerik:RadToolBarButton runat="server" IsSeparator="True" Text="i7" 
                        meta:resourcekey="RadToolBarButtonResource9">
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton runat="server" Text="新增假日" Value="Create"
                        ClickedImageUrl="~/Common/Images/Icon/icon_m70.gif" DisabledImageUrl="~/Common/Images/Icon/icon_m70.gif" 
                        HoveredImageUrl="~/Common/Images/Icon/icon_m70.gif" ImageUrl="~/Common/Images/Icon/icon_m70.gif" meta:resourcekey="RadToolBarButtonResource1">
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton runat="server" Text="" IsSeparator="true" 
                        meta:resourcekey="RadToolBarButtonResource6">
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton runat="server" HoveredImageUrl="~/Common/Images/Icon/icon_m110.gif"
                        ImageUrl="~/Common/Images/Icon/icon_m110.gif" Value="ImportHoliday" 
                        CheckedImageUrl="~/Common/Images/Icon/icon_m110.gif" Text="匯入假日" 
                        meta:resourcekey="RadToolBarButtonResource7">
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton runat="server" Text="" IsSeparator="true" meta:resourcekey="RadToolBarButtonResource2">
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton runat="server" Text="刪除選取項目" Value="Delete"
                        ClickedImageUrl="~/Common/Images/Icon/icon_m03.gif" DisabledImageUrl="~/Common/Images/Icon/icon_m03.gif" 
                        HoveredImageUrl="~/Common/Images/Icon/icon_m03.gif" ImageUrl="~/Common/Images/Icon/icon_m03.gif" meta:resourcekey="RadToolBarButtonResource3">
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton runat="server" Text="" IsSeparator="true" meta:resourcekey="RadToolBarButtonResource4">
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton runat="server" Text="" Value="DeleteErr" meta:resourcekey="RadToolBarButtonResource5">
                        <ItemTemplate>
                            <tabe>
                                <tr>
                                    <td>
                                        <asp:CustomValidator ID="CustomValidator1" runat="server" ErrorMessage="沒有刪除權限" Display="Dynamic" ForeColor="Red" meta:resourcekey="CustomValidator1Resource1"></asp:CustomValidator>
                                    </td>
                                </tr>
                            </tabe>
                        </ItemTemplate>
                    </telerik:RadToolBarButton>
                </Items>
            </telerik:RadToolBar>
        </td>
    </tr>
    <tr>
        <td>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
            <Fast:Grid ID="Grid1" runat="server" Width="100%" AllowPaging="True" 
                        AllowSorting="True" AutoGenerateCheckBoxColumn="True" 
                        AutoGenerateColumns="False"  
                        DataKeyNames="HOLIDAY_GUID" OnPageIndexChanging="Grid1_PageIndexChanging" 
                          OnRowDataBound="Grid1_RowDataBound" 
                        DataKeyOnClientWithCheckBox="False" onsorting="Grid1_Sorting"  DefaultSortDirection="Ascending" EmptyDataText="沒有資料" EnhancePager="True" KeepSelectedRows="False" meta:resourcekey="Grid1Resource2" PageSize="15" CustomDropDownListPage="False" SelectedRowColor="" UnSelectedRowColor=""  >
                <enhancepagersettings showheaderpager="True" FirstAltImageUrl="" FirstImageUrl="" LastAltImage="" LastImageUrl="" NextIAltImageUrl="" NextImageUrl="" PageInfoCssClass="" PageNumberCssClass="" PageNumberCurrentCssClass="" PageRedirectCssClass="" PreviousAltImageUrl="" PreviousImageUrl="" />
                <exportexcelsettings allowexporttoexcel="False" />
                <Columns>
                    <asp:TemplateField HeaderText="主旨" SortExpression="SUBJECT" meta:resourcekey="TemplateFieldResource1">
                        <itemtemplate>
                            <asp:LinkButton runat="server" ID="LinkButton1" Text='<%#: Eval("SUBJECT") %>' meta:resourceKey="LinkButton1Resource1" OnClick="LinkButton1_Click"></asp:LinkButton>
                        </itemtemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="開始時間" SortExpression="START_TIME" meta:resourcekey="BoundFieldResource1">
                        <itemtemplate>
                            <asp:Label ID="lblStartTime" runat="server" meta:resourcekey="lblStartTimeResource1"></asp:Label>
                        </itemtemplate>
                        <ItemStyle Wrap="False" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="結束時間" SortExpression="END_TIME" meta:resourcekey="BoundFieldResource2">
                        <itemtemplate>
                            <asp:Label ID="lblEndTime" runat="server" meta:resourcekey="lblEndTimeResource1"></asp:Label>
                        </itemtemplate>
                        <ItemStyle Wrap="False" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="類型" meta:resourcekey="TemplateFieldResource2">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" meta:resourcekey="TextBox1Resource1"></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblHolidayType" runat="server" meta:resourcekey="lblHolidayTypeResource1"></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle Wrap="False" />
                        <ItemStyle Wrap="False" />
                    </asp:TemplateField>
                </Columns>
            </Fast:Grid>
                </ContentTemplate>
               <Triggers>
                <asp:AsyncPostBackTrigger  ControlID="HolidayToolbar" EventName="ButtonClick"/>
               </Triggers> 
            </asp:UpdatePanel> 
        </td>
    </tr>
</table>
<input id="hideUserID" runat="server" type="hidden" />
<input id="hideGroupID" runat="server" type="hidden" />
<input id="hfCurrentUser" runat="server" type="hidden" />
<asp:Label ID="msgDelconfirm" runat="server" Text="確定要刪除?" Visible="False" meta:resourcekey="msgDelconfirmResource1"></asp:Label>
<asp:Label ID="lblDayoff" runat="server" Text="休息日" Visible="False" meta:resourcekey="lblDayoffResource1" ></asp:Label>
<asp:Label ID="lblRoutine" runat="server" Text="例假日" Visible="False" meta:resourcekey="lblRoutineResource1" ></asp:Label>
<asp:Label ID="lblHoliday" runat="server" Text="國定假日" Visible="False" meta:resourcekey="lblHolidayResource1" ></asp:Label>