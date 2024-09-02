<%@ Page Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="DMS_DMSDocDownLoadLink" Title="" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" Codebehind="DMSDocDownLoadLink.aspx.cs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <script type="text/jscript">

        var docid;
        var docversion;
        var labPDFError;
        //var labDlFile;
        var imgProcess;
        var labWait;
        var labFileError;


        $(function () {

            var showDlbutton = "<%=showDlbutton %>";
        docid = "<%=docid %>";
        docversion = "<%=docversion %>";
        labPDFError = $("#<%=labPDFError.ClientID%>");

        imgProcess = $("#<%=imgProcess.ClientID%>");
        labWait = $("#<%=labWait.ClientID%>");
        labFileError = $("#<%=labFileError.ClientID%>");


        if (showDlbutton == "true") {
            $("#<%=imgProcess.ClientID%>").css('visibility', 'hidden'); //imgProcess.style.visibility = "hidden";          

            if (typeof (DialogMasterPageWebImageButton1) != 'undefined')
                DialogMasterPageWebImageButton1.setVisible(true);
        }
        else if (showDlbutton == "false") {
            if (typeof (DialogMasterPageWebImageButton1) != 'undefined') {
                DialogMasterPageWebImageButton1.setVisible(false);
                InitializeTimer();
            }
        }
        else {
            if (typeof (DialogMasterPageWebImageButton1) != 'undefined')
                DialogMasterPageWebImageButton1.setVisible(false);
        }
    });

    //2012-5-24 ELTON, add for download file by [FileCenterV2 FileControlHandler]
    function DownloadFileWithHandler(sHandlerUrl, sUserProxyIndex) {
        var data = ["<%=docid %>", "<%=docversion %>", "<%=status %>"];
            $uof.pageMethod.sync("StatisticsDocDownloadCount", data);

            $uof.download(sHandlerUrl, sUserProxyIndex);
            return false;
        }

        function ShowProcess() {
            //labDlFile.style.visibility = "hidden";
            $("#<%=imgProcess.ClientID%>").css('visibility', 'visible');
            $("#<%=labWait.ClientID%>").css('visibility', 'visible');

            if (typeof (labPDFError) != 'undefined')
                $("#<%=labPDFError.ClientID%>").css('visibility', 'hidden');

            //labFileError.style.visibility = "hidden";
            //return false;
        }

        function ChangeStatus(result) {
            //alert(docid);            
            if (result.value == true) {
                StopTheClock();

                if (typeof (DialogMasterPageWebImageButton1) != 'undefined')
                    DialogMasterPageWebImageButton1.setVisible(true);

                var labAlert;
                labAlert = $("#<%=labAlert.ClientID%>");
                $("#<%=labAlert.ClientID%>").css('visibility', 'hidden');

                var imgProcess;
                imgProcess = $("#<%=imgProcess.ClientID%>");
                $("#<%=imgProcess.ClientID%>").css('visibility', 'hidden');
            }
        }


        function OpenPDFViewerWithFileCenterV2(sJson) {
            var h = $uof.tool.printScreenSize('h', screen.availHeight);
            var w = $uof.tool.printScreenSize('w', screen.availWidth);
            $uof.window.open("PdfViewerSL.aspx?p=" + encodeURIComponent(sJson), w, h);

            var docid = '<%=docid %>';
            var docversion = '<%=docversion %>';
            var status = '<%=status %>';
            var data = [docid, docversion, status];
            $uof.pageMethod.sync("AddDownloadCount", data);
            <%--$uof.dialog.open2("~/DMS/DocStore/PdfViewerSL.aspx", '', '', 1024, 768,
                function (returnValue) {
                    window.location.href = "../DocStore/Default.aspx";
                    var docid = '<%=docid %>';
                    var docversion = '<%=docversion %>';
                    var status = '<%=status %>';
                    var data = [docid, docversion, status];
                    $uof.pageMethod.sync("AddDownloadCount", data);

                    //$uof.dialog.close();
                    return false;
                    }
            , { "p": sJson });--%>
        }

        var secs;
        var timerID = null;
        var timerRunning = false;
        var delay = 15000;

        function InitializeTimer() {
            secs = 5;
            StopTheClock();
            StartTheTimer();
        }

        function StopTheClock() {
            if (timerRunning)
                clearTimeout(timerID)
            timerRunning = false
        }

        function StartTheTimer() {
            if (secs == 1) {
                StopTheClock();
                $("#<%=labPDFError.ClientID%>").css('visibility', 'visible');

                var labAlert;
                labAlert = $("#<%=labAlert.ClientID%>");
                $("#<%=labAlert.ClientID%>").css('visibility', 'hidden');

                var imgProcess;
                imgProcess = $("#<%=imgProcess.ClientID%>");
                imgProcess.src = "../images/alert.gif";

                //imgProcess.style.visibility = "hidden";                                                          
            }
            else {
                self.status = secs;
                secs = secs - 1;
                timerRunning = true;
                timerID = self.setTimeout("StartTheTimer()", delay);
                var statusData = [docid, docversion];
                var getResult = $uof.pageMethod.sync("CheckPDFFileStatus", statusData);
                if (getResult == "true") {
                    StopTheClock();

                    if (typeof (DialogMasterPageWebImageButton1) != 'undefined')
                        DialogMasterPageWebImageButton1.setVisible(true);

                    var labAlert;
                    labAlert = $("#<%=labAlert.ClientID%>");
                    $("#<%=labAlert.ClientID%>").css('visibility', 'hidden');

                    var imgProcess;
                    imgProcess = $("#<%=imgProcess.ClientID%>");
                    $("#<%=imgProcess.ClientID%>").css('visibility', 'hidden');
                }
            }
        }

    </script>
    <center>
