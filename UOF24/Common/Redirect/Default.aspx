<%@ Page Language="C#" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" %>

<%@ Import Namespace="Ede.Uof.EIP.SystemInfo" %>
<%@ Import Namespace="Ede.Uof.EIP.PrivateMessage.Exceptions" %>
<%@ Import Namespace="Ede.Uof.EIP.PrivateMessage" %>
<%@ Import Namespace="Ede.Uof.EIP.Mobile" %>
<%@ Import Namespace="Ede.Uof.Utility.Page" %>
<%@ Import Namespace="Newtonsoft.Json" %>
<%@ Import Namespace= "Ede.Uof.Utility.Log" %>

<script runat="server">

    protected string themePath;
    private UofCookieForPage _uofCookie;

    protected void Page_Load(object sender, EventArgs e)
    {
        string tempUrl = Request.QueryString["r"];

        hidGooglePlayUrl.Value = AppSettingHelper.GetValue("GooglePlayUrl");
        hidAppleStoreUrl.Value = AppSettingHelper.GetValue("AppleStoreUrl");
        if (string.IsNullOrEmpty(tempUrl))
        {
            Response.Redirect(Request.ApplicationPath);
        }
        else
        {
            try
            {
                var appName = Ede.Uof.EIP.Mobile.AppSettingHelper.GetValue("AppName");
                lblMobileLinkError2.Text = string.Format(lblMobileLinkError2.Text, appName);
                lblMobileLinkError2EN.Text = string.Format(lblMobileLinkError2EN.Text, appName);

                var appSchema = Ede.Uof.EIP.Mobile.AppSettingHelper.GetValue("AppSchema");
                var schema = string.IsNullOrEmpty(appSchema) ? "uofnext://" : string.Format("{0}://", appSchema);
                string path = MessageLinkHelper.GetRealUrl(tempUrl);

                if (fromWeb() && path.StartsWith(schema))
                {
                    lblMobileLinkError1.Visible = true;
                    lblMobileLinkError2.Visible = true;
                    lblMobileLinkError1EN.Visible = true;
                    lblMobileLinkError2EN.Visible = true;
                    imgGoogle.Visible = true;
                    imgApple.Visible = true;
                }
                else
                {
                    lblMobileLinkError1.Visible = false;
                    lblMobileLinkError2.Visible = false;
                    lblMobileLinkError1EN.Visible = false;
                    lblMobileLinkError2EN.Visible = false;
                    imgGoogle.Visible = false;
                    imgApple.Visible = false;


                    var schemeMapping = Ede.Uof.EIP.Mobile.AppSettingHelper.GetInnerText("appSchemeMapping");
                    if (!string.IsNullOrEmpty(schemeMapping))
                    {
                        string schemeCode = "#*#";
                        var indScheme = path.IndexOf("appScheme");
                        if (indScheme != -1)
                        {
                            schemeCode = path.Substring(indScheme + 10, 1);
                        }

                        var jsonObj = JsonConvert.DeserializeObject<SortedList<string, string>>(schemeMapping);
                        if (jsonObj.ContainsKey(schemeCode))
                        {
                            var realScheme = jsonObj[schemeCode];
                            if (!string.IsNullOrEmpty(appSchema))
                                path = path.Replace(appSchema, realScheme);
                            else
                                path = path.Replace("uofnext", realScheme);
                        }
                    }

                    Response.Redirect(path);
                }
            }
            catch (UrlExpiredExpection)
            {
                cvUrl.ErrorMessage = lbLinkEXpired.Text;
                cvUrl.IsValid = false;
            }
            catch (FormatException)
            {
                cvUrl.ErrorMessage = lbLinkError.Text;
                cvUrl.IsValid = false;
            }
        }

        themePath = Request.ApplicationPath + "/App_Themes/" + Page.Theme;
    }

    protected void Page_PreInit(object sender, EventArgs e)
    {
        _uofCookie = new UofCookieForPage(Page);
        string theme = _uofCookie.Get("UserTheme");

        if (!string.IsNullOrEmpty(theme))
        {
            Page.Theme = theme;
        }
        else
        {
            Page.Theme = Current.Theme;
        }
    }

    private bool fromWeb()
    {
        bool isfromWeb = true;
        string userAgentStr = Page.Request.UserAgent;

        if ((userAgentStr.ToLower().IndexOf("iphone") != -1) ||
            (userAgentStr.ToLower().IndexOf("ipod") != -1) ||
            (userAgentStr.ToLower().IndexOf("ipad") != -1) ||
            (userAgentStr.IndexOf("Android") != -1)||
            (userAgentStr.IndexOf("BlackBerry") != -1) ||
            (userAgentStr.IndexOf("Opera Mini") != -1) ||
            (userAgentStr.IndexOf("IEMobile") != -1))
        {
            isfromWeb = false;
        }
        return isfromWeb;
    }
