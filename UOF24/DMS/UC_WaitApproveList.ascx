<%@ Control Language="C#" AutoEventWireup="true" Inherits="DMS_UC_WaitApproveList" CodeBehind="UC_WaitApproveList.ascx.cs" %>
<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>

<script type="text/javascript">
    function DMS_Agree_DocApprove(DocId, ver, applicantGuid, lbtnClientID) {        
        var Data = DocId + "|" + ver + "|" + applicantGuid;
        var lbtnID = $('#' + lbtnClientID);
        $uof.dialog.open2("~/DMS/DocStore/DocApproveComment.aspx", lbtnID.get(0), "", 600, 400, function (returnValue) { return true; }, { "type": 'publish', "state": 'Accept', "data": Data });
        return false;
    }
    
    function DMS_Deny_DocApprove(DocId, ver, applicantGuid,  lbtnClientID) {
        var Data = DocId + "|" + ver + "|" + applicantGuid;
        var lbtnID = $('#' + lbtnClientID);
        $uof.dialog.open2("~/DMS/DocStore/DocApproveComment.aspx", lbtnID.get(0), "", 600, 400, function (returnValue) { return true; }, { "type": 'publish', "state": 'Reject', "data": Data });
        return false;
   }

    function DMS_Agree_DocVoid(DocId, ver, applicantGuid, lbtnClientID) {
        var Data = DocId + "|" + ver + "|" + applicantGuid;
        var lbtnID = $('#' + lbtnClientID);
        $uof.dialog.open2("~/DMS/DocStore/DocApproveComment.aspx", lbtnID.get(0), "", 600, 400, function (returnValue) { return true; }, { "type": 'void', "state": 'Accept', "data": Data });
        return false;
   }


    function DMS_Deny_DocVoid(DocId, ver, applicantGuid, lbtnClientID) {
        var Data = DocId + "|" + ver + "|" + applicantGuid;
        var lbtnID = $('#' + lbtnClientID);
        $uof.dialog.open2("~/DMS/DocStore/DocApproveComment.aspx", lbtnID.get(0), "", 600, 400, function (returnValue) { return true; }, { "type": 'void', "state": 'Reject', "data": Data });
        return false;
    }

  function DMS_Agree_DocDelete(DocId, ver, applicantGuid, lbtnClientID) {
        var Data = DocId + "|" + ver + "|" + applicantGuid;
        var lbtnID = $('#' + lbtnClientID);
        $uof.dialog.open2("~/DMS/DocStore/DocApproveComment.aspx", lbtnID.get(0), "", 600, 400, function (returnValue) { return true; }, { "type": 'delete', "state": 'Accept', "data": Data });
        return false;
   }


    function DMS_Deny_DocDelete(DocId, ver, applicantGuid, lbtnClientID) {
        var Data = DocId + "|" + ver + "|" + applicantGuid;
        var lbtnID = $('#' + lbtnClientID);
        $uof.dialog.open2("~/DMS/DocStore/DocApproveComment.aspx", lbtnID.get(0), "", 600, 400, function (returnValue) { return true; }, { "type": 'delete', "state": 'Reject', "data": Data });
        return false;
    }


    function DMS_Agree_DocLend(DocId, Author, lbtnClientID) {
        var Data = DocId + "|" + Author;
        var lbtnID = $('#' + lbtnClientID);
        $uof.dialog.open2("~/DMS/DocStore/DocApproveComment.aspx", lbtnID.get(0), "", 600, 400, function (returnValue) { return true; }, { "type": 'lend', "state": "Accept", "data": Data });
        return false;
    }


    function DMS_Deny_DocLend(DocId, Author, lbtnClientID) {
        var Data = DocId + "|" + Author;
        var lbtnID = $('#' + lbtnClientID);
        $uof.dialog.open2("~/DMS/DocStore/DocApproveComment.aspx", lbtnID.get(0), "", 600, 400, function (returnValue) { return true; }, { "type": 'lend',"state": "Reject", "data": Data });
        return false;
    }

    function OpenPDFViewerWithFileCenterV2(sJson) {
        var h = $uof.tool.printScreenSize('h', screen.availHeight);
        var w = $uof.tool.printScreenSize('w', screen.availWidth);
        $uof.window.open("DMS/DocStore/PdfViewerSL.aspx?p=" + encodeURIComponent(sJson), w, h);
    }

    //15.0 UDocViewer
    function OpenUDocViewer(sJson, docid, docversion, status) {
        var data = [$uof.tool.htmlDecode(docid), $uof.tool.htmlDecode(docversion), $uof.tool.htmlDecode(status)];
        $uof.pageMethod.syncUc("DMS/DocStore/UC_DMSDoc.ascx", "StatisticsViewCount", data);
        $uof.uDocViewer.open(sJson);
    }
