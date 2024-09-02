<%@ Page Title="" Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="WKF_FormUse_ReturnSign_ListSitesForRaJumpReSend" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" Codebehind="ListSitesForRaJumpReSend.aspx.cs" %>

<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div id="contentDV" style="display:none">
    <table cellspacing="1" class="PopTable" width="100%">
        <tr>
            <td style=" text-align:center;" class="PopTableHeader">
            <center>
                <asp:Label ID="lblJumpSignSiteList" runat="server" Text="可送簽站點列表" meta:resourcekey="lblJumpSignSiteListResource1"></asp:Label>
            </center>
            </td>
        </tr>
    </table>
    <Fast:Grid ID="grdJumpSignSiteList" runat="server" AllowSorting="True" AutoGenerateCheckBoxColumn="False"
        AutoGenerateColumns="False"  DataKeyOnClientWithCheckBox="False"
        EnhancePager="True" PageSize="15" 
         Width="100%" 
        OnRowDataBound="grdJumpSignSiteList_RowDataBound" 
        OnRowCommand="grdJumpSignSiteList_RowCommand" DefaultSortDirection="Ascending" 
        EmptyDataText="沒有資料" EnableModelValidation="True" 
        KeepSelectedRows="False" meta:resourcekey="grdJumpSignSiteListResource1" >
        <EnhancePagerSettings
            ShowHeaderPager="True" FirstAltImageUrl="" FirstImageUrl="" LastAltImage="" LastImageUrl="" NextIAltImageUrl="" NextImageUrl="" PageInfoCssClass="" PageNumberCssClass="" PageNumberCurrentCssClass="" PageRedirectCssClass="" PreviousAltImageUrl="" PreviousImageUrl="" />

<ExportExcelSettings AllowExportToExcel="False"></ExportExcelSettings>
        <Columns>
            <asp:TemplateField HeaderText="站點" meta:resourcekey="TemplateFieldResource1">
                <itemstyle horizontalalign="Center" />
                <headerstyle wrap="False" />
                <itemtemplate>
<asp:Label runat="server" ID="lblSite" __designer:wfdid="w1" meta:resourcekey="lblSiteResource1"></asp:Label>
 
</itemtemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="站點型態" meta:resourcekey="TemplateFieldResource2">
                <itemstyle horizontalalign="Center" />
                <headerstyle wrap="False" />
                <itemtemplate>
<asp:Label runat="server" ID="lblSignType" __designer:wfdid="w4" meta:resourcekey="lblSignTypeResource1"></asp:Label>

</itemtemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="簽核者" meta:resourcekey="TemplateFieldResource3">
                <headerstyle wrap="False" />
                <itemtemplate>
<asp:Label runat="server" ID="lblOriginalSigner" __designer:wfdid="w2" meta:resourcekey="lblOriginalSignerResource1"></asp:Label>
<asp:Label runat="server" ID="lblOrginialSignerExcept" __designer:wfdid="w2" Text="簽核者帳號異常" 
                        Visible=False ForeColor=Red meta:resourcekey="lblOrginialSignerExceptResource1"></asp:Label>

</itemtemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="操作" meta:resourcekey="TemplateFieldResource5">
                <itemstyle wrap="False" horizontalalign="Center" />
                <headerstyle wrap="False" />
                <itemtemplate>
<asp:Button runat="server" ID="btnJumpSign" Text="送簽" CommandName="JumpSign" __designer:wfdid="w2" 
                        meta:resourcekey="btnJumpSignResource1"></asp:Button>
 
</itemtemplate>
            </asp:TemplateField>
        </Columns>
    </Fast:Grid>
        <asp:Label ID="lblGeneral" runat="server" Text="一般" Visible="False" meta:resourcekey="lblGeneralResource1" ></asp:Label>
        <asp:Label ID="lblOr" runat="server" Text="並簽" Visible="False" meta:resourcekey="lblOrResource1" ></asp:Label>
        <asp:Label ID="lblAnd" runat="server" Text="會簽" Visible="False" meta:resourcekey="lblAndResource1" ></asp:Label>
        <asp:Label ID="lblApplicant" runat="server" Text="申請者" Visible="False" meta:resourcekey="lblApplicantResource1" ></asp:Label>
        <asp:Label ID="lblJumpSignToApplicant" runat="server" Text="退回申請者" Visible="False" meta:resourcekey="lblJumpSignToApplicantResource1"></asp:Label>
        <asp:Label ID="lblJumpSignMsg" runat="server" Text="返回" Visible="False" meta:resourcekey="lblJumpSignMsgResource1" ></asp:Label>
        <asp:Label ID="lblCheckJumpSign" runat="server" Text="確定送簽至此站點？" Visible="False" meta:resourcekey="lblCheckJumpSignResource1"></asp:Label>
        <asp:Label ID="lblSignFail" runat="server" meta:resourcekey="lblSignFailResource1"
        Text="簽核失敗，可能是重複簽核或表單已被取回" Visible ="False" ></asp:Label>
        <asp:Label ID="lblNoAuth" runat="server" meta:resourcekey="lblNoAuthResource1" Text="無權限處理或觀看此表單" Visible="False"></asp:Label>
    </div>
</asp:Content>

