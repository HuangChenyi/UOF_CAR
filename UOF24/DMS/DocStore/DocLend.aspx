<%@ Page Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="DMS_DocStore_DocLend" Title="文件調閱" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" Codebehind="DocLend.aspx.cs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <script type="text/javascript">

        var oWnd = $uof.dialog.getCurrentWindow();
        oWnd.set_height(700);
        Ownd.center();

        function ConfirmLend() {
            var datePicker1 = $find("<%= RadDatePicker1.ClientID %>");
            var datePicker2 = $find("<%= RadDatePicker2.ClientID %>");
            var Start = new Date(datePicker1.get_dateInput().get_value() + " 00:00");
            var End = new Date(datePicker2.get_dateInput().get_value() + " 23:59");

            if (Start > End) {
                alert('<%=labLendStartError.Text %>');
                return false;
            }

            var data = [];
            var now = $uof.pageMethod.sync("GetServerDate", data);

            if (End < new Date(now)) {
                alert('<%=labLendEndError.Text %>');
            return false;
        }

        try {
            var txtReason = $("#<%=txtReason.ClientID %>");

            if (txtReason.val().trim() == "") {
                alert('<%=labKeyReason.Text %>');
                txtReason.focus();
                return false;
            }
            else {
                var FormVersionId = $("#<%=hdFormId.ClientID %>").val();
                var Start = datePicker1.get_selectedDate().format("yyyy/MM/dd HH:mm");
                var End = datePicker2.get_selectedDate().format("yyyy/MM/dd HH:mm");
                var docId = '<%=System.Web.Security.AntiXss.AntiXssEncoder.HtmlEncode(docId, true) %>';
                var DocName = $("#<%=labDocName.ClientID %>").text();
                var SecretRank = '<%=System.Web.Security.AntiXss.AntiXssEncoder.HtmlEncode(SecretRank, true) %>';
                var DocAuthor = '<%=System.Web.Security.AntiXss.AntiXssEncoder.HtmlEncode(DocAuthor, true) %>';
                var Status = '<%=System.Web.Security.AntiXss.AntiXssEncoder.HtmlEncode(status, true) %>';
                var Reason = $("#<%=txtReason.ClientID %>").val();
                var DocSerial = $("#<%=hdDocSerial.ClientID %>").val();
                var userGuid = $('#<%=this.hdUserGuid.ClientID %>').val();

                if (FormVersionId != "") {
                    var lenddata = [$uof.tool.htmlDecode(docId), userGuid];
                    if ($uof.pageMethod.sync("CheckCanLend", lenddata) == "0") {
                        var gettaskdata = [FormVersionId, Start, End, $uof.tool.htmlDecode(docId), DocName, $uof.tool.htmlDecode(DocAuthor), Reason, DocSerial, userGuid, "<%=lblDocLink.Text%>", "<%=lblInfo.Text%>"];

                        var taskid = $uof.pageMethod.sync("GetTaskID", gettaskdata);

                        var FormID = "DMSLend";
                        $uof.dialog.open2("~/WKF/ExternalModule/ExternalFormScript.aspx", this, "", 0, 0, OpenDialogResult, { "scriptId": taskid, "formId": FormID, "formVersionId": FormVersionId });
                        return false;

                    }
                    else {
                        alert('<%=lblIsNotLend.Text %>');
                    }
                }

            }
        }
        catch (e) {
            alert("error");
            return false;
        }

    }
    function OpenDialogResult(returnValue) {
        if (typeof (returnValue) == 'undefined' || returnValue == null || returnValue == "NeedPostBack")
            return false;
        else
            return true;
    }
    </script>
    
    <telerik:RadTabStrip ID="tabDMSLend" MultiPageID="tabDMSLendView" runat="server" BackColor="White" Width="100%" meta:resourcekey="tabDMSLendResource1" SelectedIndex="0" >
        <Tabs>
            <telerik:RadTab runat="server" Value="DocInformation" Text="文件資訊" PageViewID="DocInformationRadPageView" Selected="true"
                meta:resourcekey="DocInformationRadPageViewResource1">
            </telerik:RadTab>
            <telerik:RadTab runat="server" Value="DocCustomProperty" Text="自訂屬性" PageViewID="DocCustomPropertyRadPageView" 
                meta:resourcekey="DocCustomPropertyRadPageViewResource1">
            </telerik:RadTab>
        </Tabs>
    </telerik:RadTabStrip>

    <telerik:RadMultiPage ID="tabDMSLendView" runat="server" BackColor="White" Width="100%" meta:resourcekey="tabDMSLendViewResource1" SelectedIndex="0" >
        <telerik:RadPageView runat="server" ID="DocInformationRadPageView" Selected="True" meta:resourcekey="DocInformationRadPageViewResource2" >
            <table class="PopTable" style="width: 100%;" >
                <tr>
                    <td style=" white-space:nowrap;">
                        <asp:Label ID="Label1" runat="server" meta:resourcekey="Label1Resource1" Text="文件名稱"></asp:Label>
                    </td>
                    <td colspan="3" style="">
                        <span style="width: 350px;">
                            <asp:Label ID="labDocName" runat="server" meta:resourcekey="labDocNameResource2"></asp:Label>
                        </span>
                    </td>
                </tr>
                <tr>
                    <td style=" white-space:nowrap;">
                        <asp:Label ID="Label5" runat="server" meta:resourcekey="Label5Resource2" Text="目錄"></asp:Label>
                    </td>
                    <td colspan="3" style="">
                        <img src="../../DMS/images/closed.gif" />
                        <asp:Label ID="lblFolderName" runat="server" meta:resourcekey="lblFolderNameResource2"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="PopTableLeftTD" style=" white-space:nowrap; width:15%;">
                        <asp:Label ID="lblDocSerialTitle" runat="server" Text="文件編號" meta:resourcekey="lblDocSerialTitleResource1" ></asp:Label>
                    </td>
                    <td class="PopTableRightTD" style=" white-space:nowrap; width:30%;">
                        <asp:Label ID="lblDocSerial" runat="server" meta:resourcekey="lblDocSerialResource1" ></asp:Label>
                    </td>
                    <td class="PopTableLeftTD" style=" white-space:nowrap; width:15%;">
                        <asp:Label ID="lblPublishDateTitle" runat="server" Text="公佈日" meta:resourcekey="lblPublishDateTitleResource1" ></asp:Label>                        
                    </td>
                    <td class="PopTableRightTD" style=" white-space:nowrap; width:30%;">
                        <asp:Label ID="lblPublishDate" runat="server" meta:resourcekey="lblPublishDateResource1"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="PopTableLeftTD" style=" white-space:nowrap; width:15%;">
                        <asp:Label ID="Label3" runat="server" meta:resourcekey="Label3Resource1" Text="機密等級"></asp:Label>
                    </td>
                    <td class="PopTableRightTD" style=" white-space:nowrap; width:30%;">
                        <asp:Label ID="lblSecret" runat="server" meta:resourcekey="lblSecretResource2"></asp:Label>
                    </td>
                    <td class="PopTableLeftTD" style=" white-space:nowrap; width:15%;">
                        <asp:Label ID="Label6" runat="server" meta:resourcekey="Label6Resource1" Text="狀態"></asp:Label>
                    </td>
                    <td class="PopTableRightTD" style=" white-space:nowrap; width:30%;">
                        <asp:Label ID="lblStatus" runat="server" meta:resourcekey="lblStatusResource2"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="PopTableLeftTD" style=" white-space:nowrap; width:15%;">
                        <asp:Label ID="Label7" runat="server" meta:resourcekey="Label18Resource1" Text="原稿控制"></asp:Label>
                    </td>
                    <td class="PopTableRightTD" style=" white-space:nowrap; width:30%;">
                        <asp:Label ID="labSourceControl" runat="server" Text="Label" meta:resourcekey="labSourceControlResource1"></asp:Label>
                    </td>
                    <td class="PopTableLeftTD" style=" white-space:nowrap; width:15%;">
                        <asp:Label ID="Label2" runat="server" meta:resourcekey="Label2Resource1" Text="版本"></asp:Label>
                    </td>
                    <td class="PopTableRightTD" style=" white-space:nowrap; width:30%;">
                        <asp:Label ID="labDocVersion" runat="server" meta:resourcekey="labDocVersionResource2"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td style=" white-space:nowrap; vertical-align:middle;">
                        <asp:Label ID="lblSummaryTitle" runat="server" meta:resourcekey="lblSummryTitleResource1" Text="摘要"></asp:Label>
                    </td>
                    <td colspan="3">
                        <asp:TextBox ID="lblSummary" runat="server" Height="90px" Width="100%" ReadOnly="True" TextMode="MultiLine" meta:resourcekey="lblSummaryResource1" ></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td style=" white-space:nowrap; vertical-align:middle;">
                        <asp:Label ID="lblKeywordTitle" runat="server" meta:resourcekey="lblKeywordTitleResource1" Text="關鍵字"></asp:Label>
                    </td>
                    <td colspan="3">
                        <asp:TextBox ID="lblKeyword" runat="server" Height="90px" Width="100%" ReadOnly="True" TextMode="MultiLine" meta:resourcekey="lblKeywordResource1" ></asp:TextBox>
                    </td>
                </tr>
            </table>
        </telerik:RadPageView>
                    
        <telerik:RadPageView runat="server" ID="DocCustomPropertyRadPageView" meta:resourcekey="DocCustomPropertyRadPageViewResource2" >
            <table class="PopTable" >
                <asp:Panel runat="server" ID="panelPropertyZone" meta:resourcekey="panelPropertyZoneResource1" ></asp:Panel>
            </table>
        </telerik:RadPageView>

    </telerik:RadMultiPage>

    <%-- 調閱申請->調閱期限+調閱理由 --%>
    <table class="PopTable">
        <tr>
            <td class="PopTableHeader" colspan="4">
                <div style=" text-align:center;">
                    <asp:Label ID="lblLendApplyTitle" runat="server" Text="調閱申請" meta:resourcekey="lblLendApplyTitleResource1"></asp:Label>
                </div>
            </td>            
        </tr>
        <tr>
            <td style=" white-space:nowrap;">
                <asp:Label ID="Label4" runat="server" Text="調閱期限" meta:resourcekey="Label4Resource1"></asp:Label>
            </td>
            <td style=" white-space:nowrap;" colspan="3">
                <telerik:RadDatePicker ID="RadDatePicker1" runat="server"  meta:resourcekey="RadDatePicker1Resource2">
