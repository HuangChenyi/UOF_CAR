<%@ Control Language="C#" AutoEventWireup="true" Inherits="EIP_Forum_UC_NewTopicList" Codebehind="UC_NewTopicList.ascx.cs" %>
<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>

<asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
    <contenttemplate>
  <Fast:Grid ID="Grid1" runat="server" AllowSorting="True" AutoGenerateCheckBoxColumn="False" meta:resourcekey="Grid1Resource1"
    AutoGenerateColumns="False"  
     ShowHeader="False" SkinID="HomepageBlockStyle" 
    Width="100%" OnRowDataBound="Grid1_RowDataBound" AllowPaging="True" BorderStyle="None" BorderWidth="0px"  OnPageIndexChanging="Grid1_PageIndexChanging">
    <Columns>
        <asp:TemplateField meta:resourcekey="TemplateFieldResource1">
            <itemtemplate>
                <table width="100%" border="0">
                    <tr>
                        <td style="min-width: 16px; width:16px;">
                            <img height="16" src="<%=ResolveUrl("~/common/images/icon/icon02.png")%>" width="16" />
                        </td>
                        <td style=" width:75%; text-align:left;word-wrap:break-word;">
                            <asp:HyperLink runat="server" ID="HyperLink1" meta:resourcekey="HyperLink1Resource1"></asp:HyperLink>
                            <asp:Label ID="lblLeftBrk" runat="server" Text=" [ " Visible="false"></asp:Label>
                            <asp:Label ID="lblDot" runat="server" Text="..." Visible="false"></asp:Label>
                            <asp:HyperLink runat="server" ID="HyperLink3" meta:resourcekey="HyperLink3Resource1" Visible="false"></asp:HyperLink>
                            <asp:HyperLink runat="server" ID="HyperLink4" meta:resourcekey="HyperLink4Resource1" Visible="false"></asp:HyperLink>
                            <asp:HyperLink runat="server" ID="HyperLink5" meta:resourcekey="HyperLink5Resource1" Visible="false"></asp:HyperLink>
                            <asp:HyperLink runat="server" ID="HyperLink6" Visible="false"></asp:HyperLink>
                            <asp:HyperLink runat="server" ID="HyperLink7" Visible="false"></asp:HyperLink>
                            <asp:Label ID="lblRightBrk" runat="server" Text=" ] " Visible="false"></asp:Label>
                        </td>
                        <td style="width:100px;">
                         </td>
                        <td style=" width:20%; text-align:left;">
                            <asp:HyperLink runat="server" Text='<%#: Eval("BOARD_NAME") %>' ID="HyperLink2" meta:resourcekey="HyperLink2Resource1"></asp:HyperLink>
                        </td>
                    </tr>
                </table>
            </itemtemplate>
        </asp:TemplateField>
    </Columns>
</Fast:Grid>
          </contenttemplate>
</asp:UpdatePanel>
<asp:Label ID="msgAnonymous" runat="server" Text="匿名" Visible="False"></asp:Label>

