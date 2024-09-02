<%@ Page Language="C#" AutoEventWireup="true" Inherits="Basic_Personal_ForceChangePassword" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" Codebehind="ForceChangePassword.aspx.cs" %>

<%@ Register Src="UC_ChangePassword.ascx" TagName="UC_ChangePassword" TagPrefix="uc1" %>
 
<html>
<head runat="server">
    <meta http-equiv="X-UA-Compatible" content="IE=edge"> 
    <meta name="referrer" content="no-referrer" />
    <title>變更密碼</title>

    <style>
        body span {
            font-family: "Segoe UI", Arial, Helvetica,"文泉驛正黑", "WenQuanYi Zen Hei", "微軟正黑體", "Microsoft JhengHei", "黑體-繁","Heiti TC","微软雅黑","Microsoft YaHei", sans-serif !important;
        }
    </style>
</head>
<body>

    <form id="form1" runat="server">
         <telerik:RadStyleSheetManager ID="RadStyleSheetManager1" runat="server" EnableStyleSheetCombine="True">
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

        <table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0" class="tbbg01" style="font-size:small">
            <tr>
                <td valign="top">
                    <table style="margin:auto " align="center" border="0" cellpadding="0" cellspacing="0" width="50%">
                    <tr>
                        <td style="height: 23px" width="15">
                            <img src="<%=themePath %>/images/tab21.gif" width="15" />
                        </td>
                        <td background="<%=themePath %>/images/tab22.gif" class="e" style="height: 23px" valign="center">
                            <asp:Label ID="Label3" runat="server" Text="變更密碼"  meta:resourcekey="Label3Resource1"></asp:Label>
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
        <table width="95%" height="95%" align="center" style="font-size:small">
            <tr>
                <td align="center">
                    <asp:Label ID="lbFirstLogin" runat="server" Text="您好,歡迎你使用1st U-Office Force系統，請設定您的密碼" Font-Bold="True" Visible="false" meta:resourcekey="lbFirstLoginResource1"></asp:Label>
                    <asp:Label ID="lbForgetPw" runat="server" Text="請重新設定您的密碼" Font-Bold="True" Visible="false" meta:resourcekey="lbForgetPwResource1"></asp:Label>
                    <asp:Label ID="lbPwReset" runat="server" Text="您的密碼已經被管理員清除了，請重新設定您的密碼" Font-Bold="True" Visible="false" meta:resourcekey="lbPwResetResource1"></asp:Label>
                    <asp:Label ID="lbPwPolicy" runat="server" Text="您的密碼使用有效期限已經到了，請重新設定您的密碼" Font-Bold="True" Visible="false" meta:resourcekey="lbPwPolicyResource1"></asp:Label><br />
                    <%--<asp:Label ID="Label1" runat="server" Text="為了您帳號的安全,請立即變更您的密碼" Font-Bold="True" meta:resourcekey="Label1Resource1"></asp:Label><br />--%>
                    <%--<asp:Label ID="Label2" runat="server" Text="密碼變更完成後會系統自動登出,請使用新密碼登入" Font-Bold="True" meta:resourcekey="Label2Resource1"></asp:Label><br />--%>
                    &nbsp;</td>
            </tr>
            <tr>
                <td align="center">
                    <uc1:UC_ChangePassword ID="UC_ChangePassword1" runat="server" />
                </td>
            </tr>
            <tr>
                <td align="center" valign="top">
                    <br />
                    <br />
                    <telerik:RadButton ID="rdbtmChange" runat="server" Text="變更密碼" meta:resourcekey="WebImageButton1Resource1" OnClick="rdbtmChange_Click"></telerik:RadButton>
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
        <asp:Label ID="msgChangepw" runat="server" Text="變更密碼" Visible="False" meta:resourcekey="msgChangepwResource1"></asp:Label>
        <asp:HiddenField ID="hfReturnUrl" runat="server" />
    </form>

</body>
</html>
