<%@ Page Title="" Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" CodeBehind="ExportRoleManageDetail.aspx.cs" Inherits="System_Organization_Auth_ExportRoleManageDetail" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" %>
<%@ Register src="~/Common/ChoiceCenter/UC_ChoiceList.ascx" tagname="UC_ChoiceList" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <script>
        function showMessage() {
            alert('<%=lblProcessMsg.Text %>');
        }
    </script>
    <style>
        .PopTable > tbody > tr > td:nth-child(odd){
            width:20%;
            vertical-align:middle
        }
    </style>
    <asp:UpdatePanel runat="server" ID="updaDatePanel">
        <ContentTemplate>
            <table class="PopTable">
                <tr>
                    <td>
                        <asp:Label ID="lblModuleTitle" runat="server" Text="模組" meta:resourcekey="lblModuleTitleResource1"></asp:Label>
                    </td>
                    <td>
                        <asp:DropDownList ID="ddModuleList" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddModuleList_SelectedIndexChanged" meta:resourcekey="ddModuleListResource1"></asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblRoleTitle" runat="server" Text="角色" meta:resourcekey="lblRoleTitleResource1"></asp:Label>
                    </td>
                    <td>
                        <asp:DropDownList ID="ddRoleList" runat="server" AutoPostBack="True" meta:resourcekey="ddRoleListResource1"></asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblMemberTitle" runat="server" Text="人員" meta:resourcekey="lblMemberTitleResource1"></asp:Label>
                    </td>
                    <td>
                        <uc1:UC_ChoiceList ID="UC_ChoiceList" runat="server" ShowMember="false" ExpandToUser="false"></uc1:UC_ChoiceList>
                    </td>
                </tr>
            </table>
            <asp:HiddenField ID="hfCurrentUser" runat="server" />
            <asp:HiddenField ID="hfUserIPAddress" runat="server" />
            <asp:HiddenField ID="hfCurrentCulture" runat="server" />    
            <asp:Label ID="lblAll" runat="server" Text="全部" Visible="False" meta:resourcekey="lblAllResource1"></asp:Label>
            <asp:Label ID="lblProcessMsg" runat="server" Text="報表匯出已進入系統排程，請於五分鐘後至[下載匯出報表]中下載" Visible="False" meta:resourcekey="lblProcessMsgResource1"></asp:Label>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
