<%@ Page Title="" Language="C#" MasterPageFile="~/Master/TwoColumn.master" AutoEventWireup="true" Inherits="DMS_DocStore_Default" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" Codebehind="Default.aspx.cs" %>

<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register Src="UC_DMSDoc.ascx" TagName="UC_DMSDoc" TagPrefix="uc1" %>
<%@ Register Src="~/Common/ChoiceCenter/UC_ChoiceList.ascx" TagPrefix="uc1" TagName="UC_ChoiceList" %>

<asp:Content ID="Content4" ContentPlaceHolderID="ScriptContentPlaceHolder" runat="Server">
    <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server" OnAjaxRequest="RadAjaxManager1_AjaxRequest" meta:resourcekey="RadAjaxManager1Resource1">
        <AjaxSettings>
            <telerik:AjaxSetting AjaxControlID="RadAjaxManager1">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="barMain" UpdatePanelCssClass="" UpdatePanelHeight="100%" />

                    <telerik:AjaxUpdatedControl ControlID="panContent" UpdatePanelHeight="100%" UpdatePanelRenderMode="Inline" />
                </UpdatedControls>
            </telerik:AjaxSetting>
            <telerik:AjaxSetting AjaxControlID="treeFolder">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="barMain" UpdatePanelCssClass="" UpdatePanelHeight="100%" />
                    <telerik:AjaxUpdatedControl ControlID="panContent" UpdatePanelCssClass="" UpdatePanelHeight="100%" />
                </UpdatedControls>
            </telerik:AjaxSetting>
            <telerik:AjaxSetting AjaxControlID="treeClass">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="panContent" UpdatePanelCssClass="" UpdatePanelHeight="100%" UpdatePanelRenderMode="Inline" />
                </UpdatedControls>
            </telerik:AjaxSetting>
            <telerik:AjaxSetting AjaxControlID="treeAuthor">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="panContent" UpdatePanelCssClass="" UpdatePanelHeight="100%" UpdatePanelRenderMode="Inline" />
                </UpdatedControls>
            </telerik:AjaxSetting>
            <telerik:AjaxSetting AjaxControlID="rbFind">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="panContent" UpdatePanelCssClass="" UpdatePanelHeight="100%" UpdatePanelRenderMode="Inline" />
                </UpdatedControls>
            </telerik:AjaxSetting>
            <telerik:AjaxSetting AjaxControlID="btnSearch">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="barMain" />
                    <telerik:AjaxUpdatedControl ControlID="panContent" UpdatePanelCssClass="" UpdatePanelHeight="100%" UpdatePanelRenderMode="Inline" />
                </UpdatedControls>
            </telerik:AjaxSetting>
            <telerik:AjaxSetting AjaxControlID="barMain">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="treeFolder" />
                    <telerik:AjaxUpdatedControl ControlID="panContent" UpdatePanelCssClass="" UpdatePanelHeight="100%" UpdatePanelRenderMode="Inline" />
                </UpdatedControls>
            </telerik:AjaxSetting>
        </AjaxSettings>
    </telerik:RadAjaxManager>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="ToolbarContentPlaceHolder" runat="Server">
    <telerik:RadCodeBlock ID="RadCodeBlock1" runat="server">
        <script>
            Sys.Application.add_load(function () {
                var docid = $uof.tool.htmlDecode("<%=System.Web.Security.AntiXss.AntiXssEncoder.HtmlEncode(Request.QueryString["docid"], true)%>");
                var manualver = $uof.tool.htmlDecode($("#<%=hfManualver.ClientID%>").val());
                var approvetype = $uof.tool.htmlDecode("<%=System.Web.Security.AntiXss.AntiXssEncoder.HtmlEncode(Request.QueryString["approvetype"], true)%>");
                var folderAuthority = $("#<%= hidFolderAuthority.ClientID%>");
                var isNoData = $("#<%= hidIsNoData.ClientID%>");
                var linktype = $uof.tool.htmlDecode("<%=System.Web.Security.AntiXss.AntiXssEncoder.HtmlEncode(Request.QueryString["linktype"], true)%>");//表單連結類型
                if (folderAuthority.val() == "DMSNone")
                    return;

                //由表單或表單簽核訊息連結導頁過來
                if (approvetype == "wkf") {
                    if (isNoData.val() === "True")
                        return;

                    if ($('#<%=HiddenFieldPostBack.ClientID%>').val() != 'True') return;
                    $('#<%=HiddenFieldPostBack.ClientID%>').val('False');

                    var taskid = $uof.tool.htmlDecode("<%=System.Web.Security.AntiXss.AntiXssEncoder.HtmlEncode(Request.QueryString["taskid"], true)%>");
                    var flow = $uof.tool.htmlDecode("<%=System.Web.Security.AntiXss.AntiXssEncoder.HtmlEncode(Request.QueryString["flow"], true)%>");
                    var data = [docid, manualver];
                    var wkfDocStatus = $uof.pageMethod.sync("GetWkfDocStatus", data);
                    var wkfActiveStatus = $uof.pageMethod.sync("GetWkfActiveStatus", data);
                    //文件已是下架, 作廢, 失效狀態, 不可觀看
                    if (wkfDocStatus == "TempInact" || wkfDocStatus == "Void" || wkfActiveStatus == "Invalid") {
                        alert('<%= lblDocInvalid.Text %>');
                        window.close();
                        return;
                    }

                    //判斷是文件連結或文件資訊
                    if (linktype == "doc") {
                        var docmode = "<%=System.Web.Security.AntiXss.AntiXssEncoder.HtmlEncode(Request.QueryString["docmode"], true)%>";
                        /*因公佈、作廢表單的文件連結(訊息連結)參數沒有 status 跟 flow，
                          直接用docid 跟 manualver取得目前文件的status，
                          如flow != LEND，代表連結是從公佈、作廢表單來的，
                          再由status判斷flow，
                          如status = Approval，表單為公佈申請單flow = PUBLISH，
                          如status = Publish，表單為作廢申請單flow = VOID*/

                        var docIsVoid = $uof.pageMethod.sync("GetDocVoidStatus", data);

                        //wkfDocStatus = [(Publish&&IS_VOID = 0), CheckOut, CheckIn], 就alert訊息, return
                        /*公佈文件連結：如狀態為取出或存回時，秀出先送表單的提示訊息*/
                        /*作廢文件連結：如狀態為公佈且is void=0、task id = null時，秀出先送表單的提示訊息*/
                        if (wkfDocStatus == "CheckOut" || wkfDocStatus == "CheckIn" || (wkfDocStatus == "Publish" && docIsVoid == "false" && (taskid == null || taskid == ""))) {
                            alert('<%= lblFormErrorMsg.Text %>');
                            window.close();
                            return;
                        }

                        if (flow != "LEND") {
                            flow = "VOID";
                            if (wkfDocStatus == "Approval")
                                flow = "PUBLISH";
                        }
                        //本文或檔案模式
                        if ($uof.tool.htmlDecode(docmode) == "CONT")
                            $uof.dialog.open2('~/DMS/DocStore/DocWKFPrivilegeDL.aspx', '', '', 0, 0, function (returnValue) { return true; }, { 'docid': docid, 'status': wkfDocStatus, 'flow': flow, 'ver': manualver, 'taskid': taskid });
                        else
                            $uof.dialog.open2('~/DMS/DocStore/DocWKFPrivilegeDL.aspx', '', '', 700, 550, function (returnValue) { return true; }, { 'docid': docid, 'status': wkfDocStatus, 'flow': flow, 'ver': manualver, 'taskid': taskid });
                    }
                    else if (linktype == "info") {
                        $uof.dialog.open2('~/DMS/DocStore/DocInform.aspx', '', '', 900, 900, function (returnValue) { return true; }, { 'docid': docid, 'ver': manualver, 'taskid': taskid });
                    }
                }
                else if (docid != null && docid != "") {
                    if ($('#<%=HiddenFieldPostBack.ClientID%>').val() != 'True') return;
                    $('#<%=HiddenFieldPostBack.ClientID%>').val('False');

                    //文件審核否決 messageLink 開啟文件資訊
                    if (linktype == "info") {
                        $uof.dialog.open2('~/DMS/DocStore/DocInform.aspx', '', '', 900, 900, function (returnValue) { return true; }, { 'docid': docid });
                    }
                    else {
                        var data = [docid, manualver];
                        var wkfDocCurrentStatus = $uof.pageMethod.sync("GetWkfDocStatus", data);
                        var wkfDocCurrentActiveStatus = $uof.pageMethod.sync("GetWkfActiveStatus", data);
                        //文件已是下架, 作廢, 失效狀態, 不可觀看
                        if (wkfDocCurrentStatus == "TempInact" || wkfDocCurrentStatus == "Void" || wkfDocCurrentActiveStatus == "Invalid") {
                            alert('<%= lblDocInvalid.Text %>');
                            window.close();
                            return;
                        }

                        result = $uof.pageMethod.sync("OpenDocdownload", data);
                        if (result == "url1")
                            $uof.dialog.open2('~/DMS/DocStore/DocLend/DocLendAccept.aspx', '', '', 700, 480, OpenDialogResult, { 'docid': docid, 'status': 'Publish' });
                        else if (result == "url2")
                            $uof.dialog.open2('~/DMS/DocStore/DocLend/DocLendAccept.aspx', '', '', 0, 0, OpenDialogResult, { 'docid': docid, 'status': 'Publish' });
                        else if (result == "url3")
                            $uof.dialog.open2('~/DMS/DocStore/DocDownLoad.aspx', '', '', 700, 550, OpenDialogResult, { 'docid': docid, 'status': 'Publish', 'manualver': manualver });
                        else if (result == "url4")
                            $uof.dialog.open2('~/DMS/DocStore/DocDownLoad.aspx', '', '', 0, 0, OpenDialogResult, { 'docid': docid, 'status': 'Publish', 'manualver': manualver });
                        else if (result == "NoLend")
                            alert('<%= lblNoLend.Text %>');
                        else if (result == "NoDL")
                            alert('<%= lblNoDL.Text %>');
                        else
                            alert('<%= lblDocNotFind.Text %>');
                    }
                }
            });
            function OnBarMainClicking(sender, args) {
                var oButton = args.get_item();
                oButton.Key = oButton.get_value();

                var treeFolder = $find("<%=TreeFolder.ClientID%>");
                var currentSelNode = treeFolder.get_selectedNode().get_value();


                // 目錄資訊
                if (oButton.Key == "DirInfo") {
                    args.set_cancel(true);
                    $uof.dialog.open2("~/DMS/DocStore/DirInfo.aspx", args.get_item(), "", 800, 500, OpenDialogResult, { "folderid": currentSelNode });

                } else if (oButton.Key == "AddNewFolder") { // 新增子目錄
                    //先展開目錄再新增
                    var tree = $find('<%=treeFolder.ClientID%>');
                    var parentNode = tree.get_selectedNode();
                    parentNode.expand();

                    args.set_cancel(true);
                    $uof.dialog.open2("~/DMS/DocStore/AddNewFolder.aspx", args.get_item(), "", 700, 580, OpenDialogResult, { "folderid": currentSelNode });

                } else if (oButton.Key == "FolderRename") { // 目錄重新命名		
                    args.set_cancel(true);
                    $uof.dialog.open2("~/DMS/DocStore/RenameFolder.aspx", args.get_item(), "", 600, 300, OpenDialogResult, { "folderid": currentSelNode });

                } else if (oButton.Key == "DelFolder") { // 刪除目錄	

                    var ajaxManager = $find("<%= RadAjaxManager1.ClientID %>");
                    var tree = $find('<%=treeFolder.ClientID%>');
                    var node = tree.get_selectedNode();
                    ajaxManager.ajaxRequest(JSON.stringify({ "Key": "FolderCheck", "Value": node.get_value() }));

                    args.set_cancel(true);

                } else if (oButton.Key == "AddNewDoc") { // 新增檔案 David 2012/09/26 修改 新增doctype參數判斷為檔案文件或本文文件
                    args.set_cancel(true);
                    var doctype = 'file';
                    $uof.dialog.open2("~/DMS/DocStore/AddNewDoc.aspx", args.get_item(), "", 1024, 900,
                        function (returnValue) {
                            if (returnValue == "ok") { return true; }
                            return false;
                        }
                        , { "folderid": currentSelNode, "doctype": doctype });
                }
                else if (oButton.Key == "AddNewContentDoc") {//新增本文 David 2012/09/26 Add 新增doctype參數判斷為檔案文件或本文文件
                    args.set_cancel(true);
                    var doctype = 'content';
                    $uof.dialog.open2("~/DMS/DocStore/AddNewDoc.aspx", args.get_item(), "", 1024, 900,
                        function (returnValue) {
                            if (returnValue == "ok") { return true; }
                            else if (returnValue == "NeedPostBack") { return true; }
                            return false;
                        }
                        , { "folderid": currentSelNode, "doctype": doctype });
                }
                else if (oButton.Key == "DirSubscribe") { // 目錄訂閱
                    args.set_cancel(true);
                    $uof.dialog.open2("~/DMS/DocStore/SubscribeFolder.aspx", args.get_item(), "", 500, 500, OpenDialogResult, { "folderid": currentSelNode });

                }
                else if (oButton.Key == "FolderSecurity") { // 文件安全性設定
                    args.set_cancel(true);
                    $uof.dialog.open2("~/DMS/DocStore/FolderSecurity.aspx", args.get_item(), "", 1024, 768,
                        function (returnValue) {
                            if (returnValue == "ok") {
                                CheckDocMode(currentSelNode);

                            }
                            else if (returnValue == "NeedPostBack") {
                                return true;
                            }
                            return false;
                        }, { "folderid": currentSelNode });
                } else if (oButton.Key == "CopyFolderLink") { //目錄連結複製
                    args.set_cancel(true);
                    var Url = '<%=setting["SiteUrl"].ToString()%>' + "/DMS/DocStore/Default.aspx?folderid=" + currentSelNode;
                    var Type = 'folder';

                    $uof.dialog.open2("~/DMS/DocStore/DocUrlCopy.aspx", args.get_item(), "", 600, 200,
                        function (returnValue) {
                            return false;
                        }
                        , { "type": Type, "url": Url });

                } else if (oButton.Key == "AddFavorites") { //收藏目錄 2012/04/10 Add by Taylor

                    if (window.confirm('<%=lblConfirmAdd.Text  %>')) {
                        var data = [currentSelNode];
                        var result = $uof.pageMethod.sync("AddFavorites", data);
                        if (result == "true") {
                            alert('<%= lblSuccessAdd.Text %>');
                        }
                    }
                    if (typeof (FastReutrnValue) == 'undefined' || FastReutrnValue == null) {
                        args.set_cancel(true);
                    }
                } else if (oButton.Key == "UDocViewerDL") { //UDoc Viewer下載
                    window.open("https://www.edetw.com/office/UDocViewerSSL.zip", "_parent");
                }
                //2012/09/28 David aded 判斷目錄的文件模式
            }

            function OpenDialogResult(returnValue) {
                if (typeof (returnValue) == 'undefined' || returnValue == null)
                    return false;
                else
                    return true;
            }

            function RadTabStrip1_TabSelected(sender, eventArgs) {
                var tab = eventArgs.get_tab();
                var tabValue = tab.get_value();

                var ajaxManager = $find("<%= RadAjaxManager1.ClientID %>");
                ajaxManager.ajaxRequest(JSON.stringify({ "Key": "TabChange", "Value": tabValue }));
            }

            function CheckDocMode(folderID) {
                //2012/09/28 David added 判斷目錄的文件模式
                var data = [folderID];
                var docMode = $uof.pageMethod.sync("GetFolderDocMode", data);

                var toolbar = $find("<%=barMain.ClientID%>");
                var AddNewDoc = toolbar.findItemByValue("AddNewDoc");
                var AddNewContentDoc = toolbar.findItemByValue("AddNewContentDoc");

                if (docMode == 'FILE') {
                    AddNewDoc.set_enabled(true);
                    AddNewContentDoc.set_enabled(false);
                }
                else if (docMode == 'CONT') {
                    AddNewDoc.set_enabled(false);
                    AddNewContentDoc.set_enabled(true);
                }
                else if (docMode == 'BOTH') {
                    AddNewDoc.set_enabled(true);
                    AddNewContentDoc.set_enabled(true);
                }
            }

            function nodeFolderRename(newFolderName) {
                var tree = $find('<%=treeFolder.ClientID%>');
                var node = tree.get_selectedNode();
                if (node != null) {
                    tree.trackChanges();
                    node.set_text('');
                    node.set_text(newFolderName);                   
                    tree.commitChanges();                  
                  
                    $('#<%=UC_DMSDoc1.FindControl("labFolderName").ClientID%>').text($uof.tool.htmlDecode(newFolderName));
                    
                    var ajaxManager = $find("<%= RadAjaxManager1.ClientID %>");
                    ajaxManager.ajaxRequest(JSON.stringify({ "Key": "FolderRename", "Value": node.get_value() }));
                }
            }

            function nodeAddFolder(newFolderName, newFolderGUID) {
                var tree = $find('<%=treeFolder.ClientID%>');
                var parentNode = tree.get_selectedNode();
                if (parentNode != null) {
                    tree.trackChanges();
                   
                    var node = new Telerik.Web.UI.RadTreeNode();
                    node.set_value(newFolderGUID);
                    node.set_text($uof.tool.htmlDecode(newFolderName));                   
                    node.set_imageUrl('<%=TreeFolderImageUrl%>');
                    node.set_expandedImageUrl('<%=TreeFolderExpandedImageUrl%>');
                    parentNode.get_nodes().insert(parentNode.get_nodes().get_count(), node);
                    tree.commitChanges();
                    node.select();

                    $("#<%=hfFolderID.ClientID %>").val(newFolderGUID);
                }
            }

            // 移除tree node
            function nodeRemoveConfirm(folderId, confirmText) {
                if (confirm(confirmText)) {
                    var ajaxManager = $find("<%= RadAjaxManager1.ClientID %>");

                    ajaxManager.ajaxRequest(JSON.stringify({ "Key": "FolderRemove", "Value": folderId }));
                }
                
            }

            function nodeRemove(folderId) {
                var tree = $find("<%= treeFolder.ClientID %>");
                var node = tree.findNodeByValue(folderId);
                var parentNode = node.get_parent();
                tree.trackChanges();
                parentNode.get_nodes().remove(node);
                parentNode.select();
                tree.commitChanges();

                var ajaxManager = $find("<%= RadAjaxManager1.ClientID %>");
                ajaxManager.ajaxRequest(JSON.stringify({ "Key": "FolderClick", "Value": parentNode.get_value() }));

            }

            function OntreeFoldertNodeClicking(sender, args) {
                var oldFolderid = $("#<%=hfFolderID.ClientID %>").val();

                $("#<%=hfFolderID.ClientID %>").val(args.get_node().get_value());
                var newFolderid = $("#<%=hfFolderID.ClientID %>").val();
                if (oldFolderid == newFolderid) {
                    args.set_cancel(true);
                }
            }

            function OntreeClassNodeClicked(sender, args) {
                var oldclassid = $("#<%=hfClassID.ClientID %>").val();

                $("#<%=hfClassID.ClientID %>").val(args.get_node().get_value());
                var newclassid = $("#<%=hfClassID.ClientID %>").val();
                if (oldclassid != newclassid) {
                    var ajaxManager = $find("<%= RadAjaxManager1.ClientID %>");
                    ajaxManager.ajaxRequest(JSON.stringify({ "Key": "ClassClick", "Value": newclassid }));
                }
            }

            function NoDelFolderAuth() {
                $uof.dialog.set_returnValue('NeedPostBack');
                alert('<%= lblNoDelFolderAuth.Text %>');
            }
        </script>
    </telerik:RadCodeBlock>
    <telerik:RadToolBar ID="barMain" runat="server" Width="100%" OnClientButtonClicking="OnBarMainClicking" meta:resourcekey="barMainResource1" OnButtonClick="barMain_ButtonClick" SingleClick="None">
        <Items>
            <telerik:RadToolBarButton runat="server" Enabled="False" CheckedImageUrl="~/Common/Images/Icon/icon_m120.png" DisabledImageUrl="~/Common/Images/Icon/icon_m120.png" HoveredImageUrl="~/Common/Images/Icon/icon_m120.png" ImageUrl="~/Common/Images/Icon/icon_m120.png" Text="目錄資訊" ToolTip="目錄資訊" Value="DirInfo" meta:resourcekey="RadToolBarButtonResource1">
            </telerik:RadToolBarButton>
            <telerik:RadToolBarButton runat="server" IsSeparator="True" Value="sDirInfo" meta:resourcekey="RadToolBarButtonResource2" />
            <telerik:RadToolBarButton runat="server" Enabled="False" CheckedImageUrl="~/Common/Images/Icon/icon_m123.png" DisabledImageUrl="~/Common/Images/Icon/icon_m123.png" HoveredImageUrl="~/Common/Images/Icon/icon_m123.png" ImageUrl="~/Common/Images/Icon/icon_m123.png" Text="目錄安全" ToolTip="目錄安全性" Value="FolderSecurity" meta:resourcekey="RadToolBarButtonResource3">
            </telerik:RadToolBarButton>
            <telerik:RadToolBarButton runat="server" IsSeparator="True" Value="sFolderSecurity" meta:resourcekey="RadToolBarButtonResource4" />
            <telerik:RadToolBarButton runat="server" Enabled="False" CheckedImageUrl="~/Common/Images/Icon/icon_m121.png" DisabledImageUrl="~/Common/Images/Icon/icon_m121.png" HoveredImageUrl="~/Common/Images/Icon/icon_m121.png" ImageUrl="~/Common/Images/Icon/icon_m121.png" Text="新增目錄" ToolTip="新增子目錄" Value="AddNewFolder" meta:resourcekey="RadToolBarButtonResource7">
            </telerik:RadToolBarButton>
            <telerik:RadToolBarButton runat="server" IsSeparator="True" Value="sAddNewFolder" meta:resourcekey="RadToolBarButtonResource8" />
            <telerik:RadToolBarButton runat="server" Enabled="False" CheckedImageUrl="~/Common/Images/Icon/icon_m03.png" DisabledImageUrl="~/Common/Images/Icon/icon_m03.png" HoveredImageUrl="~/Common/Images/Icon/icon_m03.png" ImageUrl="~/Common/Images/Icon/icon_m03.png" Text="刪除目錄" ToolTip="刪除目錄" Value="DelFolder" meta:resourcekey="RadToolBarButtonResource9">
            </telerik:RadToolBarButton>
            <telerik:RadToolBarButton runat="server" IsSeparator="True" Value="sDelFolder" meta:resourcekey="RadToolBarButtonResource10" />
            <telerik:RadToolBarButton runat="server" Enabled="False" CheckedImageUrl="~/Common/Images/Icon/icon_m122.png" DisabledImageUrl="~/Common/Images/Icon/icon_m122.png" HoveredImageUrl="~/Common/Images/Icon/icon_m122.png" ImageUrl="~/Common/Images/Icon/icon_m122.png" Text="重新命名" ToolTip="目錄重新命名" Value="FolderRename" meta:resourcekey="RadToolBarButtonResource11">
            </telerik:RadToolBarButton>
            <telerik:RadToolBarButton runat="server" IsSeparator="True" Value="sFolderRename" meta:resourcekey="RadToolBarButtonResource12" />
            <telerik:RadToolBarButton runat="server" Enabled="False" CheckedImageUrl="~/Common/Images/Icon/icon_m71.png" DisabledImageUrl="~/Common/Images/Icon/icon_m71.png" HoveredImageUrl="~/Common/Images/Icon/icon_m71.png" ImageUrl="~/Common/Images/Icon/icon_m71.png" Text="新增檔案" ToolTip="新增檔案" Value="AddNewDoc" meta:resourcekey="RadToolBarButtonResource13">
            </telerik:RadToolBarButton>
            <telerik:RadToolBarButton runat="server" IsSeparator="True" Value="sAddNewDoc" meta:resourcekey="RadToolBarButtonResource14" />
            <telerik:RadToolBarButton runat="server" Enabled="False" CheckedImageUrl="~/Common/Images/Icon/icon_m187.gif" DisabledImageUrl="~/Common/Images/Icon/icon_m187.gif" HoveredImageUrl="~/Common/Images/Icon/icon_m187.gif" ImageUrl="~/Common/Images/Icon/icon_m187.gif" Text="新增本文" ToolTip="新增本文" Value="AddNewContentDoc" meta:resourcekey="AddNewContentDoc_RadToolBarButtonResource13">
            </telerik:RadToolBarButton>
            <telerik:RadToolBarButton runat="server" IsSeparator="True" Value="sAddNewContentDoc" meta:resourcekey="RadToolBarButtonResource14" />
            <telerik:RadToolBarButton runat="server" Enabled="False" CheckedImageUrl="~/Common/Images/Icon/icon_m194.png" DisabledImageUrl="~/Common/Images/Icon/icon_m194.png" HoveredImageUrl="~/Common/Images/Icon/icon_m194.png" ImageUrl="~/Common/Images/Icon/icon_m194.png" Text="訂閱" Value="DirSubscribe" ToolTip="訂閱目錄" meta:resourcekey="RadToolBarButtonResource5">
            </telerik:RadToolBarButton>
            <telerik:RadToolBarButton runat="server" IsSeparator="True" Value="sDirSubscribe" meta:resourcekey="RadToolBarButtonResource6" />
            <telerik:RadToolBarButton runat="server" Enabled="False" CheckedImageUrl="~/Common/Images/Icon/icon_m71.png" DisabledImageUrl="~/Common/Images/Icon/icon_m71.png" HoveredImageUrl="~/Common/Images/Icon/icon_m71.png" ImageUrl="~/Common/Images/Icon/icon_m71.png" Text="目錄連結" ToolTip="複製目錄連結" Value="CopyFolderLink" meta:resourcekey="RadToolBarButtonResource15">
            </telerik:RadToolBarButton>
            <telerik:RadToolBarButton runat="server" IsSeparator="True" Value="sCopyFolderLink" meta:resourcekey="RadToolBarButtonResource16" />
            <telerik:RadToolBarButton runat="server" Enabled="False" CheckedImageUrl="~/Common/Images/Icon/icon_m194.png" DisabledImageUrl="~/Common/Images/Icon/icon_m194.png" HoveredImageUrl="~/Common/Images/Icon/icon_m194.png" ImageUrl="~/Common/Images/Icon/icon_m194.png" Text="收藏目錄" ToolTip="收藏目錄" Value="AddFavorites" meta:resourcekey="RadToolBarButtonResource17">
            </telerik:RadToolBarButton>
            <telerik:RadToolBarButton runat="server" IsSeparator="True" Value="sAddFavorites" meta:resourcekey="RadToolBarButtonResource18" />
            <telerik:RadToolBarButton runat="server" Enabled="True" CheckedImageUrl="~/Common/Images/Icon/icon_m226.png" DisabledImageUrl="~/Common/Images/Icon/icon_m226.png" HoveredImageUrl="~/Common/Images/Icon/icon_m226.png" ImageUrl="~/Common/Images/Icon/icon_m226.png" Text="UDoc Viewer下載" ToolTip="被設定為UDoc Viewer的使用人員，需完成下載及安裝作業始可線上觀看文件" Value="UDocViewerDL" meta:resourcekey="UDocViewerDLRadToolBarButtonResource1">
            </telerik:RadToolBarButton>
            <telerik:RadToolBarButton runat="server" IsSeparator="True" Value="sUDocViewerDL" meta:resourcekey="sUDocViewerDLRadToolBarButtonResource1" />
        </Items>
    </telerik:RadToolBar>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="LeftContentPlaceHolder" runat="Server">
    <telerik:RadTabStrip ID="RadTabStrip1" runat="server" SelectedIndex="0"
        MultiPageID="RadMultiPage1" OnClientTabSelected="RadTabStrip1_TabSelected"
        Width="100%" meta:resourcekey="RadTabStrip1Resource1">
        <Tabs>
            <telerik:RadTab runat="server" Text="目錄" Value="folder" Selected="True" meta:resourcekey="RadTabResource1">
            </telerik:RadTab>
            <telerik:RadTab runat="server" Text="類別" Value="Class" meta:resourcekey="RadTabResource2">
            </telerik:RadTab>
            <telerik:RadTab runat="server" Text="作者" Value="Author" meta:resourcekey="RadTabResource3">
            </telerik:RadTab>
            <telerik:RadTab runat="server" Text="全文檢索" Value="Search" meta:resourcekey="RadTabResource4">
            </telerik:RadTab>
            <telerik:RadTab runat="server" Text="常用文件" Value="CommonList" meta:resourcekey="RadTabResource5">
            </telerik:RadTab>
        </Tabs>
    </telerik:RadTabStrip>
    <telerik:RadMultiPage ID="RadMultiPage1" runat="server" SelectedIndex="0" meta:resourcekey="RadMultiPage1Resource1">
        <telerik:RadPageView ID="RadPageView1" runat="server" meta:resourcekey="RadPageView1Resource1" Selected="True">
            <telerik:RadTreeView ID="treeFolder" runat="server" ShowLineImages="False" Skin="Metro" EnableNodeTextHtmlEncoding="true"
                 OnClientNodeClicking="OntreeFoldertNodeClicking" OnNodeExpand="treeFolder_NodeExpand" OnNodeClick="treeFolder_NodeClick" meta:resourcekey="treeFolderResource1">
            </telerik:RadTreeView>
        </telerik:RadPageView>
        <telerik:RadPageView ID="RadPageView2" runat="server" meta:resourcekey="RadPageView2Resource1">
            <asp:UpdatePanel runat="server" ID="upClassPanel">
                <ContentTemplate>
                    <telerik:RadTreeView ID="treeClass" runat="server" ShowLineImages="False" Skin="Metro" EnableNodeTextHtmlEncoding="true"
                        OnClientNodeClicked="OntreeClassNodeClicked" meta:resourcekey="treeClassResource1">
                    </telerik:RadTreeView>
                </ContentTemplate>
            </asp:UpdatePanel>
        </telerik:RadPageView>
        <telerik:RadPageView ID="RadPageView3" runat="server" meta:resourcekey="RadPageView3Resource1">
            <asp:UpdatePanel runat="server" ID="upAuthoPanel">
                <ContentTemplate>
                    <asp:Label ID="lblKeyword" runat="server" Text="關鍵字" meta:resourcekey="lblKeywordResource1"></asp:Label>
                    <asp:TextBox ID="txtKeyword" runat="server"></asp:TextBox>            
                    <telerik:RadButton ID="rbFind" runat="server" Text="查詢" OnClick="rbFind_Click" meta:resourcekey="rbFindResource1"></telerik:RadButton>     
                     <telerik:RadTreeView ID="treeAuthor" runat="server" ShowLineImages="False" Skin="Metro" EnableNodeTextHtmlEncoding="true"
                        OnNodeClick="treeAuthor_NodeClick" meta:resourcekey="treeAuthorResource1">
                    </telerik:RadTreeView>
                </ContentTemplate>
            </asp:UpdatePanel>
        </telerik:RadPageView>
        <telerik:RadPageView ID="RadPageView4" runat="server" meta:resourcekey="RadPageView4Resource1">
            <table border="0" cellspacing="1px" style="width: 100%; border-collapse: separate; margin-left: 5px;">
                <tr>
                    <td style="width: 100%">
                        <telerik:RadButton ID="btnSearch" runat="server" ButtonType="LinkButton" OnClick="btnSearch_Click" Text="搜尋" ValidationGroup="keyword" Width="100px" meta:resourcekey="btnSearchResource1">
                            <Icon PrimaryIconUrl="~/DMS/images/zoom.gif" PrimaryIconLeft="2px" />
                        </telerik:RadButton>
                    </td>
                </tr>
                <tr>
                    <td style="width: 100%">
                        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        <ContentTemplate>
                        
                        <div>
                            <table>
                                <tr>
                                    <td style="word-break:break-all;width:280px;">
                                        <asp:Label ID="Label1" runat="server" Text="●內容、檔名、作者、摘要、文件編號、保管者、其他自訂屬性:" meta:resourcekey="Label1Resource1"></asp:Label>
                                    </td>
                                </tr>
                            </table>
                            <div style="margin-left: 10px;">
                                <telerik:RadTextBox ID="txtSearch" runat="server" MaxLength="50" ValidationGroup="keyword" Width="152px" LabelCssClass="" LabelWidth="64px" meta:resourcekey="txtSearchResource1" Resize="None">
                                    <EmptyMessageStyle Resize="None" />
                                    <ReadOnlyStyle Resize="None" />
                                    <FocusedStyle Resize="None" />
                                    <DisabledStyle Resize="None" />
                                    <InvalidStyle Resize="None" />
                                    <HoveredStyle Resize="None" />
                                    <EnabledStyle Resize="None" />
                                </telerik:RadTextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtSearch" Display="Dynamic" ErrorMessage="請輸入關鍵字" ValidationGroup="keyword" meta:resourcekey="RequiredFieldValidator1Resource1"></asp:RequiredFieldValidator>
                            </div>
                        </div>
                        <div>
                            <asp:Label ID="Label7" runat="server" Text="●發行單位:" meta:resourcekey="Label7Resource1" ></asp:Label>
                            <table>
                                <tr>
                                    <td>
                                        <uc1:UC_ChoiceList runat="server"  ID="choicePublishUnit" ChioceType="Group" ShowMember="false" ExpandToUser="false" />
                                        <asp:CustomValidator ID="validPublishUnit" runat="server" Display="Dynamic" ErrorMessage="只能選擇一個部門" meta:resourcekey="validPublishUnitResource1" ></asp:CustomValidator>
                                    </td>
                                </tr>
                            </table>
                        </div>
                        <asp:Label ID="Label3" runat="server" Text="●公佈日:" meta:resourcekey="Label3Resource1"></asp:Label>
                        <div style="margin-left: 4px;">
                            <table border="0" cellpadding="1" cellspacing="1" style="margin-left: 5px;">
                                <tr>
                                    <td>
                                        <asp:Label ID="Label5" runat="server" Text="從" meta:resourcekey="Label5Resource1"></asp:Label></td>
                                    <td>
                                        <telerik:RadDatePicker ID="dateStart" runat="server"  meta:resourcekey="dateStartResource1">
                                            <Calendar EnableWeekends="True" UseColumnHeadersAsSelectors="False" UseRowHeadersAsSelectors="False">
                                            </Calendar>
                                            <DateInput DateFormat="yyyy/M/d" DisplayDateFormat="yyyy/M/d" LabelWidth="64px" Width="">
                                                <EmptyMessageStyle Resize="None" />
                                                <ReadOnlyStyle Resize="None" />
                                                <FocusedStyle Resize="None" />
                                                <DisabledStyle Resize="None" />
                                                <InvalidStyle Resize="None" />
                                                <HoveredStyle Resize="None" />
                                                <EnabledStyle Resize="None" />
                                            </DateInput>
                                            <DatePopupButton CssClass="" HoverImageUrl="" ImageUrl="" />
                                        </telerik:RadDatePicker>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="Label6" runat="server" Text="到" meta:resourcekey="Label6Resource1"></asp:Label></td>
                                    <td>
                                        <telerik:RadDatePicker ID="dateEnd" runat="server"  meta:resourcekey="dateEndResource1">
                                            <Calendar EnableWeekends="True" UseColumnHeadersAsSelectors="False" UseRowHeadersAsSelectors="False">
                                            </Calendar>
                                            <DateInput DateFormat="yyyy/M/d" DisplayDateFormat="yyyy/M/d" LabelWidth="64px" Width="">
                                                <EmptyMessageStyle Resize="None" />
                                                <ReadOnlyStyle Resize="None" />
                                                <FocusedStyle Resize="None" />
                                                <DisabledStyle Resize="None" />
                                                <InvalidStyle Resize="None" />
                                                <HoveredStyle Resize="None" />
                                                <EnabledStyle Resize="None" />
                                            </DateInput>
                                            <DatePopupButton CssClass="" HoverImageUrl="" ImageUrl="" />
                                        </telerik:RadDatePicker>
                                    </td>
                                </tr>
                            </table>
                        </div>
                        <asp:Label ID="Label4" runat="server" Text="●副檔名:" meta:resourcekey="Label4Resource1"></asp:Label>
                        <div style="margin-left: 10px;">                            
                            <asp:TextBox ID="txtExt" runat="server" MaxLength="8" Width="152px" meta:resourcekey="txtExtResource1"></asp:TextBox><br />
                            <asp:Label ID="Label8" runat="server" CssClass="SizeMemo" Text="例：( pdf )" meta:resourcekey="Label8Resource1"></asp:Label>                               
                        </div>
                        <asp:Label ID="Label2" runat="server" Text="●類別:" meta:resourcekey="Label2Resource1"></asp:Label><div style="margin-left: 5px;">
                            <telerik:RadTreeView ID="classSearchTree" runat="server" CheckBoxes="True" CheckChildNodes="True" EnableNodeTextHtmlEncoding="true" ShowLineImages="False" meta:resourcekey="classSearchTreeResource1" TriStateCheckBoxes="False"></telerik:RadTreeView>
                        </div>
                        <table border="0" cellpadding="1" cellspacing="1" style="margin-left: 5px;">
                            <tr>
                                <td>
                                    <asp:Label ID="lblDocSearchStatus" runat="server" Text="●文件版本" meta:resourcekey="lblDocSearchStatusResource1"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <div style="margin-left: 5px;">
                                        <asp:RadioButtonList ID="rblDocSearchStatus" runat="server">
                                            <asp:ListItem Value="FinalVersion" Text="文件最後版本"  meta:resourcekey="ListItemResource1"></asp:ListItem>
                                            <asp:ListItem Value="allPublishVersion" Text="所有公佈的版本"  meta:resourcekey="ListItemResource2"></asp:ListItem>
                                            <asp:ListItem Value="NewPublish" Text="最新公佈版本" meta:resourcekey="NewPublishResource1"
                                                Selected="True"></asp:ListItem>
                                        </asp:RadioButtonList>
                                    </div>
                                </td>
                            </tr>
                        </table>
                        </ContentTemplate>
                        </asp:UpdatePanel>
                    </td>
                </tr>
                <tr>
                    <td></td>
                </tr>
                <tr>
                    <td></td>
                </tr>
                <tr>
                    <td>
                        <div id="divSearchClass">
                        </div>
                    </td>
                </tr>
            </table>

        </telerik:RadPageView>
        <telerik:RadPageView ID="RadPageView5" runat="server" meta:resourcekey="RadPageView5Resource1"></telerik:RadPageView>

    </telerik:RadMultiPage>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="RightContentPlaceHolder" runat="Server">

    <asp:Panel ID="panContent" runat="server" meta:resourcekey="panContentResource1">
        <uc1:UC_DMSDoc ID="UC_DMSDoc1" runat="server" />
    </asp:Panel>

    <asp:Label ID="lblAddToUseList" runat="server" Text="確定要將此文件加入常用清單?" Visible="False" Height="0px" meta:resourcekey="lblAddToUseListResource2"></asp:Label>
    <asp:Label ID="lblConfirmDelete" runat="server" Text="確定要將此目錄刪除?" Visible="False" Height="0px" meta:resourcekey="lblConfirmDeleteResource2"></asp:Label>
    <asp:Label ID="lblDeleteError" runat="server" Text="發生錯誤,無法刪除!" Visible="False" Height="0px" meta:resourcekey="lblDeleteErrorResource2"></asp:Label>
    <asp:Label ID="lblNoAuthor" runat="server" Text="無作者" Visible="False" meta:resourcekey="lblNoAuthorResource1"></asp:Label>
    <asp:Label ID="lblFolder" runat="server" Text="目錄" Visible="False" meta:resourcekey="lblFolderResource1"></asp:Label>
    <asp:Label ID="lblClass" runat="server" Text="類別" Visible="False" meta:resourcekey="lblClassResource1"></asp:Label>
    <asp:Label ID="lblAuthor" runat="server" Text="作者" Visible="False" meta:resourcekey="lblAuthorResource1"></asp:Label>
    <asp:Label ID="lblDMSRoot" runat="server" Text="文件庫" Visible="False" meta:resourcekey="lblDMSRootResource1"></asp:Label>
    <asp:Label ID="lblDMSClass" runat="server" Text="文件類別" Visible="False" meta:resourcekey="lblDMSClassResource1"></asp:Label>
    <asp:Label ID="lblAllClass" runat="server" Text="所有類別" Visible="False" meta:resourcekey="lblAllClassResource1"></asp:Label>
    <asp:Label ID="lblConfirmDelete2" runat="server" Text="此目錄有{0}個子目錄，{1}份文件" Visible="False" meta:resourcekey="lblConfirmDelete2Resource1"></asp:Label>
    <asp:Label ID="lblConfrimVaild" runat="server" Text="此目錄尚有{0}個子目錄，{1}份文件，當目錄下沒有任何文件時，才允許刪除目錄" Visible="False" meta:resourcekey="lblConfrimVaildResource1"></asp:Label>
    <asp:Label ID="lblSearch" runat="server" meta:resourcekey="lblSearchResource1" Text="全文檢索" Visible="False"></asp:Label>
    <asp:Label ID="lblCommonUse" runat="server" meta:resourcekey="lblCommonUseResource1" Text="常用文件" Visible="False"></asp:Label>
    <asp:Label ID="lblDirInfo" runat="server" Text="目錄資訊" Visible="False" meta:resourcekey="lblDirInfoResource1"></asp:Label>
    <asp:Label ID="lblDirSubscribe" runat="server" Text="訂閱" Visible="False" meta:resourcekey="lblDirSubscribeResource1"></asp:Label>
    <asp:Label ID="lblAddNewDoc" runat="server" Text="新增檔案" Visible="False" meta:resourcekey="lblAddNewDocResource1"></asp:Label>
    <asp:Label ID="lblAddNewFolder" runat="server" Text="新增子目錄" Visible="False" meta:resourcekey="lblAddNewFolderResource1"></asp:Label>
    <asp:Label ID="lblDelFolder" runat="server" Text="刪除目錄" Visible="False" meta:resourcekey="lblDelFolderResource1"></asp:Label>
    <asp:Label ID="lblFolderRename" runat="server" Text="目錄重新命名" Visible="False" meta:resourcekey="lblFolderRenameResource1"></asp:Label>
    <asp:Label ID="lblFolderPrivilege" runat="server" Text="權限設定" Visible="False" meta:resourcekey="lblFolderPrivilegeResource1"></asp:Label>
    <asp:Label ID="lblApproveFlow" runat="server" Text="審核流程" Visible="False" meta:resourcekey="lblApproveFlowResource1"></asp:Label>
    <asp:Label ID="lblLendFlow" runat="server" Text="調閱流程" Visible="False" meta:resourcekey="lblLendFlowResource1"></asp:Label>
    <asp:Label ID="lblFolderSecurity" runat="server" Text="目錄安全性" Visible="False" meta:resourcekey="lblFolderSecurityResource1"></asp:Label>
    <asp:Label ID="lblNoDL" runat="server" Text="此文件目前不可下載" Visible="False" meta:resourcekey="lblNoDLResource1"></asp:Label>
    <asp:Label ID="lblNoLend" runat="server" Text="此文件目前不允許調閱" Visible="False" meta:resourcekey="lblNoLendResource1"></asp:Label>
    <asp:Label ID="lblLend" runat="server" Text="調閱" Visible="False" meta:resourcekey="lblLendResource1"></asp:Label>
    <asp:Label ID="lblFolderCopy" runat="server" Text="目錄連結複製完成" Visible="False" meta:resourcekey="lblFolderCopyResource1"></asp:Label>
    <asp:Label ID="lblCopyFolderLink" runat="server" Text="複製目錄連結" Visible="False" meta:resourcekey="lblCopyFolderLinkResource1"></asp:Label>
    <asp:Label ID="lblSuccessAdd" runat="server" Text="已成功加入我的收藏。" Visible="False" meta:resourcekey="lblSuccessAddResource1"></asp:Label>
    <asp:Label ID="lblConfirmAdd" runat="server" Text="確定要加入收藏嗎?" Visible="False" meta:resourcekey="lblConfirmAddResource1"></asp:Label>
    <asp:Label ID="lblAddFavorites" runat="server" Text="收藏目錄" Visible="False" meta:resourcekey="lblAddFavoritesResource1"></asp:Label>
    <asp:Label ID="lblDocNotFind" runat="server" Text="文件還未上傳或已被銷毀" Visible="False" meta:resourcekey="lblDocNotFindResource1"></asp:Label>
    <asp:Label ID="lblAddNewContentDoc" runat="server" Text="新增本文" Visible="False" meta:resourcekey="lblAddNewContentDocResource1"></asp:Label>
    <asp:HiddenField ID="hfClassID" runat="server" />
    <asp:HiddenField ID="hfFolderID" runat="server" />
    <asp:HiddenField ID="HiddenFieldPostBack" runat="server" Value="True" />
    <asp:HiddenField ID="hfManualver" runat="server" />
    <asp:HiddenField ID="hfTab" runat="server" />
    <asp:HiddenField ID="hidIsNoData" runat="server" />
    <asp:HiddenField ID="hidFolderAuthority" runat="server" />
    <asp:Label ID="lblChoiceBtntxt" runat="server" Text="選取部門" Visible="False" meta:resourcekey="lblChoiceBtntxtResource2"></asp:Label>
    <asp:Label ID="lblJSONFormatErr" runat="server" Text="類別路徑格式錯誤" Visible ="False" meta:resourcekey="lblJSONFormatErrResource1"></asp:Label>
    <asp:Label ID="lblNoClassErr" runat="server" Text="無此類別" Visible ="False" meta:resourcekey="lblNoClassErrResource1"></asp:Label>
    <asp:Label ID="lblClassPathErr" runat="server" Text="類別階層錯誤" Visible="False" meta:resourcekey="lblClassPathErrResource1"></asp:Label>
    <asp:Label ID="lblNoFolderAuthority" runat="server" Text="無此目錄觀看權限" Visible="False" meta:resourcekey="lblNoFolderAuthorityResource1"></asp:Label>
    <asp:Label ID="lblFormErrorMsg" runat="server" Text="請先送出表單，再點按文件連結。" Visible="False" meta:resourcekey="lblFormErrorMsgResource1"></asp:Label>
    <asp:Label ID="lblDocInvalid" runat="server" Text="此文件已下架、失效或作廢，無法觀看或下載" Visible="False" meta:resourcekey="lblDocInvalidResource1"></asp:Label>
    <asp:Label ID="lblNoDelFolderAuth" runat="server" Text="沒有目錄管理者權限，不可刪除目錄" Visible="False" meta:resourcekey="lblNoDelFolderAuthResource1"></asp:Label>
</asp:Content>

