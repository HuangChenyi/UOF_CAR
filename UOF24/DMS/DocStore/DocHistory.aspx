<%@ Page Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="DMS_DocStore_DocHistory" Title="文件版本歷程" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" Codebehind="DocHistory.aspx.cs" %>

<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">


    <style type="text/css">
        .action_over
        {
            CURSOR: hand;
            COLOR: red;
            TEXT-DECORATION: underline;
        }

        .action_out
        {
            COLOR: #3366cc;
        }

        .style1
        {
            width: 100%;
        }
    </style>

    <script type="text/jscript">

        var AppPath;
        $(function () {

            AppPath = '<%=System.Web.Security.AntiXss.AntiXssEncoder.HtmlEncode(hdAppPath, true) %>';
        });

        //2012-5-24 ELTON, add for download file by [FileCenterV2 FileControlHandler]
        function DownloadFileWithHandler(sHandlerUrl, sUserProxyIndex) {
            $uof.download(sHandlerUrl, sUserProxyIndex);
        }

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

    <b><i>
        <asp:Label ID="Label1" runat="server" Text="版本歷程" CssClass="SizeXL" meta:resourcekey="Label1Resource1"></asp:Label></i></b><br />
    <hr color="#99ccff" />
    <table style="width: 100%;">
        <tr>
            <td style="width: 120px; white-space: nowrap;">
                <asp:Label ID="Label2" runat="server" Text="這份文件的版本歷程：" meta:resourcekey="Label2Resource1"></asp:Label>
            </td>
            <td><span style="word-break: break-all; width: 500px;">
                <asp:Image ID="docIcon" runat="server" ImageUrl="~/DMS/images/icon/unknown.gif" meta:resourcekey="docIconResource1" />

                <asp:Label ID="lblDocName" runat="server" meta:resourcekey="lblDocNameResource1"></asp:Label>
            </span>
            </td>
        </tr>
    </table>
    <asp:CheckBox ID="CheckBox1" runat="server" Text="只顯示公佈的正式版本" AutoPostBack="True" OnCheckedChanged="CheckBox1_CheckedChanged" meta:resourcekey="CheckBox1Resource1" Checked="True" /><br />
    <br />
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <Fast:Grid ID="Grid1" runat="server" AllowSorting="True" AutoGenerateCheckBoxColumn="False"
                AutoGenerateColumns="False"
                Width="100%" OnRowDataBound="Grid1_RowDataBound"
                AllowPaging="True" OnPageIndexChanging="Grid1_PageIndexChanging"
                DataKeyOnClientWithCheckBox="False" EnhancePager="True"
                OnSorting="Grid1_Sorting" PageSize="15" DefaultSortDirection="Ascending"
                EmptyDataText="沒有資料"
                KeepSelectedRows="False"    meta:resourcekey="Grid1Resource1" OnRowCommand="Grid1_RowCommand">
                <ExportExcelSettings AllowExportToExcel="False" />
                <Columns>
                    <asp:BoundField DataField="MANUAL_VERSION" HeaderText="實際版本"
                        meta:resourcekey="BoundFieldResource1" SortExpression="MANUAL_VERSION">
                        <HeaderStyle Width="80px" Wrap="False" />
                    </asp:BoundField>
                    <asp:BoundField DataField="SYS_VERSION" HeaderText="系統版本"
                        meta:resourcekey="BoundFieldResource2" SortExpression="SYS_VERSION">
                        <HeaderStyle Width="80px" Wrap="False" />
                    </asp:BoundField>
                    <asp:TemplateField HeaderText="文件名稱" meta:resourcekey="TemplateFieldResource1" SortExpression="DOC_NAME">
                        <ItemTemplate>
                            <span style="vertical-align: top">
                                <table style="width:100%">
                                    <tr>
                                        <td>
                                            &nbsp;<asp:LinkButton ID="labDLFile" Text='<%#: Bind("DOC_NAME") %>' runat="server" meta:resourcekey="labDLFileResource1"></asp:LinkButton>
                                        </td>
                                        <td style="text-align:right">
                                            <asp:ImageButton ID="imgPDFViewer" CommandName="PDFViewer" CommandArgument='<%#Eval("DOC_ID")+","+Eval("MANUAL_VERSION") %>' Visible="false" runat="server" AlternateText="觀看文件" />
                                            <asp:Image ID="imgNoPDFViewer" runat="server" Visible="false"></asp:Image>
                                        </td>
                                    </tr>
                                </table>
                            </span>
                        </ItemTemplate>
                        <ItemStyle VerticalAlign="Top" />
                        <HeaderStyle Wrap="False" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="作者" meta:resourcekey="TemplateFieldResource2" SortExpression="DOC_AUTHOR">
                        <ItemTemplate>
                            <asp:Label runat="server" ID="lblAuthor" meta:resourcekey="lblAuthorResource1"></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle Width="200px"/>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="審核模式" meta:resourcekey="TemplateFieldResource5"
                        SortExpression="APPROVE_TYPE">
                        <ItemTemplate>
                            <asp:Label ID="lblApprovalStatus" runat="server" meta:resourcekey="lblApprovalStatusResource1"></asp:Label>
                            <br>
                            <asp:Label ID="Label5" runat="server" Text="(" Visible="False" meta:resourcekey="Label5Resource1"></asp:Label>
                            <asp:Label ID="lblApprovalUser" runat="server" meta:resourcekey="lblApprovalUserResource1"></asp:Label>
                            <asp:Label ID="Label7" runat="server" Text=")" Visible="False" meta:resourcekey="Label7Resource1"></asp:Label>

                            <br />
                            <asp:Label ID="lblVoidStatus" runat="server" meta:resourcekey="lblVoidStatusResource1"></asp:Label>
                            <br />
                            <asp:Label ID="Label8" runat="server" Text="(" Visible="False" meta:resourcekey="Label8Resource1"></asp:Label>
                            <asp:Label ID="lblVoidUser" runat="server" meta:resourcekey="lblVoidUserResource1"></asp:Label>
                            <asp:Label ID="Label10" runat="server" Text=")" Visible="False" meta:resourcekey="Label10Resource1"></asp:Label>

                        </ItemTemplate>
                        <HeaderStyle Width="100px" Wrap="False" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="狀態" meta:resourcekey="TemplateFieldResource3" SortExpression="DOC_STATUS">
                        <ItemTemplate>
                            <asp:Label runat="server" ID="lblStatus" meta:resourcekey="lblStatusResource1"></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle Width="60px" Wrap="False" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="發佈時間" meta:resourcekey="BoundFieldResource3" SortExpression="PUBLISH_DATE">
                        <ItemTemplate>
                            <asp:Label runat="server" ID="lblPublishDate" Text=""></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle Width="120px" Wrap="False" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="操作" meta:resourcekey="TemplateFieldResource4">
                        <EditItemTemplate>
                            <asp:TextBox runat="server" ID="TextBox1" meta:resourcekey="TextBox1Resource1"></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <table class="style1">
                                <tr>
                                    <td>
                                        <asp:LinkButton ID="LinkButton1" runat="server" 
                                            meta:resourceKey="LinkButton1Resource1" Text="版本備註"></asp:LinkButton>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:LinkButton ID="LinkButton3" runat="server" 
                                            meta:resourceKey="LinkButton3Resource1" Text="評分意見表"></asp:LinkButton>
                                    </td>

                                </tr>
                                <tr>
                                    <td>
                                        <asp:LinkButton ID="lbtnSignInfo" runat="server" Text="簽核資訊" meta:resourcekey="lbtnSignInfoResource2"></asp:LinkButton>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:LinkButton ID="lbtnVoidInfo" runat="server" Text="作廢簽核資訊" meta:resourcekey="lbtnVoidInfoResource1"></asp:LinkButton>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:LinkButton ID="lbtnDocApproveLog" Enabled="False" runat="server" Text="簡易審核歷程" meta:resourcekey="lbtnDocApproveLogResource1"></asp:LinkButton>
                                    </td>
                                </tr>
                                <tr runat="server" id="trPrint" visible="false">
                                    <td>
                                        <asp:LinkButton ID="lbtnPrintRecord" Enabled="False" runat="server" Text="紙本分發管制" meta:resourcekey="lbtnPrintRecordResource1" ></asp:LinkButton>
                                    </td>
                                </tr>
                                <tr runat="server" id="trDocChange" visible="false">
                                    <td>
                                        <asp:LinkButton ID="lbtnDocChangeHistory" runat="server" Text="文件置換歷程" meta:resourcekey="lbtnDocChangeHistoryResource1" ></asp:LinkButton>
                                    </td>
                                </tr>
                            </table>
                        </ItemTemplate>
                        <HeaderStyle Width="100px" Wrap="False" />
                    </asp:TemplateField>
                </Columns>
                <EnhancePagerSettings
                    ShowHeaderPager="True" />
            </Fast:Grid>
        </ContentTemplate>
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="CheckBox1" EventName="CheckedChanged"></asp:AsyncPostBackTrigger>
        </Triggers>
    </asp:UpdatePanel>

    <asp:Label ID="Label3" runat="server" Text="每次您存回一份文件，就會產生一個新的版本。此歷程顯示文件所有的版本資訊。 草稿版本顯示為X.1、X.2，以此類推。公佈的版本顯示為X.0。" meta:resourcekey="Label3Resource1"></asp:Label><br />
    <br />
    <asp:Label ID="Label4" runat="server" Text="例如：2.0是一個公佈的版本，而2.5是一個草稿版本。" meta:resourcekey="Label4Resource1"></asp:Label>
    <asp:Label ID="lblCheckIn" runat="server" Text="已存回" Visible="False" meta:resourcekey="lblCheckInResource1"></asp:Label>
    <asp:Label ID="lblCheckOut" runat="server" Text="已取出" Visible="False" meta:resourcekey="lblCheckOutResource1"></asp:Label>
    <asp:Label ID="lblApproval" runat="server" Text="審核中" Visible="False" meta:resourcekey="lblApprovalResource1"></asp:Label>
    <asp:Label ID="lblPublish" runat="server" Text="已公佈" Visible="False" meta:resourcekey="lblPublishResource1"></asp:Label>
    <asp:Label ID="labNoActive" runat="server" Text="未生效" Visible="False" meta:resourcekey="labNoActiveResource1"></asp:Label>
    <asp:Label ID="lblInactive" runat="server" Text="文件失效" Visible="False" meta:resourcekey="lblInactiveResource1"></asp:Label>
    <asp:Label ID="lblVoid" runat="server" Text="文件作廢" Visible="False" meta:resourcekey="lblVoidResource1"></asp:Label>
    <asp:Label ID="lblTempInact" runat="server" Text="已下架" Visible="False" meta:resourcekey="lblTempInactResource1"></asp:Label>
    <asp:Label ID="lblOldVer" runat="server" Text="舊版本" Visible="False" meta:resourcekey="lblOldVerResource1"></asp:Label>
    <asp:HiddenField ID="hideSource" runat="server" />
    <asp:Label ID="lblDocDeny" runat="server" Text="發佈拒絕" meta:resourcekey="lblDocDenyResource1" Visible="False"></asp:Label>
    <asp:Label ID="lblDMSStatus" runat="server" Text="發佈審核：簡易流程" Visible="False" meta:resourcekey="lblDMSStatusResource1"></asp:Label>
    <asp:Label ID="lblWKFStatus" runat="server" Text="發佈審核：電子簽核" Visible="False" meta:resourcekey="lblWKFStatusResource1"></asp:Label>
    <asp:Label ID="lblNoNeedApproval" runat="server" Text="發佈不需審核" Visible="False" meta:resourcekey="lblNoNeedApprovalResource1"></asp:Label>

    <!--2012-5-23 ELTON, 因檔案仍在Proxy尚未傳輸到UOF, 需顯示警告訊息-->
    <asp:Label ID="lblFileNotTransferToUof" runat="server" Text="目前檔案仍在Proxy伺服器，正由系統進行傳輸中，請稍後！" Visible="False" ForeColor="Blue" meta:resourcekey="lblFileNotTransferToUofResource1"></asp:Label>

    <asp:Label ID="lblVoidDMSStatus" runat="server" Text="作廢審核：簡易流程" Visible="False" meta:resourcekey="lblVoidDMSStatusResource1"></asp:Label>
    <asp:Label ID="lblVoidWKFStatus" runat="server" Text="作廢審核：電子簽核" Visible="False" meta:resourcekey="lblVoidWKFStatusResource1"></asp:Label>
    <asp:Label ID="lblNoNeedVoid" runat="server" Text="作廢不需審核" Visible="False" meta:resourcekey="lblNoNeedVoidResource1"></asp:Label>
    <asp:Label ID="labFileError" runat="server" ForeColor="Blue" Text="發生錯誤，檔案不存在！" Visible="False" meta:resourcekey="labFileErrorResource1"></asp:Label>
    <asp:Label ID="labAlert" runat="server" ForeColor="Blue" Text="正在進行檔案轉換，請稍後再觀看" Visible="False" meta:resourcekey="labAlertResource1"></asp:Label>
    <asp:Label ID="labPDFConvertERROR" runat="server" ForeColor="Blue" Text="發生錯誤，轉換失敗！" Visible="False" meta:resourcekey="labPDFConvertERRORResource1"></asp:Label>
    <asp:Label ID="lblNotsupportDoc" runat="server" Text="目錄設定為必須轉檔，但此檔案類型並不支援" ForeColor="Blue" Visible="False" meta:resourcekey="lblNotsupportDocResource1"></asp:Label>
    <asp:Label ID="lblProtectMsg" runat="server" Text="此為保全文件無法線上觀看" ForeColor="Blue" Visible="False" meta:resourcekey="lblProtectMsgResource1"></asp:Label>
    <asp:Label ID="Label6" runat="server" Text="目前檔案仍在Proxy伺服器，正由系統進行傳輸中，請稍後！" Visible="False" ForeColor="Blue" meta:resourcekey="Label6Resource1"></asp:Label>
    <asp:Label ID="lblFileHasPassword" runat="server" Text="原始檔案有設定密碼，無法轉檔" Visible="false" meta:resourcekey="lblFileHasPasswordResource1"></asp:Label>
    <asp:Label ID="lblFilePageOutLimitMsg" runat="server" Text="檔案頁數{0}頁，超過可轉檔上限。" Visible="false" meta:resourcekey="lblFilePageOutLimitMsgResource1"></asp:Label>
    <asp:Label ID="lblDocSerial" runat="server" Text="文件編號：" Visible="false" meta:resourcekey="lblDocSerialResource1"></asp:Label>
    <asp:Label ID="lblManualVersion" runat="server" Text="版本：" Visible="false" meta:resourcekey="lblManualVersionResource1"></asp:Label>
    <asp:Label ID="lblPrintUser" runat="server" Text="列印者：" Visible="false" meta:resourcekey="lblPrintUserResource1"></asp:Label>
    <asp:HiddenField ID="hfCurrentUser" runat="server" />

    <a id="atag" style="display:none;">Run UDoc Viewer</a>
</asp:Content>

