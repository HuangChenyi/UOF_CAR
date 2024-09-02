<%@ Page Title="選取人員" Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="Common_ChoiceCenter_LimitChoiceCenter" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" Codebehind="LimitChoiceCenter.aspx.cs" %>

<%@ Import Namespace="Ede.Uof.Utility" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server" meta:resourcekey="RadAjaxManager1Resource1"></telerik:RadAjaxManager>
    <style>
        .divContainer
        {
            float: left;
            height: 100%;
            display: none;
            padding: 2px;
        }

        .divTreeBody
        {
            height: 100%;
        }

        .divUserTreeBody {
            height: 100%;
        }
    </style>
    <telerik:RadSplitter ID="Radsplitter1" runat="server" Orientation="Horizontal"
        Width="100%" Height="100%" LiveResize="True" FullScreenMode="True" meta:resourcekey="Radsplitter1Resource1" SplitBarsSize="">
        <telerik:RadPane ID="PanTop" runat="server" Scrolling="None" Index="0" meta:resourcekey="PanTopResource1">
            <asp:Button ID="btnForPostBack" runat="server" Text="Button" OnClick="btnForPostBack_Click" Style="display: none;" meta:resourcekey="btnForPostBackResource1" />
            <telerik:RadSplitter ID="Radsplitter2" runat="server" Height="100%" LiveResize="True" OnClientLoad="Radsplitter2afterResize" OnClientResized="Radsplitter2afterResize" meta:resourcekey="Radsplitter2Resource1" OnClientLoaded="Radsplitter2afterResize" SplitBarsSize="">

                <telerik:RadPane ID="PanLeft" runat="server" Width="33%" MinWidth="330" Index="0" meta:resourcekey="PanLeftResource1">
                    <div id="flashMessage" style="float: right; color: red; display: none;" class="SizeL">
                        <asp:Label ID="lbMsg" runat="server" Text="已加入" meta:resourcekey="lbMsgResource1"></asp:Label>
                    </div>
                    <div>
                        <telerik:RadButton runat="server" ID="rdbtnAllClear" Text="全部清除" CausesValidation="False" OnClientClicked="rdbtnAllClear_OnClientClicked" AutoPostBack="False" meta:resourcekey="rdbtnAllClearResource1"></telerik:RadButton>
                    </div>
                    <div style="height: 30px">
                        <asp:Label ID="lblResultPage" runat="server" Text="頁次:" meta:resourcekey="lblResultPageResource1" />
                        <span id="ResultPageSize" style="color: blue">0/0</span>&nbsp; 
                        <a href="#" id="ResultPrevPage">
                            <asp:Literal ID="msgPrevPage2" runat="server" Text="上一頁" meta:resourcekey="msgPrevPage2Resource1" />
                        </a>&nbsp; 
                        <a href="#" id="ResultNextPage">
                            <asp:Literal ID="msgNextPage2" runat="server" Text="下一頁" meta:resourcekey="msgNextPage2Resource1" />
                        </a>&nbsp; 
                        <asp:Label ID="lbResultCount" runat="server" Text="筆數:" meta:resourcekey="lbResultCountResource1" />
                        <span id="ResultCount" style="color: blue">0</span>
                    </div>
                    <div>
                        <telerik:RadTreeView ID="treeResult" runat="server" OnClientNodeClicked="treeResult_NodeClicked" EnableNodeTextHtmlEncoding="true" meta:resourcekey="treeResultResource1"></telerik:RadTreeView>
                    </div>
                </telerik:RadPane>

                <telerik:RadPane ID="PanRight" runat="server" Scrolling="None" MinWidth="640" Index="1" meta:resourcekey="PanRightResource1">
                    <div id="tabStripDiv" style="height: auto; padding: 2px">
                        <telerik:RadTabStrip ID="RadTabStrip1" runat="server" OnClientTabSelected="onClientTabSelected" SelectedIndex="0" meta:resourcekey="RadTabStrip1Resource1">
                            <Tabs>
                                <telerik:RadTab runat="server" Text="部門" Value="DepartmentUser" meta:resourcekey="RadTabResource1" Selected="True">
                                </telerik:RadTab>
                                <telerik:RadTab runat="server" Text="員工" Value="Employee" meta:resourcekey="RadTabResource2">
                                </telerik:RadTab>
                                <telerik:RadTab runat="server" Text="職級" Value="JobTitle" meta:resourcekey="RadTabResource3">
                                </telerik:RadTab>
                                <telerik:RadTab runat="server" Text="職務" Value="JobFunction" meta:resourcekey="RadTabResource4">
                                </telerik:RadTab>
                                <telerik:RadTab runat="server" Text="部門+職級" Value="DepartmentJobTitle" meta:resourcekey="RadTabResource5">
                                </telerik:RadTab>
                                <telerik:RadTab runat="server" Text="部門+職務" Value="DepartmentJobFunction" meta:resourcekey="RadTabResource6">
                                </telerik:RadTab>
                                <telerik:RadTab runat="server" Text="使用者部門" Value="UserDept" IsBreak="True" meta:resourcekey="RadTabResource7">
                                </telerik:RadTab>
                            </Tabs>
                        </telerik:RadTabStrip>
                    </div>
                    <div id="divTreeContainer">
                        <div id="divDepartment" class="divContainer">
                            <div class="divTreeBody">
                                <telerik:RadTreeView ID="treeDepartment" runat="server" Height="100%" Width="100%" ShowLineImages="False" OnClientNodeClicked="treeDepartment_NodeClicked" EnableNodeTextHtmlEncoding="true" meta:resourcekey="treeDepartmentResource1"></telerik:RadTreeView>
                            </div>
                        </div>
                        <div id="divEmployee" class="divContainer">
                            <div class="divTreeBody">
                                <telerik:RadTreeView ID="treeEmployee" runat="server" Height="100%" Width="100%" ShowLineImages="False" OnClientNodeClicked="treeEmployee_NodeClicked" EnableNodeTextHtmlEncoding="true" meta:resourcekey="treeEmployeeResource1"></telerik:RadTreeView>
                            </div>
                        </div>
                        <div id="divJobTitle" class="divContainer">
                            <div class="divTreeBody">
                                <telerik:RadTreeView ID="treeJobTitle" runat="server" Height="100%" Width="100%" ShowLineImages="False" OnClientNodeClicked="treeJobTitle_NodeClicked" EnableNodeTextHtmlEncoding="true" meta:resourcekey="treeJobTitleResource1"></telerik:RadTreeView>
                            </div>
                        </div>
                        <div id="divJobFunction" class="divContainer">
                            <div class="divTreeBody">
                                <telerik:RadTreeView ID="treeJobFunction" runat="server" Height="100%" Width="100%" ShowLineImages="False" OnClientNodeClicked="treeJobFunction_NodeClicked" EnableNodeTextHtmlEncoding="true" meta:resourcekey="treeJobFunctionResource1"></telerik:RadTreeView>
                            </div>
                        </div>
                        <div id="divDeptTitle" class="divContainer">
                            <div class="divTreeBody">
                                <telerik:RadTreeView ID="treeDeptTitle" runat="server" Height="100%" Width="100%" ShowLineImages="False" OnClientNodeClicked="treeDeptTitle_NodeClicked" EnableNodeTextHtmlEncoding="true" meta:resourcekey="treeDeptTitleResource1"></telerik:RadTreeView>
                            </div>
                        </div>
                        <div id="divDeptFunc" class="divContainer">
                            <div class="divTreeBody">
                                <telerik:RadTreeView ID="treeDeptFunc" runat="server" Height="100%" Width="100%" ShowLineImages="False" OnClientNodeClicked="treeDeptFunc_NodeClicked" EnableNodeTextHtmlEncoding="true" meta:resourcekey="treeDeptFuncResource1"></telerik:RadTreeView>
                            </div>
                        </div>
                        <div id="divUserDpt" class="divContainer">
                            <div class="divTreeBody">
                                <telerik:RadTreeView ID="treeUserDept"  runat="server" Height="100%" Width="100%" ShowLineImages="False" OnClientNodeClicked="treeUserDept_NodeClicked" EnableNodeTextHtmlEncoding="true" meta:resourcekey="treeUserDeptResource1"></telerik:RadTreeView>
                            </div>
                        </div>
                        <div id="divUser" class="divContainer">
                            <div style="height: 25px;white-space: nowrap; text-overflow: ellipsis;">
                                <div style="float: left; margin: 2px; ">
                                    <input id="txbKeyWordUser" size="10" type="text" style="width: 200px" />
                                </div>
                                <div>
                                    <telerik:RadButton ID="RadButton2" runat="server" Text="Find" OnClientClicking="onSearchUserFindClicking" meta:resourcekey="RadButton2Resource1"></telerik:RadButton>
                                </div>
                            </div>
                            <div style="height: 25px; clear: both">
                                <div id="SearchUserDiv">
                                    <asp:Label ID="lblSearchUserPage" runat="server" Text="頁次:" meta:resourcekey="lblSearchUserPageResource1" />
                                    <span id="SearchUserPageSize" style="color: blue">0/0</span>&nbsp; 
                                    <a href="#" id="SearchUserPrevPage">
                                        <asp:Literal ID="msgPrevPage" runat="server" Text="上一頁" meta:resourcekey="msgPrevPageResource1" />
                                    </a>&nbsp; 
                                    <a href="#" id="SearchUserNextPage">
                                        <asp:Literal ID="msgNextPage" runat="server" Text="下一頁" meta:resourcekey="msgNextPageResource1" />
                                    </a>&nbsp; 
                                    <asp:Label ID="lbSearchUserCount" runat="server" Text="筆數:" meta:resourcekey="lbSearchUserCountResource1" />
                                    <span id="SearchUserCount" style="color: blue">0</span>
                                </div>
                            </div>
                            <div class="divUserTreeBody">
                                <telerik:RadTreeView ID="treeUser" runat="server" Height="100%" Width="100%" ShowLineImages="False" OnClientNodeClicked="treeUser_NodeClicked" EnableNodeTextHtmlEncoding="true" meta:resourcekey="treeUserResource1"></telerik:RadTreeView>
                            </div>
                        </div>
                    </div>

                </telerik:RadPane>
            </telerik:RadSplitter>
        </telerik:RadPane>
        <telerik:RadPane ID="PanButtom" runat="server" Height="50px" Scrolling="None" Index="1" meta:resourcekey="PanButtomResource1">
            <asp:Panel ID="panelIcon" runat="server" meta:resourcekey="panelIconResource1">
                <table border="0" width="100%">
                    <tr>
                        <td nowrap="noWrap">
                            <asp:Image ID="Image1" runat="server" ImageUrl="~/Common/Images/Icon/icon_m01.png" meta:resourcekey="Image1Resource1" />
                            <asp:Label ID="Label4" runat="server" Text="部門" meta:resourcekey="Label4Resource1"></asp:Label>
                        </td>
                        <td nowrap="noWrap">
                            <asp:Image ID="Image2" runat="server" ImageUrl="~/Common/Images/Icon/icon_m17.png" meta:resourcekey="Image2Resource1" />
                            <asp:Label ID="Label5" runat="server" Text="員工" meta:resourcekey="Label5Resource1"></asp:Label>
                        </td>
                        <td nowrap="noWrap">
                            <asp:Image ID="Image3" runat="server" ImageUrl="~/Common/Images/Icon/icon_m18.png" meta:resourcekey="Image3Resource1" />
                            <asp:Label ID="Label1" runat="server" Text="職級" meta:resourcekey="Label1Resource1"></asp:Label>
                        </td>
                        <td nowrap="noWrap">
                            <asp:Image ID="Image5" runat="server" ImageUrl="~/Common/Images/Icon/icon_m19.png" meta:resourcekey="Image5Resource1" />
                            <asp:Label ID="Label10" runat="server" Text="職務" meta:resourcekey="Label10Resource1"></asp:Label>
                        </td>
                        <td nowrap="noWrap">
                            <asp:Image ID="Image7" runat="server" ImageUrl="~/Common/Images/Icon/icon_m20.png" meta:resourcekey="Image7Resource1" />
                            <asp:Label ID="Label11" runat="server" Text="部門+職級" meta:resourcekey="Label11Resource1"></asp:Label>
                        </td>
                        <td nowrap="noWrap">
                            <asp:Image ID="Image9" runat="server" ImageUrl="~/Common/Images/Icon/icon_m21.png" meta:resourcekey="Image9Resource1" />
                            <asp:Label ID="Label6" runat="server" Text="部門+職務" meta:resourcekey="Label6Resource1"></asp:Label>
                        </td>
                        <td nowrap="noWrap">
                            <asp:Image ID="Image4" runat="server" ImageUrl="~/Common/Images/Icon/icon_m22.png" meta:resourcekey="Image4Resource1" />
                            <asp:Label ID="Label7" runat="server" Text="部門(含子部門)" meta:resourcekey="Label7Resource1"></asp:Label>
                        </td>
                        <td nowrap="noWrap">
                            <asp:Image ID="Image8" runat="server" ImageUrl="~/Common/Images/Icon/icon_m23.png" meta:resourcekey="Image8Resource1" />
                            <asp:Label ID="Label8" runat="server" Text="部門+職級(含子部門)" meta:resourcekey="Label8Resource1"></asp:Label>
                        </td>
                        <td nowrap="noWrap">
                            <asp:Image ID="Image6" runat="server" ImageUrl="~/Common/Images/Icon/icon_m24.png" meta:resourcekey="Image6Resource1" />
                            <asp:Label ID="Label9" runat="server" Text="部門+職務(含子部門)" meta:resourcekey="Label9Resource1"></asp:Label>
                        </td>
                    </tr>
                </table>
            </asp:Panel>
        </telerik:RadPane>
    </telerik:RadSplitter>
    <telerik:RadCodeBlock ID="RadCodeBlock1" runat="server">
        <script type="text/javascript" src="../javascript/jQuery/plugin/jquery.ba-dotimeout.min.js"></script>
        <script src="../javascript/ChoiceCenterV2.js"></script>
        <script type="text/javascript">
            var hfUserGuid = '<%=System.Web.Security.AntiXss.AntiXssEncoder.HtmlEncode(UserGuid, true)%>';
            var hfDisplayAllDept = '<%=System.Web.Security.AntiXss.AntiXssEncoder.HtmlEncode(DisplayAllDept.ToString().ToLower(), true)%>';
            var expandToUser = '<%=System.Web.Security.AntiXss.AntiXssEncoder.HtmlEncode(ExpandToUser.ToString().ToLower(), true)%>';
            var chioceType = '<%=System.Web.Security.AntiXss.AntiXssEncoder.HtmlEncode(ChioceType.ToString().ToLower(), true)%>';
            var specifiedSort = '<%=System.Web.Security.AntiXss.AntiXssEncoder.HtmlEncode(SpecifiedSort.ToString().ToLower(), true)%>';
            
            //#region initial
            Sys.Application.add_load(function () {
                /// <summary>
                /// 初始化
                /// </summary>

                Choice.Config.Trees = Object.freeze({
                    Result: $find("<%= treeResult.ClientID %>"),
                    User: $find("<%= treeUser.ClientID %>"),
                    Department: $find("<%= treeDepartment.ClientID %>"),
                    JobTitle: $find("<%= treeJobTitle.ClientID %>"),
                    JobFunction: $find("<%= treeJobFunction.ClientID %>"),
                });

                Choice.Config.resultUserSet = new Choice.UserSet();
                var curwindow = $uof.dialog.getOpener();
                var pd;
                if (curwindow) {
                    pd = curwindow.document;
                } else if (typeof (dialogArguments) != "undefined") {
                    pd = dialogArguments.document;
                }

                if (pd) {
                    var hfClientID = $uof.tool.htmlDecode('<%=System.Web.Security.AntiXss.AntiXssEncoder.HtmlEncode(Request.QueryString["hf"] ,true)%>');
                    var hfLimitXmlID = $uof.tool.htmlDecode('<%=System.Web.Security.AntiXss.AntiXssEncoder.HtmlEncode(Request.QueryString["limitXMLId"] ,true)%>');
                    Choice.Config.resultUserSet.fromString($("#" + hfClientID, pd).val());
                    var getlimitXML = $("#" + hfLimitXmlID, pd).val();
                    $('#<%=hidGetUserSet.ClientID%>').val(getlimitXML);
                }

                Choice.setResultPaging();

                $('#txbKeyWordUser').keypress(function (event) {
                    if (event.keyCode == 10 || event.keyCode == 13) {
                        event.preventDefault();
                        $(this).doTimeout("findEmpName",
                            500, Choice.searchLimitUser($uof.tool.htmlDecode(hfUserGuid), $('#<%=hidGetUserSet.ClientID%>').val(), true, $uof.tool.htmlDecode(hfDisplayAllDept), '<%=LimitWithUserDeptAllSub%>'));
                    }
                }).keyup(
                    function (event) {
                        $(this).doTimeout("findEmpName",
                            500, Choice.searchLimitUser($uof.tool.htmlDecode(hfUserGuid), $('#<%=hidGetUserSet.ClientID%>').val(), true, $uof.tool.htmlDecode(hfDisplayAllDept), '<%=LimitWithUserDeptAllSub%>'));
                });

                $("#SearchUserNextPage").on("click", Choice.moveUserToNextPage);
                $("#SearchUserPrevPage").on("click", Choice.moveUserToPrevPage);

                $("#ResultNextPage").on("click", Choice.moveResultToNextPage);
                $("#ResultPrevPage").on("click", Choice.moveResultToPrevPage);

                var type = Choice.Config.currentMode;
                if (type == 1) {
                    $("#divDepartment").show();
                    $('#divDepartment').css({ 'background-color': '#d9d9d9' });
                    $("#divUser").show();

                    var tree = $find("<%= treeDepartment.ClientID %>");
                    var node = tree.get_selectedNode();
                    Choice.submitSearchUser({ "action": "GetDepartmentUser", "id": node.get_value(), "displayAllDept":  $uof.tool.htmlDecode(hfDisplayAllDept) }, true);
                }
                else if (type == 11) {
                    $("#divEmployee").show();
                    $("#divUser").hide();
                }
                else if (type == 4) {
                    $("#divJobTitle").show();
                    $("#divJobTitle").css({ 'background-color': '#d9d9d9' });
                    $("#divUser").show();

                    var tree = $find("<%= treeJobTitle.ClientID %>");
                    var node = tree.get_selectedNode();
                    Choice.submitSearchUser({ "action": "GetJobTitleUser", "id": node.get_value() }, true);
                } else if (type == 5) {
                    $("#divJobFunction").show();
                    $("#divJobFunction").css({ 'background-color': '#d9d9d9' });
                    $("#divUser").show();

                    var tree = $find("<%= treeJobFunction.ClientID %>");
                    var node = tree.get_selectedNode();
                    Choice.submitSearchUser({ "action": "GetJobFunctionUser", "id": node.get_value() });
                }
                else if (type == 2) {
                    $("#divDeptTitle").show();
                    $("#divDeptTitle").css({ 'background-color': '#d9d9d9' });
                    $("#divUser").show();

                    var tree = $find("<%= treeDeptTitle.ClientID %>");
                    var node = tree.get_selectedNode();
                    Choice.submitSearchUser({ "action": "GetDeptTitleUser", "id": node.get_value() }, true);
                }
                else if (type == 3) {
                    $("#divDeptFunc").show();
                    $("#divDeptFunc").css({ 'background-color': '#d9d9d9' });
                    $("#divUser").show();

                    var tree = $find("<%= treeDeptFunc.ClientID %>");
                    var node = tree.get_selectedNode();
                    Choice.submitSearchUser({ "action": "GetDeptFuncUser", "id": node.get_value() }, true);
                }
                else if (type == 12) {
                    $("#divUserDpt").show();
                    $("#divUserDpt").css({ 'background-color': '#d9d9d9' });
                    $("#divUser").show();
                    Choice.Config.currentMode = 12;
                    var tree = $find("<%= treeUserDept.ClientID %>");
                    var node = tree.get_selectedNode();
                    Choice.submitSearchUser({ "action": "GetDepartmentUser", "id": node.get_value(), "displayAllDept":  $uof.tool.htmlDecode(hfDisplayAllDept) }, true);
                }
            });
            //#endregion initial

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

            //#region Tree Click 事件
            function treeDepartment_NodeClicked(sender, args) {
                var node = args.get_node();
                Choice.Config.currentMode = 1;
                Choice.submitSearchUser({ "action": "GetDepartmentUser", "id": node.get_value(), "displayAllDept":  $uof.tool.htmlDecode(hfDisplayAllDept) }, true);
            }

            function treeUser_NodeClicked(sender, args) {                
                var node = args.get_node();
                Choice.addToResult(1, node.get_text(), node.get_value());
            }

            function treeEmployee_NodeClicked(sender, args) {
                var node = args.get_node();
                Choice.addToResult(Choice.Config.currentMode, node.get_text(), node.get_value());
            }

            function treeJobTitle_NodeClicked(sender, args) {
                var node = args.get_node();
                if (node.get_level() == 1) {
                    Choice.Config.currentMode = 4;
                    Choice.submitSearchUser({ "action": "GetJobTitleUser", "id": node.get_value() }, true);
                }
            }

            function treeJobFunction_NodeClicked(sender, args) {
                var node = args.get_node();
                Choice.Config.currentMode = 5;
                Choice.submitSearchUser({ "action": "GetJobFunctionUser", "id": node.get_value() }, true);
            }

            function treeDeptTitle_NodeClicked(sender, args) {
                var node = args.get_node();
                Choice.Config.currentMode = 2;
                Choice.submitSearchUser({ "action": "GetDeptTitleUser", "id": node.get_value() }, true);
            }

            function treeDeptFunc_NodeClicked(sender, args) {
                var node = args.get_node();
                var id = node.get_value();
                Choice.Config.currentMode = 3;
                Choice.submitSearchUser({ "action": "GetDeptFuncUser", "id": node.get_value() }, true);
            }

            function treeResult_NodeClicked(sender, args) {
                var node = args.get_node();
                var attributes = node.get_attributes();
                var key = attributes.getAttribute("key");
                Choice.Config.resultUserSet.removeByKey(key);

                Choice.setResultPaging();
            }

            function treeUserDept_NodeClicked(sender, args) {
                var node = args.get_node();
                Choice.Config.currentMode = 12;
                Choice.submitSearchUser({ "action": "GetDepartmentUser", "id": node.get_value(), "displayAllDept":  $uof.tool.htmlDecode(hfDisplayAllDept) }, true);
            }

            //#endregion Tree Click 事件

            //#region 搜尋相關事件
            function onClientTabSelected(sender, args) {
                var tab = args.get_tab();
                var mode = tab.get_value();
                $(".divContainer").hide();
                for (var name in Choice.ChoiceType) {
                    Choice.Config.currentMode = Choice.ChoiceType[name];
                    if (mode == name) {                        
                        if (mode == "DepartmentUser") {
                            UserTreeEmpty();
                            $("#divDepartment").show();
                            $('#divDepartment').css({ 'background-color': '#d9d9d9' });
                            $("#divUser").show();

                            var tree = $find("<%= treeDepartment.ClientID %>");
                            var node = tree.get_selectedNode();
                            Choice.submitSearchUser({ "action": "GetDepartmentUser", "id": node.get_value(), "displayAllDept":  $uof.tool.htmlDecode(hfDisplayAllDept) }, true);
                            break;
                        }
                        else if (mode == "JobTitle") {
                            UserTreeEmpty();
                            $("#divJobTitle").show();
                            $("#divJobTitle").css({ 'background-color': '#d9d9d9' });
                            $("#divUser").show();

                            var tree = $find("<%= treeJobTitle.ClientID %>");
                            var node = tree.get_selectedNode();
                            Choice.submitSearchUser({ "action": "GetJobTitleUser", "id": node.get_value() }, true);
                            break;
                        }
                        else if (mode == "JobFunction") {
                            UserTreeEmpty();
                            $("#divJobFunction").show();
                            $("#divJobFunction").css({ 'background-color': '#d9d9d9' });
                            $("#divUser").show();
                            
                            var tree = $find("<%= treeJobFunction.ClientID %>");
                            var node = tree.get_selectedNode();
                            Choice.submitSearchUser({ "action": "GetJobFunctionUser", "id": node.get_value() }, true);
                            break;
                        }
                        else if (mode == "DepartmentJobTitle") {
                            UserTreeEmpty();
                            $("#divDeptTitle").show();
                            $("#divDeptTitle").css({ 'background-color': '#d9d9d9' });
                            $("#divUser").show();

                            var tree = $find("<%= treeDeptTitle.ClientID %>");
                            var node = tree.get_selectedNode();
                            Choice.submitSearchUser({ "action": "GetDeptTitleUser", "id": node.get_value() }, true);
                            break;
                        }
                        else if (mode == "DepartmentJobFunction") {
                            UserTreeEmpty();
                            $("#divDeptFunc").show();
                            $("#divDeptFunc").css({ 'background-color': '#d9d9d9' });
                            $("#divUser").show();

                            var tree = $find("<%= treeDeptFunc.ClientID %>");
                            var node = tree.get_selectedNode();
                            Choice.submitSearchUser({ "action": "GetDeptFuncUser", "id": node.get_value() }, true);
                            break;
                        }
                        else if (mode == "Employee") {
                            $("#divEmployee").show();
                            $("#divUser").hide();
                            break;
                        }
                        else {
                            Choice.switchMode(Choice.Config.currentMode);
                            break;
                        }
                    }
                    else {
                        if (mode == "UserDept") {
                            UserTreeEmpty();
                            $("#divUserDpt").show();
                            $("#divUserDpt").css({ 'background-color': '#d9d9d9' });
                            $("#divUser").show();
                            Choice.Config.currentMode = 12;
                            var tree = $find("<%= treeUserDept.ClientID %>");
                            var node = tree.get_selectedNode();
                            Choice.submitSearchUser({ "action": "GetDepartmentUser", "id": node.get_value(), "displayAllDept":  $uof.tool.htmlDecode(hfDisplayAllDept) }, true);
                            break;
                        }
                    }
                }

                //變更tab時，將筆數歸0
                $("#SearchUserCount").text(0);
                $("#SearchUserPageSize").text(String.format("{0}/{1}", 0, 0));
            }

            function UserTreeEmpty() {
                var treeUser = $find("<%= treeUser.ClientID %>")
                treeUser.trackChanges();
                while (treeUser.get_nodes().get_count() > 0) {
                    var node = treeUser.get_nodes().getNode(0);
                    treeUser.get_nodes().remove(node);
                }
                treeUser.commitChanges();
            }

            function onSearchUserFindClicking(sender, args) {
                /// <summary>
                /// 搜尋使用者find button
                /// </summary>
                /// <param name="sender"></param>
                /// <param name="args"></param>
                args.set_cancel(true);
                Choice.searchLimitUser($uof.tool.htmlDecode(hfUserGuid), $('#<%=hidGetUserSet.ClientID%>').val(), true, false, '<%=LimitWithUserDeptAllSub%>');
            }

            //#endregion 搜尋相關事件

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

                $(".divTreeBody").height(s.get_height() - (tabHiehgt + 5));
                $(".divUserTreeBody").height(s.get_height() - (tabHiehgt + 55));

                if($find("<%= treeDepartment.ClientID %>").get_selectedNode() != null)
                    $find("<%= treeDepartment.ClientID %>").get_selectedNode().scrollIntoView();
            }

            function SendResult() {
                if (Choice.Config.resultUserSet.count() > 0 || confirm("<%=lbNoSelectedItemWarning.Text%>")) {
                    // 如有啟用排序則會再次整理選完的結果，如是展成人的屬性或是choiceType為user時則會進行排序
                    if (($uof.tool.htmlDecode(expandToUser) === 'true' || $uof.tool.htmlDecode(chioceType) === 'user') && $uof.tool.htmlDecode(specifiedSort) === 'true') {
                        Choice.getResultUserSet($uof.tool.htmlDecode(hfDisplayAllDept));
                    }
                    var curwindow = $uof.dialog.getOpener();
                    var pd;
                    if (curwindow) {
                        pd = curwindow.document;
                    } else if (typeof (dialogArguments) != "undefined") {
                        pd = dialogArguments.document;
                    }

                    var hfClientID = $uof.tool.htmlDecode('<%=System.Web.Security.AntiXss.AntiXssEncoder.HtmlEncode(Request.QueryString["hf"] ,true)%>');
                    $("#" + hfClientID, pd).val(Choice.Config.resultUserSet.toSring());
                    if ("<%=NeedPostBack.ToString().ToLower() %>" == "true") {
                        $uof.dialog.set_returnValue("postBack");
                    }
                    $uof.dialog.close();
                    return true;

                } else {
                    return false;
                }
            }
        </script>

    </telerik:RadCodeBlock>
    <input id="hidGetUserSet" runat="server" type="hidden" />
    <asp:Label ID="lbNoSelectedItemWarning" runat="server" Text="您沒有選取任何項目,確定要關閉嗎?" Visible="False" meta:resourcekey="lbNoSelectedItemWarningResource1"></asp:Label>
</asp:Content>
