<%@ Control Language="C#" AutoEventWireup="true"
    Inherits="PMS_Common_UC_HOMEAudit" Codebehind="UC_HOMEAudit.ascx.cs" %>
<%@ Register Src="../../Common/ChoiceCenter/UC_ChoiceList.ascx" TagName="UC_ChoiceList"
    TagPrefix="uc1" %>
<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>
<table>
    <tr>
        <td style="padding: 2px; vertical-align: middle; text-align: center;">
            <img width="16" height="16" src="<%=Request.ApplicationPath %>/Common/images/icon/icon_m90.png" /></td>
        <td style="padding: 2px; vertical-align: middle; text-align: center;">
            <asp:Label ID="Label1" runat="server" Text="專案" meta:resourcekey="Label1Resource1"></asp:Label></td>
        <td style="padding: 2px; vertical-align: middle; text-align: center;">
            <img width="16" height="16" src="<%=Request.ApplicationPath %>/Common/images/icon/icon_m88.png" /></td>
        <td style="padding: 2px; vertical-align: middle; text-align: center;">
            <asp:Label ID="Label2" runat="server" Text="階段" meta:resourcekey="Label2Resource1"></asp:Label></td>
        <td style="padding: 2px; vertical-align: middle; text-align: center;">
            <img width="16" height="16" src="<%=Request.ApplicationPath %>/Common/images/icon/icon_m147.png" /></td>
        <td style="padding: 2px; vertical-align: middle; text-align: center;">
            <asp:Label ID="Label3" runat="server" Text="任務" meta:resourcekey="Label3Resource1"></asp:Label></td>
    </tr>
</table>
<asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>
        <Fast:Grid ID="gridAudit" runat="server" AllowSorting="True" AutoGenerateCheckBoxColumn="False"
            AutoGenerateColumns="False" DataKeyOnClientWithCheckBox="False"
            ShowHeader="False" SkinID="HomepageBlockStyle"
            GridLines="None" OnRowDataBound="gridAudit_RowDataBound" Width="100%"
            EnhancePager="True" meta:resourcekey="gridAuditResource1" PageSize="15"
            AllowPaging="True" OnPageIndexChanging="gridAudit_PageIndexChanging">
            <ExportExcelSettings AllowExportToExcel="False" />
            <Columns>
                <asp:TemplateField meta:resourcekey="TemplateFieldResource1">
                    <ItemTemplate>
                        <table>
                            <tr>
                                <td style="min-width: 16px">
                                    <asp:Image runat="server" Height="16px" Width="16px" ID="imgType" meta:resourcekey="imgTypeResource1"></asp:Image>
                                </td>
                            </tr>
                        </table>
                    </ItemTemplate>
                    <ItemStyle Width="16px" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="名稱" meta:resourcekey="TemplateFieldResource2">
                    <ItemTemplate>
                        <asp:LinkButton ID="lbtName" runat="server" meta:resourcekey="lbtNameResource1" Text='<%# Bind("NAME") %>' __designer:wfdid="w4" OnClick="lbtName_Click"></asp:LinkButton>
                    </ItemTemplate>
                    <ItemStyle ForeColor="Black" Width="50%" />
                </asp:TemplateField>
                <%--<asp:BoundField DataField="SENDTIME" HeaderText="送審日期" meta:resourcekey="BoundFieldResource1">
                    <ItemStyle ForeColor="Black" Width="20%" />
                </asp:BoundField>--%>
                <asp:TemplateField HeaderText="送審日期" meta:resourcekey="BoundFieldResource1">
                <itemtemplate>
                    <asp:Label runat="server" ID="lblSENDTIME"></asp:Label>
                </itemtemplate>
                <HeaderStyle Wrap="False" />
            </asp:TemplateField>
                <asp:TemplateField HeaderText="送審人" meta:resourcekey="TemplateFieldResource3">
                    <ItemTemplate>
                        <asp:Label runat="server" ID="lblSender" meta:resourcekey="lblSenderResource1"></asp:Label>


                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField meta:resourcekey="TemplateFieldResource4">
                    <ItemTemplate>
                        <asp:ImageButton ID="imgBtnAudit" runat="server" meta:resourcekey="imgBtnAuditResource1" Width="16px" Height="16px" __designer:wfdid="w3" OnClick="imgBtnAudit_Click"></asp:ImageButton>
                    </ItemTemplate>
                    <ItemStyle Width="16px" />
                </asp:TemplateField>
            </Columns>
            <EnhancePagerSettings
                ShowHeaderPager="True" FirstAltImageUrl="" FirstImageUrl="" LastAltImage="" LastImageUrl="" NextIAltImageUrl="" NextImageUrl="" PageInfoCssClass="" PageNumberCssClass="" PageNumberCurrentCssClass="" PageRedirectCssClass="" PreviousAltImageUrl="" PreviousImageUrl="" />
        </Fast:Grid>
    </ContentTemplate>
</asp:UpdatePanel>

