<%@ Page Title="" Language="C#" MasterPageFile="~/Master/DefaultMasterPage.master" AutoEventWireup="true" Inherits="EIP_Duty_Report_QueryAllLeaDetailByUser" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" Codebehind="QueryAllLeaDetailByUser.aspx.cs" %>
<%@ Register Assembly="System.Web.Extensions, Version=1.0.61025.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI" TagPrefix="asp" %>
<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <table cellspacing="0" class="PopTable" width="100%">
                <tr>
                    <td style="width: 25%; white-space:nowrap;">
                        <asp:Label ID="Label1" runat="server" Text="姓名" meta:resourcekey="Label1Resource1"></asp:Label>
                    </td>
                    <td style="width: 25%; white-space:nowrap;">
                        <asp:Label ID="lblUserName" runat="server" meta:resourcekey="lblUserNameResource1"></asp:Label>
                    </td>
                    <td style="width: 25%; white-space:nowrap;">
                        <asp:Label ID="Label2" runat="server" Text="年度" meta:resourcekey="Label2Resource1"></asp:Label>
                    </td>
                    <td style="width: 25%; white-space:nowrap;">
                        <asp:DropDownList ID="ddlYear" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlYear_SelectedIndexChanged"
                            meta:resourcekey="ddlYearResource1">
                        </asp:DropDownList>
                    </td>
                </tr>
            </table>
            <table style="width: 100%;">
                <tr>
                    <td >
                        <asp:CheckBox ID="cbShowUsed" runat="server" Checked="True" AutoPostBack="True" 
                            Text="隱藏尚未申請過假別(不含系統假別)" oncheckedchanged="cbShowUsed_CheckedChanged" meta:resourcekey="cbShowUsedResource1" />
                        <asp:CheckBox ID="cbShowZero" runat="server" Checked="True" AutoPostBack="True" 
                            Text="可用為0不顯示(補休假是剩餘為0)" oncheckedchanged="cbShowZero_CheckedChanged" meta:resourcekey="cbShowZeroResource1" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <Fast:Grid ID="LeaveDetailGrid" runat="server" AutoGenerateCheckBoxColumn="False"
                            Width="100%" AllowSorting="True" AutoGenerateColumns="False" 
                            DataKeyOnClientWithCheckBox="False" DefaultSortDirection="Ascending" EmptyDataText="沒有資料" EnhancePager="True" KeepSelectedRows="False" PageSize="15"
                              OnRowDataBound="LeaveDetailGrid_RowDataBound"
                            meta:resourcekey="LeaveDetailGridResource1" CustomDropDownListPage="False" SelectedRowColor="" UnSelectedRowColor="">
                            <EnhancePagerSettings ShowHeaderPager="True"></EnhancePagerSettings>
                            <ExportExcelSettings AllowExportToExcel="False"></ExportExcelSettings>
                            <Columns>
                                <asp:BoundField DataField="NAME" HeaderText="假別" meta:resourcekey="BoundFieldResource1">
                                    <HeaderStyle Width="25%"></HeaderStyle>
                                    <ItemStyle Wrap="True"></ItemStyle>
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
                                    <HeaderStyle Width="20%"></HeaderStyle>
                                    <ItemStyle Wrap="True"></ItemStyle>
                                </asp:BoundField>
                            </Columns>
                        </Fast:Grid>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblShowTimeOffMsg" runat="server" ForeColor="Blue" Text="※補休假:當年度顯示當下可用補休時數；非當年度顯示所選年度的所有未使用補休時數。"
                            meta:resourcekey="lblShowTimeOffMsgResource1"></asp:Label>
                    </td>
                </tr>
            </table>
            <asp:Label ID="lblLeaveUnitHours" runat="server" Text="時" Visible="False" meta:resourcekey="lblLeaveUnitHoursResource1"></asp:Label>
            <asp:Label ID="lblLeaveUnitDays" runat="server" Text="天" Visible="False" meta:resourcekey="lblLeaveUnitDaysResource1"></asp:Label>
            <asp:Label ID="lblExtendText" runat="server" Text="上年度保留" Visible="False" meta:resourcekey="lblExtendTextResource1"></asp:Label>
            <asp:Label ID="lblTitleLevCode" runat="server" Text="假別" Visible="False" meta:resourcekey="lblTitleLevCodeResource1"></asp:Label>
            <asp:Label ID="lblDiffRemark" runat="server" Text="假別第{0}次申請" Visible="False" meta:resourcekey="lblDiffRemarkResource1"></asp:Label>
            <asp:Label ID="lblPROBATIONMsg" runat="server" Text="需到職滿{0}個月" Visible="False" meta:resourcekey="lblPROBATIONMsgResource1"></asp:Label>
            <asp:HiddenField ID="hfCurrentUser" runat="server" />
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
