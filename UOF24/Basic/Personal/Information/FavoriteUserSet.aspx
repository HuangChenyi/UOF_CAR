<%@ Page Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="Basic_Personal_Information_FavoriteUserSet" Title="新增/維護常用人員" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" Codebehind="FavoriteUserSet.aspx.cs" %>

<%@ Register Src="../../../Common/ChoiceCenter/UC_ChoiceList.ascx" TagName="UC_ChoiceList" TagPrefix="uc1" %>
    
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table width="100%" class="PopTable">
        <tr>
            <td style="white-space:nowrap">
                <asp:Label ID="lblName" runat="server" Text="名稱" meta:resourcekey="lblNameResource1"></asp:Label></td>
            <td>
                <asp:TextBox ID="tbName" runat="server" MaxLength="50" meta:resourcekey="tbNameResource1"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="tbName"
                    Display="Dynamic" ErrorMessage="請輸入名稱" meta:resourcekey="RequiredFieldValidator1Resource1"></asp:RequiredFieldValidator>
                <asp:CustomValidator ID="cvName" runat="server" ErrorMessage="名稱重覆" meta:resourcekey="cvNameResource1"></asp:CustomValidator></td>
        </tr>
        <tr>
            <td style="white-space:nowrap">
                <asp:Label ID="lblFavoUserSet" runat="server" Text="人員設定" meta:resourcekey="lblFavoUserSetResource1"></asp:Label></td>
            <td >
                <asp:CustomValidator ID="cvChoiceUserSet" runat="server" ErrorMessage="請選取人員" ForeColor="Red" Display="Dynamic" meta:resourcekey="cvChoiceUserSetResource1"></asp:CustomValidator>
                <uc1:UC_ChoiceList ID="UC_ChoiceList1" runat="server" ExpandToUser="False" />
            </td>
        </tr>
    </table>
</asp:Content>

