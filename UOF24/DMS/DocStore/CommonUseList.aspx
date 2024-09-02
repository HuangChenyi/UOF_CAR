<%@ Page Language="C#" MasterPageFile="~/Master/DefaultMasterPage.master" AutoEventWireup="true" Inherits="DMS_DocStore_CommonUseList" Title="常用文件區" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" Codebehind="CommonUseList.aspx.cs" %>

<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <script type="text/javascript">
        function RadFolderToolbar1_Click(sender, args) {
            //Add code to handle your event here.
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
            $uof.window.open("PdfViewerSL.aspx?p=" + encodeURIComponent(sJson), w, h);
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
            <telerik:RadToolBar ID="RadFolderToolbar1" runat="server" Width="100%" OnButtonClick="RadFolderToolbar1_ButtonClicked" OnClientButtonClicking="RadFolderToolbar1_Click" meta:resourcekey="barMainResource1">
                <Items>
                    <telerik:RadToolBarButton runat="server" Enabled="true" CheckedImageUrl="~/Common/Images/Icon/icon_m03.gif" DisabledImageUrl="~/Common/Images/Icon/icon_m03.gif" HoveredImageUrl="~/Common/Images/Icon/icon_m03.gif" ImageUrl="~/Common/Images/Icon/icon_m03.gif" Text="取消" Value="Delete" meta:resourcekey="TBarButtonResource1">
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton runat="server" IsSeparator="True" Value="s1" meta:resourcekey="RadToolBarButtonResource2" />
                </Items>
            </telerik:RadToolBar>
            <Fast:Grid ID="Grid2" runat="server" AllowSorting="True" AutoGenerateCheckBoxColumn="True"
                AutoGenerateColumns="False"
                Width="100%" OnRowDataBound="Grid2_RowDataBound" AllowPaging="True" OnPageIndexChanging="Grid2_PageIndexChanging" DataKeyNames="DOC_ID" DataKeyOnClientWithCheckBox="False" EnhancePager="True" OnSorting="Grid2_Sorting" PageSize="15"  DefaultSortDirection="Ascending" EmptyDataText="No data found" KeepSelectedRows="False" OnRowCommand="Grid2_RowCommand"  >
                <ExportExcelSettings AllowExportToExcel="False" />
                <Columns>
                    <asp:TemplateField HeaderText="文件編號" SortExpression="DOC_SERIAL" meta:resourcekey="TemplateFieldResource4">
                        <EditItemTemplate>
                            <asp:TextBox runat="server" Text='<%# Bind("DOC_SERIAL") %>' ID="TextBox1"></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <span style="width: 80px;">
                                <asp:Label runat="server" Text='<%#: Bind("DOC_SERIAL") %>' ID="Label1"></asp:Label>
                            </span>
                        </ItemTemplate>
                        <HeaderStyle Width="100px" Wrap="false" />
                        <ItemStyle Width="100px" Wrap="false" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="文件名稱" meta:resourcekey="TemplateFieldResource1" SortExpression="DOC_NAME">
                        <ItemTemplate>
                            <span style="word-break: break-all; width: 450px;">
                                <table>
                                    <tr>
                                        <td style="min-width: 16px">
                                            <asp:Image ID="docIcon" runat="server" ImageUrl="~/DMS/images/icon/unknown.gif"></asp:Image>&nbsp; 
                                        </td>
                                        <td>
                                            <asp:LinkButton ID="lbtnDLFile" runat="server" Text='<%#: Bind("DOC_NAME") %>'></asp:LinkButton>
                                        </td>
                                        <td  style="width:100%;">
                                            <table style="width:100%;">
                                                <tr>
                                                    <td style="text-align:right;">
                                                        <asp:ImageButton ID="imgPDFViewer" CommandName="PDFViewer" CommandArgument='<%#Eval("DOC_ID")+","+Eval("PUBLISH_MANUAL_VERSION") %>' Visible="false" runat="server" AlternateText="觀看文件" />
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
                    <asp:TemplateField HeaderText="作者" meta:resourcekey="TemplateFieldResource2" SortExpression="DOC_AUTHOR">
                        <ItemTemplate>
                            <asp:Label runat="server" ID="lblAuthor"></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle Width="200px" Wrap="False" />
                        <ItemStyle Width="200px" Wrap="False" />
                    </asp:TemplateField>
                    <asp:BoundField DataField="PUBLISH_MANUAL_VERSION" HeaderText="版本" meta:resourcekey="BoundFieldResource2" SortExpression="PUBLISH_MANUAL_VERSION" >
                    <HeaderStyle Width="100px" Wrap="False" />
                    <ItemStyle HorizontalAlign="Center" Wrap="False" />
                    </asp:BoundField>
                    <asp:TemplateField HeaderText="路徑" meta:resourcekey="TemplateFieldResource3">
                        <ItemTemplate>
                            <asp:Label runat="server" ID="lblPath"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <EnhancePagerSettings
                    ShowHeaderPager="True" FirstAltImageUrl="" FirstImageUrl="" LastAltImage="" LastImageUrl="" NextIAltImageUrl="" NextImageUrl="" PageInfoCssClass="" PageNumberCssClass="" PageNumberCurrentCssClass="" PageRedirectCssClass="" PreviousAltImageUrl="" PreviousImageUrl="" />
            </Fast:Grid>
        </ContentTemplate>
    </asp:UpdatePanel>

    <asp:Label ID="lblConfirmDelete" runat="server" Text="確定要取消?" Visible="False" meta:resourcekey="lblConfirmDeleteResource1"></asp:Label>
    <asp:Label ID="lblConfirmDeleteUse" runat="server" Text="確定要將此常用列表取消?" Visible="False" meta:resourcekey="lblConfirmDeleteUseResource1"></asp:Label>
    <asp:Label ID="labFileError" runat="server" ForeColor="Blue" Text="發生錯誤，檔案不存在！" Visible="False" meta:resourcekey="labFileErrorResource1"></asp:Label>
    <asp:Label ID="labAlert" runat="server" ForeColor="Blue" Text="正在進行檔案轉換，請稍後再觀看" Visible="False" meta:resourcekey="labAlertResource1"></asp:Label>
    <asp:Label ID="labPDFConvertERROR" runat="server" ForeColor="Blue" Text="發生錯誤，轉換失敗！" Visible="False" meta:resourcekey="labPDFConvertERRORResource1"></asp:Label>
    <asp:Label ID="lblNotsupportDoc" runat="server" Text="目錄設定為必須轉檔，但此檔案類型並不支援" ForeColor="Blue" Visible="False" meta:resourcekey="lblNotsupportDocResource1"></asp:Label>
    <asp:Label ID="lblProtectMsg" runat="server" Text="此為保全文件無法線上觀看" ForeColor="Blue" Visible="False" meta:resourcekey="lblProtectMsgResource1"></asp:Label>
    <asp:Label ID="lblFileNotTransferToUof" runat="server" Text="目前檔案仍在Proxy伺服器，正由系統進行傳輸中，請稍後！" Visible="False" ForeColor="Blue" meta:resourcekey="lblFileNotTransferToUofResource1"></asp:Label>
    <asp:Label ID="lblFileHasPassword" runat="server" Text="原始檔案有設定密碼，無法轉檔" Visible="false" meta:resourcekey="lblFileHasPasswordResource1"></asp:Label>
    <asp:Label ID="lblFilePageOutLimitMsg" runat="server" Text="檔案頁數{0}頁，超過可轉檔上限。" Visible="false" meta:resourcekey="lblFilePageOutLimitMsgResource1"></asp:Label>
    <asp:Label ID="lblDocSerial" runat="server" Text="文件編號：" Visible="false" meta:resourcekey="lblDocSerialResource1"></asp:Label>
    <asp:Label ID="lblManualVersion" runat="server" Text="版本：" Visible="false" meta:resourcekey="lblManualVersionResource1"></asp:Label>
    <asp:Label ID="lblPrintUser" runat="server" Text="列印者：" Visible="false" meta:resourcekey="lblPrintUserResource1"></asp:Label>

    <a id="atag" style="display:none;">Run UDoc Viewer</a>
</asp:Content>
