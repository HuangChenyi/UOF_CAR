<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PrintMessage.aspx.cs" Inherits="Ede.Uof.Web.Basic.Personal.PrivateMessage.PrintMessage" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register Src="~/Common/FileCenter/V3/UC_FileCenter.ascx" TagPrefix="uc1" TagName="UC_FileCenter" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />
    <meta name="referrer" content="no-referrer" />
    <title></title>
    <link href="../../../Common/Style/telerik.css" rel="stylesheet" />
    <link href="../../../Common/Style/uof-fixed.css" rel="stylesheet" />
    <link href="../../../Common/Style/cssReset.css" rel="stylesheet" />
</head>
<body style="background-color:#FFFFFF;">
    <form id="form1" runat="server" >
        <telerik:RadScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="True" AsyncPostBackTimeout="36000">
            <Scripts>
	            <asp:ScriptReference Assembly="Telerik.Web.UI" Name="Telerik.Web.UI.Common.Core.js" />
                <asp:ScriptReference Assembly="Telerik.Web.UI" Name="Telerik.Web.UI.Common.jQuery.js" />
                <asp:ScriptReference Assembly="Telerik.Web.UI" Name="Telerik.Web.UI.Common.jQueryInclude.js" />
                <asp:ScriptReference Path="~/Common/javascript/json2.min.js" ScriptMode="Release" />
                <asp:ScriptReference Path="~/Common/javascript/jQuery/plugin/jquery-ui.min.js" ScriptMode="Release" />
                <asp:ScriptReference Path="~/Common/javascript/jQuery/plugin/jquery.blockUI.js" ScriptMode="Release" />
                <asp:ScriptReference Path="~/Common/javascript/jQuery/plugin/ticker.js?v=11.40" ScriptMode="Release" />
                <asp:ScriptReference Path="~/Common/javascript/uofScript.js" ScriptMode="Release" />
                <asp:ScriptReference Path="~/Common/javascript/jQuery/plugin/jquery.cookie.js" ScriptMode="Release" />                
                <asp:ScriptReference Path="~/Common/javascript/jQuery/plugin/jquery.validate.min.js" ScriptMode="Release" />
            </Scripts>
        </telerik:RadScriptManager>

        <script type="text/javascript">
            window.onload = function () {                
                setTimeout(function () { window.print(); window.close(); }, 500);
            }            
        </script>

        <style type="text/css">
          #printtable {
                font-size: <%=hfFontsize.Value%>;
           } 
          td.JustAddBorder table tr td {
           border-width:1px;
           border-style:solid;
          }
        </style>

        <div>
            <table id="printtable" class="PopTable" style="width: 100%;word-break:break-all;">
                <tr>
                    <td style="width: 8%; white-space: nowrap;">
                        <asp:Label ID="lbLeftTopic" runat="server" Text="主旨" meta:resourcekey="lbLeftTopicResource1"></asp:Label></td>
                    <td style="width: 92%; word-wrap: break-word;">
                        <asp:Panel ID="Panel2" runat="server" meta:resourcekey="Panel2Resource1">
                            <asp:Label ID="lbTopic" runat="server" meta:resourcekey="lbTopicResource1"></asp:Label>
                        </asp:Panel>
                    </td>
                </tr>
                <tr>
                    <td style="width: 8%; white-space: nowrap;">
                        <asp:Label ID="lbLeftReader" runat="server" Text="收件人" meta:resourcekey="lbLeftReaderResource1"></asp:Label></td>
                    <td style="width: 92%">&nbsp;<asp:Label ID="lbReader" runat="server" meta:resourcekey="lbReaderResource1"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td style="width: 8%; white-space: nowrap;">
                        <asp:Label ID="lbLeftSender" runat="server" Text="寄件人" meta:resourcekey="lbLeftSenderResource1"></asp:Label></td>
                    <td style="width: 92%">&nbsp;<asp:Label ID="lbSender" runat="server" meta:resourcekey="lbSenderResource1"></asp:Label></td>
                </tr>
                <tr>
                    <td style="width: 8%; white-space: nowrap;">
                        <asp:Label ID="lbLeftCreateTime" runat="server" Text="寄件時間" meta:resourcekey="lbLeftCreateTimeResource1"></asp:Label></td>
                    <td style="width: 92%">&nbsp;<asp:Label ID="lbCreateTime" runat="server" meta:resourcekey="lbCreateTimeResource1"></asp:Label></td>
                </tr>
                <tr>
                    <td style="width: 8%; white-space: nowrap;">
                        <asp:Label ID="lbLeftReadedTime" runat="server" Text="閱讀時間" meta:resourcekey="lbLeftReadedTimeResource1"></asp:Label></td>
                    <td style="width: 92%">&nbsp;<asp:Label ID="lbReadedTime" runat="server" meta:resourcekey="lbReadedTimeResource1"></asp:Label></td>
                </tr>
                <tr>
                    <td style="width: 8%; white-space: nowrap;">
                        <asp:Label ID="lbLeftReplyTime" runat="server" Text="回覆時間" meta:resourcekey="lbLeftReplyTimeResource1"></asp:Label></td>
                    <td style="width: 92%">&nbsp;<asp:Label ID="lbReplyTime" runat="server" meta:resourcekey="lbReplyTimeResource1"></asp:Label></td>
                </tr>
                <tr>
                    <td style="width: 8%; white-space: nowrap;">
                        <asp:Label ID="lbLeftContent" runat="server" Text="訊息內容" meta:resourcekey="lbLeftContentResource1"></asp:Label></td>
                    <td style="line-height: normal; width: 92%; height: 260px;" class="editorcontentstyle JustAddBorder">
                        <asp:Literal ID="ltContext" runat="server" meta:resourcekey="ltContextResource1"></asp:Literal></td>
                </tr>
                <tr>
                    <td style="width: 8%; white-space: nowrap;">
                        <asp:Label ID="lbFile" runat="server" Text="附件" meta:resourcekey="lbFileResource1"></asp:Label></td>
                    <td style="width: 92%">
                        <uc1:uc_filecenter runat="server" id="UC_FileCenter" />
                    </td>
                </tr>
            </table>
        </div>

        <asp:Label ID="lbMsgId" runat="server" Visible="False" meta:resourcekey="lbMsgIdResource1"></asp:Label>
        <asp:Label ID="lblTotalAmount" runat="server" Text="...共{0}人" Visible="false" meta:resourcekey="lblTotalAmountResource1"></asp:Label>
        <asp:Label ID="lbIsReceive" runat="server" Visible="False" meta:resourcekey="lbIsReceiveResource1"></asp:Label>
        <asp:HiddenField ID="hfFontsize" runat="server" />
    </form>
</body>
</html>
