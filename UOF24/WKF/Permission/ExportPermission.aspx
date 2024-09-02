<%@ Page Title="" Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" CodeBehind="ExportPermission.aspx.cs" Inherits="Ede.Uof.Web.WKF.Permission.ExportPermission" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script>
        function showMessage() {
            alert('<%=lblProcessMsg.Text %>');
        }
    </script>
    <asp:UpdatePanel ID="updatePanel1" runat="server">
        <ContentTemplate>
            <table class="PopTable">
                <tr>
                    <td>
                        <asp:Label ID="Label1" runat="server" Text="表單類別" meta:resourcekey="Label1Resource1"></asp:Label>
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlFormCategory" runat="server" OnSelectedIndexChanged="ddlFormCategory_SelectedIndexChanged" AutoPostBack="True" meta:resourcekey="ddlFormCategoryResource1"></asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label2" runat="server" Text="表單名稱" meta:resourcekey="Label2Resource1"></asp:Label>
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlFormNames" runat="server" meta:resourcekey="ddlFormNamesResource1"></asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label3" runat="server" Text="角色" meta:resourcekey="Label3Resource1"></asp:Label>
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlRoles" runat="server" meta:resourcekey="ddlRolesResource1">
                            <asp:ListItem Text="全部" Value="All" meta:resourcekey="ListItemResource1"></asp:ListItem>
                            <asp:ListItem Text="表單使用者" Value="WKFUser" meta:resourcekey="ListItemResource2"></asp:ListItem>
                            <asp:ListItem Text="表單負責人" Value="WKFResponsible" meta:resourcekey="ListItemResource3"></asp:ListItem>
                            <asp:ListItem Text="表單查閱者" Value="WKFReader" meta:resourcekey="ListItemResource4"></asp:ListItem>
                            <asp:ListItem Text="歸檔者" Value="WKFArchiveUser" meta:resourcekey="ListItemResource5"></asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
            </table>
            <asp:Label ID="lblAll" runat="server" Text="全部" Visible="False" meta:resourcekey="lblAllResource1"></asp:Label>
            <asp:Label ID="lblProcessMsg" runat="server" Text="報表匯出已進入系統排程，請於五分鐘後至[下載匯出報表]中下載" Visible="False" meta:resourcekey="lblProcessMsgResource1"></asp:Label>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
