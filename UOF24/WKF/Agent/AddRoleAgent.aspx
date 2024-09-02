<%@ Page Title="" Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" CodeBehind="AddRoleAgent.aspx.cs" Inherits="Ede.Uof.Web.WKF.Agent.AddRoleAgent" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" %>

<%@ Register Src="../../Common/ChoiceCenter/UC_BtnChoiceOnce.ascx" TagName="UC_BtnChoiceOnce" TagPrefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table runat="server" class="PopTable">
        <tr>
            <td>
                <asp:Label runat="server" ID="lblGroupTitleRequire" Text="*" ForeColor="Red" meta:resourcekey="lblGroupTitleRequireResource1"></asp:Label>
                <asp:Label runat="server" ID="lblGroupTitle" Text="部門-職級" meta:resourcekey="lblGroupTitleResource1"></asp:Label>
            </td>
            <td>
                <asp:DropDownList runat="server" ID="ddlGroupTitle" AutoPostBack="True" OnSelectedIndexChanged="ddlGroupTitle_SelectedIndexChanged" meta:resourcekey="ddlGroupTitleResource1"></asp:DropDownList>
                <br />
                <asp:Label runat="server" ID="lblDeptLevel" meta:resourcekey="lblDeptLevelResource1"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label runat="server" ID="lblAgentFlag" Text="此角色是否啟動代理" meta:resourcekey="lblAgentFlagResource1" style="word-break: keep-all; "></asp:Label>
            </td>
            <td>
                <asp:CheckBox runat="server" ID="cbAgentFlag" Text="不啟動代理機制" meta:resourcekey="cbAgentFlagResource1"/>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label runat="server" ID="lblAgentUser" Text="代理人" meta:resourcekey="lblAgentUserResource1"></asp:Label>
            </td>
            <td>
                <uc1:UC_BtnChoiceOnce runat="server" ID="ucAgentUser" />
                <asp:Label runat="server" ID="lblSelectAgentUser" meta:resourcekey="lblAgentUserSetResource1"></asp:Label>
                <asp:Label runat="server" ID="lblRoleSelfError" Text="代理人不可設定自己" ForeColor="Red" Visible="False" meta:resourcekey="lblRoleSelfErrorResource1"></asp:Label>
                <asp:HiddenField runat="server" ID="hfSelectAgentUser"></asp:HiddenField>
            </td>
        </tr>
    </table>
    <asp:CustomValidator runat="server" ID="cvGroupTitle" Display="Dynamic" meta:resourcekey="cvGroupTitleResource1"></asp:CustomValidator>
    <asp:Label runat="server" ID="lblSucessMessage" Visible="False" ForeColor="Blue" meta:resourcekey="lblSucessMessageResource1"></asp:Label>
    <asp:Label runat="server" ID="lblErrorMessage" Visible="False" ForeColor="Red" meta:resourcekey="lblErrorMessageResource1"></asp:Label>

    <asp:HiddenField runat="server" ID="hfUserGuid" />
    <asp:HiddenField runat="server" ID="hfAgentGuid" />
    <asp:Label runat="server" ID="lblRoleAgentUserRepeat" Text="此角色已有設定代理人" Visible="False" meta:resourcekey="lblRoleAgentUserResource1"></asp:Label>
    <asp:Label runat="server" ID="lblRoleNoTitle" Text="此角色無職級，無法設定" Visible="False" meta:resourcekey="lblRoleNoTitleResource1"></asp:Label>
    <asp:Label runat="server" ID="lblGroupError" Text="發生異常，無任何所屬部門" Visible="False" meta:resourcekey="lblGroupErrorResource1"></asp:Label>
    <asp:Label runat="server" ID="lblRoleError" Text="此角色被異動後已不存在，請重新設定" Visible="False" meta:resourcekey="lblRoleErrorResource1"></asp:Label>
    <asp:Label runat="server" ID="lblGroupTitleDelete" Text="部門或職級已被刪除，請重新設定" Visible="False" meta:resourcekey="lblGroupTitleDeleteResource1"></asp:Label>
    <asp:Label runat="server" ID="lblRoleSucess" Text="角色新增成功" Visible="False" meta:resourcekey="lblRoleSucessResource1"></asp:Label>
    <asp:Label runat="server" ID="lblSelectUser" Text="選取人員" Visible="False" meta:resourcekey="lblSelectUserResource1"></asp:Label>
</asp:Content>
