<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewFormFlowForVeryDoc.aspx.cs" Inherits="Ede.Uof.Web.WKF.Browse.ViewFormFlowForVeryDoc" Theme="DefaultTheme" meta:resourcekey="PageResource1" %>


<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register Src="~/WKF/FlowManagement/Layout/UC_SetMastFlow.ascx" TagPrefix="uc1" TagName="UC_SetMastFlow" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="referrer" content="no-referrer" />
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <style>
            .SubFlowTD {
                vertical-align: top;
                background-attachment: fixed;
                background-image: url("<%=themePath %>/images/wkf/line1.gif");
                background-repeat: repeat-y;
            }

            .EmptyTable {
                padding: 0px;
                border: 0px;
                margin: 0px;
                text-align: center;
            }

            .SignerTD {
                color: blue;
                text-align: left;
            }

            .SiteLeftTD {
                background-image: url("<%=themePath %>/images/wkf/site_left.gif");
                background-repeat: repeat-y;
            }

            .SiteMiddleTD {
                background-image: url("<%=themePath %>/images/wkf/app_con.gif");
                background-repeat: repeat-y;
            }

            .SiteRightTD {
                width: 8px;
                background-image: url("<%=themePath %>/images/wkf/site_right.gif");
                background-repeat: repeat-y;
            }

            .CondTextTD {
                text-align: center;
                font-weight: bold;
            }

            .CondLeftTD {
                width: 10px;
                background-image: url("<%=themePath %>/images/wkf/site_left_big.gif");
                background-repeat: repeat-y;
            }

            .CondMiddleTD {
                background-image: url("<%=themePath %>/images/wkf/cond_con.gif");
                background-repeat: repeat-y;
                text-align: center;
            }

            .CondRightTD {
                width: 10px;
                background-image: url("<%=themePath %>/images/wkf/site_rig_big.gif");
                background-repeat: repeat-y;
            }

            td_ {
                text-align: center;
                vertical-align: top;
                width: 120;
            }

            table_ {
                text-align: center;
                border: 0px;
            }
        </style>

        <script type="text/javascript">
            
        </script>
        <telerik:RadScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="True" AsyncPostBackTimeout="36000">
            <Scripts>
                <asp:ScriptReference Assembly="Telerik.Web.UI" Name="Telerik.Web.UI.Common.Core.js" />
                <asp:ScriptReference Assembly="Telerik.Web.UI" Name="Telerik.Web.UI.Common.jQuery.js" />
                <asp:ScriptReference Assembly="Telerik.Web.UI" Name="Telerik.Web.UI.Common.jQueryInclude.js" />
                <asp:ScriptReference Path="~/Common/javascript/json2.min.js" ScriptMode="Release" />
                <asp:ScriptReference Path="~/Common/javascript/jQuery/plugin/jquery-ui.min.js" ScriptMode="Release" />
                <asp:ScriptReference Path="~/Common/javascript/jQuery/plugin/jquery.blockUI.js" ScriptMode="Release" />
                <asp:ScriptReference Path="~/Common/javascript/jQuery/plugin/ticker.js" ScriptMode="Release" />
                <asp:ScriptReference Path="~/Common/javascript/jQuery/plugin/jquery.cookie.js" ScriptMode="Release" />
            </Scripts>
        </telerik:RadScriptManager>
        <table style="width: 800px;" >
            <tr>
                <td style="width: 30%">
                    <asp:Label ID="Label1" runat="server" Text="表單名稱：" meta:resourcekey="Label1Resource1"></asp:Label>
                    <asp:Label ID="lblFormName" runat="server" meta:resourcekey="lblFormNameResource1"></asp:Label></td>
                <td style="width: 10%"></td>
                <td style="text-align: right; width: 20%">&nbsp;</td>
                <td style="width: 100%">
                    <asp:Label ID="Label7" runat="server" Text="列印者：" meta:resourcekey="Label7Resource1"></asp:Label>
                    <asp:Label ID="lblPrinter" runat="server"
                        meta:resourcekey="lblPrinterResource1"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label2" runat="server" Text="表單版本：" meta:resourcekey="Label2Resource1"></asp:Label>
                    <asp:Label ID="lblFormVersion" runat="server"
                        meta:resourcekey="lblFormVersionResource1"></asp:Label></td>
                <td></td>
                <td style="text-align: right">&nbsp;</td>
                <td>
                    <asp:Label ID="Label5" runat="server" Text="列印時間：" meta:resourcekey="Label5Resource2"></asp:Label>
                    <asp:Label ID="lblPrintTime" runat="server" meta:resourcekey="lblPrintTimeResource1"></asp:Label>
                </td>
            </tr>
            <tr>
                <td style="height: 21px">&nbsp;</td>
                <td></td>
                <td style="text-align: right">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
        </table>
        <uc1:UC_SetMastFlow runat="server" ID="UC_SetMastFlow" />
    </form>
</body>
</html>
