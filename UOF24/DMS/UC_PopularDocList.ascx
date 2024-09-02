<%@ Control Language="C#" AutoEventWireup="true" Inherits="DMS_UC_PopularDocList" Codebehind="UC_PopularDocList.ascx.cs" %>
<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>
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
<asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>
        <telerik:RadToolBar ID="RadToolBar1" runat="server" SingleClick="None" Width="100%" meta:resourcekey="RadToolBar1Resource1">
            <Items>
                <telerik:RadToolBarButton runat="server" Value="mode" Text="Button 0" meta:resourcekey="RadToolBarButtonResource1">
                    <ItemTemplate>
                        <asp:Label ID="lblMode" runat="server" Text="計算依據" meta:resourcekey="lblModeResource1"></asp:Label>
                        <asp:DropDownList ID="ddlMode" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlMode_SelectedIndexChanged" meta:resourcekey="ddlModeResource1">
                            <asp:ListItem Value="numberofpeople" Text="依人數" meta:resourcekey="ListItemResource2"></asp:ListItem>
                            <asp:ListItem Value="times" Text="依次數" meta:resourcekey="ListItemResource1"></asp:ListItem>
                        </asp:DropDownList>
                    </ItemTemplate>
                </telerik:RadToolBarButton>
                <telerik:RadToolBarButton runat="server" Text="Button 1" IsSeparator="True" meta:resourcekey="RadToolBarButtonResource2">
                </telerik:RadToolBarButton>
            </Items>
        </telerik:RadToolBar>
        <Fast:Grid ID="Grid1" Width="100%" AutoGenerateCheckBoxColumn="False" ShowHeader="False" SkinID="HomepageBlockStyle" runat="server" AllowSorting="True" AutoGenerateColumns="False" CustomDropDownListPage="False" DataKeyOnClientWithCheckBox="False" DefaultSortDirection="Ascending" EmptyDataText="No data found" EnhancePager="True" KeepSelectedRows="False" SelectedRowColor="" UnSelectedRowColor="" OnRowDataBound="Grid1_RowDataBound" OnRowCommand="Grid1_RowCommand" AllowPaging="True" OnPageIndexChanging="Grid1_PageIndexChanging" meta:resourcekey="Grid1Resource1" PageSize="15">
            <EnhancePagerSettings   PageInfoCssClass="" PageNumberCssClass="" PageNumberCurrentCssClass="" PageRedirectCssClass=""  ShowHeaderPager="True" />
            <ExportExcelSettings AllowExportToExcel="False" />
            <Columns>
                <asp:TemplateField meta:resourcekey="TemplateFieldResource1">
                    <ItemTemplate>
                        <table style="width:100%" border="0">
                            <tbody>
                                <tr>
                                    <td style="width:19px;min-width:19px;">
                                        <asp:Image ID="hotIcon" runat="server"  />
                                    </td>
                                    <td style="width:16px;min-width:16px;">
                                        <asp:Image ID="docIcon" runat="server" ImageUrl="~/DMS/images/icon/unknown.gif" meta:resourcekey="docIconResource1"  />
                                    </td>
                                    <td>
                                        <div style="word-break: break-all;">
                                        &nbsp;
                                        <asp:LinkButton ID="LinkBtName" runat="server" CommandName="DocLink" CommandArgument='<%# Eval("DOC_ID") %>' meta:resourcekey="LinkBtNameResource1" ></asp:LinkButton>&nbsp;
                                        </div>
                                    </td>
                                    <td style="width:50px; text-align:right;">
                                        <asp:Image ID="imgNoPDFViewer" runat="server" Visible="False" meta:resourcekey="imgNoPDFViewerResource1"></asp:Image>
                                        <asp:ImageButton ID="imgPDFViewer" CommandName="PDFViewer" CommandArgument='<%# Eval("DOC_ID") %>' Visible="False" runat="server" meta:resourcekey="imgPDFViewerResource1" />
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </Fast:Grid>
        <asp:Label ID="labFileError" runat="server" ForeColor="Blue" Text="發生錯誤，檔案不存在！" Visible="False" meta:resourcekey="labFileErrorResource1" ></asp:Label>
        <asp:Label ID="labAlert" runat="server" ForeColor="Blue" Text="正在進行檔案轉換，請稍後再觀看" Visible="False" meta:resourcekey="labAlertResource1" ></asp:Label>
        <asp:Label ID="labPDFConvertERROR" runat="server" ForeColor="Blue" Text="發生錯誤，轉換失敗！" Visible="False" meta:resourcekey="labPDFConvertERRORResource1" ></asp:Label>
        <asp:Label ID="lblNotsupportDoc" runat="server" Text="目錄設定為必須轉檔，但此檔案類型並不支援" ForeColor="Blue" Visible="False" meta:resourcekey="lblNotsupportDocResource1" ></asp:Label>
        <asp:Label ID="lblProtectMsg" runat="server" Text="此為保全文件無法線上觀看" ForeColor="Blue" Visible="False" meta:resourcekey="lblProtectMsgResource1" ></asp:Label>
        <asp:Label ID="lblFileNotTransferToUof" runat="server" Text="目前檔案仍在Proxy伺服器，正由系統進行傳輸中，請稍後！" Visible="False" ForeColor="Blue" meta:resourcekey="lblFileNotTransferToUofResource1" ></asp:Label>
        <asp:Label ID="lblFilePageOutLimitMsg" runat="server" Text="檔案頁數{0}頁，超過可轉檔上限。" Visible="false" meta:resourcekey="lblFilePageOutLimitMsgResource1"></asp:Label>
        <asp:Label ID="lblFileHasPassword" runat="server" Text="原始檔案有設定密碼，無法轉檔" Visible="false" meta:resourcekey="lblFileHasPasswordResource1"></asp:Label>
        <asp:Label ID="lblNoDocPermission" runat="server" Text="無文件觀看權限。" Visible="False" meta:resourcekey="lblNoDocPermissionResource1"></asp:Label>
        <asp:Label ID="lblDocSerial" runat="server" Text="文件編號：" Visible="false" meta:resourcekey="lblDocSerialResource1"></asp:Label>
        <asp:Label ID="lblManualVersion" runat="server" Text="版本：" Visible="false" meta:resourcekey="lblManualVersionResource1"></asp:Label>
        <asp:Label ID="lblPrintUser" runat="server" Text="列印者：" Visible="false" meta:resourcekey="lblPrintUserResource1"></asp:Label>
        <asp:HiddenField ID="hfUserGuid" runat="server" />

        <a id="atag" style="display:none;">Run UDoc Viewer</a>
    </ContentTemplate>
</asp:UpdatePanel>
