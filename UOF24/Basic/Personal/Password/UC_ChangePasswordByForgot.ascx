<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UC_ChangePasswordByForgot.ascx.cs" Inherits="Ede.Uof.Web.Basic.Personal.Password.UC_ChangePasswordByForgot" %>

<style type="text/css">
    .ImgInvisible
    {
        display: none;
    }
</style>

<div style="text-align: left; padding-bottom: 5px;">
    <asp:Label ID="lblNewPWDTitle" runat="server" Text="請重新設定您的新密碼" meta:resourcekey="lblNewPWDTitleResource1"></asp:Label>
</div>
<table class="PopTable" cellspacing="1" style="font-size: small">
    <asp:Panel runat="server" ID="panelPassword" meta:resourcekey="panelPasswordResource1">
        <tr>
            <td style="white-space: nowrap">
                <span style="color: red">*</span><asp:Label ID="lblNewPassword" runat="server" Text="新密碼" meta:resourcekey="lblNewPasswordResource1"></asp:Label></td>
            <td>
                <asp:TextBox ID="txtNewPassword" runat="server" TextMode="Password" autocomplete="off" meta:resourcekey="txtNewPasswordResource1" MaxLength="20"></asp:TextBox>
                <br />
                <asp:RequiredFieldValidator ID="rfvCheckPassword" runat="server" ControlToValidate="txtNewPassword" ForeColor="Red"
                    Display="Dynamic" ErrorMessage="請輸入新密碼" SetFocusOnError="True" meta:resourcekey="rfvCheckPasswordResource1"></asp:RequiredFieldValidator>
                <asp:CustomValidator ID="cvHistoryPassword" runat="server" ForeColor="Red" Display="Dynamic" ControlToValidate="txtNewPassword"
                    meta:resourcekey="cvHistoryPasswordResource1"></asp:CustomValidator>
                <asp:CustomValidator ID="cvPasswordFormatError" runat="server" ForeColor="Red" Display="Dynamic"
                    ErrorMessage="密碼格式不正確" ControlToValidate="txtNewPassword" ClientValidationFunction="CheckPasswordFormat" meta:resourcekey="cvPasswordFormatErrorResource1"></asp:CustomValidator>
            </td>
        </tr>
        <tr>
            <td style="white-space: nowrap">
                <asp:Label ID="lbPasswordComplexityRequest" runat="server" Text="密碼設定要求"　meta:resourcekey="lblPasswordComplexityRequestResource1"></asp:Label>
            </td>
            <td>
                <table cellpadding="0" cellspacing="0" style="font-size:small">
                    <tr>
                        <td>
                            <asp:Image ID="imgReqMinLength" runat="server"
                                ImageUrl="~/Common/Images/Icon/icon_m173.gif"
                                CssClass="ImgInvisible" meta:resourcekey="imgReqMinLengthResource1" />
                        </td>
                        <td style="white-space: nowrap;">
                            <asp:Label ID="lblReqMinLength" runat="server" Text="密碼最小長度:" meta:resourcekey="lblReqMinLengthResource1"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Image ID="imgReqMinUpper" runat="server"
                                ImageUrl="~/Common/Images/Icon/icon_m173.gif"
                                CssClass="ImgInvisible" meta:resourcekey="imgReqMinUpperResource1" />
                        </td>
                        <td style="white-space: nowrap">
                            <asp:Label ID="lblReqMinUpper" runat="server" Text="最少大寫字母個數:" meta:resourcekey="lblReqMinUpperResource1"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Image ID="imgReqMinLower" runat="server"
                                ImageUrl="~/Common/Images/Icon/icon_m173.gif"
                                CssClass="ImgInvisible" meta:resourcekey="imgReqMinLowerResource1" />
                        </td>
                        <td style="white-space: nowrap">
                            <asp:Label ID="lblReqMinLower" runat="server" Text="最少小寫字母個數:" meta:resourcekey="lblReqMinLowerResource1"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Image ID="imgReqMinNumeric" runat="server"
                                ImageUrl="~/Common/Images/Icon/icon_m173.gif"
                                CssClass="ImgInvisible" meta:resourcekey="imgReqMinNumericResource1" />
                        </td>
                        <td style="white-space: nowrap">
                            <asp:Label ID="lblReqMinNumeric" runat="server" Text="最少數字個數:" meta:resourcekey="lblReqMinNumericResource1"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Image ID="imgReqMinSymbol" runat="server"
                                ImageUrl="~/Common/Images/Icon/icon_m173.gif"
                                CssClass="ImgInvisible" meta:resourcekey="imgReqMinSymbolResource1" />
                        </td>
                        <td style="white-space: nowrap">
                            <asp:Label ID="lblReqMinSymbol" runat="server" Text="最少符號個數:" meta:resourcekey="lblReqMinSymbolResource1"></asp:Label>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td style="white-space: nowrap">
                <span style="color: red">*</span><asp:Label ID="lblConfirmPassword" runat="server" Text="確認密碼" meta:resourcekey="lblConfirmPasswordResource1"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtConfirmPassword" runat="server" TextMode="Password" autocomplete="off"  meta:resourcekey="txtConfirmPasswordResource1" MaxLength="20"></asp:TextBox>
                <br />
                <asp:CompareValidator ID="cvCheckNewPassword" runat="server" ControlToCompare="txtNewPassword"
                    ControlToValidate="txtConfirmPassword" Display="Dynamic" ErrorMessage="密碼不相符" ForeColor="Red"
                    SetFocusOnError="True" meta:resourcekey="CompareValidator1Resource1"></asp:CompareValidator>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtConfirmPassword" ForeColor="Red"
                    Display="Dynamic" ErrorMessage="請輸入確認密碼" SetFocusOnError="True" meta:resourcekey="RequiredFieldValidator1Resource1"></asp:RequiredFieldValidator>
            </td>
        </tr>
    </asp:Panel>
