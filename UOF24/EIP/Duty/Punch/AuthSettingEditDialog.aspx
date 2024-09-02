<%@ Page Title="維護權限設定" Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" CodeBehind="AuthSettingEditDialog.aspx.cs" Inherits="EIP_Duty_Punch_AuthSettingEditDialog" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" %>

<%@ Register Src="../../../Common/ChoiceCenter/UC_ChoiceList.ascx" TagName="UC_ChoiceList" TagPrefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <table border="1" cellpadding="1" cellspacing="0" class="PopTable" width="100%">
        <tr>
            <td class="PopTableHeader" style="width: 50%">
                <div style="text-align: center;">
                    <asp:Label ID="lblMaintainer" runat="server" Text="維護人員" meta:resourcekey="lblMaintainerResource1"></asp:Label>
                </div>
            </td>
            <td class="PopTableHeader" style="width: 50%; text-align: center">
                <div style="text-align: center;">
                    <asp:Label ID="lblManagedObject" runat="server" Text="可管理對象" meta:resourcekey="lblManagedObjectResource1"></asp:Label>
                </div>
            </td>
        </tr>
        <tr>
            <td style="background-color: White;width: 50%">
                <div style="text-align: left">
                    <uc1:UC_ChoiceList ID="UC_MaintainerChoiceList" runat="server" ChioceType="User"
                        ExpandToUser="True" ShowAddToFavorite="False" ShowMember="False" />
                    <br />

                    <asp:CustomValidator ID="cvMaintainerChoiceList" runat="server" Display="Dynamic"
                        ErrorMessage="至少要選擇一名維護人員" meta:resourcekey="CustomValidator2Resource1"></asp:CustomValidator>
                </div>
            </td>
            <td style="background-color: White;width: 50%">
                <div style="text-align: left">
                    <uc1:UC_ChoiceList ID="UC_ManagedObjectChoiceList" runat="server" ChioceType="All"
                        ExpandToUser="False" ShowAddToFavorite="False" ShowMember="False" ShowSubDept="True" />
                    <br />

                    <asp:CustomValidator ID="cvManagedObjectChoiceList" runat="server" Display="Dynamic"
                        ErrorMessage="至少要選擇一個對象" meta:resourcekey="CustomValidator4Resource1"></asp:CustomValidator>
                </div>
            </td>
        </tr>
    </table>

</asp:Content>
