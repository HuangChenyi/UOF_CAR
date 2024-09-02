<%@ Page Title="" Language="C#" MasterPageFile="~/Master/DefaultMasterPage.master" AutoEventWireup="true" CodeBehind="DeleteApplyStatus.aspx.cs" Inherits="Ede.Uof.Web.DMS.Query.DeleteApplyStatus" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" %>

<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <style>
        .WordBreak {
            word-break: break-word;
            overflow: hidden;
        }
    </style>

    <script id="LoanApplyStatusjs" type="text/javascript">

        function radToolBar_Click(sender, args) {
            var toolBar = sender;
            var button = args.get_item();
            if (button.get_value() == "Delete") {
                if (confirm('<%=lblConfirmDelete.Text %>') == false)
                    args.set_cancel(true);
            }
        }

        function OpenPDFViewerWithFileCenterV2(sJson) {
            var h = $uof.tool.printScreenSize('h', screen.availHeight);
            var w = $uof.tool.printScreenSize('w', screen.availWidth);
            $uof.window.open("../DocStore/PdfViewerSL.aspx?p=" + encodeURIComponent(sJson), w, h);
        }

        //15.0 UDocViewer
        function OpenUDocViewer(sJson, docid, docversion, status) {
            var data = [$uof.tool.htmlDecode(docid), $uof.tool.htmlDecode(docversion), $uof.tool.htmlDecode(status)];
            $uof.pageMethod.syncUc("DMS/DocStore/UC_DMSDoc.ascx", "StatisticsViewCount", data);
            $uof.uDocViewer.open(sJson);
        }

        function InfoBtnClick() {
            alert('<%=lblDocIsNotFind.Text%>');
        }
    </script>

    <telerik:RadToolBar ID="radToolBar" runat="server" Width="100%" OnButtonClick="radToolBar_ButtonClick" OnClientButtonClicking="radToolBar_Click" SingleClick="None" meta:resourcekey="radToolBarResource1">
        <Items>
            <telerik:RadToolBarButton runat="server" Enabled="true" Text="刪除" Value="Delete"
                CheckedImageUrl="~/Common/Images/Icon/icon_m03.gif" DisabledImageUrl="~/Common/Images/icon_m03.gif"
                HoveredImageUrl="~/Common/Images/Icon/icon_m03.gif" ImageUrl="~/Common/Images/Icon/icon_m03.gif" meta:resourcekey="RadToolBarButtonResource1">
            </telerik:RadToolBarButton>
            <telerik:RadToolBarButton runat="server" IsSeparator="True" Value="s1" meta:resourcekey="RadToolBarButtonResource2" />
        </Items>
    </telerik:RadToolBar>

    <asp:UpdatePanel ID="upVoidApprove" runat="server">
        <ContentTemplate>
            <Fast:Grid ID="gridVoidApprove" runat="server" DataKeyNames="DOC_ID" Width="100%" PageSize="15" 
                AllowPaging="True" AllowSorting="True" AutoGenerateCheckBoxColumn="True" AutoGenerateColumns="False" 
                CustomDropDownListPage="False" 
                DataKeyOnClientWithCheckBox="True" DefaultSortDirection="Ascending"
                EnhancePager="True" EmptyDataText="沒有資料" EnableModelValidation="True" 
                KeepSelectedRows="False" 
                OnPageIndexChanging="gridVoidApprove_PageIndexChanging"
                OnRowCommand="gridVoidApprove_RowCommand"
                OnRowDataBound="gridVoidApprove_RowDataBound"
                OnSorting="gridVoidApprove_Sorting" >
                <EnhancePagerSettings ShowHeaderPager="True" />
                <ExportExcelSettings AllowExportToExcel="False" />
                <Columns>
                    <asp:TemplateField HeaderText="文件編號" SortExpression="DOC_SERIAL" meta:resourcekey="TemplateFieldResource1">
                        <ItemTemplate>
                            <span style="width: 80px;">
                                <asp:Label ID="lblDocSerial" runat="server" Text='<%#: Bind("DOC_SERIAL") %>' meta:resourcekey="lblDocSerialResource1"></asp:Label>
                            </span>
                        </ItemTemplate>
                        <HeaderStyle Width="10%" Wrap="False" />
                        <ItemStyle Wrap="False" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="文件名稱" SortExpression="DOC_NAME" meta:resourcekey="TemplateFieldResource2">
                        <ItemTemplate>
                            <span style="word-break: break-all;">
                                <table>
                                    <tr>
                                        <td style="min-width: 16px">
                                            <asp:Image runat="server" ID="docIcon1" ImageUrl="~/DMS/images/icon/unknown.gif" meta:resourcekey="docIcon1Resource1"></asp:Image>
                                            &nbsp; 
                                        </td>
                                        <td>
                                            <asp:LinkButton ID="lbtnDocName" runat="server" Text='<%#: Bind("DOC_NAME") %>' meta:resourcekey="lbtnDocNameResource1"></asp:LinkButton>
                                        </td>
                                        <td style="width: 100%;">
                                            <table style="width: 100%;">
                                                <tr>
                                                    <td style="text-align: right;">
                                                        <asp:ImageButton ID="imgPDFViewer" CommandName="PDFViewer" CommandArgument='<%# Eval("DOC_ID")+","+Eval("DOC_VERSION") %>' Visible="False" runat="server" AlternateText="觀看文件" meta:resourcekey="imgPDFViewerResource1" />
                                                        <asp:Image ID="imgNoPDFViewer" ImageUrl="~/Common/images/icon/icon_m195_g.png" runat="server" Visible="False" meta:resourcekey="imgNoPDFViewerResource1"></asp:Image>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                </table>
                            </span>
                        </ItemTemplate>
                        <HeaderStyle Wrap="False" />
                        <ItemStyle Width="20%" Wrap="False" />
                    </asp:TemplateField>
                    <asp:BoundField DataField="DOC_VERSION" HeaderText="版本" SortExpression="DOC_VERSION" meta:resourcekey="BoundFieldResource1">
                        <HeaderStyle Width="5%" Wrap="False" />
                        <ItemStyle HorizontalAlign="Center" Wrap="False" />
                    </asp:BoundField>
                    <asp:BoundField DataField="VOID_REASON" HeaderText="銷毀原因" meta:resourcekey="BoundFieldResource7" SortExpression="VOID_REASON">
                        <HeaderStyle Width="45%" Wrap="False" />
                        <ItemStyle HorizontalAlign="Left" CssClass="WordBreak" />
                    </asp:BoundField>
                    <asp:TemplateField HeaderText="狀態" SortExpression="DOC_STATUS" meta:resourcekey="TemplateFieldResource3">
                        <ItemTemplate>
                            <asp:Label runat="server" ID="lblStatus" meta:resourcekey="lblStatusResource1"></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle Width="5%" Wrap="False" />
                        <ItemStyle ForeColor="#FF8000" HorizontalAlign="Center" Wrap="False" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="開始審核時間" meta:resourcekey="TemplateFieldResource4">
                        <ItemTemplate>
                            <asp:Label runat="server" ID="lblAddDate" meta:resourcekey="lblAddDateResource1"></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle Width="10%" Wrap="False" />
                        <ItemStyle HorizontalAlign="Center" Wrap="False" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="操作" meta:resourcekey="TemplateFieldResource5">
                        <ItemTemplate>
                            <asp:LinkButton runat="server" ID="lbtnInfo" Text="資訊" meta:resourcekey="lbtnInfoResource1"></asp:LinkButton>
                        </ItemTemplate>
                        <HeaderStyle Width="5%" Wrap="False" />
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:TemplateField>
                </Columns>
                <RowStyle Height="30px" />
            </Fast:Grid>
        </ContentTemplate>
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="radToolBar" EventName="ButtonClick" />
        </Triggers>
    </asp:UpdatePanel>

    <asp:HiddenField ID="hfCurrentGuid" runat="server" />
    <asp:Label ID="lblConfirmDelete" runat="server" Text="確定要刪除?" Visible="False" meta:resourcekey="lblConfirmDeleteResource1"></asp:Label>
    <asp:Label ID="lblDocDeny" runat="server" Text="銷毀拒絕" Visible="False" meta:resourcekey="lblDocDenyResource1"></asp:Label>
    <asp:Label ID="lblApproval" runat="server" Text="審核中" Visible="False" meta:resourcekey="lblApprovalResource1"></asp:Label>
    <asp:Label ID="lblDelete" runat="server" Text="已銷毀" Visible="False" meta:resourcekey="lblDeleteResource1"></asp:Label>
    <asp:Label ID="labFileError" runat="server" ForeColor="Blue" Text="發生錯誤，檔案不存在！" Visible="False" meta:resourcekey="labFileErrorResource1"></asp:Label>
    <asp:Label ID="labAlert" runat="server" ForeColor="Blue" Text="正在進行檔案轉換，請稍後再觀看" Visible="False" meta:resourcekey="labAlertResource1"></asp:Label>
    <asp:Label ID="labPDFConvertERROR" runat="server" ForeColor="Blue" Text="發生錯誤，轉換失敗！" Visible="False" meta:resourcekey="labPDFConvertERRORResource1"></asp:Label>
    <asp:Label ID="lblNotsupportDoc" runat="server" Text="目錄設定為必須轉檔，但此檔案類型並不支援" ForeColor="Blue" Visible="False" meta:resourcekey="lblNotsupportDocResource1"></asp:Label>
    <asp:Label ID="lblProtectMsg" runat="server" Text="此為保全文件無法線上觀看" ForeColor="Blue" Visible="False" meta:resourcekey="lblProtectMsgResource1"></asp:Label>
    <asp:Label ID="lblFileNotTransferToUof" runat="server" Text="目前檔案仍在Proxy伺服器，正由系統進行傳輸中，請稍後！" Visible="False" ForeColor="Blue" meta:resourcekey="lblFileNotTransferToUofResource1"></asp:Label>
    <asp:Label ID="lblFileHasPassword" runat="server" Text="原始檔案有設定密碼，無法轉檔" Visible="False" meta:resourcekey="lblFileHasPasswordResource1"></asp:Label>
    <asp:Label ID="lblFilePageOutLimitMsg" runat="server" Text="檔案頁數{0}頁，超過可轉檔上限。" Visible="False" meta:resourcekey="lblFilePageOutLimitMsgResource1"></asp:Label>
    <asp:Label ID="lblDocSerials" runat="server" Text="文件編號：" Visible="False" meta:resourcekey="lblDocSerialsResource1"></asp:Label>
    <asp:Label ID="lblManualVersion" runat="server" Text="版本：" Visible="False" meta:resourcekey="lblManualVersionResource1"></asp:Label>
    <asp:Label ID="lblPrintUser" runat="server" Text="列印者：" Visible="False" meta:resourcekey="lblPrintUserResource1"></asp:Label>
    <asp:Label ID="lblDocIsNotFind" runat="server" Text="文件已被銷毀，無法進行觀看" Visible="False" meta:resourcekey="lblDocIsNotFindResource1"></asp:Label>
    <a id="atag" style="display: none;">Run UDoc Viewer</a>

</asp:Content>
