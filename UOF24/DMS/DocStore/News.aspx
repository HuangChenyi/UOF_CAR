<%@ Page Language="C#" MasterPageFile="~/Master/DefaultMasterPage.master" AutoEventWireup="true" Inherits="DMS_DocStore_News" Title="最新資訊" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" Codebehind="News.aspx.cs" %>
<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <script type="text/javascript">
        function OpenPDFViewerWithFileCenterV2(sJson) {
            var h = $uof.tool.printScreenSize('h', screen.availHeight);
            var w = $uof.tool.printScreenSize('w', screen.availWidth);
            $uof.window.open("PdfViewerSL.aspx?p=" + encodeURIComponent(sJson), w, h);
        }

        //15.0 UDocViewer
        function OpenUDocViewer(sJson, docid, docversion, status) {
            var data = [$uof.tool.htmlDecode(docid), $uof.tool.htmlDecode(docversion), $uof.tool.htmlDecode(status)];
            $uof.pageMethod.syncUc("DMS/DocStore/UC_DMSDoc.ascx", "StatisticsViewCount", data);
            $uof.uDocViewer.open(sJson);
        }
    </script>
    <table style="width: 100%; height: 532px;">
        <tr>
            <td style="vertical-align: top;">
                <telerik:RadTabStrip ID="RadTabStrip1" runat="server" SelectedIndex="0" MultiPageID="RadMultiPage1">
                    <Tabs>
                        <telerik:RadTab runat="server" Text="新發佈的文件(一周內)" meta:resourcekey="TabResource1">
                        </telerik:RadTab>
                        <telerik:RadTab runat="server" Text="作廢與已失效的文件" meta:resourcekey="TabResource2">
                        </telerik:RadTab>
                    </Tabs>
                </telerik:RadTabStrip>
                <telerik:RadMultiPage ID="RadMultiPage1" runat="server" SelectedIndex="0">
                    <telerik:RadPageView ID="RadPageView1" runat="server">
                        <asp:UpdatePanel id="UpdatePanel1" runat="server">
                            <contenttemplate>
                <Fast:Grid ID="Grid1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateCheckBoxColumn="False"
                        AutoGenerateColumns="False"  OnRowDataBound="Grid1_RowDataBound"
                          OnPageIndexChanging="Grid1_PageIndexChanging"
                        DataKeyOnClientWithCheckBox="False" EnhancePager="True" OnSorting="Grid1_Sorting"
                        PageSize="15" Width="100%"  DefaultSortDirection="Ascending" EmptyDataText="No data found" KeepSelectedRows="False" OnRowCommand="Grid1_RowCommand"  >
                        <ExportExcelSettings AllowExportToExcel="False" />
                        <Columns>
                            <asp:TemplateField HeaderText="文件編號" meta:resourcekey="TemplateFieldResource5" SortExpression="DOC_SERIAL">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("DOC_SERIAL") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <span style="width: 80px; word-break: break-all">
                                    <asp:Label ID="Label3" runat="server" Text='<%#: Bind("DOC_SERIAL") %>'></asp:Label>
                                    </span>
                                </ItemTemplate>
                                <HeaderStyle Width="100px" Wrap="false" />
                                <ItemStyle Width="100px" Wrap="false" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="文件名稱" meta:resourcekey="TemplateFieldResource1" SortExpression="DOC_NAME">
                                <ItemTemplate>
                                    <span style="word-break: break-all; width: 500px;">
                                        <table>
                                            <tr>
                                                <td style="min-width: 16px">
                                                    <asp:Image ID="docIcon" runat="server" ImageUrl="~/DMS/images/icon/unknown.gif" />&nbsp;
                                                </td>
                                                <td>
                                                    <asp:LinkButton ID="lbtnDocName" runat="server" Text='<%#: Bind("DOC_NAME") %>'></asp:LinkButton>
                                                </td>
                                                <td  style="width:100%;">
                                                    <table style="width:100%;">
                                                        <tr>
                                                            <td style="text-align:right;">
                                                                <asp:ImageButton ID="imgPDFViewer" CommandName="PDFViewer" CommandArgument='<%#Eval("DOC_ID")+","+Eval("MANUAL_VERSION") %>' Visible="false" runat="server" AlternateText="觀看文件"/>
                                                                <asp:Image ID="imgNoPDFViewer" runat="server" Visible="false"></asp:Image>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </td>
                                            </tr>
                                        </table>
                                    </span>
                                </ItemTemplate>
                                <HeaderStyle Wrap="false" />
                                <ItemStyle Wrap="false" />
                            </asp:TemplateField>
                            <asp:BoundField DataField="MANUAL_VERSION" HeaderText="版本" meta:resourcekey="BoundFieldResource2" SortExpression="MANUAL_VERSION" >
                            <HeaderStyle Width="100px" Wrap="False" />
                            <ItemStyle HorizontalAlign="Center" Wrap="False" />
                            </asp:BoundField>
                            <asp:TemplateField HeaderText="作者" meta:resourcekey="TemplateFieldResource2" SortExpression="DOC_AUTHOR">
                                <ItemTemplate>
                                    <asp:Label ID="lblAuthor" runat="server"></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle Width="120px" Wrap="false" />
                                <ItemStyle Width="120px" Wrap="false" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="時間" meta:resourcekey="BoundFieldResource3" SortExpression="PUBLISH_DATE">
                                <ItemTemplate>
                                    <asp:Label ID="lblTime" runat="server"></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle Width="150px" Wrap="False" />
                                <ItemStyle HorizontalAlign="Center" Wrap="False" />
                            </asp:TemplateField>
                        </Columns>
                        <EnhancePagerSettings ShowHeaderPager="True"></EnhancePagerSettings>
                    </Fast:Grid>
                            </contenttemplate>
                        </asp:UpdatePanel>
                    </telerik:RadPageView>
                    <telerik:RadPageView ID="RadPageView2" runat="server">
                        <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
                            <contenttemplate>
                <Fast:Grid ID="Grid3" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateCheckBoxColumn="False"
                                        AutoGenerateColumns="False"  OnPageIndexChanging="Grid3_PageIndexChanging"
                                        OnRowDataBound="Grid3_RowDataBound"  
                                        Width="100%" DataKeyOnClientWithCheckBox="False" EnhancePager="True" OnSorting="Grid3_Sorting"
                                        PageSize="15"  DefaultSortDirection="Ascending" EmptyDataText="No data found" KeepSelectedRows="False"  >
                                        <ExportExcelSettings AllowExportToExcel="False" />
                                        <Columns>
                                            <asp:TemplateField HeaderText="文件編號" meta:resourcekey="TemplateFieldResource6" SortExpression="DOC_SERIAL">
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("DOC_SERIAL") %>'></asp:TextBox>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <span style="width: 80px;">
                                                    <asp:Label ID="Label1" runat="server" Text='<%#: Bind("DOC_SERIAL") %>'></asp:Label>
                                                    </span>
                                                </ItemTemplate>
                                                <HeaderStyle Width="100px" Wrap="false" />
                                                <ItemStyle Width="100px" Wrap="false" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="文件名稱" meta:resourcekey="TemplateFieldResource3" SortExpression="DOC_NAME">
                                                <ItemTemplate>
                                                    <span style="word-break: break-all; width: 500px;">
                                                    <asp:Image ID="docIcon1" runat="server" ImageUrl="~/DMS/images/icon/unknown.gif" />
                                                    &nbsp;
                                                    <asp:LinkButton ID="lbtnDocName" runat="server" Text='<%#: Bind("DOC_NAME") %>'></asp:LinkButton>
                                                    </span>
                                                </ItemTemplate>
                                                <HeaderStyle Wrap="false" />
                                                <ItemStyle Wrap="false" />
                                            </asp:TemplateField>
                                            <asp:BoundField DataField="MANUAL_VERSION" HeaderText="版本" meta:resourcekey="BoundFieldResource5" SortExpression="MANUAL_VERSION">
                                            <HeaderStyle Width="100px" Wrap="False" />
                                            <ItemStyle HorizontalAlign="Center" Width="100px" Wrap="False" />
                                            </asp:BoundField>
                                            <asp:TemplateField HeaderText="作者" meta:resourcekey="TemplateFieldResource4" SortExpression="DOC_AUTHOR">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblAuthor2" runat="server"></asp:Label>
                                                </ItemTemplate>
                                                <HeaderStyle Width="120px" Wrap="False" />
                                                <ItemStyle Width="120px" Wrap="False" />
                                            </asp:TemplateField>
                                            <asp:TemplateField  HeaderText="時間" meta:resourcekey="BoundFieldResource6" SortExpression="MODIFY_DATE">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblModifyDate" runat="server"></asp:Label>
                                                </ItemTemplate>
                                                <HeaderStyle Width="150px" Wrap="False" />
                                                <ItemStyle HorizontalAlign="Center" Wrap="False" />
                                            </asp:TemplateField>
                                        </Columns>
                                        <EnhancePagerSettings ShowHeaderPager="True"></EnhancePagerSettings>
                                    </Fast:Grid>
                                           
                                </contenttemplate>
                        </asp:UpdatePanel>
                    </telerik:RadPageView>
                </telerik:RadMultiPage>
                <asp:Label ID="Label2"
                    runat="server" Text="等待核准的文件" Visible="False" meta:resourcekey="Label2Resource1"></asp:Label>
                <Fast:Grid ID="Grid2" runat="server" AutoGenerateCheckBoxColumn="False"
                    Width="90%" Visible="False" AllowSorting="True"
                    DataKeyOnClientWithCheckBox="False">
                </Fast:Grid>
            </td>
        </tr>
    </table>
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
</asp:Content>