</script>
<style type="text/css">
    .action_over {
        CURSOR: pointer;
        COLOR: red;
        TEXT-DECORATION: underline;
    }

    .action_out {
        COLOR: #3366cc;
    }
</style>
<asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
    <ContentTemplate>
        <Fast:Grid ID="Grid1" runat="server" AllowSorting="True" AutoGenerateCheckBoxColumn="False" AutoGenerateColumns="False" Width="100%" BorderStyle="None" BorderWidth="0px" ShowHeader="False"
            SkinID="HomepageBlockStyle" AllowPaging="True" DataKeyOnClientWithCheckBox="False" DataKeyNames="DOC_ID,APPLICANT_USER" OnRowCommand="Grid1_RowCommand" EnhancePager="True"
            PageSize="15" OnRowDataBound="Grid1_RowDataBound" OnPageIndexChanging="Grid1_PageIndexChanging" DefaultSortDirection="Ascending" EmptyDataText="沒有資料" EnableModelValidation="True"
            KeepSelectedRows="False" meta:resourcekey="Grid1Resource1">
            <ExportExcelSettings AllowExportToExcel="False" />
            <Columns>
                <asp:TemplateField meta:resourcekey="TemplateFieldResource1" ItemStyle-Width="40px">
                    <ItemTemplate>
                        <asp:Label ID="lblApproveType" runat="server" Text='<%#: Bind("APPROVE_TYPE") %>' ForeColor="Orange"></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField meta:resourcekey="TemplateFieldResource1">
                    <HeaderStyle Height="0px" />
                    <ItemTemplate>
                        <table width="100%" border="0">
                            <tbody>
                                <tr>
                                    <td style="width: 20px;">
                                        <asp:Image ID="docIcon" runat="server" meta:resourcekey="docIconResource1" ImageUrl="~/DMS/images/icon/unknown.gif"></asp:Image>
                                    </td>
                                    <td>
                                        <table style="width: 100%;">
                                            <tr>
                                                <td align="left">&nbsp;<asp:LinkButton ID="lblName" Text='<%#: Bind("DOC_NAME") %>' runat="server"></asp:LinkButton>
                                                    <asp:Label ID="lblVersion" runat="server" meta:resourcekey="lblVersionResource1" Text='<%# Bind("MANUAL_VERSION") %>'></asp:Label>
                                                    <asp:Label ID="lblUser" runat="server" meta:resourcekey="lblUserResource1"></asp:Label>
                                                </td>
                                                <td style="text-align: right">
                                                    <asp:ImageButton ID="imgPDFViewer" CommandName="PDFViewer" CommandArgument='<%#Eval("DOC_ID")+","+Eval("MANUAL_VERSION") %>' Visible="false" runat="server" AlternateText="觀看文件" />
                                                    <asp:Image ID="imgNoPDFViewer" runat="server" Visible="false"></asp:Image>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:LinkButton ID="lbtnAccept" runat="server" meta:resourcekey="ButtonFieldResource1" Text="允許" CommandName="Accept" CommandArgument='<%# Eval("DOC_ID") %>' __designer:wfdid="w2"></asp:LinkButton>
                    </ItemTemplate>
                    <HeaderStyle Width="30px" />
                    <ItemStyle HorizontalAlign="Center" Width="30px" Wrap="false" />
                </asp:TemplateField>
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:LinkButton ID="lbtnReject" runat="server" meta:resourcekey="ButtonFieldResource2" Text="拒絕" CommandName="Reject" CommandArgument='<%# Eval("DOC_ID") %>' __designer:wfdid="w3"></asp:LinkButton>
                    </ItemTemplate>
                    <HeaderStyle Width="30px" />
                    <ItemStyle HorizontalAlign="Center" Width="30px" Wrap="false" />
                </asp:TemplateField>
            </Columns>
            <EnhancePagerSettings ShowHeaderPager="True" />
        </Fast:Grid>
    </ContentTemplate>
