<%@ Page Language="C#" MasterPageFile="~/Master/TwoColumn.master" AutoEventWireup="true" Inherits="DMS_Admin_DocMaintain" Title="文件維護" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" Codebehind="DocMaintain.aspx.cs" %>

<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>
<%@ Register Src="~/Common/ChoiceCenter/UC_ChoiceList.ascx" TagPrefix="uc1" TagName="UC_ChoiceList" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ScriptContentPlaceHolder" runat="Server">
    <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server" OnAjaxRequest="RadAjaxManager1_AjaxRequest" meta:resourcekey="RadAjaxManager1Resource1">
        <AjaxSettings>
            <telerik:AjaxSetting AjaxControlID="RadAjaxManager1">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="RadToolBar1" UpdatePanelCssClass="" UpdatePanelHeight="100%" />
                    <telerik:AjaxUpdatedControl ControlID="panContent" UpdatePanelHeight="100%" UpdatePanelRenderMode="Inline" />
                </UpdatedControls>
            </telerik:AjaxSetting>
            <telerik:AjaxSetting AjaxControlID="RadTabStrip1">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="folderTree" UpdatePanelCssClass="" UpdatePanelHeight="100%" />
                    <telerik:AjaxUpdatedControl ControlID="panContent" UpdatePanelCssClass="100%" UpdatePanelHeight="100%" />
                </UpdatedControls>
            </telerik:AjaxSetting>
            <telerik:AjaxSetting AjaxControlID="folderTree">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="RadToolBar1" UpdatePanelCssClass="" UpdatePanelHeight="100%" />
                    <telerik:AjaxUpdatedControl ControlID="panContent" UpdatePanelCssClass="100%" UpdatePanelHeight="100%" />
                </UpdatedControls>
            </telerik:AjaxSetting>
            <telerik:AjaxSetting AjaxControlID="okBtn">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="panContent" UpdatePanelCssClass="100%" UpdatePanelHeight="100%" UpdatePanelRenderMode="Inline" />
                </UpdatedControls>
            </telerik:AjaxSetting>
            <telerik:AjaxSetting AjaxControlID="RadToolBar1">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="folderTree" UpdatePanelCssClass="" UpdatePanelHeight="100%" />
                    <telerik:AjaxUpdatedControl ControlID="panContent" UpdatePanelCssClass="100%" UpdatePanelHeight="100%" UpdatePanelRenderMode="Inline" />
                </UpdatedControls>
            </telerik:AjaxSetting>
        </AjaxSettings>
    </telerik:RadAjaxManager>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ToolbarContentPlaceHolder" runat="Server">
    <telerik:RadCodeBlock ID="RadCodeBlock1" runat="server">
        
        <script type="text/javascript">

            function RadFolderToolbar_Click(sender, args) {

                var oButton = args.get_item();
                oButton.Key = oButton.get_value();
                var hidNodeTag = $("#<%=hidNodeTag.ClientID %>");
                var tree = $find("<%= folderTree.ClientID %>");
                var node = tree.get_selectedNode();
                var folderId = node.get_value();
                hidNodeTag.value = folderId;

                var checkedData = $uof.fastGrid.getChecked('<%=Grid1.ClientID%>');

                switch (oButton.get_value()) {
                    // 目錄維護
                    case "FolderManage":
                        {
                            args.set_cancel(true);
                            $uof.dialog.open2("~/DMS/Admin/FolderMaintain.aspx", args.get_item(), "", 500, 500, OpenDocDialogResult, { "folderid": folderId });
                        }
                        break;
                    // 搬移文件
                    case "MoveDoc":
                        {
                            //判斷是否有選取要維護的文件
                            if (checkedData == "") {
                                alert('<%=lblSelectDoc.Text%>')
                                args.set_cancel(true);
                                return;
                            }
                            //判斷是否所有文件都是管理者權限
                            var strNoAuthorityDoc = $uof.pageMethod.sync("GetNoAuthorityDocJS", [checkedData]);

                            if (strNoAuthorityDoc != "") {
                                alert('<%= lblNoAuthorityError.Text%>' + strNoAuthorityDoc);
                                args.set_cancel(true);
                                return;
                            }
                            var DocIdList = $uof.pageMethod.sync("GetDocIDList", [checkedData]);
                            args.set_cancel(true);
                            $uof.dialog.open2("~/DMS/Admin/MoveDoc.aspx", args.get_item(), "", 500, 500, OpenDocDialogResult, { "folderid": folderId, "key": DocIdList });
                        }
                        break;
                    // 刪除文件
                    case "DelDoc":
                        {
                            //判斷是否有選取要維護的文件
                            if (checkedData == "") {
                                alert('<%=lblSelectDoc.Text%>')
                                args.set_cancel(true);
                                return;
                            }
                        }
                        break;
                    // 作廢文件
                    case "VoidDoc":
                        {
                            //判斷是否有選取要維護的文件
                            if (checkedData == "") {
                                alert('<%=lblSelectDoc.Text%>')
                                args.set_cancel(true);
                                return;
                            }
                        }
                        break;
                    // 變更作者
                    case "ChangeAuthor":
                        {
                            //判斷是否有選取要維護的文件
                            if (checkedData == "") {
                                alert('<%=lblSelectDoc.Text%>')
                                args.set_cancel(true);
                                return;
                            }
                            //判斷是否所有文件都是管理者權限
                            var strNoAuthorityDoc = $uof.pageMethod.sync("GetNoAuthorityDocJS", [checkedData]);
                            if (strNoAuthorityDoc != "") {
                                alert('<%= lblNoAuthorityError.Text%>' + strNoAuthorityDoc);
                                args.set_cancel(true);
                                return;
                            }

                            var DocIdList = $uof.pageMethod.sync("GetDocIDList", [checkedData]);
                            
                            args.set_cancel(true);
                            $uof.dialog.open2("~/DMS/Admin/ChangeAuthor.aspx", args.get_item(), "", 350, 250, OpenDocDialogResult, { "folderid": folderId, "key": DocIdList });
                        }
                        break;
                }
            }
            function OpenDocDialogResult(returnValue) {
                if (typeof (returnValue) == 'undefined' || returnValue == null)
                    return false;
                else
                    return true;
            }
        </script>
    </telerik:RadCodeBlock>
    <telerik:RadToolBar ID="RadToolBar1" runat="server" CausesValidation="false" Width="100%" OnButtonClick="RadToolBar1_ButtonClick" OnClientButtonClicking="RadFolderToolbar_Click" meta:resourcekey="barMainResource1" Height="31px" SingleClick="None">
        <Items>
            <telerik:RadToolBarButton runat="server" Enabled="true" CausesValidation="false" CheckedImageUrl="~/Common/Images/Icon/icon_m120.png" DisabledImageUrl="~/Common/Images/Icon/icon_m120_g.png" HoveredImageUrl="~/Common/Images/Icon/icon_m120.png" ImageUrl="~/Common/Images/Icon/icon_m120.png" Text="目錄維護" Value="FolderManage" meta:resourcekey="RadToolBarButtonResource1">
            </telerik:RadToolBarButton>
            <telerik:RadToolBarButton runat="server" IsSeparator="True" Value="sep4" meta:resourcekey="RadToolBarButtonResource2" />
            <telerik:RadToolBarButton runat="server" CausesValidation="false" CheckedImageUrl="~/Common/Images/Icon/icon_m67_g.png" 
                DisabledImageUrl="~/Common/Images/Icon/icon_m67_g.png" HoveredImageUrl="~/Common/Images/Icon/icon_m67_g.png" 
                ImageUrl="~/Common/Images/Icon/icon_m67_g.png" Text="文件搬移" Value="MoveDoc" meta:resourcekey="RadToolBarButtonResource3">
            </telerik:RadToolBarButton>
            <telerik:RadToolBarButton runat="server" IsSeparator="True" Value="sep1" meta:resourcekey="RadToolBarButtonResource4" />
            <telerik:RadToolBarButton runat="server" CausesValidation="false" CheckedImageUrl="~/Common/Images/Icon/icon_m03_g.png" 
                DisabledImageUrl="~/Common/Images/Icon/icon_m03_g.png" HoveredImageUrl="~/Common/Images/Icon/icon_m03_g.png" 
                ImageUrl="~/Common/Images/Icon/icon_m03_g.png" Text="文件銷毀" Value="DelDoc" meta:resourcekey="RadToolBarButtonResource5">
            </telerik:RadToolBarButton>
            <telerik:RadToolBarButton runat="server" IsSeparator="True" Value="sep2" meta:resourcekey="RadToolBarButtonResource6" />
            <telerik:RadToolBarButton runat="server" CausesValidation="false" CheckedImageUrl="~/Common/Images/Icon/icon_m11.png" 
                DisabledImageUrl="~/Common/Images/Icon/icon_m11.png" HoveredImageUrl="~/Common/Images/Icon/icon_m11.png" 
                ImageUrl="~/Common/Images/Icon/icon_m11.png" Text="文件作廢" Value="VoidDoc" meta:resourcekey="RadToolBarButtonResource7">
            </telerik:RadToolBarButton>
            <telerik:RadToolBarButton runat="server" IsSeparator="True" Value="sep3" meta:resourcekey="RadToolBarButtonResource8" />
            <telerik:RadToolBarButton runat="server" CausesValidation="false" CheckedImageUrl="~/Common/Images/Icon/icon_m60_g.png"
                DisabledImageUrl="~/Common/Images/Icon/icon_m60_g.png" HoveredImageUrl="~/Common/Images/Icon/icon_m60_g.png" 
                ImageUrl="~/Common/Images/Icon/icon_m60_g.png" Text="變更讀作者" Value="ChangeAuthor" meta:resourcekey="RadToolBarButtonResource9">
            </telerik:RadToolBarButton>
            <telerik:RadToolBarButton runat="server" IsSeparator="True" Value="sep4" />
        </Items>
    </telerik:RadToolBar>    
    <asp:HiddenField ID="hidNodeTag" runat="server" Value="DMSRoot" />
    <asp:Label ID="lblRoot" runat="server" Text="文件庫" Visible="False" meta:resourcekey="lblRootResource1"></asp:Label>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="LeftContentPlaceHolder" runat="Server">
    <script>
        // 為了讓RadToorbar的文件銷毀/文件作廢，在呼叫Dialog並按下確定/關閉視窗後回到本頁時，可以自動Reload資料，故從後端事件RadToolBar1_ButtonClick呼叫此Tab切換事件
        function OnClientTabSelected(sender, eventArgs) {

            // 當sender的值為字串、eventArgs為undefined時，代表為後端事件RadToolBar1_ButtonClick手動呼叫
            if (eventArgs !== undefined) {
                var tab = eventArgs.get_tab();
                var tabValue = tab.get_value();
            }
            
            switch (sender) {
                case 'AdminFolder':
                    var ajaxManager = $find("<%= RadAjaxManager1.ClientID %>");
                    ajaxManager.ajaxRequest(JSON.stringify({ "Key": "TabChange1", "Value": sender }));
                    break;

                case 'tabSearch':
                    var ajaxManager = $find("<%= RadAjaxManager1.ClientID %>");
                    ajaxManager.ajaxRequest(JSON.stringify({ "Key": "TabChange2", "Value": sender }));
                    break;

                default:
                    switch (tabValue) {
                        case 'AdminFolder':
                            var ajaxManager = $find("<%= RadAjaxManager1.ClientID %>");
                            ajaxManager.ajaxRequest(JSON.stringify({ "Key": "TabChange1", "Value": tabValue }));
                            break;

                        case 'tabSearch':
                            var ajaxManager = $find("<%= RadAjaxManager1.ClientID %>");
                            ajaxManager.ajaxRequest(JSON.stringify({ "Key": "TabChange2", "Value": tabValue }));
                            break;
                    }
                    break;
            }
        }

        function OntreeFoldertNodeClicking(sender, args) {
                var oldFolderid = $("#<%=hfFolderID.ClientID %>").val();

                $("#<%=hfFolderID.ClientID %>").val(args.get_node().get_value());
                var newFolderid = $("#<%=hfFolderID.ClientID %>").val();
                if (oldFolderid == newFolderid) {
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
    </script>
    <telerik:RadTabStrip ID="RadTabStrip1" MultiPageID="RadMultiPage1" runat="server" OnClientTabSelected="OnClientTabSelected" meta:resourcekey="RadTabStrip1Resource1" SelectedIndex="0">
        <Tabs>
            <telerik:RadTab runat="server" Text="目錄" Value="AdminFolder" PageViewID="RadPageView1" Selected="True" meta:resourcekey="TabResource1">
            </telerik:RadTab>
            <telerik:RadTab runat="server" Text="全文檢索" Value="tabSearch" PageViewID="RadPageView2" meta:resourcekey="RadTabResource1">
            </telerik:RadTab>
        </Tabs>
    </telerik:RadTabStrip>
    <telerik:RadMultiPage ID="RadMultiPage1" runat="server" meta:resourcekey="RadMultiPage1Resource1">
        <telerik:RadPageView runat="server" ID="RadPageView1" meta:resourcekey="RadPageView1Resource1">
            <div runat="server" id="treeBG" style="background-repeat: repeat; width: 100%; height: 100%">
                <telerik:RadTreeView runat="server" ID="folderTree" EnableNodeTextHtmlEncoding="true"
                    OnClientNodeClicking="OntreeFoldertNodeClicking" OnNodeClick="folderTree_NodeClick" meta:resourcekey="folderTreeResource1">
                </telerik:RadTreeView>
            </div>
        </telerik:RadPageView>
        <telerik:RadPageView runat="server" ID="RadPageView2" meta:resourcekey="RadPageView2Resource1">
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <table border="0" cellspacing="1px" style="width: 100%; border-collapse: separate; margin-left: 5px;">
                        <tr>
                            <td style="text-align: left; white-space: nowrap;" colspan="2">
                                <telerik:RadButton ID="okBtn" runat="server" meta:resourcekey="okBtnResource1" OnClick="okBtn_Click" Text="搜尋" Width="100px">
                                    <Icon PrimaryIconLeft="2px" PrimaryIconUrl="~/DMS/images/zoom.gif" />
                                </telerik:RadButton>
                            </td>
                        </tr>
                        <tr>
                            <td style="word-break:break-all;width:280px;">
                                <asp:Label ID="lblDefaultTitle" runat="server" meta:resourcekey="Label8Resource1" Style="text-wrap: none" Text="●內容、檔名、摘要、文件編號、保管者、其他自訂屬性:"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <div style="margin-left: 10px;">
                                    <telerik:RadTextBox ID="rtxtSearch" runat="server" LabelCssClass="" LabelWidth="64px" Width="148px" meta:resourcekey="rtxtSearchResource1" Resize="None">
                                    </telerik:RadTextBox>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <asp:Label ID="Label4" runat="server" Text="●發行單位:" meta:resourcekey="Label4Resource2"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <uc1:UC_ChoiceList runat="server" ID="choicePublishUnit" ChioceType="Group" ShowMember="false" ExpandToUser="false"/>
                                <asp:CustomValidator ID="validPublishUnit" runat="server" Display="Dynamic" ErrorMessage="只能選擇一個部門" meta:resourcekey="validPublishUnitResource1" ></asp:CustomValidator>
                            </td>
                        </tr>
                        <tr>
                            <td style="text-align: left; white-space: nowrap;">
                                <asp:Label ID="Label3" runat="server" meta:resourcekey="Label3Resource2" Text="●狀態:"></asp:Label>
                            </td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td style="text-align: left; white-space: nowrap;" colspan="2">
                                <div style="margin-left: 10px;">
                                    <asp:DropDownList ID="DropDownList1" runat="server" meta:resourcekey="DropDownList1Resource1" Width="148px">
                                        <asp:ListItem meta:resourcekey="ListItemResource13" Text="所有狀態" Value="All"></asp:ListItem>
                                        <asp:ListItem meta:resourcekey="ListItemResource7" Text="已公佈" Value="Publish"></asp:ListItem>
                                        <asp:ListItem meta:resourcekey="ListItemResource14" Text="未公佈" Value="UnPublish"></asp:ListItem>
                                        <asp:ListItem meta:resourcekey="ListItemResource8" Text="已作廢" Value="Void"></asp:ListItem>
                                        <asp:ListItem meta:resourcekey="ListItemResource9" Text="已失效" Value="Invalid"></asp:ListItem>
                                        <asp:ListItem meta:resourcekey="ListItemResource11" Text="發佈拒絕" Value="DocDeny"></asp:ListItem>
                                        <asp:ListItem meta:resourcekey="ListItemResource12" Text="下架" Value="TempInact"></asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" style="text-align: left; white-space: nowrap;">
                                <asp:Label ID="Label10" runat="server" Text="●公佈日:" meta:resourcekey="Label10Resource1"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td style="text-align: left" colspan="2">
                                <div style="margin-left: 4px;">
                                    <table border="0" cellpadding="1" cellspacing="1" style="margin-left: 5px;">
                                        <tr>
                                            <td>
                                                <asp:Label ID="Label1" runat="server" meta:resourcekey="Label1Resource2" Text="從"></asp:Label>
                                            </td>
                                            <td>
                                                <telerik:RadDatePicker ID="RadDatePicker1" runat="server" meta:resourcekey="RadDatePicker1Resource1">
                                                </telerik:RadDatePicker>
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td style="text-align: left" colspan="2">
                                <div style="margin-left: 4px;">
                                    <table border="0" cellpadding="1" cellspacing="1" style="margin-left: 5px;">
                                        <tr>
                                            <td>
                                                <asp:Label ID="Label2" runat="server" meta:resourcekey="Label2Resource2" Text="到"></asp:Label>
                                            </td>
                                            <td>
                                                <telerik:RadDatePicker ID="RadDatePicker2" runat="server" meta:resourcekey="RadDatePicker2Resource1">
                                                    <DatePopupButton CssClass="" />
                                                </telerik:RadDatePicker>
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td style="text-align: left">
                                <asp:Label ID="Label9" runat="server" Text="●作者:" meta:resourcekey="Label9Resource1"></asp:Label>
                            </td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td style="text-align: left" colspan="2">
                                <uc1:UC_ChoiceList ID="UC_ChoiceListAuthor" runat="server" ShowEmployee="true" ShowMember="false" />
                            </td>
                        </tr>
                        <tr>
                            <td style="white-space: nowrap;">
                                <asp:Label ID="lblDocSearchStatus" runat="server" Text="●副檔名:" meta:resourcekey="lblDocSearchStatusResource1"></asp:Label>
                            </td>
                            <td></td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <div style="margin-left: 10px;">
                                    <telerik:RadTextBox ID="txtExt" runat="server" LabelCssClass="" LabelWidth="64px" Width="148px" meta:resourcekey="txtExtResource1" Resize="None">
                                    </telerik:RadTextBox><br />
                                    <asp:Label ID="Label6" runat="server" CssClass="SizeMemo" Text="例：( pdf )" meta:resourcekey="Label6Resource1"></asp:Label>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="Label5" runat="server" Text="●類別:" meta:resourcekey="Label5Resource1"></asp:Label>
                            </td>
                            <td></td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <div style="margin-left: 10px;">
                                    <telerik:RadTreeView ID="classSearchTree" runat="server" CheckBoxes="True" CheckChildNodes="True" ShowLineImages="False" EnableNodeTextHtmlEncoding="true" TriStateCheckBoxes="False" meta:resourcekey="classSearchTreeResource1"></telerik:RadTreeView>
                                </div>
                            </td>
                        </tr>
                    </table>
                </ContentTemplate>
            </asp:UpdatePanel>
        </telerik:RadPageView>
    </telerik:RadMultiPage>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="RightContentPlaceHolder" runat="Server">
    <script>
        //2012-5-24 ELTON, add for download file by [FileCenterV2 FileControlHandler]
        function DownloadFileWithHandler(sHandlerUrl, sUserProxyIndex) {
            $uof.download(sHandlerUrl, sUserProxyIndex);
        }
    </script>
    <asp:Panel ID="panContent" runat="server" meta:resourcekey="panContentResource1">
        <table border="0" style="width:100%">

            <tr>
                <td>
                    <table style="width: 100%;">
                        <tr>
                            <td style="height: 50px; width: 50px;">&nbsp;&nbsp;&nbsp;&nbsp;
                                <asp:Image ID="imgFolder" runat="server" meta:resourcekey="imgFolderResource1" />

                            </td>
                            <td style="height: 50px; vertical-align: bottom;">
                                <span style="width: 350px; word-break: break-all">
                                    <asp:Label ID="lblFolderName" runat="server" Font-Bold="True" Font-Italic="True"
                                        CssClass="SizeL" meta:resourcekey="lblFolderNameResource1"></asp:Label>
                                </span>
                            </td>
                        </tr>
                    </table>
                    <div style="width: 2%; float: left; display: block">&nbsp;</div>
                    <div style="width: 97%; float: left; display: block">
                        <Fast:Grid ID="Grid1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateCheckBoxColumn="True"
                            AutoGenerateColumns="False" DataKeyNames="DOC_ID"
                            OnRowDataBound="Grid1_RowDataBound" 
                            Width="100%" OnPageIndexChanging="Grid1_PageIndexChanging" OnSorting="Grid1_Sorting"
                            SkinID="DMSStyle" DataKeyOnClientWithCheckBox="True" EnhancePager="True"
                            PageSize="15" DefaultSortDirection="Ascending" EmptyDataText="沒有資料" KeepSelectedRows="False"
                            meta:resourcekey="Grid1Resource1" OnRowCommand="Grid1_RowCommand"   >
                            <EnhancePagerSettings ShowHeaderPager="True" />
                            <ExportExcelSettings AllowExportToExcel="False" />
                            <Columns>
                                <asp:TemplateField HeaderText="文件編號" SortExpression="DOC_SERIAL" meta:resourcekey="TemplateFieldResource4">
                                    <ItemTemplate>
                                        <span style="width: 80px;">
                                            <asp:Label runat="server" Text='<%#: Bind("DOC_SERIAL") %>' ID="Label1" meta:resourcekey="Label1Resource3"></asp:Label>
                                        </span>
                                    </ItemTemplate>
                                    <HeaderStyle Width="100px" Wrap="false" />
                                    <ItemStyle Width="100px" Wrap="false" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="文件名稱" SortExpression="DOC_NAME" meta:resourcekey="TemplateFieldResource1">
                                    <ItemTemplate>
                                        <span style="word-break: break-all; width: 230px;">
                                            <table>
                                                <tr>
                                                    <td style="min-width: 16px">
                                                        <asp:Image ID="imgPDFError" runat="server"
                                                                ImageUrl="~/DMS/images/error.gif" meta:resourcekey="imgPDFErrorResource1" ></asp:Image>
                                                        <asp:Image runat="server" ID="docIcon" ImageUrl="~/DMS/images/icon/unknown.gif"
                                                            meta:resourcekey="docIconResource1"></asp:Image>
                                                            &nbsp;                                                    
                                                    </td>
                                                    <td>
											            <asp:LinkButton ID="labDLFile" runat="server" Text='<%#: Bind("DOC_NAME") %>' meta:resourcekey="labDLFileResource1"></asp:LinkButton>&nbsp;
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
                                    <HeaderStyle Wrap="false" />
                                    <ItemStyle Wrap="false" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="作者" SortExpression="DOC_AUTHOR" meta:resourcekey="TemplateFieldResource2">
                                    <ItemTemplate>
                                        <asp:Label runat="server" ID="lblAuthor" meta:resourcekey="lblAuthorResource1"></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle Width="200px" Wrap="False" />
                                    <ItemStyle Width="200px" Wrap="false" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="版本"  SortExpression="MANUAL_VERSION" meta:resourcekey="BoundFieldResource2">
                                    <ItemTemplate>
                                        <asp:Label ID="labVersion" Text='<%#: Bind("MANUAL_VERSION") %>' runat="server"></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle Width="100px" Wrap="false" />
                                    <ItemStyle Width="100px" HorizontalAlign="Center" Wrap="false" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="狀態" SortExpression="DOC_STATUS_DISPLAY" meta:resourcekey="TemplateFieldResource3">
                                    <ItemTemplate>
                                        <asp:Label runat="server" ID="lblStatus" meta:resourcekey="lblStatusResource1"></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle Width="100px" Wrap="false" />
                                    <ItemStyle HorizontalAlign="Center" Wrap="false"/>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="公佈日" SortExpression="PUBLISH_DATE" meta:resourceKey="BoundFieldResource3">
                                    <ItemTemplate>
                                        <asp:Label runat="server" ID="lblPublishDate"></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle Width="150px" Wrap="false" />
                                    <ItemStyle HorizontalAlign="Center" Wrap="false" />
                                </asp:TemplateField>
                            </Columns>
                        </Fast:Grid>
                    </div>
                </td>
            </tr>
        </table>
    </asp:Panel>    
    <asp:HiddenField ID="hideKey" runat="server" />
    <asp:Label ID="lblCheckin" runat="server" Text="已存回" Visible="False" meta:resourcekey="lblCheckinResource1"></asp:Label>
    <asp:Label ID="lblCheckOut" runat="server" Text="已取出" Visible="False" meta:resourcekey="lblCheckOutResource1"></asp:Label>
    <asp:Label ID="lblApproval" runat="server" Text="審核中" Visible="False" meta:resourcekey="lblApprovalResource1"></asp:Label>
    <asp:Label ID="lblPublish" runat="server" Text="已公佈" Visible="False" meta:resourcekey="lblPublishResource1"></asp:Label>
    <asp:Label ID="lblInactive" runat="server" Text="已失效" Visible="False" meta:resourcekey="lblInactiveResource1"></asp:Label>
    <asp:Label ID="lblVoid" runat="server" Text="已作廢" Visible="False" meta:resourcekey="lblVoidResource1"></asp:Label>
    <asp:Label ID="lblTempInact" runat="server" Text="已下架" Visible="False" meta:resourcekey="lblTempInactResource1"></asp:Label>
    <asp:Label ID="lblOldVer" runat="server" Text="舊版本" Visible="False" meta:resourcekey="lblOldVerResource1"></asp:Label>
    <asp:Label ID="lblReAct" runat="server" Text="已上架" Visible="False" meta:resourcekey="lblReActResource1"></asp:Label>
    <asp:Label ID="labDocDeny" runat="server" Text="發佈拒絕" Visible="False" meta:resourcekey="labDocDenyResource1"></asp:Label>
    <asp:Label ID="lblVioding" runat="server" Text="(作廢審核中)" Visible="False" meta:resourcekey="lblViodingResource1"></asp:Label>
    <asp:Label ID="lblDeleting" runat="server" Text="(銷毀審核中)" Visible="False" meta:resourcekey="lblDeletingResource1"></asp:Label>
    <asp:Label ID="lblUpdating" runat="server" Text="改版中" Visible="False" meta:resourcekey="lblUpdatingResource1"></asp:Label>
    <asp:Label ID="lblDraft" runat="server" Text="草稿" Visible="False" meta:resourcekey="lblDraftResource1"></asp:Label>
    <asp:Label ID="labNoActive" runat="server" Text="未生效" Visible="False" meta:resourcekey="labNoActiveResource1"></asp:Label>    
    <asp:HiddenField ID="hdAppPath" runat="server" />
    <asp:Label ID="lblConfirmDelete" runat="server" Text="確定要將文件銷毀?" Visible="False" meta:resourcekey="lblConfirmDeleteResource1"></asp:Label>
    <asp:Label ID="lblConfirmVoid" runat="server" Text="確定要將文件作廢?" Visible="False" meta:resourcekey="lblConfirmVoidResource1"></asp:Label>
    <asp:Label ID="labDocStore" runat="server" Text="文件庫" Visible="False" meta:resourcekey="labDocStoreResource1"></asp:Label>
    <asp:Label ID="lblFolderDel" runat="server" Text="目錄已被刪除" Visible="False" meta:resourcekey="lblFolderDelResource1"></asp:Label>
    <asp:HiddenField ID="hideSource" runat="server" />
    <asp:HiddenField ID="FASTReturnValue" runat="server" Value="[DefaultNullValue]" />
    <asp:Label ID="lblFileNotTransferToUof" runat="server" Text="目前檔案仍在Proxy伺服器，正由系統進行傳輸中，請稍後！" Visible="False" meta:resourcekey="lblFileNotTransferToUofResource1"></asp:Label>
    <asp:Label ID="lblAllClass" runat="server" Text="所有類別" Visible="False" meta:resourcekey="lblAllClassResource1"></asp:Label>
    <asp:HiddenField ID="hfFolderID" runat="server" />
    <asp:Label ID="labFileError" runat="server" ForeColor="Blue" Text="發生錯誤，檔案不存在！" Visible="False" meta:resourcekey="labFileErrorResource1"></asp:Label>
    <asp:Label ID="labAlert" runat="server" ForeColor="Blue" Text="正在進行檔案轉換，請稍後再觀看" Visible="False" meta:resourcekey="labAlertResource1"></asp:Label>
    <asp:Label ID="labPDFConvertERROR" runat="server" ForeColor="Blue" Text="發生錯誤，轉換失敗！" Visible="False" meta:resourcekey="labPDFConvertERRORResource1"></asp:Label>
    <asp:Label ID="lblNotsupportDoc" runat="server" Text="目錄設定為必須轉檔，但此檔案類型並不支援" ForeColor="Blue" Visible="False" meta:resourcekey="lblNotsupportDocResource1"></asp:Label>
    <asp:Label ID="lblProtectMsg" runat="server" Text="此為保全文件無法線上觀看" ForeColor="Blue" Visible="False" meta:resourcekey="lblProtectMsgResource1"></asp:Label>
    <asp:Label ID="Label7" runat="server" Text="目前檔案仍在Proxy伺服器，正由系統進行傳輸中，請稍後！" Visible="False" ForeColor="Blue" meta:resourcekey="Label7Resource1"></asp:Label>
    <asp:Label ID="lblViodError" runat="server" Text='僅有狀態為"已公佈"、"未生效"及"已失效"的文件才可作廢，因此以下文件無法作廢：' Visible="False" meta:resourcekey="lblViodErrorResource1" ></asp:Label>
    <asp:Label ID="lblDeleteError" runat="server" Text="以下文件尚有進行中的審核流程，請先完成審核作業才可銷毀文件：" Visible="False" meta:resourcekey="lblDeleteErrorResource1" ></asp:Label>
    <asp:Label ID="lblChoiceBtntxt" runat="server" Text="選取部門" Visible="False" meta:resourcekey="lblChoiceBtntxtResource2" ></asp:Label>
    <asp:Label ID="lblNoAuthorityError" runat="server" Visible="False" Text="僅有管理者權限的文件才可維護，因此以下文件無法維護：" meta:resourcekey="lblNoAuthorityErrorResource1" ></asp:Label>
    <asp:Label ID="lblSelectDoc" runat="server" Text="請選取文件" Visible ="False" meta:resourcekey="lblSelectDocResource1"></asp:Label>
    <asp:Label ID="lblTornadoTab" runat="server" Text="搜尋" Visible="False" meta:resourcekey="lblTornadoTabResource1"></asp:Label>
    <asp:Label ID="lblTornadoSearchBtn" runat="server" Text="確定" Visible="False" meta:resourcekey="lblTornadoSearchBtnResource1"></asp:Label>
    <asp:Label ID="lblTornadoTitle" runat="server"  Style="text-wrap: none" Text="●本文內容、檔名、摘要、文件編號、保管者、其他自訂屬性:" Visible="False" meta:resourcekey="lblTornadoTitleResource1"></asp:Label>
    <asp:HiddenField ID="hfUserGuid" runat="server" />
    <asp:Label ID="lblFilePageOutLimitMsg" runat="server" Text="檔案頁數{0}頁，超過可轉檔上限。" Visible="false" meta:resourcekey="lblFilePageOutLimitMsgResource1"></asp:Label>
    <asp:Label ID="lblFileHasPassword" runat="server" Text="原始檔案有設定密碼，無法轉檔" Visible="false" meta:resourcekey="lblFileHasPasswordResource1"></asp:Label>
    <asp:Label ID="lblDocSerial" runat="server" Text="文件編號：" Visible="false" meta:resourcekey="lblDocSerialResource1"></asp:Label>
    <asp:Label ID="lblManualVersion" runat="server" Text="版本：" Visible="false" meta:resourcekey="lblManualVersionResource1"></asp:Label>
    <asp:Label ID="lblPrintUser" runat="server" Text="列印者：" Visible="false" meta:resourcekey="lblPrintUserResource1"></asp:Label>
    
    <asp:HiddenField ID="hfTmpFolderId" runat="server" />
    <asp:HiddenField ID="hfTmpIsEnablePDFViewer" runat="server" />

    <a id="atag" style="display:none;">Run UDoc Viewer</a>
</asp:Content>
