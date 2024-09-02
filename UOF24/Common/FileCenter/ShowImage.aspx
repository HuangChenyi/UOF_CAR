<script language="C#" runat="server">
    public void Page_Load(object sender, EventArgs e)
    {
        var url = string.Empty;
        try
        {
            Guid gid = Guid.Empty ;
            string rid=Request.QueryString["id"];
            if (Guid.TryParse(rid, out gid))
            {

                url = "Downloadfile.ashx?id=" + rid + "&type=image";
                if (!Uri.IsWellFormedUriString(url, UriKind.Relative)) throw new Exception();
            }
            else
            {
                throw new Exception();
            }
        }
        catch
        {
            // 資安議題, 如果發生錯誤, 回傳空白頁
            Response.StatusCode = 200;
            return;
        }

        Response.Redirect(url);
    }

</script>
