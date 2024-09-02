<%@ Page Title="群組權限維護" Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" CodeBehind="EditMemberAuthority.aspx.cs" Inherits="System_Organization_Member_EditMemberAuthority" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" %>

<%@ Register Src="~/Common/ChoiceCenter/UC_ChoiceList.ascx" TagPrefix="uc1" TagName="UC_ChoiceList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script type="text/javascript">

        function CheckSelectGroup(source, args) {
            var groupList = $('#<%= hfGroupList.ClientID%>');
                    if (groupList.val() == '') {
                        args.IsValid = false;
                        return;
                    }
                }
    </script>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>

            <table class="PopTable" cellspacing="1" width="100%">
                                <tr>
                    <td style="white-space: nowrap;">
                        <asp:Label ID="Label3" runat="server" Text="*" ForeColor="Red"></asp:Label>
                        <asp:Label ID="Label2" runat="server" Text="群組" meta:resourcekey="Label2Resource1"></asp:Label>
                    </td>
                    <td style="white-space: nowrap;">                       
                        <asp:CustomValidator ID="cvCheckSelectGroup" runat="server" ErrorMessage="請選擇群組" Display="Dynamic" ClientValidationFunction="CheckSelectGroup" meta:resourcekey="cvCheckSelectGroupResource1"></asp:CustomValidator>
                        <uc1:UC_ChoiceList runat="server" ID="UC_ChoiceListGroup" />
                    </td>
                </tr>
                <tr>
                    <td style="white-space: nowrap;">
                        <asp:Label ID="Label6" runat="server" Text="可維護人員" meta:resourcekey="Label6Resource1"></asp:Label>
                    </td>
                    <td>
                        <uc1:UC_ChoiceList runat="server" ID="UC_ChoiceListMgt" />
                    </td>
                </tr>
                <tr>
                    <td style="white-space: nowrap;">
                        <asp:Label ID="Label1" runat="server" Text="可觀看人員" meta:resourcekey="Label1Resource1"></asp:Label>
                    </td>
                    <td style="white-space: nowrap;">                        
                        <uc1:UC_ChoiceList runat="server" ID="UC_ChoiceListView" />
                    </td>
                </tr>

            </table>
            <asp:HiddenField ID="hfAuthGuid" runat="server" />
            <asp:Label ID="lblChoiceText" runat="server" Text="選取群組" Visible="False" meta:resourcekey="lblChoiceTextResource1"></asp:Label>
            <asp:HiddenField ID="hfGroupList" runat="server" />
            <asp:HiddenField ID="hfMgtRmId" runat="server" />
            <asp:HiddenField ID="hfViewRmId" runat="server" />
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
