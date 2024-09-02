<%@ Page Title="站點代號" Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="WKF_FlowManagement_SetFvrSiteCode" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" Codebehind="SetFvrSiteCode.aspx.cs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <table width="100%" class="PopTable" cellspacing="0">
                <tr>
                    <td class="PopTableHeader" >
                        <center>
                        <asp:Label ID="lblRemark" runat="server" Text="站點代號內容" meta:resourcekey="lblRemarkResource1"></asp:Label></td>
                    </center>
                </tr>
                <tr>
                    <td class="PopTableRightTD">
                        <asp:TextBox ID="txtRemark" runat="server" Width="100%" Height="110px" TextMode="MultiLine" meta:resourcekey="txtRemarkResource1"></asp:TextBox>
                        <asp:CustomValidator ID="CustomValidator1" runat="server" Display="Dynamic"
                            ErrorMessage="請輸入站點備註內容" meta:resourcekey="CustomValidator1Resource1"></asp:CustomValidator>
                        <asp:Label ID="lblMode" runat="server" Visible="False" meta:resourcekey="lblModeResource1"></asp:Label>
                    </td>
                </tr>
            </table>

        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

