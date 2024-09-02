<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ForgotPasswordVerify.aspx.cs" Inherits="Ede.Uof.Web.Basic.Personal.Password.ForgotPasswordVerify" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" %>

<html>
<head runat="server">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="referrer" content="no-referrer" />
    <title>忘記密碼驗證</title>

    <script>history.forward();</script>
    <style>
        body span {
            font-family: "Segoe UI", Arial, Helvetica,"文泉驛正黑", "WenQuanYi Zen Hei", "微軟正黑體", "Microsoft JhengHei", "黑體-繁","Heiti TC","微软雅黑","Microsoft YaHei", sans-serif !important;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <telerik:RadStyleSheetManager ID="RadStyleSheetManager1" runat="server">
            <StyleSheets>
                <telerik:StyleSheetReference Path="~/Common/Style/telerik.css" />
            </StyleSheets>
        </telerik:RadStyleSheetManager>
        <telerik:RadScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="True" AsyncPostBackTimeout="36000">
            <Scripts>
	            <asp:ScriptReference Assembly="Telerik.Web.UI" Name="Telerik.Web.UI.Common.Core.js" />
                <asp:ScriptReference Assembly="Telerik.Web.UI" Name="Telerik.Web.UI.Common.jQuery.js" />
                <asp:ScriptReference Assembly="Telerik.Web.UI" Name="Telerik.Web.UI.Common.jQueryInclude.js" />
                <asp:ScriptReference Path="~/Common/javascript/jQuery/plugin/jquery.blockUI.js" ScriptMode="Release" />
                <asp:ScriptReference Path="~/Common/javascript/uofScript.js" ScriptMode="Release" />
            </Scripts>
        </telerik:RadScriptManager>

        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0" class="tbbg01" style="font-size: small">
                    <tr>
                        <td>
                            <table style="margin: auto;width: 30%; min-width: 500px;" align="center" border="0" cellpadding="0" cellspacing="0">
                                <tr>
                                    <td style="height: 23px" width="15">
                                        <img src="<%=themePath %>/images/tab21.gif" width="15" />
                                    </td>
                                    <td background="<%=themePath %>/images/tab22.gif" class="e" style="height: 23px" valign="center">
                                        <asp:Label ID="lblEnterVerifyCode" runat="server" Text="輸入認證碼" meta:resourcekey="lblEnterVerifyCodeResource1"></asp:Label>
                                    </td>
                                    <td style="height: 23px" width="15">
                                        <img height="23" src="<%=themePath %>/images/tab23.gif" width="15" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <img height="9" src="<%=themePath %>/images/tab24.gif" width="15" />
                                    </td>
                                    <td background="<%=themePath %>/images/tab25.gif">
                                        <img height="9" src="<%=themePath %>/images/tab25.gif" width="1" />
                                    </td>
                                    <td>
                                        <img height="9" src="<%=themePath %>/images/tab26.gif" width="15" />
                                    </td>
                                </tr>
                                <tr>
                                    <td background="<%=themePath %>/images/tab27.gif" valign="top">
                                        <img height="1" src="<%=themePath %>/images/tab27.gif" width="15" />
                                    </td>
                                    <td align="center" bgcolor="#ffffff">&nbsp;
                                        <table width="95%" height="95%" align="center" style="font-size: small;">
                                            <tr>
                                                <td>
                                                    <asp:Label ID="lblSendVerify" runat="server" meta:resourcekey="lblSendVerifyResource1"></asp:Label><br /><br />
                                                    <table class="PopTable" cellspacing="1" style="font-size: small">
                                                        <tr>
                                                            <td style="white-space: nowrap">
                                                                <asp:Label ID="lblVerifyCodeTitle" runat="server" Text="認證碼" meta:resourcekey="lblVerifyCodeTitleResource1"></asp:Label></td>
                                                            <td>
                                                                <asp:TextBox ID="txtVerifyCode" runat="server" meta:resourcekey="txtVerifyCodedResource1" MaxLength="6"></asp:TextBox>
                                                                <br />
                                                                <asp:RequiredFieldValidator ID="rfvCheckVerifyCode" runat="server" ControlToValidate="txtVerifyCode" ForeColor="Red"
                                                                    Display="Dynamic" ErrorMessage="請輸入認證碼" SetFocusOnError="True" meta:resourcekey="rfvCheckVerifyCodeResource1"></asp:RequiredFieldValidator>
                                                                <asp:CustomValidator ID="cvVerifyCodeError" runat="server" ForeColor="Red" Display="Dynamic"
                                                                    ErrorMessage="認證碼不正確" meta:resourcekey="cvVerifyCodeErrorResource1"></asp:CustomValidator>
                                                                <asp:CustomValidator ID="cvCodeErrorInvalid" runat="server" ForeColor="Red" Display="Dynamic"
                                                                    ErrorMessage="認證碼已失效，請於五分鐘後重新索取" meta:resourcekey="cvCodeErrorInvalidResource1"></asp:CustomValidator>
                                                                <asp:CustomValidator ID="cvVerifyCodeInvalid" runat="server" ForeColor="Red" Display="Dynamic"
                                                                    ErrorMessage="認證碼已失效，請重新索取" meta:resourcekey="cvVerifyCodeInvalidResource1"></asp:CustomValidator>
                                                                <asp:CustomValidator ID="cvSmsCreditError" runat="server" ForeColor="Red" Display="Dynamic" 
                                                                    ErrorMessage="簡訊點數不足，無法發送簡訊，請洽系統管理員" meta:resourcekey="cvSmsCreditErrorResource1"></asp:CustomValidator>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="center" valign="top">
                                                    <br />
                                                    <br />
                                                    <telerik:RadButton ID="rdbGotoLogin" runat="server" Text="回登入頁" meta:resourcekey="rdbGotoLoginResource1" OnClick="rdbGotoLogin_Click" Style="position: relative;" CausesValidation="false"></telerik:RadButton>
                                                    <telerik:RadButton ID="rdbSendVerifyCode" runat="server" Text="重寄認證碼" meta:resourcekey="rdbSendVerifyCodeResource1" OnClick="rdbSendVerifyCode_Click" Style="position: relative;" CausesValidation="False" Visible="False"></telerik:RadButton>
                                                    <telerik:RadButton ID="rdbSubmit" runat="server" Text="確定" meta:resourcekey="rdbSubmitResource1" OnClick="rdbSubmit_Click" Style="position: relative;"></telerik:RadButton>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                    <td background="<%=themePath %>/images/tab28.gif" valign="top">
                                        <img height="1" src="<%=themePath %>/images/tab28.gif" width="15" /></td>
                                </tr>
                                <tr>
                                    <td>
                                        <img height="18" src="<%=themePath %>/images/tab29.gif" width="15" /></td>
                                    <td background="<%=themePath %>/images/tab30.gif">&nbsp;</td>
                                    <td>
                                        <img height="18" src="<%=themePath %>/images/tab31.gif" width="15" /></td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td style="height: 30px">
                            <table width="100%" border="0" cellpadding="0" cellspacing="0" background="<%=themePath %>/images/down_bg.gif">
                                <tr valign="bottom">
                                    <td width="30">&nbsp;</td>
                                    <td width="35" background="<%=themePath %>/images/down_bg.gif" bgcolor="#7e7f83">
                                        <img src="<%=themePath %>/images/down_fast.gif"></td>
                                    <td width="945" class="grayB">
                                        <%=DateTime.Now.Year %> e-Excellence Inc. All Rights Reserved.</td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
                <asp:Label ID="lblSendCodeMail" runat="server" Text="已寄出認證碼到您的信箱，請輸入您收到的認證碼來進行身份驗證<br>" Visible="False" meta:resourcekey="lblSendCodeMailResource1"></asp:Label>
                <asp:Label ID="lblSendCodeSMS" runat="server" Text="已寄出認證碼到您的手機，請輸入您收到的認證碼來進行身份驗證<br>" Visible="False" meta:resourcekey="lblSendCodeSMSResource1"></asp:Label>
                <asp:Label ID="lblReSendCodeMail" runat="server" Text="已重新寄出認證碼到您的信箱，請輸入您收到的認證碼來進行身份驗證<br>" Visible="False" meta:resourcekey="lblReSendCodeMailResource1"></asp:Label>
                <asp:Label ID="lblReSendCodeSMS" runat="server" Text="已重新寄出認證碼到您的手機，請輸入您收到的認證碼來進行身份驗證<br>" Visible="False" meta:resourcekey="lblReSendCodeSMSResource1"></asp:Label>
                <asp:Label ID="lblSuccessChange" runat="server" Text="已成功更新密碼" Visible="False" meta:resourcekey="lblSuccessChangeResource1"></asp:Label>
                <asp:Label ID="lblLinkError" runat="server" Text="連結異常，請確認您的連結是否正確" Visible="False" meta:resourcekey="lblLinkErrorResource1"></asp:Label>
                <asp:Label ID="lblChangePWDEmpty" runat="server" Text="已將密碼更新為空白" Visible="False" meta:resourcekey="lblChangePWDEmptyResource1"></asp:Label>
                <asp:Label ID="lblChangePWDBirtyday" runat="server" Text="已將密碼更新為您的生日" Visible="False" meta:resourcekey="lblChangePWDBirtydayResource1"></asp:Label>
                <asp:Label ID="lblChangePWDMobile" runat="server" Text="已將密碼更新為您的行動電話" Visible="False" meta:resourcekey="lblChangePWDMobileResource1"></asp:Label>
                <asp:Label ID="lblChangePWDSID" runat="server" Text="已將密碼更新為您的身分證字號" Visible="False" meta:resourcekey="lblChangePWDSIDResource1"></asp:Label>
                <asp:Label ID="lblChangePWD" runat="server" Text="已將密碼變更為" Visible="False" meta:resourcekey="lblChangePWDResource1"></asp:Label>
                <asp:Label ID="lblChangePWDSendMail" runat="server" Text="已將密碼變更為{0}，並寄送至你的信箱{1}" Visible="False" meta:resourcekey="lblChangePWDSendMailResource1"></asp:Label>
                <asp:HiddenField ID="hfUserGuid" runat="server" />
                <asp:HiddenField ID="hfCulture" runat="server" />
                <asp:HiddenField ID="hfSendType" runat="server" />
                <asp:HiddenField ID="hfSendTarget" runat="server" />
            </ContentTemplate>
        </asp:UpdatePanel>
    </form>
</body>
</html>
