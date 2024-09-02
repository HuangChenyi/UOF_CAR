<%@ Page Language="C#"  AutoEventWireup="true" Inherits="_Default" Title="Welcome to the Best U-Office Force system" Codebehind="Default.aspx.cs" %>
<!DOCTYPE html>
<html>
    <head runat=server  id="head">
        <meta >
        <meta name="referrer" content="no-referrer" />
        <title></title>
        <style>
            html, body
            {
                height: 100%;
                margin: 0;
                padding: 0;
            }
            body
            {
                overflow: hidden;
            }
        </style>
        <telerik:RadCodeBlock ID="RadCodeBlock1" runat="server">
            <%="<link rel=\"icon\" href=\""+Request.ApplicationPath+"/logo.ico\" type=\"image/x-icon\"/>" %>
        </telerik:RadCodeBlock>

    </head>
<frameset >
<frame id="Frame1"  src="Homepage.aspx" runat="server" name="EB_TOP_FRAME" />
</frameset>
</html>