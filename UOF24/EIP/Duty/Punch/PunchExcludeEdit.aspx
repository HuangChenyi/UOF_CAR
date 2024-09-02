<%@ Page Title="維護特殊人員權限" Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" CodeBehind="PunchExcludeEdit.aspx.cs" Inherits="EIP_Duty_Punch_PunchExcludeEdit" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" %>

<%@ Register Src="~/Common/ChoiceCenter/UC_ChoiceList.ascx" TagPrefix="uc1" TagName="UC_ChoiceList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <script id="punchJS" type="text/javascript">

        function CheckChoiceUserExists(sender, args) {

            if ($("#<%= hfUserSetCount.ClientID %>").val()) {

                if (Number($("#<%= hfUserSetCount.ClientID %>").val()) <= 0) {
                    args.IsValid = false;
                    return;
                }
            }
            else {
                args.IsValid = false;
                return;
            }
        }
    </script>

    <asp:Label ID="lblAuthAlredayRemove" runat="server" Text="維護權限已被移除，請重新登入系統" ForeColor="Red" Visible="False" meta:resourcekey="lblAuthAlredayRemoveResource1"></asp:Label>

    <table id="tbMain" class="PopTable" runat="server">
        <tr>
            <td class="PopTableLeftTD" style="white-space:nowrap">
                <asp:Label ID="lblStar" runat="server" Text="*" ForeColor="Red" meta:resourcekey="lblStarResource1"></asp:Label>
                <asp:Label ID="lblUser" runat="server" Text="人員" meta:resourcekey="lblUserResource1"></asp:Label>
            </td>
            <td class="PopTableRightTD" colspan="3">
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <uc1:UC_ChoiceList runat="server" ID="UC_ChoiceList" ShowMember="false" ExpandToUser="false" />
                        <asp:HiddenField ID="hfUserSetCount" runat="server" />
                    </ContentTemplate>
                </asp:UpdatePanel>
                &nbsp;
                <asp:CustomValidator ID="cvChoiceUserExists" runat="server" ErrorMessage="請選擇人員" ForeColor="Red"
                    ClientValidationFunction="CheckChoiceUserExists" Display="Dynamic" meta:resourcekey="cvChoiceUserExistsResource1"></asp:CustomValidator>
            </td>
        </tr>
        <tr>
            <td class="PopTableLeftTD" style="white-space:nowrap">
                <asp:Label ID="lblStatus" runat="server" Text="狀態" meta:resourcekey="lblStatusResource1"></asp:Label>
            </td>
            <td class="PopTableRightTD" colspan="3">
                <asp:CheckBox ID="cbActive" Checked="True" runat="server" meta:resourcekey="cbActiveResource1" />
                <asp:Label ID="lblActive" runat="server" Text="啟用" meta:resourcekey="lblActiveResource1"></asp:Label>
            </td>
        </tr>
    </table>

    <asp:HiddenField ID="hfPunchExcludeGuid" runat="server" />

</asp:Content>