</table>
<asp:HiddenField ID="hfUserGuid" runat="server" />
<asp:TextBox ID="txtReqAccount" runat="server" Style="display: none;" meta:resourcekey="txtReqAccountResource1"></asp:TextBox>
<asp:Label ID="lblEnforcePasswordHistory" runat="server" Text="新密碼不能與前{0}次密碼相同,請重新輸入" Visible="False" meta:resourcekey="lblEnforcePasswordHistoryResource1"></asp:Label>

<script>
    function CheckPasswordFormat(obj, args) {

        var pwd = PasswordAnalyzer(args.Value);

        args.IsValid = (pwd[0] >= reqLength
            && pwd[1] >= reqUpperCount
            && pwd[2] >= reqLowerCount
            && pwd[3] >= reqDigitCount
            && pwd[4] >= reqSymbolCount);
    }

    function CheckPassword(password) {
        var pwd = PasswordAnalyzer(password);

        var className = null;
        $('#<%=imgReqMinLength.ClientID %>').attr("class", className = pwd[0] >= reqLength ? "" : "ImgInvisible");
        $('#<%=imgReqMinUpper.ClientID %>').attr("class", className = pwd[1] >= reqUpperCount && reqUpperCount != 0 ? "" : "ImgInvisible");
        $('#<%=imgReqMinLower.ClientID %>').attr("class", className = pwd[2] >= reqLowerCount && reqLowerCount != 0 ? "" : "ImgInvisible");
        $('#<%=imgReqMinNumeric.ClientID %>').attr("class", className = pwd[3] >= reqDigitCount && reqDigitCount != 0 ? "" : "ImgInvisible");
        $('#<%=imgReqMinSymbol.ClientID %>').attr("class", className = pwd[4] >= reqSymbolCount && reqSymbolCount != 0 ? "" : "ImgInvisible");
    }

    function PasswordAnalyzer(password) {
        var numb = '0123456789';
        var lwr = 'abcdefghijklmnopqrstuvwxyz';
        var upr = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
        var sym = "~!@#$%^&*()_+`-=[]\\{}|;':\",./<>?";

        var upperCount = 0;
        var lowerCount = 0;
        var digitCount = 0;
        var symbolCount = 0;

        for (var i = 0; i < password.length; i++) {
            if (upr.indexOf(password.charAt(i)) > -1)
                upperCount++;
            else if (lwr.indexOf(password.charAt(i)) > -1)
                lowerCount++;
            else if (numb.indexOf(password.charAt(i)) > -1)
                digitCount++;
            else if (sym.indexOf(password.charAt(i)) > -1)
                symbolCount++;
        }

        var pwd = [password.length, upperCount, lowerCount, digitCount, symbolCount];
        return pwd;
    }
</script>