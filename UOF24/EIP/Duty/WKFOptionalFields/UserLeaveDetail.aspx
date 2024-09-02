<%@ Page Title="可請假明細" Language="C#" MasterPageFile="~/Master/DialogMasterPage.master"
    AutoEventWireup="true" Inherits="EIP_Duty_WKFOptionalFields_UserLeaveDetail" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" Codebehind="UserLeaveDetail.aspx.cs" %>

<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table width="100%">
        <tr>
            <td>
                <Fast:Grid ID="LeaveDetailGrid" runat="server" AutoGenerateCheckBoxColumn="False"
                    Width="100%" AllowSorting="True" AutoGenerateColumns="False" 
                    DataKeyOnClientWithCheckBox="False" DefaultSortDirection="Ascending" EmptyDataText="沒有資料"
                    EnableModelValidation="True" EnhancePager="True" KeepSelectedRows="False" PageSize="15"
                      
                    OnRowDataBound="LeaveDetailGrid_RowDataBound" 
                    meta:resourcekey="LeaveDetailGridResource1">
                    <EnhancePagerSettings FirstImageUrl="" FirstAltImageUrl="" PreviousImageUrl="" NextImageUrl=""
                        LastImageUrl="" LastAltImage="" PageNumberCssClass="" PageNumberCurrentCssClass=""
                        PageInfoCssClass="" PageRedirectCssClass="" NextIAltImageUrl="" PreviousAltImageUrl=""
                        ShowHeaderPager="True"></EnhancePagerSettings>
                    <ExportExcelSettings AllowExportToExcel="False"></ExportExcelSettings>
                    <Columns>
                        <asp:BoundField DataField="NAME" HeaderText="假別" ItemStyle-Wrap="true" 
                            HeaderStyle-Width="25%" meta:resourcekey="BoundFieldResource1" >
<HeaderStyle Width="25%"></HeaderStyle>

<ItemStyle Wrap="True"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField DataField="DAYS" HeaderText="可用" ItemStyle-Wrap="false" 
                            HeaderStyle-Width="10%" ItemStyle-HorizontalAlign="Right" 
                            meta:resourcekey="BoundFieldResource2" >
<HeaderStyle Width="10%"></HeaderStyle>

<ItemStyle HorizontalAlign="Right" Wrap="False"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField DataField="USED_DAYS" HeaderText="已用" ItemStyle-Wrap="false" 
                            HeaderStyle-Width="10%" ItemStyle-HorizontalAlign="Right" 
                            meta:resourcekey="BoundFieldResource3">
<HeaderStyle Width="10%"></HeaderStyle>

<ItemStyle HorizontalAlign="Right" Wrap="False"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField DataField="REMINE_DAYS" HeaderText="剩餘" ItemStyle-Wrap="false" 
                            HeaderStyle-Width="10%" ItemStyle-HorizontalAlign="Right" 
                            meta:resourcekey="BoundFieldResource4">
<HeaderStyle Width="10%"></HeaderStyle>

<ItemStyle HorizontalAlign="Right" Wrap="False"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField DataField="BEGIN" HeaderText="使用期限" ItemStyle-Wrap="false" 
                            HeaderStyle-Width="25%" ItemStyle-HorizontalAlign="Center" 
                            meta:resourcekey="BoundFieldResource5">
<HeaderStyle Width="25%"></HeaderStyle>

<ItemStyle HorizontalAlign="Center" Wrap="False"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField DataField="EXTEND" HeaderText="備註" ItemStyle-Wrap="true" 
                            HeaderStyle-Width="20%" meta:resourcekey="BoundFieldResource6" >
<HeaderStyle Width="20%"></HeaderStyle>

<ItemStyle Wrap="True"></ItemStyle>
                        </asp:BoundField>
                    </Columns>
                </Fast:Grid>
            </td>
        </tr>
    </table>
    <asp:Label ID="lblLeaveUnitHours" runat="server" Text="時" Visible="False" 
        meta:resourcekey="lblLeaveUnitHoursResource1"></asp:Label>
    <asp:Label ID="lblLeaveUnitDays" runat="server" Text="天" Visible="False" 
        meta:resourcekey="lblLeaveUnitDaysResource1"></asp:Label>
    <asp:Label ID="lblExtendText" runat="server" Text="上年度保留" Visible="False" 
        meta:resourcekey="lblExtendTextResource1"></asp:Label>
</asp:Content>
