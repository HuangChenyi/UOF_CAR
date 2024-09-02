<%@ Page Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="DMS_DocStore_DocLend_DocLendAccept" Title="文件調閱" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" Codebehind="DocLendAccept.aspx.cs" %>

<%@ Register Src="../../../Common/ChoiceCenter/UC_ChoiceList.ascx" TagName="UC_ChoiceList" TagPrefix="uc1" %>
<%@ Register Src="~/Common/FileCenter/V3/UC_FileCenter.ascx" TagPrefix="uc1" TagName="UC_FileCenter" %>
<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>
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

    <script language="javascript">

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
            docversion = $uof.tool.htmlDecode($("#<%= hfDocVersionJS.ClientID%>").val());
            labPDFError = $("#<%=labPDFError.ClientID%>");
            imgProcess = $("#<%=imgProcess.ClientID%>");
            labWait = $("#<%=labWait.ClientID%>");
            labFileError = $("#<%=labFileError.ClientID%>");

            //電子公文的UC_EdocViewer，必須在父層用div限制最大寬度，否則一放大會跑版
            var contentViewerRadPageViewWidth = $("#<%=ContentViewerRadPageView.ClientID%>").width();
            $(".divContentViewer").css('maxWidth', contentViewerRadPageViewWidth);

            if (showDlbutton == "true") {
                imgProcess.hide();
                //DialogMasterPageWebImageButton1.setVisible(true);
            } else if (showDlbutton == "false") {
                //DialogMasterPageWebImageButton1.setVisible(false);     
                //如果是本文模式則不跑Timer
                if ("<%=thisDmsDoc.v_DOC_MODE %>" == 'FILE')                       
                    InitializeTimer();
            } else {
                //DialogMasterPageWebImageButton1.setVisible(false);            
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
            if (keynum == 17 || keynum == 123) { alert("<%=lblNoCpoy.Text %>"); return false; }
        }

        //2012-5-24 ELTON, add for download file by [FileCenterV2 FileControlHandler]
        function DownloadFileWithHandler(sHandlerUrl, sUserProxyIndex) {
            var data = ["<%=docid %>", $uof.tool.htmlDecode($("#<%= hfDocVersionJS.ClientID%>").val())];
            $uof.pageMethod.sync("StatisticsDocDownloadCount", data);
            //DMS_DocStore_DocLend_DocLendAccept.StatisticsDocDownloadCount("<%=docid %>","<%=docversion %>");
        	$uof.download(sHandlerUrl, sUserProxyIndex);
            return false;
        }

        function ShowProcess() {
            //labDlFile.style.visibility = "hidden";
            imgProcess.show();
            labWait.show();

            if (typeof (labPDFError) != 'undefined')
                labPDFError.hide();

            //labFileError.style.visibility = "hidden";
            return true;
        }

        function ChangeStatus(result) {
            //alert(docid);            
            if (result.value == true) {
                StopTheClock();

                //DialogMasterPageWebImageButton1.setVisible(true);    


                ////DialogMasterPageWebImageButton1.onclick= function(){ downloadFile(docid); };            
                ////DialogMasterPageWebImageButton1.onclick= function(){ vvv(); };

                var labAlert;
                labAlert = $("#<%=labAlert.ClientID%>");
                labAlert.hide();

                var imgProcess;
                imgProcess = $("#<%=imgProcess.ClientID%>");
                imgProcess.hide();

                //labDlFile.style.visibility = "visible"; 

            }
        }

        var secs;
        var timerID = null;
        var timerRunning = false;
        var delay = 150;

        function InitializeTimer() {
            secs = 5;
            StopTheClock();
            StartTheTimer();
        }

        function StopTheClock() {
            if (timerRunning) {
                clearTimeout(timerID);
            }
            timerRunning = false;
        }

        function StartTheTimer() {
            if (secs == 1) {
                StopTheClock();
                labPDFError.hide();

                var labAlert;
                labAlert = $("#<%=labAlert.ClientID%>");
                labAlert.show();

                var imgProcess;
                imgProcess = $("#<%=imgProcess.ClientID%>");
            imgProcess.attr("src", "../../images/alert.gif");

                //imgProcess.style.visibility = "hidden";                                                          
            }
            else {
                self.status = secs;
                secs = secs - 1;
                timerRunning = true;
                timerID = self.setTimeout("StartTheTimer()", delay);

                var data = [docid, docversion];
                var result = $uof.pageMethod.sync("CheckPDFFileStatus", data);

                if (result == "true") {
                    StopTheClock();

                    var labAlert;
                    labAlert = $("#<%=labAlert.ClientID%>");
                    labAlert.hide();

                    var imgProcess;
                    imgProcess = $("#<%=imgProcess.ClientID%>");
                    imgProcess.hide();
                }
            }
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
                    $('#<%= tr5.ClientID%>').hide()
                    btn.set_text($('#<%= hfOpenInfoTxt.ClientID%>').val());
                }
                else {
                    $('#<%= hfIsVisible.ClientID%>').val("True");
                    $('#<%= tr1.ClientID%>').show()
                    $('#<%= tr2.ClientID%>').show()
                    $('#<%= tr3.ClientID%>').show()
                    $('#<%= tr4.ClientID%>').show()
                    $('#<%= tr5.ClientID%>').hide()
                    btn.set_text($('#<%= hfVisibleInfoTxt.ClientID%>').val());
                }
                args.set_cancel(true);
        }

        //列印本文內容
        function PrintDocContent() {
            var docid = '<%=docid%>';
            var manualver = $uof.tool.htmlDecode('<%=System.Web.Security.AntiXss.AntiXssEncoder.HtmlEncode(useDocVersion,true)%>');
            var fontsize = '<%=UofCookies.Get("FontSize") ?? "small"%>';
            var url = '../../DocStore/PrintDocContent.aspx?docid=' + docid + '&manualver=' + manualver + '&fontsize=' + fontsize;
            window.open(url, "", "width = 1024, height = 768");
            return false;
        }
    </script>

    <table id="body"  border="1" class="PopTable" style="width: 100%; height: 100%">
        <tr runat="server" id="tr1">
                <td style="white-space: nowrap; width: 22%; ">
                    <asp:Label ID="Label1" runat="server" meta:resourcekey="Label1Resource1" Text="文件名稱："></asp:Label></td>
                <td colspan="3" style=" text-align:left;">
                    <span style="word-break: break-all; ">
                        <asp:Label ID="labDocName" runat="server" meta:resourcekey="labDocNameResource1"></asp:Label>
                    </span>
                </td>
            </tr>
        <tr runat="server" id="tr2">
                <td style="width: 22%; ">
                    <asp:Label ID="Label5" runat="server" meta:resourcekey="Label5Resource2" Text="目錄："></asp:Label></td>
                <td colspan="3" style=" text-align:left;">
                    <img src="../../images/closed.gif" />
                    <asp:Label ID="lblFolderName" runat="server" meta:resourcekey="lblFolderNameResource1"></asp:Label></td>
            </tr>
        <tr runat="server" id="tr3">
                <td  style="width: 22%; ">
                    <asp:Label ID="Label3" runat="server" meta:resourcekey="Label3Resource1" Text="機密等級："></asp:Label></td>
                <td style="width: 28%; text-align:left; ">
                    <asp:Label ID="lblSecret" runat="server" meta:resourcekey="lblSecretResource1"></asp:Label></td>
                <td style="width: 22%; ">
                    <asp:Label ID="Label6" runat="server" meta:resourcekey="Label6Resource1" Text="狀態："></asp:Label></td>
                <td style="width: 28%; text-align:left; ">
                    <asp:Label ID="lblStatus" runat="server" meta:resourcekey="lblStatusResource1"></asp:Label></td>
            </tr>
        <tr  runat="server" id="tr4">
                <td  style="width: 22%; ">
                    <asp:Label ID="Label7" runat="server" meta:resourcekey="Label18Resource1" Text="原稿控制："></asp:Label></td>
                <td style="width: 28%; text-align:left; ">
                    <asp:Label ID="labSourceControl" runat="server" meta:resourcekey="labSourceControlResource1"></asp:Label></td>
                <td  style="width: 22%; ">&nbsp;
                    <asp:Label ID="Label2" runat="server" meta:resourcekey="Label2Resource1" Text="版本："></asp:Label></td>
                <td style="width: 28%; text-align:left; ">&nbsp;<asp:Label ID="labDocVersion" runat="server" meta:resourcekey="labDocVersionResource1"></asp:Label></td>
            </tr>
        <tr runat="server" id="tr5">
                <td  style="width: 22%">
                    <asp:Label ID="Label4" runat="server" Text="調閱期限：" meta:resourcekey="Label4Resource1"></asp:Label></td>
                <td  style="width: 28%">
                    <telerik:RadDatePicker ID="dateStart" runat="server" EnableTyping="False"  meta:resourcekey="dateStartResource1" >
                    </telerik:RadDatePicker>
                </td>
                <td  style="width: 22%">
                    <asp:Label ID="Label8" runat="server" Text="至" meta:resourcekey="Label8Resource1"></asp:Label></td>
                <td style="width: 28%">
                    <telerik:RadDatePicker ID="dateEnd" runat="server" EnableTyping="False"  meta:resourcekey="dateEndResource1" >
                    </telerik:RadDatePicker>
                </td>
            </tr>
        <tr style="text-align: left; height:100%">
                <td colspan="4" class="PopTableRightTD"  style="text-align: left; vertical-align: top;height:100%">
                    <div style="width:100%; text-align:right; height:25px" runat="server" visible="false" id="CtrlInfoColumn">
                        <telerik:RadButton ID="rbtnCtrlInfoColumn" runat="server"  OnClientClicking="rbtnCtrlInfoColumn_Clicking"　></telerik:RadButton>
                    </div> 
                    <telerik:RadTabStrip ID="tabDms" runat="server" MultiPageID="tabDmsView" meta:resourcekey="tabApproveResource1">
                        <Tabs>
                            <telerik:RadTab runat="server" Value="DocContentViewer" Text="觀看本文" PageViewID="ContentViewerRadPageView" meta:resourcekey="ContentViewerRadPageViewResource1">
                            </telerik:RadTab>
                            <telerik:RadTab runat="server" Value="DocContent" Text="本文內容" PageViewID="RadPageView4" meta:resourcekey="RadTabResource1">
                            </telerik:RadTab>
                            <telerik:RadTab runat="server" Value="Approver" Text="審核者" PageViewID="RadPageView1" meta:resourcekey="TabResource1">
                            </telerik:RadTab>
                            <telerik:RadTab runat="server" Value="Reason" Text="調閱理由" PageViewID="RadPageView2" meta:resourcekey="TabResource2">
                            </telerik:RadTab>
                            <telerik:RadTab runat="server" Value="Comments" Text="審核意見" PageViewID="RadPageView3" meta:resourcekey="TabResource3">
                            </telerik:RadTab>
                            <telerik:RadTab runat="server" Value="ContentFile" Text="附加檔案" PageViewID="RadPageView5" meta:resourcekey="RadTabResource2">
                            </telerik:RadTab>
                        </Tabs>
                    </telerik:RadTabStrip>

                    <telerik:RadMultiPage ID="tabDmsView" runat="server" Width="100%" Height="90%" meta:resourcekey="RadMultiPage1Resource1">
                                                    
                        <telerik:RadPageView runat="server" ID="ContentViewerRadPageView" Height="100%" meta:resourcekey="ContentViewerRadPageViewResource">
                            <div class="divContentViewer" style="width:99%; height:99%;">
                                <uc1:UC_EdocViewer runat="server" ID="UC_EdocViewer" />
                            </div>
                        </telerik:RadPageView>

                        <telerik:RadPageView ID="RadPageView4" runat="server" Height="100%" Width="100%" meta:resourcekey="RadPageView4Resource1">
                            <table  border="1" class="PopTable" style="width: 100%;  Height:100%">
                                <tr  style="height:100%;width:100%">
                                    <td colspan="2" class="PopTableRightTD" style="text-align: left;height:100%;width:100%">
                                        <div style="overflow: auto; width: 100%; height: 100%">
                                            <asp:Label ID="lblDocContent" Width="100%" style="word-break:break-all;word-wrap:break-word;" runat="server" Text="Label" meta:resourcekey="lblDocContentResource1"></asp:Label>
                                        </div>
                                    </td>
                                </tr>
                            </table>
                        </telerik:RadPageView>

                        <telerik:RadPageView ID="RadPageView1" runat="server" meta:resourcekey="RadPageView1Resource1">
                            <asp:Label ID="labApproveResult" runat="server" meta:resourcekey="labApproveResultResource1" Text="審核結果："></asp:Label>
                            <asp:Label ID="labResult" runat="server" Style="color: Blue;" meta:resourcekey="labResultResource1"></asp:Label>
                            <br />
                            <asp:Label ID="Label11" runat="server" meta:resourcekey="Label11Resource1" Text="審核模式："></asp:Label>
                            <asp:Label ID="labFlowType" runat="server" ForeColor="Blue" meta:resourcekey="labFlowTypeResource1"></asp:Label>
                            <br />
                            <asp:Label ID="lblFinishTime" runat="server" meta:resourcekey="lblFinishTimeResource1" Text="審核時間："></asp:Label>
                            <asp:Label ID="labApproHelp" runat="server" meta:resourcekey="labApproHelpResource1"></asp:Label><br />
                            <asp:Label ID="lblUseWKFList" runat="server" Text="審核流程：" meta:resourcekey="lblUseWKFListResource1"></asp:Label>
                            <asp:DropDownList ID="ddlUseWKFList" runat="server" Enabled="False" Visible="False" Width="161px" meta:resourcekey="ddlUseWKFListResource1"></asp:DropDownList>
                            <telerik:RadButton ID="btnQueryFlow" runat="server" AutoPostBack="False" meta:resourcekey="btnQueryFlowResource1" Text="觀看流程"></telerik:RadButton>
                            &nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="lblLastApproveUser" runat="server"
                                Visible="False" meta:resourcekey="lblLastApproveUserResource1"></asp:Label>
                            <br />
                            <center>
                                <br />
                                <asp:Image ID="imgProcess" runat="server" meta:resourcekey="imgProcessResource1" />
                                <br />
                                <asp:Label ID="labWait" runat="server" ForeColor="Blue"
                                    meta:resourcekey="labWaitResource1" Text="請稍待，文件下載處理中..."></asp:Label>
                                <asp:Label ID="labPDFConvertERROR" runat="server" ForeColor="Blue" meta:resourcekey="labPDFConvertERRORResource"
                                    Text="發生錯誤，轉換PDF失敗！" Visible="False"></asp:Label>
                                <asp:Label ID="labAlert" runat="server" ForeColor="Blue" meta:resourcekey="labAlertResource1" Text="目前無法觀看此檔案，正在進行PDF檔案轉換，請稍待......"
                                    Visible="False"></asp:Label>
                                <asp:Label ID="lblShowNotsupportDoc" runat="server" Text="目錄設定為必須轉檔，但此檔案類型並不支援" ForeColor="Blue" meta:resourcekey="lblShowNotsupportDocResource1" Visible="False"></asp:Label>
                                <asp:Label ID="lblShowFileHasPassword" runat="server" Text="原始檔案有設定密碼，無法轉檔" ForeColor="Blue" Visible="false" meta:resourcekey="lblShowFileHasPasswordResource1"></asp:Label>
                                <asp:Label ID="lblShowFilePageOutLimit" runat="server" ForeColor="Blue" Visible="false"></asp:Label>
                                <!--2012-5-23 ELTON, 因檔案仍在Proxy尚未傳輸到UOF, 需顯示警告訊息-->
                                <asp:Label ID="lblFileNotTransferToUof" runat="server" Text="目前檔案仍在Proxy伺服器，正由系統進行傳輸中，請稍後！" Visible="False" ForeColor="Blue" meta:resourcekey="lblFileNotTransferToUofResource1"></asp:Label>

                                <asp:Label ID="labFileError" runat="server" ForeColor="Blue"
                                    meta:resourcekey="labFileErrorResource1" Text="發生錯誤，檔案不存在！" Visible="False"></asp:Label>
                                <asp:Label ID="labPDFError" runat="server" ForeColor="Blue" meta:resourcekey="labPDFErrorResource1"
                                    Text="檔案目前仍在轉換處理中，請稍待幾分鐘後再試，若一直無法成功轉換，請洽系統管理員"></asp:Label>
                                <asp:CustomValidator ID="CustomValidator1" runat="server" Display="Dynamic" ErrorMessage="累計下載次數發生錯誤"
                                    meta:resourcekey="CustomValidator1Resource1"></asp:CustomValidator>
                                <asp:Label ID="lblDocDelete" runat="server" ForeColor="Red" Text="文件已被銷毀" Visible="False" meta:resourcekey="lblDocDeleteResource1"></asp:Label></center>
                        </telerik:RadPageView>
                        <telerik:RadPageView ID="RadPageView2" runat="server" meta:resourcekey="RadPageView2Resource1">
                            <asp:TextBox ID="txtLendReason" runat="server" Height="100%"
                                        ReadOnly="True" TextMode="MultiLine" Width="100%" meta:resourcekey="txtLendReasonResource1">
                            </asp:TextBox>
                        </telerik:RadPageView>
                        <telerik:RadPageView ID="RadPageView3" runat="server" meta:resourcekey="RadPageView3Resource1">
                            <asp:TextBox ID="txtApproveComment" runat="server" Height="100%"
                                        ReadOnly="True" TextMode="MultiLine" Width="100%" meta:resourcekey="txtApproveCommentResource1">
                            </asp:TextBox>
                        </telerik:RadPageView>
                        <telerik:RadPageView ID="RadPageView5" runat="server" meta:resourcekey="RadPageView5Resource1">
                            <table style="width:100%; border-top:1px solid black;">
                                <tr>
                                    <td class="PopTableHeader">
                                        <div style="text-align:center;">                                                                                    
                                            <asp:Label ID="lblDocContentAttach" runat="server" Text="附加檔案" meta:resourcekey="lblDocContentAttachResource1" ></asp:Label>
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
                                                    <asp:ImageButton ID="imgAttachPDFViewer" runat="server" ImageUrl="~/common/images/icon/icon_m195.png" Visible="false" AlternateText="觀看文件" meta:resourcekey="imgAttachPDFViewerResource1" />
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

    <asp:Label ID="lblDownload" runat="server" meta:resourcekey="lblDownloadResource1" Text="下載文件" Visible="False"></asp:Label>
    <asp:Label ID="labViewerDoc" runat="server" meta:resourcekey="labViewerDocResource1" Text="觀看文件" Visible="False"></asp:Label>
    <asp:Label ID="labAppProce" runat="server" Text="審核流程" Visible="False" meta:resourcekey="labAppProceResource1"></asp:Label>
    <asp:Label ID="labDocStore" runat="server" meta:resourcekey="labDocStoreResource1" Text="文件庫" Visible="False"></asp:Label>
    <asp:Label ID="lblSecretm" runat="server" meta:resourcekey="lblSecretmResource1" Text="密" Visible="False"></asp:Label>
    <asp:Label ID="lblXSecret" runat="server" meta:resourcekey="lblXSecretResource1" Text="機密" Visible="False"></asp:Label>
    <asp:Label ID="lblXXSecret" runat="server" meta:resourcekey="lblXXSecretResource1" Text="極機密" Visible="False"></asp:Label>
    <asp:Label ID="lblTopSecret" runat="server" meta:resourcekey="lblTopSecretResource1" Text="絕對機密" Visible="False"></asp:Label>
    <asp:Label ID="lblNormal" runat="server" meta:resourcekey="lblNormalResource1" Text="一般" Visible="False"></asp:Label>
    <asp:Label ID="lblCheckin" runat="server" meta:resourcekey="lblCheckinResource1" Text="已存回" Visible="False"></asp:Label>
    <asp:Label ID="lblCheckOut" runat="server" meta:resourcekey="lblCheckOutResource1" Text="已取出" Visible="False"></asp:Label>
    <asp:Label ID="lblApproval" runat="server" meta:resourcekey="lblApprovalResource1" Text="審核中" Visible="False"></asp:Label>
    <asp:Label ID="lblPublish" runat="server" meta:resourcekey="lblPublishResource1" Text="已公佈" Visible="False"></asp:Label>
    <asp:Label ID="lblInactive" runat="server" meta:resourcekey="lblInactiveResource1" Text="已失效" Visible="False"></asp:Label>
    <asp:Label ID="lblVoid" runat="server" meta:resourcekey="lblVoidResource1" Text="已作廢" Visible="False"></asp:Label>
    <asp:Label ID="lblTempInact" runat="server" meta:resourcekey="lblTempInactResource1" Text="已下架" Visible="False"></asp:Label>
    <asp:Label ID="lblOldVer" runat="server" meta:resourcekey="lblOldVerResource1" Text="舊版本" Visible="False"></asp:Label>
    <asp:Label ID="lblReAct" runat="server" meta:resourcekey="lblReActResource1" Text="已上架" Visible="False"></asp:Label>
    <asp:Label ID="labDocDeny" runat="server" meta:resourcekey="labDocDenyResource1" Text="發佈拒絕" Visible="False"></asp:Label>
    <asp:Label ID="labNoActive" runat="server" meta:resourcekey="labNoActiveResource1" Text="未生效" Visible="False"></asp:Label>
    <asp:Label ID="labYes" runat="server" meta:resourcekey="labYesResource1" Text="是" Visible="False"></asp:Label>
    <asp:Label ID="labNo" runat="server" meta:resourcekey="labNoResource1" Text="否" Visible="False"></asp:Label>
    <asp:Label ID="lblAccept" runat="server" meta:resourcekey="lblAcceptResource1" Text="允許調閱" Visible="False"></asp:Label>
    <asp:Label ID="lblDeny" runat="server" meta:resourcekey="lblDenyResource1" Text="拒絕調閱" Visible="False"></asp:Label>
    <asp:Label ID="lblLastApprove" runat="server" meta:resourcekey="lblLastApproveResource1" Text="審核者：" Visible="False"></asp:Label>
    <asp:Label ID="labUseDef" runat="server" meta:resourcekey="labUseDefResource1" Text="簡易審核" Visible="False"></asp:Label>
    <asp:Label ID="labWKF" runat="server" meta:resourcekey="labWKFResource1" Text="電子簽核" Visible="False"></asp:Label>
    <asp:Label ID="labDocNoApprove" runat="server" Text="文件不需審核" Visible="False" meta:resourcekey="labDocNoApproveResource"></asp:Label>
    <asp:Label ID="lblDeleteLend" runat="server" Text="調閱資料已被刪除，請重新申請調閱" Visible="False" meta:resourcekey="lblDeleteLendResource"></asp:Label>
    <asp:Label ID="labDocIsDelete" runat="server" Text="文件已被銷毀" Visible="False" meta:resourcekey="labDocIsDeleteResource1"></asp:Label>
    <asp:Label ID="lblNoLend" runat="server" Text="此文件目前不允許調閱" Visible="False" meta:resourcekey="lblNoLendResource1"></asp:Label>
    <asp:Label ID="lblUpdating" runat="server" Text="改版中" Visible="False" meta:resourcekey="lblUpdatingResource1"></asp:Label>
    <asp:Label ID="lblVioding" runat="server" Text="(作廢審核中)" Visible="False" meta:resourcekey="lblViodingResource1"></asp:Label>
    <asp:Label ID="lblPrintContent" runat="server" Text="列印本文內容" Visible="False" meta:resourcekey="lblPrintContentResource1" ></asp:Label>
    <asp:Label ID="lblVisibleInfo" runat="server" Text="隱藏資訊" Visible="False" meta:resourcekey="lblVisibleInfoResource1"  ></asp:Label>
    <asp:Label ID="lblOpenInfo" runat="server" Text="顯示資訊"  Visible="False" meta:resourcekey="lblOpenInfoResource1" ></asp:Label>
    <asp:Label ID="lblNoCpoy" runat="server" Text="禁止複製內容" Visible="False" meta:resourcekey="lblNoCpoyResource1"></asp:Label>
    <asp:Label ID="lblFileHasPassword" runat="server" Text="原始檔案有設定密碼，無法轉檔" Visible="false" meta:resourcekey="lblFileHasPasswordResource1"></asp:Label>
    <asp:Label ID="lblFilePageOutLimitMsg" runat="server" Text="檔案頁數{0}頁，超過可轉檔上限。" Visible="false" meta:resourcekey="lblFilePageOutLimitMsgResource1"></asp:Label>
    <asp:Label ID="lblFileInProxyMessage" runat="server" Text="檔案[{1}] 由 proxy[{0}] 同步回UOF中 (開始時間 {2})" Visible="False" meta:resourcekey="lblFileInProxyMessageResource1"></asp:Label>
    <asp:Label ID="lblProtectMsg" runat="server" Text="此為保全文件無法線上觀看" ForeColor="Blue" meta:resourcekey="lblProtectMsgResource1" Visible="False"></asp:Label>
    <asp:Label ID="lblNotsupportDoc" runat="server" Text="目錄設定為必須轉檔，但此檔案類型並不支援" ForeColor="Blue" meta:resourcekey="lblNotsupportDocResource1" Visible="False"></asp:Label>
    <asp:Label ID="lblWaitForLendStart" runat="server" Text="(請等到調閱期限內再觀看文件)" ForeColor="Blue" Visible="false" meta:resourcekey="lblWaitForLendStartResource1"></asp:Label>
    <asp:Label ID="lblDocSerial" runat="server" Text="文件編號：" Visible="false" meta:resourcekey="lblDocSerialResource1"></asp:Label>
    <asp:Label ID="lblManualVersion" runat="server" Text="版本：" Visible="false" meta:resourcekey="lblManualVersionResource1"></asp:Label>
    <asp:Label ID="lblPrintUser" runat="server" Text="列印者：" Visible="false" meta:resourcekey="lblPrintUserResource1"></asp:Label>
    <asp:HiddenField ID="hfIsVisible" runat="server" />
    <asp:HiddenField ID="hfVisibleInfoTxt" runat="server" />
    <asp:HiddenField ID="hfOpenInfoTxt" runat="server" />
    <asp:HiddenField ID="hfDocVersionJS" runat="server" />
    <asp:HiddenField ID="hfAllowCopyContent" runat="server" />
    <asp:HiddenField ID="hdnFileIcons" runat="server" />
    <asp:HiddenField ID="hdnFileIconPath" runat="server" />
    <asp:HiddenField ID="HiddenField1" runat="server" />

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
                $uof.window.open("../PdfViewerSL.aspx?p=" + encodeURIComponent(sJson), w, h);
            }

            // 12.20後只會有UIMG
            function OpenUgViewer(sJson, docid, docversion, contentattachid, viewtype) {
                var h = $uof.tool.printScreenSize('h', screen.availHeight);
                var w = $uof.tool.printScreenSize('w', screen.availWidth);
                var data = [$uof.tool.htmlDecode(docid), $uof.tool.htmlDecode(docversion), $uof.tool.htmlDecode(contentattachid), $uof.tool.htmlDecode(viewtype)];
                $uof.pageMethod.syncUc("DMS/DocStore/UC_DMSDoc.ascx", "StatisticsDocViewCount", data);
                $uof.window.open("../PdfImageViewerUG.aspx?p=" + encodeURIComponent(sJson), w, h);
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
