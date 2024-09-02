<%@ Control Language="C#" AutoEventWireup="true" Inherits="EIP_Polling_UserPollingSubject" Codebehind="UserPollingSubject.ascx.cs" %>
<%@ Register Assembly="System.Web.Extensions" Namespace="System.Web.UI" TagPrefix="asp" %>
<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>

<asp:UpdatePanel id="UpdatePanel1" runat="server">
    <contenttemplate>
<Fast:Grid ID="Grid1" runat="server" AllowSorting="True"  SkinID="HomepageBlockStyle" 
 AutoGenerateCheckBoxColumn="False" AutoGenerateColumns="False" ShowHeader="False" 
BorderStyle="None" BorderWidth="0px"  Width="100%"
     
  OnRowCommand="Grid1_RowCommand" OnRowDataBound="Grid1_RowDataBound"  DataKeyOnClientWithCheckBox="False" OnPageIndexChanging="Grid1_PageIndexChanging">
    <Columns>
        <asp:TemplateField meta:resourcekey="TemplateFieldResource1">
            <itemtemplate>
        <table width="100%" border=0>
            <tr>
                <td align=left>
                    <img height="16" src="<%=ResolveUrl("~/common/images/icon/icon02.png")%>" width="16" />
                    <asp:Label runat="server" Text='<%# Eval("TOPIC") %>' ID="lbTopic" meta:resourceKey="lbTopicResource1"></asp:Label>

                    <asp:Label runat="server" Text='<%# Eval("TOPIC_GUID") %>' ID="lbTopicGuid" Visible="False" meta:resourceKey="lbTopicGuidResource1"></asp:Label>

                    (<asp:Label runat="server" ID="lblANNOUNCER" meta:resourcekey="lblANNOUNCERResource1"></asp:Label>

                    &nbsp;<asp:Label runat="server" ForeColor="Olive" ID="lbCreateTime" meta:resourceKey="lbCreateTimeResource1"></asp:Label>
)
                    <asp:Label runat="server" ForeColor="Red" ID="lblStatus" meta:resourceKey="lblStatusResource1"></asp:Label>

                    </td>
            </tr>
            <tr>
                <td>
                    <table width=100% border=0>
                        <tr>
                            <td></td>
                            <td align=right>
                                <asp:LinkButton runat="server" ID="btnPoll" CommandName="poll" meta:resourceKey="btnPollResource1"></asp:LinkButton>
&nbsp;&nbsp;
                                <asp:LinkButton runat="server" ID="btnResult" meta:resourceKey="btnResultResource1"></asp:LinkButton>

                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
            
</itemtemplate>
        </asp:TemplateField>
    </Columns>
</Fast:Grid></contenttemplate>
</asp:UpdatePanel>
<asp:Label ID="msgPollingend" runat="server" Text="該投票已結束" Visible="False" meta:resourcekey="msgPollingendResource1"></asp:Label>
<asp:Label ID="lbPolling" runat="server" Text="前往投票" Visible="False" meta:resourcekey="lbPollingResource1"></asp:Label>
<asp:Label ID="lbViewResult" runat="server" Text="觀看結果" Visible="False" meta:resourcekey="lbViewResultResource1"></asp:Label>
