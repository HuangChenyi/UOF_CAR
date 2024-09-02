<%@ Control Language="C#" AutoEventWireup="true" Inherits="QUE_Common_UserFillOutQue" CodeBehind="UserFillOutQue.ascx.cs" %>
<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>
<table style="width: 100%;">
    <tr>
        <td>
            <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                <ContentTemplate>
                    <asp:Panel ID="plUnSendQue" runat="server" CssClass="BreakAll">
                        <asp:Label ID="lblUnSendQue" runat="server" Font-Bold="True" Text="未送出的問卷" meta:resourcekey="lblUnSendQueResource1"></asp:Label>
                        <Fast:Grid ID="grdUnSendQue" runat="server" SkinID="HomepageBlockStyle" AutoGenerateColumns="False" ShowHeader="False" BorderStyle="None" BorderWidth="0px" Width="100%" meta:resourcekey="grdUnSendQueResource1"
                            DataKeyOnClientWithCheckBox="False" EnhancePager="True" OnRowDataBound="grdQue_RowDataBound" AllowPaging="True" PageSize="10" OnPageIndexChanging="grdUnSendQue_PageIndexChanging" AllowSorting="True" AutoGenerateCheckBoxColumn="False">
                            <EnhancePagerSettings ShowHeaderPager="True" />
                            <ExportExcelSettings AllowExportToExcel="False" />
                            <Columns>
                                <asp:TemplateField meta:resourcekey="TemplateFieldResource1">
                                    <ItemTemplate>
                                        <table width="100%" border="0">
                                            <tr>
                                                <td align="left">
                                                    <img height="16" src="<%=ResolveUrl("~/common/images/icon/icon02.png")%>" width="16" />
                                                    <asp:LinkButton ID="lbtnDesignName" runat="server" OnClick="lbtnDesignName_Click"></asp:LinkButton>
                                                    (<asp:Label runat="server" ID="lblANNOUNCER" meta:resourcekey="lblANNOUNCERResource1"></asp:Label>&nbsp;
                                            <asp:Label runat="server" ForeColor="Olive" ID="lblTime" meta:resourcekey="lblTimeResource1"></asp:Label>) 
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="right">
                                                    <table border="0" runat="server">
                                                        <tr>
                                                            <td style="text-align: right;">
                                                                <asp:LinkButton runat="server" ID="lbtnFill" Text="填寫問卷" OnClick="lbtnFill_Click" meta:resourcekey="lbtnFillResource1"></asp:LinkButton>
                                                            </td>
                                                            <td id="tempTD" runat="server" style="width: 15px;" align="center"></td>
                                                            <td style="text-align: left;">
                                                                <asp:LinkButton runat="server" ID="lbtnReport" Text="統計圖表" meta:resourcekey="lbtnReportResource1"></asp:LinkButton>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </td>
                                            </tr>
                                        </table>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </Fast:Grid>
                    </asp:Panel>
                    <asp:Panel ID="plSendQue" runat="server" CssClass="BreakAll">
                        <asp:Label ID="lblSendQue" runat="server" Font-Bold="True" Text="已送出的問卷" meta:resourcekey="lblSendQueResource1"></asp:Label>
                        <Fast:Grid ID="grdSendQue" runat="server" SkinID="HomepageBlockStyle" AutoGenerateColumns="False" ShowHeader="False" BorderStyle="None" BorderWidth="0px" Width="100%" meta:resourcekey="grdSendQueResource1"
                            DataKeyOnClientWithCheckBox="False" EnhancePager="True" OnRowDataBound="grdQue_RowDataBound" AllowPaging="True" PageSize="10" OnPageIndexChanging="grdSendQue_PageIndexChanging" AllowSorting="True" AutoGenerateCheckBoxColumn="False">
                            <EnhancePagerSettings ShowHeaderPager="True" />
                            <ExportExcelSettings AllowExportToExcel="False" />
                            <Columns>
                                <asp:TemplateField meta:resourcekey="TemplateFieldResource1">
                                    <ItemTemplate>
                                        <table width="100%" border="0">
                                            <tr>
                                                <td align="left">
                                                    <img height="16" src="<%=ResolveUrl("~/common/images/icon/icon02.png")%>" width="16" />
                                                    <asp:LinkButton ID="lbtnDesignName" runat="server" OnClick="lbtnDesignName_Click"></asp:LinkButton>
                                                    (<asp:Label runat="server" ID="lblANNOUNCER" meta:resourcekey="lblANNOUNCERResource1"></asp:Label>&nbsp;
                                            <asp:Label runat="server" ForeColor="Olive" ID="lblTime" meta:resourcekey="lblTimeResource1"></asp:Label>)
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="right">
                                                    <table border="0" runat="server">
                                                        <tr>
                                                            <td style="text-align: right;">
                                                                <%--<asp:LinkButton runat="server" ID="lbtnFill" Text="填寫問卷" OnClick="lbtnFill_Click" meta:resourcekey="lbtnFillResource1"></asp:LinkButton>--%>
                                                            </td>
                                                            <td id="tempTD" runat="server" style="width: 15px;" align="center"></td>
                                                            <td style="text-align: left;">
                                                                <asp:LinkButton runat="server" ID="lbtnReport" Text="統計圖表" meta:resourcekey="lbtnReportResource1"></asp:LinkButton>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </td>
                                            </tr>
                                        </table>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </Fast:Grid>
                    </asp:Panel>
                    <asp:HiddenField ID="hfUserGuid" runat="server" />
                </ContentTemplate>
            </asp:UpdatePanel>
        </td>
    </tr>
</table>
<asp:Label ID="msgPollingend" runat="server" Text="該投票已結束" Visible="False" meta:resourcekey="msgPollingendResource1"></asp:Label>
<asp:Label ID="lbPolling" runat="server" Text="前往投票" Visible="False" meta:resourcekey="lbPollingResource1"></asp:Label>
<asp:Label ID="lbViewResult" runat="server" Text="觀看結果" Visible="False" meta:resourcekey="lbViewResultResource1"></asp:Label>
<asp:Label ID="lblPersonalQusList" Text="選擇填寫/觀看問卷" Visible="false" runat="server" meta:resourcekey="lblPersonalQusListResource1"></asp:Label>
