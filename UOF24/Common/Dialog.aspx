<%@ Page Language="C#" AutoEventWireup="true" Inherits="Common_Dialog" Codebehind="Dialog.aspx.cs" %>

<!DOCTYPE html>
<html>
    <head  runat="server">
        <meta http-equiv="X-UA-Compatible" content="IE=edge" >
        <meta content="text/html; charset=utf-8"/>
        <link id="Link1" rel="SHORTCUT ICON" href="~/logo.ico" runat="server" EnableViewState="False" />
        <link href="Style/uof-fixed.css" rel="stylesheet" />
        <style type="text/css">
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
          
            #frameContainer {
                margin: 0px;
                position: fixed;
                top: 0px;
                left: 0px;
                width: 100%;
                height: 100%;
            }
        </style>
        <script src="javascript/jQuery/jquery.js" type="text/javascript"></script>
        <script type="text/javascript">
                
            var dt=40;
            var dl=40;
            if(typeof(dialogArguments)=='undefined' || typeof(dialogArguments.dialogTop)=='undefined')
            {
                dt=40;
                dl=40;
            }
            else
            {                           
                t=dialogArguments.dialogLeft.replace('px','');
                dt=(t-0)+40;
                l=dialogArguments.dialogLeft.replace('px','');
                dl=(l-0)+40;
            }
        
            window.dialogTop  =   dt+'px';
            window.dialogLeft = dl + 'px';
            
           
          
        </script>
    </HEAD>	
   <body style="background-image: url(<%=themePath %>/images/po_04.gif);">
   <div id="frameContainer">      
       <div id="dis" style="height: 100%; width: 100%;">
           <div id="loading" style="margin: 10px auto 10px auto; text-align: center">
               <div class="LoadingText">Loading</div>
               <div id="loadingAnimation" style="margin: 2px auto 2px auto;">
                   <div></div>
                   <div></div>
                   <div></div>
                   <div></div>
                   <div></div>
                   <div></div>
                   <div></div>
                   <div></div>
               </div>
           </div>
       </div>
       <iframe id="content" src="<%=url%>" style="height: 100%; width: 100%;" allowtransparency="false"></iframe>
   </div>
    <script type="text/javascript">
        var done = false;

      
        $(function () {
            $('iframe#content').load(function() {if (!done) {HiddenLoading();}});
           // checkframe();
            
        });
      
        function checkframe() {
            if (!done) {
                var el = $('body', $('iframe#content').contents());
                if (el.length == 0) {
                    setTimeout(checkframe, 50);
                    return;
                }
                HiddenLoading();
            }
        }

        function displayTrigger() {
            if (!done) {
                HiddenLoading();
            }
            return done;
        }
        
        function HiddenLoading() {
            $('#dis').hide();
         
            done = true;
        }
    </script>

    </body>
    <%--
    <frameset cols="*" id="frameset1">
        <frame name="main" frameborder=0 scrolling=auto src="<%=url%>">
    </frameset>	
    --%>
</HTML>
