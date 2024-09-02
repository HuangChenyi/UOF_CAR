<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="EdocContent.ascx.cs" Inherits="WKF_OptionalFields_EdocContent" %>

<%@ Reference Control="~/WKF/FormManagement/VersionFieldUserControl/VersionFieldUC.ascx" %>
<%@ Register Src="~/Common/FileCenter/V3/UC_FileCenter.ascx" TagPrefix="uc7" TagName="UC_FileCenter" %>
<%@ Register Src="~/Edoc/Common/UC_EdocViewer.ascx" TagPrefix="uc1" TagName="UC_EdocViewer" %>


<telerik:RadButton ID="btnEditContent" OnClick="btnEditContent_Click" runat="server" Text="編輯內容" CausesValidation="false"></telerik:RadButton>
<asp:Label ID="lblEditlessOnMobileDevice" runat="server" Text="此欄位不允許在App編輯" Visible="false" ForeColor="Blue"></asp:Label>

<asp:CustomValidator ID="cvCheckEDocContent" ClientValidationFunction="ValidateEdocPdf" Display="Dynamic" runat="server"
    ErrorMessage="沒有公文無法送出表單 !" ForeColor="Red">
</asp:CustomValidator>

<asp:CustomValidator ID="cvCheckEDocLicense" ClientValidationFunction="CheckEDocLicense" Display="Dynamic" runat="server"
    ErrorMessage="尚未啟用電子公文模組授權，請洽系統管理員" ForeColor="Red">
</asp:CustomValidator>

<asp:CustomValidator ID="cvCheckEDocNumber" ClientValidationFunction="CheckEDocNumber" Display="Dynamic" runat="server"
    ErrorMessage="發文字號未取號成功，請退回申請者重新送出" ForeColor="Red">
</asp:CustomValidator>

<uc7:UC_FileCenter runat="server" ID="UC_FileCenter" ModuleName="EDOC" ProxyEnabled="true" UploadEnabled="false" />

<asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
    <ContentTemplate>
        <uc1:UC_EdocViewer runat="server" ID="UC_EdocViewer" />
    </ContentTemplate>
</asp:UpdatePanel>

<asp:Label ID="lblEditTitle" runat="server" Text="編輯發文內容" Visible="false"></asp:Label>
<asp:HiddenField ID="hfPreviewFileGroupId" runat="server" />
<asp:HiddenField ID="hfMode" runat="server" />
<asp:HiddenField ID="hfToUnitName" runat="server" />
<asp:HiddenField ID="hfFromUnitName" runat="server" />
<asp:HiddenField ID="hfSpeedType" runat="server" />
<asp:HiddenField ID="hfFieldMode" runat="server" Value="" />
<asp:HiddenField ID="hfIsPdfExist" runat="server" />
<asp:HiddenField ID="hfEdocNumber" runat="server" />

<asp:Label ID="lblDTOStr" runat="server" Visible="false"></asp:Label>
<asp:Label ID="lblTop" runat="server" Text="最速件" Visible="False"></asp:Label>
<asp:Label ID="lblFast" runat="server" Text="速件" Visible="False"></asp:Label>
<asp:Label ID="lblNormal" runat="server" Text="普通件" Visible="False"></asp:Label>
<asp:Label ID="lblSpecial" runat="server" Text="特別件" Visible="False"></asp:Label>
<asp:Label ID="lblNone" runat="server" Text="無" Visible="False"></asp:Label>

<asp:Label ID="lblDocTypeHead" runat="server" Text="公文類型" Visible="False"></asp:Label>
<asp:Label ID="lblSendDateHead" runat="server" Text="發文日期" Visible="False"></asp:Label>
<asp:Label ID="lblFromUnitNameHead" runat="server" Text="發文機關" Visible="False"></asp:Label>
<asp:Label ID="lblToUnitNameHead" runat="server" Text="受文機關" Visible="False"></asp:Label>
<asp:Label ID="lblSpeedTypeHead" runat="server" Text="速別" Visible="False"></asp:Label>
<asp:Label ID="lblSecretHead" runat="server" Text="密等" Visible="False"></asp:Label>
<asp:Label ID="lblNumberStringHead" runat="server" Text="發文字號" Visible="False"></asp:Label>
<asp:Label ID="lblSubjectHead" runat="server" Text="主旨/事由" Visible="False"></asp:Label>

