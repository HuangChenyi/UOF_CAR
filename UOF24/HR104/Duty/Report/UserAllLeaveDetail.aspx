<%@ Page Title="可休假餘額查詢" Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" CodeBehind="UserAllLeaveDetail.aspx.cs" Inherits="Ede.Uof.Web.HR104.Duty.Report.UserAllLeaveDetail" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" %>
<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<asp:UpdatePanel ID="updatepanel1" runat="server"><ContentTemplate>
    <Fast:Grid ID="Grid1" runat="server" AutoGenerateCheckBoxColumn="False"
        AllowSorting="True" AutoGenerateColumns="False" 
        DataKeyOnClientWithCheckBox="False" 
        EmptyDataText="沒有資料" EnhancePager="True" OnSorting="Grid1_Sorting"
        KeepSelectedRows="False"  Width="100%" CustomDropDownListPage="False" DefaultSortDirection="Ascending" meta:resourcekey="Grid1Resource1" PageSize="15" SelectedRowColor="" UnSelectedRowColor="">

        <EnhancePagerSettings ShowHeaderPager="True" FirstAltImageUrl="" FirstImageUrl="" LastAltImage="" LastImageUrl="" NextIAltImageUrl="" NextImageUrl="" PageInfoCssClass="" PageNumberCssClass="" PageNumberCurrentCssClass="" PageRedirectCssClass="" PreviousAltImageUrl="" PreviousImageUrl="" />
        <ExportExcelSettings
            AllowExportToExcel="False" />
        <Columns>
            <asp:BoundField HeaderText="假別" DataField="LEAVE_REFERENCE_CLASS" SortExpression="LEAVE_REFERENCE_CLASS ASC" meta:resourcekey="BoundFieldResource1" >
                <HeaderStyle Wrap="False" />
                <ItemStyle HorizontalAlign="Left" />
            </asp:BoundField>
            <asp:BoundField HeaderText="可用" DataField="ANNUAL_MEMO" SortExpression="ANNUAL_LEAVE ASC,LEAVE_UNIT ASC" meta:resourcekey="BoundFieldResource2" >
                <HeaderStyle Wrap="False" />
                <ItemStyle HorizontalAlign="Right" />
            </asp:BoundField>
            <asp:BoundField HeaderText="已用" DataField="USED_MEMO" SortExpression="USED_LEAVE ASC,LEAVE_UNIT ASC" meta:resourcekey="BoundFieldResource3" >
                <HeaderStyle Wrap="False" />
                <ItemStyle HorizontalAlign="Right" />
            </asp:BoundField>
            <asp:BoundField HeaderText="剩餘" DataField="SURPLUS_MEMO" SortExpression="SURPLUS_LEAVE ASC,LEAVE_UNIT ASC" meta:resourcekey="BoundFieldResource4" >
                <HeaderStyle Wrap="False" />
                <ItemStyle HorizontalAlign="Right" />
            </asp:BoundField>
        </Columns>
    </Fast:Grid>
    <asp:Label ID="lblError" runat="server" ForeColor="Red" meta:resourcekey="lblErrorResource1"></asp:Label>
    <asp:Label ID="lblNotFoundSP" runat="server" Text="取得資料發生問題，請回報系統管理員。" Visible="False" meta:resourcekey="lblNotFoundSPResource1"></asp:Label>
    <asp:CustomValidator ID="cvCheckEmployeeNo" runat="server" ErrorMessage="申請者無員工編號或公司統一編號資訊" Display="Dynamic" meta:resourcekey="cvCheckEmployeeNoResource1"></asp:CustomValidator>
</ContentTemplate></asp:UpdatePanel>

</asp:Content>
