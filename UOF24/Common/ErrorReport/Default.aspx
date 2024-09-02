<%@ Page Language="C#" AutoEventWireup="true" Inherits="Common_ErrorReport_Default" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" CodeBehind="Default.aspx.cs" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Error Report</title>
    <link href="../../App_Themes/DefaultTheme/StyleSheet.css" type="text/css" rel="stylesheet" />
    <style>
        pre {
            white-space: pre-wrap; /* css-3 */
            white-space: -moz-pre-wrap; /* Mozilla, since 1999 */
            white-space: -pre-wrap; /* Opera 4-6 */
            white-space: -o-pre-wrap; /* Opera 7 */
            word-wrap: break-word; /* Internet Explorer 5.5+ */
        }

        .img-vertical {
            vertical-align: middle;
            margin-top: 20px;
            margin-bottom: 20px;
        }
    </style>
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
        <div style="width: 100%; text-align: center; margin-bottom: 20px; display:none" id="simpleImg">
            <asp:Image ID="Image1" ImageUrl="~/Common/Images/UImages/notplay.png" runat="server" CssClass="img-vertical" />
            <br />
            <asp:Label ID="lblErr" runat="server" ForeColor="Red" meta:resourcekey="lblErrResource1" Text="好像有地方出了點狀況，請通知系統管理員"></asp:Label>

        </div>
        <table style="width: 60%;margin: 0 auto">
            <tr>
                <td>

                    <table class="PopTable" id="detailTable" style="display:none" >
                        <tr>
                            <td colspan="2" style="text-align: left; width: 1024px;">
                                <asp:Label ID="Desc" runat="server" ForeColor="Red" meta:resourcekey="DescResource1" Text="發生尚未處理的錯誤"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td style="white-space: nowrap">
                                <asp:Label ID="Label1" runat="server" Text="錯誤內容" meta:resourcekey="Label1Resource1"></asp:Label></td>
                            <td style="width: 800px">
                                <pre contenteditable="true" style="width: 800px; left: 0;"><asp:Literal ID="ltErrorMessage" runat="server"></asp:Literal></pre>
                                <asp:Literal ID="ltVerson" runat="server"></asp:Literal>

                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td>
                    <table class="PopTable" id="simpleTable" style="display:none">
                        <tr>
                            <td style="width: 115px; min-width: 115px;">
                                <asp:Label ID="Label4" runat="server" Text="時間" meta:resourcekey="Label4Resource1"></asp:Label>
                            </td>
                            <td>
                                <asp:Label ID="lblTime" runat="server" Text=""></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="Label6" runat="server" Text="UOF版本" meta:resourcekey="Label6Resource1"></asp:Label>
                            </td>
                            <td>
                                <asp:Label ID="lblVersion" runat="server" Text=""></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="Label2" runat="server" Text="位置" meta:resourcekey="Label3Resource1"></asp:Label>
                            </td>
                            <td>
                                <asp:Label ID="lblLocation" runat="server" Text=""></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lbleventIDFeild" runat="server" Text="eventID" meta:resourcekey="lbleventIDFeildResource1"></asp:Label>
                            </td>
                            <td>
                                <asp:Label ID="lbleventID" runat="server" Text=""></asp:Label>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>


            <tr>
                <td>
                    <table class="PopTable" style="border-top: 0;">
                        <tr>
                            <td style="border-top: 0; width: 115px; min-width: 115px;">
                                <span style="color: #ff0000">*</span><asp:Label ID="Label3" runat="server" Text="請詳細說明您做了那些操作而遇到此錯誤" meta:resourcekey="Label2Resource1"></asp:Label></td>
                            <td style="word-wrap: break-word; width: 800px; left: 0; border-top: 0">
                                <asp:TextBox ID="TextBoxDesc" runat="server" Columns="80" Rows="10" TextMode="MultiLine" meta:resourcekey="TextBoxDescResource1"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBoxDesc"
                                    Display="Dynamic" ErrorMessage="請輸入說明" ForeColor="Red" meta:resourcekey="RequiredFieldValidator1Resource1"></asp:RequiredFieldValidator></td>
                        </tr>
                        <tr>
                            <td></td>
                            <td>
                                <asp:Button ID="Button1" runat="server" Text="將錯誤回報給系統管理員" OnClick="Button1_Click" meta:resourcekey="Button1Resource1" /><br />
                                <asp:CustomValidator ID="cvFail" ForeColor="Red" runat="server" Display="Dynamic" ErrorMessage="很抱歉回報失敗,無法自動將內容傳送給系統管理員,請您將錯誤訊息複製到電子郵件中傳送給系統管理員" meta:resourcekey="cvFailResource1"></asp:CustomValidator>
                                <asp:CustomValidator ID="cvSuccess" ForeColor="Red" runat="server" Display="Dynamic" ErrorMessage="回報完成,感謝您的協助,請關閉視窗或回到上一頁繼續完成您的工作" meta:resourcekey="cvSuccessResource1"></asp:CustomValidator></td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr id="mnextReturn" style="display:none">
                <td style="padding:10px; text-align:center"> 
                    <%--<asp:Button ID="Button2" runat="server" Text="關閉視窗" OnClientClick="clickButton(); return false;" Enabled="false" CausesValidation="false"  meta:resourcekey="Button2Resource1"  />--%>
                    <button id="Button2" type="button" onclick="closePage()" disabled formnovalidate>
                        <asp:Label ID="Label5" runat="server" Text="關閉視窗" meta:resourcekey="Label5Resource1"></asp:Label>
                    </button>
                </td>
            </tr>
        </table>
        <asp:HiddenField ID="hfDisplayErrorMsg" runat="server" />        
    </form>
    <script type="text/javascript">
        Sys.Application.add_load(function () {
            var isDisplay = $("#<%=hfDisplayErrorMsg.ClientID %>").val();
            if (isDisplay === "true") {
                $("#detailTable").show();
                $("#simpleTable").hide();
                $("#simpleImg").hide();
                
            }
            else {
                $("#detailTable").hide();
                $("#simpleTable").show();
                $("#simpleImg").show();
            }
        });
        function closePage(){
            setInterval(function () {
                window.location.href = '#InAppBrowserClosed';
            }, 300);
        }

        function clickButton() {
            $("#closeWindow").click();
        }
    </script>
</body>
</html>