<table border="1" cellpadding="0" cellspacing="0" style="width: 450px; height: 210px" class="PopTable">
<tr>

    <td align="right" style="height: 25px">
        <asp:Label ID="Label1" runat="server" Text="文件名稱：" meta:resourcekey="Label1Resource1"></asp:Label></td>
    <td style="height: 25px" colspan="3">
        <asp:Label ID="labDocName" runat="server"></asp:Label></td>
    
</tr>
    <tr>
        <td align="right" style="height: 25px">
            <asp:Label ID="Label5" runat="server" meta:resourcekey="Label5Resource2" Text="目錄："></asp:Label></td>
        <td colspan="3" style="height: 25px">
            <img src="../../DMS/images/closed.gif" />
            <asp:Label ID="lblFolderName" runat="server"></asp:Label></td>
    </tr>

<tr>
    <td  align="right" style="height: 25px">
        <asp:Label ID="Label3" runat="server" Text="機密等級：" meta:resourcekey="Label3Resource1"></asp:Label></td>
    <td style="height: 25px" ><asp:Label ID="lblSecret" runat="server"></asp:Label></td>
    <td  align="right" style="height: 25px"><asp:Label ID="Label6" runat="server" Text="狀態：" meta:resourcekey="Label6Resource1"></asp:Label></td>
    <td style="height: 25px" ><asp:Label ID="lblStatus" runat="server"></asp:Label></td>
</tr>
<tr>
    <td  align="right" style="height: 25px">
        <asp:Label ID="Label4" runat="server" Text="下載次數：" meta:resourcekey="Label4Resource1"></asp:Label></td>
    <td style="height: 25px" ><asp:LinkButton ID="LinkButton1" runat="server" Font-Bold="True"  ForeColor="Red"></asp:LinkButton></td>&nbsp;
    <td style="height: 25px" align="right" >&nbsp;<asp:Label ID="Label2" runat="server" Text="版本：" meta:resourcekey="Label2Resource1"></asp:Label></td>
    <td style="height: 25px" >&nbsp;<asp:Label ID="labDocVersion" runat="server"></asp:Label></td>
</tr>

<tr>



<td align="right">
    <asp:Label ID="Label7" runat="server" Text="原稿控制：" meta:resourcekey="Label18Resource1"></asp:Label></td>
<td align="left">
    <asp:Label ID="labSourceControl" runat="server" Text="Label" meta:resourcekey="labSourceControlResource1"></asp:Label></td>
<td align="right">
    <asp:Label ID="Label8" runat="server" Text="文件大小：" meta:resourcekey="Label17Resource1"></asp:Label></td>
<td align="left">
    <asp:Label ID="lblFilelength" runat="server" ForeColor="Black"></asp:Label>
    <asp:Label ID="Label11" runat="server" ForeColor="Black" meta:resourcekey="Label11Resource1" Visible="false"
        Text="Byte"></asp:Label></td>

</tr>
        
<tr><td colspan="4" align="center" class="PopTableRightTD" valign="middle" style="height: 140px">
    <asp:Label ID="labDlFile" runat="server" ForeColor="Black" Text="請按下載...來讀取此份文件......" meta:resourcekey="labDlFileResource1" Visible="False"></asp:Label>
    <br />
    <asp:Image ID="imgProcess" runat="server" />&nbsp;<br />
    <asp:Label ID="labPDFConvertERROR" runat="server" ForeColor="Blue" 
        Text="發生錯誤，轉換PDF失敗！" Visible="False" 
        meta:resourcekey="labPDFConvertERRORResource"></asp:Label><br/>
    &nbsp;<asp:Label ID="labAlert" runat="server" 
        Text="目前無法觀看此檔案，正在進行PDF檔案轉換，請稍待......" ForeColor="Blue" Visible="False" 
        meta:resourcekey="labAlertResource1"></asp:Label><br>    &nbsp;
    <asp:Label ID="labFileError" runat="server" ForeColor="Blue" Text="發生錯誤，檔案不存在！" 
        Visible="False" meta:resourcekey="labFileErrorResource1"></asp:Label>
    <asp:Label ID="labPDFError" runat="server" ForeColor="Blue" 
        Text="檔案目前仍在轉換處理中，請稍待幾分鐘後再試，若一直無法成功轉換，請洽系統管理員" 
        meta:resourcekey="labPDFErrorResource1"></asp:Label>

    <!--2012-5-23 ELTON, 因檔案仍在Proxy尚未傳輸到UOF, 需顯示警告訊息-->
    <asp:Label ID="lblFileNotTransferToUof" runat="server" Text="目前檔案仍在Proxy伺服器，正由系統進行傳輸中，請稍後！" Visible="False" ForeColor="Blue" ></asp:Label>
                        
    <br />
    <asp:Label ID="labWait" runat="server" ForeColor="Blue" Text="請稍待，文件下載處理中..." 
        meta:resourcekey="labWaitResource1"></asp:Label>
    <asp:CustomValidator ID="CustomValidator1" runat="server" Display="Dynamic" 
        ErrorMessage="累計下載次數發生錯誤" meta:resourcekey="CustomValidator1Resource1" 
        ForeColor="Blue"></asp:CustomValidator>