</script>

<html>
<head id="Head1" runat="server" />
    <style type="text/css">
        .content-table td {
            text-align: center;
        }
    </style>
<body>
    <form id="form1" runat="server" >
        <script type="text/javascript">
        function linkGooglePlay() {
            var googlePlayUrl = '<%=hidGooglePlayUrl.Value%>';
            window.open(googlePlayUrl, '_blank');
        }

        function linkAppStore() {
            var AppleStoreUrl = '<%=hidAppleStoreUrl.Value%>';
            window.open(AppleStoreUrl, '_blank');
        }
        </script>
                    <table style="width: 50%;margin:0 auto;" border="0" class="tbbg01">
                        <tr>
                            <td style="height: 23px" width="15">
                                <img src="<%=themePath %>/images/tab21.gif" width="15" /></td>
                            <td background="<%=themePath %>/images/tab22.gif" class="e" style="height: 23px"
                                valign="baseline">
                                <asp:Label ID="Label1" runat="server" Text="快速連結(Shortcut)"
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
                            <td align="center" bgcolor="#ffffff" style="white-space: nowrap;">
                                <br />
                                <asp:CustomValidator ID="cvUrl" runat="server" Display="Dynamic"
                                    meta:resourcekey="cvUrlResource1"></asp:CustomValidator>
                                <asp:Label ID="lblMobileLinkError1" runat="server" Text="感謝您對本產品的愛護與支持，您目前點選的是行動版連結。" Visible="False" meta:resourcekey="lblMobileLinkError1Resource1"></asp:Label>
                                <br />
                                <asp:Label ID="lblMobileLinkError2" runat="server" Text="請先至App Store或Google Play安裝「{0}」，以取得更好的使用體驗。" Visible="False" meta:resourcekey="lblMobileLinkError2Resource1"></asp:Label>
                                <br /><br />
                                <asp:Label ID="lblMobileLinkError1EN" runat="server" Text="Thanks for your support. You are currently using the mobile link." Visible="False" ></asp:Label>
                                <br />
                                <asp:Label ID="lblMobileLinkError2EN" runat="server" Text="For better user experience, please download and install '{0}' on App Store or Google Play." Visible="False" ></asp:Label>
                                <br /><br />
                                <asp:ImageButton ID="imgGoogle" runat="server" Visible="false" ImageUrl="~/Common/Images/googlePlay.png" OnClientClick="linkGooglePlay()" />
                                <asp:ImageButton ID="imgApple" runat="server" Visible="false" ImageUrl="~/Common/Images/AppStore.png" OnClientClick="linkAppStore()" />
                                <br />
                                <br />
                                <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~" Target="_top"
                                    meta:resourcekey="HyperLink1Resource1">按這裡回到首頁(Return to homepage)</asp:HyperLink>
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
    <asp:Label ID="lbLinkEXpired" runat="server" Visible="False" Text="連結已過期無法使用(URL is expired)" 
        meta:resourcekey="lbLinkEXpiredResource1"></asp:Label>
    <asp:Label ID="lbLinkError" runat="server" Visible="False" Text="連結內容錯誤無法使用(Content error)" 
        meta:resourcekey="lbLinkErrorResource1"></asp:Label>
        <asp:HiddenField ID="hidGooglePlayUrl" runat="server" />
        <asp:HiddenField ID="hidAppleStoreUrl" runat="server" />
    </form>
</body>
</html>