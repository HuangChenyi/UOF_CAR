<%@ Page Title="匯入Excel人員" Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="EIP_Duty_Agent_ImportAgentUser" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" Codebehind="ImportAgentUser.aspx.cs" %>

<%@ Register Src="~/Common/FileCenter/V3/UC_FileCenter.ascx" TagPrefix="uc2" TagName="UC_FileCenter" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <script type="text/javascript">
        function CheckSelectFile(source, args) {
            var uploadBtn = $find("<%= UC_FileCenter.ClientID %>");
            if (uploadBtn.get_count() == 0) {
                args.IsValid = false;
                return;
            }
        }
    </script>
    <table class="PopTable" cellspacing="1">
        <tr>
            <td style="white-space: nowrap;">
                <asp:Label ID="Label3" runat="server" Text="*" ForeColor="Red" meta:resourcekey="Label3Resource1"></asp:Label>
                <asp:Label ID="Label1" runat="server" Text="選擇匯入檔案" meta:resourcekey="Label1Resource1"></asp:Label>
            </td>
            <td>                
                <asp:CustomValidator ID="cvCheckSelectFile" runat="server" ErrorMessage="請選擇檔案" ClientValidationFunction="CheckSelectFile" Display="Dynamic" meta:resourcekey="cvCheckSelectFileResource1"></asp:CustomValidator>
                <uc2:UC_FileCenter runat="server" ID="UC_FileCenter" AllowedFileType="Excel" AllowedMultipleFileSelection="false" />
                <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/EIP/Duty/Agent/ImportAgentSample.xls" Text="下載Excel範例" Target="_blank" meta:resourcekey="HyperLink1Resource1"></asp:HyperLink>
            </td>
        </tr>
    </table>
    <asp:TextBox ID="txtMsg" runat="server" ReadOnly="True" Rows="15" TextMode="MultiLine" Width="100%" meta:resourcekey="txtMsgResource1"></asp:TextBox>
    <asp:Label ID="lblSuccess" runat="server" Text="已匯入{0}筆資料" Visible="False" meta:resourcekey="lblSuccessResource1"></asp:Label>
    <asp:Label ID="lblUserAccount" runat="server" Text="人員帳號為必填" Visible="False" meta:resourcekey="lblUserAccountResource1"></asp:Label>
    <asp:Label ID="lblNoUser" runat="server" Text="此人員不存在" Visible="False" meta:resourcekey="lblNoUserResource1"></asp:Label>
    <asp:Label ID="lblUserExcept" runat="server" Text="此人員帳號過期或停用" Visible="False" meta:resourcekey="lblUserExceptResource1"></asp:Label>
    <asp:Label ID="lblFormateErrorMsg" runat="server" Text="匯入檔案格式錯誤，請重新上傳！" Visible="False" meta:resourcekey="lblFormateErrorMsgResource1"></asp:Label>
    <asp:Label ID="lblNoAuthority" runat="server" Text="沒有此人員的維護權限，請修改資料後重新匯入。" Visible="False" meta:resourcekey="lblNoAuthorityResource1"></asp:Label>
    <asp:Label ID="lblFileNotParse" runat="server" Visible="False" Text="匯入的檔案無法解析" meta:resourcekey="lblFileNotParseResource1"></asp:Label>
</asp:Content>