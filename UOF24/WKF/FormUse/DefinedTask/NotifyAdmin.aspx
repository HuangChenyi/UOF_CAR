<%@ Page Title="通知管理員" Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="WKF_FormUse_DefinedTask_NotifyAdmin" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" Codebehind="NotifyAdmin.aspx.cs" %>

<%@ Register Assembly="System.Web.Extensions"
    Namespace="System.Web.UI" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <table class="PopTable" cellpadding="0" cellspacing="1" border="0">
                <tr>
                    <td class="PopTableHeader" align="center" colspan="2">
                        <asp:Label ID="Label3" runat="server" Text="通知管理員" meta:resourcekey="Label3Resource1" 
                            ></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="PopTableLeftTD" nowrap="nowrap">
                        <asp:Label ID="Label4" runat="server" Text="內容" meta:resourcekey="Label4Resource1" 
                            ></asp:Label>
                    </td>
                    <td class="PopTableRightTD" nowrap="nowrap">
                        <asp:TextBox ID="txtContent" runat="server" Height="250px" MaxLength="255" 
                            TextMode="MultiLine" meta:resourcekey="txtContentResource1" Width="100%"></asp:TextBox>
                            <br />
                        <asp:RequiredFieldValidator ID="rfvtxtContent" runat="server" 
                            ErrorMessage="內容不可空白" ControlToValidate="txtContent" Display="Dynamic" 
                            meta:resourcekey="rfvtxtContentResource1"></asp:RequiredFieldValidator>
                    </td>
                </tr>
            </table>

        </ContentTemplate>
    </asp:UpdatePanel>
    <asp:Label ID="lblSubmit" runat="server" Text="送出" Visible="False" 
        meta:resourcekey="lblSubmitResource1"></asp:Label>
</asp:Content>