<Calendar UseRowHeadersAsSelectors="False" UseColumnHeadersAsSelectors="False" EnableWeekends="True" Culture="zh-TW" FastNavigationNextText="&amp;lt;&amp;lt;"></Calendar>

<DateInput DisplayDateFormat="yyyy/M/d" DateFormat="yyyy/M/d" LabelWidth="64px" Width="">
<EmptyMessageStyle Resize="None"></EmptyMessageStyle>

<ReadOnlyStyle Resize="None"></ReadOnlyStyle>

<FocusedStyle Resize="None"></FocusedStyle>

<DisabledStyle Resize="None"></DisabledStyle>

<InvalidStyle Resize="None"></InvalidStyle>

<HoveredStyle Resize="None"></HoveredStyle>

<EnabledStyle Resize="None"></EnabledStyle>
</DateInput>

<DatePopupButton ImageUrl="" HoverImageUrl="" CssClass=""></DatePopupButton>
                </telerik:RadDatePicker>
                <asp:Label ID="Label8" runat="server" Text="~" meta:resourcekey="Label8Resource1"></asp:Label>
                <telerik:RadDatePicker ID="RadDatePicker2" runat="server"  meta:resourcekey="RadDatePicker2Resource2">
<Calendar UseRowHeadersAsSelectors="False" UseColumnHeadersAsSelectors="False" EnableWeekends="True" Culture="zh-TW" FastNavigationNextText="&amp;lt;&amp;lt;"></Calendar>

