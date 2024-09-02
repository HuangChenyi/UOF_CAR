<%@ Page Language="C#" AutoEventWireup="true" Inherits="EIP_WebMail_WebMailLogin" Codebehind="WebMailLogin.aspx.cs" %>

<!DOCTYPE html>
<html>
    <head runat="server">
        <meta http-equiv="X-UA-Compatible" content="IE=edge" >
        <title></title>
    </head>
<body>
<telerik:RadScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="True" AsyncPostBackTimeout="36000" >
    <Scripts>
	            <asp:ScriptReference Assembly="Telerik.Web.UI" Name="Telerik.Web.UI.Common.Core.js" />
                <asp:ScriptReference Assembly="Telerik.Web.UI" Name="Telerik.Web.UI.Common.jQuery.js" />
                <asp:ScriptReference Assembly="Telerik.Web.UI" Name="Telerik.Web.UI.Common.jQueryInclude.js" />
        </Scripts>
</telerik:RadScriptManager>
<div id="MainDIV" runat="server" style="display:none">

</div>


<script type="text/javascript">
    function SelfSubmit() {
        var obj = $("#loginform");
        if (obj != null)
            obj.submit();


    }

    function SelfResize() {
        window.moveTo(0, 0);
        window.resizeTo(screen.width, screen.height);
    }


    SelfSubmit();

    SelfResize();
    
</script>
</body>

</html>
