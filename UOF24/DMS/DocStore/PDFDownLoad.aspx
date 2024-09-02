<%@ Page Language="C#"  AutoEventWireup="true" Inherits="DMS_DocStore_PDFDownLoad" Title="PDF下載" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" Codebehind="PDFDownLoad.aspx.cs" %>

<html  >
<head id="Head1" runat="server">

<script type="text/jscript">


    $(function () {

        Dpdfreader1.Initialize("");
        //	Dpdfreader1.OpenFileFromURL("http://www.irs.gov/pub/irs-pdf/fw4.pdf", "", false);    
        //    Dpdfreader1.OpenFileFromURL("D:\教育訓練\EAP2006-01-07.pdf", "");
    });

			
</script>
</head>
<body>



   			<OBJECT id="Dpdfreader1" style="WIDTH: 100%; HEIGHT: 95%" classid="clsid:1F573201-F7C7-49CC-83E8-8C935591CD9C"
				VIEWASTEXT>
				<PARAM NAME="_Version" VALUE="524288">
				<PARAM NAME="_ExtentX" VALUE="18838">
				<PARAM NAME="_ExtentY" VALUE="11853">
				<PARAM NAME="_StockProps" VALUE="0">
			</OBJECT>
   

</body>
</html>

