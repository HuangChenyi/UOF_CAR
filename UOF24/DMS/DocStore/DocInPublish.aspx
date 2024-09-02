<%@ Page Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="DMS_DocStore_DocInPublish" Title="公佈文件" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" Codebehind="DocInPublish.aspx.cs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <script type="text/javascript">
        function ConfirmApprove() {
            var varManualControl = $("#<%= hidVarManualControl.ClientID%>").val();
            var publishVer = $("#<%= hidPublishVer.ClientID%>").val();
            var txtHandVer = $("#<%=txtHandVer.ClientID %>");
            var isAuthorSettingInitVar = $("#<%= hidIsAuthorSettingInitVar.ClientID%>").val();
            var handVer;

            if (publishVer === "" && isAuthorSettingInitVar !== "False") {
                if (varManualControl === 'False') {
                    var advancedVer = $("#<%= hidAdvancedVer.ClientID%>").val();
                    var verCarry = $("#<%= hidVerCarry.ClientID%>").val();
                    var bitInteger = $find("<%= rntxtBitInteger.ClientID%>").get_value();
                    var txtDecimalPlaces = $find("<%= rntxtDecimalPlaces.ClientID%>");
                    var decimalPlaces = 0;
                    if (txtDecimalPlaces !== null) {
                        decimalPlaces = txtDecimalPlaces.get_value();

                        if (advancedVer === "False") {
                            if (parseInt(decimalPlaces) >= parseInt(verCarry)) {
                                alert("<%= cvInitialVerError.ErrorMessage%>");
                                return false;
                            }
                        }
                    }

                    if (parseInt(bitInteger) === 0 && parseInt(decimalPlaces) === 0) {
                            alert("<%= cvInitialVerError2.ErrorMessage%>");
                            return false;
                        }

                    var ver = bitInteger + "." + decimalPlaces;
                    handVer = ver;
                }
                else {
                    if ($("#<%=txtHandVer.ClientID %>").val().trim() == "") {
                        return;
                    }

                    handVer = $("#<%=txtHandVer.ClientID %>").val();
                }
            }
            else {
                if ($("#<%=txtHandVer.ClientID %>").val().trim() == "") {
                        return;
                    }
                handVer = $("#<%=txtHandVer.ClientID %>").val();
            }

            //檢查版本是否重複
            var checkVersionData = [escape('<%=docid %>'), handVer];
            var result = $uof.pageMethod.sync("CheckManualVersion", checkVersionData);
            if (result == "False") {
                alert('<%=CustomValidator2.ErrorMessage %>');
                return false;
            }

            //檢查文件編號是否已被使用
            var checkIsSerialRepeat = [escape('<%=docid %>')];
            var result = $uof.pageMethod.sync("IsDocSerialRepeat", checkIsSerialRepeat);
            if (result == "True") {
                alert('<%=CustomValidator6.ErrorMessage %>');
                return false;
            }

            //檢查是否要檢查版本備註
            var remarkData = [$("#<%=hdFolderID.ClientID %>").val()];
            if ($uof.pageMethod.sync("CheckLimitedVerMemo", remarkData) == 'true') {
                if ($('#<%=txtVersionMemo.ClientID %>').val().trim() == '') {
                    alert('<%=lblVerMemo.Text %>')
                    return false;
                }
            }

            //檢查是否有重複的文件名稱
            var nameData = [$('#<%=lblDocname.ClientID %>').text(), $uof.tool.htmlDecode('<%=System.Web.Security.AntiXss.AntiXssEncoder.HtmlEncode(docid, true) %>'), $('#<%=hdFolderID.ClientID %>').val()];
            if ($uof.pageMethod.sync("IsIdenticalName", nameData) == 'true') {
                alert('<%=lblNameRepeat.Text %>');
                return false;
            }

            var VersionMemo = $("#<%=txtVersionMemo.ClientID %>").val();
            var VersionMemos = "";
            var DocId = '<%=System.Web.Security.AntiXss.AntiXssEncoder.HtmlEncode(docid, true) %>';
            var ManualVersion = handVer;
            var hdNeedApprove = $("#<%=hdNeedApprove.ClientID %>");
            var hdApproveType = $("#<%=hdApproveType.ClientID %>");
            var hdApproveRMID = $("#<%=hdApproveRMID.ClientID %>");
            var SysVersion = $('#<%=lblSysNewVer.ClientID %>').text();
            var versionType = $('#<%=hideStatus.ClientID %>').val();
            var ActualVersion = $('#<%=lblActualVer.ClientID %>').text();
            var DocID = [$uof.tool.htmlDecode(DocId)];
            var DocSerial = $uof.pageMethod.sync("GetDocSerial", DocID);
            $("#<%=hfDocSerial.ClientID%>").val(DocSerial);
            var publishNotice = $('#<%=hfPublishNoticeFieldValue.ClientID %>').val();

            for (var i = 0 ; i < VersionMemo.length ; i++) {
                VersionMemos = VersionMemos + VersionMemo[i];
                if (i != VersionMemo.length - 1)
                    VersionMemos = VersionMemos;
            }

            VersionMemos = VersionMemos;
            var data = [$("#<%=hdFolderID.ClientID %>").val()];
            var ApproveValue = $uof.pageMethod.sync("GetApproveValue", data).split(",");
            $('#<%=hfIsSkipApprove.ClientID %>').val(ApproveValue[3]);
            var IsSkipApprove = ApproveValue[3];
            $("#<%=hdApproveType.ClientID %>").val(ApproveValue[2]); //hdApproveType.value = ApproveValue[2];
            $("#<%=hdNeedApprove.ClientID %>").val(ApproveValue[1]);  //hdNeedApprove.value = ApproveValue[1];
            $("#<%=hdApproveRMID.ClientID %>").val(ApproveValue[0]);  //hdApproveRMID.value = ApproveValue[0];

            if (ApproveValue[2] == "WKF" && ApproveValue[1] == "true" && IsSkipApprove != "true") {
                
                var FormVersionId = hdApproveRMID.val();
                var taskdata = [FormVersionId, $uof.tool.htmlDecode(DocId), VersionMemos, ManualVersion, SysVersion, ActualVersion, '<%=lblDocLink.Text%>', '<%=lblHistory.Text%>', '<%=lblRef.Text%>', '<%=lblInfo.Text%>', '<%=labNormal.Text%>', '<%=lblSecretm.Text%>', '<%=lblTopSecret.Text%>', '<%=lblXSecret.Text%>', '<%=lblXXSecret.Text%>', '<%=lblUrgencyNormal.Text%>', '<%=lblUrgencyHigh.Text%>', '<%=lblUrgencyExHigh.Text%>', DocSerial, publishNotice];

                var result = $uof.pageMethod.sync("GetTaskID", taskdata);
                var obj = JSON.parse(result);
                var scriptFileId = $("#<%= hidScriptFileGroupID.ClientID%>");
                scriptFileId.val(obj.scriptFileGroup);

                var FormID = "DMSApprove";
                
                $uof.dialog.open2("~/WKF/ExternalModule/ExternalFormScript.aspx", this, "", 0, 0, OpenDialogResult, { "scriptId": obj.taskId, "formId": FormID, "formVersionId": FormVersionId });

                    
                return false;
            }
        }

        function OpenDialogResult(returnValue) {
            //表單沒送出的話，將指給該表單的本文附件及本文內檔案設成DELETED
            var attachmentID = $("#<%= hidScriptFileGroupID.ClientID%>").val();
            if ((typeof (returnValue) == 'undefined' || returnValue == null || returnValue == "NeedPostBack") && attachmentID !== "") {
                var data = [attachmentID];
                var result = $uof.pageMethod.sync("DeleteTextScriptFile", data);
                return false;
            }
            else
                return true;
        }

    </script>
    <asp:CustomValidator ID="CustomValidator1" runat="server" Display="Dynamic" ErrorMessage="該文件不是存回,無法發佈" meta:resourcekey="CustomValidator1Resource1" Visible="false"></asp:CustomValidator>
    <asp:CustomValidator ID="CustomValidator2" runat="server" Display="Dynamic" ErrorMessage="手動版本已存在" meta:resourcekey="CustomValidator2Resource1" Visible="false"></asp:CustomValidator>
    <asp:CustomValidator ID="CustomValidator3" runat="server" Display="Dynamic" ErrorMessage="文件取出失敗" meta:resourcekey="CustomValidator3Resource1" Visible="false"></asp:CustomValidator>
    <asp:CustomValidator ID="CustomValidator4" runat="server" Display="Dynamic" ErrorMessage="原稿控制已取消, 無法轉成PDF" meta:resourcekey="CustomValidator4Resource1" Visible="false"></asp:CustomValidator>
    <asp:CustomValidator ID="cvFileNotInUof" runat="server" Display="Dynamic" ErrorMessage="目前檔案仍在Proxy伺服器，正由系統進行傳輸中，請稍後！"></asp:CustomValidator>
    <asp:CustomValidator ID="CustomValidator6" runat="server" Display="Dynamic" ErrorMessage="文件編號已被使用" meta:resourcekey="CustomValidator6Resource1" Visible="false"></asp:CustomValidator>
    <table style="border: 1px;" cellpadding="0" cellspacing="0" class="PopTable">
        <tr>
            <td >
                <asp:Label ID="Label1" runat="server" Text="文件" meta:resourcekey="Label1Resource1"></asp:Label>
            </td>
            <td>
                <asp:Image ID="docIcon" runat="server" />
                <asp:Label ID="lblDocname" runat="server" ForeColor="Black"></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="width: 140px">
                <asp:Label ID="Label2" runat="server" Text="目前實際版本" meta:resourcekey="Label2Resource1"></asp:Label></td>
            <td>
                <asp:Label ID="lblActualVer" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="white-space:nowrap;">
                <asp:Label ID="Label3" runat="server" Text="公佈後實際版本變更為" meta:resourcekey="Label3Resource1"></asp:Label>
            </td>
            <td runat="server" id="tdhandVer">
                <asp:TextBox ID="txtHandVer" runat="server" ForeColor="Red" MaxLength="15"></asp:TextBox>&nbsp;
                <asp:CustomValidator ID="CustomValidator5" runat="server" Display="Dynamic" ErrorMessage="請輸入版本" meta:resourcekey="RequiredFieldValidator1Resource1" Visible="false"></asp:CustomValidator>
                <br />
                <asp:CustomValidator ID="CustomValidator7" runat="server" Display="Dynamic" ErrorMessage="輸入的內容不能包括以下符號「,」、「'」、「|」、「@」、「 \」、「＂」、「、」、「{}」" meta:resourcekey="CustomValidator7Resource1"></asp:CustomValidator>           
                </td>
            <td  runat="server" id="tdinitialVer">
                <telerik:RadNumericTextBox ID="rntxtBitInteger" runat="server" Width="35px" DataType="System.Int32" NumberFormat-DecimalDigits="0" NumberFormat-AllowRounding="false" MaxLength="2">
                    <NegativeStyle Resize="None"></NegativeStyle>
                    <NumberFormat DecimalDigits="0" ZeroPattern="n" AllowRounding="False" GroupSeparator=""></NumberFormat>
                    <EmptyMessageStyle Resize="None"></EmptyMessageStyle>
                    <ReadOnlyStyle Resize="None"></ReadOnlyStyle>
                    <FocusedStyle Resize="None"></FocusedStyle>
                    <DisabledStyle Resize="None"></DisabledStyle>
                    <InvalidStyle Resize="None"></InvalidStyle>
                    <HoveredStyle Resize="None"></HoveredStyle>
                    <EnabledStyle Resize="None"></EnabledStyle>
                </telerik:RadNumericTextBox>
                <asp:Label ID="lblDecimalPoint" runat="server" Text="." Style="vertical-align: bottom"></asp:Label>
                <telerik:RadNumericTextBox ID="rntxtDecimalPlaces" runat="server" Width="35px" DataType="System.Int32" NumberFormat-DecimalDigits="0" NumberFormat-AllowRounding="false" MaxLength="2">
                    <NegativeStyle Resize="None"></NegativeStyle>
                    <NumberFormat DecimalDigits="0" ZeroPattern="n" AllowRounding="False" GroupSeparator=""></NumberFormat>
                    <EmptyMessageStyle Resize="None"></EmptyMessageStyle>
                    <ReadOnlyStyle Resize="None"></ReadOnlyStyle>
                    <FocusedStyle Resize="None"></FocusedStyle>
                    <DisabledStyle Resize="None"></DisabledStyle>
                    <InvalidStyle Resize="None"></InvalidStyle>
                    <HoveredStyle Resize="None"></HoveredStyle>
                    <EnabledStyle Resize="None"></EnabledStyle>
                </telerik:RadNumericTextBox>
            </td>
        </tr>
        <tr style="display:none;">
            <td >
                <asp:Label ID="Label4" runat="server" Text="目前系統版本" meta:resourcekey="Label4Resource1"></asp:Label></td>
            <td style="height: 23px">
                <asp:Label ID="lblSysActualVer" runat="server"></asp:Label></td>
        </tr>
        <tr style="display:none;">
            <td >
                <asp:Label ID="Label5" runat="server" Text="公佈後系統版本變更為" meta:resourcekey="Label5Resource1"></asp:Label></td>
            <td>
                <asp:Label ID="lblSysNewVer" runat="server" ForeColor="Red"></asp:Label></td>
        </tr>
        <tr>
            <td align="left" colspan="2" style="height: 48px; text-align: left; white-space:nowrap;">
                <br />
                <asp:Label ID="Label6" runat="server" Text="版本備註" meta:resourcekey="Label6Resource1"></asp:Label><br />
                <asp:TextBox ID="txtVersionMemo" runat="server" Height="155px"
                    TextMode="MultiLine" Width="100%"></asp:TextBox>
            </td>
        </tr>
    </table>
    <asp:CheckBoxList ID="cblPublishNotice" runat="server" RepeatDirection="Horizontal" Width="400px" Visible="false">
        <asp:ListItem Value="publishUnit" Text="發行單位" meta:resourcekey="publishUnitResource1"></asp:ListItem>
        <asp:ListItem Value="custodyUser" Text="保管者" meta:resourcekey="custodyUserResource1"></asp:ListItem>
        <asp:ListItem Value="authDep" Text="權責部門" meta:resourcekey="authDepResource1"></asp:ListItem>
        <asp:ListItem Value="suitableDep" Text="適用部門" meta:resourcekey="suitableDepResource1"></asp:ListItem>
    </asp:CheckBoxList>
    <asp:Label ID="lblPublish" runat="server" Text="公佈" Visible="False" meta:resourcekey="lblPublishResource1"></asp:Label>
    <asp:HiddenField ID="hideStatus" runat="server" />
    <asp:HiddenField ID="hdFolderID" runat="server" />
    <asp:HiddenField ID="hdApproveRMID" runat="server" />
    <asp:HiddenField ID="hdNeedApprove" runat="server" />
    <asp:HiddenField ID="hdApproveType" runat="server" />
    <asp:HiddenField ID="hdMemo" runat="server" />
    <asp:HiddenField ID="hdKeyWord" runat="server" />
    <asp:HiddenField ID="hdName" runat="server" />
    <asp:Label ID="lblSecretm" runat="server" meta:resourcekey="lblSecretmResource1" Text="密" Visible="False"></asp:Label>
    <asp:Label ID="lblXSecret" runat="server" meta:resourcekey="lblXSecretResource1" Text="機密" Visible="False"></asp:Label>
    <asp:Label ID="lblXXSecret" runat="server" meta:resourcekey="lblXXSecretResource1" Text="極機密" Visible="False"></asp:Label>
    <asp:Label ID="lblTopSecret" runat="server" meta:resourcekey="lblTopSecretResource1" Text="絕對機密" Visible="False"></asp:Label>
    <asp:Label ID="labNormal" runat="server" meta:resourcekey="labNormalResource1" Text="一般" Visible="False"></asp:Label>
    <asp:Label ID="lblActive" runat="server" meta:resourcekey="lblActiveResource1" Text="立即生效" Visible="False"></asp:Label>
    <asp:Label ID="lblNeverOverdue" runat="server" meta:resourcekey="lblNeverOverdueResource1" Text="永不過期" Visible="False"></asp:Label>
    <asp:Label ID="labDocStore" runat="server" meta:resourcekey="labDocStoreResource1" Text="文件庫" Visible="False"></asp:Label>

    <asp:CustomValidator ID="cvPropertyLimit" runat="server" ErrorMessage="不可空白或沒選人員" Display="Dynamic" Visible="False" meta:resourcekey="cvPropertyLimitResource1"></asp:CustomValidator>
    <asp:CustomValidator ID="cvPropertyLimit2" runat="server" ErrorMessage="必須勾選文件類別" Display="Dynamic" Visible="False" meta:resourcekey="cvPropertyLimit2Resource1"></asp:CustomValidator>
    <asp:CustomValidator ID="cvPropertyLimit3" runat="server" ErrorMessage="必須加入參考文件" Display="Dynamic" Visible="False" meta:resourcekey="cvPropertyLimit3Resource1"></asp:CustomValidator>
    <asp:CustomValidator ID="cvPropertyLimit4" runat="server" ErrorMessage="不可空白" Display="Dynamic" Visible="False" meta:resourcekey="cvPropertyLimit4Resource1"></asp:CustomValidator>
    
    <asp:CustomValidator ID="cvInitialVerError" runat="server" ErrorMessage="版本編號小數位不可大於等於版號進號小數設定值" Display="Dynamic" Visible="False" meta:resourcekey="cvInitialVerErrorResource1"></asp:CustomValidator>
    <asp:CustomValidator ID="cvInitialVerError2" runat="server" ErrorMessage="不可為0.0版" Display="Dynamic" meta:resourcekey="cvInitialVerError2Resource1" Visible="False"></asp:CustomValidator>

    <asp:Label ID="lblName" runat="server" Text="文件名稱" Visible="False" meta:resourcekey="lblNameResource1"></asp:Label>
    <asp:Label ID="lblSerial" runat="server" Text="文件編號" Visible="False" meta:resourcekey="lblSerialResource1"></asp:Label>
    <asp:Label ID="lblPublishUnit" runat="server" Text="發行單位" Visible="False" meta:resourcekey="lblPublishUnitResource1"></asp:Label>
    <asp:Label ID="lblCustodyUser" runat="server" Text="保管者" Visible="False" meta:resourcekey="lblCustodyUserResource1"></asp:Label>
    <asp:Label ID="lblDocComment" runat="server" Text="摘要" Visible="False" meta:resourcekey="lblDocCommentResource1"></asp:Label>
    <asp:Label ID="lblDocKeyword" runat="server" Text="關鍵字" Visible="False" meta:resourcekey="lblDocKeywordResource1"></asp:Label>
    <asp:Label ID="lblClassName" runat="server" Text="文件類別" Visible="False" meta:resourcekey="lblClassNameResource1"></asp:Label>
    <asp:Label ID="lblDocReflink" runat="server" Text="參考文件" Visible="False" meta:resourcekey="lblDocReflinkResource1"></asp:Label>
    <asp:Label ID="lblChangeReason" runat="server" Text="發佈/變更原因" Visible="False" meta:resourcekey="lblChangeReasonResource1"></asp:Label>
    <asp:Label ID="lblPro" runat="server" Text="請到文件屬性修改以下屬性：" Visible="False" meta:resourcekey="lblProResource1"></asp:Label>
    <asp:HiddenField ID="hdUserGuid" runat="server" />
    <asp:Label ID="lblDoubleSend" runat="server" Text="此份文件已發送過發佈申請單{0}。"
        Visible="false" meta:resourcekey="lblDoubleSendResource1"></asp:Label>

    <asp:Label ID="lblVerMemo" runat="server" Text="版本備註不可為空白" Visible="False" meta:resourcekey="lblVerMemoResource1"></asp:Label>
    <asp:Label ID="lblFullSerial" runat="server" Text="自動編號已達上限，請通知目錄管理員增加編號最大上限" Visible="False"
        meta:resourcekey="lblFullSerialResource1"></asp:Label>
    <asp:Label ID="lblAutoSerial" runat="server" Text="＊文件自動編號" Visible="False" meta:resourcekey="lblAutoSerialResource1"></asp:Label>
    <asp:HiddenField ID="hfIsSkipApprove" runat="server" />
    <asp:Label ID="lblUrgencyNormal" runat="server" Text="普通" Visible="False" meta:resourcekey="lblUrgencyNormalResource2"></asp:Label>
    <asp:Label ID="lblUrgencyHigh" runat="server" Text="急" Visible="False" meta:resourcekey="lblUrgencyHighResource2"></asp:Label>
    <asp:Label ID="lblUrgencyExHigh" runat="server" Text="緊急" Visible="False" meta:resourcekey="lblUrgencyExHighResource2"></asp:Label>
    <asp:Label ID="lblDocLink" runat="server" Text="文件連結" Style="display: none;" meta:resourcekey="lblDocLinkResource1"></asp:Label>
    <asp:Label ID="lblNameRepeat" runat="server" Text="文件標題在此目錄已被使用，請至文件屬性修改標題" Visible="false"
        meta:resourcekey="lblNameRepeatResource1"></asp:Label>
    <asp:Label ID="lblHistory" runat="server" Text="觀看版本歷程" Style="display: none;" meta:resourcekey="lblHistoryResource1"></asp:Label>
    <asp:Label ID="lblRef" runat="server" Text="觀看參考文件" Style="display: none;" meta:resourcekey="lblRefResource1"></asp:Label>
    <asp:Label ID="lblInfo" runat="server" Text="文件資訊" Style="display: none;" meta:resourcekey="lblInfoResource1"></asp:Label>
    <asp:Label ID="lblNewPropertyCustomize" runat="server" Text="自訂屬性有新版本" Style="display: none;" meta:resourcekey="lblNewPropertyCustomizeResource1"></asp:Label>
    <asp:Label ID="lblDefaultVerDecimalPlaces" runat="server" Text=".0" Visible="false"></asp:Label>    
    <asp:HiddenField ID="hfDocSerial" runat="server" />
    <asp:HiddenField ID="hidVarManualControl" runat="server" />
    <asp:HiddenField ID="hidPublishVer" runat="server" />
    <asp:HiddenField ID="hidAdvancedVer" runat="server" />
    <asp:HiddenField ID="hidVerCarry" runat="server" />
    <asp:HiddenField ID="hidIsAuthorSettingInitVar" runat="server" />
    <asp:HiddenField ID="hfCurrentUser" runat="server" />
    <asp:HiddenField ID="hidScriptFileGroupID" runat="server" />
    <asp:HiddenField ID="hfPublishNoticeFieldValue" runat="server" />
</asp:Content>

