<%@ Control Language="C#" AutoEventWireup="true" Inherits="EIP_Duty_Report_UC_AllLeaDetailByUser" Codebehind="UC_AllLeaDetailByUser.ascx.cs" %>
<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>
<asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>
        <div style="width: 99%">
            <telerik:RadToolBar ID="allLeaToolBar" runat="server" Width="100%" Visible="False">
                <Items>
                    <telerik:RadToolBarButton Value="selectYear">
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text="年度" meta:resourcekey="Label2Resource1"></asp:Label>
                            <asp:DropDownList ID="ddlYear" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlYear_SelectedIndexChanged" meta:resourcekey="ddlYearResource1">
                            </asp:DropDownList>
                        </ItemTemplate>
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton IsSeparator="true"></telerik:RadToolBarButton>
                </Items>
            </telerik:RadToolBar>
            <table style="width: 100%;">
                <tr>
                    <td>
                        <Fast:Grid ID="LeaveDetailGrid" runat="server" AutoGenerateCheckBoxColumn="False"
                            Width="100%" AllowSorting="True" AutoGenerateColumns="False" 
                            DataKeyOnClientWithCheckBox="False" DefaultSortDirection="Ascending" EmptyDataText="沒有資料" EnhancePager="True" KeepSelectedRows="False" PageSize="15"
                              OnRowDataBound="LeaveDetailGrid_RowDataBound"
                            meta:resourcekey="LeaveDetailGridResource1">
                            <EnhancePagerSettings ShowHeaderPager="True"></EnhancePagerSettings>
                            <ExportExcelSettings AllowExportToExcel="False"></ExportExcelSettings>
                            <Columns>
                                <asp:BoundField DataField="NAME" HeaderText="假別" meta:resourcekey="BoundFieldResource1">
                                    <HeaderStyle Width="20%" Wrap="False"></HeaderStyle>
                                    <ItemStyle Wrap="False"></ItemStyle>
                                </asp:BoundField>
                                <asp:BoundField DataField="DAYS" HeaderText="可用" meta:resourcekey="BoundFieldResource2">
                                    <HeaderStyle Width="10%"></HeaderStyle>
                                    <ItemStyle HorizontalAlign="Right" Wrap="False"></ItemStyle>
                                </asp:BoundField>
                                <asp:BoundField DataField="USED_DAYS" HeaderText="已用" meta:resourcekey="BoundFieldResource3">
                                    <HeaderStyle Width="10%"></HeaderStyle>
                                    <ItemStyle HorizontalAlign="Right" Wrap="False"></ItemStyle>
                                </asp:BoundField>
                                <asp:BoundField DataField="REMINE_DAYS" HeaderText="剩餘" meta:resourcekey="BoundFieldResource4">
                                    <HeaderStyle Width="10%"></HeaderStyle>
                                    <ItemStyle HorizontalAlign="Right" Wrap="False"></ItemStyle>
                                </asp:BoundField>
                                <asp:BoundField DataField="BEGIN" HeaderText="使用期限" meta:resourcekey="BoundFieldResource5">
                                    <HeaderStyle Width="25%"></HeaderStyle>
                                    <ItemStyle HorizontalAlign="Center" Wrap="False"></ItemStyle>
                                </asp:BoundField>
                                <asp:BoundField DataField="EXTEND" HeaderText="備註" meta:resourcekey="BoundFieldResource6">
                                    <HeaderStyle Width="25%" Wrap="False"></HeaderStyle>    
                                    <ItemStyle Wrap="False"></ItemStyle>                               
                                </asp:BoundField>
                            </Columns>
                        </Fast:Grid>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblYearMsg" runat="server" Text="特休假:顯示最新可用、已用及剩餘時(天)數" CssClass="SizeMemo" Visible="False" meta:resourcekey="lblYearMsgResource1"></asp:Label>
                        <asp:Label ID="lblShowTimeOffMsg" runat="server" CssClass="SizeMemo" Text="補休假:<br/>當年度，顯示當下剩餘且期限內的補休時數。<br/>非當年度，顯示所選年度後的所有剩餘補休時數。" Visible="False" meta:resourcekey="lblShowTimeOffMsgResource1"></asp:Label>
                    </td>
                </tr>
            </table>
        </div>
        <asp:Label ID="lblLeaveUnitHours" runat="server" Text="時" Visible="False" meta:resourcekey="lblLeaveUnitHoursResource1"></asp:Label>
        <asp:Label ID="lblLeaveUnitDays" runat="server" Text="天" Visible="False" meta:resourcekey="lblLeaveUnitDaysResource1"></asp:Label>
        <asp:Label ID="lblExtendText" runat="server" Text="上年度保留" Visible="False" meta:resourcekey="lblExtendTextResource1"></asp:Label>
        <asp:Label ID="lblTitleLevCode" runat="server" Text="假別" Visible="False" meta:resourcekey="lblTitleLevCodeResource1"></asp:Label>
        <asp:Label ID="lblDiffRemark" runat="server" Text="假別第{0}次申請" Visible="False" meta:resourcekey="lblDiffRemarkResource1"></asp:Label>
        <asp:Label ID="lblPROBATIONMsg" runat="server" Text="需到職滿{0}個月" Visible="False" meta:resourcekey="lblPROBATIONMsgResource1"></asp:Label>
    </ContentTemplate>
</asp:UpdatePanel>
