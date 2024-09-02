<%@ Page Title="部門管理人員維護" Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="System_SetRoleAdmin_Add" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" Codebehind="Add.aspx.cs" %>

<%@ Register Src="../../Common/ChoiceCenter/UC_ChoiceList.ascx" TagName="UC_ChoiceList" TagPrefix="uc1" %>

<%@ Register Src="../../Common/ChoiceCenter/UC_BtnChoiceOnce.ascx" TagName="UC_BtnChoiceOnce" TagPrefix="uc2" %>
<%@ Register Src="../../Common/ChoiceCenter/UC_ChoiceOnce.ascx" TagName="UC_ChoiceOnce" TagPrefix="uc3" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <table border="1" cellpadding="1" cellspacing="0" class="PopTable" width="100%">
        <tr>
            <td class="PopTableHeader" style="width: 50%">
                <div style="text-align: center;">
                    <asp:Label ID="label1" runat="server" Text="選擇人員" meta:resourcekey="label1Resource1"></asp:Label>
                </div>
            </td>
            <td class="PopTableHeader" style="width: 50%; text-align: center">
                <div style="text-align: center;">
                    <asp:Label ID="label2" runat="server" Text="負責部門" meta:resourcekey="label2Resource1"></asp:Label>
                </div>
            </td>
        </tr>
        <tr>
            <td style="background-color: White;width: 50%">
                <div style="text-align: left">
                    <uc1:UC_ChoiceList ID="UC_ChoiceList1" runat="server" ChioceType="User"
                        ExpandToUser="False" ShowAddToFavorite="False" ShowMember="False" />
                    <br />
                    <asp:CustomValidator ID="CustomValidator1" runat="server" Display="Dynamic"
                        ErrorMessage="只能選擇一位使用者" meta:resourcekey="CustomValidator1Resource1"></asp:CustomValidator>
                    <asp:CustomValidator ID="CustomValidator2" runat="server" Display="Dynamic"
                        ErrorMessage="至少要選擇一位使用者" meta:resourcekey="CustomValidator2Resource1"></asp:CustomValidator>
                    <asp:CustomValidator ID="CustomValidator5" runat="server" Display="Dynamic"
                        ErrorMessage="設定的資料重複" meta:resourcekey="CustomValidator5Resource1"></asp:CustomValidator>
                </div>
            </td>
            <td style="background-color: White;width: 50%">
                <div style="text-align: left">
                    <uc1:UC_ChoiceList ID="UC_ChoiceList2" runat="server" ChioceType="Group"
                        ExpandToUser="False" ShowAddToFavorite="False" ShowMember="False" ShowSubDept="False" />
                    <br />
                    <asp:CustomValidator ID="CustomValidator3" runat="server" Display="Dynamic"
                        ErrorMessage="只能選擇一個部門" meta:resourcekey="CustomValidator3Resource1"></asp:CustomValidator>
                    <asp:CustomValidator ID="CustomValidator4" runat="server" Display="Dynamic"
                        ErrorMessage="至少要選擇一個部門" meta:resourcekey="CustomValidator4Resource1"></asp:CustomValidator>
                </div>
            </td>
        </tr>
    </table>

</asp:Content>