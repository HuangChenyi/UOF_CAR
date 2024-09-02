<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UC_ToBeSignForm_OnlyAlert.ascx.cs" Inherits="Ede.Uof.Web.WKF.FormUse.FormHandle.UC_ToBeSignForm_OnlyAlert" %>
<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>


<style type="text/css">
    .BreakAll {
        word-break:break-all;
    }
</style>

<telerik:RadToolBar ID="radToolBar" runat="server" style="width:100%" OnButtonClick="radToolBar_ButtonClick">
    <Items>
        <telerik:RadToolBarButton runat="server" Value="readAll" Text="全部已讀" ImageUrl="~/Common/Images/Icon/icon_m240.png" meta:resourcekey="readAllResource1"></telerik:RadToolBarButton>
        <telerik:RadToolBarButton IsSeparator="true" runat="server"></telerik:RadToolBarButton>
    </Items>
</telerik:RadToolBar>
<table width="100%" cellpadding="0" cellspacing="0" border="0">
    <tr>
        <td style="white-space:nowrap; width:195px">
        </td>
        <td style="white-space:nowrap; width:15px">
            <asp:Image ID="Image2" runat="server" ImageUrl="~/Common/Images/Icon/icon_sm01.png" Visible="False" meta:resourcekey="Image2Resource1" />
        </td>
        <td style="white-space:nowrap; width:40px" class="SizeSB">
            <asp:Label ID="Label2" runat="server" Font-Bold="True"  Text="逾時" Visible="False" meta:resourcekey="Label2Resource1"></asp:Label>
        </td>
        <td style="white-space:nowrap; width:15px">
            <asp:Image ID="Image3" runat="server" ImageUrl="~/Common/Images/Icon/icon_sm02.png" meta:resourcekey="Image3Resource1" />
        </td>
        <td style="white-space:nowrap; width:40px" class="SizeSB">
            <asp:Label ID="Label3" runat="server" Font-Bold="True" Text="緊急" meta:resourcekey="Label3Resource1"></asp:Label>
        </td>
        <td style="white-space:nowrap; width:15px">
            <asp:Image ID="Image4" runat="server" ImageUrl="~/Common/Images/Icon/icon_sm03.png" meta:resourcekey="Image4Resource1" />
        </td>
        <td style="white-space:nowrap; width:30px" class="SizeSB">
            <asp:Label ID="Label4" runat="server" Font-Bold="True"  Text="急" meta:resourcekey="Label4Resource1"></asp:Label>
        </td>
        <td style="white-space:nowrap; width:15px">
            <asp:Image ID="Image5" runat="server" ImageUrl='~/Common/Images/Icon/icon_sm04.png'
                meta:resourcekey="Image5Resource1" />
        </td>
        <td style="white-space:nowrap; width:40px" class="SizeSB">
            <asp:Label ID="Label5" runat="server" Font-Bold="True" Text="普通" meta:resourcekey="Label5Resource1"></asp:Label>
        </td>
    </tr>
</table>

<asp:UpdatePanel ID="UpdatePanel1" runat="server" RenderMode="Inline" UpdateMode="Conditional">
    <ContentTemplate>
        <asp:Panel ID="plAlertForm" runat="server" CssClass="BreakAll" meta:resourcekey="plAlertFormResource1">
            <Fast:Grid ID="gridFormAlert" runat="server"
                AllowPaging="True" AllowSorting="True" AutoGenerateCheckBoxColumn="False" AutoGenerateColumns="False"
                BorderStyle="None" BorderWidth="0px"
                DataKeyOnClientWithCheckBox="False" DefaultSortDirection="Ascending"
                ShowHeader="False" SkinID="HomepageBlockStyle"
                Width="100%" EnhancePager="True" PageSize="15"
                OnRowDataBound="gridFormAlert_RowDataBound"
                OnRowCommand="gridFormAlert_RowCommand"
                OnPageIndexChanging="gridFormAlert_PageIndexChanging" CustomDropDownListPage="False" EmptyDataText="No data found" KeepSelectedRows="False" meta:resourcekey="gridFormAlertResource1" SelectedRowColor="" UnSelectedRowColor="">
                <ExportExcelSettings AllowExportToExcel="False" />
                <Columns>
                    <asp:TemplateField meta:resourcekey="TemplateFieldResource5">
                        <ItemTemplate>
                            <table>
                                <tr>
                                    <td style="min-width: 16px">
                                        <asp:Image runat="server" ID="ImgAlertReturn" meta:resourceKey="ImgAlertReturnResource1"></asp:Image>
                                    </td>
                                </tr>
                            </table>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField meta:resourcekey="TemplateFieldResource6">
                        <ItemTemplate>
                            <asp:LinkButton runat="server" ID="lbtnAlertDocNbr" meta:resourcekey="lbtnAlertDocNbrResource1"></asp:LinkButton>
                        </ItemTemplate>
                        <HeaderStyle Width="100%" />
                        <ItemStyle Width="100%" />
                    </asp:TemplateField>
                </Columns>
                <EnhancePagerSettings ShowHeaderPager="True" FirstAltImageUrl="" FirstImageUrl="" LastAltImage="" LastImageUrl="" NextIAltImageUrl="" NextImageUrl="" PageInfoCssClass="" PageNumberCssClass="" PageNumberCurrentCssClass="" PageRedirectCssClass="" PreviousAltImageUrl="" PreviousImageUrl="" />
            </Fast:Grid>
        </asp:Panel>
    </ContentTemplate>
</asp:UpdatePanel>