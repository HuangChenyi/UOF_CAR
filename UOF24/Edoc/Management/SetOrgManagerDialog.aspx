<%@ Page Title="" Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" CodeBehind="SetOrgManagerDialog.aspx.cs" Inherits="Ede.Uof.Web.Edoc.Management.SetOrgManagerDialog" %>

<%@ Register Src="../../Common/ChoiceCenter/UC_ChoiceList.ascx" TagName="UC_ChoiceList" TagPrefix="uc1" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:UpdatePanel runat="server">
        <ContentTemplate>
            <table class="PopTable">
                <tr style="height:30%">
                    <td style="width:25%">
                        <asp:Label runat="server" Text="收發文機關" Style="white-space:nowrap"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="lblOrg" runat="server"></asp:Label>
                        <asp:Label ID="lblOrgId" runat="server" Visible="false"></asp:Label>
                        <asp:DropDownList ID="ddlOrg" runat="server" OnSelectedIndexChanged="ddlOrg_SelectedIndexChanged"></asp:DropDownList>
                        <asp:CustomValidator ID="cvOrg" runat="server" ErrorMessage="請選擇" Display="Dynamic"></asp:CustomValidator>
                        <asp:CustomValidator ID="cvOrgId" runat="server" ErrorMessage="通訊錄中無此機關" Display="Dynamic"></asp:CustomValidator>
                    </td>
                </tr>
                <tr style="height:30%">
                    <td style="width:25%">
                        <asp:Label runat="server" Text="人員"></asp:Label>
                    </td>
                    <td>
                        <uc1:UC_ChoiceList ID="UC_ChoiceList1" runat="server" ChioceType="User" ShowMember="false" ExpandToUser="false"/>
                    </td>
                </tr>
            </table>
            <asp:CustomValidator ID="cvDuplicate" runat="server" ErrorMessage="此機關已有設定機關管理員" Display="Dynamic"></asp:CustomValidator>

            <asp:Label ID="lblPlease" runat="server" Text="請選擇" Visible="false"></asp:Label>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
