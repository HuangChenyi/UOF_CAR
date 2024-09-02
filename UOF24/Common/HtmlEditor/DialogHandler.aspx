<%@ Page Language="C#" Inherits="Telerik.Web.UI.DialogHandler, Telerik.Web.UI" %>
<script runat="server">

    protected void Page_Load()
    {
        HtmlGenericControl headerScript = new HtmlGenericControl("script");
        headerScript.Attributes.Add("type", "text/javascript");
        headerScript.Attributes.Add("src", ResolveUrl("~/Common/javascript/jquery/jquery.js?v=19.50"));
        Page.Header.Controls.AddAt(1, headerScript);
    }

    
</script>