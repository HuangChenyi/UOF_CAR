<%@ Page Title="個人送審文件" Language="C#" MasterPageFile="~/Master/DefaultMasterPage.master" AutoEventWireup="true" Inherits="DMS_Person_WaitApprove" Culture="auto" UICulture="auto" meta:resourcekey="PageResource1" CodeBehind="WaitApprove.aspx.cs" %>

<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <style>
        .WordBreak {
            word-break: break-word;
            overflow: hidden;
        }
    </style>

    <script id="WaitApprovejs" type="text/javascript">

        function tbMainFun_Click(oToolbar, oButton, oEvent) {
            var checkedData = $uof.fastGrid.getChecked('<%=Grid2.ClientID%>');

            if (oButton.Key == "Delete") {
                if (confirm('<%=lblConfirmDelete.Text %>') == false)
                    oEvent.needPostBack = false;
            }
        }

        function RadToolbar1_Click(sender, args) {
            var toolBar = sender;
            var button = args.get_item();
            var checkedData = $uof.fastGrid.getChecked('<%=Grid2.ClientID%>');
            args.set_cancel(true);
            if (button.get_value() == "Reject") {
                if (checkedData.length > 0) {
                    $uof.dialog.open2("~/DMS/DocStore/DocApproveComment.aspx", args.get_item(), "", 600, 400,
                        function (returnValue) {
                            if (typeof (returnValue) == 'undefined' || returnValue == null) {
                                return false;
                            }
                            else {
                                return true;
                            }
                        }
                        , { "type": 'publish', "state": 'Reject', "data": checkedData });
                }
            }
            if (button.get_value() == "Accept") {
                if (checkedData.length > 0) {
                    $uof.dialog.open2("~/DMS/DocStore/DocApproveComment.aspx", args.get_item(), "", 600, 400,
                        function (returnValue) {
                            if (typeof (returnValue) == 'undefined' || returnValue == null) {
                                return false;
                            }
                            else {
                                return true;
                            }
                        }
                        , { "type": 'publish', "state": 'Accept', "data": checkedData });
                }
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

    <telerik:RadToolBar ID="RadToolbar1" runat="server" Width="100%" OnButtonClick="RadToolbar1_ButtonClicked"
        OnClientButtonClicking="RadToolbar1_Click" meta:resourcekey="barMainResource1">
        <Items>
            <telerik:RadToolBarButton runat="server" Enabled="true" CheckedImageUrl="~/Common/Images/Icon/icon_m132.gif"
                DisabledImageUrl="~/Common/Images/Icon/icon_m132.gif" HoveredImageUrl="~/Common/Images/Icon/icon_m132.gif"
                ImageUrl="~/Common/Images/Icon/icon_m132.gif" Text="允許" Value="Accept" meta:resourcekey="TBarButtonResource1">
            </telerik:RadToolBarButton>
            <telerik:RadToolBarButton runat="server" IsSeparator="True" Value="s1" meta:resourcekey="RadToolBarButtonResource2" />
            <telerik:RadToolBarButton runat="server" Enabled="true" CheckedImageUrl="~/Common/Images/Icon/icon_m141.gif"
                DisabledImageUrl="~/Common/Images/Icon/icon_m141.gif" HoveredImageUrl="~/Common/Images/Icon/icon_m141.gif"
                ImageUrl="~/Common/Images/Icon/icon_m141.gif" Text="拒絕" Value="Reject" meta:resourcekey="TBarButtonResource2">
            </telerik:RadToolBarButton>
            <telerik:RadToolBarButton runat="server" IsSeparator="True" Value="s2" meta:resourcekey="RadToolBarButtonResource2" />
        </Items>
    </telerik:RadToolBar>

    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <Fast:Grid ID="Grid2" runat="server" DataKeyNames="DOC_ID,MANUAL_VERSION,DOC_AUTHOR" Width="100%" PageSize="15"
                AllowPaging="True" AllowSorting="True" AutoGenerateCheckBoxColumn="True" AutoGenerateColumns="False" 
                DataKeyOnClientWithCheckBox="True" DefaultSortDirection="Ascending" 
                EnhancePager="True" EmptyDataText="沒有資料" EnableModelValidation="True" 
                KeepSelectedRows="False" 
                OnPageIndexChanging="Grid2_PageIndexChanging"
                OnRowCommand="Grid2_RowCommand"
                OnRowDataBound="Grid2_RowDataBound"
                OnSorting="Grid2_Sorting" >
                <EnhancePagerSettings ShowHeaderPager="True" />
                <ExportExcelSettings AllowExportToExcel="False" />
                <Columns>
                    <asp:TemplateField HeaderText="文件編號" SortExpression="DOC_SERIAL" meta:resourcekey="TemplateFieldResource7">
                        <EditItemTemplate>
                            <asp:TextBox runat="server" Text='<%# Bind("DOC_SERIAL") %>' ID="TextBox1"></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <span style="width: 80px;">
                                <asp:Label runat="server" Text='<%# Bind("DOC_SERIAL") %>' ID="Label1"></asp:Label>
                            </span>
                        </ItemTemplate>
                        <HeaderStyle Width="10%" Wrap="false" />
                        <ItemStyle Wrap="false" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="文件名稱" meta:resourcekey="TemplateFieldResource1" SortExpression="DOC_NAME">
                        <ItemTemplate>
                            <span style="word-break: break-all;">
                                <table>
                                    <tr>
                                        <td style="min-width: 16px">
                                            <asp:Image ID="docIcon" runat="server" ImageUrl="~/DMS/images/icon/unknown.gif"></asp:Image>
                                            &nbsp;
                                        </td>
                                        <td>
                                            <asp:LinkButton ID="lbtnDocName" runat="server" Text='<%#: Bind("DOC_NAME") %>'></asp:LinkButton>
                                        </td>
                                        <td style="width: 100%;">
                                            <table style="width: 100%;">
                                                <tr>
                                                    <td style="text-align: right;">
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
                    <asp:BoundField DataField="MANUAL_VERSION" HeaderText="版本" meta:resourcekey="BoundFieldResource5" SortExpression="MANUAL_VERSION">
                        <HeaderStyle Width="5%" Wrap="false" />
                        <ItemStyle HorizontalAlign="Center" Wrap="false" />
                    </asp:BoundField>
                    <asp:BoundField DataField="CHANGE_REASON" HeaderText="發佈/變更原因" meta:resourcekey="BoundFieldResource7" SortExpression="CHANGE_REASON">
                        <HeaderStyle Width="45%" Wrap="false" />
                        <ItemStyle HorizontalAlign="Left" CssClass="WordBreak" />
                    </asp:BoundField>
                    <asp:TemplateField HeaderText="狀態" meta:resourcekey="TemplateFieldResource2" SortExpression="DOC_STATUS">
                        <ItemTemplate>
                            <asp:Label runat="server" ID="lblStatus"></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle Width="5%" Wrap="false" />
                        <ItemStyle HorizontalAlign="Center" Wrap="false" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="開始審核時間" meta:resourcekey="BoundFieldResource2" SortExpression="ADD_DATE">
                        <ItemTemplate>
                            <asp:Label runat="server" ID="lblAddDate"></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle Width="10%" Wrap="false" />
                        <ItemStyle HorizontalAlign="Center" Wrap="false" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="操作" meta:resourcekey="TemplateFieldResource5">
                        <ItemTemplate>
                            <asp:LinkButton ID="lbtnInfo" runat="server" Text="資訊" meta:resourceKey="lbtnInfoResource1"></asp:LinkButton>
                            <asp:LinkButton ID="lbtnFlow2" runat="server">流程</asp:LinkButton>
                        </ItemTemplate>
                        <HeaderStyle Width="5%" Wrap="false" />
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:TemplateField>
                </Columns>
            </Fast:Grid>
        </ContentTemplate>
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="RadToolbar1" EventName="ButtonClick" />
        </Triggers>
    </asp:UpdatePanel>

    <asp:Label ID="lblCheckin" runat="server" Text="已存回" Visible="False" meta:resourcekey="lblCheckinResource1"></asp:Label>
    <asp:Label ID="lblCheckOut" runat="server" Text="已取出" Visible="False" meta:resourcekey="lblCheckOutResource1"></asp:Label>
    <asp:Label ID="lblApproval" runat="server" Text="審核中" Visible="False" meta:resourcekey="lblApprovalResource1"></asp:Label>
    <asp:Label ID="lblPublish" runat="server" Text="已公佈" Visible="False" meta:resourcekey="lblPublishResource1"></asp:Label>
    <asp:Label ID="lblInactive" runat="server" Text="已失效" Visible="False" meta:resourcekey="lblInactiveResource1"></asp:Label>
    <asp:Label ID="lblVoid" runat="server" Text="已作廢" Visible="False" meta:resourcekey="lblVoidResource1"></asp:Label>
    <asp:Label ID="lblTempInact" runat="server" Text="已下架" Visible="False" meta:resourcekey="lblTempInactResource1"></asp:Label>
    <asp:Label ID="lblOldVer" runat="server" Text="舊版本" Visible="False" meta:resourcekey="lblOldVerResource1"></asp:Label>
    <asp:Label ID="lblReAct" runat="server" Text="已上架" Visible="False" meta:resourcekey="lblReActResource1"></asp:Label>
    <asp:Label ID="labDocDeny" runat="server" meta:resourcekey="labDocDenyResource1" Text="發佈拒絕" Visible="False"></asp:Label>
    <asp:Label ID="lblConfirmDelete" runat="server" Text="確定要刪除?" Visible="False" meta:resourcekey="lblConfirmDeleteResource1"></asp:Label>
    <asp:Label ID="lblConfirmAccept" runat="server" Text="確定要允許公佈?" Visible="False" meta:resourcekey="lblConfirmAcceptResource1"></asp:Label>
    <asp:Label ID="lblConfirmReject" runat="server" Text="確定要拒絕公佈" Visible="False" meta:resourcekey="lblConfirmRejectResource1"></asp:Label>
    <asp:Label ID="lblWaitApprove" runat="server" Text="待審文件" Visible="False" meta:resourcekey="lblWaitApproveResource1"></asp:Label>
    <asp:Label ID="lblPersonSend" runat="server" Text="個人送審文件" Visible="False" meta:resourcekey="lblPersonSendResource1"></asp:Label>
    <asp:HiddenField ID="hdAppPath" runat="server" />
    <asp:Label ID="lblNoPrivilege" runat="server" Text="勾選了無權審核的文件，目錄權限已被變更" Visible="False"></asp:Label>
    <asp:HiddenField ID="hdPrivilegeStatus" runat="server" />
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

    <a id="atag" style="display: none;">Run UDoc Viewer</a>
</asp:Content>
