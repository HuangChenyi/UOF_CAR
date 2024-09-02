<%@ Page Language="C#" Theme="DefaultTheme" MasterPageFile="~/Master/DialogMasterPage.master"  AutoEventWireup="true" Inherits="ForgetPW" Culture="auto" UICulture="auto" Codebehind="ForgotPassword.aspx.cs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
        <table align="center" border="0" cellpadding="2" cellspacing="1" width="90%">
            <tr>               
                <td class="LoginT" style="width: 70px">
                    <span style="color: #ff0000">*</span><asp:Label ID="Label1" runat="server" meta:resourcekey="Label1Resource1" Text="帳號："></asp:Label></td>
                <td>
                    &nbsp;<asp:TextBox ID="txtAccount" runat="server" meta:resourcekey="accTXTResource1"
                        Width="160px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rvalidAccount" runat="server" ControlToValidate="txtAccount"
                        ErrorMessage="請輸入帳號" Display="Dynamic" meta:resourcekey="rvalidAccountResource1"></asp:RequiredFieldValidator></td>
                <td style="width: 9px">
                    &nbsp;</td>
            </tr>
            <tr>
                
                <td class="LoginT" style="width: 70px">
                    <span style="color: #ff0000">*</span><asp:Label ID="Label2" runat="server" meta:resourcekey="Label2Resource1" Text="EMAIL："></asp:Label></td>
                <td>
                    &nbsp;<asp:TextBox ID="txtPwd" runat="server" meta:resourcekey="pwdTXTResource1"
                        Width="160px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rvalidEmail" runat="server" ControlToValidate="txtPwd"
                        ErrorMessage="請輸入EMAIL" Display="Dynamic" meta:resourcekey="rvalidEmailResource1"></asp:RequiredFieldValidator>
                    <asp:CustomValidator ID="cvalidInfo" runat="server" Display="Dynamic" ErrorMessage="找不到此帳號及Mail資訊,請重新輸入" meta:resourcekey="cvalidInfoResource1"></asp:CustomValidator>
                    </td>
                <td style="width: 9px">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="LoginT" colspan="3" align="center">
                    <asp:CustomValidator ID="cvSuccess" runat="server" Display="Dynamic" ErrorMessage="寄出密碼通知成功" meta:resourcekey="cvSuccessResource1"></asp:CustomValidator></td>
            </tr>
        </table>
   </asp:Content>

