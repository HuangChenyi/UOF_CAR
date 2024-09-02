<%@ Page Language="C#" AutoEventWireup="true" Inherits="Basic_Personal_Password_ADNotifyExpire" culture="auto" Codebehind="ADNotifyExpire.aspx.cs" %>
<%@ Register src="UC_ADChangePassword.ascx" tagname="UC_ADChangePassword" tagprefix="uc2" %>
<html>
<head runat="server">
    <meta http-equiv="X-UA-Compatible" content="IE=edge"> 
    <meta name="referrer" content="no-referrer" />
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <telerik:RadScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="True" AsyncPostBackTimeout="36000">
            <Scripts>
                <asp:ScriptReference Assembly="Telerik.Web.UI" Name="Telerik.Web.UI.Common.Core.js" />
                <asp:ScriptReference Assembly="Telerik.Web.UI" Name="Telerik.Web.UI.Common.jQuery.js" />
                <asp:ScriptReference Assembly="Telerik.Web.UI" Name="Telerik.Web.UI.Common.jQueryInclude.js" />
            </Scripts>
        </telerik:RadScriptManager>

        <table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0" class="tbbg01">
            <tr>
                <td valign="top">
                    &nbsp;
                    <div align="center">
                        <table align="center" border="0" cellpadding="0" cellspacing="0" width="50%">
                            <tr>
                                <td style="height: 23px" width="15">
                                    <img src="<%=themePath %>/images/tab21.gif" width="15" />
                                </td>
                                <td background="<%=themePath %>/images/tab22.gif" class="e" style="height: 23px"
                                    valign="baseline">
                                    <asp:Label ID="Label3" runat="server" Text="密碼到期提醒" meta:resourceKey="Label3Resource1" ></asp:Label>
                                </td>
                                <td style="height: 23px" width="15">
                                    <img height="23" src="<%=themePath %>/images/tab23.gif" width="15" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <img height="9" src="<%=themePath %>/images/tab24.gif" width="15" /></td>
                                <td background="<%=themePath %>/images/tab25.gif">
                                    <img height="9" src="<%=themePath %>/images/tab25.gif" width="1" /></td>
                                <td>
                                    <img height="9" src="<%=themePath %>/images/tab26.gif" width="15" /></td>
                            </tr>
                            <tr>
                                <td background="<%=themePath %>/images/tab27.gif" valign="top">
                                    <img height="1" src="<%=themePath %>/images/tab27.gif" width="15" /></td>
                                <td align="center" bgcolor="#ffffff">
                                    &nbsp;
                                    <table width="95%" height="95%" align="center">
                                        <tr>
                                            <td align="center">
                                                <asp:Label ID="lbDescript" runat="server" Text="提醒您,您AD的密碼在[{0}]天後即將到期!&lt;BR&gt;建議您立即修改密碼" 
                                                    Font-Bold="True" meta:resourceKey="lbFirstLoginResource1" >
                                                </asp:Label> 
                                                &nbsp;
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="center" style="padding-bottom:10px;">
                                                <br />
                                                <asp:Label ID="lblLastModifyPasswordDateTitle" runat="server" Text="上次密碼變更日期："　
                                                    Font-Bold="True" meta:resourcekey="lblLastModifyPasswordDateTitleResource1">
                                                </asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="center" valign="top">
                                               <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                                                   <ContentTemplate>
                                                       <uc2:UC_ADChangePassword ID="UC_ADChangePassword1" runat="server" />
                                                       <br />
                                                       <telerik:RadButton ID="RadButton1" runat="server" Text="變更密碼" 
                                                           meta:resourcekey="WebImageButton1Resource1" onclick="RadButton1_Click">
                                                       </telerik:RadButton>
                                                       &nbsp;
                                                       <telerik:RadButton ID="RadButton2" runat="server" Text="暫不修改"  CausesValidation="false"
                                                           meta:resourcekey="WebImageButton2Resource1" onclick="RadButton2_Click">
                                                       </telerik:RadButton>
                                                   </ContentTemplate>
                                               </asp:UpdatePanel>
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
                                    <img height="18" src="<%=themePath %>/images/tab29.gif" width="15" />
                                </td>
                                <td background="<%=themePath %>/images/tab30.gif">
                                    &nbsp;
                                </td>
                                <td>
                                    <img height="18" src="<%=themePath %>/images/tab31.gif" width="15" />
                                </td>
                            </tr>
                        </table>
                    </div>
                </td>
            </tr>
            <tr>
                <td style="height: 30px">
                    <table width="100%" border="0" cellpadding="0" cellspacing="0" background="<%=themePath %>/images/down_bg.gif">
                        <tr valign="bottom">
                            <td width="30">
                                &nbsp;
                            </td>
                            <td width="35" background="<%=themePath %>/images/down_bg.gif" bgcolor="#7e7f83">
                                <img src="<%=themePath %>/images/down_fast.gif">
                            </td>
                            <td width="945" class="grayB">
                                <%=DateTime.Now.Year %> e-Excellence Inc. All Rights Reserved.
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>

        <asp:Label ID="lbErrorMessage" runat="server" Text="取得密碼到期日時,發生下列錯誤,請聯絡您的系統管理員" Visible="False" meta:resourceKey="msgChangepwResource1" ></asp:Label>
        <asp:HiddenField ID="hfReturnUrl" runat="server" />
    </form>
</body>
</html>
