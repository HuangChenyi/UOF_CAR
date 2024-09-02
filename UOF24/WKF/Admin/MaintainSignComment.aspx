<%@ Page Title="罐頭意見" Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="WKF_Admin_MaintainSignComment" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" Codebehind="MaintainSignComment.aspx.cs" %>

<%@ Register Assembly="System.Web.Extensions"
    Namespace="System.Web.UI" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <table class="PopTable" width="100%" cellspacing="1" cellpadding="0">
                <tr>
                    <td class="PopTableHeader" align="center" colspan="2">
                    <center>
                        <asp:Label ID="Label1" runat="server" Text="罐頭意見維護" 
                            meta:resourcekey="Label1Resource1"></asp:Label></center>
                    </td>
                </tr>
                <tr>
                    <td class="PopTableLeftTD" nowrap="nowrap">
                        <asp:Label ID="Label2" runat="server" Text="語系" 
                            meta:resourcekey="Label2Resource1"></asp:Label>
                    </td>
                    <td class="PopTableRightTD" nowrap="nowrap">
                        <asp:DropDownList ID="ddlCultures" runat="server" 
                            meta:resourcekey="ddlCulturesResource1">
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td class="PopTableLeftTD" nowrap="nowrap">
                        <asp:Label ID="Label3" runat="server" Text="意見內容" 
                            meta:resourcekey="Label3Resource1"></asp:Label>
                    </td>
                    <td class="PopTableRightTD" nowrap="nowrap">
                        <asp:TextBox ID="txtContent" runat="server" TextMode="MultiLine" Rows="5" Width="100%"
                            meta:resourcekey="txtContentResource1"></asp:TextBox>
                        <br />
                        <asp:RequiredFieldValidator ID="rfvContent" runat="server" 
                            ErrorMessage="意見內容不可空白" ControlToValidate="txtContent" Display="Dynamic" 
                            meta:resourcekey="rfvContentResource1"></asp:RequiredFieldValidator>
                    </td>
                </tr>
            </table>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

