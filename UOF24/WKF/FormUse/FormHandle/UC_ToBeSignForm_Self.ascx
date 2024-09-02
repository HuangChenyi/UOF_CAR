<%@ Control Language="C#" AutoEventWireup="true" Inherits="WKF_FormUse_FormHandle_UC_ToBeSignForm_Self" Codebehind="UC_ToBeSignForm_Self.ascx.cs" %>
<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<script id="ToBeSignFormjs" type="text/javascript">
    function GetSelfFormInfos() {
        return $uof.tool.htmlDecode($('#<%=hfSelfForms.ClientID%>').val());
    }
    function GetAgentFormInfos() {
        return $uof.tool.htmlDecode($('#<%=hfAgentForms.ClientID%>').val());
    }

    function OnBarMainClick(sender, args) {
        if (args.get_item().get_value() == "BatchSign") {
            args.set_cancel(true);
            if ($('#<%=hfBatchSignType.ClientID%>').val() == "BatchSignForSingle") // BatchSignForSingle:舊的批次簽核(逐筆) BatchSign:新的批次簽核(背景批次)(預設)
                $uof.dialog.open2("~/WKF/FormUse/BatchSign/SignViewForSingle.aspx", args.get_item(), "", 1024, 768, webPartDialogResult);
            else
                $uof.dialog.open2("~/WKF/FormUse/BatchSign/SignView.aspx", args.get_item(), "", 1024, 768, webPartDialogResult);
        }
    }
    function webPartDialogResult(returnValue) {        
        if (typeof (returnValue) == "undefined") {
            //$("#" + SignclientID).css("cursor", "pointer").prop("disabled", false);
            return false;
        }
        return true;
    }
</script>

<style type="text/css">
    .BatchSign
    {
        cursor: hand;
    }

    .BreakAll {
        word-break:break-all;
    }
