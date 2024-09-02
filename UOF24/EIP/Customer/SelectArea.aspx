<%@ Page Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="EIP_Customer_SelectArea" Title="選擇地區別" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" Codebehind="SelectArea.aspx.cs" %>
<%@ Register Assembly="System.Web.Extensions" Namespace="System.Web.UI" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
   <asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>
        <asp:ValidationSummary ID="ValidationSummary1" runat="server" />
    <table>
        <tr>
            <td style="width: 100px; height: 21px">
                <telerik:RadTreeView ID="rdAreatree" EnableNodeTextHtmlEncoding="true" Runat="server"></telerik:RadTreeView>
            </td>
        </tr>
    </table>
        <asp:CustomValidator ID="cvMessage" runat="server" BackColor="Red" Display="None"
            ForeColor="White" Visible="False"></asp:CustomValidator>
 </ContentTemplate>
    </asp:UpdatePanel>
    <asp:Label ID="lblArea" runat="server" Text="地區別" Visible="False" meta:resourcekey="lblAreaResource1"></asp:Label>
    <asp:Label ID="lblAreaMsg" runat="server" Text="請選擇所屬地區" Visible="False" meta:resourcekey="lblAreaMsgResource1"></asp:Label>
</asp:Content>

