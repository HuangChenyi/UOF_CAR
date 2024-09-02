<%@ Page Title="罐頭簡訊" Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" CodeBehind="MaintainCannedText.aspx.cs" Inherits="Ede.Uof.Web.EIP.SMS.MaintainCannedText" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <table class="PopTable" width="100%" cellspacing="1" cellpadding="0">
                <tr>
                    <td class="PopTableHeader" align="center" colspan="2">
                    <center>
                        <asp:Label ID="Label1" runat="server" Text="罐頭簡訊維護" 
                            meta:resourcekey="Label1Resource1"></asp:Label></center>
                    </td>
                </tr>
                <tr>
                    <td class="PopTableLeftTD" nowrap="nowrap">
                        <asp:Label ID="Label3" runat="server" Text="簡訊內容" 
                            meta:resourcekey="Label3Resource1"></asp:Label>
                    </td>
                    <td class="PopTableRightTD" nowrap="nowrap">
                        <asp:TextBox ID="txtContent" runat="server" TextMode="MultiLine" Rows="5" Width="100%"
                            meta:resourcekey="txtContentResource1"></asp:TextBox>
                        <br />
                        <asp:RequiredFieldValidator ID="rfvContent" runat="server" 
                            ErrorMessage="簡訊內容不可空白" ControlToValidate="txtContent" Display="Dynamic" 
                            meta:resourcekey="rfvContentResource1"></asp:RequiredFieldValidator>
                    </td>
                </tr>
            </table>
        </ContentTemplate>
    </asp:UpdatePanel>
    <asp:Label ID="lblError" runat="server" Text="寫入失敗" ForeColor="Red" Visible="False" meta:resourcekey="lblErrorResource1"></asp:Label>
    <asp:HiddenField ID="hfCurrentUser" runat="server" />
</asp:Content>