</style>
<table width="100%" cellpadding="0" cellspacing="0" border="0">
    <tr>
        <td colspan="9" style="height: 30px; vertical-align: top">
            <telerik:RadToolBar ID="webToolBar" runat="server" OnClientButtonClicking="OnBarMainClick"
                OnButtonClick="webToolBar_ButtonClick" Width="100%">
                <Items>
                    <telerik:RadToolBarButton runat="server" meta:resourceKey="TBarButtonResource1" CheckedImageUrl="~/Common/Images/Icon/icon_m182.png"
                        DisabledImageUrl="~/Common/Images/Icon/icon_m182.png" HoveredImageUrl="~/Common/Images/Icon/icon_m182.png"
                        ImageUrl="~/Common/Images/Icon/icon_m182.png" Text="批次簽核" Value="BatchSign">
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton runat="server" IsSeparator="true" Value="sBatchSign">
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton runat="server" meta:resourceKey="TBarButtonResource2" CheckedImageUrl="~/Common/Images/Icon/icon_m95_g.png"
                        DisabledImageUrl="~/Common/Images/Icon/icon_m95_g.png" HoveredImageUrl="~/Common/Images/Icon/icon_m95_g.png"
                        ImageUrl="~/Common/Images/Icon/icon_m95_g.png" Text="表單申請" Value="AddFormScript">
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton runat="server" IsSeparator="true" Value="sAddFormScript">
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton runat="server" meta:resourceKey="TBarButtonResource3" CheckedImageUrl="~/Common/Images/Icon/icon_m39.png"
                        DisabledImageUrl="~/Common/Images/Icon/icon_m39.png" HoveredImageUrl="~/Common/Images/Icon/icon_m39.png"
                        ImageUrl="~/Common/Images/Icon/icon_m39.png" Text="表單查詢" Value="FormQuery">
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton runat="server" IsSeparator="true" Value="sFormQuery">
                    </telerik:RadToolBarButton>
                </Items>
            </telerik:RadToolBar>
        </td>
    </tr>
    <tr>
        <td nowrap width="195">
            <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                <ContentTemplate>
                    <asp:Label ID="Label1" runat="server" Font-Bold="True" CssClass="SizeSB"  Text="待簽表單(自己)"
                        meta:resourcekey="Label1Resource1"></asp:Label>
                </ContentTemplate>
            </asp:UpdatePanel>
        </td>
        <td nowrap width="15">
            <asp:Image ID="Image2" runat="server" ImageUrl="~/Common/Images/Icon/icon_sm01.png"
                meta:resourcekey="Image2Resource1" Visible="False" />
        </td>
        <td nowrap width="40" class="SizeSB">
            <asp:Label ID="Label2" runat="server" Font-Bold="True"  Text="逾時"
                meta:resourcekey="Label2Resource1" Visible="False"></asp:Label>
        </td>
        <td nowrap width="15">
            <asp:Image ID="Image3" runat="server" ImageUrl="~/Common/Images/Icon/icon_sm02.png"
                meta:resourcekey="Image3Resource1" />
        </td>
        <td nowrap width="40" class="SizeSB">
            <asp:Label ID="Label3" runat="server" Font-Bold="True" Text="緊急"
                meta:resourcekey="Label3Resource1"></asp:Label>
        </td>
        <td nowrap width="15">
            <asp:Image ID="Image4" runat="server" ImageUrl="~/Common/Images/Icon/icon_sm03.png"
                meta:resourcekey="Image4Resource1" />
        </td>
        <td nowrap width="30" class="SizeSB">
            <asp:Label ID="Label4" runat="server" Font-Bold="True"  Text="急" meta:resourcekey="Label4Resource1"></asp:Label>
        </td>
        <td nowrap width="15">
            <asp:Image ID="Image5" runat="server" ImageUrl='~/Common/Images/Icon/icon_sm04.png'
                meta:resourcekey="Image5Resource1" />
        </td>
        <td nowrap style="width: 40px" class="SizeSB">
            <asp:Label ID="Label5" runat="server" Font-Bold="True" Text="普通"
                meta:resourcekey="Label5Resource1"></asp:Label>
        </td>
        <!--<td nowrap width="15">
            <asp:Image ID="Image6" runat="server" ImageUrl='~/Common/Images/Icon/icon_sm05.gif' meta:resourcekey="Image6Resource1" /></td>
        <td nowrap style="width: 60px">
            <asp:Label ID="Label6" runat="server" Font-Bold="True" Font-Size="8pt" Text="進行簽核" meta:resourcekey="Label6Resource1"></asp:Label></td>-->
    </tr>
    <tr>
        <td colspan="9">
            <asp:Label ID="lblMsg" runat="server" Visible="false" Text="有需簽核的表單，請通知管理者開放電子簽核的外部使用者權限" ForeColor="Blue" meta:resourcekey="lblMsgResource1"></asp:Label>
        </td>
    </tr>
