<%@ Page Language="C#" AutoEventWireup="true" Inherits="Login_ApplyClientCertificate" Codebehind="ApplyClientCertificate.aspx.cs" %>

<html>
<head id="Head1" runat="server">
    <meta name="referrer" content="no-referrer" />
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
   
 <table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0" class="tbbg01">
            <tr >
                <td valign="top">
                    &nbsp;    
            <object id="UMHControl1" style="left: 0px; top: 0px" height="0" width="0" classid="clsid:C4B873F4-099F-4DD7-88D2-2EF97EFE03E8">
            <param name="_Version" value="65536">
            <param name="_ExtentX" value="2646">
            <param name="_ExtentY" value="1323">
            <param name="_StockProps" value="0">
        </object>
        <asp:HiddenField  ID="hidePW" Value="0" runat="server" />
        <asp:HiddenField  ID="hideCas" Value="0" runat="server" />
        <asp:HiddenField  ID="hideSerialNo" Value="" runat="server" />
        <asp:HiddenField  ID="hideErrorCode" Value="" runat="server" />
        <table border="0" cellpadding="0" cellspacing="0" width="400px" align="center">
        <tr>
            <td style="height: 23px" width="15">
                <img src="<%=themePath %>/images/tab21.gif" width="15" /></td>
            <td background="<%=themePath %>/images/tab22.gif" class="e" style="height: 23px"
                valign="baseline">
                <asp:Label ID="Label1" runat="server" Text="申請與安裝用戶端憑證"></asp:Label></td>
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
            <td bgcolor="#ffffff" align="center">
            <br />
                <table style="width: 100%;">
                    <tr>
                        <td align="right">
                            <asp:Label ID="Label2" runat="server" Text="帳號:"></asp:Label>
                        </td>
                        <td align="left">
                            <asp:Label ID="lblAccount" runat="server" Text=""></asp:Label>
                        </td>
                        <td align="right">
                            <asp:Label ID="Label4" runat="server" Text="姓名:"></asp:Label>
                        </td>
                        <td align="left">
                            <asp:Label ID="lblUserName" runat="server" Text=""></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="Label5" runat="server" Text=""></asp:Label>
                        </td>
                        <td align="right">
                            <asp:Button ID="btnApplyCA" runat="server" Text="申請" Width="100px" onclick="btnApplyCA_Click"/>
                        </td>
                    </tr>
                    </table>
                <asp:Label ID="Label6" runat="server" Text="申請安裝完憑證後請重新啟動瀏覽器後再重新登入" ForeColor="Blue"></asp:Label>
            <br /><br />
            </td>
            <td background="<%=themePath %>/images/tab28.gif" valign="top">
                <img height="1" src="<%=themePath %>/images/tab28.gif" width="15" /></td>
        </tr>
        <tr>
            <td>
                <img height="18" src="<%=themePath %>/images/tab29.gif" width="15" /></td>
            <td background="<%=themePath %>/images/tab30.gif">
                &nbsp;</td>
            <td>
                <img height="18" src="<%=themePath %>/images/tab31.gif" width="15" /></td>
        </tr>
    </table>
    </td>
    </tr>
    
    </table>
<script>
</script>
</form>
</body>
</html>