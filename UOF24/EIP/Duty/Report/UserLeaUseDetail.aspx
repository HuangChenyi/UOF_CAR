<%@ Page Title="可休假別時數明細" Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="EIP_Duty_Report_UserLeaUseDetail" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" Codebehind="UserLeaUseDetail.aspx.cs" %>
<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <contenttemplate>
    <table cellspacing="0" class="PopTable" width="100%">
        <tr>
            <td>
                <asp:Label ID="Label1" runat="server" Text="姓名" 
                    meta:resourcekey="Label1Resource1"></asp:Label>
            </td>
            <td>
                <asp:Label ID="lblUserName" runat="server" 
                    meta:resourcekey="lblUserNameResource1"></asp:Label>
            </td>
            <td>
                <asp:Label ID="Label2" runat="server" Text="年度" 
                    meta:resourcekey="Label2Resource1"></asp:Label>
            </td>
            <td>
                <asp:DropDownList ID="ddlYear" runat="server" AutoPostBack="True" 
                    onselectedindexchanged="ddlYear_SelectedIndexChanged" 
                    meta:resourcekey="ddlYearResource1">
                </asp:DropDownList>
            </td>
        </tr>
        </table>
    <table style="width: 100%;">
        <tr>
            <td>
                <asp:Label ID="lblShowTimeOffMsg" runat="server" ForeColor="Blue" meta:resourcekey="lblShowTimeOffMsgResource1"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <Fast:Grid ID="LeaveDetailGrid" runat="server" AutoGenerateCheckBoxColumn="False"
                    Width="100%" AllowSorting="True" AutoGenerateColumns="False" 
                    DataKeyOnClientWithCheckBox="False" DefaultSortDirection="Ascending" EmptyDataText="沒有資料" EnhancePager="True" KeepSelectedRows="False" PageSize="15"
                      
                    OnRowDataBound="LeaveDetailGrid_RowDataBound" 
                    meta:resourcekey="LeaveDetailGridResource1" CustomDropDownListPage="False" SelectedRowColor="" UnSelectedRowColor="">
                    <EnhancePagerSettings
                        ShowHeaderPager="True" FirstAltImageUrl="" FirstImageUrl="" LastAltImage="" LastImageUrl="" NextIAltImageUrl="" NextImageUrl="" PageInfoCssClass="" PageNumberCssClass="" PageNumberCurrentCssClass="" PageRedirectCssClass="" PreviousAltImageUrl="" PreviousImageUrl=""></EnhancePagerSettings>
                    <ExportExcelSettings AllowExportToExcel="False"></ExportExcelSettings>
                    <Columns>
                        <asp:BoundField DataField="NAME" HeaderText="假別" 
                            meta:resourcekey="BoundFieldResource1" >
                            <HeaderStyle Width="25%"></HeaderStyle>
                            <ItemStyle Wrap="True"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField DataField="DAYS" HeaderText="可用" 
                            meta:resourcekey="BoundFieldResource2" >
                            <HeaderStyle Width="10%"></HeaderStyle>
                            <ItemStyle HorizontalAlign="Right" Wrap="False"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField DataField="USED_DAYS" HeaderText="已用" 
                            meta:resourcekey="BoundFieldResource3">
                            <HeaderStyle Width="10%"></HeaderStyle>
                            <ItemStyle HorizontalAlign="Right" Wrap="False"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField DataField="REMINE_DAYS" HeaderText="剩餘" 
                            meta:resourcekey="BoundFieldResource4">
                            <HeaderStyle Width="10%"></HeaderStyle>
                            <ItemStyle HorizontalAlign="Right" Wrap="False"></ItemStyle>
                        </asp:BoundField>
                                                <asp:BoundField DataField="BEGIN" HeaderText="使用期限" 
                            meta:resourcekey="BoundFieldResource5">
<HeaderStyle Width="25%"></HeaderStyle>

<ItemStyle HorizontalAlign="Center" Wrap="False"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField DataField="EXTEND" HeaderText="備註" 
                            meta:resourcekey="BoundFieldResource6" >
<HeaderStyle Width="20%"></HeaderStyle>

<ItemStyle Wrap="True"></ItemStyle>
                        </asp:BoundField>
                    </Columns>
                </Fast:Grid>
            </td>
        </tr>
     </table>
     <asp:Label ID="lblLeaveUnitHours" runat="server" Text="時" Visible="False" meta:resourcekey="lblLeaveUnitHoursResource1" ></asp:Label>
     <asp:Label ID="lblLeaveUnitDays" runat="server" Text="天" Visible="False" meta:resourcekey="lblLeaveUnitDaysResource1" ></asp:Label>
     <asp:Label ID="lblExtendText" runat="server" Text="上年度保留" Visible="False" meta:resourcekey="lblExtendTextResource1" ></asp:Label>
     <asp:Label ID="lblTitleLevCode" runat="server" Text="假別" Visible="False" meta:resourcekey="lblTitleLevCodeResource1"></asp:Label>
    <asp:Label ID="lblDiffRemark" runat="server" Text="假別第{0}次申請" Visible="False" meta:resourcekey="lblDiffRemarkResource1"></asp:Label>
    <asp:Label ID="lblPROBATIONMsg" runat="server" Text="需到職滿{0}個月" Visible="False" meta:resourcekey="lblPROBATIONMsgResource1"></asp:Label>
     <asp:Label ID="lblMsg" runat="server" Text="補休假:顯示{0}年度所有未使用(含已過期)的補休時數" 
            Visible="False" meta:resourcekey="lblMsgResource1"></asp:Label>
         </contenttemplate>
    </asp:UpdatePanel>
    <asp:HiddenField ID="hfCurrentUser" runat="server" />
</asp:Content>
