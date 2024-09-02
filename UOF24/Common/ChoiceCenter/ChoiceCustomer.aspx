<%@ Page Title="選擇客戶聯絡人" Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="Common_ChoiceCenter_ChoiceCustomer" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" Codebehind="ChoiceCustomer.aspx.cs" %>
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
        <script src="../javascript/ChioceCustomer.js"></script>
        <script type="text/javascript">

            Sys.Application.add_load(function () {

                Choice.Config.Trees = Object.freeze({
                    Result: $find("<%= treeResult.ClientID %>"),
                    User: $find("<%= treeCustomer.ClientID %>"),
                });

                Choice.Config.resultUserSet = new Choice.UserSet();
                Choice.Config.currentMode = Choice.ChoiceType.ContactUse;
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

                $("#divCommonUse").show();
                $('#divCommonUse').css({ 'background-color': '#d9d9d9' });
                $("#divCustomer").show();
            });

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

            function treeResult_NodeClicked(sender, args) {
                var node = args.get_node();
                var attributes = node.get_attributes();
                var key = attributes.getAttribute("key");
                Choice.Config.resultUserSet.removeByKey(key);

                Choice.setResultPaging();
            }

            function onClientTabSelected(sender, args) {
                var tab = args.get_tab();
                var mode = tab.get_value();

                $(".divContainer").hide();
                for (var name in Choice.ChoiceType) {
                    if (mode == name) {
                        Choice.Config.currentMode = Choice.ChoiceType[name];
                        break;
                    }
                }

                var treeCustomer = $find("<%= treeCustomer.ClientID %>")
                treeCustomer.trackChanges();
                while (treeCustomer.get_nodes().get_count() > 0) {
                    var node = treeCustomer.get_nodes().getNode(0);
                    treeCustomer.get_nodes().remove(node);
                }
                treeCustomer.commitChanges();

                //變更tab時，將筆數歸0
                $("#SearchUserCount").text(0);
                $("#SearchUserPageSize").text(String.format("{0}/{1}", 0, 0));

                Choice.switchMode(Choice.Config.currentMode);
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

            function treeCommonUse_NodeClicked(sender, args) {
                var node = args.get_node();

                Choice.submitSearchUser({ "action": "GetCommonUser", "id": node.get_value() });
            }

            function treeClass_NodeClicked(sender, args) {
                var node = args.get_node();

                if (Choice.Config.currentMode == Choice.ChoiceType.Class) {
                    Choice.addToResult(Choice.Config.currentMode, node.get_text(), node.get_value());
                }
                else if (Choice.Config.currentMode == Choice.ChoiceType.ContactClass) {

                    Choice.submitSearchUser({ "action": "GetClass", "id": node.get_value() });
                }
            }

            function treeIndustry_NodeClicked(sender, args) {
                var node = args.get_node();

                if (Choice.Config.currentMode == Choice.ChoiceType.Industry) {
                    Choice.addToResult(Choice.Config.currentMode, node.get_text(), node.get_value());
                }
                else if (Choice.Config.currentMode == Choice.ChoiceType.ContactIndustry) {
                    Choice.submitSearchUser({ "action": "GetIndustry", "id": node.get_value() });
                }
            }

            function treeArea_NodeClicked(sender, args) {
                var node = args.get_node();
                var isDepth = $('#<%=cbAllowSubArea.ClientID%>').is(":checked");

                if (Choice.Config.currentMode == Choice.ChoiceType.Area) {
                    Choice.addToResult(Choice.Config.currentMode, node.get_text(), node.get_value(), isDepth);
                }
                else if (Choice.Config.currentMode == Choice.ChoiceType.ContactArea) {
                    Choice.submitSearchUser({ "action": "GetArea", "id": node.get_value() });
                }
            }

            function treeCustomer_NodeClicked(sender, args) {
                var node = args.get_node();
                var level = node.get_level();

                if (level == 0) {
                    Choice.submitResult({ "action": "GetExpandToContact", "id": node.get_value() }, Choice.Config.currentMode);
                }
                else if (level == 1) {
                    Choice.addToResult(Choice.Config.currentMode, node.get_text(), node.get_value());
                }
            }

            function Button2Click() {
                $uof.dialog.open2("~/Common/ChoiceCenter/ChoiceCustomerPreview.aspx", "", "", 700, 650, function (returnValue) { return false; });
                return false;
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

            function onSearchUserFindClicking(sender, args) {

                var userGuid = $("#<%=hfUserGuid.ClientID %>").val();
                var keyWord = $('#txbKeyWordUser').val();

                var data = [keyWord, $uof.tool.htmlDecode(userGuid)];
                var result = $uof.pageMethod.sync("SearchCustomer", data);

                Choice.Config.userCache = $uof.json.toObject(result);
                Choice.Config.userPageIndex = 1;
                Choice.Config.userMaxPageIndex = Math.ceil(Choice.Config.userCache.length / Choice.Config.userPageSize);
                Choice.setUserSearchPagingInfo();

                var imagePath = Choice.getTypeImage(Choice.Config.currentMode);
                var start = Choice.Config.userPageSize * (Choice.Config.userPageIndex - 1);
                var end = Choice.Config.userPageSize + start > Choice.Config.userCache.length ? Choice.Config.userCache.length : Choice.Config.userPageSize + start;
                Choice.Config.Trees.User.get_nodes().clear();

                for (var i = start; i < end; i++) {

                    var node = new Telerik.Web.UI.RadTreeNode();
                    var user = Choice.Config.userCache[i];
                    var rootPath = $uof.tool.getRootPath() + "/Common/Images/Icon/";
                    if (user.Type != "undefined" && user.Type == "ClassContact") {
                        if (user.HaveChild != "Y") {
                            node.set_text(user.CoustomerName);
                            node.set_value(user.CoustomerID);
                            node.set_imageUrl(rootPath + "icon_c06.gif");
                            node.expand();
                            Choice.Config.Trees.User.get_nodes().add(node);
                        }
                        else {
                            var parentNode = Choice.Config.Trees.User.findNodeByValue(user.CoustomerID);
                            if (parentNode != null) {
                                var childNode = new Telerik.Web.UI.RadTreeNode();
                                childNode.set_text(user.ContactName);
                                childNode.set_value(user.ContactID);
                                childNode.set_imageUrl(rootPath + "icon_c02.gif");
                                childNode.expand();
                                parentNode.get_nodes().add(childNode);
                            }
                        }
                    }
                    else {

                        node.set_text(user.ContactName);
                        node.set_value(user.ContactID);
                        node.set_imageUrl(imagePath);
                        Choice.Config.Trees.User.get_nodes().add(node);
                    }
                }
            }
        </script>

    </telerik:RadCodeBlock>

    <telerik:RadSplitter ID="Radsplitter1" runat="server" Orientation="Horizontal"
        Width="100%" Height="100%" LiveResize="True" FullScreenMode="True" meta:resourcekey="Radsplitter1Resource1" SplitBarsSize="">
        <telerik:RadPane ID="PanTop" runat="server" Scrolling="None" Index="0" meta:resourcekey="PanTopResource1">
            <telerik:RadSplitter ID="Radsplitter2" runat="server" Height="100%" LiveResize="True" OnClientLoad="Radsplitter2afterResize" OnClientResized="Radsplitter2afterResize" meta:resourcekey="Radsplitter2Resource1" OnClientLoaded="Radsplitter2afterResize" SplitBarsSize="">
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
                            <asp:Literal ID="msgPrevPage2" runat="server" Text="上一頁" meta:resourcekey="msgPrevPage2Resource1" />
                        </a>&nbsp; 
                        <a href="#" id="ResultNextPage">
                            <asp:Literal ID="msgNextPage2" runat="server" Text="下一頁" meta:resourcekey="msgNextPage2Resource1" />
                        </a>&nbsp; 
                        <asp:Label ID="lbResultCount" runat="server" Text="筆數:" meta:resourcekey="lbResultCountResource1" />
                        <span id="ResultCount" style="color:blue">0</span>
                    </div>
                    <div>
                        <telerik:RadTreeView ID="treeResult" runat="server" OnClientNodeClicked="treeResult_NodeClicked" EnableNodeTextHtmlEncoding="true" meta:resourcekey="treeResultResource1"></telerik:RadTreeView>
                    </div>
                </telerik:RadPane>

                <telerik:RadPane ID="PanRight" runat="server" Scrolling="None" MinWidth="650" Index="1" meta:resourcekey="PanRightResource1">
                    <div id="tabStripDiv" style="height: auto; padding: 2px">
                        <telerik:RadTabStrip ID="RadTabStrip1" runat="server" OnClientTabSelected="onClientTabSelected" SelectedIndex="0" meta:resourcekey="RadTabStrip1Resource1">
                            <Tabs>
                                <telerik:RadTab runat="server" Text="個人常用客戶" Value="ContactUse" meta:resourcekey="RadTabResource1" Selected="True">
                                </telerik:RadTab>
                                <telerik:RadTab runat="server" Text="依聯絡人(類別)" Value="ContactClass" meta:resourcekey="RadTabResource2">
                                </telerik:RadTab>
                                <telerik:RadTab runat="server" Text="依聯絡人(行業)" Value="ContactIndustry" meta:resourcekey="RadTabResource3">
                                </telerik:RadTab>
                                <telerik:RadTab runat="server" Text="依聯絡人(地區)" Value="ContactArea" meta:resourcekey="RadTabResource4">
                                </telerik:RadTab>
                                <telerik:RadTab runat="server" Text="依類別" Value="Class" meta:resourcekey="RadTabResource5">
                                </telerik:RadTab>
                                <telerik:RadTab runat="server" Text="依行業" Value="Industry" meta:resourcekey="RadTabResource6">
                                </telerik:RadTab>
                                <telerik:RadTab runat="server" Text="依地區" Value="Area" IsBreak="True" meta:resourcekey="RadTabResource7">
                                </telerik:RadTab>
                            </Tabs>
                        </telerik:RadTabStrip>
                    </div>
                    <div id="divTreeContainer">
                        <div id="divCommonUse" class="divContainer">
                            <div class="divTreeBody">
                                <telerik:RadTreeView ID="treeCommonUse" runat="server" Height="100%" Width="100%" ShowLineImages="False" OnClientNodeClicked="treeCommonUse_NodeClicked" EnableNodeTextHtmlEncoding="true" meta:resourcekey="treeCommonUseResource2"></telerik:RadTreeView>
                            </div>
                        </div>
                        <div id="divClass" class="divContainer">
                            <div class="divTreeBody">
                                <telerik:RadTreeView ID="treeClass" runat="server" Height="100%" Width="100%" ShowLineImages="False" OnClientNodeClicked="treeClass_NodeClicked" EnableNodeTextHtmlEncoding="true" meta:resourcekey="treeClassResource2"></telerik:RadTreeView>
                            </div>
                        </div>

                        <div id="divIndustry" class="divContainer">
                            <div class="divTreeBody">
                                <telerik:RadTreeView ID="treeIndustry" runat="server" Height="100%" Width="100%" ShowLineImages="False" OnClientNodeClicked="treeIndustry_NodeClicked" EnableNodeTextHtmlEncoding="true" meta:resourcekey="treeIndustryResource2"></telerik:RadTreeView>
                            </div>
                        </div>
                        <div id="divArea" class="divContainer">
                            <div>
                                <div id="divPanelAllowSubArea">
                                    <asp:CheckBox ID="cbAllowSubArea" runat="server" Text="包含子地區"
                                        meta:resourcekey="cbAllowSubAreaResource1" />
                                </div>
                            </div>
                            <div class="divTreeBody">
                                <telerik:RadTreeView ID="treeArea" runat="server" Height="100%" Width="100%" ShowLineImages="False" OnClientNodeClicked="treeArea_NodeClicked" EnableNodeTextHtmlEncoding="true" meta:resourcekey="treeAreaResource2"></telerik:RadTreeView>
                            </div>
                        </div>
                        <div id="divCustomer" class="divContainer">
                            <div style="height: 25px">
                                <div style="float: left; margin: 2px;">
                                    <asp:Label ID="Label1" runat="server" Text="客戶" meta:resourcekey="Label1Resource1"></asp:Label>
                                    <input id="txbKeyWordUser" size="10" type="text" />
                                </div>
                                <div>
                                    <telerik:RadButton ID="RadButton2" runat="server" Text="Find" OnClientClicking="onSearchUserFindClicking" AutoPostBack="False" meta:resourcekey="RadButton2Resource1"></telerik:RadButton>
                                </div>
                            </div>
                            <div style="height: 25px; clear: both">
                                <div id="SearchUserDiv">
                                    <asp:Label ID="lblSearchUserPage" runat="server" Text="頁次:" meta:resourcekey="lblSearchUserPageResource1" />
                                    <span id="SearchUserPageSize" style="color:blue">0/0</span>&nbsp; 
                                    <a href="#" id="SearchUserPrevPage">
                                        <asp:Literal ID="msgPrevPage" runat="server" Text="上一頁" meta:resourcekey="msgPrevPageResource1" />
                                    </a>&nbsp; 
                                    <a href="#" id="SearchUserNextPage">
                                        <asp:Literal ID="msgNextPage" runat="server" Text="下一頁" meta:resourcekey="msgNextPageResource1" />
                                    </a>&nbsp; 
                                    <asp:Label ID="lbSearchUserCount" runat="server" Text="筆數:" meta:resourcekey="lbSearchUserCountResource1" />
                                    <span id="SearchUserCount" style="color:blue">0</span>
                                </div>
                            </div>
                            <div class="divTreeBody">
                                <telerik:RadTreeView ID="treeCustomer" runat="server" Height="100%" Width="100%" ShowLineImages="False" OnClientNodeClicked="treeCustomer_NodeClicked" EnableNodeTextHtmlEncoding="true" meta:resourcekey="treeCustomerResource2"></telerik:RadTreeView>
                            </div>
                        </div>
                    </div>
                </telerik:RadPane>
            </telerik:RadSplitter>
        </telerik:RadPane>
    </telerik:RadSplitter>
    <span style="display: none">
        <asp:Label ID="lblErrorExists" runat="server" Text="已加入" meta:resourcekey="lblErrorExistsResource1"></asp:Label>
        <asp:Label ID="lblErrorNotFind" runat="server" Text="找不到" meta:resourcekey="lblErrorNotFindResource1"></asp:Label>
        <asp:Label ID="lblErrorIsEnd" runat="server" Text="已經是最後一筆" meta:resourcekey="lblErrorIsEndResource1"></asp:Label>
        <asp:Label ID="lblErrorDepartmentFirst" runat="server" Text="請先選擇部門" meta:resourcekey="lblErrorDepartmentFirstResource1"></asp:Label>
        <asp:Label ID="lbFirstRun" runat="server" Visible="False" meta:resourcekey="lbFirstRunResource1"></asp:Label>
        <asp:Label ID="lbNeedPostBack" runat="server" Visible="False" meta:resourcekey="lbNeedPostBackResource1"></asp:Label>
        <asp:Label ID="lbPreView" runat="server" Text="預覽" Visible="False" meta:resourcekey="lbPreViewResource1"></asp:Label>
        <asp:Label ID="lbNoSelectedItemWarning" runat="server" Text="您沒有選取任何項目,確定要關閉嗎?" Visible="False" meta:resourcekey="lbNoSelectedItemWarningResource1"></asp:Label>
        <asp:Label ID="lbShowChioceType" runat="server" Visible="False" meta:resourcekey="lbShowChioceTypeResource1"></asp:Label>
        <asp:Label ID="lbUse" runat="server" Text="個人常用客戶" Visible="False" meta:resourcekey="lbUseResource1"></asp:Label>
        <asp:Label ID="lbContactClass" runat="server" Text="依聯絡人(類別)" Visible="False" meta:resourcekey="lbContactClassResource1"></asp:Label>
        <asp:Label ID="lbContactIndustry" runat="server" Text="依聯絡人(行業)" Visible="False" meta:resourcekey="lbContactIndustryResource1"></asp:Label>
        <asp:Label ID="lbContactArea" runat="server" Text="依聯絡人(地區)" Visible="False" meta:resourcekey="lbContactAreaResource1"></asp:Label>
        <asp:Label ID="lbCusClass" runat="server" Text="依類別" Visible="False" meta:resourcekey="lbCusClassResource1"></asp:Label>
        <asp:Label ID="lbCusIndustry" runat="server" Text="依行業" Visible="False" meta:resourcekey="lbCusIndustryResource1"></asp:Label>
        <asp:Label ID="lbCusArea" runat="server" Text="依地區" Visible="False" meta:resourcekey="lbCusAreaResource1"></asp:Label>
        <asp:HiddenField ID="hfUserGuid" runat="server" />
    </span>
</asp:Content>
