<%@ Page Title="修改備註" Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="EIP_Personal_Briefcase_MaintainDescription" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" Codebehind="MaintainDescription.aspx.cs" %>
  
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <table class="PopTable" cellpadding="0" cellspacing="1" border="0">
                <tr>
                    <td style=" white-space:nowrap;">
                        <asp:Label ID="Label2" runat="server" Text="內容" 
                            meta:resourcekey="Label2Resource1"></asp:Label>
                    </td>
                    <td style=" white-space:nowrap;">
                        <asp:TextBox ID="txtDescription" runat="server" MaxLength="255" 
                            TextMode="MultiLine" Rows="5" meta:resourcekey="txtDescriptionResource1" Width="100%"></asp:TextBox>
                    </td>
                </tr>
            </table>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

