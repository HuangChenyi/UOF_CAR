<%@ Page Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="DMS_DocStore_DocRefList" Title="" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" Codebehind="DocRefList.aspx.cs" %>

<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>
<%@ Register Src="~/Common/ChoiceCenter/UC_ChoiceList.ascx" TagPrefix="uc1" TagName="UC_ChoiceList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <style>
    .labelMutiline {
      white-space:pre-wrap;
    }
    .panelHeightLimit {
     overflow: auto;
     max-height: 80px;
        }
    </style>
<script>
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
    <asp:UpdatePanel ID="UpdatePanel4" runat="server">
        <ContentTemplate>

            <Fast:Grid ID="gridDocRef" runat="server" AllowPaging="True" AllowSorting="True"
                AutoGenerateCheckBoxColumn="False" AutoGenerateColumns="False"
                DataKeyOnClientWithCheckBox="False" EnhancePager="True"
                OnPageIndexChanging="gridDocRef_PageIndexChanging" OnRowDataBound="gridDocRef_RowDataBound" Width="100%" OnSorting="gridDocRef_Sorting" PageSize="9"  DefaultSortDirection="Ascending" EmptyDataText="No data found" KeepSelectedRows="False"   meta:resourcekey="gridDocRefResource2">
                <EnhancePagerSettings ShowHeaderPager="True" />
                <ExportExcelSettings AllowExportToExcel="False" />
                <Columns>
                    <asp:TemplateField HeaderText="狀態" SortExpression="DOC_STATUS" meta:resourcekey="TemplateFieldResource8">
                        <ItemTemplate>
                            <asp:Label ID="lblStatus" runat="server" Text='<%# Bind("DOC_STATUS") %>' meta:resourcekey="lblStatusResource2"></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle Wrap="False" Width="7%" />
                        <ItemStyle Wrap="False" HorizontalAlign="Center" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="文件名稱" meta:resourceKey="TemplateFieldResource1" SortExpression="DOC_NAME">
                        <ItemTemplate>
                            <span style="word-break: break-all;">  
                                <table style="width:100%">
                                    <tr>
                                        <td style="min-width: 16px">
                                            <asp:Image runat="server" ImageUrl="~/DMS/images/icon/unknown.gif" ID="imgDocIcon" meta:resourcekey="imgDocIconResource2"></asp:Image>&nbsp; 
                                        </td>
                                        <td>
                                            <asp:LinkButton runat="server" Text='<%# Bind("DOC_NAME") %>' ID="labDLFile" meta:resourcekey="labDLFileResource2"></asp:LinkButton>
                                        </td>
                                        <td  >
                                            <table style="width:100%;">
                                                <tr>
                                                    <td style="text-align:right;">
                                                        <asp:ImageButton ID="imgPDFViewer" CommandName="PDFViewer" CommandArgument='<%#Eval("REF_DOC_ID")+","+Eval("PUBLISH_MANUAL_VERSION") %>' Visible="false" runat="server" AlternateText="觀看文件" OnClick="imgPDFViewer_Click"/>
                                                        <asp:Image ID="imgNoPDFViewer" runat="server" Visible="false"></asp:Image>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                </table>                              
                                <br />
                                <asp:Label ID="lblNoView" runat="server" Text="無權限觀看" ForeColor="Red" Visible="false"></asp:Label>
                               <asp:Label ID="lblNoLend" runat="server" Text="舊版本無權限調閱" ForeColor="Red" Visible="false"></asp:Label>
                            </span>
                        </ItemTemplate>
                        <HeaderStyle Wrap="False" Width="30%" />
                    </asp:TemplateField>  
                     <asp:TemplateField HeaderText="參考說明" meta:resourcekey="BoundFieldsResource">
                         <ItemTemplate>
                             <asp:Panel ID="plDocRefNote" runat="server" CssClass="panelHeightLimit">
                                 <asp:Label ID="lblDocRefNote" runat="server" Text='<%#: Bind("REF_COMMENT") %>' CssClass="labelMutiline"></asp:Label>
                             </asp:Panel>
                         </ItemTemplate>
                       <HeaderStyle Wrap="False" Width="43%"/>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="保管者" meta:resourcekey="TemplateFieldResource7">
                        <ItemTemplate>
                            <uc1:UC_ChoiceList runat="server" ID="UC_ChoiceList1" IsAllowEdit="false"></uc1:UC_ChoiceList>
                        </ItemTemplate>
                        <HeaderStyle Width="20%" Wrap="False" />
                    </asp:TemplateField>
                    <%--因考量當下版本的顯示方式，先將該欄位隱藏  
                    <asp:TemplateField HeaderText="功能" Visible="false" meta:resourcekey="TemplateFieldResource2">
                        <ItemTemplate>
                            <asp:LinkButton runat="server" ID="lbtnInfo" meta:resourcekey="lbtnInfoResource1"></asp:LinkButton>
                        </ItemTemplate>
                        <HeaderStyle Wrap="False" Width="7%" />
                        <ItemStyle Wrap="False" HorizontalAlign="Center" />
                    </asp:TemplateField>  --%>         
                </Columns>

            </Fast:Grid>

        </ContentTemplate>
    </asp:UpdatePanel>

    <asp:HiddenField ID="hidRefDoc" runat="server" />
    <asp:Label ID="lblDraft" runat="server" Text="草稿" Visible="False" meta:resourcekey="lblDraftResource2"></asp:Label>
    <asp:Label ID="lblCheckin" runat="server" Text="已存回" Visible="False" meta:resourcekey="lblCheckinResource2"></asp:Label>
    <asp:Label ID="lblCheckOut" runat="server" Text="已取出" Visible="False" meta:resourcekey="lblCheckOutResource2"></asp:Label>
    <asp:Label ID="lblApproval" runat="server" Text="審核中" Visible="False" meta:resourcekey="lblApprovalResource2"></asp:Label>
    <asp:Label ID="lblPublish" runat="server" Text="已公佈" Visible="False" meta:resourcekey="lblPublishResource2"></asp:Label>
    <asp:Label ID="lblInactive" runat="server" Text="已失效" Visible="False" meta:resourcekey="lblInactiveResource2"></asp:Label>
    <asp:Label ID="lblVoid" runat="server" Text="已作廢" Visible="False" meta:resourcekey="lblVoidResource2"></asp:Label>
    <asp:Label ID="lblTempInact" runat="server" Text="已下架" Visible="False" meta:resourcekey="lblTempInactResource2"></asp:Label>
    <asp:Label ID="lblOldVer" runat="server" Text="舊版本" Visible="False" meta:resourcekey="lblOldVerResource2"></asp:Label>
    <asp:Label ID="lblReAct" runat="server" Text="已上架" Visible="False" meta:resourcekey="lblReActResource2"></asp:Label>
    <asp:Label ID="labVersion" runat="server" Text="版本：" Visible="False" meta:resourcekey="labVersionResource2"></asp:Label>
    <asp:Label ID="labDocDeny" runat="server" Text="發佈拒絕" Visible="False" meta:resourcekey="labDocDenyResource2"></asp:Label>
    <asp:Label ID="lblVioding" runat="server" Text="(作廢審核中)" Visible="False" meta:resourcekey="lblViodingResource2"></asp:Label>
    <asp:Label ID="lblUpdating" runat="server" Text="改版中" Visible="False" meta:resourcekey="lblUpdatingResource2"></asp:Label>
    <asp:Label ID="labNoActive" runat="server" Text="未生效" Visible="False" meta:resourcekey="labNoActiveResource2"></asp:Label>
    <asp:Label ID="lblFileNotTransferToUof" runat="server" Text="目前檔案仍在Proxy伺服器，正由系統進行傳輸中，請稍後！" Visible="False" ForeColor="Blue"></asp:Label>
    <asp:Label ID="lblNoUpLoad" runat="server" Text="文件還未上傳或已被銷毀" Visible="False" meta:resourcekey="lblNoUpLoadResource1"></asp:Label>
    <asp:Label ID="lblDocDelete" runat="server" ForeColor="Red" Text="文件已被銷毀" Visible="False" meta:resourcekey="lblDocDeleteResource1"></asp:Label>
    <asp:Label ID="labFileError" runat="server" ForeColor="Blue" Text="發生錯誤，檔案不存在！" Visible="False" meta:resourcekey="labFileErrorResource1"></asp:Label>
    <asp:Label ID="labAlert" runat="server" ForeColor="Blue" Text="正在進行檔案轉換，請稍後再觀看" Visible="False" meta:resourcekey="labAlertResource1"></asp:Label>
    <asp:Label ID="labPDFConvertERROR" runat="server" ForeColor="Blue" Text="發生錯誤，轉換失敗！" Visible="False" meta:resourcekey="labPDFConvertERRORResource1"></asp:Label>
    <asp:Label ID="lblNotsupportDoc" runat="server" Text="目錄設定為必須轉檔，但此檔案類型並不支援" ForeColor="Blue" Visible="False" meta:resourcekey="lblNotsupportDocResource1"></asp:Label>
    <asp:Label ID="lblProtectMsg" runat="server" Text="此為保全文件無法線上觀看" ForeColor="Blue" Visible="False" meta:resourcekey="lblProtectMsgResource1"></asp:Label>
    <asp:Label ID="lblFileHasPassword" runat="server" Text="原始檔案有設定密碼，無法轉檔" Visible="false" meta:resourcekey="lblFileHasPasswordResource1"></asp:Label>
    <asp:Label ID="lblFilePageOutLimitMsg" runat="server" Text="檔案頁數{0}頁，超過可轉檔上限。" Visible="false" meta:resourcekey="lblFilePageOutLimitMsgResource1"></asp:Label>
    <asp:Label ID="lblDocSerial" runat="server" Text="文件編號：" Visible="false" meta:resourcekey="lblDocSerialResource1"></asp:Label>
    <asp:Label ID="lblManualVersion" runat="server" Text="版本：" Visible="false" meta:resourcekey="lblManualVersionResource1"></asp:Label>
    <asp:Label ID="lblPrintUser" runat="server" Text="列印者：" Visible="false" meta:resourcekey="lblPrintUserResource1"></asp:Label>

    <a id="atag" style="display:none;">Run UDoc Viewer</a>
</asp:Content>

