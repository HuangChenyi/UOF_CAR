<%@ Control Language="C#" AutoEventWireup="true"
    Inherits="Ede.Uof.EIP.Schedule.UI.UC_DeptHolidayList" Codebehind="UC_DeptHolidayList.ascx.cs" %>
<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>
<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Web.UI" tagprefix="telerik" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<style type="text/css">

    .style1
    {
        width: 100%;
    }
</style>
<script type="text/javascript">
    Sys.Application.add_load(function() {
        var holidayid = "<%=Request.QueryString["holidayid"]%>";
        var isEditable = "1";
        var isReadOnly = "true";
        if (holidayid !== "") {
            var is_Opened = $("#<%=hidIsOpened.ClientID%>");
            if (is_Opened.val() !== "True") {
                is_Opened.val("True");
                $uof.dialog.open2("~/EIP/OrganizationCalendar/ChangeHoliday.aspx",
                    "",
                    "",
                    900,
                    400,
                    function(returnValue) {
                        if (returnValue == null) {
                            return false;
                        }
                        return true;
                    },
                    { "holidayid": holidayid, "isEditable": isEditable, "IsReadOnly": isReadOnly });
            }
        }
    });
</script>
<asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
<table width="100%">
    <tr>
        <td>
            <telerik:RadToolBar ID="HolidayToolbar" runat="server"  Width="100%"  
                meta:resourcekey="HolidayToolbarResource2" 
                onbuttonclick="HolidayToolbar_ButtonClick">
                <Items>
                    <telerik:RadToolBarButton runat="server" Value="selectYear" Text="Button 7" 
                        meta:resourcekey="RadToolBarButtonResource1" Owner="">
                        <ItemTemplate>
                            <table class="style1">
                                <tr>
                                    <td>
                                        <asp:Label ID="lblYear" runat="server" Text="年度" 
                                            meta:resourcekey="lblYearResource2"></asp:Label>
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
                        meta:resourcekey="RadToolBarButtonResource2" Owner="">
                    </telerik:RadToolBarButton>
                </Items>
            </telerik:RadToolBar>
        </td>
    </tr>
    <tr>
        <td>
            <Fast:Grid ID="DeptHolidayGrid" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateCheckBoxColumn="False"
                        AutoGenerateColumns="False" DataKeyNames="HOLIDAY_GUID" OnRowDataBound="Grid1_RowDataBound"
                        Width="100%" DataKeyOnClientWithCheckBox="False" DefaultSortDirection="Ascending"
                        EmptyDataText="沒有資料" EnhancePager="True"
                        KeepSelectedRows="False" PageSize="15" 
                 meta:resourcekey="Grid1Resource2" 
                 >
                        <EnhancePagerSettings
                            ShowHeaderPager="True"></EnhancePagerSettings>
                        <ExportExcelSettings AllowExportToExcel="False"></ExportExcelSettings>
                        <Columns>
                            <asp:TemplateField HeaderText="主旨" meta:resourceKey="TemplateFieldResource1" SortExpression="SUBJECT">
                                <ItemTemplate>
                                    <asp:LinkButton runat="server" ID="LinkButton1" Text='<%#: Eval("SUBJECT") %>' CommandName="EditHoliday"
                                        meta:resourceKey="LinkButton1Resource1" __designer:wfdid="w20"></asp:LinkButton>
                                </ItemTemplate>
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
                            <asp:BoundField DataField="IS_PERSONAL" HeaderText="類型" meta:resourceKey="BoundFieldResource3"
                                SortExpression="IS_PERSONAL">
                                <HeaderStyle Width="80px" />
                                <ItemStyle Width="80px" />
                            </asp:BoundField>
                        </Columns>
                    </Fast:Grid>
                    <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" OldValuesParameterFormatString="original_{0}"
                        SelectMethod="GetCorporationHoliday" TypeName="Ede.Uof.EIP.Schedule.Holiday.ReadHolidayUCO">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="lbUserGuid" Name="userGUID" PropertyName="Text"
                                Type="String" />
                            <asp:ControlParameter ControlID="lblyear" Name="year" PropertyName="Text"
                                Type="String" />
                        </SelectParameters>
            </asp:ObjectDataSource>       
                
        </td>
    </tr>
</table>
</ContentTemplate>
<Triggers>
<asp:AsyncPostBackTrigger  ControlID="HolidayToolbar" EventName="ButtonClick"/>
</Triggers> 
</asp:UpdatePanel>
<asp:Label ID="lbUserGuid" runat="server" meta:resourcekey="lbUserGuidResource1"
    Visible="False"></asp:Label>
<asp:Label ID="lblyear" runat="server"  Visible="False" 
    meta:resourcekey="lblyearResource1"></asp:Label>
    <asp:Label ID="lbCompany" runat="server" Text="公司" Visible="False"
        meta:resourcekey="lbCompanyResource1"></asp:Label>
        <asp:Label ID="lbPersonal" runat="server"
            Text="個人" Visible="False" meta:resourcekey="lbPersonalResource1"></asp:Label>
<asp:HiddenField ID="hidIsOpened" runat="server" />