</table>
<asp:UpdatePanel ID="UpdatePanel1" runat="server" RenderMode="Inline" UpdateMode="Conditional">
    <ContentTemplate>
        <asp:Panel ID="plFormList" runat="server" CssClass="BreakAll">
            <Fast:Grid ID="DGFormList" runat="server" AllowSorting="True" AutoGenerateCheckBoxColumn="False"
                AutoGenerateColumns="False" SkinID="HomepageBlockStyle" Width="100%" AllowPaging="True"
                ShowHeader="False" OnRowDataBound="DGFormList_RowDataBound" BorderStyle="None"
                BorderWidth="0px" OnPageIndexChanging="DGFormList_PageIndexChanging" DataKeyOnClientWithCheckBox="False"
                OnRowCommand="DGFormList_RowCommand" EnhancePager="True" PageSize="15" DefaultSortDirection="Ascending">
                <ExportExcelSettings AllowExportToExcel="False" />
                <Columns>
                    <asp:TemplateField meta:resourcekey="TemplateFieldResource1">
                        <ItemTemplate>
                            <table>
                                <tr>
                                    <td style="min-width:16px">
                                        <asp:Image runat="server" ID="Image1" meta:resourceKey="Image1Resource1" __designer:wfdid="w6"></asp:Image>
                                   </td>
                                </tr>
                            </table>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField meta:resourcekey="TemplateFieldResource2">
                        <ItemTemplate>
                            <asp:LinkButton runat="server" ID="lbtnDocNbr" CommandName="Reflash" meta:resourceKey="LinkButton1Resource1"
                                __designer:wfdid="w2"></asp:LinkButton>
                        </ItemTemplate>
                        <HeaderStyle Width="100%" />
                        <ItemStyle Width="100%" />
                    </asp:TemplateField>
                    <asp:TemplateField meta:resourcekey="TemplateFieldResource3">
                        <ItemTemplate>
                            <asp:ImageButton runat="server" ID="ImageButton1" __designer:wfdid="w15" meta:resourcekey="ImageButton1Resource2"
                                Visible="false"></asp:ImageButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <EnhancePagerSettings ShowHeaderPager="True" FirstAltImageUrl="" FirstImageUrl=""
                    LastAltImage="" LastImageUrl="" NextIAltImageUrl="" NextImageUrl="" PageInfoCssClass=""
                    PageNumberCssClass="" PageNumberCurrentCssClass="" PageRedirectCssClass="" PreviousAltImageUrl=""
                    PreviousImageUrl="" />
            </Fast:Grid>
        </asp:Panel>
        <asp:Panel ID="plAgent" runat="server" CssClass="BreakAll">
            <asp:Label ID="lblAgent" runat="server" Text="待簽表單(代理)"  class="SizeSB"
                meta:resourcekey="lblAgentResource1"></asp:Label>
            <Fast:Grid ID="Grid1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateCheckBoxColumn="False"
                AutoGenerateColumns="False" BorderStyle="None" BorderWidth="0px" OnPageIndexChanging="Grid1_PageIndexChanging"
                OnRowCommand="Grid1_RowCommand" OnRowDataBound="Grid1_RowDataBound" ShowHeader="False"
                SkinID="HomepageBlockStyle" Width="100%" DataKeyOnClientWithCheckBox="False"
                EnhancePager="True" PageSize="15" DefaultSortDirection="Ascending">
                <ExportExcelSettings AllowExportToExcel="False" />
                <Columns>
                    <asp:TemplateField meta:resourcekey="TemplateFieldResource1">
                        <ItemTemplate>
                            <table>
                                <tr>
                                    <td style="min-width: 16px">
                                        <asp:Image runat="server" ID="ImgSignAgent" meta:resourceKey="ImgSignAgentResource1"></asp:Image>
                                    </td>
                                </tr>
                            </table>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField meta:resourcekey="TemplateFieldResource2">
                        <ItemTemplate>
                            <asp:LinkButton runat="server" ID="lbtnAgentDocNbr" __designer:wfdid="w9" meta:resourcekey="lbtnAgentDocNbrResource1"></asp:LinkButton>
                        </ItemTemplate>
                        <HeaderStyle Width="100%" />
                        <ItemStyle Width="100%" />
                    </asp:TemplateField>
                    <asp:TemplateField meta:resourcekey="TemplateFieldResource4">
                        <ItemTemplate>
                            <asp:ImageButton runat="server" ID="ImgbtnSignAgent" meta:resourcekey="ImgbtnSignAgentResource1"
                                Visible="false"></asp:ImageButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <EnhancePagerSettings ShowHeaderPager="True" FirstAltImageUrl="" FirstImageUrl=""
                    LastAltImage="" LastImageUrl="" NextIAltImageUrl="" NextImageUrl="" PageInfoCssClass=""
                    PageNumberCssClass="" PageNumberCurrentCssClass="" PageRedirectCssClass="" PreviousAltImageUrl=""
                    PreviousImageUrl="" />
            </Fast:Grid>
        </asp:Panel>
        <asp:Panel ID="plReturnToApplicant" runat="server" CssClass="BreakAll">
            <asp:Label ID="lblReturnToApplicant" runat="server" class="SizeSB"
                Text="被退回的申請" meta:resourcekey="lblReturnToApplicantResource1"></asp:Label>
            <Fast:Grid ID="grdReturnToApplicant" runat="server" AllowPaging="True" AllowSorting="True"
                AutoGenerateCheckBoxColumn="False" AutoGenerateColumns="False" BorderStyle="None"
                BorderWidth="0px" ShowHeader="False" SkinID="HomepageBlockStyle" Width="100%"
                DataKeyOnClientWithCheckBox="False" EnhancePager="True" PageSize="15" OnPageIndexChanging="grdReturnToApplicant_PageIndexChanging"
                OnRowCommand="grdReturnToApplicant_RowCommand" OnRowDataBound="grdReturnToApplicant_RowDataBound"
                DefaultSortDirection="Ascending">
                <ExportExcelSettings AllowExportToExcel="False" />
                <Columns>
                    <asp:TemplateField meta:resourcekey="TemplateFieldResource5">
                        <ItemTemplate>
                            <table>
                                <tr>
                                    <td style="min-width: 16px">
                                        <asp:Image runat="server" ID="ImgSignReturn" meta:resourceKey="ImgSignReturnResource1"></asp:Image>
                                    </td>
                                </tr>
                            </table>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField meta:resourcekey="TemplateFieldResource6">
                        <ItemTemplate>
                            <!--<asp:Label runat="server" ID="lblReturnDocNbr" __designer:wfdid="w9" 
                                meta:resourcekey="lblReturnDocNbrResource1"></asp:Label>-->
                            <asp:LinkButton runat="server" ID="lbtnReturnDocNbr"></asp:LinkButton>
                        </ItemTemplate>
                        <HeaderStyle Width="100%" />
                        <ItemStyle Width="100%" />
                    </asp:TemplateField>
                    <asp:TemplateField meta:resourcekey="TemplateFieldResource7">
                        <ItemTemplate>
                            <asp:ImageButton runat="server" ID="ImgbtnSignReturn" meta:resourcekey="ImgbtnSignReturnResource1"
                                Visible="false"></asp:ImageButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <EnhancePagerSettings ShowHeaderPager="True" FirstAltImageUrl="" FirstImageUrl=""
                    LastAltImage="" LastImageUrl="" NextIAltImageUrl="" NextImageUrl="" PageInfoCssClass=""
                    PageNumberCssClass="" PageNumberCurrentCssClass="" PageRedirectCssClass="" PreviousAltImageUrl=""
                    PreviousImageUrl="" />
            </Fast:Grid>
        </asp:Panel>
        <asp:Panel ID="plIQYForm" runat="server" CssClass="BreakAll">
            <asp:Label ID="lblIQYForm" runat="server" class="SizeSB"  Text="被徵詢的表單"
                meta:resourcekey="lblIQYFormResource1"></asp:Label>
            <Fast:Grid ID="GridIQYForm" runat="server" AllowPaging="True" AllowSorting="True"
                AutoGenerateCheckBoxColumn="False" AutoGenerateColumns="False" BorderStyle="None"
                BorderWidth="0px" ShowHeader="False" SkinID="HomepageBlockStyle" Width="100%"
                DataKeyOnClientWithCheckBox="False" EnhancePager="True" PageSize="15" OnRowCommand="GridIQYForm_RowCommand"
                OnPageIndexChanging="GridIQYForm_PageIndexChanging" OnRowDataBound="GridIQYForm_RowDataBound"
                DefaultSortDirection="Ascending">
                <ExportExcelSettings AllowExportToExcel="False" />
                <Columns>
                    <asp:TemplateField meta:resourcekey="TemplateFieldResource5">
                        <ItemTemplate>
                            <table>
                                <tr>
                                    <td style="min-width:16px">
                                        <asp:Image runat="server" ID="ImgIQYFormReturn" meta:resourcekey="ImgIQYFormReturnResource1"></asp:Image>
                                </td>
                                </tr>
                            </table>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField meta:resourcekey="TemplateFieldResource6">
                        <ItemTemplate>
                            <asp:LinkButton runat="server" ID="lbtnIQYFormDocNbr" meta:resourcekey="lbtnIQYFormDocNbrResource1"></asp:LinkButton>
                        </ItemTemplate>
                        <HeaderStyle Width="100%" />
                        <ItemStyle Width="100%" />
                    </asp:TemplateField>
                </Columns>
                <EnhancePagerSettings ShowHeaderPager="True" FirstAltImageUrl="" FirstImageUrl=""
                    LastAltImage="" LastImageUrl="" NextIAltImageUrl="" NextImageUrl="" PageInfoCssClass=""
                    PageNumberCssClass="" PageNumberCurrentCssClass="" PageRedirectCssClass="" PreviousAltImageUrl=""
                    PreviousImageUrl="" />
            </Fast:Grid>
        </asp:Panel>
        <asp:HiddenField ID="hfSelfForms" runat="server" />
        <asp:HiddenField ID="hfAgentForms" runat="server" />
    </ContentTemplate>
</asp:UpdatePanel>
<asp:HiddenField ID="hfBatchSignType" runat="server" />
