<%@ Page Title="選擇通訊錄聯絡人" Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="Common_ChoiceCenter_ChoiceAddressBook" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" Codebehind="ChoiceAddressBook.aspx.cs" %>

<%@ Import Namespace="Ede.Uof.Utility" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server" meta:resourcekey="RadAjaxManager1Resource1"></telerik:RadAjaxManager>
    <style>
         .divContainer {
            float: left;
            height: 100%;
            display: none;
            padding: 2px;
        }

        .divTreeBody {
            height: 100%;
        }
    </style>
    <telerik:RadCodeBlock ID="RadCodeBlock1" runat="server">
        <script type="text/javascript" src="../javascript/jQuery/plugin/jquery.ba-dotimeout.min.js"></script>
        <script src="../javascript/ChoiceCenterV2.js"></script>
        <script type="text/javascript">
            Sys.Application.add_load(function () {

                Choice.Config.Trees = Object.freeze({
                    Result: $find("<%= treeResult.ClientID %>"),
                    Class: $find("<%= treeClass.ClientID %>"),
                    User: $find("<%= treeContact.ClientID %>"),
                });

                Choice.Config.resultUserSet = new Choice.UserSet();
                Choice.Config.currentMode = Choice.ChoiceType.Contact;
                var curwindow = $uof.dialog.getOpener();
                var pd;
                if (curwindow) {
                    pd = curwindow.document;
                } else if (typeof (dialogArguments) != "undefined") {
                    pd = dialogArguments.document;
                }

                if (pd) {
                    var hfClientID = $uof.tool.htmlDecode('<%=System.Web.Security.AntiXss.AntiXssEncoder.HtmlEncode(Request.QueryString["hiddenId"] ,true)%>');
                    Choice.Config.resultUserSet.fromString($("#" + hfClientID, pd).val());
                }

                Choice.setResultPaging();

                $("#SearchUserNextPage").on("click", Choice.moveUserToNextPage);
                $("#SearchUserPrevPage").on("click", Choice.moveUserToPrevPage);

                $("#ResultNextPage").on("click", Choice.moveResultToNextPage);
                $("#ResultPrevPage").on("click", Choice.moveResultToPrevPage);

                selectedMode == "Class"
                $("#divClass").show();
                $("#divContact").show();
                $('#divClass').css({ 'background-color': '#d9d9d9' });

            });
        </script>
    </telerik:RadCodeBlock>

    <script type="text/javascript">

        var selectedMode = "<%=selectedMode %>";
        var treeResultID = $find("<%= treeResult.ClientID %>");
        var treeContactID = $find("<%= treeContact.ClientID %>");
        var treeClassID = $find("<%= treeClass.ClientID %>");


        var themePath = "<%=themePath %>";

        //treeClass_NodeClicked
        function treeClass_NodeClicked(sender, args) {
            var node = args.get_node();
            var exists = false;

            if (selectedMode == "Class") {

                exists = Choice.Config.resultUserSet.addressBookClass.exists(node.get_value());
                if (!exists) {
                    var resultNode = new Telerik.Web.UI.RadTreeNode();
                    var attributes = resultNode.get_attributes();
                    resultNode.set_text(node.get_text());
                    resultNode.set_value(node.get_value());
                    resultNode.set_imageUrl(node.get_imageUrl());
                    attributes.setAttribute("key", "class|" + node.get_value());
                    Choice.Config.Trees.Result.get_nodes().add(resultNode);
                    Choice.Config.resultUserSet.addressBookClass.add(node.get_value(), node.get_text(), node.get_imageUrl());
                    Choice.setResultPaging(true);
                }
                else {
                    $("#flashMessage").fadeIn(200).fadeOut(100).fadeIn(200).fadeOut(100);
                }
            }
            else if (selectedMode == "Contact") {
                $("#divContact").show();
                var data = [node.get_value()];
                var result = $uof.pageMethod.sync("GetExpandToContact", data);
                Choice.Config.userCache = $uof.json.toObject(result);
                Choice.Config.userPageIndex = 1;
                Choice.Config.userMaxPageIndex = Math.ceil(Choice.Config.userCache.length / Choice.Config.userPageSize);
                Choice.setUserSearchPagingInfo();

                var start = Choice.Config.userPageSize * (Choice.Config.userPageIndex - 1);
                var end = Choice.Config.userPageSize + start > Choice.Config.userCache.length ? Choice.Config.userCache.length : Choice.Config.userPageSize + start;
                Choice.Config.Trees.User.get_nodes().clear();

                for (var i = start; i < end; i++) {
                    var node = new Telerik.Web.UI.RadTreeNode();
                    var user = Choice.Config.userCache[i];
                    node.set_text(user.Name);
                    node.set_value(user.UserGuid);
                    node.set_imageUrl('../../Common/Images/Icon/icon_c08.gif');
                    Choice.Config.Trees.User.get_nodes().add(node);
                }
            }
        }

        function treeContact_NodeClicked(sender, args) {
            var node = args.get_node();
            var exists = false;

            exists = Choice.Config.resultUserSet.addressBookContact.exists(node.get_value());
            if (!exists) {

                var resultNode = new Telerik.Web.UI.RadTreeNode();
                var attributes = resultNode.get_attributes();
                resultNode.set_text(node.get_text());
                resultNode.set_value(node.get_value());
                resultNode.set_imageUrl('../../Common/Images/Icon/icon_c08.gif');
                attributes.setAttribute("key", "contact|" + node.get_value());
                Choice.Config.Trees.Result.get_nodes().add(resultNode);
                Choice.Config.resultUserSet.addressBookContact.add(node.get_value(), node.get_text(), node.get_imageUrl());


                var length = Choice.Config.resultUserSet.count();
                if (length > 0) {
                    Choice.Config.resultMaxPageIndex = Math.ceil(length / Choice.Config.resultPageSize);
                    if (scroll || Choice.Config.resultPageIndex > Choice.Config.resultMaxPageIndex) {
                        Choice.Config.resultPageIndex = Choice.Config.resultMaxPageIndex;
                    }
                } else {
                    Choice.Config.resultPageIndex = 0;
                    Choice.Config.resultMaxPageIndex = 0;
                }

                Choice.setResultPagingInfo();
            }
            else {
                $("#flashMessage").fadeIn(200).fadeOut(100).fadeIn(200).fadeOut(100);
            }
        }

        function treeSelected_NodeClick(treeId, nodeId, button) {
            //Add code to handle your event here.
            var node = igtree_getNodeById(nodeId);
            var item = new Item();
            item.SetDataFromTag(node.getTag());
            ReomveRecordSelectedNode(item);
            node.remove();
        }

        function onSearchUserFindClicking(sender, args) {
            /// <summary>
            /// 搜尋使用者find button
            /// </summary>
            /// <param name="sender"></param>
            /// <param name="args"></param>
            var userGuid = $("#<%=hfUserGuid.ClientID %>").val();
            var keyWord = $('#txbKeyWordAddressBook').val();

            var data = [keyWord, $uof.tool.htmlDecode(userGuid)];
            var result = $uof.pageMethod.sync("SearchAddressBook", data);

            Choice.Config.userCache = $uof.json.toObject(result);
            Choice.Config.userPageIndex = 1;
            Choice.Config.userMaxPageIndex = Math.ceil(Choice.Config.userCache.length / Choice.Config.userPageSize);
            Choice.setUserSearchPagingInfo();

            var start = Choice.Config.userPageSize * (Choice.Config.userPageIndex - 1);
            var end = Choice.Config.userPageSize + start > Choice.Config.userCache.length ? Choice.Config.userCache.length : Choice.Config.userPageSize + start;
            Choice.Config.Trees.User.get_nodes().clear();

            for (var i = start; i < end; i++) {
                var node = new Telerik.Web.UI.RadTreeNode();
                var user = Choice.Config.userCache[i];
                node.set_text(user.Name);
                node.set_value(user.UserGuid);
                node.set_imageUrl('../../Common/Images/Icon/icon_c08.gif');
                Choice.Config.Trees.User.get_nodes().add(node);
            }
        }

        function ConfirmSelect() {

            if (Choice.Config.resultUserSet.count() > 0 || confirm("<%=lbNoSelectedItemWarning.Text%>")) {
                var curwindow = $uof.dialog.getOpener();
                var pd;
                if (curwindow) {
                    pd = curwindow.document;
                } else if (typeof (dialogArguments) != "undefined") {
                    pd = dialogArguments.document;
                }
                var hfClientID = $uof.tool.htmlDecode('<%=System.Web.Security.AntiXss.AntiXssEncoder.HtmlEncode(Request.QueryString["hiddenId"] ,true)%>');
                $("#" + hfClientID, pd).val(Choice.Config.resultUserSet.toSring());

                $uof.dialog.set_returnValue("postBack");
                $uof.dialog.close();
                return true;

            } else {
                return false;
            }
        }

        function Button2Click() {
            $uof.dialog.open2("~/Common/ChoiceCenter/ChoiceAddressBookPreview.aspx", "", "", 700, 650, function (returnValue) { return false; });
           
            return false;
        }

        function treeResult_NodeClicked(sender, args) {

            var treeResult = $find("<%= treeResult.ClientID %>")
            var node = args.get_node();

            //移除節點
            var attributes = node.get_attributes();
            var key = attributes.getAttribute("key");
            Choice.Config.resultUserSet.removeByKey(key);
            var length = Choice.Config.resultUserSet.count();
            if (length > 0) {
                Choice.Config.resultMaxPageIndex = Math.ceil(length / Choice.Config.resultPageSize);
                if (scroll || Choice.Config.resultPageIndex > Choice.Config.resultMaxPageIndex) {
                    Choice.Config.resultPageIndex = Choice.Config.resultMaxPageIndex;
                }
            } else {
                Choice.Config.resultPageIndex = 0;
                Choice.Config.resultMaxPageIndex = 0;
            }

            //重新組合tree
            Choice.Config.Trees.Result.get_nodes().clear();

            if (length > 0) {
                var start = Choice.Config.resultPageSize * (Choice.Config.resultPageIndex - 1);
                var end = Choice.Config.resultPageSize + start > length ? length : Choice.Config.resultPageSize + start;
                for (var i = start; i < end; i++) {
                    var item = Choice.Config.resultUserSet.get(i);
                    var node = new Telerik.Web.UI.RadTreeNode();
                    node.set_text(item["text"]);
                    node.set_imageUrl(item["image"]);
                    var attributes = node.get_attributes();

                    var key = Choice.Config.resultUserSet.getKey(i);
                    attributes.setAttribute("key", key);

                    Choice.Config.Trees.Result.get_nodes().add(node);
                }
            }

            //重新計算分頁
            Choice.setResultPagingInfo();
        }

        function rdbtnAllClear_OnClientClicked(sender, args) {
            var treeResult = $find("<%= treeResult.ClientID %>")
            treeResult.trackChanges();
            while (treeResult.get_nodes().get_count() > 0) {
                var node = treeResult.get_nodes().getNode(0);
                treeResult.get_nodes().remove(node);
            }
            treeResult.commitChanges();

            Choice.Config.resultUserSet = new Choice.UserSet();
            Choice.setResultPaging();
        }

        function onClientTabSelected(sender, args) {

            var tab = args.get_tab();
            var mode = tab.get_value();

            selectedMode = mode;
            if (mode == "Contact") {
                $("#divClass").show();
                $("#divContact").show();
                $('#divClass').css({ 'background-color': '#d9d9d9' });
            }
            else if (mode == "Class") {
                $("#divClass").show();
                $("#divContact").hide();
                $('#divClass').css({ 'background-color': '#ffffff' });
            }
        }
        function Radsplitter2afterResize(s, a) {
            var tabHiehgt = $("#tabStripDiv").height() + 8;
            $("#divTreeContainer").height(s.get_height() - tabHiehgt);

            var panes = s.getPanes();
            var w = $(window).width() - panes[0].get_width();
            $("#tabStripDiv").width(w);

            var dw = 0;
            if (w < 520) {
                dw = 254;
            } else {
                dw = (w / 2) - 6;
            }

            $("#divTreeContainer").width((dw * 2) + 10);
            $(".divContainer").width(dw);


            $(".divTreeBody").height(s.get_height() - (tabHiehgt + 50));
        }

    </script>
    <telerik:RadSplitter ID="Radsplitter1" runat="server" Orientation="Horizontal" Width="100%" Height="100%" LiveResize="True" FullScreenMode="True" meta:resourcekey="Radsplitter1Resource1" SplitBarsSize="">
        <telerik:RadPane ID="PanTop" runat="server" Scrolling="None" Index="0" meta:resourcekey="PanTopResource1">
            <telerik:RadSplitter ID="Radsplitter2" runat="server" Height="100%" LiveResize="True" OnClientLoad="Radsplitter2afterResize" OnClientResized="Radsplitter2afterResize" OnClientLoaded="Radsplitter2afterResize" SplitBarsSize="" meta:resourcekey="Radsplitter2Resource1">
                <telerik:RadPane ID="PanLeft" runat="server" Width="30%" MinWidth="320" Index="0" meta:resourcekey="PanLeftResource1">
                    <div id="flashMessage" style="float: right; color: red; display: none;" class="SizeL">
                        <asp:Label ID="lbMsg" runat="server" Text="已加入" meta:resourcekey="lbMsgResource1"></asp:Label>
                    </div>
                    <div>
                        <telerik:RadButton runat="server" ID="rdbtnAllClear" Text="全部清除" CausesValidation="False" OnClientClicked="rdbtnAllClear_OnClientClicked" AutoPostBack="False" meta:resourcekey="rdbtnAllClearResource1"></telerik:RadButton>
                    </div>
                    <div style="height: 30px">
                        <asp:Label ID="lblResultPage" runat="server" Text="頁次:" meta:resourcekey="lblResultPageResource1" />
                        <span id="ResultPageSize" style="color:blue">0/0</span>&nbsp; 
                        <a href="#" id="ResultPrevPage">
                            <asp:Literal ID="msgPrevPage2" runat="server" Text="上一頁" meta:resourcekey="msgPrevPage2Resource1" /></a>&nbsp; 
                        <a href="#" id="ResultNextPage">
                            <asp:Literal ID="msgNextPage2" runat="server" Text="下一頁" meta:resourcekey="msgNextPage2Resource1" /></a>&nbsp; 
                        <asp:Label ID="lbResultCount" runat="server" Text="筆數:" meta:resourcekey="lbResultCountResource1" />
                        <span id="ResultCount" style="color:blue">0</span>
                    </div>
                    <div>
                        <telerik:RadTreeView ID="treeResult" runat="server" OnClientNodeClicked="treeResult_NodeClicked" EnableNodeTextHtmlEncoding ="true" meta:resourcekey="treeResultResource1"></telerik:RadTreeView>
                    </div>
                </telerik:RadPane>
                <telerik:RadPane ID="PanRight" runat="server" Scrolling="None" Index="1" meta:resourcekey="PanRightResource1">
                    <div id="tabStripDiv" style="height: auto; padding: 2px">
                        <telerik:RadTabStrip ID="radTab" runat="server" EnableViewState="False" SelectedIndex="0" OnClientTabSelected="onClientTabSelected" meta:resourcekey="radTabResource3">
                            <Tabs>
                                <telerik:RadTab runat="server" Text="依聯絡人" Value="Contact" Selected="True" meta:resourcekey="RadTabResource1">
                                </telerik:RadTab>
                                <telerik:RadTab runat="server" Text="依類別" Value="Class" meta:resourcekey="RadTabResource2">
                                </telerik:RadTab>
                            </Tabs>
                        </telerik:RadTabStrip>
                    </div>
                    <div id="divTreeContainer">
                        <div id="divClass" class="divContainer">
                            <div style="height: 25px">
                                <asp:Label ID="Label1" runat="server" Text="類別" meta:resourcekey="Label1Resource1"></asp:Label>
                            </div>
                            <div class="divTreeBody">
                                <telerik:RadTreeView ID="treeClass" runat="server" Height="100%" Width="100%" ShowLineImages="False" OnClientNodeClicked="treeClass_NodeClicked" EnableNodeTextHtmlEncoding ="true" meta:resourcekey="treeClassResource2"></telerik:RadTreeView>
                            </div>
                        </div>
                        <div id="divContact" class="divContainer">
                            <div style="height: 25px">
                                <div style="float: left; margin: 2px;">
                                    <asp:Label ID="Label20" runat="server" meta:resourcekey="Labelb12Resource1" Text="聯絡人"></asp:Label>&nbsp;
                                     <input id="txbKeyWordAddressBook" size="10" type="text" />
                                </div>
                                <div>
                                    <telerik:RadButton ID="rtbtnFind" runat="server" Text="Find" OnClientClicking="onSearchUserFindClicking" AutoPostBack="False" meta:resourcekey="rtbtnFindResource1"></telerik:RadButton>
                                </div>
                            </div>
                            <div style="height: 25px; clear: both">
                                <div id="SearchUserDiv">
                                    <asp:Label ID="lblSearchUserPage" runat="server" Text="頁次:" meta:resourcekey="lblSearchUserPageResource1" />
                                    <span id="SearchUserPageSize" style="color:blue">0/0</span>&nbsp; 
                                    <a href="#" id="SearchUserPrevPage">
                                        <asp:Literal ID="msgPrevPage" runat="server" Text="上一頁" meta:resourcekey="msgPrevPageResource1" /></a>&nbsp; 
                                    <a href="#" id="SearchUserNextPage">
                                        <asp:Literal ID="msgNextPage" runat="server" Text="下一頁" meta:resourcekey="msgNextPageResource1" /></a>&nbsp; 
                                    <asp:Label ID="lbSearchUserCount" runat="server" Text="筆數:" meta:resourcekey="lbSearchUserCountResource1" />
                                    <span id="SearchUserCount" style="color:blue">0</span>
                                </div>
                            </div>
                            <div class="divTreeBody">
                                <telerik:RadTreeView ID="treeContact" runat="server" Height="100%" Width="100%" ShowLineImages="False" OnClientNodeClicked="treeContact_NodeClicked"  EnableNodeTextHtmlEncoding ="true" meta:resourcekey="treeContactResource2"></telerik:RadTreeView>
                            </div>
                        </div>
                    </div>
                </telerik:RadPane>
            </telerik:RadSplitter>
        </telerik:RadPane>
        <telerik:RadPane ID="PanButtom" runat="server" Height="50px" Index="1" meta:resourcekey="PanButtomResource1">
            <asp:Panel ID="panelIcon" runat="server" meta:resourcekey="panelIconResource1">
            </asp:Panel>
        </telerik:RadPane>
    </telerik:RadSplitter>

    <span style="display: none">
        <asp:Label ID="lblErrorExists" runat="server" Text="已加入" meta:resourcekey="lblErrorExistsResource1"></asp:Label>
        <asp:Label ID="lblErrorNotFind" runat="server" Text="找不到" meta:resourcekey="lblErrorNotFindResource1"></asp:Label>
        <asp:Label ID="lblErrorIsEnd" runat="server" Text="已經是最後一筆" meta:resourcekey="lblErrorIsEndResource1"></asp:Label>
        <asp:Label ID="lbFirstRun" runat="server" Visible="False" meta:resourcekey="lbFirstRunResource1"></asp:Label>
        <asp:Label ID="lbNeedPostBack" runat="server" Visible="False" meta:resourcekey="lbNeedPostBackResource1"></asp:Label>
        <asp:Label ID="lbPreView" runat="server" Text="預覽" Visible="False" meta:resourcekey="lbPreViewResource1"></asp:Label>
        <asp:Label ID="lbNoSelectedItemWarning" runat="server" Text="您沒有選取任何項目,確定要關閉嗎?" Visible="False" meta:resourcekey="lbNoSelectedItemWarningResource1"></asp:Label>
        <asp:Label ID="lbContact" runat="server" Text="依聯絡人" Visible="False" meta:resourcekey="lbContactResource1"></asp:Label>
        <asp:Label ID="lbClass" runat="server" Text="依類別" Visible="False" meta:resourcekey="lbClassResource1"></asp:Label>
        <asp:Label ID="lblErrorDepartmentFirst" runat="server" Text="請先選擇部門" meta:resourcekey="lblErrorDepartmentFirstResource1"></asp:Label>
        <asp:HiddenField ID="hfUserGuid" runat="server" />
    </span>
</asp:Content>
