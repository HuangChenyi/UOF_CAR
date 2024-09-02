<%@ Page Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="DMS_Admin_PDFPreViewer" Title="" Culture="auto" meta:resourcekey="PageResource2" UICulture="auto" Codebehind="PDFPreViewer.aspx.cs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<style type="text/css">

input.btn{
   color:#050;
   font-family:'trebuchet ms',helvetica,sans-serif;
   font-weight:bold;
   background-color:#fed;
   border:1px solid;
   border-top-color:#696;
   border-left-color:#696;
   border-right-color:#363;
   border-bottom-color:#363;
   CURSOR: hand;
   filter:progid:DXImageTransform.Microsoft.Gradient
      (GradientType=0,StartColorStr='#ffffffff',EndColorStr='#ffeeddaa');}
            
}

</style>
     
<script type="text/jscript">

	var pdfID;
	var readerURL;
	$(function () {
		pdfID = "<%=pdfID %>";
	readerURL = "<%=readerURL %>";
	OpenPDFViewer();
});

function OpenPDFViewer()
{                
	try
	{
		var viewer = $('#EBviewer');
		viewer.LoadStream(readerURL, "");
	}
	catch(e)
	{
		alert(e);
		var viewer = $('#EBviewer')
		viewer.hide();
		
		var centerLeft;
		centerLeft = ($(window).width() - 350) / 2
		centerLeft = parseInt(centerLeft);
		$("#divError").css("left", centerLeft); 
		$("#divError").css("top", 200);  
		$("#divError").css('visibility', 'inherit');  

	}       
}

window.onbeforeunload = function (e) {
    var data = [pdfID, false];
    $uof.pageMethod.sync("DelFile", data);
    //DMS_Admin_PDFPreViewer.DelFile(pdfID, true);     
}


function downloadFile() {
    $("#dlFrame").attr("src", readerURL);
}
    

</script>

  <script type="text/jscript" for="EBviewer" event="LoadComplete()">
      var data = [pdfID, false];
      $uof.pageMethod.sync("DelFile", data);
      //DMS_Admin_PDFPreViewer.DelFile(pdfID, false);
  </script>
  
<table border="0" width="100%" cellpadding="0" cellspacing="0">
<tr>
<td style="width: 31px; height: 27px;">
    &nbsp; &nbsp; &nbsp; &nbsp;

</td>
<td align="right" valign="top" style="height: 27px">

    <div id='divError' align="center" style="visibility:hidden;position:absolute;top:0;left:0;z-index:5;width:350px"><font size="+1">
        <asp:Label ID="labAlert" runat="server" ForeColor="Red" Text="您尚未安裝EBPdfViewer , 請先下載安裝" meta:resourcekey="labAlertResource1"></asp:Label></font><br/><br/>
        &nbsp;&nbsp;<a href="../EBPdfViewer.exe">EBPdfViewer</a><br/><br/>
        <asp:Label ID="labReloadPage" runat="server" ForeColor="Red" Text="請安裝 EBPdfViewer 後,關閉此頁" meta:resourcekey="labReloadPageResource1"></asp:Label>
    </div>
       
    </td></tr>


</table>

<object id='EBviewer' classid="<%=ConfigurationManager.AppSettings["PDFViewerClassID"]%>" width="100%" height="95%">
  <param name="ShowLogo" value="false">
</object>
    
<iframe id="dlFrame"  style="width:0;height:0"></iframe>
    
</asp:Content>

