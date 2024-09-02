<%@ Page Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="EIP_Customer_IndustryEdit" Title="行業別維護" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" Codebehind="IndustryEdit.aspx.cs" %>

<%@ Register Assembly="System.Web.Extensions"
    Namespace="System.Web.UI" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
 <asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>
    <asp:ValidationSummary ID="ValidationSummary1" runat="server"  />
    <table class ="PopTable">
        <tr>
            <td style="width: 40%">
              <asp:Label ID="Label19" runat="server" ForeColor="Red" Text="*" meta:resourcekey="Label19Resource1"></asp:Label>
                <asp:Label ID="Label1" runat="server" Text="行業別名稱：" meta:resourcekey="Label1Resource1"></asp:Label></td>
            <td style="width: 60%">
                <asp:TextBox ID="txtIndustryName" runat="server" MaxLength="50" Width="100%"></asp:TextBox></td>
        </tr>
    </table>
           
            <asp:CustomValidator ID="cvMessage" runat="server" BackColor="Red" Display="None"
                ForeColor="White" Visible="False"></asp:CustomValidator><asp:Label ID="lblExist"
                    runat="server" Text="行業別名稱已經存在!" Visible="False" meta:resourcekey="lblExistResource1"></asp:Label><asp:Label ID="lblDBFail"
                        runat="server" Text="資料更新失敗" Visible="False" meta:resourcekey="lblDBFailResource1"></asp:Label>
        <asp:Label ID="lblEmpty" runat="server" Text="行業別名稱不能為空值" Visible="False" meta:resourcekey="lblEmptyResource1"></asp:Label>
   </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

