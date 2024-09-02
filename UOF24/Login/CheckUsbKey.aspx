<%@ Page Language="C#" AutoEventWireup="true" Inherits="Login_CheckUsbKey" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" Codebehind="CheckUsbKey.aspx.cs" %>


<html>
<head runat="server">
        <meta name="referrer" content="no-referrer" />
    <title></title>
    <script type="text/javascript">
            $telerik = {};
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0" class="tbbg01">
            <tr>
                <td valign="top">&nbsp;    
            <object id="UMHControl1" style="left: 0px; top: 0px" height="0" width="0" classid="clsid:C4B873F4-099F-4DD7-88D2-2EF97EFE03E8">
                <param name="_Version" value="65536">
                <param name="_ExtentX" value="2646">
                <param name="_ExtentY" value="1323">
                <param name="_StockProps" value="0">
            </object>
                    <asp:HiddenField ID="hidePW" runat="server" Value="0" />
                    <asp:HiddenField ID="hideCas" runat="server" Value="0" />
                    <asp:HiddenField ID="hideSerialNo" runat="server" Value="" />
                    <asp:HiddenField ID="hideErrorCode" runat="server" Value="" />
                    <center>
                    <table border="0" cellpadding="0" cellspacing="0" width="50%" align="center">
                        <tr>
                            <td style="height: 23px" width="15">
                                <img src="<%=themePath %>/images/tab21.gif" width="15" /></td>
                            <td background="<%=themePath %>/images/tab22.gif" class="e" style="height: 23px"
                                valign="baseline">
                                <asp:Label ID="Label1" runat="server" Text="Usb Key  驗證"
                                    meta:resourcekey="Label1Resource1"></asp:Label></td>
                            <td style="height: 23px" width="15">
                                <img height="23" src="<%=themePath %>/images/tab23.gif" width="15" /></td>
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
                                <%-- <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>--%>
                                <asp:Image ID="imgLoading" runat="server"
                                    ImageUrl="~/Common/Images/loading.gif"
                                    meta:resourcekey="imgLoadingResource1" />
                                &nbsp;<asp:Label ID="lbReading" runat="server"
                                    meta:resourcekey="lbMachineCodeResource1" Text="讀取中..."></asp:Label>
                                <br />
                                <asp:CustomValidator ID="cvBrowser" runat="server"
                                    ErrorMessage="此功能不支援目前瀏覽器，請使用IE登入" Display="Dynamic" OnServerValidate="cvBrowser_ServerValidate" meta:resourcekey="cvBrowserResource1"></asp:CustomValidator>
                                <asp:CustomValidator ID="cvUSBKey" runat="server"
                                    ErrorMessage="無法取得USB Key序號,請確認USB Key已正確插入或者驅動程式已經安裝"
                                    OnServerValidate="cvUSBKey_ServerValidate" Display="Dynamic"
                                    meta:resourcekey="cvUSBKeyResource1"></asp:CustomValidator>
                                <br />
                                <asp:LinkButton ID="LinkButton1" runat="server"
                                    OnClick="LinkButton1_Click" OnClientClick="ReRead()"
                                    meta:resourcekey="LinkButton1Resource1" Text="請插入USB Key後,按這裡重新讀取"></asp:LinkButton>
                                <br />
                                <span style="background-color: White">
                                    <asp:LinkButton ID="installDriverLink" runat="server"
                                        meta:resourcekey="installDriverLinkResource1" Text="或者按這裡下載USB Key驅動程式"></asp:LinkButton>
                                    &nbsp;
                                </span>
                                <%--   </ContentTemplate>
                </asp:UpdatePanel>--%>
                                <br />
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
                    </center>
                </td>
            </tr>
        </table>
        <script id="ReadMicroDog" type="text/javascript">
<!--
        function DogCheck() {
            var myUMHCtr = $('#UMHControl1').get(0);
            var errCode;
            myUMHCtr.cas = $uof.tool.htmlDecode('<%=System.Web.Security.AntiXss.AntiXssEncoder.HtmlEncode(hideCas.Value,true)%>'); 
            myUMHCtr.command = 1;
            errCode = myUMHCtr.OperateDog();
            return errCode;
        }

        function GetCurrentNo() {
            var myUMHCtr = $('#UMHControl1').get(0);
            var errCode;
            myUMHCtr.cas = $uof.tool.htmlDecode('<%=System.Web.Security.AntiXss.AntiXssEncoder.HtmlEncode(hideCas.Value,true)%>'); 
            myUMHCtr.command = 5;
            myUMHCtr.password = $uof.tool.htmlDecode('<%=System.Web.Security.AntiXss.AntiXssEncoder.HtmlEncode(hidePW.Value,true)%>'); 
            errCode = myUMHCtr.OperateDog();
            if (errCode == 0) {
                $('#<%=hideErrorCode.ClientID %>').val(errCode);
                $('#<%=hideSerialNo.ClientID %>').val(myUMHCtr.result);
                return myUMHCtr.result;
            }
            else {
                $('#<%=hideErrorCode.ClientID %>').val(errCode);
                $('#<%=hideSerialNo.ClientID %>').val("");
                return "";
            }
        }

        function StartReadUSBKey() {
            if (DogCheck() == 0) {
                GetCurrentNo();
            }

        }
// -->
        </script>
        <script type="text/javascript">

            if (window.addEventListener) {
                window.addEventListener("load", verify,false);
            } else if (window.attachEvent) {
                window.attachEvent("onload", verify);
            }

        function verify() {
            try {
                StartReadUSBKey();
            }
            catch (e) {

            }
            var LinkButton = $("#<%=LinkButton1.ClientID %>").get(0);
            if ("<%=autoPortback.ToString()%>" == "True") {
                LinkButton.click(); 
            }
        }

        function ReRead() {
            try {
                StartReadUSBKey();
            }
            catch (e) {

            }
        }
        </script>
    </form>
</body>
</html>