</table>
    <asp:Label ID="lblNotFindVer" runat="server" Text="此版本已不存在" Visible="False" meta:resourcekey="lblNotFindVerResource1"></asp:Label>
    <asp:Label ID="lblDownload" runat="server" Text="下載文件" Visible="False" meta:resourcekey="lblDownloadResource1"></asp:Label>
    <asp:Label ID="labViewerDoc" runat="server" Text="觀看文件" meta:resourcekey="Label8Resource1" Visible="False"></asp:Label>
    <asp:Label ID="lblNoUpLoad" runat="server" Text="文件還未上傳，無法下載" Visible="False" meta:resourcekey="lblNoUpLoadResource1"></asp:Label></center>
    <asp:Label ID="lblSecretm" runat="server" Text="密" Visible="False" meta:resourcekey="lblSecretmResource1"></asp:Label>
    <asp:Label ID="lblXSecret" runat="server" Text="機密" Visible="False" meta:resourcekey="lblXSecretResource1"></asp:Label>
    <asp:Label ID="lblXXSecret" runat="server" Text="極機密" Visible="False" meta:resourcekey="lblXXSecretResource1"></asp:Label>
    <asp:Label ID="lblTopSecret" runat="server" Text="絕對機密" Visible="False" meta:resourcekey="lblTopSecretResource1"></asp:Label>

    <asp:Label ID="lblNormal" runat="server" Text="一般" Visible="False" meta:resourcekey="lblNormalResource1"></asp:Label>
    <asp:Label ID="lblCheckin" runat="server" Text="已存回" Visible="False" meta:resourcekey="lblCheckinResource1"></asp:Label>
    <asp:Label ID="lblCheckOut" runat="server" Text="已取出" Visible="False" meta:resourcekey="lblCheckOutResource1"></asp:Label>
    <asp:Label ID="lblApproval" runat="server" Text="審核中" Visible="False" meta:resourcekey="lblApprovalResource1"></asp:Label>
    <asp:Label ID="lblPublish" runat="server" Text="已公佈" Visible="False" meta:resourcekey="lblPublishResource1"></asp:Label>
    <asp:Label ID="lblInactive" runat="server" Text="已失效" Visible="False" meta:resourcekey="lblInactiveResource1"></asp:Label>
    <asp:Label ID="lblVoid" runat="server" Text="已作廢" Visible="False" meta:resourcekey="lblVoidResource1"></asp:Label>
    <asp:Label ID="lblTempInact" runat="server" Text="已下架" Visible="False" meta:resourcekey="lblTempInactResource1"></asp:Label>
    <asp:Label ID="lblOldVer" runat="server" Text="舊版本" Visible="False" meta:resourcekey="lblOldVerResource1"></asp:Label>
    <asp:Label ID="lblReAct" runat="server" Text="已上架" Visible="False" meta:resourcekey="lblReActResource1"></asp:Label>
    <asp:Label ID="labDocDeny" runat="server" Text="發佈拒絕" Visible="False" meta:resourcekey="labDocDenyResource1"></asp:Label>
    <asp:Label ID="labDocStore" runat="server" meta:resourcekey="labDocStoreResource1" Text="文件庫" Visible="False"></asp:Label>
    <asp:Label ID="labYes" runat="server" Text="是" meta:resourcekey="labYesResource1" Visible="False"></asp:Label>
    <asp:Label ID="labNo" runat="server" Text="否" meta:resourcekey="labNoResource1" Visible="False"></asp:Label>
    <asp:Label ID="labNoActive" runat="server" meta:resourcekey="labNoActiveResource1" Text="未生效" Visible="False"></asp:Label>
    <asp:Label ID="lblNoPublish" runat="server" Text="此文件尚未有公佈版本，無法下載" Visible="False" meta:resourcekey="lblNoPublishResource1"></asp:Label>
</asp:Content>

