<%@ Page Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="EIP_Forum_CreateBoard" Title="新增討論版" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" Codebehind="CreateBoard.aspx.cs" %>
<%@ Register Src="../../Common/ChoiceCenter/UC_ChoiceList.ascx" TagName="UC_ChoiceList" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:CustomValidator ID="CustomValidator1" runat="server" ForeColor="Red" Display="Dynamic" ErrorMessage="討論版名稱已存在" meta:resourcekey="CustomValidator1Resource1"></asp:CustomValidator>
    <asp:CustomValidator ID="CustomValidator2" runat="server" ForeColor="Red"  Display="Dynamic" ErrorMessage="無權限維護" meta:resourcekey="CustomValidator2Resource1"></asp:CustomValidator>
    <table width="100%"  class="PopTable" cellspacing="0">
    <tr>
        <td style="height: 21px; white-space:nowrap;"><asp:Label ID="Label1" runat="server" Text="討論區名稱" meta:resourcekey="Label1Resource1"></asp:Label></td><td style="height: 21px">
        <asp:Label ID="lblArea" runat="server" meta:resourcekey="lblAreaResource1"></asp:Label></td></tr>
        <tr>
            <td style="height: 21px">
                <asp:Label ID="Label2" runat="server" Text="討論版名稱" meta:resourcekey="Label2Resource1"></asp:Label></td>
            <td style="height: 21px">
                <asp:TextBox ID="txtBoardName" runat="server" Width="100%" MaxLength="50" meta:resourcekey="txtBoardNameResource1"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ForeColor="Red" ControlToValidate="txtBoardName"
                    ErrorMessage="不可為空值" Display="Dynamic" meta:resourcekey="RequiredFieldValidator1Resource1"></asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td style="height: 21px">
                <asp:Label ID="Label3" runat="server" Text="描述" meta:resourcekey="Label3Resource1"></asp:Label></td>
            <td style="height: 21px">
                <asp:TextBox ID="txtDESCRIPTION" runat="server" Height="100px" TextMode="MultiLine" Width="100%" MaxLength="1073741823" meta:resourcekey="txtDESCRIPTIONResource1"></asp:TextBox></td>
        </tr>
        <tr>
            <td style="height: 21px">
                <asp:Label ID="Label4" runat="server" Text="版主" meta:resourcekey="Label4Resource1"></asp:Label></td>
            <td style="height: 21px">
                <uc1:UC_ChoiceList ID="UC_ChoiceList1" runat="server" />
            </td>
        </tr>
        <tr>
            <td style="height: 21px">
                <asp:Label ID="Label5" runat="server" Text="可瀏覽對象" meta:resourcekey="Label5Resource1"></asp:Label></td>
            <td style="height: 21px">
                <uc1:UC_ChoiceList ID="UC_ChoiceList2" runat="server" />
            </td>
        </tr>
        <tr>
            <td style="height: 21px">
                <asp:Label ID="Label7" runat="server" Text="代理訂閱" meta:resourcekey="Label7Resource1"></asp:Label></td>
            <td style="height: 21px">
                <uc1:UC_ChoiceList ID="UC_Agency" runat="server" />
            </td>
        </tr>
        <tr>
            <td style="height: 21px">            
                <asp:Label ID="Label6" runat="server" Text="發表者身份" 
                    meta:resourcekey="Label6Resource1" ></asp:Label></td>
            <td>
                <asp:RadioButtonList ID="rbtPostedDisplay" runat="server" 
                    meta:resourcekey="rbtPostedDisplayResource1">
                    <asp:ListItem Value="0" Selected="True" meta:resourcekey="ListItemResource1">顯示姓名</asp:ListItem>
                    <asp:ListItem Value="1" meta:resourcekey="ListItemResource2">顯示暱稱</asp:ListItem>
                    <asp:ListItem Value="2" meta:resourcekey="ListItemResource3">匿名</asp:ListItem>
                </asp:RadioButtonList>
            </td>
        </tr>
    </table>
</asp:Content>

