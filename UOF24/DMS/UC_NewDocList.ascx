<%@ Control Language="C#" AutoEventWireup="true" Inherits="DMS_UC_NewDocList" Codebehind="UC_NewDocList.ascx.cs" %>
<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<body>
    <script type="text/javascript">
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
    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <Fast:Grid ID="gvAsync" runat="server" AllowSorting="True" AutoGenerateCheckBoxColumn="False" AutoGenerateColumns="False"
                Width="100%" BorderStyle="None" BorderWidth="0px" ShowHeader="False" SkinID="HomepageBlockStyle" OnRowDataBound="gvAsync_RowDataBound" 
                AllowPaging="True" DataKeyOnClientWithCheckBox="False" OnPageIndexChanging="gvAsync_PageIndexChanging"  
                DefaultSortDirection="Ascending" EmptyDataText="沒有資料" EnhancePager="True" KeepSelectedRows="False" PageSize="15"   meta:resourcekey="gvAsyncResource1" OnRowCommand="gvAsync_RowCommand">
                <ExportExcelSettings AllowExportToExcel="False" />
                <Columns>
                    <asp:TemplateField meta:resourcekey="TemplateFieldResource1">
                        <HeaderTemplate>
                            <asp:Label ID="labAllCount" runat="server"></asp:Label>
                        </HeaderTemplate>
                        <HeaderStyle Height="0px" />
                        <ItemTemplate>
                            <table width="100%" border="0">
                                <tbody>
                                    <tr>
                                        <td style="width:16px;min-width:16px">
                                            <asp:Image ID="docIcon" runat="server" ImageUrl="~/DMS/images/icon/unknown.gif" meta:resourcekey="docIconResource1" />
                                        </td>
                                        <td>
                                            <div style="word-break: break-all;">
                                                &nbsp;
                                            <asp:LinkButton ID="LinkBtName" runat="server" Text='<%# Bind("DOC_NAME") %>'></asp:LinkButton>&nbsp;
                                            
                                            </div>
                                        </td>
                                        <td style="width:50px; text-align:right;">
                                            <asp:Image ID="imgNoPDFViewer" runat="server" Visible="false"></asp:Image>
                                            <asp:ImageButton ID="imgPDFViewer" CommandName="PDFViewer" CommandArgument='<%#Eval("DOC_ID")+","+Eval("MANUAL_VERSION") %>' Visible="false" runat="server" AlternateText="觀看文件" />
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <PagerStyle Font-Bold="False" />
                <HeaderStyle BackColor="White" />
                <EnhancePagerSettings ShowHeaderPager="True"  PageInfoCssClass="" PageNumberCssClass="" PageNumberCurrentCssClass="" PageRedirectCssClass=""/>
            </Fast:Grid>
        </ContentTemplate>
    </asp:UpdatePanel>
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

    <a id="atag" style="display:none;">Run UDoc Viewer</a>
</body>
</html>
