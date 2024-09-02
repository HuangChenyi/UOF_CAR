<%@ Page Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="Basic_Personal_AddressBook_MyFriendInformation" Title="編輯通訊錄" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" Codebehind="MyFriendInformation.aspx.cs" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table cellspacing="1" class="PopTable">
        <tr>
            <td style="white-space: nowrap">
                <span style="color: #ff0000">*</span><asp:Label ID="LBLname" runat="server" Text="姓名" meta:resourcekey="LBLnameResource1"></asp:Label></td>
            <td>
                <asp:TextBox ID="txbName" runat="server" meta:resourcekey="txbNameResource1" MaxLength="50"></asp:TextBox>
                <br />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txbName" ForeColor="Red"
                    Display="Dynamic" ErrorMessage="不允許空白!" meta:resourcekey="RequiredFieldValidator1Resource1"></asp:RequiredFieldValidator></td>
            <td style="white-space: nowrap">
                <asp:Label ID="LBLsex" runat="server" Text="性別" meta:resourcekey="LBLsexResource1"></asp:Label></td>
            <td>
                <asp:DropDownList ID="DropDownList1" runat="server" meta:resourcekey="DropDownList1Resource1">
                    <asp:ListItem Value="M" meta:resourcekey="ListItemResource1" Text="男"></asp:ListItem>
                    <asp:ListItem Value="F" meta:resourcekey="ListItemResource2" Text="女"></asp:ListItem>
                </asp:DropDownList></td>
        </tr>
        <tr>
            <td style="white-space: nowrap">
                <asp:Label ID="LBLbirthday" runat="server" Text="生日" meta:resourcekey="LBLbirthdayResource1"></asp:Label></td>
            <td>
                <telerik:RadDatePicker ID="rdpDate" runat="server">
                </telerik:RadDatePicker>
                <asp:CustomValidator ID="CustomValidator1" runat="server" Display="Dynamic" ErrorMessage="請輸入生日" meta:resourcekey="CustomValidator1Resource1"></asp:CustomValidator>
            </td>
            <td style="white-space: nowrap">
                <asp:Label ID="LBLemail" runat="server" Text="電子郵件" meta:resourcekey="LBLemailResource1"></asp:Label></td>
            <td>
                <asp:TextBox ID="txbMail" runat="server" meta:resourcekey="txbMailResource1" MaxLength="50"></asp:TextBox></td>
        </tr>
        <tr>
            <td style="white-space: nowrap">
                <asp:Label ID="LBLtel" runat="server" Text="聯絡電話" meta:resourcekey="LBLtelResource1"></asp:Label></td>
            <td>
                <asp:TextBox ID="txbTel" runat="server" meta:resourcekey="txbTelResource1" MaxLength="50"></asp:TextBox></td>
            <td style="white-space: nowrap">
                <asp:Label ID="LBLmobile" runat="server" Text="行動電話" meta:resourcekey="LBLmobileResource1"></asp:Label></td>
            <td>
                <asp:TextBox ID="txbMobile" runat="server" meta:resourcekey="txbMobileResource1" MaxLength="50"></asp:TextBox></td>
        </tr>
        <tr class="HiddenUserUnusedColumn">
            <td style="white-space: nowrap">
                <asp:Label ID="LBLmsn" runat="server" Text="MSN信箱" meta:resourcekey="LBLmsnResource1"></asp:Label></td>
            <td>
                <asp:TextBox ID="txbMsn" runat="server" meta:resourcekey="txbMsnResource1" MaxLength="50"></asp:TextBox></td>
            <td style="white-space: nowrap">
                <asp:Label ID="Labelyahoo" runat="server" Width="104px" Text="Yahoo即時通" meta:resourcekey="LabelyahooResource1"></asp:Label></td>
            <td>
                <asp:TextBox ID="txbYahoo" runat="server" meta:resourcekey="txbYahooResource1" MaxLength="50"></asp:TextBox></td>
        </tr>
        <tr>
            <td style="white-space: nowrap">
                <asp:Label ID="LBLblog" runat="server" meta:resourcekey="LBLblogResource1" Text="BLOG"></asp:Label></td>
            <td>
                <asp:TextBox ID="txbBlog" runat="server" MaxLength="50" meta:resourcekey="txbBlogResource1"></asp:TextBox></td>
            <td style="white-space: nowrap">
                <asp:Label ID="LBLqq" runat="server" CssClass="HiddenUserUnusedColumn" meta:resourcekey="LBLqqResource1" Text="QQ"></asp:Label></td>
            <td>
                <asp:TextBox ID="txbQQ" runat="server" CssClass="HiddenUserUnusedColumn" MaxLength="50" meta:resourcekey="txbQQResource1"></asp:TextBox></td>
        </tr>
        <tr>
            <td style="white-space: nowrap">
                <asp:Label ID="LBLaddress" runat="server" Text="地址" meta:resourcekey="LBLaddressResource1"></asp:Label></td>
            <td colspan="3">
                <asp:TextBox ID="txbAddr" runat="server" Width="421px" meta:resourcekey="txbAddrResource1" MaxLength="255"></asp:TextBox></td>
        </tr>
    </table>
    <asp:CustomValidator ID="CustomValidator2" runat="server" Display="Dynamic" ForeColor="Red"
        ErrorMessage="帳號已存在"></asp:CustomValidator>
    <asp:Label ID="lbPersonId" runat="server" Visible="False" meta:resourcekey="lbPersonIdResource1"></asp:Label>
    <asp:Label ID="lbClassGuid" runat="server" Visible="False" meta:resourcekey="lbClassGuidResource1"></asp:Label>
</asp:Content>
