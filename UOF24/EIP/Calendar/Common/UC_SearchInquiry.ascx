<%@ Control Language="C#" AutoEventWireup="true" Inherits="EIP_Calendar_Common_UC_SearchInquiry" CodeBehind="UC_SearchInquiry.ascx.cs" %>
<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>
<table width="100%">
    <tr>
        <td>
            <Fast:Grid ID="gridInquiry" runat="server" AllowSorting="True" AutoGenerateCheckBoxColumn="False"
                AutoGenerateColumns="False" AutoGenerateSelectButton="True"
                DataKeyOnClientWithCheckBox="False" EnhancePager="True" Width="100%"
                DataKeyNames="INQUIRY_GUID" OnRowDataBound="gridInquiry_RowDataBound"
                OnSelectedIndexChanged="gridinquiry_SelectedIndexChanged"
                AllowPaging="True" OnPageIndexChanging="gridinquiry_PageIndexChanging"
                DefaultSortDirection="Ascending"
                PageSize="15">
                <EnhancePagerSettings
                    ShowHeaderPager="True" FirstAltImageUrl="" FirstImageUrl="" LastAltImage="" LastImageUrl="" NextIAltImageUrl="" NextImageUrl="" PageInfoCssClass="" PageNumberCssClass="" PageNumberCurrentCssClass="" PageRedirectCssClass="" PreviousAltImageUrl="" PreviousImageUrl="" />

                <ExportExcelSettings AllowExportToExcel="False"></ExportExcelSettings>

                <Columns>
                    <asp:BoundField DataField="SUBJECT" HeaderText="徵詢主旨"
                        meta:resourcekey="BoundFieldResource1" />
                    <asp:TemplateField HeaderText="徵詢截止時間" meta:resourcekey="BoundFieldResource2">
                        <ItemTemplate>
                            <asp:Label ID="lblInquiryTime" runat="server"></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle Wrap="False" />
                    </asp:TemplateField>
                    <asp:BoundField DataField="USER_COUNT" HeaderText="回覆人數"
                        meta:resourcekey="BoundFieldResource3" />
                </Columns>

                <SelectedRowStyle BackColor="#FFC0C0" />

            </Fast:Grid>

        </td>
    </tr>
</table>
<asp:HiddenField ID="hidShowSelectColumn" runat="server" Value="true" />

