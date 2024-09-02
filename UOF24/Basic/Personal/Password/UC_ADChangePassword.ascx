<%@ Control Language="C#" AutoEventWireup="true" Inherits="Basic_Personal_Password_UC_ADChangePassword" Codebehind="UC_ADChangePassword.ascx.cs" %>


<table class="PopTable" cellspacing="1" style="font-size:small">
    <tr>
        <td style="white-space: nowrap">
            <span style="color: #ff0000">*</span><asp:Label ID="Label1" runat="server"
                Text="舊密碼" meta:resourcekey="Label1Resource1"></asp:Label></td>
        <td class="PopTableRightTD">
            <asp:TextBox ID="txtOldPassword" runat="server" TextMode="Password" autocomplete="off" meta:resourcekey="txtOldPasswordResource1"></asp:TextBox>

            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtOldPassword"
                Display="Dynamic" ErrorMessage="請輸入舊密碼" SetFocusOnError="True"
                meta:resourcekey="RequiredFieldValidator3Resource1"></asp:RequiredFieldValidator>

        </td>
    </tr>
    <tr>
        <td style="white-space: nowrap">
            <span style="color: #ff0000">*</span><asp:Label ID="labNewPassword" runat="server"
                Text="新密碼" meta:resourcekey="labNewPasswordResource1"></asp:Label>
        </td>
        <td class="PopTableRightTD">
            <asp:TextBox ID="txbNewPassword" runat="server" TextMode="Password" autocomplete="off"
                meta:resourcekey="txbNewPasswordResource1"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txbNewPassword"
                Display="Dynamic" ErrorMessage="請輸入新密碼" SetFocusOnError="True" ForeColor="Red"
                meta:resourcekey="RequiredFieldValidator2Resource1"></asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td style="white-space: nowrap">
            <span style="color: #ff0000">*</span><asp:Label ID="labConfirmPassword"
                runat="server" Text="確認密碼" meta:resourcekey="labConfirmPasswordResource1"></asp:Label>
        </td>
        <td class="PopTableRightTD">
            <asp:TextBox ID="txbConfirmPassword" runat="server" TextMode="Password" autocomplete="off" meta:resourcekey="txbConfirmPasswordResource1"></asp:TextBox>
            <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txbNewPassword"
                ControlToValidate="txbConfirmPassword" Display="Dynamic" ErrorMessage="密碼不符,請重新輸入密碼" ForeColor="Red"
                SetFocusOnError="True" meta:resourcekey="CompareValidator1Resource1"></asp:CompareValidator>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txbConfirmPassword"
                Display="Dynamic" ErrorMessage="請輸入確認密碼" SetFocusOnError="True" ForeColor="Red"
                meta:resourcekey="RequiredFieldValidator1Resource1"></asp:RequiredFieldValidator></td>
    </tr>
    <tr>
        <td>&nbsp;</td>
        <td class="PopTableRightTD">
            <asp:CustomValidator ID="CustomValidator1" runat="server" Display="Dynamic" ForeColor="Red"
                ErrorMessage="變更AD密碼時發生下列錯誤,請稍候再試,如果問題持續發生,請聯絡您的系統管理員"
                meta:resourcekey="CustomValidator1Resource1"></asp:CustomValidator>
            <br />
            <asp:Label ID="lbErrorMessage" runat="server" Visible="False" ForeColor="Red"
                meta:resourcekey="lbErrorMessageResource1"></asp:Label>
        </td>
    </tr>
</table>