<DateInput DisplayDateFormat="yyyy/M/d" DateFormat="yyyy/M/d" LabelWidth="64px" Width="">
<EmptyMessageStyle Resize="None"></EmptyMessageStyle>

<ReadOnlyStyle Resize="None"></ReadOnlyStyle>

<FocusedStyle Resize="None"></FocusedStyle>

<DisabledStyle Resize="None"></DisabledStyle>

<InvalidStyle Resize="None"></InvalidStyle>

<HoveredStyle Resize="None"></HoveredStyle>

<EnabledStyle Resize="None"></EnabledStyle>
</DateInput>

<DatePopupButton ImageUrl="" HoverImageUrl="" CssClass=""></DatePopupButton>
                </telerik:RadDatePicker>
            </td>
        </tr>
        <tr align="center">
            <td>
                <asp:Label ID="Label9" runat="server" Text="調閱理由" meta:resourcekey="Label9Resource1"></asp:Label>
            </td>
            <td align="center" class="PopTableRightTD" colspan="4" style="text-align: center;" valign="middle">
                <asp:TextBox ID="txtReason" runat="server" Height="80px" TextMode="MultiLine" Width="100%" meta:resourcekey="txtReasonResource2"></asp:TextBox>
                <asp:Label ID="lblIsNotLend" runat="server" ForeColor="Red" Text="此文件不可調閱" Visible="False" meta:resourcekey="lblIsNotLendResource1"></asp:Label>
                <asp:Label ID="lblDCSerror" runat="server" ForeColor="Red" Text="此文件轉檔失敗不可調閱" Visible="False" meta:resourcekey="lblDCSerrorResource1"></asp:Label>
            </td>
        </tr>
    </table>
   
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
    <asp:HiddenField ID="hdFormId" runat="server" />
    <asp:HiddenField ID="hdFlowType" runat="server" />
    <asp:HiddenField ID="hdDocSerial" runat="server" />
    <asp:Label ID="labLendText" runat="server" Text="調閱申請" Visible="False" meta:resourcekey="labLendTextResource1"></asp:Label>
    <asp:Label ID="labLendDateError" runat="server" Text="調閱日期設定錯誤!" Visible="False" meta:resourcekey="labLendDateErrorResource1"></asp:Label>
    <asp:Label ID="labKeyReason" runat="server" Text="請先填寫調閱理由" Visible="False" meta:resourcekey="labKeyReasonResource1"></asp:Label>
    <asp:Label ID="labLendStartError" runat="server" Text="起始日期請勿晚於結束日期" Visible="False" meta:resourcekey="labLendStartErrorResource1"></asp:Label>
    <asp:Label ID="labLendEndError" runat="server" Text="結束日期請勿早於今天" Visible="False" meta:resourcekey="labLendEndErrorResource1"></asp:Label>
    <asp:Label ID="labDocIsDelete" runat="server" Text="文件已被銷毀" Visible="False" meta:resourcekey="labDocIsDeleteResource1"></asp:Label>
    <asp:HiddenField ID="hdUserGuid" runat="server" />
    <asp:Label ID="lblUpdating" runat="server" Text="改版中" Visible="False" meta:resourcekey="lblUpdatingResource1"></asp:Label>
    <asp:Label ID="lblVioding" runat="server" Text="(作廢審核中)" Visible="False" meta:resourcekey="lblViodingResource1"></asp:Label>
    <asp:Label ID="lblDocLink" runat="server" Text="文件連結" Style="display: none;" meta:resourcekey="lblDocLinkResource1" ></asp:Label>
    <asp:Label ID="lblInfo" runat="server" Text="文件資訊" Style="display: none;" meta:resourcekey="lblInfoResource1" ></asp:Label>
    <asp:Label ID="lblDeleting" runat="server" Text="(銷毀審核中)" Visible="False" meta:resourcekey="lblDeletingResource1" ></asp:Label>
</asp:Content>