</asp:UpdatePanel>

<asp:Label ID="lblVoidAccept" runat="server" meta:resourcekey="lblVoidAcceptResource1" Text="確定要允許作廢?" Visible="False"></asp:Label>
<asp:Label ID="lblVoidReject" runat="server" meta:resourcekey="lblVoidRejectResource1" Text="確定要拒絕作廢?" Visible="False"></asp:Label>
<asp:Label ID="lblConfirmAccept" runat="server" Text="確定要允許公佈?" Visible="False" meta:resourcekey="lblConfirmAcceptResource1"></asp:Label>
<asp:Label ID="lblConfirmReject" runat="server" Text="確定要拒絕公佈?" Visible="False" meta:resourcekey="lblConfirmRejectResource1"></asp:Label>
<asp:Label ID="lblLendAccept" runat="server" meta:resourcekey="lblLendAcceptResource1" Text="確定要允許調閱?" Visible="False"></asp:Label>
<asp:Label ID="lblLendReject" runat="server" meta:resourcekey="lblLendRejectResource1" Text="確定要拒絕調閱?" Visible="False"></asp:Label>
<asp:Label ID="lblPublish" runat="server" Text="公佈" Visible="False" meta:resourcekey="lblPublishResource1"></asp:Label>
<asp:Label ID="lblLend" runat="server" Text="調閱" Visible="False" meta:resourcekey="lblLendResource1"></asp:Label>
<asp:Label ID="lblVoid" runat="server" Text="作廢" Visible="False" meta:resourcekey="lblVoidResource1"></asp:Label>
<asp:Label ID="lblDelete" runat="server" Text="銷毀" Visible="False" meta:resourcekey="lblDeleteResource1"></asp:Label>
<asp:Label ID="labFileError" runat="server" ForeColor="Blue" Text="發生錯誤，檔案不存在！" Visible="False" meta:resourcekey="labFileErrorResource1"></asp:Label>
<asp:Label ID="labAlert" runat="server" ForeColor="Blue" Text="正在進行檔案轉換，請稍後再觀看" Visible="False" meta:resourcekey="labAlertResource1"></asp:Label>
<asp:Label ID="labPDFConvertERROR" runat="server" ForeColor="Blue" Text="發生錯誤，轉換失敗！" Visible="False" meta:resourcekey="labPDFConvertERRORResource1"></asp:Label>
<asp:Label ID="lblNotsupportDoc" runat="server" Text="目錄設定為必須轉檔，但此檔案類型並不支援" ForeColor="Blue" Visible="False" meta:resourcekey="lblNotsupportDocResource1"></asp:Label>
<asp:Label ID="lblProtectMsg" runat="server" Text="此為保全文件無法線上觀看" ForeColor="Blue" Visible="False" meta:resourcekey="lblProtectMsgResource1"></asp:Label>
<asp:Label ID="lblFileNotTransferToUof" runat="server" Text="目前檔案仍在Proxy伺服器，正由系統進行傳輸中，請稍後！" Visible="False" ForeColor="Blue" meta:resourcekey="lblFileNotTransferToUofResource1"></asp:Label>
<asp:Label ID="lblFilePageOutLimitMsg" runat="server" Text="檔案頁數{0}頁，超過可轉檔上限。" Visible="false" meta:resourcekey="lblFilePageOutLimitMsgResource1"></asp:Label>
<asp:Label ID="lblFileHasPassword" runat="server" Text="原始檔案有設定密碼，無法轉檔" Visible="false" meta:resourcekey="lblFileHasPasswordResource1"></asp:Label>
<asp:Label ID="lblDocSerial" runat="server" Text="文件編號：" Visible="false" meta:resourcekey="lblDocSerialResource1"></asp:Label>
<asp:Label ID="lblManualVersion" runat="server" Text="版本：" Visible="false" meta:resourcekey="lblManualVersionResource1"></asp:Label>
<asp:Label ID="lblPrintUser" runat="server" Text="列印者：" Visible="false" meta:resourcekey="lblPrintUserResource1"></asp:Label>

<a id="atag" style="display: none;">Run UDoc Viewer</a>