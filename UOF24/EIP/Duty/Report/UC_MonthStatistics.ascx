<%@ Control Language="C#" AutoEventWireup="true"
    Inherits="EIP_Duty_Report_UC_MonthStatistics" Codebehind="UC_MonthStatistics.ascx.cs" %>
<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>
<Fast:Grid ID="Grid1" runat="server" AllowSorting="True" AutoGenerateCheckBoxColumn="False"
    AutoGenerateColumns="False"  
     Width="100%" BorderStyle="None" BorderWidth="0px" ShowHeader="False"
    OnRowDataBound="Grid1_RowDataBound" SkinID="HomepageBlockStyle" DataKeyOnClientWithCheckBox="False"
    DefaultSortDirection="Ascending" EmptyDataText="沒有資料"
    EnhancePager="True" KeepSelectedRows="False" meta:resourcekey="Grid1Resource1"
    PageSize="15" CustomDropDownListPage="False" SelectedRowColor="" UnSelectedRowColor="">
    <EnhancePagerSettings FirstImageUrl="" FirstAltImageUrl="" PreviousImageUrl="" NextImageUrl=""
        LastImageUrl="" LastAltImage="" PageNumberCssClass="" PageNumberCurrentCssClass=""
        PageInfoCssClass="" PageRedirectCssClass="" NextIAltImageUrl="" PreviousAltImageUrl=""
        ShowHeaderPager="false"></EnhancePagerSettings>
    <ExportExcelSettings AllowExportToExcel="False"></ExportExcelSettings>
    <Columns>
        <asp:TemplateField meta:resourcekey="TemplateFieldResource1">
            <HeaderStyle Height="0px" />
            <ItemTemplate>
                <table width="100%" border="0">
                    <tr>
                        <td width="3%">
                            <img height="16" src="<%=ResolveUrl("~/common/images/icon/icon02.png")  %>" width="16" />
                        </td>
                        <td width="50%">
                            <asp:Label ID="lblName" runat="server" meta:resourcekey="lblNameResource1"></asp:Label>
                        </td>
                        <td width="10%" align="right">
                            <asp:Label ID="lblCount" runat="server" meta:resourcekey="lblCountResource1"></asp:Label>
                        </td>
                        <td width="2%">
                        </td>
                        <td width="20%">
                            <asp:Label ID="lblUnit" runat="server" meta:resourcekey="lblUnitResource1"></asp:Label>
                        </td>
                    </tr>
                </table>
            </ItemTemplate>
        </asp:TemplateField>
    </Columns>
</Fast:Grid>
<asp:Label ID="lblOverTimeT" runat="server" Text="加班轉補休" Visible="False" meta:resourcekey="lblOverTimeTResource1"></asp:Label>
<asp:Label ID="lblOverTime" runat="server" Text="加班轉費用" Visible="False" meta:resourcekey="lblOverTimeResource1"></asp:Label>
<asp:Label ID="lblRoverTime" runat="server" Text="例假日加班時數" Visible="False" meta:resourcekey="lblRoverTimeResource1"></asp:Label>
<asp:Label ID="lblOoverTime" runat="server" Text="國定假日加班時數" Visible="False" meta:resourcekey="lblOoverTimeResource1"></asp:Label>


<asp:Label ID="lblAbsent" runat="server" Text="曠職" Visible="False" meta:resourcekey="lblAbsentResource1"></asp:Label>

<asp:Label ID="lblLate" runat="server" Text="遲到次數" Visible="False" meta:resourcekey="lblLateResource1"></asp:Label>

<asp:Label ID="lblHour" runat="server" Text="時" Visible="False" meta:resourcekey="lblHourResource1"></asp:Label>
<asp:Label ID="lblDay" runat="server" Text="天" Visible="False" meta:resourcekey="lblDayResource1"></asp:Label>
<asp:Label ID="lblTime" runat="server" Text="次" Visible="False" meta:resourcekey="lblTimeResource1"></asp:Label>

<asp:Label ID="lblTravel" runat="server" Text="出差" Visible="False" meta:resourcekey="lblTravelResource1"></asp:Label>
<asp:Label ID="lblLateMins" runat="server" Text="遲到分鐘數" Visible="False" meta:resourcekey="lblLateMinsResource1"></asp:Label>
<asp:Label ID="lblForget" runat="server" Text="忘刷次數" Visible="False" meta:resourcekey="lblForgetResource1"></asp:Label>
<asp:Label ID="lblWOT" runat="server" Text="平日加班" Visible="False" meta:resourcekey="lblWOTResource1"></asp:Label>
<asp:Label ID="lblHOT" runat="server" Text="假日加班" Visible="False" meta:resourcekey="lblHOTResource1"></asp:Label>
<asp:Label ID="lblMin" runat="server" Text="分" Visible="False" meta:resourcekey="lblMinResource1"></asp:Label>

<asp:Label ID="lblExpWork" runat="server" Text="應出勤時數" Visible="False" meta:resourcekey="lblExpWorkResource1"></asp:Label>
<asp:Label ID="lblPunWork" runat="server" Text="刷卡出勤時數" Visible="False" meta:resourcekey="lblPunWorkResource1"></asp:Label>
<asp:HiddenField ID="hfCurrentUser" runat="server" />
