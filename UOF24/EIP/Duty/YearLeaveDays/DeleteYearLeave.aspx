<%@ Page Title="刪除年休資訊" Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" CodeBehind="DeleteYearLeave.aspx.cs" Inherits="Ede.Uof.Web.EIP.Duty.YearLeaveDays.DeleteYearLeave" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" %>

<%@ Register Src="~/Common/ChoiceCenter/UC_ChoiceList.ascx" TagPrefix="uc1" TagName="UC_ChoiceList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script type="text/javascript">
        function CheckSelectUser(source, args) {
            var userList = $('#<%= hfUserList.ClientID%>');
            if (userList.val() == '') {
                args.IsValid = false;
                return;
            }
        }
        function ConfirmDelete() {
            if (!confirm('<%= lblConfirmMsg.Text%>'))
                return false;
        }
    </script>

    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <table class="PopTable">
                <tr>
                    <td colspan="2" align="center" class="PopTableHeader" style="text-align: center!important">
                        <asp:Label ID="Label1" runat="server" Text="刪除年休" meta:resourcekey="Label1Resource1"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label2" runat="server" Text="年度" meta:resourcekey="Label2Resource1"></asp:Label>
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlYear" runat="server" meta:resourcekey="ddlYearResource1"></asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label4" runat="server" Text="*" ForeColor="Red" meta:resourcekey="Label4Resource1"></asp:Label>
                        <asp:Label ID="Label3" runat="server" Text="人員" meta:resourcekey="Label3Resource1"></asp:Label>
                    </td>
                    <td>
                        <uc1:UC_ChoiceList runat="server" ID="UC_ChoiceList" ShowMember="false" ExpandToUser="false"/>
                        <asp:CustomValidator ID="cvCheckSelectUser" runat="server" ErrorMessage="請選擇人員" Display="Dynamic" ClientValidationFunction="CheckSelectUser" meta:resourcekey="cvCheckSelectUserResource1"></asp:CustomValidator>
                    </td>
                </tr>
            </table>
            <table style="width:100%">
                <tr>
                    <td>
                        <asp:Label ID="lblMessage" runat="server" ForeColor="Blue" meta:resourcekey="lblMessageResource1"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:TextBox ID="txtErrorInfo" runat="server" Width="100%" TextMode="MultiLine" style="display:none" meta:resourcekey="txtErrorInfoResource1"></asp:TextBox>
                    </td>
                </tr>
            </table>
            <asp:HiddenField ID="hfUserList" runat="server" />
        </ContentTemplate>
    </asp:UpdatePanel>
    
    <asp:Label ID="lblFailCount" runat="server" Text="錯誤{0}筆，錯誤訊息如下:" Width="100%" Visible="False" meta:resourcekey="lblFailCountResource1"></asp:Label>
    <asp:Label ID="lblInfo" runat="server" Text="該年度年休若已使用，將無法刪除。" ForeColor="Blue" Visible="False" meta:resourcekey="lblInfoResource1"></asp:Label>
    <asp:Label ID="lblConfirmMsg" runat="server" Style="display: none" Text="將刪除所選人員此年度年休資料，確定刪除？" meta:resourcekey="lblConfirmMsgResource1"></asp:Label>
    <asp:Label ID="lblButton1Text" runat="server" Text="刪除年休資訊" Visible="False" meta:resourcekey="lblButton1TextResource1"></asp:Label>
    <asp:Label ID="lblReason" runat="server" Text="刪除年休" Visible="False" meta:resourcekey="lblReasonResource1"></asp:Label>
    <asp:Label ID="lblSuccessMsg" runat="server" Text="已刪除所選人員此年度年休資料與異動紀錄。" Visible="False" meta:resourcekey="lblSuccessMsgResource1"></asp:Label>
    <asp:Label ID="lblErrorMsg" runat="server" Text="已使用此年度年休，不可刪除。" Visible="False" meta:resourcekey="lblErrorMsgResource1"></asp:Label>
    <asp:Label ID="lblErrorMsg2" runat="server" Text="已產生下一年度年休，不可刪除。" Visible="False" meta:resourcekey="lblErrorMsg2Resource1"></asp:Label>
</asp:Content>
