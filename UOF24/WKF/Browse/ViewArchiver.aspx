<%@ Page Title="歸檔處理者列表" Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" CodeBehind="ViewArchiver.aspx.cs" Inherits="Ede.Uof.Web.WKF.Browse.ViewArchiver" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" %>

<%@ Register Src="../../Common/ChoiceCenter/UC_ChoiceList.ascx" TagName="UC_ChoiceList" TagPrefix="uc1" %>
<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table style="width: 100%">
        <tr>
            <td style="width: 100%">
                <Fast:Grid ID="gridArchive" runat="server" Width="100%"
                    AllowSorting="True" AutoGenerateCheckBoxColumn="False"
                    AutoGenerateColumns="False" DataKeyNames="ARCHIVE_RM_ID" OnRowDataBound="gridArchive_RowDataBound"
                    DataKeyOnClientWithCheckBox="False" DefaultSortDirection="Ascending"
                    EnhancePager="True" PageSize="15" CustomDropDownListPage="False" EmptyDataText="No data found" KeepSelectedRows="False" meta:resourcekey="gridArchiveResource1" SelectedRowColor="" UnSelectedRowColor="">
                    <EnhancePagerSettings
                        ShowHeaderPager="True" FirstAltImageUrl="" FirstImageUrl="" LastAltImage="" LastImageUrl="" NextIAltImageUrl="" NextImageUrl="" PageInfoCssClass="" PageNumberCssClass="" PageNumberCurrentCssClass="" PageRedirectCssClass="" PreviousAltImageUrl="" PreviousImageUrl="" />
                    <ExportExcelSettings AllowExportToExcel="False" />
                    <Columns>
                        <asp:BoundField DataField="ARCHIVE_RM_ID" Visible="False" meta:resourcekey="BoundFieldResource1" />
                        <asp:TemplateField HeaderText="歸檔人員" meta:resourcekey="TemplateFieldResource2">
                            <ItemTemplate>
                                <uc1:UC_ChoiceList ID="choiceArchive" runat="server" ChioceType="User" IsAllowEdit="false" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="部門" meta:resourcekey="TemplateFieldResource1">
                            <ItemTemplate>
                                <uc1:UC_ChoiceList ID="choiceDept" runat="server" ChioceType="Group" IsAllowEdit="false" />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </Fast:Grid>
            </td>
        </tr>
    </table>
    <asp:Label ID="lblConfirm" runat="server" Text="是否要刪除歸檔處理者" Visible="False" meta:resourcekey="lblConfirmResource1"></asp:Label>
</asp:Content>
