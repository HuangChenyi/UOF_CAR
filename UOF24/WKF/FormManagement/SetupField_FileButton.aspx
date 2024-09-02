<%@ Page Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="WKF_FormManagement_SetupField_FileButton" Title="新增欄位" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" CodeBehind="SetupField_FileButton.aspx.cs" %>

<%@ Register Src="UC_FiledDropList.ascx" TagName="UC_FiledDropList" TagPrefix="uc3" %>
<%@ Register Src="UC_FieldControl.ascx" TagName="UC_FieldControl" TagPrefix="uc2" %>
<%@ Register Src="UC_ModifySel.ascx" TagName="UC_ModifySel" TagPrefix="uc4" %>
<%@ Register Src="~/WKF/FormManagement/UC_VisibleControl.ascx" TagPrefix="uc1" TagName="UC_VisibleControl" %>
<%@ Register Src="~/Common/ChoiceCenter/UC_ChoiceList.ascx" TagPrefix="uc2" TagName="UC_ChoiceList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <script type="text/javascript">
        Sys.Application.add_load(function () {
            var thumbnailRestrict1 = $("#<%=lblThumbnailRestrict1.ClientID%>");
            var thumbnailRestrict2 = $("#<%=lblThumbnailRestrict2.ClientID%>");
            var text = thumbnailRestrict1.text();
            text = text.replace("doc, docx, txt, ppt, pptx, xls, xlsx, ","");
            text = text.replace(", pdf","");
            thumbnailRestrict1.text(text);
            thumbnailRestrict2.text(thumbnailRestrict2.text().replace("5","2"));
            var cbThumbnail = $("#<%= cbThumbnail.ClientID %>");
            var cbPdf = $("#<%= chk_PDF.ClientID %>");

            if(cbThumbnail.prop('checked'))
            {
                $("div#divThumbnailRestricts").show();
                $("div#divRestricts").hide();
            }
            else
            {
                $("div#divThumbnailRestricts").hide();
                $("div#divRestricts").show();
            }

            if(cbPdf.prop('checked'))
            {
                $("div#divThumbnailRestricts").hide();
                $("div#divRestricts").show();
            }
            else
            {
                $("div#divFileRestricts").hide();
                $("div#divUseViewer").hide();
                $("div#divDownloadControl").hide();
                $("div#divWatermarkControl").hide();
                $("divThumbnailRestricts").show();
                $("div#divRestricts").hide();
            }

            SetControls();
        });

        function Checked_Thumbnail() {
            var cbThumbnail = $("#<%= cbThumbnail.ClientID %>");
            var cbPdf = $("#<%= chk_PDF.ClientID %>");
            if(cbThumbnail.prop('checked')){
                $("div#divFileRestricts").hide();
                $("div#divUseViewer").hide();
                $("div#divDownloadControl").hide();
                $("div#divWatermarkControl").hide();
                $("div#divRestricts").hide();
                $("div#divThumbnailRestricts").show();
                cbPdf.prop('checked', false);
            }
            else {
                $("div#divFileRestricts").hide();
                $("div#divUseViewer").hide();
                $("div#divDownloadControl").hide();
                $("div#divWatermarkControl").hide();
                $("div#divThumbnailRestricts").hide();
                $("div#divRestricts").hide();
                $("div#divThumbnailRestricts").hide();
            }
        }
        function Checked_PDF() {
            var cbThumbnail = $("#<%= cbThumbnail.ClientID %>");
            var cbPdf = $("#<%= chk_PDF.ClientID %>");
            if(cbPdf.prop('checked')){
                $("div#divFileRestricts").show();
                $("div#divUseViewer").show();
                $("div#divDownloadControl").show();
                $("div#divWatermarkControl").show();
                $("div#divThumbnailRestricts").hide();
                $("div#divRestricts").show();
                cbThumbnail.prop('checked', false);
            }
            else {
                $("div#divFileRestricts").hide();
                $("div#divUseViewer").hide();
                $("div#divDownloadControl").hide();
                $("div#divWatermarkControl").hide();
                $("div#divThumbnailRestricts").hide();
                $("div#divRestricts").hide();
            }
        }

        function SetControls() {
            CheckEnableDownloadNSave();
            CheckSpec();
            CheckChoiceDiv();
        }

        function CheckEnableDownloadNSave() {
            var cbEnableSave = $("#<%=cbEnableSave.ClientID%>");
            var rbSaveSpec = $("#<%=rbSaveSpec.ClientID%>");
            var rbSaveAll = $("#<%=rbSaveAll.ClientID%>");
            if (cbEnableSave != null) {
                if (cbEnableSave[0].checked) {
                    rbSaveSpec.attr('disabled', false);
                    rbSaveAll.attr('disabled', false);
                }
                else {
                    rbSaveSpec.attr('disabled', true);
                    rbSaveAll.attr('disabled', true);
                }
                //因後端驗證為isValid=False後，RadioButton會全部變成checked=False，故在此處加個判斷處理
                if (!rbSaveSpec[0].checked && !rbSaveAll[0].checked)
                    rbSaveAll[0].checked = true;
            }

            var cbEnableDownload = $("#<%=cbEnableDownload.ClientID%>");
            var rbDownloadSpec = $("#<%=rbDownloadSpec.ClientID%>");
            var rbDownloadAll = $("#<%=rbDownloadAll.ClientID%>");
            if (cbEnableDownload != null) {
                if (cbEnableDownload[0].checked) {
                    rbDownloadSpec.attr('disabled', false);
                    rbDownloadAll.attr('disabled', false);
                }
                else {
                    rbDownloadSpec.attr('disabled', true);
                    rbDownloadAll.attr('disabled', true);
                }
                if (!rbDownloadSpec[0].checked && !rbDownloadAll[0].checked)
                    rbDownloadAll[0].checked = true;
            }
        }


        function CheckSpec() {
            var cbEnableSave = $("#<%=cbEnableSave.ClientID%>");
            var rbSaveSpec = $("#<%=rbSaveSpec.ClientID%>");
            var divEnableSave = $("#divEnableSave");
            if (rbSaveSpec != null) {
                if (rbSaveSpec[0].checked && cbEnableSave[0].checked)
                    divEnableSave.show();
                else
                    divEnableSave.hide();
            }

            var cbEnableDownload = $("#<%=cbEnableDownload.ClientID%>");
            var rbDownloadSpec = $("#<%=rbDownloadSpec.ClientID%>");
            var divEnableDownload = $("#divEnableDownload"); 
            if (rbDownloadSpec != null) {
                if (rbDownloadSpec[0].checked && cbEnableDownload[0].checked)
                    divEnableDownload.show();
                else
                    divEnableDownload.hide();
            }

        }

        function CheckChoiceDiv(){
            var cbSaveOthers = $("#<%=cbSaveOthers.ClientID%>");
            var divSaveChoice = $("#divSaveChoice");
            if (cbSaveOthers != null && cbSaveOthers[0].checked) {
                divSaveChoice.show();
            }
            else
                divSaveChoice.hide();

            var cbDownloadOthers = $("#<%=cbDownloadOthers.ClientID%>");
            var divDownloadChoice = $("#divDownloadChoice");
            if (cbDownloadOthers != null && cbDownloadOthers[0].checked) {
                divDownloadChoice.show();
            }
            else
                divDownloadChoice.hide();
        }

        function CheckFieldId(sender, args) {
            var fieldId = $("#<%=hiddenFieldId.ClientID%>").val();
            var formVersionId = $("#<%=hiddenformVersionId.ClientID%>").val();
            if (fieldId == "" || formVersionId == "") {
                args.set_cancel(true);
            }
            else {
                args.set_cancel(true);
                $uof.dialog.open2("~/wkf/formmanagement/setupfilewatermark.aspx", sender, "", 800, 650, function () { return false; }, { fieldId: fieldId, formVersionId: formVersionId });
            }
        }
    </script>
    <table>
        <tr>
            <td colspan="4">
                <asp:Label ID="lblCopied" runat="server" Text="已成功複製" CssClass="SizeMemo" Visible="false"  meta:resourcekey="lblCopiedResource1"></asp:Label>
            </td>
        </tr>
    </table>
    <table width="100%" class="PopTable" cellspacing="1">
        <colgroup class="PopTableLeftTD">
        </colgroup>
        <colgroup class="PopTableRightTD">
        </colgroup>
        <colgroup class="PopTableLeftTD">
        </colgroup>
        <colgroup class="PopTableRightTD">
        </colgroup>
        <tr>
            <td align="center" class="PopTableHeader" colspan="4">
                <center>
                <asp:Label ID="lblFileButton" runat="server" Text="檔案選取欄位" meta:resourcekey="lblFileButtonResource1"></asp:Label>
                </center>
            </td>
        </tr>
        <tr>
            <td><font color="red">*</font>
                <asp:Label ID="lblFieldId" runat="server" Text="欄位代號"
                    meta:resourcekey="lblFieldIdResource1"></asp:Label></td>
            <td>
                <asp:TextBox ID="txtFieldId" runat="server" Width="98px" meta:resourcekey="txtFieldIdResource1"></asp:TextBox><br />
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorFieldId" runat="server" ControlToValidate="txtFieldId"
                    Display="Dynamic" ErrorMessage="請輸入欄位代號" meta:resourcekey="RequiredFieldValidatorFieldIdResource1"></asp:RequiredFieldValidator>
                <asp:CustomValidator ID="CustomValidatorFieldId" runat="server" Display="Dynamic"
                    ErrorMessage="同一表單版本的欄位代號不得重複" meta:resourcekey="CustomValidatorFieldIdResource1"></asp:CustomValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtFieldId"
                    Display="Dynamic" ErrorMessage="輸入內容只允許英文或數字" ValidationExpression="\w*" meta:resourcekey="RegularExpressionValidator1Resource1"></asp:RegularExpressionValidator></td>
            <td><font color="red">*</font>
                <asp:Label ID="lblFieldName" runat="server" Text="欄位名稱"
                    meta:resourcekey="lblFieldNameResource1"></asp:Label></td>
            <td>
                <asp:TextBox ID="txtFieldName" runat="server" Width="200px" meta:resourcekey="txtFieldNameResource1"></asp:TextBox><br />
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorFieldName" runat="server" ControlToValidate="txtFieldName"
                    Display="Dynamic" ErrorMessage="請輸入欄位名稱" meta:resourcekey="RequiredFieldValidatorFieldNameResource1"></asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblFieldType" runat="server" Text="欄位格式" meta:resourcekey="lblFieldTypeResource1"></asp:Label></td>
            <td>
                <uc3:UC_FiledDropList ID="UC_FiledDropList1" runat="server" />
                <asp:CustomValidator ID="CustomValidatorModifyFieldType" runat="server"
                    Display="Dynamic" meta:resourcekey="CustomValidatorModifyFieldTypeResource1"></asp:CustomValidator>
            </td>
            <td>
                <asp:Label ID="lblFieldSeq" runat="server" Text="欄位順序" meta:resourcekey="lblFieldSeqResource1"></asp:Label></td>
            <td>
                <asp:Label ID="lblSeq" runat="server" meta:resourcekey="lblSeqResource1"></asp:Label>
                <telerik:RadNumericTextBox ID="RadNumericTextBoxSeq" runat="server" MaxLength="3" MaxValue="999"
                    MinValue="0" Width="40px">
                </telerik:RadNumericTextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblContentControl" runat="server" Text="內容控制" meta:resourcekey="lblContentControlResource1"></asp:Label>
            </td>
            <td colspan="3">
                <asp:CheckBox ID="chk_PDF" runat="server" Text="在欄位裡直接預覽" meta:resourcekey="chk_PDFResource1" onclick="Checked_PDF()" />
                <asp:Label ID="lblMemo" runat="server" Text="(若未購買文件轉檔服務時，只能預覽PDF檔案) " meta:resourcekey="lblMemoResource1" CssClass="SizeMemo"></asp:Label>
                <br id="brChk_PDF" />
                <div id="divFileRestricts">
                    <asp:Label ID="lblFileRestrict" runat="server" Text="檔案限制：" meta:resourcekey="lblFileRestrictResource1"></asp:Label>
                    <asp:RadioButton ID="rbOnlyOne" runat="server" Text="只可上傳一個檔案" GroupName="fileUploadCount" Checked="true" meta:resourcekey="rbOnlyOneResource1"/>
                    <asp:RadioButton ID="rbMaxTen" runat="server" Text="允許上傳十個檔案" GroupName="fileUploadCount" meta:resourcekey="rbMaxTenResource1"/>
                </div>
                <div id="divUseViewer">
                    <asp:Label ID="lblDisplayWidth" runat="server" Text="預覽大小：" meta:resourcekey="lblDisplayWidthResource1"></asp:Label>
                    <asp:RadioButton ID="rbViewerSizeA4v" runat="server" Text="A4直式" GroupName="viewerSize" Checked="true" meta:resourcekey="rbViewerSizeA4vResource1" />
                    <asp:RadioButton ID="rbViewerSizeA4h" runat="server" Text="A4橫式" GroupName="viewerSize" meta:resourcekey="rbViewerSizeA4hResource1" />
                    <asp:RadioButton ID="rbViewerSizeCus" runat="server" Text="符合螢幕寬度" GroupName="viewerSize" meta:resourcekey="rbViewerSizeCusResource1" />
                </div>
                <div id="divDownloadControl">
                    <table>
                        <tr>
                            <td>
                                <asp:Label ID="lblDownloadControl" runat="server" Text="下載控制：" meta:resourcekey="lblDownloadControlResource1"></asp:Label>

                            </td>
                            <td>
                                <asp:CheckBox ID="cbEnableSave" runat="server" Text="可另存預覽檔案" onclick="SetControls()" meta:resourcekey="cbEnableSaveResource1" />
                                <asp:RadioButton ID="rbSaveAll" runat="server" GroupName="save" Text="不限制" Checked="true" onclick="SetControls()" meta:resourcekey="rbSaveAllResource1" />
                                <asp:RadioButton ID="rbSaveSpec" runat="server" GroupName="save" Text="允許以下人員" onclick="SetControls()" meta:resourcekey="rbSaveSpecResource1" />
                                    <asp:CustomValidator ID="cvSaveSpec" runat="server" ErrorMessage="請選擇人員" meta:resourcekey="cvSaveSpecResource1" ></asp:CustomValidator>
                                <div id="divEnableSave">
                                    &nbsp;&nbsp;&nbsp;&nbsp;<asp:CheckBox ID="cbSaveFiller" runat="server" Text="填寫者" meta:resourcekey="cbFillerResource1" />
                                    <br />
                                    &nbsp;&nbsp;&nbsp;&nbsp;<asp:CheckBox ID="cbSaveOthers" runat="server" Text="其他人員" onclick="SetControls()" meta:resourcekey="cbOthersResource1" />
                                    <div id="divSaveChoice">
                                        <asp:HiddenField   id="hfSaveRmid" runat="server" />
                                        <uc2:UC_ChoiceList runat="server" ID="UC_ChoiceSave" ShowAddToFavorite="false" ExpandToUser="false"/>
                                    </div>
                                </div>
                                <div style="height:0"></div>
                                <asp:CheckBox ID="cbEnableDownload" runat="server" Text="可下載原始檔" onclick="SetControls()" meta:resourcekey="cbEnableDownloadResource1" />
                                <asp:RadioButton ID="rbDownloadAll" runat="server" GroupName="download" Text="不限制" Checked="true" onclick="SetControls()" meta:resourcekey="rbDownloadAllResource1" />
                                <asp:RadioButton ID="rbDownloadSpec" runat="server" GroupName="download" Text="允許以下人員" onclick="SetControls()" meta:resourcekey="rbDownloadSpecResource1" />
                                    <asp:CustomValidator ID="cvDownloadSpec" runat="server" ErrorMessage="請選擇人員"></asp:CustomValidator>
                                <div id="divEnableDownload">
                                    &nbsp;&nbsp;&nbsp;&nbsp;<asp:CheckBox ID="cbDownloadFiller" runat="server" Text="填寫者" meta:resourcekey="cbFillerResource1" />
                                    <br />
                                    &nbsp;&nbsp;&nbsp;&nbsp;<asp:CheckBox ID="cbDownloadOthers" runat="server" Text="其他人員" onclick="SetControls()" meta:resourcekey="cbOthersResource1" />
                                    <div id="divDownloadChoice">
                                        <asp:HiddenField ID="hfDownloadRmid" runat="server" />
                                        <uc2:UC_ChoiceList runat="server" ID="UC_ChoiceDownload" ShowAddToFavorite="false" ExpandToUser="false"/>
                                    </div>
                                </div>
                            </td>
                        </tr>
                    </table>

                </div>
                <div>

                </div>
                <div id="divWatermarkControl">
                    <asp:Label ID="lblWatermarkControl" runat="server" Text="浮水印設定：" meta:resourcekey="lblWatermarkControlResource1"></asp:Label>
                    <telerik:RadButton ID="btnSetting" runat="server" Text="設定" OnClientClicking="CheckFieldId" Enabled="false" meta:resourcekey="btnSettingResource1"></telerik:RadButton>
                    <asp:Label ID="lblWatermarkMemo" runat="server" Text="(先儲存欄位才可設定浮水印)" CssClass="SizeMemo" meta:resourcekey="lblWatermarkMemoResource1"></asp:Label>
                </div>
                <div id="divRestricts">
                    <table>
                        <tr>
                            <td>
                                <asp:Label ID="lblRestricts" runat="server" Text="【使用限制】" CssClass="SizeMemo" meta:resourcekey="lblRestrictsResource1"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblRestrict1" runat="server" Text="1.支援文件格式：doc, docx, txt, ppt, pptx, xls, xlsx, jpg, png, bmp, gif, pdf。" CssClass="SizeMemo" meta:resourcekey="lblRestrict1Resource1"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblRestrict2" runat="server" Text="2.文字檔(.txt)不能超過2MB，超過不會進行轉檔。" CssClass="SizeMemo" meta:resourcekey="lblRestrict2Resource1"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblRestrict3" runat="server" Text="3.圖形檔的長寬不能超過2048px，超過會進行等比例縮小。" CssClass="SizeMemo" meta:resourcekey="lblRestrict3Resource1"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblRestrict4" runat="server" Text="4.有設保全的檔案，不會進行轉檔。" CssClass="SizeMemo" meta:resourcekey="lblRestrict4Resource1"></asp:Label>
                            </td>
                        </tr>
                        <%--<tr>
                            <td>
                                <asp:Label ID="lblRestrict5" runat="server" Text="5.最多可上傳十個檔案。" CssClass="SizeMemo" meta:resourcekey="lblRestrict5Resource1"></asp:Label>
                            </td>
                        </tr>--%>
                    </table>
                </div>
                <asp:CheckBox ID="cbThumbnail" runat="server" Text="在欄位裡直接顯示縮圖" onclick="Checked_Thumbnail()" meta:resourcekey="cbThumbnailResource1"/>
                <div id="divThumbnailRestricts">
                    <table>
                        <tr>
                            <td>
                                <asp:Label ID="lblThumbnailRestricts" runat="server" Text="【使用限制】" CssClass="SizeMemo" meta:resourcekey="lblRestrictsResource1"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblThumbnailRestrict1" runat="server" Text="1.支援文件格式：jpg, png, bmp, gif, pdf。" CssClass="SizeMemo" meta:resourcekey="lblRestrict1Resource1"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblThumbnailRestrict2" runat="server" Text="2.只能上傳一個檔案。" CssClass="SizeMemo" meta:resourcekey="lblThumbnailRestrict2Resource1"></asp:Label>
                            </td>
                        </tr>
                    </table>
                </div>
                
                
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblAttachLoadLimit" runat="server" Text="單一附件上限" meta:resourcekey="lblAttachLoadLimitResource1"></asp:Label>
            </td>
            <td colspan="3">
                <telerik:RadNumericTextBox ID="rntAttachLoadLimit" MaxLength="4" MinValue="1" MaxValue="2000"
                            Width="60px" Height="20px" runat="server" DataType="System.Int32" Culture="zh-TW"
                            DbValueFactor="1" LabelCssClass="" LabelWidth="64px"
                            meta:resourcekey="rntAttachLoadLimitResource1">
                            <NegativeStyle Resize="None" />
                            <NumberFormat DecimalDigits="0" ZeroPattern="n" />
                            <ClientEvents/>
                            <EmptyMessageStyle Resize="None" />
                            <ReadOnlyStyle Resize="None" />
                            <FocusedStyle Resize="None" />
                            <DisabledStyle Resize="None" />
                            <InvalidStyle Resize="None" />
                            <HoveredStyle Resize="None" />
                            <EnabledStyle HorizontalAlign="Right" Resize="None" />
                    </telerik:RadNumericTextBox>
                <asp:Label ID="lblAttachLoadLimitTip" runat="server" Text="MB (1~2000MB，空白表示不限制檔案大小)" meta:resourcekey="lblAttachLoadLimitTipResource1"></asp:Label>
            </td> 
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblDispalyFieldName" runat="server" Text="欄位顯示" meta:resourcekey="lblDispalyFieldNameResource1"></asp:Label>
            </td>
            <td colspan="3">
                <asp:CheckBox ID="cbxDisplayFieldName" runat="server" Text="顯示欄位名稱" Checked="true" meta:resourcekey="cbxDisplayFieldNameResource1" />
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblFieldControl" runat="server" Text="欄位控制" meta:resourcekey="lblFieldControlResource1"></asp:Label></td>
            <td colspan="3">
                <uc2:UC_FieldControl ID="UC_FieldControl1" runat="server" />
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lbl_FieldModify" runat="server" Text="修改權限"
                    meta:resourcekey="lbl_FieldModifyResource1"></asp:Label>
            </td>
            <td colspan="3">
                <uc4:UC_ModifySel ID="UC_ModifySel1" runat="server" />
            </td>
        </tr>
        <tr id="GrideDetail">
            <td>
                <asp:Label ID="lblDisplayLength" runat="server" Text="顯示寬度" meta:resourcekey="lblDisplayLengthRecource1"></asp:Label></td>
            <td colspan="3">
                <telerik:RadNumericTextBox ID="RadNumericViewLength" runat="server"
                    MaxValue="1000" MinValue="0" Width="40px">
                </telerik:RadNumericTextBox>
                <asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Names="Arial"
                    Text="px" meta:resourcekey="Label2Resource1"></asp:Label>
                <asp:Label ID="lblDisplayLengthNotify" runat="server" Text="(表單顯示的限制長度，設零由系統自行調整)" meta:resourcekey="lblDisplayLengthNotifyRecource1"></asp:Label></td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblVisible" runat="server" Text="觀看權限控制" meta:resourcekey="lblVisibleResource1"></asp:Label>
            </td>
            <td colspan="3">
                <uc1:UC_VisibleControl runat="server" ID="UC_VisibleControl" />
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblFieldRemark" runat="server" Text="欄位備註" meta:resourcekey="lblFieldRemarkResource1"></asp:Label></td>
            <td colspan="3">
                <asp:TextBox ID="txtFieldRemark" runat="server" Width="90%" meta:resourcekey="txtFieldRemarkResource1"></asp:TextBox></td>
        </tr>
    </table>
    <asp:HiddenField ID="hiddenFieldId" runat="server"></asp:HiddenField>
    <asp:HiddenField ID="hiddenformVersionId" runat="server"></asp:HiddenField>
</asp:Content>
