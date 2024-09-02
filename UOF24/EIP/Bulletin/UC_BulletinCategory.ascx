<%@ Control Language="C#"
    AutoEventWireup="true"
    CodeBehind="UC_BulletinCategory.ascx.cs"
    Inherits="Ede.Uof.Web.EIP.Bulletin.UC_BulletinCategory" %>

<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>
   
<asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
    <ContentTemplate>
        <Fast:Grid ID="gdCategoryBulletin" runat="server" AllowSorting="True" AutoGenerateCheckBoxColumn="False" AutoGenerateColumns="False"
                   Width="100%" BorderStyle="None" BorderWidth="0px" ShowHeader="False" SkinID="HomepageBlockStyle" 
                    OnRowDataBound="gdCategoryBulletin_RowDataBound" CustomDropDownListPage="False" DataKeyOnClientWithCheckBox="False" DefaultSortDirection="Ascending" EmptyDataText="No data found" EnhancePager="True" KeepSelectedRows="False" meta:resourcekey="Grid1Resource1" PageSize="15" SelectedRowColor="" UnSelectedRowColor="">
            <EnhancePagerSettings ShowHeaderPager="True"/>
            <ExportExcelSettings AllowExportToExcel="False" />
            <Columns>
                <asp:TemplateField meta:resourcekey="TemplateFieldResource1">
                    <HeaderStyle Height="0px" />
                    <ItemTemplate>
                        <table style="width: 100%; word-break:break-all" border="0">
                            <tr> 
                                <asp:Panel ID="plClass" runat="server" meta:resourcekey="plClassResource1">
                                <td style="white-space:nowrap">
                                    <asp:Label ID="lblClass" runat="server" ForeColor="Black" Font-Bold="True" meta:resourcekey="lblClassResource1"></asp:Label>
                                </td>
                                </asp:Panel>
                                <td style="width: 16px; white-space:nowrap">
                                    <asp:Image ID="ImageIcon" runat="server" ImageUrl="~/Common/Images/icon/icon02.png" width="16px" height="16px" meta:resourcekey="ImageIconResource1"/>                                   
                                </td>
                             
                                <td style="width: 22px; white-space:nowrap">
                                    <asp:Image ID="ImageStatus" runat="server" ImageUrl="~/Common/Images/BulletinNew.gif" meta:resourcekey="ImageStatusResource1" />
                                    <asp:Image ID="ImageSticky" runat="server" ImageUrl="~/Common/Images/icon/icon_m225.png" meta:resourcekey="ImageStickyResource1" /> 
                                </td>
                                <td>
                                    <asp:LinkButton runat="server" ID="lbtnBulletin" OnClick="lbtnBulletin_Click" meta:resourcekey="lbtnBulletinResource1"></asp:LinkButton>                                    
                                </td>
                                <asp:Panel ID="plMoreBulletin" runat="server" meta:resourcekey="plMoreBulletinResource1">
                                <td style="text-align:right; white-space:nowrap">
                                    <asp:LinkButton runat="server" ID="lbtnMoreBulletin" Text="查看更多"  ForeColor="Blue" meta:resourcekey="lbtnMoreBulletinResource1"></asp:LinkButton>
                                </td>
                                 </asp:Panel>
                            </tr>
                        </table>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </Fast:Grid>
        <asp:HiddenField ID="hfCurrentUser" runat="server" />
        <asp:HiddenField ID="hfCurrentUserType" runat="server" />
    </ContentTemplate>
</asp:UpdatePanel>
