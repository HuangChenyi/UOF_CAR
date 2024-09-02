<%@ Page Language="C#" AutoEventWireup="true" Inherits="DMS_DocStore_PDFViewerSL" Title="檢視文件" Culture="auto"  UICulture="auto" meta:resourcekey="PageResource2" Codebehind="PdfViewerSL.aspx.cs" %>
<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Web.UI" tagprefix="telerik" %>
<!DOCTYPE html>
<html style="overflow: hidden">
<head runat="server">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta content="text/html; charset=utf-8" />    
    <style type="text/css">
        
         #silverlightControlHost {
             height: 100%;
             text-align:center;
         }

    </style>   
</head>
<body id="Body">

    <form id="form1" runat="server">
        <telerik:RadScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="True" AsyncPostBackTimeout="36000">
            <Scripts>
	            <asp:ScriptReference Assembly="Telerik.Web.UI" Name="Telerik.Web.UI.Common.Core.js" />
                <asp:ScriptReference Assembly="Telerik.Web.UI" Name="Telerik.Web.UI.Common.jQuery.js" />
                <asp:ScriptReference Assembly="Telerik.Web.UI" Name="Telerik.Web.UI.Common.jQueryInclude.js" />
                <asp:ScriptReference Path="~/Common/javascript/json2.min.js" ScriptMode="Release" />
                <asp:ScriptReference Path="~/Common/javascript/jQuery/plugin/jquery-ui.min.js" ScriptMode="Release" />
                <asp:ScriptReference Path="~/Common/javascript/jQuery/plugin/jquery.blockUI.js" ScriptMode="Release" />
                <asp:ScriptReference Path="~/Common/javascript/jQuery/plugin/ticker.js" ScriptMode="Release" />
                <asp:ScriptReference Path="~/Common/javascript/uofScript.js" ScriptMode="Release" />
                <asp:ScriptReference Path="~/Common/javascript/jQuery/plugin/jquery.cookie.js" ScriptMode="Release" />
            </Scripts>
        </telerik:RadScriptManager>



        <asp:HiddenField ID="hdnIsRedirect" runat="server" />
        <asp:HiddenField ID="hdnQueryString" runat="server" />

        <telerik:RadScriptBlock runat="server">
            <script type="text/javascript">
                /* <![CDATA[ */

                $(function () {
                    // check Silverlight and redirect
                    var redir = $("#<%=hdnIsRedirect.ClientID%>").val();
                    if (redir !== "1") {
                        
                        var p = encodeURIComponent($('#<%=hdnQueryString.ClientID%>').val());
                        var url = "PdfImageViewer.aspx?p=" + p;
                        if("<%=isUGFile%>" === "Y")
                            url = "PdfImageViewerUG.aspx?p=" + p;


                       
                        location.replace(url);
                        return;
                    }

                    $(window).on('beforeunload', function () {
                        var url = String.format("PdfViewerSLDeleteHandler.ashx?uid={0}", "<%=UniqueId%>");
                        $.get(url, function (data) { });
                    });

                    $(window).on('load',function () {
                        self.moveTo(0, 0);
                        self.resizeTo(screen.availWidth, screen.availHeight);
                    });
                });

                /* ]]> */
            </script>
              
        </telerik:RadScriptBlock>
    </form>
</body>
</html>
