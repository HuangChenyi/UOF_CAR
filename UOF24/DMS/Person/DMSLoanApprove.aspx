<%@ Page Language="C#" MasterPageFile="~/Master/DefaultMasterPage.master" AutoEventWireup="true" Inherits="DMS_Person_DMSLoanApprove" Title="" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" Codebehind="DMSLoanApprove.aspx.cs" %>

<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
        
    <script id="DMSLoanApprovejs" type="text/javascript">

        function uwtbPersonApprove_Click(oToolbar, oButton, oEvent) {
            if (oButton.Key == "Delete") {
                if (confirm('<%=lblConfirmDelete.Text %>') == false)
                    oEvent.needPostBack = false;
            }
        }

        function RadToolbar1_Click(sender, args) {
            var toolBar = sender;
            var button = args.get_item();
            if (button.get_value() == "Reject") {
                var checkedData = $uof.fastGrid.getChecked('<%=gridLendApprove.ClientID%>');

                if (checkedData.length > 0) {
                    args.set_cancel(true);
                    $uof.dialog.open2("~/DMS/DocStore/DocApproveComment.aspx", args.get_item(), "", 600, 400, OpenDocDialogResult, {"type": 'lend', "state": 'Reject', "data": checkedData });
                }
                else
                    alert("<%=labNoSelect.Text %>")
            }
            if (button.get_value() == "Accept") {
                var checkedData = $uof.fastGrid.getChecked('<%=gridLendApprove.ClientID%>');

                if (checkedData.length > 0) {
                    args.set_cancel(true);
                    $uof.dialog.open2("~/DMS/DocStore/DocApproveComment.aspx", args.get_item(), "", 600, 400, OpenDocDialogResult, {"type": 'lend', "state": 'Accept', "data": checkedData });
                }
                else
                    alert("<%=labNoSelect.Text %>")
            }
        }

        function OpenDocDialogResult(returnValue) {
            if (returnValue == null || typeof (returnValue) == 'undefined') {
                return false;
            }
            else {
                return true;
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
    </script>

    <table style="width: 100%;">
        <tr>
            <td valign="top">
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <telerik:RadToolBar ID="RadToolbar1" runat="server" Width="100%" OnButtonClick="RadToolbar1_ButtonClicked" OnClientButtonClicking="RadToolbar1_Click" meta:resourcekey="barMainResource1">
                            <Items>
                                <telerik:RadToolBarButton runat="server" Enabled="true" CheckedImageUrl="~/Common/Images/Icon/icon_m132.gif" DisabledImageUrl="~/Common/Images/Icon/icon_m132.gif" HoveredImageUrl="~/Common/Images/Icon/icon_m132.gif" ImageUrl="~/Common/Images/Icon/icon_m132.gif" Text="允許" Value="Accept" meta:resourcekey="TBarButtonResource1">
                                </telerik:RadToolBarButton>
                                <telerik:RadToolBarButton runat="server" IsSeparator="True" Value="s1" meta:resourcekey="RadToolBarButtonResource2" />
                                <telerik:RadToolBarButton runat="server" Enabled="true" CheckedImageUrl="~/Common/Images/Icon/icon_m141.gif" DisabledImageUrl="~/Common/Images/Icon/icon_m141.gif" HoveredImageUrl="~/Common/Images/Icon/icon_m141.gif" ImageUrl="~/Common/Images/Icon/icon_m141.gif" Text="拒絕" Value="Reject" meta:resourcekey="TBarButtonResource2">
                                </telerik:RadToolBarButton>
                                <telerik:RadToolBarButton runat="server" IsSeparator="True" Value="s2" meta:resourcekey="RadToolBarButtonResource2" />
                            </Items>
                        </telerik:RadToolBar>

                        <Fast:Grid ID="gridLendApprove" runat="server" DataKeyNames="DOC_ID,LEND_USER" Width="100%" PageSize="15" 
                            AllowPaging="True" AllowSorting="True" AutoGenerateCheckBoxColumn="True" AutoGenerateColumns="False" 
                            DataKeyOnClientWithCheckBox="True" DefaultSortDirection="Ascending"
                            EnhancePager="True" EmptyDataText="沒有資料" EnableModelValidation="True" 
                            KeepSelectedRows="False"
                            OnPageIndexChanging="gridLendApprove_PageIndexChanging" 
                            OnRowCommand="gridLendApprove_RowCommand"
                            OnRowDataBound="gridLendApprove_RowDataBound"
                            OnSorting="gridLendApprove_Sorting" >
                            <ExportExcelSettings AllowExportToExcel="False" />
                            <Columns>
                                <asp:TemplateField HeaderText="文件編號" SortExpression="DOC_SERIAL" meta:resourcekey="TemplateFieldResource7">
                                    <EditItemTemplate>
                                        <asp:TextBox runat="server" Text='<%# Bind("DOC_SERIAL") %>' ID="TextBox8"></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <span style="width: 80px;">
                                            <asp:Label runat="server" Text='<%# Bind("DOC_SERIAL") %>' ID="Label2"></asp:Label>
                                        </span>
                                    </ItemTemplate>
                                    <HeaderStyle Width="10%" Wrap="false" />
                                    <ItemStyle Wrap="false" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="文件名稱" SortExpression="DOC_NAME" meta:resourcekey="TemplateFieldResource1">
                                    <EditItemTemplate>
                                        <asp:TextBox runat="server" Text='<%# Bind("DOC_NAME") %>' ID="TextBox2"></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <span style="width: 180px;">
                                            <table>
                                                <tr>
                                                    <td style="min-width: 16px">
                                                        <asp:Image runat="server" ID="docIcon" ImageUrl="~/DMS/images/icon/unknown.gif"></asp:Image>
                                                        &nbsp;
                                                    </td>
                                                    <td>
                                                        <asp:LinkButton runat="server" ID="labDLFile" Text='<%#: Bind("DOC_NAME") %>'></asp:LinkButton>&nbsp;
                                                    </td>
                                                    <td  style="width:100%;">
                                                        <table style="width:100%;">
                                                            <tr>
                                                                <td style="text-align:right;">
                                                                    <asp:ImageButton ID="imgPDFViewer" CommandName="PDFViewer" CommandArgument='<%#Eval("DOC_ID")+","+Eval("MANUAL_VERSION") %>' Visible="false" runat="server" AlternateText="觀看文件" />
                                                                    <asp:Image ID="imgNoPDFViewer" runat="server" Visible="false"></asp:Image>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                </tr>
                                            </table>
                                        </span>
                                    </ItemTemplate>
                                    <HeaderStyle Width="20%" Wrap="false" />
                                    <ItemStyle Wrap="false" />
                                </asp:TemplateField>
                                <asp:BoundField DataField="MANUAL_VERSION" HeaderText="版本" SortExpression="MANUAL_VERSION" meta:resourcekey="BoundFieldResource2">
                                    <HeaderStyle Width="5%" Wrap="false" />
                                    <ItemStyle HorizontalAlign="Center" Wrap="false" />
                                </asp:BoundField>
                                <asp:TemplateField HeaderText="申請人" SortExpression="LEND_USER" meta:resourcekey="TemplateFieldResource2">
                                    <ItemTemplate>
                                        <asp:Label runat="server" Text='<%# Bind("LEND_USER") %>' ID="labApplyUser"></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle Width="10%" Wrap="false" />
                                    <ItemStyle Wrap="false" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="調閱開始" meta:resourcekey="TemplateFieldResource3">
                                    <ItemTemplate>
                                        <asp:Label runat="server" ID="labStartDate" __designer:wfdid="w17"></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle Width="10%" Wrap="false" />
                                    <ItemStyle HorizontalAlign="Center" Wrap="false" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="調閱結束" SortExpression="LEND_END" meta:resourcekey="TemplateFieldResource4">
                                    <ItemTemplate>
                                        <asp:Label runat="server" ID="labEndDate" __designer:wfdid="w15"></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle Width="10%" Wrap="false" />
                                    <ItemStyle HorizontalAlign="Center" Wrap="false" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="調閱理由" meta:resourcekey="TemplateFieldResource8">
                                    <EditItemTemplate>
                                        <asp:TextBox runat="server" Text='<%# Bind("LEND_REASON") %>' ID="TextBox7"></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <span style="word-break: break-word; overflow:hidden; width: 160px;">
                                            <asp:Label runat="server" Text='<%# Bind("LEND_REASON") %>' ID="Label1"></asp:Label></span>
                                    </ItemTemplate>
                                    <HeaderStyle Width="35%" Wrap="false" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="狀態" SortExpression="APPROVE_STATUS" meta:resourcekey="TemplateFieldResource5">
                                    <EditItemTemplate>
                                        <asp:TextBox runat="server" Text='<%# Bind("APPROVE_STATUS") %>' ID="TextBox3"></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label runat="server" Text='<%# Bind("APPROVE_STATUS") %>' ID="labStatus"></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle Width="5%" Wrap="false" />
                                    <ItemStyle HorizontalAlign="Center" Wrap="false" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="操作" meta:resourcekey="TemplateFieldResource6">
                                    <ItemTemplate>
                                        <asp:LinkButton runat="server" ID="lbtnInfo" Text="資訊" meta:resourcekey="lbtnInfoResource1"></asp:LinkButton>
                                        <asp:LinkButton runat="server" ID="lbtnFlow2" Text="流程" meta:resourcekey="lbtnFlow2Resource1"></asp:LinkButton>
                                    </ItemTemplate>
                                    <HeaderStyle Width="5%" Wrap="false" />
                                    <ItemStyle HorizontalAlign="Center"/>
                                </asp:TemplateField>
                            </Columns>
                            <EnhancePagerSettings ShowHeaderPager="True" />
                        </Fast:Grid>
                    </ContentTemplate>
                </asp:UpdatePanel>
                <asp:Label ID="labNoSelect" runat="server" Text="請先選取文件" Visible="False" meta:resourcekey="labNoSelectResource1"></asp:Label>
                <asp:Label ID="labNoPrivilege" runat="server" Text="選取了無權審核的文件，目錄權限已被變更!" Visible="False" meta:resourcekey="labNoPrivilegeResource1"></asp:Label>
                <asp:Label ID="lblApproving" runat="server" Text="審核中" Visible="False" meta:resourcekey="lblApprovingResource1"></asp:Label>
                <asp:Label ID="lblConfirmDelete" runat="server" meta:resourcekey="lblConfirmDeleteResource1" Text="確定要刪除?" Visible="False"></asp:Label>
                <asp:Label ID="lblConfirmAccept" runat="server" meta:resourcekey="lblConfirmAcceptResource1" Text="確定要允許調閱?" Visible="False"></asp:Label>
                <asp:Label ID="lblConfirmReject" runat="server" meta:resourcekey="lblConfirmRejectResource1" Text="確定要拒絕調閱" Visible="False"></asp:Label>
                <asp:Label ID="lblAccept" runat="server" Text="審核通過" Visible="False" meta:resourcekey="lblAcceptResource1"></asp:Label>
                <asp:Label ID="lblDeny" runat="server" Text="調閱拒絕" Visible="False" meta:resourcekey="lblDenyResource1"></asp:Label>
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
            </td>
        </tr>
    </table>
</asp:Content>

