<%@ Page Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="EIP_Customer_ClassEdit" Title="類別維護" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" Codebehind="ClassEdit.aspx.cs" %>

<%@ Register Assembly="System.Web.Extensions"
    Namespace="System.Web.UI" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <contenttemplate>
         <asp:ValidationSummary ID="ValidationSummary1" runat="server" />
    <table class ="PopTable">
        <tr>
            <td style="width: 35%">
              <asp:Label ID="Label2" runat="server" ForeColor="Red" Text="*" meta:resourcekey="Label2Resource1"></asp:Label>
                <asp:Label ID="Label1" runat="server" Text="類別名稱：" meta:resourcekey="Label1Resource1"></asp:Label></td>
            <td style="width: 65%">
                <asp:TextBox ID="txtClassName" runat="server" MaxLength="50" Width="100%"></asp:TextBox></td>
        </tr>
    </table>
           
            <asp:CustomValidator ID="cvMessage" runat="server" BackColor="Red" Display="None"
                ForeColor="White" Visible="False"></asp:CustomValidator><asp:Label ID="lblExist"
                    runat="server" Text="類別名稱已經存在!" Visible="False" meta:resourcekey="lblExistResource1"></asp:Label><asp:Label ID="lblDBFail"
                        runat="server" Text="資料更新失敗" Visible="False" meta:resourcekey="lblDBFailResource1"></asp:Label>
            <asp:Label ID="lblEmpty" runat="server" Text="類別名稱不能為空值" Visible="False" meta:resourcekey="lblEmptyResource1"></asp:Label>
        </contenttemplate>
    </asp:UpdatePanel>
</asp:Content>

