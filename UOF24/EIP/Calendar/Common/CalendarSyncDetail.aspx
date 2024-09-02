<%@ Page Title="" Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" CodeBehind="CalendarSyncDetail.aspx.cs" Inherits="Ede.Uof.Web.EIP.Calendar.Common.CalendarSyncDetail" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" %>
<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table style="width:100%">
         <tr>
            <td style="text-align: left ; white-space: nowrap"">
                <Fast:Grid ID="grdCalendarSyncDetail" runat="server" AutoGenerateCheckBoxColumn="False" AutoGenerateColumns="False" CustomDropDownListPage="False"
                    EmptyDataText="No data found" OnRowDataBound="grdCalendarSyncDetail_RowDataBound" width="100%" meta:resourcekey="grdSubCalendarResource1" AllowSorting="True" DataKeyOnClientWithCheckBox="False" DefaultSortDirection="Ascending" EnhancePager="True" KeepSelectedRows="False" PageSize="15" SelectedRowColor="" UnSelectedRowColor="">
                    <EnhancePagerSettings ShowHeaderPager="false"></EnhancePagerSettings>
                    <ExportExcelSettings AllowExportToExcel="false"></ExportExcelSettings>
                        <Columns>
                            <asp:BoundField DataField="ICS_NAME" HeaderText="行事曆名稱" Visible="true" HeaderStyle-Width="30%" ItemStyle-Width="30%" meta:resourcekey="CalendarSourceResource1" />
                             <asp:TemplateField HeaderText="執行時間" HeaderStyle-Width="20%" ItemStyle-Width="20%" meta:resourcekey="ExecuteTimeSourceResource1" >
                                <ItemTemplate>
                                  <asp:label ID="lblExecuteTime" runat="server" meta:resourcekey="lblExecuteTimeResource1"></asp:label>
                                </ItemTemplate>
                            </asp:TemplateField>
                             <asp:TemplateField HeaderText="更新完成時間" HeaderStyle-Width="20%" ItemStyle-Width="20%" meta:resourcekey="FinishTimeSourceResource1">
                                <ItemTemplate>
                                  <asp:label ID="lblFinishTime" runat="server" meta:resourcekey="lblFinishTimeResource1"></asp:label>
                                </ItemTemplate>
                            </asp:TemplateField>
                             <asp:TemplateField HeaderText="狀態" HeaderStyle-Width="7%" ItemStyle-Width="7%" meta:resourcekey="SyncStatusSourceResource1">
                                <ItemTemplate>
                                  <asp:label ID="lblSyncStatus" runat="server" meta:resourcekey="lblSyncStatusResource1"></asp:label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="原因" HeaderStyle-Width="43%" ItemStyle-Width="43%" meta:resourcekey="ResultResource1">
                                <ItemTemplate>
                                  <asp:label ID="lblSyncResult" runat="server" meta:resourcekey="lblSyncResultResource1"></asp:label>
                                </ItemTemplate>
                            </asp:TemplateField>
                    </Columns>
                </Fast:Grid>
                <asp:label ID="lblSuccess" Text="成功" runat="server" Visible="False" meta:resourcekey="lblSuccessResource1"></asp:label>
                <asp:label ID="lblExecuting" Text="處理中" runat="server" Visible="False" meta:resourcekey="lblExecutingResource1"></asp:label>
                <asp:label ID="lblFail" Text="失敗" runat="server" Visible="False" meta:resourcekey="lblFailResource1"></asp:label>
                <asp:label ID="lblwaiting" Text="等待中" runat="server" Visible="False" meta:resourcekey="lblwaitingResource1"></asp:label>
                <asp:HiddenField ID="hfUserGuid" runat="server" />                
                <asp:HiddenField ID="hfICSGuid" runat="server" />
            </td>
        </tr>
    </table>
</asp:Content>
