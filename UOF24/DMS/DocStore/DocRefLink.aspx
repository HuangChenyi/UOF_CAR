<%@ Page Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="DMS_DocStore_DocRefLink" Title="參考文件" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" Codebehind="DocRefLink.aspx.cs" %>

<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register Src="~/Common/ChoiceCenter/UC_ChoiceList.ascx" TagPrefix="uc1" TagName="UC_ChoiceList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <script type="text/jscript">
        var selTreeId;
        var arrayNodes = new Array();

        Sys.Application.add_load(
            function ()
            {
                if ($('#<%= hidPostBack.ClientID%>').val() === "First") {
                    var curwindow = $uof.dialog.getOpener();
                    var pd;
                    if (curwindow) {
                        pd = curwindow.document;
                    }
                    else if (typeof (dialogArguments) != "undefined") {
                        pd = dialogArgument.document;
                    }
                    if (pd) {
                        var temprefID = $uof.tool.htmlDecode('<%=System.Web.Security.AntiXss.AntiXssEncoder.HtmlEncode(Request.QueryString["refID"], true)%>');
                        $("#<%= hidSelectRef.ClientID %>").val($("#" + temprefID, pd).val());
                    }
                    $("#<%=btnPostBack.ClientID%>").click();
                }
            }                
        );

        function AddTreeNode(docID, encodeDocName, Sync, publishVersion) {
            var docName = $uof.tool.base64.decode(encodeDocName);
            var version = $uof.tool.base64.decode(publishVersion);
            var treeCurrent = $find("<%= docTree.ClientID %>");
            var node = treeCurrent.findNodeByValue(docID);

            if (!node) {
                treeCurrent.trackChanges();
                var newNode = new Telerik.Web.UI.RadTreeNode();

                newNode.set_value(docID);
                newNode.get_attributes().setAttribute("docName", docName);
                newNode.get_attributes().setAttribute("Version", version);
                newNode.get_attributes().setAttribute("Source", "DMSRef");  //在參考文件中加入參考，所以一律都是DMSRef


                if (Sync == "True") {
                    newNode.set_text(docName);
                    newNode.set_imageUrl("../../Common/Images/Icon/icon_m155.gif");
                }
                else {
                    newNode.set_imageUrl("../../Common/Images/Icon/icon_m156.gif");
                    newNode.set_text(docName + "[" + version + "]");

                }
                newNode.get_attributes().setAttribute("Sync", Sync);

                treeCurrent.get_nodes().add(newNode);
                treeCurrent.commitChanges();
            }
            <%--else {
                if (node.get_enabled()) {
                    var message;
                    var changeIcon = false;   //紀錄是否要更換圖示

                    //加入模式改變
                    if (node.get_attributes().getAttribute("Sync") != Sync) {
                        changeIcon = true;

                        if (Sync == "True") {
                            message = "<%= lblSyncChangeLatest.Text%>";
                        }
                        else {
                            message = "<%= lblSyncChangeVersion.Text%>";
                        }
                    }
                    else {
                        //版本改變
                        if (node.get_attributes().getAttribute("Version") != null) {
                            if (node.get_attributes().getAttribute("Version") != publishVersion) {
                                message = "<%= lblVersionUpdate.Text%>";
                                message = message.replace("{0}", node.get_text());
                                message = message.replace("{1}", publishVersion);
                            }
                            else {
                                message = "<%= lblSameSync.Text%>";
                                alert(message);
                                return;
                            }
                        }
                        else {
                            message = "<%= lblSameSync.Text%>";
                            alert(message);
                            return;
                        }
                    }

                    if (window.confirm(message)) {
                        treeCurrent.trackChanges();

                        //更新加入狀態
                        node.get_attributes().setAttribute("Sync", Sync);
                        node.get_attributes().setAttribute("Version", publishVersion);
                        //更新icon
                        if (changeIcon) {
                            if (Sync == "True") {
                                node.set_imageUrl("../../Common/Images/Icon/icon_m155.gif");
                            }
                            else {
                                node.set_imageUrl("../../Common/Images/Icon/icon_m156.gif");
                                node.set_text(docName + "[" + publishVersion + "]");

                            }
                        }

                        treeCurrent.commitChanges();

                    }
                }
                else {
                    alert("<%= lblNoUpdate.Text %>");
                    return;

                }
            }--%>
        }
        function docTreeClientNodeClicked(sender, args) {
            var node = args.get_node();
            if (node.get_enabled()) {
                // 移除
                var tree = $find("<%= docTree.ClientID %>");

                tree.trackChanges();
                node.get_parent().get_nodes().remove(node);
                //... or by ordinal position    
                //node.get_parent().get_nodes().removeAt(0);    
                //... or remove all nodes at one time
                //node.get_parent().get_nodes().clear();
                tree.commitChanges();
            }
        }

        function UpdateAllChildren(nodes, checked) {
            var i;
            var test;
            for (i = 0; i < nodes.get_count() ; i++) {
                if (checked) {
                    nodes.getNode(i).check();
                }
                else {
                    nodes.getNode(i).set_checked(false);
                }

                if (nodes.getNode(i).get_nodes().get_count() > 0) {
                    UpdateAllChildren(nodes.getNode(i).get_nodes(), checked);
                }
            }
        }
        function clientNodeChecked(sender, eventArgs) {
            var childNodes = eventArgs.get_node().get_nodes();
            var isChecked = eventArgs.get_node().get_checked();
            UpdateAllChildren(childNodes, isChecked);
        }

        function getObject(objectId) {
            return $('#' + objectId);
        }


        function OnKeyEnterPress(event) {
            var keyword = $("#<%=txtKeyVlue.ClientID%>").val().trim();
            if (event.keyCode == 13) {
                $("#<%=btnSearch.ClientID%>").click();
            }
                  
        }

        //2012-5-24 ELTON, add for download file by [FileCenterV2 FileControlHandler]
        function DownloadFileWithHandler(sHandlerUrl, sUserProxyIndex) {
            $uof.download(sHandlerUrl, sUserProxyIndex);
        }

    </script>
    <table id="Table1" border="0" style="width: 100%; height: 100%; border: solid 2px silver; padding: 0px;">
        <tr>
            <td style="width: 20%">
                <table border="0" style="width: 100%; height: 100%; padding: 0px; table-layout: fixed;">
                    <tr>
                        <td style="border-right-color: Silver; border-right-width: thin; border-right-style: solid; height: 100%; width: 200px; text-align: left">

                            <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                                <ContentTemplate>
                                    <asp:Label ID="Label2" runat="server" Text="已選取的文件" meta:resourcekey="Label2Resource1"></asp:Label><br />
                                    <telerik:RadButton ID="wibtnClearAll" Text="清除全部" runat="server" OnClick="wibtnClearAll_Click"
                                        meta:resourcekey="wibtnClearAllResource1">
                                    </telerik:RadButton>
                                    <br />
                                    <div style="overflow: auto; width: 100%; min-height: 450px; height: 100%;">
                                        <telerik:RadTreeView runat="server" ID="docTree" EnableNodeTextHtmlEncoding="true"
                                            OnClientNodeClicked="docTreeClientNodeClicked" meta:resourcekey="docTreeResource1">
                                        </telerik:RadTreeView>
                                    </div>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </td>

                    </tr>

                </table>
            </td>
            <td style="border-right-color: Silver; border-right-width: thin; border-right-style: solid; height: 100%; width: 20%; text-align: left">
                <div id="folderdiv" style="overflow: auto; width: 100%; height:100%; min-height: 450px">
                    <telerik:RadTreeView runat="server" ID="folderTree" EnableNodeTextHtmlEncoding="true"
                        OnNodeClick="folderTree_NodeClick" meta:resourcekey="folderTreeResource1">
                    </telerik:RadTreeView>
                </div>                    
            </td>
            <td style="height: 369px; width: 60%; text-align: left">


                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <asp:Label runat="server" Text="文件編號或名稱" meta:resourcekey="LabelResource1"></asp:Label> <asp:TextBox ID="txtKeyVlue" runat="server" meta:resourcekey="txtKeyVlueResource1" onkeydown="return OnKeyEnterPress(event)"></asp:TextBox>    
                        <telerik:RadButton ID="btnSearch" runat="server" Text="搜尋" OnClick="btnSearch_Click" meta:resourcekey="btnSearchResource1"></telerik:RadButton>                                          

                        <div id="folderGrid" style="overflow-y: auto; width: 100%;">
                            <Fast:Grid ID="docGrid" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateCheckBoxColumn="False"
                                AutoGenerateColumns="False"  DataKeyNames="DOC_ID"
                                DataKeyOnClientWithCheckBox="True" EnhancePager="True"
                                PageSize="15"  SkinID="DMSStyle"  Width="100%" OnRowDataBound="docGrid_RowDataBound" OnPageIndexChanging="docGrid_PageIndexChanging" OnSorting="docGrid_Sorting" DefaultSortDirection="Ascending" EmptyDataText="No data found" KeepSelectedRows="False" meta:resourcekey="docGridResource1">
                                <EnhancePagerSettings ShowHeaderPager="True" FirstAltImageUrl="" FirstImageUrl="" LastAltImage="" LastImageUrl="" NextIAltImageUrl="" NextImageUrl="" PreviousAltImageUrl="" PreviousImageUrl=""></EnhancePagerSettings>
                                <ExportExcelSettings AllowExportToExcel="False" />
                                <Columns>
                                    <asp:TemplateField HeaderText="文件名稱" SortExpression="DOC_NAME" meta:resourcekey="TemplateFieldResource1">
                                        <ItemTemplate>
                                            <span style="word-wrap:break-word; word-break:break-all; ">
                                                <asp:Image runat="server" ImageUrl="~/DMS/images/icon/unknown.gif" ID="imgDocIcon" meta:resourcekey="imgDocIconResource1" />
                                                &nbsp;<asp:LinkButton runat="server" ID="lbtnDocName" meta:resourcekey="lbtnDocNameResource1"></asp:LinkButton>
                                            </span>
                                        </ItemTemplate>
                                        <HeaderStyle Wrap="False" Width="60%" HorizontalAlign="Center" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="保管者" meta:resourcekey="TemplateFieldResource4">
                                        <ItemTemplate>
                                            <uc1:UC_ChoiceList runat="server" ID="UC_ChoiceList1" IsAllowEdit="false"></uc1:UC_ChoiceList>
                                        </ItemTemplate>
                                        <HeaderStyle Wrap="False" Width="25%" HorizontalAlign="Center"/>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="功能" meta:resourcekey="TemplateFieldResource3">
                                        <ItemTemplate>
                                            <asp:LinkButton runat="server" ID="linkbtAdd" meta:resourcekey="lnkAddRefResource1" Visible="false">加入版本</asp:LinkButton>
                                            
                                            <asp:LinkButton runat="server" ID="lbtnAddSync" meta:resourcekey="lbtnAddSyncRefResource1">加入文件</asp:LinkButton>
                                        </ItemTemplate>
                                        <HeaderStyle Wrap="False" Width="5%" HorizontalAlign="Center"/>
                                        <ItemStyle Wrap="False" />
                                    </asp:TemplateField>
                                </Columns>
                            </Fast:Grid>
                        </div>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </td>
        </tr>
    </table>


    <asp:HiddenField ID="hidRefDoc" runat="server" />
    <asp:Label ID="lblDMSRoot" runat="server" Text="文件庫" Visible="False" meta:resourcekey="lblDMSRootResource1"></asp:Label>
    <asp:Label ID="lblFolder" runat="server" Text="目錄" Visible="False" meta:resourcekey="lblFolderResource1"></asp:Label>
    <asp:HiddenField ID="hdAppPath" runat="server" />
    <asp:Label ID="lblDMSClass" runat="server" Text="文件類別" Visible="False" meta:resourcekey="lblDMSClassResource1"></asp:Label>

    <!--2012-5-23 ELTON, 因檔案仍在Proxy尚未傳輸到UOF, 需顯示警告訊息-->
    <asp:Label ID="lblFileNotTransferToUof" runat="server" Text="目前檔案仍在Proxy伺服器，正由系統進行傳輸中，請稍後！" Visible="False" ForeColor="Blue" meta:resourcekey="lblFileNotTransferToUofResource1"></asp:Label>
    <asp:Label ID="lblVioding" runat="server" Text="(作廢審核中)" Visible="False" meta:resourcekey="lblViodingResource1"></asp:Label>
    <asp:Label ID="lblUpdating" runat="server" Text="改版中" Visible="False" meta:resourcekey="lblUpdatingResource1"></asp:Label>
    <asp:Label ID="Label11" runat="server" meta:resourcekey="labNoActiveResource1" Text="未生效" Visible="False"></asp:Label>
    <asp:Label ID="lblDraft" runat="server" Text="草稿" Visible="False" meta:resourcekey="lblDraftResource1"></asp:Label>
    <asp:Label ID="lblSyncChangeVersion" runat="server" Text="已有加入文件，是否要改為加入版本?" Visible="False" meta:resourcekey="lblSyncChangeVersionResource1"></asp:Label>
    <asp:Label ID="lblSyncChangeLatest" runat="server" Text="已有加入版本，是否要改為加入文件?" Visible="False" meta:resourcekey="lblSyncChangeLatestResource1"></asp:Label>

    <asp:Label ID="lblVersionUpdate" runat="server" Text="已加入{0}，是否要將文件更新為{1}?" Visible="False" meta:resourcekey="lblVersionUpdateResource1"></asp:Label>
    <asp:Label ID="lblSameSync" runat="server" Text="已有加入參考" Visible="False" meta:resourcekey="lblSameSyncResource1"></asp:Label>
    <asp:Label ID="lblNoUpdate" runat="server" Text="本文已加入該文件!" Visible="false"></asp:Label>
    <asp:HiddenField ID="hidSelectRef" runat="server" />
    <asp:HiddenField ID="hidPostBack" runat="server" />
    <asp:Button ID="btnPostBack" runat="server" Text="Button" OnClick="btnPostBack_Click" style="display:none" meta:resourcekey="btnPostBackResource1" />
</asp:Content>

