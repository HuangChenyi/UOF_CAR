<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ChangePasswordByForgot.aspx.cs" Inherits="Ede.Uof.Web.Basic.Personal.Password.ChangePasswordByForgot" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" %>

<%@ Register Src="~/Basic/Personal/Password/UC_ChangePasswordByForgot.ascx" TagPrefix="uc1" TagName="UC_ChangePasswordByForgot" %>

<html>
<head runat="server">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="referrer" content="no-referrer" />
    <title>變更密碼</title>

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

        <table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0" class="tbbg01" style="font-size: small">
            <tr>
                <td>
                    <table style="margin: auto;width: 30%; min-width: 500px;" align="center" border="0" cellpadding="0" cellspacing="0">
                        <tr>
                            <td style="height: 23px" width="15">
                                <img src="<%=themePath %>/images/tab21.gif" width="15" />
                            </td>
                            <td background="<%=themePath %>/images/tab22.gif" class="e" style="height: 23px" valign="center">
                                <asp:Label ID="lblChangePasswordTitle" runat="server" Text="變更密碼" meta:resourcekey="lblChangePasswordTitleResource1"></asp:Label>
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
                                <table width="95%" height="95%" align="center" style="font-size: small">
                                    <tr>
                                        <td align="center">
                                            <uc1:UC_ChangePasswordByForgot runat="server" id="UC_ChangePasswordByForgot" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="center" valign="top">
                                            <br />
                                            <br />
                                            <telerik:RadButton ID="rdbGotoLogin" runat="server" Text="回登入頁" meta:resourcekey="rdbGotoLoginResource1" OnClick="rdbGotoLogin_Click" Style="position: relative;" CausesValidation="false"></telerik:RadButton>
                                            <telerik:RadButton ID="rdbtnChange" runat="server" Text="變更密碼" meta:resourcekey="WebImageButton1Resource1" OnClick="rdbtnChange_Click" style="position: relative;"></telerik:RadButton>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="center" valign="top"></td>
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
        <asp:Label ID="lblSuccessChange" runat="server" Text="已成功更新密碼" Visible="False" meta:resourcekey="lblSuccessChangeResource1"></asp:Label>
        <asp:Label ID="lblLinkTimeOut" runat="server" Text="連結已逾時" Visible="False" meta:resourcekey="lblLinkTimeOutResource1"></asp:Label>
        <asp:Label ID="lblLinkError" runat="server" Text="連結異常，請確認您的連結是否正確" Visible="False" meta:resourcekey="lblLinkErrorResource1"></asp:Label>
        <asp:Label ID="lblChangePWDEmpty" runat="server" Text="已將密碼更新為空白" Visible="False" meta:resourcekey="lblChangePWDEmptyResource1"></asp:Label>
        <asp:Label ID="lblChangePWDBirtyday" runat="server" Text="已將密碼更新為您的生日" Visible="False" meta:resourcekey="lblChangePWDBirtydayResource1"></asp:Label>
        <asp:Label ID="lblChangePWDMobile" runat="server" Text="已將密碼更新為您的行動電話" Visible="False" meta:resourcekey="lblChangePWDMobileResource1"></asp:Label>
        <asp:Label ID="lblChangePWDSID" runat="server" Text="已將密碼更新為您的身分證字號" Visible="False" meta:resourcekey="lblChangePWDSIDResource1"></asp:Label>
        <asp:Label ID="lblChangePWD" runat="server" Text="已將密碼更新為" Visible="False" meta:resourcekey="lblChangePWDResource1"></asp:Label>
        <asp:HiddenField ID="hfTimeSpan" runat="server" />
    </form>

</body>
</html>