<%@ Page Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="WKF_FormUse_ReturnSign_ListSitesForReturn" Title="表單簽核" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" CodeBehind="ListSitesForReturn.aspx.cs" %>

<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>
<%@ Register Src="~/Common/ChoiceCenter/UC_ChoiceList.ascx" TagPrefix="uc1" TagName="UC_ChoiceList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="divReturnSign" runat="server">
        <table cellspacing="1" class="PopTable" width="100%">
            <tr>
                <td style="text-align: center;" class="PopTableHeader">
                    <center>
                <asp:Label ID="lblReturnSiteList" runat="server" Text="可退回站點列表" meta:resourcekey="lblReturnSiteListResource1"></asp:Label>
            </center>
                </td>
            </tr>
        </table>
        <Fast:Grid ID="grdReturnSiteList" runat="server" AllowSorting="True" AutoGenerateCheckBoxColumn="False"
            AutoGenerateColumns="False" DataKeyOnClientWithCheckBox="False"
            EnhancePager="True" PageSize="15"
            Width="100%" OnRowDataBound="grdReturnSiteList_RowDataBound" OnRowCommand="grdReturnSiteList_RowCommand">
            <EnhancePagerSettings
                ShowHeaderPager="True" FirstAltImageUrl="" FirstImageUrl="" LastAltImage="" LastImageUrl="" NextIAltImageUrl="" NextImageUrl="" PageInfoCssClass="" PageNumberCssClass="" PageNumberCurrentCssClass="" PageRedirectCssClass="" PreviousAltImageUrl="" PreviousImageUrl="" />
            <Columns>
                <asp:TemplateField HeaderText="站點" meta:resourcekey="TemplateFieldResource1">
                    <ItemStyle HorizontalAlign="Center" />
                    <HeaderStyle Wrap="False" />
                    <ItemTemplate>
                        <asp:Label runat="server" ID="lblSite" __designer:wfdid="w1" meta:resourcekey="lblSiteResource1"></asp:Label>

                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="站點型態" meta:resourcekey="TemplateFieldResource2">
                    <ItemStyle HorizontalAlign="Center" />
                    <HeaderStyle Wrap="False" />
                    <ItemTemplate>
                        <asp:Label runat="server" ID="lblSignType" __designer:wfdid="w4" meta:resourcekey="lblSignTypeResource1"></asp:Label>

                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="原簽核者" meta:resourcekey="TemplateFieldResource3">
                    <HeaderStyle Wrap="False" />
                    <ItemTemplate>
                        <asp:Label runat="server" ID="lblOriginalSigner" __designer:wfdid="w2" meta:resourcekey="lblOriginalSignerResource1"></asp:Label>
                        <asp:Label runat="server" ID="lblOrginialSignerExcept" __designer:wfdid="w2" Text="簽核者帳號異常" Visible="false" ForeColor="Red"></asp:Label>

                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="實際簽核者" meta:resourcekey="TemplateFieldResource4">
                    <HeaderStyle Wrap="False" />
                    <ItemTemplate>
                        <asp:Label runat="server" ID="lblActuralSigner" __designer:wfdid="w2" meta:resourcekey="lblActuralSignerResource1"></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="站點備註" meta:resourcekey="TemplateFieldResource6">
                    <HeaderStyle Wrap="False" />
                    <ItemTemplate>
                        <asp:Label runat="server" ID="lblSiteRemark"></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="操作" meta:resourcekey="TemplateFieldResource5">
                    <ItemStyle Wrap="False" HorizontalAlign="Center" />
                    <HeaderStyle Wrap="False" />
                    <ItemTemplate>
                        <asp:Button runat="server" ID="btnReturn" Text="退簽" CommandName="Return" __designer:wfdid="w2" meta:resourcekey="btnReturnResource1"></asp:Button>

                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </Fast:Grid>
        <asp:Label ID="lblAllowRA" runat="server" Text="*表單已被設定為不允許退回申請者。" Visible="false" ForeColor="Blue" meta:resourcekey="lblAllowRAResource1"></asp:Label>
    </div>
    <div id="divMemberReturn" runat="server">
        <table class="PopTable">
            <tr>
                <td style="text-align: center;" class="PopTableHeader" colspan="4">
                    <center>
                        <asp:Label ID="Label1" runat="server" Text="退簽對象" meta:resourcekey="Label1Resource3"></asp:Label>
                    </center>
                </td>
            </tr>
            <tr>
                <td class="PopTableLeftTD" style="width: 15%">
                    <asp:Label ID="lblSignType" runat="server" Text="簽核型態" meta:resourcekey="TemplateFieldResource2"></asp:Label>
                </td>
                <td class="PopTableRightTD" style="width: 25%">
                    <asp:Label ID="lblSignTypeValue" runat="server"></asp:Label>
                </td>
                <td class="PopTableLeftTD" style="width: 15%">
                    <asp:Label ID="lblSigner" runat="server" Text="原簽核者" meta:resourcekey="TemplateFieldResource3"></asp:Label>
                </td>
                <td class="PopTableRightTD" style="width: 45%">
                    <uc1:UC_ChoiceList runat="server" ID="UC_ChoiceList" IsAllowEdit="false" />
                </td>
            </tr>
        </table>
        <asp:Label runat="server" ID="lblSignerExcept" Text="簽核者帳號異常" Visible="false" ForeColor="Red"></asp:Label>
        <asp:HiddenField ID="hfLastSiteId" runat="server" />
        <asp:HiddenField ID="hfLastSignType" runat="server" />
        <asp:Label ID="lblAllowRAMember" runat="server" Text="表單已被設定為不允許退回申請者，無法退簽。" Visible="false" ForeColor="Blue" meta:resourcekey="lblAllowRAMemberResource1"></asp:Label>
    </div>
    <asp:Label ID="lblGeneral" runat="server" Text="一般" Visible="False" meta:resourcekey="lblGeneralResource1"></asp:Label>
    <asp:Label ID="lblOr" runat="server" Text="並簽" Visible="False" meta:resourcekey="lblOrResource1"></asp:Label>
    <asp:Label ID="lblAnd" runat="server" Text="會簽" Visible="False" meta:resourcekey="lblAndResource1"></asp:Label>
    <asp:Label ID="lblApplicant" runat="server" Text="申請者" Visible="False" meta:resourcekey="lblApplicantResource1"></asp:Label>
    <asp:Label ID="lblReturnToApplicant" runat="server" Text="退回申請者" Visible="False" meta:resourcekey="lblReturnToApplicantResource1"></asp:Label>
    <asp:Label ID="lblReturnMsg" runat="server" Text="返回" Visible="False" meta:resourcekey="lblReturnMsgResource1"></asp:Label>
    <asp:Label ID="lblCheckReturn" runat="server" Text="確定退簽至此站點？" Visible="False" meta:resourcekey="lblCheckReturnResource1"></asp:Label>
    <asp:Label ID="lblSignFail" runat="server" meta:resourcekey="lblSignFailResource1"
        Text="簽核失敗，可能是重複簽核或表單已被取回" Visible="false"></asp:Label>
    <asp:Label ID="lblNotSop" runat="server" meta:resourcekey="lblNotSopResource1"
                    Text="非正常程序開啟表單" Visible="False"></asp:Label>
    <asp:HiddenField ID="hfUserType" runat="server" />
    <asp:Label ID="lblNoAuth" runat="server" meta:resourcekey="lblNoAuthResource1" Text="無權限處理或觀看此表單" Visible="False"></asp:Label>
</asp:Content>

