<%@ Control Language="C#" AutoEventWireup="true"
    Inherits="EIP_Bulletin_UC_NewBulletinList" Codebehind="UC_NewBulletinList.ascx.cs" %>
<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>

<asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
    <ContentTemplate>
        <Fast:Grid ID="Grid1" runat="server" AllowSorting="True" AutoGenerateCheckBoxColumn="False" meta:resourcekey="Grid1Resource1"
            AutoGenerateColumns="False"
            Width="100%" BorderStyle="None" BorderWidth="0px" ShowHeader="False" SkinID="HomepageBlockStyle" OnRowDataBound="Grid1_RowDataBound" AllowPaging="True" OnPageIndexChanging="Grid1_PageIndexChanging">
            <EnhancePagerSettings FirstAltImageUrl="" FirstImageUrl="" LastAltImage=""
                LastImageUrl="" NextIAltImageUrl="" NextImageUrl="" PageInfoCssClass=""
                PageNumberCssClass="" PageNumberCurrentCssClass="" PageRedirectCssClass=""
                PreviousAltImageUrl="" PreviousImageUrl="" ShowHeaderPager="True"  />
            <ExportExcelSettings AllowExportToExcel="False" />
            <Columns>
                <asp:TemplateField meta:resourcekey="TemplateFieldResource1">
                    <HeaderStyle Height="0px" />
                    <ItemTemplate>
                        <table style="width: 100%;word-break:break-all" border="0">
                            <tr>
                                <td style="width: 16px">
                                    <img height="16" src="<%=ResolveUrl("~/common/images/icon/icon02.png")%>" width="16" />

                                </td>
                                <td style="width: 22px">
                                    <asp:Image ID="ImageStatus" runat="server" ImageUrl="~/Common/Images/BulletinNew.gif" />
                                </td>
                                <td style="width: 75%">
                                    <asp:LinkButton runat="server" ID="LinkButton1" Text='' OnClick="LinkButton1_Click"></asp:LinkButton>

                                </td>
                                <td>
                                    <asp:Label ID="lblClassName" runat="server" meta:resourcekey="lblUserResource1"></asp:Label>
                                </td>
                            </tr>
                        </table>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </Fast:Grid>
        <asp:HiddenField ID="hfCurrentUser" runat="server" />
    </ContentTemplate>
</asp:UpdatePanel>

