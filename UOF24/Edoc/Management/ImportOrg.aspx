<%@ Page Title="" Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" CodeBehind="ImportOrg.aspx.cs" Inherits="Ede.Uof.Web.Edoc.Management.ImportOrg" %>

<%@ Register Src="~/Common/FileCenter/V3/UC_FileCenter.ascx" TagPrefix="uc1" TagName="UC_FileCenter" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <style type="text/css">
        .cssHidden {
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
                if (docType.toLowerCase() == 'csv') {
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

        function OnlyImportNewData() {
            if (!confirm('只匯入此次新增的機關名單？')) return false;
        }

        function ImportAllData() {
            if (!confirm('確定匯入檔案中所有機關？')) return false;
        }


    </script>

    <asp:CustomValidator ID="cvDocType" ClientValidationFunction="CheckDocType" runat="server" Display="Dynamic"></asp:CustomValidator>
    <uc1:UC_FileCenter runat="server" ID="UC_FileCenter" ModuleName="EDOC" AllowedMultipleFileSelection="false" ScannerDisabled="true" />
    <asp:Label ID="Label1" runat="server" Text="允許檔案類型：csv"></asp:Label>
    <asp:Label ID="lblOnlySupportCsv" runat="server" Text="匯入功能僅支援csv檔" CssClass="cssHidden"></asp:Label>
    <asp:Label ID="lblNoChooseFile" runat="server" Text="請選擇要匯入的檔案" CssClass="cssHidden"></asp:Label><br />
    <asp:Label ID="lblDescription" runat="server" ForeColor="Blue" Text="說明："></asp:Label><br />
    <asp:Label ID="lblDescription2" runat="server" ForeColor="Blue" Text="1.機關代碼、機關名稱不可空白。"></asp:Label><br />
    <asp:Label ID="lblDescription3" runat="server" ForeColor="Blue" Text="2.電子公文管理員已異動過內容的受文機關，重新匯入後仍會保留異動後資料。"></asp:Label><br />
    <br />
    <asp:HyperLink ID="HyperLink1" runat="server" ForeColor="Red"></asp:HyperLink>

    <asp:Label ID="lblErrorFileName" runat="server" Text="匯入失敗原因名單.csv" CssClass="cssHidden"></asp:Label>

    <asp:Label ID="lblErrorFileDownload" runat="server" Text="匯入失敗，請點此下載錯誤清單" CssClass="cssHidden"></asp:Label>

    <asp:Label ID="lblErrorFileType" runat="server" Text="檔案格式錯誤無法匯入" ForeColor="Red" Visible="false"></asp:Label>
    <asp:Label ID="lblOrgNameNull" runat="server" Text="ORGNAME 欄位空白" Visible="false"></asp:Label>
    <asp:Label ID="lblOrgIdRepeat" runat="server" Text="ORGID 重複" Visible="false"></asp:Label>
    <asp:Label ID="lblOrgNameRepeat" runat="server" Text="ORGNAME 重複" Visible="false"></asp:Label>
    <asp:Label ID="lblOrgNameNull2" runat="server" Text="機關名稱 欄位空白" Visible="false"></asp:Label>
    <asp:Label ID="lblExchangeTypeNull" runat="server" Text="電子交換 欄位空白" Visible="false"></asp:Label>
    <asp:Label ID="lblOrgIdRepeat2" runat="server" Text="機關代碼、單位代碼 重複" Visible="false"></asp:Label>
    <asp:Label ID="lblOrgNameRepeat2" runat="server" Text="機關名稱 重複" Visible="false"></asp:Label>
    <asp:Label ID="lblExchangeTypeError" runat="server" Text="電子交換 欄位格式錯誤" Visible="false"></asp:Label>
    <asp:Label ID="lblFormatError" runat="server" Text="格式錯誤" Visible="false"></asp:Label>

    <asp:Label ID="lblStrRepeat" runat="server" Text="重複" Visible="false"></asp:Label>    
    <asp:Label ID="lblStrNull" runat="server" Text="欄位空白" Visible="false"></asp:Label>

</asp:Content>
