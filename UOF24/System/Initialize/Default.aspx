<%@ Page Language="C#" AutoEventWireup="true" Inherits="System_Initialize_Default" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" Codebehind="Default.aspx.cs" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Charting" TagPrefix="telerik" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE html>
<html>
<head runat="server">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="referrer" content="no-referrer" />
    <title>系統快速設定</title>

    <link rel="home" id="ApplicationRoot" href="" runat="server" enableviewstate="False" clientidmode="Static" />
    <link id="Link2" href="~/Common/Style/uof-fixed.css" rel="stylesheet" runat="server" />
    <link id="Link3" href="~/Common/Style/telerik.css" rel="stylesheet" runat="server" />
</head>
<body>
    <form id="form1" runat="server">
        <input type="hidden" name="FASTReturnValue" id="FASTReturnValue" value="[DefaultNullValue]" />
    <telerik:RadScriptManager  ID="ScriptManager1" runat="server" EnablePageMethods="True" AsyncPostBackTimeOut="36000">
         <Scripts>
	            <asp:ScriptReference Assembly="Telerik.Web.UI" Name="Telerik.Web.UI.Common.Core.js" />
                <asp:ScriptReference Assembly="Telerik.Web.UI" Name="Telerik.Web.UI.Common.jQuery.js" />
                <asp:ScriptReference Assembly="Telerik.Web.UI" Name="Telerik.Web.UI.Common.jQueryInclude.js" />
                <asp:ScriptReference Path="~/Common/javascript/uofScript.js" ScriptMode="Release" />
                <asp:ScriptReference Path="~/Common/javascript/jQuery/plugin/jquery.blockUI.js" ScriptMode="Release" />
            </Scripts>
    </telerik:RadScriptManager>
                <telerik:RadWindowManager ID="RadWindowManager1" runat="server" Modal="True"
            ReloadOnShow="true" DestroyOnClose="True" ShowOnTopWhenMaximized="False"
            EnableShadow="True" ShowContentDuringLoad="false"
            Style="z-index: 9001" Behaviors="Resize, Close, Maximize, Move, Reload" VisibleStatusbar="False">
        </telerik:RadWindowManager>
        <table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0" class="tbbg01">
            <tr>
                <td background="<%=themePath %>/images/up_bg.jpg" style="height: 59px">
                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                            <td width="5%">&nbsp;</td>
                            <td>
                                <img src="../../Common/Images/1steLogo.gif"></td>
                            <td></td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td valign="top">
                    <br />
                    <br />

                    <fieldset class="UofContainer" style="width: 1024px">
                        <legend style="height: 35px; white-space: nowrap">
                            <asp:Label ID="Label1" runat="server" Text="歡迎使用U-Office Force系統,請跟著下列步驟完成系統初始化設定" class="SizeSB" meta:resourcekey="Label1Resource1"></asp:Label></legend>
                        <div>
                            <table style="width: 90%">
                                <tr>
                                    <td style="white-space: nowrap">
                                        <asp:LinkButton ID="btnChangePW" runat="server" meta:resourcekey="btnChangePWResource2" Text="1.設定系統管理員密碼"></asp:LinkButton></td>
                                    <td rowspan="3" style="width: 20px">
                                    <td rowspan="3" style="vertical-align: top">
                                        <table>
                                            <tr>
                                                <td>
                                                    <asp:Label ID="Label6" runat="server" Text="如須手動維護基礎資料可於重登錄系統後至系統管理選單中設定" meta:resourcekey="Label6Resource1"></asp:Label></td>
                                            </tr>
                                            <tr>
                                                <td style="white-space: nowrap">
                                                    <telerik:RadButton ID="RadButton1" runat="server"
                                                        meta:resourcekey="WebImageButton6Resource1" OnClick="RadButton1_Click">
                                                    </telerik:RadButton>
                                                </td>
                                            </tr>
                                        </table>

                                    </td>
                                </tr>
                                <tr>
                                    <td style="white-space: nowrap">
                                        <asp:LinkButton ID="btnManageEmployee" runat="server" meta:resourcekey="btnManageEmployeeResource2" Text="2.匯入人員組織資料"></asp:LinkButton></td>

                                </tr>
                                <tr>
                                    <td style="white-space: nowrap">
                                        <font color="red">*</font>
                                        <asp:LinkButton ID="btnSetConfig" runat="server" meta:resourcekey="btnSetConfigResource1" OnClick="btnSetConfig_Click" Text="3.設定系統組態"></asp:LinkButton>
                                        <br />
                                        <br />

                                        <asp:CustomValidator ID="CustomValidator1" runat="server" Display="Dynamic" ErrorMessage="請完成系統組態的設定"
                                            meta:resourcekey="CustomValidator1Resource1" OnServerValidate="CustomValidator1_ServerValidate">
                                        </asp:CustomValidator><br />
                                        <br />
                                    </td>

                                </tr>


                            </table>
                        </div>
                    </fieldset>
                </td>
            </tr>
            <tr>
                <td>
                    <table width="100%" border="0" cellpadding="0" cellspacing="0" background="<%=themePath %>/images/down_bg.gif">
                        <tr style="vertical-align: bottom">
                            <td width="5%">&nbsp;</td>
                            <td width="10%" background="<%=themePath %>/images/down_bg.gif" bgcolor="#7e7f83">
                                <img src="<%=themePath %>/images/down_fast.gif"></td>
                            <td class="grayB">
                                <asp:Label
                                    ID="Label4" runat="server" Text="© {0} e-Excellence Inc. All Rights Reserved. " meta:resourcekey="Label4Resource1"></asp:Label></td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
        <asp:Label ID="lbExit" runat="server" Visible="False" Text="完成設定" meta:resourcekey="lbExitResource1"></asp:Label>
    </form>
</body>
</html>
