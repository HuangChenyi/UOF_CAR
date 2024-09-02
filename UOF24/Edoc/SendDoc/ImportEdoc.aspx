<%@ Page Title="" Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" CodeBehind="ImportEdoc.aspx.cs" Inherits="Ede.Uof.Web.Edoc.SendDoc.ImportEdoc" %>

<%@ Register Src="~/Common/FileCenter/V3/UC_FileCenter.ascx" TagPrefix="uc1" TagName="UC_FileCenter" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        
    <style type="text/css">
        .cssHidden{
            display: none;
        }
    </style>
        
    <script type="text/javascript">

        function CheckDocType(source, args) {

            var attachmentList = $('#<%= UC_FileCenter.ClientID %> .uploaderv3item a[target=_blank]');

            // 判斷是否有選取檔案
            if (attachmentList.length != 0) {

                // 取得完整檔名
                var fileName = attachmentList[0].innerHTML;

                // 取得副檔名
                var docType = fileName.split('.')[fileName.split('.').length - 1];

                // 判斷副檔名是否為csv
                if (docType.toLowerCase() == 'zip') {
                    args.IsValid = true;
                }
                else {
                    source.textContent = $('#<%= lblOnlySupportCsv.ClientID %>').text();    // 給予錯誤訊息
                    args.IsValid = false;
                    return;
                }
            }
            else {
                source.textContent = $('#<%= lblNoChooseFile.ClientID %>').text();  // 給予錯誤訊息
                args.IsValid = false;
                return;
            }
        }
    </script>
    <asp:CustomValidator ID="cvDocType" ClientValidationFunction="CheckDocType" runat="server" Display="Dynamic"></asp:CustomValidator>
    <uc1:UC_FileCenter runat="server" ID="UC_FileCenter" ModuleName="EDOC" AllowedMultipleFileSelection="false" />
    <asp:Label ID="lblAllowFileTypeTip" runat="server" Text="允許檔案類型：zip"></asp:Label>
    <asp:Label ID="lblOnlySupportCsv" runat="server" Text="匯入功能僅支援zip檔" CssClass="cssHidden"></asp:Label>
    <asp:Label ID="lblNoChooseFile" runat="server" Text="請選擇要匯入的檔案" CssClass="cssHidden"></asp:Label>
    <asp:Label ID="lblDocTypeError" runat="server" Text="檔案中公文類型與表單公文類型不符，無法匯入。" ForeColor="Red" CssClass="cssHidden"></asp:Label>
    <asp:Label ID="lblSendOrgIsNotMatch" runat="server" Text="檔案中發文機關與表單發文機關不符，無法匯入。" ForeColor="Red" CssClass="cssHidden"></asp:Label>
    <asp:Label ID="lblReceiveOrgIsNotExist" runat="server" Text="檔案中受文機關不存在，請更新受文機關通訊錄。" ForeColor="Red" CssClass="cssHidden"></asp:Label>
    <asp:Label ID="lblSecretTypeIsNotAllow" runat="server" Text="公文檔案有設定密等，無法匯入。" ForeColor="Red" CssClass="cssHidden"></asp:Label>
    <asp:Label ID="lblImportFileFormatError" runat="server" Text="公文檔案內容錯誤或格式不正確，無法匯入。" ForeColor="Red" CssClass="cssHidden"></asp:Label>
    <asp:Label ID="lblLostDiAndSwFile" runat="server" Text="公文檔案缺少DI檔與SW檔，無法匯入。" ForeColor="Red" CssClass="cssHidden"></asp:Label>
    <asp:Label ID="lblLostDiFile" runat="server" Text="公文檔案缺少DI檔，無法匯入。" ForeColor="Red" CssClass="cssHidden"></asp:Label>
    <asp:Label ID="lblLostSwFile" runat="server" Text="公文檔案缺少SW檔，無法匯入。" ForeColor="Red" CssClass="cssHidden"></asp:Label>
    <asp:Label ID="lblErrorFile" runat="server" Text="匯入的zip檔案不可包含子目錄，請重新選擇檔案。" ForeColor="Red" CssClass="cssHidden"></asp:Label>

    <asp:HiddenField ID="hfDocType" runat="server" />
</asp:Content>