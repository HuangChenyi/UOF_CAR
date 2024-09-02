<%@ Page Title="" Language="C#" MasterPageFile="~/Master/TwoColumn.master" AutoEventWireup="true" CodeBehind="QueryLendDefault.aspx.cs" Inherits="Ede.Uof.Web.DMS.Query.QueryLendDefault" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" %>


<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>
<asp:Content ID="Content4" ContentPlaceHolderID="ScriptContentPlaceHolder" runat="Server">
    <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server" OnAjaxRequest="Manager_AjaxRequest" meta:resourcekey="RadAjaxManager1Resource1">
        <AjaxSettings>
            <telerik:AjaxSetting AjaxControlID="RadAjaxManager1">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="panContent" UpdatePanelHeight="100%" UpdatePanelRenderMode="Inline" />
                </UpdatedControls>
            </telerik:AjaxSetting>
            <telerik:AjaxSetting AjaxControlID="RadAjaxManager1">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="treeLendFolder" UpdatePanelHeight="100%" UpdatePanelRenderMode="Inline" />
                </UpdatedControls>
            </telerik:AjaxSetting>
            <telerik:AjaxSetting AjaxControlID="treeLendFolder">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="panContent" UpdatePanelCssClass="" UpdatePanelHeight="100%" UpdatePanelRenderMode="Inline" />
                </UpdatedControls>
            </telerik:AjaxSetting>
        </AjaxSettings>
    </telerik:RadAjaxManager>

    <script type="text/javascript">

        Sys.Application.add_load(function () {
                var docid = $uof.tool.htmlDecode("<%=System.Web.Security.AntiXss.AntiXssEncoder.HtmlEncode(Request.QueryString["docid"], true)%>");

                if (docid != null && docid != ""){

                if ($('#<%=HiddenFieldPostBack.ClientID%>').val() != 'True') return;
                    $('#<%=HiddenFieldPostBack.ClientID%>').val('False');

                var data = [docid];
                var wkfDocCurrentStatus = $uof.pageMethod.sync("GetWkfDocStatus", data);
                var wkfDocCurrentActiveStatus = $uof.pageMethod.sync("GetWkfActiveStatus", data);
                //文件已是下架, 作廢, 失效狀態, 不可觀看
                if (wkfDocCurrentStatus == "TempInact" || wkfDocCurrentStatus == "Void" || wkfDocCurrentActiveStatus == "Invalid")
                 {
                    alert('<%= lblDocInvalid.Text %>');
                    window.close();
                    return;
                 }

                result = $uof.pageMethod.sync("OpenDocdownload", data);
                if (result == "url1")
                    $uof.dialog.open2('~/DMS/DocStore/DocLend/DocLendAccept.aspx', '', '', 700, 480, OpenDialogResult, { 'docid': docid, 'status': 'Publish' });
                else if (result == "url2")
                    $uof.dialog.open2('~/DMS/DocStore/DocLend/DocLendAccept.aspx', '', '', 0, 0, OpenDialogResult, { 'docid': docid, 'status': 'Publish' });
                else if (result == "NoLend")
                    alert('<%= lblNoLend.Text %>');
                else if (result == "NoDL")
                    alert('<%= lblNoDL.Text %>');
                else
                    alert('<%= lblDocNotFind.Text %>');
            } 
          });

        function OpenDialogResult(returnValue) {
                if (typeof (returnValue) == 'undefined' || returnValue == null)
                    return false;
                else
                    return true;
            }

        function OntreeLendFolderClicking(sender, args) {
            var oldFolderid = $("#<%=hidFolderID.ClientID %>").val();
            $("#<%=hidFolderID.ClientID %>").val(args.get_node().get_value());
            var newFolderid = $("#<%=hidFolderID.ClientID %>").val();
            if (oldFolderid == newFolderid) {
                args.set_cancel(true);
            }
        }
        function ConfirmAdd(docID) {
            if (window.confirm('<%=lblConfirmAddUse.Text %>')) {
                var ajaxManager = $find("<%= RadAjaxManager1.ClientID %>");
                ajaxManager.ajaxRequest(JSON.stringify({ "Key": "AddCommonUse", "Value": docID }));
            }
        }

        //2012-5-24 ELTON, add for download file by [FileCenterV2 FileControlHandler]
        function DownloadFileWithHandler(sHandlerUrl, sUserProxyIndex) {
            $uof.download(sHandlerUrl, sUserProxyIndex);
        }


        //2012/03/19 顯示方式：文件列表 add by Taylor
        function ConfirmAddFavorites(docID) {
            if (window.confirm('<%=lblConfirmAdd.Text  %>')) {
                var ajaxManager = $find("<%= RadAjaxManager1.ClientID %>");
                ajaxManager.ajaxRequest(JSON.stringify({ "Key": "AddFavorites", "Value": docID }));
            }
        }

        //2012/03/19 顯示方式：詳細資料 add by Taylor
        function ConfirmAddDetailFavorites(docID) {
            if (window.confirm('<%=lblConfirmAdd.Text  %>')) {
                var ajaxManager = $find("<%= RadAjaxManager1.ClientID %>");
                ajaxManager.ajaxRequest(JSON.stringify({ "Key": "AddFavorites", "Value": docID }));
            }
        }

        function OpenWin(sender, item) {
            var docID = $("#<%=hidDocID.ClientID%>").val();
            var folderID = $("#<%=hidFolderID.ClientID%>").val();

            switch (item) {
                case 1:
                    if (window.confirm('<%=lblConfirmAddUse.Text %>')) {
                        var ajaxManager = $find("<%= RadAjaxManager1.ClientID %>");
                        ajaxManager.ajaxRequest(JSON.stringify({ "Key": "AddCommonUse", "Value": docID }));
                    }
                    break;
            }
            //return false;
        }

        function OpenPDFViewerWithFileCenterV2(sJson) {
            var h = $uof.tool.printScreenSize('h', screen.availHeight);
            var w = $uof.tool.printScreenSize('w', screen.availWidth);
            $uof.window.open("../../DMS/DocStore/PdfViewerSL.aspx?p=" + encodeURIComponent(sJson), w, h);
        }

        //15.0 UDocViewer
        function OpenUDocViewer(sJson, docid, docversion, status) {
            var data = [$uof.tool.htmlDecode(docid), $uof.tool.htmlDecode(docversion), $uof.tool.htmlDecode(status)];
            $uof.pageMethod.syncUc("DMS/DocStore/UC_DMSDoc.ascx", "StatisticsViewCount", data);
            $uof.uDocViewer.open(sJson);
        }

    </script>
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="ToolbarContentPlaceHolder" runat="Server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="LeftContentPlaceHolder" runat="Server">
    <telerik:RadTreeView ID="treeLendFolder" runat="server" ShowLineImages="False" Skin="Metro" EnableNodeTextHtmlEncoding="true"
        OnClientNodeClicking="OntreeLendFolderClicking" OnNodeExpand="treeLendFolder_NodeExpand" OnNodeClick="treeLendFolder_NodeClick" meta:resourcekey="treeLendFolderResource1">
    </telerik:RadTreeView>
    <asp:Label ID="lblDMSRoot" runat="server" Text="文件庫" Visible="False" meta:resourcekey="lblDMSRootResource1"></asp:Label>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="RightContentPlaceHolder" runat="Server">
    <asp:Panel ID="panContent" runat="server" meta:resourcekey="panContentResource1">
    <table>
        <tr>
            <td>&nbsp;&nbsp;&nbsp;</td>
            <td>
                <table style="width: 100%;" cellspacing="0" border="0">
                    <tr>
                        <td >
                            <table style="width: 100%;">
                                <tr>
                                    <td style="width:20px">&nbsp;
                                        <asp:Image ID="imgFolder" runat="server" meta:resourcekey="imgFolderResource1" />
                                    </td>
                                    <td style="min-width:20px; max-width:350px; vertical-align: bottom; text-align:left;overflow:auto;" nowrap>
                                        <div style="overflow:auto;">
                                            <span style="min-width:20px; max-width:350px; text-wrap:none; text-align:left;">
                                                <asp:Label ID="labFolderName" runat="server" CssClass="SizeXL" meta:resourcekey="labFolderNameResource1" ></asp:Label>
                                                <asp:Image ID="imgAgent" runat="server" ImageUrl="~/DMS/images/imgAgent.gif" ToolTip="代理訂閱" Visible="False" meta:resourcekey="imgAgentResource1" />
                                            </span>
                                        </div>
                                    </td>
                                </tr>
                            </table>
                        </td>
                        <td>&nbsp;&nbsp;</td>
                        <td style="height: 12px; text-align:left; vertical-align:middle;" nowrap>
                            <asp:Panel ID="panDefault" runat="server" meta:resourcekey="panDefaultResource1" >
                                <table>
                                    <tr>
                                        <td>
                                            <table ID="folderSearch" runat="server" style="width:100%; ">
                                                <tr runat="server">
                                                    <td runat="server">
                                                        <span >
                                                        <asp:Label ID="lblSearchFolderDoc" runat="server" Text="搜尋目錄下文件(名稱、編號、關鍵字):" meta:resourcekey="lblSearchFolderDocResource1"></asp:Label>
                                                        <asp:TextBox ID="txtKeyWord" runat="server" Width="170px"></asp:TextBox>
                                                        <telerik:RadButton ID="btnSearch" runat="server"  OnClick="btnSearch_Click" Text="搜尋"  Width="68px"  meta:resourcekey="btnSearchResource1">
                                                            <Icon PrimaryIconUrl="~/DMS/images/zoom.gif" PrimaryIconLeft="2px" />
                                                        </telerik:RadButton>
                                                        </span>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="Label1" runat="server" Text="顯示方式：" meta:resourcekey="Label1Resource1" ></asp:Label>
                                            <asp:DropDownList ID="ddlChangeStyle" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlChangeStyle_SelectedIndexChanged" meta:resourcekey="ddlChangeStyleResource1" >
                                                <asp:ListItem Value="ListStyle" Selected="True" Text="文件列表" meta:resourcekey="ListItemResource1" ></asp:ListItem>
                                                <asp:ListItem Value="DetailStyle" Text="詳細資料" meta:resourcekey="ListItemResource2" ></asp:ListItem>
                                            </asp:DropDownList>
                                            &nbsp;&nbsp;
                                            <asp:Label ID="Label9" runat="server" Text="排列方式：" meta:resourcekey="Label9Resource1" ></asp:Label>
                                            <asp:DropDownList ID="ddlSortType" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlSortType_SelectedIndexChanged" meta:resourcekey="ddlSortTypeResource1" >
                                                <asp:ListItem Value="DocName" Text="文件名稱" meta:resourcekey="ListItemResource3" ></asp:ListItem>
                                                <asp:ListItem Value="DocSerial" Text="文件編號" meta:resourcekey="ListItemResource4" ></asp:ListItem>
                                                <asp:ListItem Value="DocAuthor" Text="作者" meta:resourcekey="ListItemResource5" ></asp:ListItem>
                                                <asp:ListItem Value="DocStatus" Text="狀態" meta:resourcekey="ListItemResource6" ></asp:ListItem>
                                                <asp:ListItem Value="DocModifyDate" Text="修改日" meta:resourcekey="ListItemResource7" ></asp:ListItem>
                                                <asp:ListItem Value="DocKeyWord" Text="關鍵字" meta:resourcekey="ListItemResource8" ></asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                    </tr>
                                    
                                </table>
                            </asp:Panel>                        
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>&nbsp;&nbsp;&nbsp;
            </td>
            <td align="left" style="width: 100%">
                <Fast:Grid ID="Grid1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateCheckBoxColumn="False"
                    AutoGenerateColumns="False" DataKeyNames="DOC_ID"
                    OnRowDataBound="Grid1_RowDataBound"
                    Width="100%" OnPageIndexChanging="Grid1_PageIndexChanging" OnSorting="Grid1_Sorting"
                    SkinID="DMSStyle" DataKeyOnClientWithCheckBox="False" EnhancePager="True" PageSize="15"
                    DefaultSortDirection="Ascending" EmptyDataText="沒有資料" KeepSelectedRows="False" CustomDropDownListPage="False" meta:resourcekey="Grid1Resource1" SelectedRowColor="" UnSelectedRowColor="" >
                    <EnhancePagerSettings ShowHeaderPager="True" />
                    <ExportExcelSettings AllowExportToExcel="False" />
                    <Columns>
                        <asp:TemplateField HeaderText="文件編號" meta:resourcekey="TemplateFieldResource1" SortExpression="DOC_SERIAL">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" meta:resourcekey="TextBox1Resource1" Text='<%# Bind("DOC_SERIAL") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <span style="width: 80px;">
                                <asp:Label ID="Label2" runat="server" meta:resourcekey="Label2Resource1" Text='<%#: Bind("DOC_SERIAL") %>'></asp:Label>
                                </span>
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Center" Width="100px" Wrap="False" />
                            <ItemStyle Width="100px" Wrap="False" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="文件名稱" meta:resourcekey="TemplateFieldResource2" SortExpression="DOC_NAME">
                            <ItemTemplate>
                                <table style="width:100%;">
                                    <tr>
                                        <td style="min-width: 16px">
                                            <asp:Image ID="imgStar1" runat="server" ImageUrl="~/DMS/images/ratnull.gif" meta:resourcekey="imgStar1Resource1" />
                                            <asp:Image ID="imgPDFError" runat="server" ImageUrl="~/DMS/images/error.gif" meta:resourcekey="imgPDFErrorResource1" />
                                            <asp:Image ID="docIcon" runat="server" ImageUrl="~/DMS/images/icon/unknown.gif" meta:resourcekey="docIconResource1" />
                                        </td>
                                        <td>&nbsp;
                                            <asp:LinkButton ID="labDLFile" runat="server" meta:resourcekey="labDLFileResource1" Text='<%#: Bind("DOC_NAME") %>'></asp:LinkButton>
                                        </td>
                                        <td style="width:100%;">
                                            <table style="width:100%;">
                                                <tr>
                                                    <td style="text-align:right;">
                                                        <asp:ImageButton ID="imgPDFViewer" runat="server" AlternateText="觀看文件" CommandArgument='<%# Eval("DOC_ID")+","+Eval("MANUAL_VERSION") %>' CommandName="PDFViewer" meta:resourcekey="imgPDFViewerResource1" OnClick="imgPDFViewer_Click" Visible="False" />
                                                        <asp:Image ID="imgNoPDFViewer" runat="server" meta:resourcekey="imgNoPDFViewerResource1" Visible="False" />
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                </table>
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Center" Wrap="False" />
                            <ItemStyle HorizontalAlign="Left" Wrap="False" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="作者" meta:resourcekey="TemplateFieldResource3" SortExpression="DOC_AUTHOR">
                            <ItemTemplate>
                                <asp:Label ID="lblAuthor" runat="server" meta:resourcekey="lblAuthorResource1"></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Center" Wrap="False" />
                            <ItemStyle Width="120px" Wrap="False" />
                        </asp:TemplateField>
                        <asp:BoundField DataField="MANUAL_VERSION" HeaderText="版本" meta:resourcekey="BoundFieldResource1" SortExpression="MANUAL_VERSION">
                        <HeaderStyle HorizontalAlign="Center" Wrap="False" />
                        <ItemStyle Width="45px" Wrap="False" />
                        </asp:BoundField>
                        <asp:TemplateField HeaderText="狀態" meta:resourcekey="TemplateFieldResource4" SortExpression="DOC_STATUS_DISPLAY">
                            <ItemTemplate>
                                <asp:Label ID="lblStatus" runat="server" meta:resourcekey="lblStatusResource1"></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Center" Wrap="False" />
                            <ItemStyle HorizontalAlign="Center" Width="60px" Wrap="False" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="公佈日" SortExpression="PUBLISH_DATE" meta:resourcekey="BoundFieldResource2">
                            <ItemTemplate>
                                <asp:Label ID="lblPublishDate" runat="server" Text=""></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Center" Width="120px" Wrap="False" />
                            <ItemStyle Width="120px" Wrap="False" />
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="關鍵字" meta:resourcekey="TemplateFieldResource5" SortExpression="DOC_KEYWORD">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox2" runat="server" meta:resourcekey="TextBox2Resource1" Text='<%# Bind("DOC_KEYWORD") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblKeyWord" runat="server" meta:resourcekey="lblKeyWordResource1" Text='<%# Bind("DOC_KEYWORD") %>'></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Center" Width="150px" Wrap="False" />
                            <ItemStyle Width="150px" Wrap="False" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="操作" meta:resourcekey="TemplateFieldResource6">
                            <ItemTemplate>
                                <asp:LinkButton ID="lbtnInfo" runat="server" ForeColor="Blue" meta:resourcekey="lbtnInfoResource1" Text="資訊"></asp:LinkButton>
                                &nbsp;
                                <asp:LinkButton ID="lbtnAdvanced" runat="server" ForeColor="Blue" meta:resourcekey="lbtnAdvancedResource1" Text="進階"></asp:LinkButton>
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Center" Wrap="False" />
                            <ItemStyle HorizontalAlign="Center" Width="100px" Wrap="False" />
                        </asp:TemplateField>
                    </Columns>
                    <RowStyle Height="30px" />
                </Fast:Grid>
                <Fast:Grid ID="gridDetail" runat="server" AllowSorting="True" AutoGenerateCheckBoxColumn="False"
                    AutoGenerateColumns="False" DataKeyNames="DOC_ID"
                    Width="100%" SkinID="DMSStyle" DataKeyOnClientWithCheckBox="False"
                    EnhancePager="True" ShowHeader="False" OnRowDataBound="gridDetail_RowDataBound"
                    AllowPaging="True" OnPageIndexChanging="gridDetail_PageIndexChanging" DefaultSortDirection="Ascending"
                    PageSize="15" EmptyDataText="沒有資料"
                    KeepSelectedRows="False" CustomDropDownListPage="False" meta:resourcekey="gridDetailResource1" SelectedRowColor="" UnSelectedRowColor="" >
                    <EnhancePagerSettings ShowHeaderPager="True" FirstAltImageUrl="" FirstImageUrl="" LastAltImage="" LastImageUrl="" NextIAltImageUrl="" NextImageUrl="" PageInfoCssClass="" PageNumberCssClass="" PageNumberCurrentCssClass="" PageRedirectCssClass="" PreviousAltImageUrl="" PreviousImageUrl="" />
                    <ExportExcelSettings AllowExportToExcel="False" />
                    <Columns>
                        <asp:TemplateField meta:resourcekey="TemplateFieldResource7" >
                            <ItemTemplate>
                                <table style=" text-align: left; width: 100%;" border="0">
                                    <tbody>
                                        <tr>
                                            <td colspan="3">
                                                <table>
                                                    <tbody>
                                                        <tr>
                                                            <td>&nbsp;&nbsp;
                                                                <asp:Image ID="imgStar1" runat="server" ImageUrl="~/DMS/images/ratnull.gif" meta:resourcekey="imgStar1Resource2" ></asp:Image>
                                                                <asp:Image ID="imgPDFError" runat="server" ImageUrl="~/DMS/images/error.gif" meta:resourcekey="imgPDFErrorResource2" ></asp:Image>
                                                                <asp:Image ID="docIcon" runat="server" ImageUrl="~/DMS/images/icon/unknown.gif" meta:resourcekey="docIconResource2" ></asp:Image>
                                                            </td>
                                                            <td>&nbsp;
                                                                <span style="width: 520px; word-break: break-all">
                                                                    <asp:LinkButton ID="labDLFile" runat="server" Text='<%# Bind("DOC_NAME") %>'
                                                                        ForeColor="Maroon" meta:resourcekey="labDLFileResource2" >
                                                                    </asp:LinkButton>
                                                                </span>                                                                
                                                            </td>
                                                            <td>&nbsp;
                                                                <asp:ImageButton ID="imgPDFViewer" CommandName="PDFViewer" CommandArgument='<%# Eval("DOC_ID")+","+Eval("MANUAL_VERSION") %>' Visible="False" runat="server" AlternateText="觀看文件" OnClick="imgPDFViewer_Click" meta:resourcekey="imgPDFViewerResource2"/>
                                                                <asp:Image ID="imgNoPDFViewer" runat="server" Visible="False" meta:resourcekey="imgNoPDFViewerResource2"></asp:Image>
                                                            </td>
                                                        </tr>
                                                    </tbody>
                                                </table>

                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="3">&nbsp;&nbsp;&nbsp;<asp:Label ID="lblFile" runat="server" Text="檔案名稱："
                                                ForeColor="Gray" meta:resourcekey="lblFileResource1" ></asp:Label>
                                                <asp:Label ID="labFilename" runat="server" Text='<%# Bind("FILE_NAME") %>' meta:resourcekey="labFilenameResource1" ></asp:Label>
                                            </td>
                                        </tr>
                                        <tr >
                                            <td style="width:35%"  nowrap>&nbsp;&nbsp;
                                            <asp:Label ID="Label3" runat="server" Text="作者：" ForeColor="Gray" meta:resourcekey="Label3Resource1" ></asp:Label>
                                                <asp:Label ID="lblAuthor" runat="server" meta:resourcekey="lblAuthorResource2" ></asp:Label>
                                            </td>
                                            <td style="width: 20%">
                                                <asp:Label ID="Labela41" runat="server" Text="版本：" ForeColor="Gray" meta:resourcekey="Labela41Resource1" ></asp:Label>
                                                <asp:Label ID="labDetailVer" runat="server" Text='<%#: Bind("MANUAL_VERSION") %>' meta:resourcekey="labDetailVerResource1" ></asp:Label>
                                            </td>
                                            <td nowrap>
                                                <asp:Label ID="lblDocNum" runat="server" Text="文件編號："
                                                    ForeColor="Gray" meta:resourcekey="lblDocNumResource1" ></asp:Label>
                                                <span style="width: 150px; word-break: break-all">
                                                    <asp:Label ID="labDocSerial" runat="server" Text='<%#: Bind("DOC_SERIAL") %>' meta:resourcekey="labDocSerialResource1" ></asp:Label>
                                                </span>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="width:35%">&nbsp;&nbsp;
                                                <asp:Label ID="Label11" runat="server" Text="異動日：" ForeColor="Gray" meta:resourcekey="Label11Resource1" ></asp:Label>
                                                <asp:Label ID="labDModifyDate" runat="server" meta:resourcekey="labDModifyDateResource1" ></asp:Label>
                                            </td>
                                            <td style="width:20%">
                                                <asp:Label ID="Labela4" runat="server" Text="生效日：" ForeColor="Gray" meta:resourcekey="Labela4Resource1" ></asp:Label>
                                                <asp:Label ID="lblActiveDay" runat="server" ForeColor="Black" meta:resourcekey="lblActiveDayResource1" ></asp:Label>
                                            </td>
                                            <td >
                                                <asp:Label ID="lblSatusTitle" runat="server" ForeColor="Gray" Text="狀態：" meta:resourcekey="lblSatusTitleResource1"></asp:Label>
                                                <asp:Label ID="lblStatus" runat="server" meta:resourcekey="lblStatusResource2" ></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="text-align: left;" colspan="2">&nbsp;&nbsp;
                                            <asp:Label ID="lblPublishDateText" runat="server" Text="公佈日：" ForeColor="Gray" meta:resourcekey="lblPublishDateTextResource1" ></asp:Label>
                                                <asp:Label ID="lblPublishDate" runat="server" meta:resourcekey="lblPublishDateResource1" ></asp:Label>
                                            </td>
                                            <td>
                                                <asp:Label ID="Labela6" runat="server" Text="過期日：" ForeColor="Gray" meta:resourcekey="Labela6Resource1" ></asp:Label>
                                                <asp:Label ID="lblInvalidDay" runat="server" ForeColor="Black" meta:resourcekey="lblInvalidDayResource1" ></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="left" colspan="3">
                                                <table style="table-layout: fixed" cellspacing="0" cellpadding="0" border="0">
                                                    <tbody>
                                                        <tr>
                                                            <td style="width: 75px" valign="top">&nbsp;&nbsp;
                                                            <asp:Label ID="Label12" runat="server" Text="摘要：" ForeColor="Gray" meta:resourcekey="Label12Resource1" ></asp:Label>
                                                            </td>
                                                            <td>
                                                                <span style="width: 480px; word-break: break-all">
                                                                    <asp:Label ID="labdelSummary" runat="server" Text='<%# Bind("DOC_COMMENT") %>' meta:resourcekey="labdelSummaryResource1" ></asp:Label>
                                                                </span>

                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td style="width: 75px" valign="top">&#160;
                                                            </td>
                                                            <td>&#160;
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td style="width: 75px; vertical-align: text-top; white-space: nowrap">&#160;&#160;
                                                                <asp:Label ID="Label13" runat="server" ForeColor="Gray" Text="關鍵字：" meta:resourcekey="Label13Resource1" ></asp:Label>

                                                            </td>
                                                            <td>
                                                                <span style="width: 480px; word-break: break-all">
                                                                    <asp:Label ID="labdetKeyword" runat="server" Text='<%# Bind("DOC_KEYWORD") %>' meta:resourcekey="labdetKeywordResource1" ></asp:Label>
                                                                </span>
                                                            </td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="3">&nbsp;&nbsp;
                                            <asp:Label ID="lblClass" runat="server" ForeColor="Gray"  Text="文件類別：" meta:resourcekey="lblClassResource1"></asp:Label>
                                                <span style="width: 480px; word-break: break-all">
                                                    <asp:Label ID="lblDocClass" runat="server" Text='<%# Bind("CLASS_NAME") %>' meta:resourcekey="lblDocClassResource1" ></asp:Label>
                                                </span>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="3">&nbsp;&nbsp;
                                            <asp:Label ID="lblPath" runat="server" Text="文件路徑：" ForeColor="Gray" meta:resourcekey="lblPathResource1" ></asp:Label>
                                                <asp:Label ID="lblDocPath" runat="server" meta:resourcekey="lblDocPathResource1" ></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="height: 21px" align="right" colspan="3">
                                                <asp:Image ID="Image8" runat="server" ImageUrl="~/DMS/images/inform.gif" EnableViewState="False" meta:resourcekey="Image8Resource1" />

                                                <asp:LinkButton ID="lbtnInfo" runat="server" Text="資訊" ForeColor="Blue" meta:resourcekey="lbtnInfoResource2" ></asp:LinkButton>
                                                &nbsp; <span lang="zh-tw">&#160;</span><asp:Image ID="Image9" runat="server" ImageUrl="~/DMS/images/commondoc.gif" EnableViewState="False" meta:resourcekey="Image9Resource1" />

                                                <asp:LinkButton ID="lbtnCommonuse" runat="server" Text="加入常用文件" ForeColor="Blue" meta:resourcekey="lbtnCommonuseResource1" ></asp:LinkButton>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>


                            </ItemTemplate>
                            <HeaderStyle ForeColor="White" />
                        </asp:TemplateField>
                    </Columns>
                    <RowStyle Height="30px" />
                </Fast:Grid>
            </td>
        </tr>
    </table>
    <div class="contextMenu" id="contextRoleView" style="display: none; left: 870px; top: 69px;">
        <table cellspacing="0" cellpadding="0" border="0">
            <tbody>
                <tr>
                    <td align="center" style="background-color: darkolivegreen" valign="top">
                        <nobr><SPAN style="COLOR: #ffffff"><asp:Label id="Label4" runat="server" Text="功能表" meta:resourcekey="Label4Resource1" ></asp:Label></SPAN></nobr>
                    </td>
                </tr>
                <tr id="CommonuseTR" style="display: none;">
                    <td class="menuItem" valign="top" style="background-color: #ececec">
                        <table cellpadding="0" cellspacing="0" border="0" width="100%">
                            <tr>
                                <td width="3" runat="server" id="Commonuse">&nbsp;</td>
                                <td nowrap>&nbsp;
                                <asp:Label ID="lblCommonuse" runat="server" Text="加入常用文件" ForeColor="Gray" meta:resourcekey="lblCommonuseResource1"></asp:Label>
                                    <asp:HyperLink ID="hyCommonuse" runat="server" NavigateUrl="#" Text="加入常用文件" onclick="OpenWin(this, 1);return;" meta:resourcekey="hyCommonuseResource1" ></asp:HyperLink></td>
                            </tr>
                        </table>
                    </td>
                </tr>
        </table>
    </div>
    <asp:HiddenField ID="hfIsSearchFolder" runat="server" />
    <asp:HiddenField ID="hidDocID" runat="server" />
    <asp:HiddenField ID="hfOldFolderID" runat="server" />
    <asp:HiddenField ID="hidFolderID" runat="server" />     
    <asp:HiddenField ID="Hidden2" runat="server" />
    <asp:HiddenField ID="hfKeyWord" runat="server" />
    </asp:Panel>
    <asp:Label ID="lblLendOther" runat="server" Text="其他" Visible="False" meta:resourcekey="lblLendOtherResource2" ></asp:Label>
    <asp:Label ID="lblSuccessAdd" runat="server" Text="已成功加入我的收藏。" Visible="False" meta:resourcekey="lblSuccessAddResource1" ></asp:Label>
    <asp:Label ID="lblAddUseError" runat="server" Text="加入常用文件時發生錯誤" Visible="False" meta:resourcekey="lblAddUseErrorResource1" ></asp:Label>
    <asp:Label ID="labPDFConvertERROR" runat="server" ForeColor="Blue" Text="發生錯誤，轉換失敗！" Visible="False" meta:resourcekey="labPDFConvertERRORResource1" ></asp:Label>
    <asp:Label ID="lblProtectMsg" runat="server" Text="此為保全文件無法線上觀看" ForeColor="Blue" Visible="False" meta:resourcekey="lblProtectMsgResource1" ></asp:Label>
    <asp:Label ID="lblNotsupportDoc" runat="server" Text="目錄設定為必須轉檔，但此檔案類型並不支援" ForeColor="Blue" Visible="False" meta:resourcekey="lblNotsupportDocResource1" ></asp:Label>
    <asp:Label ID="lblFileNotTransferToUof" runat="server" Text="目前檔案仍在Proxy伺服器，正由系統進行傳輸中，請稍後！" Visible="False" ForeColor="Blue" meta:resourcekey="lblFileNotTransferToUofResource1" ></asp:Label>
    <asp:Label ID="labAlert" runat="server" ForeColor="Blue" Text="正在進行檔案轉換，請稍後再觀看" Visible="False" meta:resourcekey="labAlertResource1" ></asp:Label>
    <asp:Label ID="labFileError" runat="server" ForeColor="Blue" Text="發生錯誤，檔案不存在！" Visible="False" meta:resourcekey="labFileErrorResource1" ></asp:Label>
    <asp:Label ID="lblFilePageOutLimitMsg" runat="server" Text="檔案頁數{0}頁，超過可轉檔上限。" Visible="false" meta:resourcekey="lblFilePageOutLimitMsgResource1"></asp:Label>
    <asp:Label ID="lblFileHasPassword" runat="server" Text="原始檔案有設定密碼，無法轉檔" Visible="false" meta:resourcekey="lblFileHasPasswordResource1"></asp:Label>
    <asp:Label ID="lblFolderDel" runat="server" Text="目錄已被刪除" Visible="False" meta:resourcekey="lblFolderDelResource1"></asp:Label>
    <asp:Label ID="labNoActive" runat="server" Text="未生效" Visible="False" meta:resourcekey="labNoActiveResource1"></asp:Label>
    <asp:Label ID="lblInactive" runat="server" Text="已失效" Visible="False" meta:resourcekey="lblInactiveResource1" ></asp:Label>
    <asp:Label ID="lblUpdating" runat="server" Text="改版中" Visible="False" meta:resourcekey="lblUpdatingResource1" ></asp:Label>
    <asp:Label ID="lblPublish" runat="server" Text="已公佈" Visible="False" meta:resourcekey="lblPublishResource1" ></asp:Label>
    <asp:Label ID="lblVioding" runat="server" Text="(作廢審核中)" Visible="False" meta:resourcekey="lblViodingResource1" ></asp:Label>
    <asp:Label ID="lblDeleting" runat="server" Text="(銷毀審核中)" Visible="False" meta:resourcekey="lblDeletingResource1" ></asp:Label>
    <asp:Label ID="lblActive" runat="server" Text="立即生效" Visible="False" meta:resourcekey="lblActiveResource1" ></asp:Label>
    <asp:Label ID="lblNeverOverdue" runat="server" Text="永不過期" Visible="False" meta:resourcekey="lblNeverOverdueResource1" ></asp:Label>
    <asp:Label ID="lblConfirmAddUse" runat="server" Text="確定要加入常用文件?" Visible="False" meta:resourcekey="lblConfirmAddUseResource1" ></asp:Label>
    <asp:Label ID="lblConfirmAdd" runat="server" Text="確定要加入收藏嗎?" Visible="False" meta:resourcekey="lblConfirmAddResource1" ></asp:Label>
    <asp:Label ID="lblConfirmDeleteCommonList" runat="server" Text="確定要取消常用文件嗎?" Visible="False" meta:resourcekey="lblConfirmDeleteCommonListResource1" ></asp:Label>
    <asp:Label ID="lblDocSerial" runat="server" Text="文件編號：" Visible="false" meta:resourcekey="lblDocSerialResource1"></asp:Label>
    <asp:Label ID="lblManualVersion" runat="server" Text="版本：" Visible="false" meta:resourcekey="lblManualVersionResource1"></asp:Label>
    <asp:Label ID="lblPrintUser" runat="server" Text="列印者：" Visible="false" meta:resourcekey="lblPrintUserResource1"></asp:Label>
    <asp:Label ID="lblDocInvalid" runat="server" Text="此文件已下架、失效或作廢，無法觀看或下載" Visible="False" meta:resourcekey="lblDocInvalidResource1"></asp:Label>
    <asp:Label ID="lblNoDL" runat="server" Text="此文件目前不可下載" Visible="False" meta:resourcekey="lblNoDLResource1"></asp:Label>
    <asp:Label ID="lblNoLend" runat="server" Text="此文件目前不允許調閱" Visible="False" meta:resourcekey="lblNoLendResource1"></asp:Label>
    <asp:Label ID="lblNoFolderAuthority" runat="server" Text="無此目錄觀看權限" Visible="False" meta:resourcekey="lblNoFolderAuthorityResource1"></asp:Label>    
    <asp:Label ID="lblDocNotFind" runat="server" Text="文件還未上傳或已被銷毀" Visible="False" meta:resourcekey="lblDocNotFindResource1"></asp:Label>
    <asp:HiddenField ID="hfCurrentUser" runat="server" />
    <asp:HiddenField ID="HiddenFieldPostBack" runat="server" Value="True" />
    <a id="atag" style="display:none;">Run UDoc Viewer</a>
</asp:Content>
