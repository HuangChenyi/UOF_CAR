<%@ Page Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="DMS_DocStore_DocInform" Title="文件資訊" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" CodeBehind="DocInform.aspx.cs" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register Src="../../Common/ChoiceCenter/UC_ChoiceList.ascx" TagName="UC_ChoiceList" TagPrefix="uc1" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Charting" TagPrefix="telerik" %>
<%@ Register Src="~/Common/ChoiceCenter/UC_ChoiceList.ascx" TagPrefix="uc2" TagName="UC_ChoiceList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
<script src="../../Common/javascript/jQuery/plugin/jquery.qrcode.min.js" id="123"></script>
    <script id="DocInformjs" type="text/javascript">
        $(function () {
        });

        Sys.Application.add_load(function () {   
        var text = '<%= System.Web.Security.AntiXss.AntiXssEncoder.HtmlEncode(hidQRcodeInfo.Value,true)%>';
                
                $('#qrcode').text("").qrcode({
                    width: 130
                    , height: 130
                    , text: $uof.tool.htmlDecode(text)
                });
            });

        function toolbarCopyLink_Click(sender, args) {
            var toolBar = sender;
            var button = args.get_item();
            var copyDescript;
            args.set_cancel(true);
            switch (button.get_value()) {
                case "CopyDocLink":

                    //----------------------------------------------------------------------
                    //2010/02/27 修正連結由@改為#
                    //2010/03/02 修正連結由@改為※ [Xing] 
                    //2013/08/14 David 改為開窗複製
                    var strlink = $("#<%=hdAppPath.ClientID%>").val() + "/DMS※" + "<%=System.Web.Security.AntiXss.AntiXssEncoder.HtmlEncode(ShortId, true) %>" + ".aspx"
                    var Type = 'folder';

                    $uof.dialog.open2("~/DMS/DocStore/DocUrlCopy.aspx", args.get_item(), "", 600, 200,
                        function (returnValue) {
                            return false;
                        }
                        , { "type": Type, "url": strlink });
                    break;
                case "CopyVerLink":
                    //    用按鈕複製超連結的方法(參考用)
                    //2010/02/27 修正連結由@改為#
                    //2010/03/02 修正連結由@改為※ [Xing]   
                    //2013/08/14 David 改為開窗複製
                    var strlink = $("#<%=hdAppPath.ClientID%>").val() + "/DMS※" + "<%=System.Web.Security.AntiXss.AntiXssEncoder.HtmlEncode(ShortIdForVer, true) %>" + ".aspx"
                    var Type = 'folder';

                    $uof.dialog.open2("~/DMS/DocStore/DocUrlCopy.aspx", args.get_item(), "", 600, 200,
                    function (returnValue) {
                        return false;
                    }
                    , { "type": Type, "url": strlink });

                    break;
            }
        }

        function docInformMenu_AfterItemSelected(oListbar, oItem, oEvent) {
            oItem.setSelected(false);
        }

        function rbarMenuOnClientItemClicked(sender, args) {
            args.get_item().set_selected(false);
            args.get_item().set_focused(false);
        }

        //========================

        function ShowError(errMessage, errWidth, errHeight) {
            //只有IE支援此方法，要用特殊PopWindow需要做特殊處理

            alert(errMessage);
        }

        function CatchError(key) {
            try {
                var docID = '<%= System.Web.Security.AntiXss.AntiXssEncoder.HtmlEncode(docID,true)%>';
                var folderID = ['<%=System.Web.Security.AntiXss.AntiXssEncoder.HtmlEncode(folderID, true) %>'];

                switch (key) {
                    // CheckIn --> 發佈
                    case "DocInPublish":
                        $uof.dialog.open2("~/DMS/DocStore/DocInPublish.aspx", "", "", 600, 400,OpenDialogResultPublish, { "docid": docID });
                        break;

                    // CheckOut --> 發佈
                    case "DocOutPublish":
                        
                        if ($('#<%=hfDocMode.ClientID%>').val() == 'FILE') 
                            $uof.dialog.open2("~/DMS/DocStore/DocOutPublish.aspx", "", "", 1024, 900, OpenDialogResultPublish, { "docid": docID });
                        else 
                            $uof.dialog.open2("~/DMS/DocStore/DocOutPublish.aspx", "", "", 1024, 900, OpenDialogResultPublish, { "docid": docID });
                        break;

                    // 取消取出
                    case "CancelCheckout":
                        if (window.confirm("<%=lblConfirmCancelcheckout.Text %>")) {

                            docVersion = $("#<%= hfDocVersionJS.ClientID%>").val();
                            var outData = [docID, docVersion];
                            var ourResult = $uof.pageMethod.sync("UndoCheckOut", outData);

                            if (ourResult == "true")
                                $(document).attr("location", $(document).attr("location"));
                            else
                                ShowError("<%=lblCancelError.Text %>", 360, 133);
                        }
                        break;

                    // 取出 Check Out
                    case "DocCheckout":
                        $uof.dialog.open2("~/DMS/DocStore/DocCheckOut.aspx", "", "", 600, 400, OpenDialogResultCheckout, { "docid": docID });
                        break;

                    // 存回
                    case "DocCheckin":
                        if ($('#<%=hfDocMode.ClientID%>').val() == 'FILE') 
                            $uof.dialog.open2("~/DMS/DocStore/DocCheckIn.aspx", "", "", 1024, 900, OpenDialogResultCheckin, { "docid": docID });
                        else 
                            $uof.dialog.open2("~/DMS/DocStore/DocCheckIn.aspx", "", "", 1024, 900, OpenDialogResultCheckin, { "docid": docID });
                    break;

                    // 銷毀
                    case "DocDelete":
                        {
                            $uof.dialog.open2("~/DMS/DocStore/DocChangeReasonByVoidAndDelete.aspx", "", "", 600, 400,
                                OpenDialogResultDelete, { "docId": docID, "folderId": folderID, "isBatch": 'False', "docChangeType": 'Delete' });
                        }         
                        break;

                    // 作廢
                    case "DocVoid":
                        {
                            $uof.dialog.open2("~/DMS/DocStore/DocChangeReasonByVoidAndDelete.aspx", "", "", 600, 400,
                                OpenDialogResultDocProperty, { "docId": docID, "folderId": folderID, "isBatch": 'False', "docChangeType": 'Void' });
                        }
                        break;

                    // 發佈記錄
                    case "DocApproveLog":                       
                        $uof.dialog.open2("~/DMS/DocStore/DocApproveHistory.aspx", "", "", 870, 768, function (returnValue) { return false; }, { "docid": docID });
                        break;

                    // 調閱記錄
                    case "DocLendLog":
                        $uof.dialog.open2("~/DMS/DocStore/DocLend/DocLendLog.aspx", "", "", 1000, 500, function (returnValue) { return false;}, { "docid": docID });
                        break;

                    // 下架
                    case "DocDisable":
                        if (window.confirm("<%=lblConfirmTempInact.Text %>")) {
                            var inactDocData = [docID];
                            var inactResult = $uof.pageMethod.sync("TempInactDoc", inactDocData);

                            if (inactResult == "true")
                                $(document).attr("location", $(document).attr("location"));
                            else
                                ShowError("<%=lblTempInactError.Text %>", 360, 133);
                        }
                        break;

                    // 上架
                    case "DocEnable":
                        if (window.confirm("<%=lblConfirmReact.Text %>")) {
                            var actDocData = [docID];
                            var docResult = $uof.pageMethod.sync("ReActDoc", actDocData);

                            if (docResult == "true")
                                $(document).attr("location", $(document).attr("location"));

                            else
                                ShowError("<%=lblReactError.Text %>", 360, 133);
                        }
                        break;

                    // 版本歷程
                    case "DocHistory":
                        var panelBar = $find("<%= rbarMenu.ClientID %>");
                        var panelItem = panelBar.findItemByValue("GrpAuthor"); 
                        var isEnabled = panelItem.get_isEnabled();
                        $uof.dialog.open2("~/DMS/DocStore/DocHistory.aspx", "", "", 1024, 768, function (returnValue) { return false; }, { "docid": docID, "isEnabled": isEnabled });
                        break;

                    // 意見評分表
                    case "DocGradeList":
                        $uof.dialog.open2("~/DMS/DocStore/DocGradeList.aspx", "", "", 490, 520, function (returnValue) { return false; }, { "docid": docID });
                        break;

                    // 文件屬性
                    case "DocProperty":
                        $uof.dialog.open2("~/DMS/DocStore/DocProperty.aspx", "", "", 1000, 900, OpenDialogResultDocProperty, { "docid": docID });
                        break;

                    // 文件權限
                    case "DocPermission":
                        $uof.dialog.open2("~/DMS/DocStore/DocPermission.aspx", "", "", 500, 500, function (returnValue) { return false; }, { "docid": docID });
                        break;

                    // 參考文件
                    case "DocRefLink":
                        $uof.dialog.open2("~/DMS/DocStore/DocRefList.aspx", "", "", 800, 500, function (returnValue) { return false; }, { "docid": docID });
                        break;

                    // 紙本管理
                    case "PaperAssignList":
                        $uof.dialog.open2("~/DMS/DocStore/PaperAssignList.aspx", "", "", 720, 560, function (returnValue) { return false; });
                        break;

                    case "ReRecognize":
                        fileID = "<%=System.Web.Security.AntiXss.AntiXssEncoder.HtmlEncode(fileID, true) %>";
                        var fileid = [fileID];
                        var value = $uof.pageMethod.sync("ReRecognizeDoc", fileid);

                        if (value == "true")
                            $(document).attr("location", $(document).attr("location"));
                        break;

                    case "RecognizeResult":
                        $uof.dialog.open2("~/DMS/DocStore/DocOCRResult.aspx", "", "", 600, 500, OpenDialogResultRecognizeResult, { "fileID": fileID });
                        break;

                    case "AuthorChangeDoc":
                    case "AdminChangeDoc":
                        var docType = $("#<%= hfDocMode.ClientID%>").val();

                        if (docType === "FILE") 
                            $uof.dialog.open2("~/DMS/DocStore/DocChange.aspx", "", "", 650, 550, function (returnValue) { return false; }, { "docid": docID });
                        else if (docType === "CONT") 
                            $uof.dialog.open2("~/DMS/DocStore/DocChange.aspx", "", "", 1024, 920, function (returnValue) { return false; }, { "docid": docID });
                        break;
                }
            }
            catch (ex) {
                alert("<%=lblDialogError.Text %>");
            }
        }
        function OpenDialogResultPublish(returnValue) {

            if (returnValue != null && typeof (returnValue) != "undefined" && returnValue != "") {

                if (returnValue == 'ok') {
                    $(document).attr("location", $(document).attr("location"));
                    return true;
                }
                else {
                    ShowError("<%=lblPublishError.Text %>", 360, 133);
                    return false;
                }
            }
            return false;
        }
        function OpenDialogResultCheckout(returnValue) {

            if (returnValue != null && typeof (returnValue) != "undefined" && returnValue != "") {

                if (returnValue == 'ok') {
                    $(document).attr("location", $(document).attr("location"));
                    return true;
                }
                else {
                    ShowError("<%=lblCheckoutError.Text %>", 360, 133);
                    return false;
                }
            }
            return false;
        }

        function OpenDialogResultCheckin(returnValue) {

            if (returnValue != null && typeof (returnValue) != "undefined" && returnValue != "") {

                if (returnValue == 'ok') {
                    $(document).attr("location", $(document).attr("location"));
                    return true;
                }
                else {
                    ShowError("<%=lblCheckinError.Text %>", 360, 133);
                    return false;
                }
            }
            return false;
        }
        function OpenDialogResultDocProperty(returnValue) {

            if (returnValue != null && typeof (returnValue) != "undefined" && returnValue != "") {

                if (returnValue == 'ok') {
                    $(document).attr("location", $(document).attr("location"));
                    return true;
                }
                return false;
            }
            return false;
        }

        function OpenDialogResultRecognizeResult(returnValue) {

            if (returnValue != null && typeof (returnValue) != "undefined" && returnValue != "") {

                if (value == "Timeout" || value == "Recognized") {
                    $(document).attr("location", $(document).attr("location"));
                    return true;
                }
            }
            return false;
        }

        function OpenDialogResultDelete(returnValue) {

            if (returnValue != null && typeof (returnValue) != "undefined" && returnValue != "") {

                if (returnValue == 'ok') {
                    $uof.dialog.close();
                    return true;
                }
                return false;
            }
            return false;
        }
    </script>

    <table border="0" cellpadding="0" cellspacing="0" style="width: 100%">
        <tr>
            <td style="width: 28%; height: 556px; vertical-align: top;">
                <br />
                &nbsp;
                <asp:Label ID="Label3" runat="server" Text="文件資訊" meta:resourcekey="Label3Resource1" CssClass="SizeXL"></asp:Label>
                <br />
                <hr />
                <table border="0" width="220px" cellpadding="0" cellspacing="0">
                    <tr>
                        <td align="right">
                            <asp:Label ID="Label7" runat="server" Text="作者：" CssClass="SizeSB" meta:resourcekey="Label7Resource1"></asp:Label></td>
                        <td align="left" style="width: 160px">
                            <asp:Label ID="lblAuthor" runat="server" meta:resourcekey="lblAuthorResource2"></asp:Label></td>
                    </tr>
                    <tr>
                        <td align="right" style="height: 17px">
                            <asp:Label ID="Label13" runat="server" Text="版本：" CssClass="SizeSB" meta:resourcekey="Label13Resource1"></asp:Label></td>
                        <td align="left" style="height: 17px">
                            <asp:Label ID="lblActualVer" runat="server" meta:resourcekey="lblActualVerResource2"></asp:Label></td>
                    </tr>
                    <tr>
                        <td align="right">
                            <asp:Label ID="Label10" runat="server" Text="狀態：" CssClass="SizeSB" meta:resourcekey="Label10Resource1"></asp:Label></td>
                        <td style="width: 150px; height: 23px;" align="left">
                            <asp:Label ID="lblStatus" runat="server" ForeColor="Red" meta:resourcekey="lblStatusResource2"></asp:Label>
                            <asp:Label ID="lblCheckOutUser" runat="server" meta:resourcekey="lblCheckOutUserResource2"></asp:Label>
                        </td>
                    </tr>

                </table>
                <table>
                    <tr>
                        <asp:Panel runat="server" ID="plQRCode" Visible="false">
                            <td >
                                <table>
                                    <tr>
                                        <td style="width: 150px; height: 23px; padding-left: 30px; display: inline;" >
                                            <asp:Label ID="lblqrInfo" runat="server" Text="文件QR Code" meta:resourcekey="lblqrInfoResource2"></asp:Label>
                                            <asp:Label ID="lblqrInfo2" runat="server" Text="(點按後可下載)" ForeColor="Blue" meta:resourcekey="lblqrInfo2Resource2"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="vertical-align: middle; padding-top: 10px; padding-left: 60px;padding-bottom:10px">
                                            <%--<div id="qrcode"></div>--%>
                                            <asp:ImageButton id="imgQRCode" runat="server" OnClick="imgQRCode_Click"></asp:ImageButton>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </asp:Panel>
                        <asp:Panel runat="server" ID="plNoqrCode" Visible="false" >
                             <td style="vertical-align: middle; padding-top: 10px; padding-bottom: 10px;"></td>
                        </asp:Panel>
                    </tr>
                    <tr>
                        <td>
                            <p>
                                <telerik:RadPanelBar runat="server" ID="rbarMenu" Width="100%" meta:resourcekey="rbarMenuResource1" OnClientItemClicked="rbarMenuOnClientItemClicked">
                                    <Items>
                                        <telerik:RadPanelItem Expanded="True" Text="作者功能" Enabled="False" Value="GrpAuthor" meta:resourcekey="RadPanelItemResource8">
                                            <Items>
                                                <telerik:RadPanelItem Value="DocOutPublish" Text="公佈" meta:resourcekey="RadPanelItemResource1" />
                                                <telerik:RadPanelItem Text="公佈" Value="DocInPublish" meta:resourcekey="RadPanelItemResource2" />
                                                <telerik:RadPanelItem Text="取消取出" Value="CancelCheckout" meta:resourcekey="RadPanelItemResource3" />
                                                <telerik:RadPanelItem Text="取出" Value="DocCheckout" meta:resourcekey="RadPanelItemResource4" />
                                                <telerik:RadPanelItem Text="存回" Value="DocCheckin" meta:resourcekey="RadPanelItemResource5" />
                                                <telerik:RadPanelItem Text="作廢" Value="DocVoid" meta:resourcekey="RadPanelItemResource10" />
                                                <telerik:RadPanelItem Text="文件屬性修改" Value="DocProperty" meta:resourcekey="RadPanelItemResource6" />
                                                <telerik:RadPanelItem Text="簡易審核歷程" Value="DocApproveLog" meta:resourcekey="RadPanelItemResource23" />
                                                <telerik:RadPanelItem Text="調閱記錄" Value="DocLendLog" meta:resourcekey="RadPanelItemResource7" />
                                                <telerik:RadPanelItem Text="辨識結果" PostBack="true" Value="RecognizeResult" meta:resourcekey="RadPanelItemResource21" />
                                                <telerik:RadPanelItem Text="重新辨識" Value="ReRecognize" meta:resourcekey="RadPanelItemResource22" />
                                                <telerik:RadPanelItem Text="文件置換" Value="AuthorChangeDoc" meta:resourcekey="RadPanelItemResource24" />
                                            </Items>
                                        </telerik:RadPanelItem>
                                        <telerik:RadPanelItem Text="目錄管理者功能" Enabled="False" Value="GrpManager" Expanded="True" meta:resourcekey="RadPanelItemResource14">
                                            <Items>
                                                <telerik:RadPanelItem Value="DocDelete" Text="銷毀" meta:resourcekey="RadPanelItemResource9" />
                                                <telerik:RadPanelItem Value="DocDisable" Text="下架" meta:resourcekey="RadPanelItemResource11" />
                                                <telerik:RadPanelItem Value="DocEnable" Text="上架" meta:resourcekey="RadPanelItemResource12" />
                                                <telerik:RadPanelItem Text="文件權限設定" Value="DocPermission" meta:resourcekey="RadPanelItemResource13" />
                                                <telerik:RadPanelItem Text="文件置換" Value="AdminChangeDoc" meta:resourcekey="RadPanelItemResource25" />
                                            </Items>
                                        </telerik:RadPanelItem>
                                        <telerik:RadPanelItem Text="讀者功能" Value="GrpReader" Expanded="True" meta:resourcekey="RadPanelItemResource18">
                                            <Items>
                                                <telerik:RadPanelItem Value="DocHistory" Text="版本歷程" meta:resourcekey="RadPanelItemResource15" />
                                                <telerik:RadPanelItem Value="DocGradeList" Text="評分意見表" meta:resourcekey="RadPanelItemResource16" />
                                                <telerik:RadPanelItem Value="DocRefLink" Text="參考文件" meta:resourcekey="RadPanelItemResource17" />
                                            </Items>
                                        </telerik:RadPanelItem>
                                    </Items>
                                    <ExpandAnimation Type="None" />
                                </telerik:RadPanelBar>
                            </p>
                        </td>
                    </tr>

                    <tr>
                        <td style="height: 300px; vertical-align: top">
                            <div style="margin-top: 12px; margin-left: 5px;">

                                <telerik:RadChart ID="ChartGrade" runat="server" Height="200px" Width="240px" OnItemDataBound="ChartGrade_ItemDataBound" AutoLayout="True" meta:resourcekey="ChartGradeResource2">
                                    <Series>
                                        <telerik:ChartSeries Name="Series 1" DataYColumn="GRADE_NUM" ActiveRegionToolTip="#Y" Type="Bar">
                                            <Appearance ShowLabels="False">
                                            </Appearance>
                                        </telerik:ChartSeries>
                                    </Series>
                                    <Legend Visible="False">
                                        <Appearance Visible="False"></Appearance>
                                    </Legend>
                                    <PlotArea>
                                        <XAxis AutoScale="False" DataLabelsColumn="ADJUSTER_GRADE" MaxValue="7" MinValue="1" Step="1">
                                        </XAxis>
                                        <YAxis AutoScale="False" MaxValue="100" MinValue="0" Step="10">
                                        </YAxis>
                                    </PlotArea>
                                    <ChartTitle>
                                        <TextBlock>
                                            <Appearance TextProperties-Font="Verdana, 8pt">
                                                <Border Visible="False" />
                                            </Appearance>
                                        </TextBlock>
                                    </ChartTitle>
                                </telerik:RadChart>

                            </div>
                        </td>
                    </tr>
                </table>
            </td>
            <td style="width: 72%; height: 556px; vertical-align: top;">
                <span style="word-break: break-all; width: 385px;">
                    <asp:Image runat="server" ID="docIcon" ImageUrl="~/DMS/images/icon/unknown.gif" meta:resourcekey="docIconResource2"></asp:Image>
                    <a style="color: Firebrick; cursor: default" href="javascript:void(0)" id="OutSideDMSDoc"><%=DocName%></a>
                </span>
                <telerik:RadToolBar ID="toolbarCopyLink" runat="server" Width="100%" OnClientButtonClicking="toolbarCopyLink_Click" meta:resourcekey="barMainResource1" SingleClick="None">
                    <Items>
                        <telerik:RadToolBarButton runat="server" Enabled="true" CheckedImageUrl="~/Common/Images/Icon/icon_m155.gif" DisabledImageUrl="~/Common/Images/Icon/icon_m155.gif" HoveredImageUrl="~/Common/Images/Icon/icon_m155.gif" ImageUrl="~/Common/Images/Icon/icon_m155.gif" Text="複製文件連結" Value="CopyDocLink" meta:resourcekey="TBarButtonResource1">
                        </telerik:RadToolBarButton>
                        <telerik:RadToolBarButton runat="server" IsSeparator="True" Value="s1" meta:resourcekey="RadToolBarButtonResource2" />
                        <telerik:RadToolBarButton runat="server" Enabled="true" CheckedImageUrl="~/Common/Images/Icon/icon_m156.gif" DisabledImageUrl="~/Common/Images/Icon/icon_m156.gif" HoveredImageUrl="~/Common/Images/Icon/icon_m156.gif" ImageUrl="~/Common/Images/Icon/icon_m156.gif" Text="複製版本連結" Value="CopyVerLink" meta:resourcekey="TBarButtonResource2">
                        </telerik:RadToolBarButton>
                    </Items>
                </telerik:RadToolBar>
                <hr />
                <table class="PopTable" cellspacing="1">
                    <colgroup style="white-space: nowrap"></colgroup>
                    <colgroup></colgroup>
                    <colgroup style="white-space: nowrap"></colgroup>
                    <colgroup></colgroup>
                    <tr>
                        <td colspan="4" style="text-align: left; background-color: White;">
                            <span style="word-break: break-all; width: 360px;">
                                <img alt="" src="../../DMS/images/open.gif" />&nbsp;
                                <asp:Label ID="labFolderPath" runat="server" meta:resourcekey="labFolderPathResource2"></asp:Label>
                            </span>
                        </td>
                    </tr>
                    <tr>
                        <td style="white-space: nowrap">
                            <asp:Label ID="Label4" runat="server" Text="文件編號" meta:resourcekey="Label4Resource1"></asp:Label></td>
                        <td colspan="3">
                            <span style="word-break: break-all; width: 220px;">&nbsp;<asp:Label ID="lblDocNum" runat="server" ForeColor="Black" meta:resourcekey="lblDocNumResource2"></asp:Label>
                            </span>
                        </td>
                    </tr>
                    <tr>
                        <td style="white-space: nowrap">
                            <asp:Label ID="Label8" runat="server" Text="文件生效日" meta:resourcekey="Label8Resource1"></asp:Label>
                        </td>
                        <td colspan="3">&nbsp;<asp:Label ID="lblActiveDay" runat="server" ForeColor="Black" meta:resourcekey="lblActiveDayResource2"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td style="white-space: nowrap">
                            <asp:Label ID="Label9" runat="server" Text="文件過期日" meta:resourcekey="Label9Resource1"></asp:Label>
                        </td>
                        <td colspan="3">&nbsp;<asp:Label ID="lblInvalidDay" runat="server" ForeColor="Black" meta:resourcekey="lblInvalidDayResource2"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td style="white-space: nowrap; height: 21px;">
                            <asp:Label ID="Label6" runat="server" Text="允許共同編輯" meta:resourcekey="Label6Resource1"></asp:Label>
                        </td>
                        <td colspan="3">&nbsp;<asp:Label ID="lblIsCommonEdit" runat="server" ForeColor="Black" meta:resourcekey="lblIsCommonEditResource2"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td style="white-space: nowrap">
                            <asp:Label ID="Label12" runat="server" Text="機密" meta:resourcekey="Label12Resource1"></asp:Label>
                        </td>
                        <td class="PopTableRightTD" colspan="3">&nbsp;<asp:Label ID="lblSecret" runat="server" ForeColor="Black" meta:resourcekey="lblSecretResource2"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td style="white-space: nowrap">
                            <asp:Label ID="Label16" runat="server" Text="建立日" meta:resourcekey="Label16Resource1"></asp:Label>
                        </td>
                        <td class="PopTableRightTD" colspan="3">&nbsp;<asp:Label ID="lblCreatetime" runat="server" ForeColor="Black" meta:resourcekey="lblCreatetimeResource2"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td style="white-space: nowrap">
                            <asp:Label ID="lblPublishDatetext" runat="server" Text="公佈日" Font-Bold="False" meta:resourcekey="lblPublishDatetextResource1"></asp:Label>
                        </td>
                        <td class="PopTableRightTD" colspan="3">&nbsp;<asp:Label ID="lblPublishDate" runat="server" ForeColor="Black" meta:resourcekey="lblPublishDateResource1"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td style="white-space: nowrap">
                            <asp:Label ID="Label17" runat="server" Text="檔案大小" meta:resourcekey="Label17Resource1"></asp:Label>
                        </td>
                        <td colspan="3">&nbsp;<asp:Label ID="lblFilelength" runat="server" ForeColor="Black" meta:resourcekey="lblFilelengthResource2"></asp:Label>
                            <asp:Label ID="Label11" runat="server" Text="Byte" ForeColor="Black" meta:resourcekey="Label11Resource1" Visible="False"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td style="white-space: nowrap">
                            <asp:Label ID="lblUrgencyText" runat="server" Text="文件速別" Font-Bold="False" meta:resourcekey="lblUrgencyTextResource1"></asp:Label>
                        </td>
                        <td colspan="3">
                            <asp:Label ID="lblUrgencyNormal" runat="server" Text="普通" Visible="False" meta:resourcekey="lblUrgencyNormalResource1"></asp:Label>
                            <asp:Label ID="lblUrgencyHigh" runat="server" Text="急" Visible="False" meta:resourcekey="lblUrgencyHighResource1"></asp:Label>
                            <asp:Label ID="lblUrgencyExHigh" runat="server" Text="緊急" Visible="False" meta:resourcekey="lblUrgencyExHighResource1"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td style="white-space: nowrap">
                            <asp:Label ID="lblChangeReason" runat="server" Text="發佈/變更原因" Font-Bold="False" meta:resourcekey="lblChangeReasonResource1"></asp:Label>
                        </td>
                        <td colspan="3">
                            <div style="overflow: auto; word-break: break-all; width: 100%;">
                                <asp:Label ID="lblChangeReasonText" runat="server" ForeColor="Black" meta:resourcekey="lblChangeReasonTextResource2"></asp:Label>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td style="white-space: nowrap">
                            <asp:Label ID="Label19" runat="server" Text="發佈/變更通知" Font-Bold="False" meta:resourcekey="Label19Resource1"></asp:Label>
                        </td>
                        <td colspan="3">
                            <asp:CheckBoxList ID="cblPublishNotice" runat="server" RepeatDirection="Horizontal" Width="400px" Enabled="false">
                                <asp:ListItem Value="publishUnit" Text="發行單位" meta:resourcekey="publishUnitResource1"></asp:ListItem>
                                <asp:ListItem Value="custodyUser" Text="保管者" meta:resourcekey="custodyUserResource1"></asp:ListItem>
                                <asp:ListItem Value="authDep" Text="權責部門" meta:resourcekey="authDepResource1"></asp:ListItem>
                                <asp:ListItem Value="suitableDep" Text="適用部門" meta:resourcekey="suitableDepResource1"></asp:ListItem>
                            </asp:CheckBoxList>
                        </td>
                    </tr>
                    <asp:Panel runat="server" ID="panelPropertyZone">
                    </asp:Panel>
                    <%--<tr id="trPropertyRow" runat="server">
                        <td colspan ="4" style="padding: 0px;">
                            <table id="PropertyTable" class="PopTable" runat="server" Style="border-style: hidden;width:100%;">
                            </table>
                        </td>
                    </tr>--%>
                    <tr>
                        <td style="height: 75px; width: 25%; white-space: nowrap">
                            <asp:Label ID="Label1" runat="server" Text="發行單位" meta:resourcekey="Label1Resource1"></asp:Label>
                        </td>
                        <td style="height: 75px; width: 25%; min-width: 150px">
                            <div style="overflow: auto; width: 100%; height: 70px">
                                <uc1:UC_ChoiceList ID="UC_ChoiceList1" runat="server" IsAllowEdit="false" />
                            </div>
                        </td>
                        <td style="height: 75px; width: 25%; white-space: nowrap">
                            <asp:Label ID="Label2" runat="server" Text="保管者" meta:resourcekey="Label2Resource1"></asp:Label>
                        </td>
                        <td style="height: 75px; width: 25%; min-width: 150px">
                            <div style="overflow: auto; width: 100%; height: 70px">
                                <uc1:UC_ChoiceList ID="UC_ChoiceList2" runat="server" IsAllowEdit="false" />
                            </div>
                        </td>
                    </tr>

                    <tr>
                        <td style="white-space: nowrap; height: 70px;">
                            <asp:Label ID="lblAuthDepText" runat="server" Text="權責部門" Font-Bold="False"
                                meta:resourcekey="lblAuthDepTextResource1"></asp:Label>
                        </td>
                        <td style="height: 70px">
                            <div style="overflow: auto; width: 100%; height: 70px">
                                <uc2:UC_ChoiceList runat="server" ID="clAuthDep" ChioceType="Group" ExpandToUser="false" />
                            </div>
                        </td>
                        <td style="white-space: nowrap; height: 70px;">
                            <asp:Label ID="lblSuitableDepText" runat="server" Text="適用部門" Font-Bold="False"
                                meta:resourcekey="lblSuitableDepTextResource1"></asp:Label>
                        </td>
                        <td style="height: 70px">
                            <div style="overflow: auto; width: 100%; height: 70px">
                                <uc1:UC_ChoiceList ID="clSuitableDep" runat="server" IsAllowEdit="false" />
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td style="white-space: nowrap; height: 95px;">
                            <asp:Label ID="Label5" runat="server" Text="文件審核者" meta:resourcekey="LabApproveResource"></asp:Label>
                        </td>
                        <td style="height: 85px" valign="middle" colspan="3">
                            <telerik:RadTabStrip ID="RadTabStrip2" runat="server" MultiPageID="RadMultiPage2" SelectedIndex="0" meta:resourcekey="RadTabStrip2Resource2">
                                <Tabs>
                                    <telerik:RadTab runat="server" Text="發佈審核" meta:resourcekey="Label15Resource1">
                                    </telerik:RadTab>
                                    <telerik:RadTab runat="server" Text="作廢審核" meta:resourcekey="TabVoidResource1">
                                    </telerik:RadTab>
                                    <telerik:RadTab runat="server" Text="銷毀審核" meta:resourcekey="TabDeleteResource1">
                                    </telerik:RadTab>
                                </Tabs>
                            </telerik:RadTabStrip>
                            <telerik:RadMultiPage ID="RadMultiPage2" runat="server" SelectedIndex="0" meta:resourcekey="RadMultiPage2Resource2">
                                <telerik:RadPageView ID="RadPageView3" runat="server" meta:resourcekey="RadPageView3Resource2" Selected="True">
                                    <asp:Label ID="labFlowType" runat="server" ForeColor="Blue" meta:resourcekey="labFlowTypeResource2"></asp:Label>
                                    <br />
                                    <telerik:RadButton ID="btnQueryFlow" runat="server" AutoPostBack="False"
                                        Text="觀看審核結果" meta:resourcekey="btnQueryFlowResource1">
                                    </telerik:RadButton>
                                    &nbsp;<br />
                                    <asp:Image ID="imgAppStatus" runat="server" meta:resourcekey="imgAppStatusResource2" />
                                    <asp:Label ID="labApproveUser" runat="server" meta:resourcekey="labApproveUserResource2"></asp:Label>
                                    <div style="overflow: auto; width: 100%; height: 70px">
                                        <uc1:UC_ChoiceList ID="UC_ChoiceList3" runat="server" IsAllowEdit="false" />
                                    </div>
                                </telerik:RadPageView>
                                <telerik:RadPageView ID="RadPageView4" runat="server" meta:resourcekey="RadPageView4Resource2">
                                    <asp:Label ID="labVoidFlowType" runat="server" ForeColor="Blue" meta:resourcekey="labVoidFlowTypeResource2"></asp:Label>
                                    <br />
                                    <telerik:RadButton ID="btnQueryVoidFlow" runat="server" AutoPostBack="False"
                                        Text="觀看審核結果" meta:resourcekey="btnQueryFlowResource1">
                                    </telerik:RadButton>
                                    &nbsp;<br />
                                    <asp:Image ID="imgVoidStatus" runat="server" meta:resourcekey="imgVoidStatusResource2" />
                                    <asp:Label ID="labVoidUser" runat="server" meta:resourcekey="labVoidUserResource2"></asp:Label>
                                    <div style="overflow: auto; width: 100%; height: 70px">
                                        <uc1:UC_ChoiceList ID="UC_ChoiceList4" runat="server" IsAllowEdit="false" />
                                    </div>
                                </telerik:RadPageView>
                                <telerik:RadPageView ID="RadPageDeleteDocView" runat="server" meta:resourcekey="RadPageDeleteDocViewResource2">
                                    <asp:Label ID="lblDeleteFlowType" runat="server" ForeColor="Blue" meta:resourcekey="lblDeleteFlowTypeResource2"></asp:Label>
                                    <br />
                                    <telerik:RadButton ID="rbtnQueryDeleteFlow" runat="server" AutoPostBack="False" Text="觀看審核結果" meta:resourcekey="rbtnQueryDeleteFlowResource1"></telerik:RadButton>
                                    &nbsp;<br />
                                    <asp:Image ID="imgDeleteStatus" runat="server" meta:resourcekey="imgDeleteStatusResource2" />
                                    <asp:Label ID="lblDeleteUser" runat="server" meta:resourcekey="lblDeleteUserResource2"></asp:Label>
                                    <div style="overflow: auto; width: 100%; height: 70px">
                                        <uc1:UC_ChoiceList ID="UC_ChoiceList5" runat="server" IsAllowEdit="false" />
                                    </div>
                                </telerik:RadPageView>
                            </telerik:RadMultiPage>
                        </td>
                    </tr>
                    <tr>
                        <td align="left" class="PopTableLeftTD" colspan="4" style="height: 95px">
                            <telerik:RadTabStrip ID="RadTabStrip1" runat="server" SelectedIndex="0" MultiPageID="RadMultiPage1" meta:resourcekey="RadTabStrip1Resource2">
                                <Tabs>
                                    <telerik:RadTab runat="server" Text="摘要" meta:resourcekey="TabResource1">
                                    </telerik:RadTab>
                                    <telerik:RadTab runat="server" Text="關鍵字" meta:resourcekey="TabResource2">
                                    </telerik:RadTab>
                                </Tabs>
                            </telerik:RadTabStrip>
                            <telerik:RadMultiPage ID="RadMultiPage1" runat="server" SelectedIndex="0" meta:resourcekey="RadMultiPage1Resource2">
                                <telerik:RadPageView ID="RadPageView1" runat="server" meta:resourcekey="RadPageView1Resource2" Selected="True">
                                    <asp:TextBox ID="txtMemo" runat="server" Height="90px" Width="100%" ReadOnly="True" TextMode="MultiLine" EnableViewState="False" meta:resourcekey="txtMemoResource2"></asp:TextBox>
                                </telerik:RadPageView>
                                <telerik:RadPageView ID="RadPageView2" runat="server" meta:resourcekey="RadPageView2Resource2">
                                    <asp:TextBox ID="txtKeyWord" runat="server" Height="90px" Width="100%" ReadOnly="True" TextMode="MultiLine" EnableViewState="False" meta:resourcekey="txtKeyWordResource2"></asp:TextBox>
                                </telerik:RadPageView>
                            </telerik:RadMultiPage>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <asp:Label ID="labChartTitle" runat="server" Text="文件評比" Visible="False" meta:resourcekey="labChartTitleResource1"></asp:Label>
    <asp:Label ID="lblPaper" runat="server" Text="紙本" Visible="False" meta:resourcekey="lblPaperResource1"></asp:Label>
    <asp:Label ID="lblFile" runat="server" Text="電子檔" Visible="False" meta:resourcekey="lblFileResource1"></asp:Label>
    <asp:Label ID="lblYes" runat="server" Text="是" Visible="False" meta:resourcekey="lblYesResource1"></asp:Label>
    <asp:Label ID="lblNo" runat="server" Text="否" Visible="False" meta:resourcekey="lblNoResource1"></asp:Label>
    <asp:Label ID="lblCheckin" runat="server" Text="已存回" Visible="False" meta:resourcekey="lblCheckinResource1"></asp:Label>
    <asp:Label ID="lblCheckOut" runat="server" Text="已取出" Visible="False" meta:resourcekey="lblCheckOutResource1"></asp:Label>
    <asp:Label ID="lblApproval" runat="server" Text="審核中" Visible="False" meta:resourcekey="lblApprovalResource1"></asp:Label>
    <asp:Label ID="lblPublish" runat="server" Text="已公佈" Visible="False" meta:resourcekey="lblPublishResource1"></asp:Label>
    <asp:Label ID="lblInactive" runat="server" Text="已失效" Visible="False" meta:resourcekey="lblInactiveResource1"></asp:Label>
    <asp:Label ID="lblVoid" runat="server" Text="已作廢" Visible="False" meta:resourcekey="lblVoidResource1"></asp:Label>
    <asp:Label ID="lblTempInact" runat="server" Text="已下架" Visible="False" meta:resourcekey="lblTempInactResource1"></asp:Label>
    <asp:Label ID="lblOldVer" runat="server" Text="舊版本" Visible="False" meta:resourcekey="lblOldVerResource1"></asp:Label>
    <asp:Label ID="lblReAct" runat="server" Text="已上架" Visible="False" meta:resourcekey="lblReActResource1"></asp:Label>
    <asp:Label ID="lblVoidApproval" runat="server" Text="已公佈(作廢審核中)" Visible="False" meta:resourcekey="lblVoidApprovalResource1"></asp:Label>
    <asp:Label ID="lblDeletingApproval" runat="server" Text="已公佈(銷毀審核中)" Visible="False" meta:resourcekey="lblDeletingApprovalResource1"></asp:Label>
    <asp:Label ID="lblDeleting" runat="server" Text="(銷毀審核中)" Visible="False" meta:resourcekey="lblDeletingResource1" ></asp:Label>
    <asp:Label ID="lblVoiding" runat="server" Text="(作廢審核中)" Visible="False" meta:resourcekey="lblVoidingResource1" ></asp:Label>  
    <asp:Label ID="lblSecretm" runat="server" Text="密" Visible="False" meta:resourcekey="lblSecretmResource1"></asp:Label>
    <asp:Label ID="lblXSecret" runat="server" Text="機密" Visible="False" meta:resourcekey="lblXSecretResource1"></asp:Label>
    <asp:Label ID="lblXXSecret" runat="server" Text="極機密" Visible="False" meta:resourcekey="lblXXSecretResource1"></asp:Label>
    <asp:Label ID="lblTopSecret" runat="server" Text="絕對機密" Visible="False" meta:resourcekey="lblTopSecretResource1"></asp:Label>
    <asp:Label ID="labDocDeny" runat="server" Text="發佈拒絕" Visible="False" meta:resourcekey="labDocDenyResource1"></asp:Label>
    <asp:Label ID="labNormal" runat="server" Text="一般" Visible="False" meta:resourcekey="labNormalResource1"></asp:Label>
    <asp:Label ID="lblPublishError" runat="server" Text="文件發佈時發生錯誤!" Visible="False" meta:resourcekey="lblPublishErrorResource1"></asp:Label>
    <asp:Label ID="lblConfirmCancelcheckout" runat="server" Text="確定要取消取出?" Visible="False" meta:resourcekey="lblConfirmCancelcheckoutResource1"></asp:Label>
    <asp:Label ID="labNoActive" runat="server" Text="未生效" Visible="False" meta:resourcekey="labNoActiveResource1"></asp:Label>
    <asp:Label ID="labDocNoApprove" runat="server" Text="文件不需審核" Visible="False" meta:resourcekey="labDocNoApproveResource"></asp:Label>
    <asp:Label ID="lblCancelError" runat="server" Text="文件取消取出發生錯誤" Visible="False" meta:resourcekey="lblCancelErrorResource1"></asp:Label>
    <asp:Label ID="lblCheckoutError" runat="server" Text="文件取出發生錯誤" Visible="False" meta:resourcekey="lblCheckoutErrorResource1"></asp:Label>
    <asp:Label ID="lblCheckinError" runat="server" Text="文件存回發生錯誤" Visible="False" meta:resourcekey="lblCheckinErrorResource1"></asp:Label>
    <asp:Label ID="lblConfirmDelete" runat="server" Text="確定要將此文件銷毀?" Visible="False" meta:resourcekey="lblConfirmDeleteResource1"></asp:Label>
    <asp:Label ID="lblDeleteError" runat="server" Text="文件銷毀時發生錯誤" Visible="False" meta:resourcekey="lblDeleteErrorResource1"></asp:Label>
    <asp:Label ID="lblConfirmVoid" runat="server" Text="確定要將此文件作廢?" Visible="False" meta:resourcekey="lblConfirmVoidResource1"></asp:Label>
    <asp:Label ID="lblVoidError" runat="server" Text="文件作廢發生錯誤" Visible="False" meta:resourcekey="lblVoidErrorResource1"></asp:Label>
    <asp:Label ID="lblConfirmTempInact" runat="server" Text="確定要將此文件暫時下架?" Visible="False" meta:resourcekey="lblConfirmTempInactResource1"></asp:Label>
    <asp:Label ID="lblTempInactError" runat="server" Text="文件下架發生錯誤" Visible="False" meta:resourcekey="lblTempInactErrorResource1"></asp:Label>
    <asp:Label ID="lblConfirmReact" runat="server" Text="確定要將此文件重新上架?" Visible="False" meta:resourcekey="lblConfirmReactResource1"></asp:Label>
    <asp:Label ID="lblReactError" runat="server" Text="文件上架發生錯誤" Visible="False" meta:resourcekey="lblReactErrorResource1"></asp:Label>
    <asp:Label ID="lblActive" runat="server" meta:resourcekey="lblActiveResource1" Text="立即生效" Visible="False"></asp:Label>
    <asp:Label ID="lblNeverOverdue" runat="server" meta:resourcekey="lblNeverOverdueResource1" Text="永不過期" Visible="False"></asp:Label>
    <asp:Label ID="lblDOCTYPE" runat="server" ForeColor="Black" Visible="False" meta:resourcekey="lblDOCTYPEResource2"></asp:Label>
    <asp:HiddenField ID="hdAppPath" runat="server" />
    <asp:Label ID="labDocStore" runat="server" meta:resourcekey="labDocStoreResource1" Text="文件庫" Visible="False"></asp:Label>
    <asp:Label ID="lblDMSStatus" runat="server" Text="簡易流程" Visible="False" meta:resourcekey="lblDMSStatusResource1"></asp:Label>
    <asp:Label ID="lblWKFStatus" runat="server" Text="電子簽核" Visible="False" meta:resourcekey="lblWKFStatusResource1"></asp:Label>
    <asp:Label ID="lblNoSendApprove" runat="server" Text="文件還未送審，無法觀看審核結果" Visible="False" meta:resourcekey="lblNoSendApproveResource1"></asp:Label>
    <asp:Label ID="lblCopyDocHref" runat="server" Text="文件連結複製完成" Visible="False" meta:resourcekey="lblCopyDocHrefResource1"></asp:Label>
    <asp:Label ID="lblCopyVerHref" runat="server" Text="文件版本連結複製完成" Visible="False" meta:resourcekey="lblCopyVerHrefResource1"></asp:Label>
    <asp:Label ID="labDocIsDelete" runat="server" Text="文件還未上傳或已被銷毀" Visible="False" meta:resourcekey="labDocIsDeleteResource1"></asp:Label>
    <asp:Label ID="lblDialogError" runat="server" Text="對話視窗被快顯封鎖，\n請關閉快顯封鎖或將網站加入允許快顯清單" Visible="False" meta:resourcekey="lblDialogErrorResource1"></asp:Label>
    <asp:Label ID="lblNoSendVoid" runat="server" Text="文件還未作廢，無法觀看審核結果" Visible="False" meta:resourcekey="lblNoSendVoidResource1"></asp:Label>
    <asp:Label ID="lblNoSendDelete" runat="server" Text="文件還未銷毀，無法觀看審核結果" Visible="False" meta:resourcekey="lblNoSendDeleteResource1"></asp:Label>
    <asp:Label ID="lblAutoSerial" runat="server" Text="＊文件自動編號" Visible="False" meta:resourcekey="lblAutoSerialResource1"></asp:Label>
    <asp:Label ID="lblUpdating" runat="server" Text="改版中" Visible="False" meta:resourcekey="lblUpdatingResource1"></asp:Label>
    <asp:Button ID="btn" runat="server" Style="display: none" meta:resourcekey="btnResource1" />
    <asp:Label ID="lblDocLink" runat="server" Text="文件連結" Style="display: none;" meta:resourcekey="lblDocLinkResource1"></asp:Label>
    <asp:Label ID="lblHistory" runat="server" Text="觀看版本歷程" Style="display: none;" meta:resourcekey="lblHistoryResource1"></asp:Label>
    <asp:Label ID="lblRef" runat="server" Text="觀看參考文件" Style="display: none;" meta:resourcekey="lblRefResource1"></asp:Label>
    <asp:Label ID="lblInfo" runat="server" Text="文件資訊" Style="display: none;" meta:resourcekey="lblInfoResource1"></asp:Label>
    <asp:Label ID="lblNoPrivilege" Visible="False" runat="server" Text="無文件觀看權限" meta:resourcekey="lblNoPrivilegeResource1"></asp:Label>
    <asp:Label ID="lblDraft" runat="server" Text="草稿" Visible="False" meta:resourcekey="lblDraftResource1"></asp:Label>
    <asp:Label ID="lblDocChangeReason" runat="server" Text="文件變更原因" Visible="False" meta:resourcekey="lblDocChangeReasonResource1"></asp:Label>

    <asp:HiddenField ID="hfDocMode" runat="server" />
    <asp:HiddenField ID="hfDocVersionJS" runat="server" />
    <asp:HiddenField ID="hfCurrentUser" runat="server" />
    <asp:HiddenField ID="hidScriptFileGroupID" runat="server" />
    <asp:HiddenField ID="hfPublishNoticeFieldValue" runat="server" />
    <asp:HiddenField ID="hidQRcodeInfo" runat="server" />
    <asp:HiddenField ID="hfQRCodeFileName" runat="server" />
</asp:Content>

