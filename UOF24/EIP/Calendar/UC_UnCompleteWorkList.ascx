<%@ Control Language="C#" AutoEventWireup="true" Inherits="EIP_Calendar_UC_UnCompleteWorkList" Codebehind="UC_UnCompleteWorkList.ascx.cs" %>
<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>

<asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
    <ContentTemplate>
        <Fast:Grid ID="Grid1" runat="server" AllowSorting="True" AutoGenerateCheckBoxColumn="False" meta:resourcekey="Grid1Resource1"
            AutoGenerateColumns="False"
            ShowHeader="False" Width="100%" BorderStyle="None" BorderWidth="0px"
            OnRowDataBound="Grid1_RowDataBound" AllowPaging="True" SkinID="HomepageBlockStyle" OnPageIndexChanging="Grid1_PageIndexChanging">
            <Columns>
                <asp:TemplateField meta:resourcekey="TemplateFieldResource1">
                    <ItemTemplate>
                        <table width="100%" border="0">
                            <tr>
                                <td width="16" style="min-width: 16px">
                                    <img height="16" src="<%=ResolveUrl("~/common/images/icon/icon02.png") %>" width="16" />
                                </td>
                                <td width="65%">
                                    <asp:LinkButton runat="server" ID="LinkButton1" Text='<%#: Eval("SUBJECT") %>' meta:resourcekey="LinkButton1Resource1" OnClick="LinkButton1_Click"></asp:LinkButton>
                                </td>
                                <td width="15%">
                                    <asp:Label runat="server" Text='<%#: Eval("BEHIND_DAY") %>' ID="lblDay" meta:resourcekey="lblDayResource1"></asp:Label><asp:Label runat="server" ID="lblDayUnit" Text="天" meta:resourcekey="lblDayUnitResource1"></asp:Label>
                                </td>
                                <td width="20%" align="Left">
                                    <asp:Label runat="server" ID="lblStatus" meta:resourcekey="lblStatusResource1"></asp:Label>
                                </td>
                            </tr>
                        </table>

                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <FooterStyle BackColor="White" />
        </Fast:Grid>
    </ContentTemplate>
</asp:UpdatePanel>

<asp:Label ID="msgNotbegin" runat="server" Text="尚未開始" Visible="False" meta:resourcekey="msgNotbeginResource1"></asp:Label>
<asp:Label ID="msgComplete" runat="server" Text="已完成" Visible="False" meta:resourcekey="msgCompleteResource1"></asp:Label>
<asp:Label ID="msgProcessing" runat="server" Text="進行中" Visible="False" meta:resourcekey="msgProcessingResource1"></asp:Label>
<asp:Label ID="msglblAudit" runat="server" Text="審核中" Visible="False" meta:resourcekey="msglblAuditResource1"></asp:Label>

