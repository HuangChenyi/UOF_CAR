<%@ Page Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="WKF_Admin_ListNodeSigner" Title="指定簽核" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" CodeBehind="ListNodeSigner.aspx.cs" %>

<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table width="100%" class="PopTable">
        <tr>
            <td class="PopTableHeader" style="text-align: center">
                <center>
            <asp:Label ID="lblNodeSignerList" runat="server" Text="站點簽核人員列表" meta:resourcekey="lblNodeSignerListResource1"></asp:Label>
        </center>
            </td>
        </tr>
        <tr class="PopTableRightTD">
            <td style="text-align: left;">
                <Fast:Grid ID="GrdNodeSignerList" runat="server" AutoGenerateCheckBoxColumn="False" AutoGenerateColumns="False"
                    DataKeyOnClientWithCheckBox="False"
                    Width="100%" OnRowCommand="GrdNodeSignerList_RowCommand" OnRowDataBound="GrdNodeSignerList_RowDataBound" AllowSorting="True" meta:resourcekey="GrdNodeSignerListResource1">
                    <Columns>
                        <asp:TemplateField HeaderText="簽核者" meta:resourcekey="TemplateFieldResource1">
                            <ItemTemplate>
                                <asp:Label runat="server" ID="lblORIGINAL_SIGNER" __designer:wfdid="w15" meta:resourcekey="lblORIGINAL_SIGNERResource1"></asp:Label>

                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="代理人" meta:resourcekey="TemplateFieldResource2">
                            <ItemTemplate>
                                <asp:Label runat="server" ID="lblAgent" __designer:wfdid="w16" meta:resourcekey="lblAgentResource1"></asp:Label>

                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="代理時間" meta:resourcekey="TemplateFieldResource3">
                            <ItemTemplate>
                                <asp:Label runat="server" ID="lblAgentTime" __designer:wfdid="w17" meta:resourcekey="lblAgentTimeResource1"></asp:Label>

                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="操作" meta:resourcekey="TemplateFieldResource4">
                            <ItemTemplate>
                                <asp:LinkButton runat="server" ID="lbtnSetAgent" __designer:wfdid="w13" meta:resourcekey="lbtnSetAgentResource1">設定</asp:LinkButton>

                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </Fast:Grid>
            </td>
        </tr>
    </table>
</asp:Content>

