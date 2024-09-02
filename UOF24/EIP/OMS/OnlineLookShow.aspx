<%@ Page Language="C#" AutoEventWireup="true" Inherits="EIP_OMS_OnlineLookShow" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" Codebehind="OnlineLookShow.aspx.cs" %>

<!DOCTYPE html>
<html>
    <head runat="server">
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>線上觀看</title>

    </head>
<body style="background-color:black;vertical-align:middle;">
       <div id="content" style="vertical-align:central;">
    <form id="form1" runat="server">
        <telerik:RadStyleSheetManager ID="RadStyleSheetManager1" runat="server" EnableStyleSheetCombine="True">
            <StyleSheets>
                <telerik:StyleSheetReference Path="~/Common/Style/mediaelementplayer.min.css" />
            </StyleSheets>
            
        </telerik:RadStyleSheetManager>
        <telerik:RadScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="True" AsyncPostBackTimeout="36000">
            <Scripts>
	            <asp:ScriptReference Assembly="Telerik.Web.UI" Name="Telerik.Web.UI.Common.Core.js" />
                <asp:ScriptReference Assembly="Telerik.Web.UI" Name="Telerik.Web.UI.Common.jQuery.js" />
                <asp:ScriptReference Assembly="Telerik.Web.UI" Name="Telerik.Web.UI.Common.jQueryInclude.js" />
                <asp:ScriptReference Path="~/Common/javascript/jQuery/plugin/mediaelement-and-player.js" ScriptMode="Release" />
                <asp:ScriptReference Path="~/Common/javascript/jQuery/plugin/mediaelement-and-player.min.js" ScriptMode="Release" />
                <asp:ScriptReference Path="~/Common/javascript/Silverlight.js" ScriptMode="Release" />
            </Scripts>
        </telerik:RadScriptManager>
           <script type="text/javascript">
               Sys.Application.add_load(function () {
                   $("#<%=divplayer.ClientID%>").bind('contextmenu', function (e) {
                       return false;
                   });

                   // setTimeout(checkScreen, 200);
                   if ($telerik.isIE) {
                       if ($("#<%=hidFileType.ClientID%>").val().toLowerCase() == ".webm"
                  || $("#<%=hidFileType.ClientID%>").val().toLowerCase() == ".ogg") {
                           $("#<%=divplayer.ClientID%>").hide();
                           $("#<%=lblShowMovieErr.ClientID%>").show();
                           $("#<%=Image1.ClientID%>").show();
                           $('#tbMovieeErr').height($(window).height() - 46);
                       }
                       else {
                           $("#<%=lblShowMovieErr.ClientID%>").hide();
                           $("#<%=Image1.ClientID%>").hide();
                       }
                       if ($("#<%=hidFileType.ClientID%>").val().toLowerCase() == ".wmv" && !Silverlight.isInstalled()) {
                           $("#<%=divplayer.ClientID%>").hide();

                           $('#installsliverlight').css("display", "block");
                       }
                   }
                   if ($telerik.isChrome || $telerik.isSafari2 || $telerik.isSafari3 || $telerik.isSafari4 || $telerik.isSafari) {
                       if ($("#<%=hidFileType.ClientID%>").val().toLowerCase() == ".wmv") {
                           $("#<%=divplayer.ClientID%>").hide();
                           $("#<%=lblShowMovieErr.ClientID%>").show();
                           $("#<%=Image1.ClientID%>").show();
                           $('#tbMovieeErr').height($(window).height() - 46);
                       }
                       else {
                           $("#<%=lblShowMovieErr.ClientID%>").hide();
                           $("#<%=Image1.ClientID%>").hide();
                       }
          }
                   if ($telerik.isFirefox) {
                       if ($("#<%=hidFileType.ClientID%>").val().toLowerCase() == ".mov") {
                           $("#<%=divplayer.ClientID%>").hide();
                           $("#<%=lblShowMovieErr.ClientID%>").show();
                           $("#<%=Image1.ClientID%>").show();
                           $('#tbMovieeErr').height($(window).height() - 46);
                       }
                       else {
                           $("#<%=lblShowMovieErr.ClientID%>").hide();
                           $("#<%=Image1.ClientID%>").hide();
                       }
                       if ($("#<%=hidFileType.ClientID%>").val().toLowerCase() == ".wmv" && !Silverlight.isInstalled()) {
                           $("#<%=divplayer.ClientID%>").hide();

                           $('#installsliverlight').css("display", "block");
                       }
                   }
                   $('#divMovieeErr').height($(window).height() - 46);
               });

      $(window).resize(function () {
          //$uof.telerikFix.dock.resizeTitleText();
          $('#content').height($(window).height() - 46);
          $('#playertb').height($('#content').height());
          if ($("#<%=lblShowMovieErr.ClientID%>").is(':visible')) {
              $('#playertb').hide();
              $('#divMovieeErr').height($('#content').height());
          }
         
          $('#divMovieeErr').height($('#content').height());
      });

      </script>
    <div>
        <asp:ValidationSummary ID="ValidationSummary1" runat="server" BackColor="Red" 
            ForeColor="White" meta:resourcekey="ValidationSummary1Resource1" />
       <asp:CustomValidator ID="CustomValidator1" runat="server" Display="Dynamic" 
            ErrorMessage="無線上觀看此影音權限" Visible="False" 
            meta:resourcekey="CustomValidator1Resource1"></asp:CustomValidator>
       <asp:CustomValidator ID="CustomValidator2" runat="server" Display="Dynamic" 
            ErrorMessage="無上傳影音" Visible="False" 
            meta:resourcekey="CustomValidator2Resource1"></asp:CustomValidator>
    <asp:HiddenField ID="hidFileSource" runat="server" />
    <asp:HiddenField ID="hidFileType" runat="server" />

    </div>
    </form>   
     <div id="installsliverlight" style="display:none">
        <a href="http://go.microsoft.com/fwlink/?LinkID=149156&v=5.0.61118.0" style="text-decoration: none">
                    <img src="http://go.microsoft.com/fwlink/?LinkId=108181" alt="Get Microsoft Silverlight" style="border-style: none" />
                </a>
    </div>                
    <table id="playertb" align="center" >
         <tr>
           <td align="center" >
               <asp:Label ID="lblLookCountTitle" Visible="false"
                   style="border:none;width:80%;text-align:center" 
                   runat="server" Text="觀看次數：" meta:resourcekey="lblLookCountTitleResource1"></asp:Label><%--<input type="text"  id="txtLookCount" style="border:none; background-color:Black; color:White;width:80%;text-align:right" value="觀看次數：" />--%>
           <asp:Label ID="lblLookCount" runat="server" Visible="false" Font-Size="10pt" 
                   meta:resourcekey="lblLookCountResource1"></asp:Label></td>
       </tr>
    <tr><td style="vertical-align:middle">
   <div id="divplayer" runat="server">
        <video id="player2"  controls="controls" style="width: 100%; height: 100%;"  >
	<source src="<%=VIDEOURL %>" type="<%=videotype %>" >
	<p>Your browser leaves much to be desired.</p>			
