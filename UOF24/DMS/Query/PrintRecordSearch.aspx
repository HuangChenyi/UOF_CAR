<%@ Page Title="" Language="C#" MasterPageFile="~/Master/DefaultMasterPage.master" AutoEventWireup="true" Inherits="DMS_Query_PrintRecordSearch" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" Codebehind="PrintRecordSearch.aspx.cs" %>

<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>
<%@ Register Src="../../Common/ChoiceCenter/UC_ChoiceList.ascx" TagName="UC_ChoiceList"
    TagPrefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <script type="text/javascript">
        function downloadFile(downloadUrl, sUserProxyIndex) {
            $uof.download(downloadUrl, sUserProxyIndex);
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

    <telerik:RadToolBar ID="RadToolBar1" runat="server" Width="100%" OnButtonClick="RadToolBar1_ButtonClick" meta:resourcekey="RadToolBar1Resource1" SingleClick="None">
        <Items>
            <telerik:RadToolBarButton runat="server" Text="查詢" Value="Search"
                ClickedImageUrl="~/Common/Images/Icon/icon_m39.png"
                DisabledImageUrl="~/Common/Images/Icon/icon_m39.png"
                HoveredImageUrl="~/Common/Images/Icon/icon_m39.png"
                ImageUrl="~/Common/Images/Icon/icon_m39.png" meta:resourcekey="RadToolBarButtonResource1">
            </telerik:RadToolBarButton>
            <telerik:RadToolBarButton runat="server" IsSeparator="True" meta:resourcekey="RadToolBarButtonResource2"></telerik:RadToolBarButton>
        </Items>
    </telerik:RadToolBar>
    <table class="PopTable">
        <tr>
            <td  class="PopTableLeftTD">
                <asp:Label ID="Label1" runat="server" Text="分發時間" meta:resourcekey="Label1Resource1"></asp:Label>
            </td>
            <td class="PopTableRightTD">
                <table>
                    <tr>
                        <td>
                            <telerik:RadDatePicker ID="rdpStartDate" runat="server"  meta:resourcekey="rdpStartDateResource1">
                            </telerik:RadDatePicker>
                        </td>
                        <td>~
                        </td>
                        <td>
                            <telerik:RadDatePicker ID="rdpEndDate" runat="server"  meta:resourcekey="rdpEndDateResource1">
                            </telerik:RadDatePicker>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td  class="PopTableLeftTD">
                <asp:Label ID="Label2" runat="server" Text="狀態" meta:resourcekey="Label2Resource1"></asp:Label>
            </td>
            <td class="PopTableRightTD">
                <asp:DropDownList ID="ddlStatus" runat="server" meta:resourcekey="ddlStatusResource1">
                    <asp:ListItem Value="All" Text="全部" meta:resourcekey="ListItemResource1"></asp:ListItem>
                    <asp:ListItem Value="0" Text="已分發" meta:resourcekey="ListItemResource2"></asp:ListItem>
                    <asp:ListItem Value="1" Text="已回收" meta:resourcekey="ListItemResource3"></asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td  class="PopTableLeftTD">
                <asp:Label ID="Label3" runat="server" Text="分發對象" meta:resourcekey="Label3Resource1"></asp:Label>
            </td>
            <td style="height: 150px" class="PopTableRightTD">
                <div style="overflow: auto; width: 50%; height: 170px">
                    <uc1:UC_ChoiceList ID="UC_ChoiceList1" runat="server" />
                </div>
            </td>
        </tr>
    </table>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <Fast:Grid ID="Grid1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateCheckBoxColumn="False"
                AutoGenerateColumns="False"  DataKeyOnClientWithCheckBox="False"
                DefaultSortDirection="Descending" EmptyDataText="No data found"
                EnhancePager="True" KeepSelectedRows="False" PageSize="15" 
                 Width="100%" OnPageIndexChanging="Grid1_PageIndexChanging"
                OnRowDataBound="Grid1_RowDataBound" OnSorting="Grid1_Sorting" meta:resourcekey="Grid1Resource1" DefaultSortColumnName="PRINT_DATE" OnRowCommand="Grid1_RowCommand" OnBeforeExport="Grid1_BeforeExport">
                <EnhancePagerSettings
                    ShowHeaderPager="True" FirstAltImageUrl="" FirstImageUrl="" LastAltImage="" LastImageUrl="" NextIAltImageUrl="" NextImageUrl="" PageInfoCssClass="" PageNumberCssClass="" PageNumberCurrentCssClass="" PageRedirectCssClass="" PreviousAltImageUrl="" PreviousImageUrl=""></EnhancePagerSettings>
                <ExportExcelSettings AllowExportToExcel="True" ExportType="GridContent" DataSourceType="ObjectDataSource"></ExportExcelSettings>
                <Columns>
                    <asp:TemplateField HeaderText="分發時間" SortExpression="PRINT_DATE" meta:resourcekey="TemplateFieldResource1">
                        <ItemTemplate>
                            <asp:Label ID="lblPrintDate" runat="server"
                                Text="" meta:resourcekey="lblPrintDateResource1"></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle Width="10%" Wrap="False" />
                        <ItemStyle Wrap="False" HorizontalAlign="Left" />
                    </asp:TemplateField>
                    <asp:BoundField HeaderText="文件編號" DataField="DOC_SERIAL" SortExpression="DOC_SERIAL" meta:resourcekey="BoundFieldResource1" >
                    <HeaderStyle Width="10%" Wrap="False" />
                    <ItemStyle Width="10%" Wrap="False" />
                    </asp:BoundField>
                    <asp:TemplateField HeaderText="文件名稱" SortExpression="DOC_NAME" meta:resourcekey="TemplateFieldResource2">
                        <ItemTemplate>
                            <table style="width:100%">
                                <tr>
                                    <td>
                                        <asp:LinkButton ID="lbtnDocName" runat="server" meta:resourcekey="lbtnDocNameResource1" Text="LinkButton"></asp:LinkButton>&nbsp;
                                    </td>
                                    <td style="text-align:right">
                                        <asp:ImageButton ID="imgPDFViewer" CommandName="PDFViewer" CommandArgument='<%#Eval("DOC_ID")+","+Eval("DOC_VERSION") %>' Visible="false" runat="server" AlternateText="觀看文件" />
                                        <asp:Image ID="imgNoPDFViewer" runat="server" Visible="false"></asp:Image>
                                    </td>
                                </tr>
                            </table>
                        </ItemTemplate>   
                        <HeaderStyle Wrap="False" Width="25%"/> 
                        <ItemStyle Wrap="False" Width="25%"/>                       
                    </asp:TemplateField>
                     <asp:BoundField HeaderText="文件名稱" SortExpression="DOC_NAME" DataField="DOC_NAME" meta:resourcekey="TemplateFieldResource2" Visible="false">
                        <HeaderStyle Width="10%" Wrap="False" />
                        <ItemStyle Width="10%" Wrap="False"></ItemStyle>
                    </asp:BoundField>
                    <asp:BoundField HeaderText="份數" DataField="NUMBER_OF_COPY" SortExpression="NUMBER_OF_COPY" meta:resourcekey="BoundFieldResource2">
                        <HeaderStyle Width="50px" Wrap="False" />
                        <ItemStyle HorizontalAlign="Right"></ItemStyle>
                    </asp:BoundField>
                    <asp:BoundField HeaderText="理由" DataField="REASON" SortExpression="REASON" meta:resourcekey="BoundFieldResource3" >
                    <HeaderStyle Width="15%" Wrap="False"/>
                    </asp:BoundField>
                    <asp:TemplateField HeaderText="狀態" SortExpression="IS_RECALLED" meta:resourcekey="TemplateFieldResource3">
                        <ItemTemplate>
                            <asp:Label ID="lblStatus" runat="server" meta:resourcekey="lblStatusResource1"></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle Wrap="False" />
                        <ItemStyle Wrap="False" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="分發對象" SortExpression="SEND_NAME" meta:resourcekey="TemplateFieldResource4">
                        <ItemTemplate>
                            <asp:Label ID="lblApplicant" runat="server" Text='<%# Bind("APPLICANT") %>' meta:resourcekey="lblApplicantResource1"></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle Width="20%" Wrap="False"/>
                        <ItemStyle Width="20%" Wrap="False"/>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="回收時間"  SortExpression="RECALL_TIME" meta:resourcekey="BoundFieldResource4">
                        <ItemTemplate>
                            <asp:Label ID="lblRecallTime" runat="server" Text="" ></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle Width="10%" Wrap="False" />
                        <ItemStyle Wrap="False"  />
                    </asp:TemplateField>
                    <asp:BoundField DataField="TOTAL_OF_RECALL" HeaderText="回收份數" SortExpression="TOTAL_OF_RECALL" meta:resourcekey="BoundFieldResource5">
                    <HeaderStyle Wrap="False" Width="90px" />
                    <ItemStyle HorizontalAlign="Right" />
                    </asp:BoundField>
                    <asp:TemplateField meta:resourcekey="TemplateFieldResource6">
                        <ItemTemplate>
                            <asp:LinkButton ID="lbtnView" runat="server" Text="觀看" meta:resourcekey="lbtnViewResource1"></asp:LinkButton>
                        </ItemTemplate>
                    <HeaderStyle Wrap="False" />
                    <ItemStyle Wrap="False" />
                    </asp:TemplateField>
                </Columns>
            </Fast:Grid>
        </ContentTemplate>
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="RadToolBar1" EventName="ButtonClick" />
        </Triggers>
    </asp:UpdatePanel>
    <asp:Label ID="lblRetrieve" runat="server" Text="已回收" Visible="False" meta:resourcekey="lblRetrieveResource1" ></asp:Label>
    <asp:Label ID="lblSend" runat="server" Text="已分發" Visible="False" meta:resourcekey="lblSendResource1"></asp:Label>
    <asp:Label ID="lblDateError" Visible="False" runat="server" Text="開始日期不能晚於結束日期" meta:resourcekey="lblDateErrorResource1"></asp:Label>
    <asp:Label ID="lblCustodianError" Visible="False" runat="server" Text="請選取分發對象" meta:resourcekey="lblCustodianErrorResource1"></asp:Label>
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

