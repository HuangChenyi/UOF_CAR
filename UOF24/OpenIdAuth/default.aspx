<%@ Page Language="C#" %>
<%@ Import Namespace="System.Security.Claims" %>
<%@ Import Namespace="Microsoft.Owin.Security" %>
<%@ Import Namespace="Microsoft.Owin.Security.Cookies" %>
<%@ Import Namespace="Microsoft.Owin.Security.OpenIdConnect" %>

<script runat="server">

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.IsAuthenticated)
        {
			var doLogout = Request.QueryString["doLogout"];
			if (doLogout == "doLogout") {
				//登出後直接用uof account登入uof, 再按登出不須到此頁
				HttpCookie openidCookie = new HttpCookie("UOFOpenIdAccount");
				openidCookie.Expires = DateTime.Now.AddDays(-1);
				Response.Cookies.Add(openidCookie);

				HttpContext.Current.GetOwinContext().Authentication.SignOut(
					OpenIdConnectAuthenticationDefaults.AuthenticationType,
					CookieAuthenticationDefaults.AuthenticationType);
			}
			else {
				var isMNext = Request.QueryString["isMNext"];
				var claimsIdentity = HttpContext.Current.User.Identity as ClaimsIdentity;
				if (isMNext != "Y")
				{
					if (claimsIdentity != null && claimsIdentity.IsAuthenticated)
					{
						Response.Cookies.Add(new HttpCookie("UOFOpenIdAccount", claimsIdentity.Name));
					
						Response.Redirect(@"../Login/CheckOpenIdAccount.aspx");
					}
					else {
						Response.Redirect(@"../Login.aspx?state=OpenIdFail");
					}
				}
				else
				{
					if (claimsIdentity != null && claimsIdentity.IsAuthenticated)
					{
						Response.Cookies.Add(new HttpCookie("UOFOpenIdAccount", claimsIdentity.Name));
					
						Response.Redirect(@"../Login/CheckOpenIdAccount.aspx?isMNext=Y");
					}
					else {
						Response.Redirect(@"../Login.aspx?state=OpenIdFail");
					}
				}
			}
        }
        else
        {
			var doLogout = Request.QueryString["doLogout"];
			var isMNext = Request.QueryString["isMNext"];
			if(doLogout=="doLogout" && isMNext=="Y")
				Response.Redirect(@"#InAppBrowserClosed");

			var properties = new AuthenticationProperties
			{
				AllowRefresh = true,
				ExpiresUtc = DateTime.UtcNow.AddDays(1)
			};

			HttpContext.Current.GetOwinContext()
				.Authentication.Challenge(properties,OpenIdConnectAuthenticationDefaults.AuthenticationType);
        }
    }

	protected void Page_Error(object sender, EventArgs e)
    {
		Response.Redirect(@"../Login.aspx?state=OpenIdFail");
		Server.ClearError();
    }

</script>
<html>
<head>
    <meta name="referrer" content="no-referrer" />
    <title></title>
    <script type="text/javascript">
        window.location.href = '../login.aspx?state=SSOFail';
    </script>
</head>
<body></body>
</html>