</video>	
       </div>
        <script>
            var w = $(window).width();
            var h = $(window).height();
            $('audio,video').mediaelementplayer({
                videoWidth: w - 30,
                videoHeight: h - 30,
                // auto-select this language (instead of starting with "None")
                startLanguage: 'en',
                // automatically translate into these languages
                translations: ['es', 'ar', 'zh', 'ru'],
                // enable the dropdown list of languages
                translationSelector: true,
                error: function () {
                    $('.me-cannotplay').hide();
                    $("#<%=divplayer.ClientID%>").hide();
                    $("#<%=lblShowMovieErr.ClientID%>").show();
                },
                success: function (media, node, player) {
                    $('audio,video').width(w - 30);
                    $('audio,video').height(h - 30);
                }
            });


</script>
            
       </td></tr>
     
    </table>
           <center>
    <table id="divMovieeErr" style="margin: 0 auto"><tr><td style="vertical-align:middle;"><asp:Label ID="lblShowMovieErr" Font-Bold="true" Font-Size="Large"  ForeColor="White" runat="server" Text="您所使用的瀏覽器無法觀看此影片，請使用其他瀏覽器觀看" 
    meta:resourcekey="lblShowMovieErrResource1"   ></asp:Label>
         <br /><center>
<asp:Image ID="Image1" ImageUrl="~/Common/UImages/notplay.png" runat="server"></asp:Image> </center>
        </td></tr></table></center>
   
    <asp:Label ID="lblOnlineLookShowTitle" runat="server" Text="影音觀看" 
        Visible="False" meta:resourcekey="lblOnlineLookShowTitleResource1"></asp:Label>
    </div>
</body>
</html>
