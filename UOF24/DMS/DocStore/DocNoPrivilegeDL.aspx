<%@ Page Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="DMS_DocStore_DocNoPrivilegeDL" Title="文件下載" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" Codebehind="DocNoPrivilegeDL.aspx.cs" %>
<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>
<%@ Register Src="~/Common/ChoiceCenter/UC_ChoiceList.ascx" TagPrefix="uc2" TagName="UC_ChoiceList" %>
<%@ Register Src="~/Common/FileCenter/V3/UC_FileCenter.ascx" TagPrefix="uc1" TagName="UC_FileCenter" %>
<%@ Register Src="~/Edoc/Common/UC_EdocViewer.ascx" TagPrefix="uc1" TagName="UC_EdocViewer" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <telerik:RadNotification ID="notification" runat="server"
                        TitleIcon="~/Common/Images/Icon/icon_m154.gif"
                        Title="Information" 
                        Position="Center"                                 
                        Width="560"
                        Height="120"
                        EnableRoundedCorners="True"
                        EnableShadow="True" AutoCloseDelay="3000" meta:resourcekey="notificationResource1" />

    <style type="text/css">
        div.JustAddBorder table tr td {
            border-width: 1px;
            border-style: solid;
        }

        .labelMutiline {
            white-space: pre-wrap;
        }

        .panelHeightLimit {
            overflow: auto;
            max-height: 80px;
        }
    </style>

    <script type="text/javascript">

        var docid;
        var docversion;
        var labPDFError;
        //var labDlFile;
        var imgProcess;
        var labWait;
        var labFileError;

        $(function () {
            var showDlbutton = "<%=showDlbutton %>";
            docid = '<%=System.Web.Security.AntiXss.AntiXssEncoder.HtmlEncode(docid,true)%>';
            docversion = $("#<%= hfDocVersionJS.ClientID%>").val();
            labPDFError = $("#<%=labPDFError.ClientID%>").text();
            imgProcess = $("#<%=imgProcess.ClientID%>");
            labWait = $("#<%=labWait.ClientID%>");
            labFileError = $("#<%=labFileError.ClientID%>");
            labAlert = $("#<%=labAlert.ClientID%>");
            var data = ["<%=m_fileID %>", $uof.tool.htmlDecode(docid), $uof.tool.htmlDecode(docversion)];

            //電子公文的UC_EdocViewer，必須在父層用div限制最大寬度，否則一放大會跑版
            var contentViewerRadPageViewWidth = $("#<%=ContentViewerRadPageView.ClientID%>").width();
            $(".divContentViewer").css('maxWidth', contentViewerRadPageViewWidth);

            if (labAlert.length != 0) {
                // 重新呼叫,轉換PDF
                $uof.pageMethod.sync("ReConvertPDF", data);
            }

            if (showDlbutton == "true") {
                $("#<%=imgProcess.ClientID %>").css('visibility', 'hidden'); //imgProcess.style.visibility = "hidden";          

                if (typeof (DialogMasterPageWebImageButton1) != 'undefined')
                    DialogMasterPageWebImageButton1.setVisible(true);
            }
            else if (showDlbutton == "false") {
                if (typeof (DialogMasterPageWebImageButton1) != 'undefined') {
                    DialogMasterPageWebImageButton1.setVisible(false);
                    //如果是本文模式則不跑Timer
                    if ("<%=docMode %>" === 'FILE')
                        InitializeTimer();
                }
            }
            else if (showDlbutton == "SourcePDFError") {
                if (typeof (DialogMasterPageWebImageButton1) != 'undefined') {
                    DialogMasterPageWebImageButton1.setVisible(true);
                }
            }
            else {
                if (typeof (DialogMasterPageWebImageButton1) != 'undefined')
                    DialogMasterPageWebImageButton1.setVisible(false);
            }

            //目錄設定不可複製本文
            var blAllowCopyContent = $('#<%=hfAllowCopyContent.ClientID%>').val();
            if (blAllowCopyContent === 'False') {
                unSelectContent();
            }
        });

        function unSelectContent() {

            var obj = $('#body');

            obj.addClass("unselectable");
            $(document).bind("contextmenu", function () { return false; });
            $(document).bind("selectstart", function () { return false; });
            $(document).keydown(function () { return key(arguments[0]) });
            for (i in document.images) document.images[i].ondragstart = imgdragstart;
        }

        function imgdragstart() { return false; }

        function key(e) {
            var keynum;
            if (window.event) // IE
            {
                keynum = e.keyCode;
            }
            else if (e.which) // Netscape/Firefox/Opera
            {
                keynum = e.which;
            }
            if (keynum == 17) { alert("<%=lblNoCpoy.Text %>"); return false; }
        }

        //2012-5-24 ELTON, add for download file by [FileCenterV2 FileControlHandler]
        function DownloadFileWithHandler(sHandlerUrl, sUserProxyIndex) {
            var status = '<%=System.Web.Security.AntiXss.AntiXssEncoder.HtmlEncode(status,true)%>';
            var docid2 = '<%=System.Web.Security.AntiXss.AntiXssEncoder.HtmlEncode(docid,true)%>';
            var data = [$uof.tool.htmlDecode(docid2), $("#<%= hfDocVersionJS.ClientID%>").val(), $uof.tool.htmlDecode(status)];
            $uof.pageMethod.sync("StatisticsDocDownloadCount", data);

            $uof.download(sHandlerUrl, sUserProxyIndex);
            return false;
        }

        function ShowProcess() {
            $("#<%=imgProcess.ClientID %>").css('visibility', 'visible');
            $("#<%=labWait.ClientID %>").css('visibility', 'visible');

            if (typeof (labPDFError) != 'undefined')
                $("#<%=labPDFError.ClientID %>").css('visibility', 'hidden');

            //labFileError.style.visibility = "hidden";
            //return false;
        }

        function ChangeStatus(result) {
            //alert(docid);            
            if (result.value == true) {
                StopTheClock();

                if (typeof (DialogMasterPageWebImageButton1) != 'undefined')
                    DialogMasterPageWebImageButton1.setVisible(true);

                $("#<%=labAlert.ClientID %>").css('visibility', 'hidden');
                $("#<%=imgProcess.ClientID %>").css('visibility', 'hidden');
            }
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
                $("#<%=labPDFError.ClientID %>").css('visibility', 'visible');  //labPDFError.style.visibility = "visible";

                $("#<%=labAlert.ClientID %>").css('visibility', 'hidden'); //labAlert.style.visibility = "hidden";     

                $("#<%=imgProcess.ClientID %>").attr("src", "../images/alert.gif"); //imgProcess.src = "../images/alert.gif";

                //imgProcess.style.visibility = "hidden";                                                          
            }
            else {
                self.status = secs;
                secs = secs - 1;
                timerRunning = true;
                timerID = self.setTimeout("StartTheTimer()", delay);
                var data = [$uof.tool.htmlDecode(docid), $uof.tool.htmlDecode(docversion)];
                var result = $uof.pageMethod.sync("CheckPDFFileStatus", data);

                if (result == "true") {
                    StopTheClock();

                    if (typeof (DialogMasterPageWebImageButton1) != 'undefined')
                        DialogMasterPageWebImageButton1.setVisible(true);

                    $("#<%=labAlert.ClientID %>").css('visibility', 'hidden');
                    $("#<%=imgProcess.ClientID %>").css('visibility', 'hidden');
                }
            }
        }

        function ReconvertPDF() {
            var docid2 = '<%=System.Web.Security.AntiXss.AntiXssEncoder.HtmlEncode(docid,true)%>';
            var docversion = $("#<%= hfDocVersionJS.ClientID%>").val();
            var data = ["<%=m_fileID %>", $uof.tool.htmlDecode(docid2), $uof.tool.htmlDecode(docversion)];
            $uof.pageMethod.sync("ReConvertPDF", data);
            //location = location;

            location = location;

            return false;
        }

        function maxsize() {
            window.dialogWidth = '700px';
            window.dialogHeight = '725px';

            document.getElementById("body").style.width = "670px";
        }

        function Button4Click(docid2) {
            
            $uof.dialog.open2("~/DMS/DocStore/DocInform.aspx", this, "", 900, 900, function (returnValue) {
                if (returnValue == "ok") { return true; }
                return false;
            }, { "docid": docid2 });
            return false;
                    }

        function rbtnCtrlInfoColumn_Clicking(sender, args) {
            var isVisible = $('#<%= hfIsVisible.ClientID%>').val();
            var btn = $find("<%= rbtnCtrlInfoColumn.ClientID%>");
            if (isVisible == "True") {
                $('#<%= hfIsVisible.ClientID%>').val("False");
                    $('#<%= tr1.ClientID%>').hide()
                    $('#<%= tr2.ClientID%>').hide()
                    $('#<%= tr3.ClientID%>').hide()
                    $('#<%= tr4.ClientID%>').hide()
                    $('#<%= trContView1.ClientID%>').hide()
                    $('#<%= trSourceControl.ClientID%>').hide()
                
                    btn.set_text($('#<%= hfOpenInfoTxt.ClientID%>').val());
                }
                else {
                    $('#<%= hfIsVisible.ClientID%>').val("True");
                    $('#<%= tr1.ClientID%>').show()
                    $('#<%= tr2.ClientID%>').show()
                    $('#<%= tr3.ClientID%>').show()
                    $('#<%= tr4.ClientID%>').show()
                    $('#<%= trContView1.ClientID%>').show()
                    $('#<%= trSourceControl.ClientID%>').show()
      
                    btn.set_text($('#<%= hfVisibleInfoTxt.ClientID%>').val());
                }
                args.set_cancel(true);
        }

        function PrintDocContent() {
            var docid = '<%=docid%>';
            var manualver = $uof.tool.htmlDecode('<%=System.Web.Security.AntiXss.AntiXssEncoder.HtmlEncode(useDocVersion,true)%>');
            var fontsize = '<%=UofCookies.Get("FontSize") ?? "small"%>';
            var url = '../DocStore/PrintDocContent.aspx?docid=' + docid + '&manualver=' + manualver + '&fontsize=' + fontsize;
            window.open(url, "", "width = 1024, height = 768");
            return false;
        }
    </script>  

    <table id="body" style="width: 100%;height:100%" class="PopTable">
        <tr runat="server" id="tr1">
            <td style=" white-space:nowrap; width:25%;">
                <asp:Label ID="Label1" runat="server" Text="文件名稱" meta:resourcekey="Label1Resource1"></asp:Label>
            </td>
            <td colspan="3">
                <asp:Label ID="labDocName" runat="server" meta:resourcekey="labDocNameResource2"></asp:Label>
            </td>
        </tr>
        <tr runat="server" id="tr2">
            <td >
                <asp:Label ID="Label5" runat="server" meta:resourcekey="Label5Resource2" Text="目錄"></asp:Label>
            </td>
            <td colspan="3" >
                <img src="../../DMS/images/closed.gif" />
                <asp:Label ID="lblFolderName" runat="server" meta:resourcekey="lblFolderNameResource2"></asp:Label>
            </td>
        </tr>
        <tr runat="server" id="tr3">
            <td>
                <asp:Label ID="Label3" runat="server" Text="機密等級" meta:resourcekey="Label3Resource1"></asp:Label>
            </td>
            <td style=" white-space:nowrap; width:25%;">
                <asp:Label ID="lblSecret" runat="server" meta:resourcekey="lblSecretResource2"></asp:Label>
            </td>
            <td style=" white-space:nowrap; width:25%;">
                <asp:Label ID="Label6" runat="server" Text="狀態" meta:resourcekey="Label6Resource1"></asp:Label>
            </td>
            <td style=" white-space:nowrap; width:25%;">
                <asp:Label ID="lblStatus" runat="server" meta:resourcekey="lblStatusResource1"></asp:Label>
            </td>
        </tr>
        <tr  runat="server" id="tr4">
            <td id="tdDownNumTitle" runat="server">
                <asp:Label ID="Label4" runat="server" Text="下載次數" meta:resourcekey="Label4Resource1"></asp:Label>
            </td>
            <td id="tdDownNum" runat="server">
                <asp:Label ID="lblDownNum" runat="server" Font-Bold="True" Font-Size="Larger" ForeColor="Red" meta:resourcekey="lblDownNumResource2"></asp:Label>
            </td>
            <td>
                <asp:Label ID="lblViewNumTitle" runat="server" Text="觀看次數" meta:resourcekey="lblViewNumTitleResource1"></asp:Label>
            </td>
            <td runat="server" id="tdViewNum">
                <asp:Label ID="lblViewNum" runat="server" Font-Bold="True" Font-Size="Larger" ForeColor="Red" meta:resourcekey="lblViewNumResource1"></asp:Label>
            </td>
            <td runat="server" id="tdDocVersionTitle">
                <asp:Label ID="Label2" runat="server" Text="版本" meta:resourcekey="Label2Resource1"></asp:Label>
            </td>
            <td runat="server" id="tdDocVersion">
                <asp:Label ID="labDocVersion" runat="server" meta:resourcekey="labDocVersionResource2"></asp:Label>
            </td>
        </tr>
        <tr runat="server" id="trContView1">
            <td>
                <asp:Label ID="lblContPrintNumTitle" runat="server" Text="本文列印次數" meta:resourcekey="lblContPrintNumTitleResource1"></asp:Label>
            </td>
            <td>
                <asp:Label ID="lblContPrintNum" runat="server" Font-Bold="True" Font-Size="Larger" ForeColor="Red"></asp:Label>
            </td>
            <td>
                <asp:Label ID="lblAttactPrintNumTitle" runat="server" Text="附件列印次數" meta:resourcekey="lblAttactPrintNumTitleResoyrce1"></asp:Label>
            </td>
            <td>
                <asp:Label ID="lblAttactPrintNum" runat="server" Font-Bold="True" Font-Size="Larger" ForeColor="Red"></asp:Label>
            </td>
        </tr>
        <tr runat="server" id="trFileView1">
            <td>
                <asp:Label ID="lblFilePrintNumTitle" runat="server" Text="主文件列印次數" meta:resourcekey="lblFilePrintNumTitleResource1"></asp:Label>
            </td>
            <td>
                <asp:Label ID="lblFilePrintNum" runat="server" Font-Bold="True" Font-Size="Larger" ForeColor="Red"></asp:Label>
            </td>
            <td>
                <asp:Label ID="lblAttactPrintNumTitle2" runat="server" Text="附件列印次數" meta:resourcekey="lblAttactPrintNumTitleResoyrce1"></asp:Label>
            </td>
            <td>
                <asp:Label ID="lblAttactPrintNum2" runat="server" Font-Bold="True" Font-Size="Larger" ForeColor="Red"></asp:Label>
            </td>
        </tr>
        <tr runat="server" id="tr5" style="display:none">
            <td runat="server" id="tdFilePrintTitle">
                <asp:Label ID="Label10" runat="server" Text="列印次數" meta:resourcekey="lblFilePrintNumTitleResource1"></asp:Label>
            </td>
            <td runat="server" id="tdFilePrint">
                <asp:Label ID="Label12" runat="server" Font-Bold="True" Font-Size="Larger" ForeColor="Red"></asp:Label>
            </td>
            <td runat="server" id="tdPublishDateText">
                <asp:Label ID="lblPublishDateText" runat="server" Text="公佈日" meta:resourcekey="lblPublishDateTextResource1"></asp:Label>
            </td>
            <td runat="server" id="tdPublishDate">
                <asp:Label ID="lblPublishDate" runat="server" meta:resourcekey="lblPublishDateResource2"></asp:Label>
            </td>
        </tr>
        <tr runat="server" id="trFilelength">
            <td>
                <asp:Label ID="Label9" runat="server" Text="版本" meta:resourcekey="Label9Resource1"></asp:Label>
            </td>
            <td>
                <asp:Label ID="lblDocVersion" runat="server" meta:resourcekey="lblDocVersionResource1"></asp:Label>
            </td>
            <td>
                <asp:Label ID="Label8" runat="server" Text="文件大小" meta:resourcekey="Label17Resource1"></asp:Label>
            </td>
            <td colspan="3" >
                <asp:Label ID="lblFilelength" runat="server" ForeColor="Black" meta:resourcekey="lblFilelengthResource2"></asp:Label>
                <asp:Label ID="Label11" runat="server" ForeColor="Black" meta:resourcekey="Label11Resource1" Visible="False" Text="Byte"></asp:Label>
            </td>
        </tr>
        <tr runat="server" id="trSourceControl">
            <td>
                <asp:Label ID="Label13" runat="server" Text="原稿控制" meta:resourcekey="Label18Resource1"></asp:Label>
            </td>
            <td>
                <asp:Label ID="labSourceControl" runat="server" meta:resourcekey="labSourceControlResource1"></asp:Label>
            </td>
            <td>
                <asp:Label ID="lblFilePublishDateTitle" runat="server" Text="公佈日" meta:resourcekey="lblFilePublishDateTitleResource1"></asp:Label>
            </td>
            <td colspan="3">
                <asp:Label ID="lblFilePublishDate" runat="server"></asp:Label>
            </td>
        </tr>
        <tr style="text-align: left; height:100%">
            <td colspan="4" class="PopTableRightTD" style="width: 100%; text-align:left ;height:100%">
                <div style="width:100%; text-align:right; height:25px" runat="server" visible="false" id="CtrlInfoColumn">
                    <telerik:RadButton ID="rbtnCtrlInfoColumn" runat="server"  OnClientClicking="rbtnCtrlInfoColumn_Clicking"　>
                    </telerik:RadButton>
                </div> 
                <telerik:RadTabStrip ID="tabDms" runat="server" MultiPageID="tabDmsView" meta:resourcekey="RadTabStrip1Resource2">
                    <Tabs>
                        <telerik:RadTab runat="server" Value="DocContentViewer" Text="觀看本文" PageViewID="ContentViewerRadPageView" meta:resourcekey="ContentViewerRadPageViewResource1">
                        </telerik:RadTab>
                        <telerik:RadTab runat="server" Value="DocContent" Text="本文內容" PageViewID="RadPageView4" meta:resourcekey="RadTabResource6">
                        </telerik:RadTab>
                        <telerik:RadTab runat="server" Value="DocStatus" Text="狀態" PageViewID="RadPageView1" meta:resourcekey="RadTabResource7">
                        </telerik:RadTab>
                        <telerik:RadTab runat="server" Value="Remark" Text="版本備註" PageViewID="RadPageView2" meta:resourcekey="RadTabResource8">
                        </telerik:RadTab>
                        <telerik:RadTab runat="server" Value="DocRef" Text="參考文件" PageViewID="RadPageView3" meta:resourcekey="RadTabResource9">
                        </telerik:RadTab>
                         <telerik:RadTab runat="server" Value="DocIsRef" Text="被參考文件" PageViewID="RadPageView6" meta:resourcekey="RadTabResource10">
                        </telerik:RadTab>
                        <telerik:RadTab runat="server" Value="ContentFile" Text="附加檔案" PageViewID="RadPageView5" meta:resourcekey="RadTabResource11">
                        </telerik:RadTab>
                    </Tabs>
                </telerik:RadTabStrip>
                                        
                <telerik:RadMultiPage ID="tabDmsView" runat="server" SelectedIndex="0" Width="100%" Height="95%" meta:resourcekey="tabDmsViewResource2">
                    <telerik:RadPageView ID="ContentViewerRadPageView" runat="server" Height="100%" meta:resourcekey="ContentViewerRadPageViewResource">
                        <div class="divContentViewer" style="width:99%; height:99%;">
                            <uc1:UC_EdocViewer runat="server" ID="UC_EdocViewer" />
                        </div>
                    </telerik:RadPageView>
                    <telerik:RadPageView ID="RadPageView4" runat="server" Height="100%"  meta:resourcekey="RadPageView4Resource2">
                        <table style="width:95%;Height:100%;width: 100%;" class="PopTable">
                            <tr  style="height:100%;width: 100%;">
                                <td colspan="2" class="PopTableRightTD" style="text-align: left;height:100%;width: 100%;">
                                    <div class="editorcontentstyle JustAddBorder" style="overflow: auto; width: 100%; height: 100%">
                                        <asp:Label ID="lblDocContent" Width="100%" Style="word-break: break-all; word-wrap: break-word;" runat="server" Text="Label" meta:resourcekey="lblDocContentResource1"></asp:Label>
                                    </div>
                                </td>
                            </tr>
                        </table>
                    </telerik:RadPageView>
                    <telerik:RadPageView ID="RadPageView1" runat="server" meta:resourcekey="RadPageView1Resource2">
                        <asp:Panel ID="plFile" Style="width: 100%; text-align:center;" runat="server" meta:resourcekey="plFileResource2">
                            <asp:Label ID="labDlFile" runat="server" ForeColor="Black" Text="請按下載...來讀取此份文件......" meta:resourcekey="labDlFileResource1" Visible="False"></asp:Label>
                            <br />
                            <asp:Image ID="imgProcess" runat="server" meta:resourcekey="imgProcessResource2" /><br />
                            <asp:Label ID="lblNotsupportDoc" runat="server" Text="目錄設定為必須轉檔，但此檔案類型並不支援" ForeColor="Blue" Visible="False" meta:resourcekey="lblNotsupportDocResource1"></asp:Label>
                            <asp:Label ID="lblProtectMsg" runat="server" Text="此為保全文件無法線上觀看" ForeColor="Blue" Visible="False" meta:resourcekey="lblProtectMsgResource1"></asp:Label>
                            <asp:Label ID="labPDFConvertERROR" runat="server" ForeColor="Blue" Text="目前無法觀看此檔案，正在進行PDF檔案轉換，請稍待......" Visible="False" meta:resourcekey="labPDFConvertERRORResource2"></asp:Label><br />
                            <asp:Label ID="labAlert" runat="server" Text="目前無法觀看此檔案，正在進行PDF檔案轉換，請稍待......" ForeColor="Blue" Visible="False" meta:resourcekey="labAlertResource1"></asp:Label>
                            <asp:Label ID="lblShowFileHasPassword" runat="server" Text="原始檔案有設定密碼，無法轉檔" ForeColor="Blue" Visible="false" meta:resourcekey="lblShowFileHasPasswordResource1"></asp:Label>
                            <asp:Label ID="lblShowFilePageOutLimit" runat="server" ForeColor="Blue" Visible="false"></asp:Label>
                            <!--2012-5-23 ELTON, 因檔案仍在Proxy尚未傳輸到UOF, 需顯示警告訊息-->
                            <asp:Label ID="lblFileNotTransferToUof" runat="server" Text="目前檔案仍在Proxy伺服器，正由系統進行傳輸中，請稍後！" Visible="False" ForeColor="Blue" meta:resourcekey="lblFileNotTransferToUofResource2"></asp:Label>
                            <br />
                            <div style="text-align:center">
                                    <asp:Label ID="labFileError" runat="server" ForeColor="Blue" Text="發生錯誤，檔案不存在！" Visible="False" meta:resourcekey="labFileErrorResource1"></asp:Label>
                            </div>
                            <asp:Label ID="labPDFError" runat="server" ForeColor="Blue" Text="檔案目前仍在轉換處理中，請稍待幾分鐘後再試，若一直無法成功轉換，請洽系統管理員" meta:resourcekey="labPDFErrorResource1"></asp:Label><br />
                            <asp:Label ID="labWait" runat="server" ForeColor="Blue" Text="請稍待，文件下載處理中..." meta:resourcekey="labWaitResource1"></asp:Label>
                            <asp:CustomValidator ID="CustomValidator1" runat="server" Display="Dynamic" ErrorMessage="累計下載次數發生錯誤" meta:resourcekey="CustomValidator1Resource1"></asp:CustomValidator>
                            <asp:Label ID="lblDocDelete" runat="server" ForeColor="Red" Text="文件已被銷毀" Visible="False" meta:resourcekey="lblDocDeleteResource1"></asp:Label>
                        </asp:Panel>
                    </telerik:RadPageView>
                    <telerik:RadPageView ID="RadPageView2" runat="server" meta:resourcekey="RadPageView2Resource2">
                        <div style="overflow: auto; width: 100%; height: 100%">
                            <asp:Literal ID="literalComment" runat="server" meta:resourcekey="literalCommentResource2"></asp:Literal>
                        </div>
                    </telerik:RadPageView>
                    <telerik:RadPageView ID="RadPageView3" runat="server" meta:resourcekey="RadPageView3Resource2">
                       
                            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                <ContentTemplate>
                                    <Fast:Grid ID="gridDocRef" runat="server" AllowSorting="True" AutoGenerateCheckBoxColumn="False"
                                        AutoGenerateColumns="False"  DataKeyOnClientWithCheckBox="False"
                                        EnhancePager="True"   Width="100%" OnRowDataBound="gridDocRef_RowDataBound"
                                        DefaultSortDirection="Ascending" EmptyDataText="No data found"
                                        KeepSelectedRows="False" PageSize="15" meta:resourcekey="gridDocRefResource2" OnSorting="gridDocRef_Sorting">
                                        <EnhancePagerSettings ShowHeaderPager="True" />
                                        <ExportExcelSettings AllowExportToExcel="False" />
                                        <Columns>
                                            <asp:TemplateField HeaderText="狀態" SortExpression="DOC_STATUS" meta:resourcekey="TemplateFieldResource1">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblStatus_Ref" runat="server" Text='<%# Bind("DOC_STATUS") %>' meta:resourcekey="lblStatus_RefResource1"></asp:Label>
                                                </ItemTemplate>
                                                <HeaderStyle Wrap="False" HorizontalAlign="Center"  Width="7%"/>
                                                <ItemStyle Wrap="False" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="文件名稱" SortExpression="DOC_NAME" meta:resourcekey="TemplateFieldResource3">
                                                <ItemTemplate>
                                                    <table style="width:100%;">
                                                        <tr>
                                                            <td style="min-width: 16px">
                                                                <asp:Image ID="imgDocIcon" runat="server" ImageUrl="~/DMS/images/icon/unknown.gif" meta:resourcekey="imgDocIconResource2" />
                                                            </td>
                                                            <td>
                                                                <asp:LinkButton ID="labDLFile_Ref" runat="server" Text='<%# Bind("DOC_NAME") %>' meta:resourcekey="labDLFile_RefResource2"></asp:LinkButton>
                                                            <td >
                                                                <table style="width:100%;">
                                                                    <tr>
                                                                        <td style="text-align:right;">
                                                                            <asp:ImageButton ID="imgPDFViewer" CommandName="PDFViewer" CommandArgument='<%#Eval("REF_DOC_ID")+","+Eval("PUBLISH_MANUAL_VERSION") %>' Visible="false" runat="server" AlternateText="觀看文件" OnClick="imgPDFViewer_Click"/>
                                                                            <asp:Image ID="imgNoPDFViewer" runat="server" Visible="false"></asp:Image>
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                    <br />
                                                    <asp:Label ID="lblNoLend" runat="server" Text="舊版本無權限調閱" ForeColor="Red" Visible="False" meta:resourcekey="lblNoLendResource1"></asp:Label>
                                                    <asp:Label ID="lblNoView" runat="server" Text="無權限觀看" ForeColor="Red" Visible="False" meta:resourcekey="lblNoViewResource1"></asp:Label>
                                                </ItemTemplate>
                                                <HeaderStyle Width="30%" HorizontalAlign="Center" />
                                            </asp:TemplateField>
                                             <asp:TemplateField HeaderText="參考說明" meta:resourcekey="BoundFieldsResource">
                                                    <ItemTemplate>
                                                        <asp:Panel ID="plDocRefNote" runat="server" CssClass="panelHeightLimit">
                                                            <asp:Label ID="lblDocRefNote" runat="server" Text='<%#: Bind("REF_COMMENT") %>' CssClass="labelMutiline"></asp:Label>
                                                        </asp:Panel>
                                                    </ItemTemplate>
                                                <HeaderStyle Wrap="False" Width="37%"/>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="保管者" meta:resourcekey="TemplateFieldResource5">
                                                <ItemTemplate>
                                                    <uc2:UC_ChoiceList ID="UC_ChoiceList_Ref" runat="server" IsAllowEdit="false" />
                                                </ItemTemplate>
                                                <HeaderStyle Width="20%" HorizontalAlign="Center" />
                                            </asp:TemplateField>
                                            
                                        </Columns>
                                    </Fast:Grid>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                       
                    </telerik:RadPageView>
                    <telerik:RadPageView runat="server" ID="RadPageView6" meta:resourcekey="RadPageView6Resource1">
                        <div style="overflow: auto; width: 100%; height: 100%; min-height:150px">
                            <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                                <ContentTemplate>
                            <Fast:Grid ID="isRefGrid" runat="server"
                                AllowSorting="True" AutoGenerateCheckBoxColumn="False"
                                AutoGenerateColumns="False"
                                DataKeyOnClientWithCheckBox="False"
                                EnhancePager="True"
                                Width="100%"
                                 DefaultSortDirection="Ascending" EmptyDataText="No data found" KeepSelectedRows="False" PageSize="15"   OnRowDataBound="isRefGrid_RowDataBound" meta:resourcekey="isRefGridResource1" OnSorting="isRefGrid_Sorting">
                                <EnhancePagerSettings ShowHeaderPager="True"  PageInfoCssClass="" PageNumberCssClass="" PageNumberCurrentCssClass="" PageRedirectCssClass="" />
                                <ExportExcelSettings AllowExportToExcel="False" />
                                <Columns>
                                    <asp:TemplateField HeaderText="狀態" SortExpression="DOC_STATUS" meta:resourcekey="TemplateFieldResource9">
                                        <ItemTemplate>
                                            <asp:Label ID="lblStatus" runat="server" Text='<%# Bind("DOC_STATUS") %>' meta:resourcekey="lblStatusResource2"></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle Wrap="False" Width="7%"/>
                                        <ItemStyle Wrap="False" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="文件名稱" SortExpression="DOC_NAME" meta:resourcekey="TemplateFieldResource6">
                                        <ItemTemplate>
                                            <table style="width:100%;">
                                                <tr>
                                                    <td style="min-width: 16px">
                                                        <asp:Image ID="imgDocIcon1" runat="server" ImageUrl="~/DMS/images/icon/unknown.gif" meta:resourcekey="imgDocIcon1Resource1" />
                                                    </td>
                                                    <td>
                                                        <asp:LinkButton ID="lbtnIsRef" runat="server" Text='<%# Bind("DOC_NAME") %>' meta:resourcekey="lbtnIsRefResource1"></asp:LinkButton>
                                                    <td >
                                                        <table style="width:100%;">
                                                            <tr>
                                                                <td style="text-align:right;">
                                                                    <asp:ImageButton ID="imgPDFViewer" CommandName="PDFViewer" CommandArgument='<%#Eval("DOC_ID")+","+Eval("PUBLISH_MANUAL_VERSION") %>' Visible="false" runat="server" AlternateText="觀看文件"  OnClick="imgPDFViewer_Click" />
                                                                    <asp:Image ID="imgNoPDFViewer" runat="server" Visible="false"></asp:Image>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                </tr>
                                            </table>
                                            <br />
                                            <asp:Label ID="lblNoView1" runat="server" Text="無權限觀看" ForeColor="Red" Visible="False" meta:resourcekey="lblNoView1Resource1"></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle Wrap="False" Width="30%" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="被參考說明" meta:resourcekey="BoundFieldsResource1">
                                        <ItemTemplate>
                                            <asp:Panel ID="plDocRefNote" runat="server" CssClass="panelHeightLimit">
                                                <asp:Label ID="lblDocRefNote" runat="server" Text='<%#: Bind("REF_COMMENT") %>' CssClass="labelMutiline"></asp:Label>
                                            </asp:Panel>
                                        </ItemTemplate>
                                        <HeaderStyle Wrap="False" Width="36%" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="保管者" meta:resourcekey="TemplateFieldResource8">
                                        <ItemTemplate>
                                            <uc2:UC_ChoiceList runat="server" ID="UC_ChoiceList1" IsAllowEdit="false"></uc2:UC_ChoiceList>
                                        </ItemTemplate>
                                        <HeaderStyle Wrap="False" Width="20%" />
                                    </asp:TemplateField>
                                    
                                </Columns>
                            </Fast:Grid>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </div>
                    </telerik:RadPageView>
                    <telerik:RadPageView ID="RadPageView5" runat="server" meta:resourcekey="RadPageView5Resource2">                        
                        <table style="width:100%; border-top:1px solid black;">
                            <tr>
                                <td class="PopTableHeader">
                                    <div style="text-align:center;">                                        
                                        <asp:Label ID="lblDocContentAttach" runat="server" Text="附加檔案" meta:resourcekey="lblDocContentAttachResource2"></asp:Label>
                                    </div>
                                </td>
                            </tr>
                        </table>
                        <Fast:Grid ID="contentAttach" runat="server" AllowSorting="false" AutoGenerateCheckBoxColumn="false" AutoGenerateColumns="false" ShowHeader="false"
                            DataKeyOnClientWithCheckBox="false" EnhancePager="false" Width="100%" DefaultSortDirection="Ascending" EmptyDataText="No data found" 
                            KeepSelectedRows="False" PageSize="15" OnRowDataBound="contentAttach_RowDataBound" meta:resourcekey="contentAttachResource1">
                            <EnhancePagerSettings ShowHeaderPager="false" />
                            <ExportExcelSettings AllowExportToExcel="false" />
                            <Columns>
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <div style="float: left; margin-bottom: 9px; margin-right: 5px;">
                                            <asp:Image id="imgIcon" runat="server" ImageUrl='<%#:Eval("IconUrl") %>' alt="" title="" />
                                        </div>
                                        <div style="overflow:hidden; text-overflow:ellipsis; float: left; margin-bottom: 3px; margin-right: 3px;">
                                            <a id="linkFileName" runat="server" href='<%#Eval("DownloadUrl") %>' onclick='<%#Eval("TagA_OnClientClick") %>' target='_blank'><%#Eval("Name")%></a>
                                            <asp:Label ID="lblFileName" runat="server" Text='<%#Eval("Name")%>'></asp:Label>
                                            (<%#Eval("FormattedLength")%>)
                                        </div>
                                        <div>
                                            <%#Eval("UploaderNameLink")%>
                                            <div style="float: right;">
                                                <asp:ImageButton ID="imgReConvert" runat="server" ImageUrl="~/common/images/icon/icon_m222.png" Visible="false" AlternateText="重新轉檔" OnClick="imgReConvert_Click" meta:resourcekey="imgReConvertResource1" />
                                                <asp:ImageButton ID="imgAttachPDFViewer" runat="server" ImageUrl="~/common/images/icon/icon_m195.png" Visible="false"  AlternateText="觀看文件" meta:resourcekey="imgAttachPDFViewerResource1" />
                                            </div>
                                        </div>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </Fast:Grid>
                    </telerik:RadPageView>
                </telerik:RadMultiPage>
            </td>
        </tr>
    </table>
    <asp:Label ID="lblDownload" runat="server" Text="下載文件" Visible="False" meta:resourcekey="lblDownloadResource1"></asp:Label>
    <asp:Label ID="labViewerDoc" runat="server" Text="觀看文件" meta:resourcekey="Label8Resource1" Visible="False"></asp:Label>
    <asp:Label ID="lblNoUpLoad" runat="server" Text="文件還未上傳,無法下載" Visible="False" meta:resourcekey="lblNoUpLoadResource1"></asp:Label>
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
    <asp:Label ID="lblReconvert" runat="server" Text="重新轉檔" meta:resourcekey="lblReconvertResource1" Visible="False"></asp:Label>
    <asp:Label ID="labVersion" runat="server" Text="版本：" Visible="False" meta:resourcekey="labVersionResource1"></asp:Label>
    <asp:Label ID="lblEdit" runat="server" Text="資訊" Visible="False" meta:resourcekey="lblEditResource2"></asp:Label>
    <asp:Label ID="lblDraft" runat="server" Text="草稿" Visible="False" meta:resourcekey="lblDraftResource1"></asp:Label>
     <asp:Label ID="lblUpdating" runat="server" Text="改版中" Visible="False" meta:resourcekey="lblUpdatingResource1"></asp:Label>
    <asp:Label ID="lblVioding" runat="server" Text="(作廢審核中)" Visible="False" meta:resourcekey="lblViodingResource1"></asp:Label>
    <asp:Label ID="lblVisibleInfo" runat="server" Text="隱藏資訊" Visible="False" meta:resourcekey="lblVisibleInfoResource1"  ></asp:Label>
    <asp:Label ID="lblOpenInfo" runat="server" Text="顯示資訊"  Visible="False" meta:resourcekey="lblOpenInfoResource1"></asp:Label>
    <asp:Label ID="lblNoCpoy" runat="server" Text="禁止複製內容" Visible="False" meta:resourcekey="lblNoCpoyResource1"></asp:Label>
    <asp:Label ID="lblFileHasPassword" runat="server" Text="原始檔案有設定密碼，無法轉檔" Visible="false" meta:resourcekey="lblFileHasPasswordResource1"></asp:Label>
    <asp:Label ID="lblFilePageOutLimitMsg" runat="server" Text="檔案頁數{0}頁，超過可轉檔上限。" Visible="false" meta:resourcekey="lblFilePageOutLimitMsgResource1"></asp:Label>
    <asp:Label ID="lblFileInProxyMessage" runat="server" Text="檔案[{1}] 由 proxy[{0}] 同步回UOF中 (開始時間 {2})" Visible="False" meta:resourcekey="lblFileInProxyMessageResource1"></asp:Label>
    <asp:Label ID="lblPrintContent" runat="server" Text="列印本文內容" Visible="False" meta:resourcekey="lblPrintContentResource1"></asp:Label>
    <asp:Label ID="lblDocSerial" runat="server" Text="文件編號：" Visible="false" meta:resourcekey="lblDocSerialResource1"></asp:Label>
    <asp:Label ID="lblManualVersion" runat="server" Text="版本：" Visible="false" meta:resourcekey="lblManualVersionResource1"></asp:Label>
    <asp:Label ID="lblPrintUser" runat="server" Text="列印者：" Visible="false" meta:resourcekey="lblPrintUserResource1"></asp:Label>
    <asp:HiddenField ID="hfIsVisible" runat="server" />
    <asp:HiddenField ID="hfVisibleInfoTxt" runat="server" />
    <asp:HiddenField ID="hfOpenInfoTxt" runat="server" />
    <asp:HiddenField ID="hfDocVersionJS" runat="server" />
    <asp:HiddenField ID="hfisXPS" runat="server" />
    <asp:HiddenField ID="hdnFileIcons" runat="server" />
    <asp:HiddenField ID="hdnFileIconPath" runat="server" />
    <asp:HiddenField ID="hfAllowCopyContent" runat="server" />

    <a id="atag" style="display:none;">Run UDoc Viewer</a>

    <telerik:RadScriptBlock ID="RadScriptBlock1" runat="server">
        <script type="text/javascript">
            //<![CDATA[
            //ShowErrorMsg
            function ShowErrorMsg(errorMsg) {
                alert(errorMsg);
            }

            // 舊版可能會有XPS, 要先導到PdfViewerSL.aspx
            function OpenPDFViewerWithFileCenterV2(sJson, docid, docversion, contentattachid, viewtype) {
                var h = $uof.tool.printScreenSize('h', screen.availHeight);
                var w = $uof.tool.printScreenSize('w', screen.availWidth);
                var data = [$uof.tool.htmlDecode(docid), $uof.tool.htmlDecode(docversion), $uof.tool.htmlDecode(contentattachid), $uof.tool.htmlDecode(viewtype)];
                $uof.pageMethod.syncUc("DMS/DocStore/UC_DMSDoc.ascx", "StatisticsDocViewCount", data);
                $uof.window.open("PdfViewerSL.aspx?p=" + encodeURIComponent(sJson), w, h);
            }

            // 12.20後只會有UIMG
            function OpenUgViewer(sJson, docid, docversion, contentattachid, viewtype) {
                var h = $uof.tool.printScreenSize('h', screen.availHeight);
                var w = $uof.tool.printScreenSize('w', screen.availWidth);
                var data = [$uof.tool.htmlDecode(docid), $uof.tool.htmlDecode(docversion), $uof.tool.htmlDecode(contentattachid), $uof.tool.htmlDecode(viewtype)];
                $uof.pageMethod.syncUc("DMS/DocStore/UC_DMSDoc.ascx", "StatisticsDocViewCount", data);
                $uof.window.open("PdfImageViewerUG.aspx?p=" + encodeURIComponent(sJson), w, h);
            }

            // 15.0 UDocViewer
            function OpenUDocViewer(sJson, docid, docversion, status, viewtype) {
                var data = [$uof.tool.htmlDecode(docid), $uof.tool.htmlDecode(docversion), $uof.tool.htmlDecode(status), $uof.tool.htmlDecode(viewtype)];
                $uof.pageMethod.syncUc("DMS/DocStore/UC_DMSDoc.ascx", "StatisticsViewCountAddViewType", data);
                $uof.uDocViewer.open(sJson);
            }

            //檔案還在proxy同步中, 點檔案下載顯示此提示訊息
            function showProcessing(evt, proxy, name, time) {
                var radnoti = $find("<%= notification.ClientID %>");            
                var str = String.format("<%= FileInProxyMessage %>", proxy, name, time);
                radnoti.set_text(str);
                radnoti.show();
                if (window.event) { //for IE
                    window.event.cancelBubble = true;
                } else { //for Firefox
                    evt.stopPropagation();
                }
                evt.returnValue = false;
                return false;
            }

            //]]>
        </script>
    </telerik:RadScriptBlock>
</asp:Content>