<asp:Label ID="lblMultipleLetterUnit" runat="server" Text="如行文單位" Visible="False"></asp:Label>
<asp:Label ID="lblMultipleMeetingNoticeUnit" runat="server" Text="如出列席者" Visible="False"></asp:Label>

<asp:Label ID="lblHasNoAuthority" runat="server" Text="無填寫權限" ForeColor="Red" Visible="False" meta:resourcekey="lblHasNoAuthorityResource1"></asp:Label>
<asp:Label ID="lblToolTipMsg" runat="server" Text="不允許修改(唯讀)" Visible="False" meta:resourcekey="lblToolTipMsgResource1"></asp:Label>
<asp:Label ID="lblModifier" runat="server" Visible="False" meta:resourcekey="lblModifierResource1"></asp:Label>
<asp:Label ID="lblMsgSigner" runat="server" Text="填寫者" Visible="False" meta:resourcekey="lblMsgSignerResource1"></asp:Label>
<asp:Label ID="lblAuthorityMsg" runat="server" Text="具填寫權限人員" Visible="False" meta:resourcekey="lblAuthorityMsgResource1"></asp:Label>

<script type="text/javascript">

    Sys.Application.add_load(function () {
        FilterAttachment();
    });

    // 過濾不需要顯示的檔案
    function FilterAttachment() {

        if ($("#<%=hfMode.ClientID %>").val() == 'receive') {

            var attachmentList = $('.uploaderv3item a[target="_blank"]');

            if (attachmentList.length != 0) {

                for (var i = 0; i < attachmentList.length; i++) {

                    var fileName = attachmentList[i].innerHTML;

                    if (fileName.split('.')[0] == 'envelope' ||
                        fileName.split('.')[0] == '_log' ||
                        fileName.split('.')[fileName.split('.').length - 1] == 'cer' ||
                        fileName.split('.')[fileName.split('.').length - 1] == 'sig2' ||
                        fileName == 'print.di') {

                        $('#<%=UC_FileCenter.ClientID%>' + '_RadListView1_itemContainer > div:eq(' + i + ')').css('display', 'none');
                    }
                }
            }
        }
    }

    // 檢查是否可以送出表單
    function ValidateEdocPdf(source, args) {

        var mode = $('#<%=hfMode.ClientID%>').val();
        var previewFileGroupId = $('#<%=hfPreviewFileGroupId.ClientID%>').val();

        if (mode === 'send') {
            // 檢查previewFileGroupId是否為空

            if (previewFileGroupId === '') {
                args.IsValid = false;
                return;
            }
            else {
                var data = [previewFileGroupId];
                // 檢查previewfilegroupid有沒有檔案
                var isExist = $uof.pageMethod.syncUc("Edoc/WKFOptionalFields/EdocContent.ascx", "IsPreviewFileExist", data);

                if (isExist === 'false') {
                    args.IsValid = false;
                    return;
                }
            }
        }
        args.IsValid = true;
    }

    function CheckEDocLicense(e, args) {

        var data = ['none'];
        var checkLicense = $uof.pageMethod.syncUc("Edoc/WKFOptionalFields/EdocContent.ascx", "CheckEDocLicense", data);

        if (checkLicense === "false") {
            args.IsValid = false;
        }
        else {
            args.IsValid = true;
        }
    }

    function CheckEDocNumber(e, args) {

        var fieldMode = $('#<%=hfFieldMode.ClientID%>').val();
        var edocNumber = $('#<%=hfEdocNumber.ClientID%>').val();

        if (fieldMode == "Signin") {
            var data = [edocNumber];
            var checkLicense = $uof.pageMethod.syncUc("Edoc/WKFOptionalFields/EdocContent.ascx", "CheckEDocNumber", data);
            
            if (checkLicense === "false") {
                args.IsValid = false;
            }
            else {
                args.IsValid = true;
            }
        }
        
    }
</script>
