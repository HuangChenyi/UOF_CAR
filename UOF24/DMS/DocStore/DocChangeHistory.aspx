<%@ Page Title="文件置換歷程" Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" CodeBehind="DocChangeHistory.aspx.cs" Inherits="Ede.Uof.Web.DMS.DocStore.DocChangeHistory" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" %>

<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Ede" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script type="text/javascript">
        function DownloadFileWithHandler(sHandlerUrl, sUserProxyIndex) {
            $uof.download(sHandlerUrl, sUserProxyIndex);
            return false;
        }
    </script>
    <asp:UpdatePanel runat="server">
        <ContentTemplate>

    <Ede:Grid ID="Grid1" runat="server" Width="100%" AllowPaging="True" AllowSorting="True" AutoGenerateCheckBoxColumn="False" AutoGenerateColumns="False" CustomDropDownListPage="False" DataKeyOnClientWithCheckBox="False" DefaultSortDirection="Ascending" EmptyDataText="No data found" EnhancePager="True" KeepSelectedRows="False" PageSize="15" SelectedRowColor="" UnSelectedRowColor="" OnPageIndexChanging="Grid1_PageIndexChanging" OnRowDataBound="Grid1_RowDataBound" meta:resourcekey="Grid1Resource1">
        <EnhancePagerSettings FirstImageUrl="" FirstAltImageUrl="" PreviousImageUrl="" NextImageUrl="" LastImageUrl="" LastAltImage="" PageNumberCssClass="" PageNumberCurrentCssClass="" PageInfoCssClass="" PageRedirectCssClass="" NextIAltImageUrl="" PreviousAltImageUrl="" ShowHeaderPager="True"></EnhancePagerSettings>

        <ExportExcelSettings AllowExportToExcel="False"></ExportExcelSettings>
        <Columns>
            <asp:TemplateField HeaderText="置換時間" meta:resourcekey="TemplateFieldResource1">
                <ItemTemplate>
                    <asp:Label ID="lblChangeDate" runat="server" meta:resourcekey="lblChangeDateResource1"></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="置換者" meta:resourcekey="TemplateFieldResource2">
                <ItemTemplate>
                    <asp:Label ID="lblChangeUser" runat="server" meta:resourcekey="lblChangeUserResource1"></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="操作" meta:resourcekey="TemplateFieldResource3" HeaderStyle-Width="100px">
                <ItemTemplate>
                    <table style="width:100%; ">
                        <tr>
                            <td style="text-align:center;">
                                <asp:LinkButton ID="lbtnView" runat="server" Text="查看" meta:resourcekey="lbtnViewResource1"></asp:LinkButton>
                            </td>
                            <td style="text-align:center;">
                                <asp:LinkButton ID="lbtnReason" runat="server" Text="原因" meta:resourcekey="lbtnReasonResource1"></asp:LinkButton>
                            </td>
                        </tr>
                    </table>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </Ede:Grid>
    <asp:Label ID="lblFileNotTransferToUof" runat="server" Text="目前檔案仍在Proxy伺服器，正由系統進行傳輸中，請稍後！" Visible="False" ForeColor="Blue" meta:resourcekey="lblFileNotTransferToUofResource1"></asp:Label>
                    </ContentTemplate>
    </asp:UpdatePanel>

</asp:Content>
