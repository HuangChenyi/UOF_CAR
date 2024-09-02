<%@ Import Namespace="Ede.Uof.EIP.SystemInfo" %>
<%@ Import Namespace="Ede.Uof.Utility.FileCenter.V3" %>
<script language="C#" runat="server">
    public void Page_Load(object sender, EventArgs e)
    {
        /* Redirect to Common/FileCenterV3/FileControlHandler.ashx
         * 1.確認系統及使用者 Proxy 設定
         * 2.決定是由 UOF 本地端或是 Proxy 端 DownloadHandler 丟出檔案供下載
         */

        string rid = Request.QueryString["id"];
        Guid id = Guid.Empty ;
        if (Guid.TryParse(rid, out id))
        {
            var url = ResolveUrl(FileCenterHelper.GetDownloadUrl(rid, Current.UserGUID));
            //if (!string.IsNullOrEmpty(Request.QueryString["inline"]))
            //{
            //    url += "&inline=" + Request.QueryString["inline"];
            //}
            //if (!string.IsNullOrEmpty(Request.QueryString["exists"]))
            //{
            //    url += "&exists=" + Request.QueryString["exists"];
            //}
            if (Uri.IsWellFormedUriString(url,UriKind.RelativeOrAbsolute))
                Response.Redirect(url);
            else
            {
                Response.StatusCode = 200;
                return;
            }
        }
        else
        {
            Response.StatusCode = 200;
            return;
        }
    }

</script>
