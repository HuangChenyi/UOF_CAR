<%@ Control Language="C#" AutoEventWireup="true" Inherits="Ede.Uof.Common.ChoiceCenter.UC_ChoiceOnce" Codebehind="UC_ChoiceOnce.ascx.cs" %>
<%@ Import Namespace="Ede.Uof.Utility" %>
<telerik:RadAjaxManager ID="RadAjaxManager1" runat="server" meta:resourcekey="RadAjaxManager1Resource1"></telerik:RadAjaxManager>
<style>
    .divContainer
    {
        float: left;
        height: 100%;
        width: 320px;
        display: none;
        padding: 2px;
    }

    .divTreeBody
    {
        height: 100%;
    }
</style>
<telerik:RadCodeBlock ID="RadCodeBlock1" runat="server">
    <script type="text/javascript" src="../javascript/jQuery/plugin/jquery.ba-dotimeout.min.js"></script>
    <script src="../javascript/ChoiceCenterV2.js"></script>
    <script type="text/javascript">
        var hfUserGuid = '<%=System.Web.Security.AntiXss.AntiXssEncoder.HtmlEncode(UserGuid, true)%>';
        var hfDisplayAllDept = '<%=System.Web.Security.AntiXss.AntiXssEncoder.HtmlEncode(DisplayAllDept.ToString().ToLower(), true)%>';

        //#region initial
        Sys.Application.add_load(function () {
            /// <summary>
            /// 初始化
            /// </summary>

            Choice.Config.Trees = Object.freeze({

                User: $find("<%= treeUser.ClientID %>"),
                    Department: $find("<%= treeDepartment.ClientID %>"),
                    JobTitle: $find("<%= treeJobTitle.ClientID %>"),
                    JobFunction: $find("<%= treeJobFunction.ClientID %>"),
                    Group: $find("<%= treeGroup.ClientID %>")
                });
                Choice.Config.resultUserSet = new Choice.UserSet();

                $('#txbKeyWordDept').keypress(function (event) {
                    if (event.keyCode == 10 || event.keyCode == 13) {
                        event.preventDefault();
                        $(this).doTimeout("findDeptName",
                            500, Choice.searchDepartment);
                    }
                }).keyup(
                function (event) {
                    $(this).doTimeout("findDeptName",
                        500, Choice.searchDepartment);
                });

                $('#txbKeyWordGroup').keypress(function (event) {
                    if (event.keyCode == 10 || event.keyCode == 13) {
                        event.preventDefault();
                        $(this).doTimeout("findGroupName",
                            500, Choice.searchGroup);
                    }
                }).keyup(
                function (event) {
                    $(this).doTimeout("findGroupName",
                        500, Choice.searchGroup);
                });

                $('#txbKeyWordUser').keypress(function (event) {
                    if (event.keyCode == 10 || event.keyCode == 13) {
                        event.preventDefault();
                        $(this).doTimeout("findEmpName",
                            500, Choice.searchUser($uof.tool.htmlDecode(hfUserGuid),$uof.tool.htmlDecode(hfDisplayAllDept)));
                    }
                }).keyup(
                    function (event) {
                        $(this).doTimeout("findEmpName",
                            500, Choice.searchUser($uof.tool.htmlDecode(hfUserGuid),$uof.tool.htmlDecode(hfDisplayAllDept)));
                    });

                $("#SearchUserNextPage").on("click", Choice.moveUserToNextPage);
                $("#SearchUserPrevPage").on("click", Choice.moveUserToPrevPage);

                Choice.switchMode(Choice.Config.currentMode);
            });
            //#endregion initial

            function treeDepartment_NodeClicked(sender, args) {

                var node = args.get_node();
                if (Choice.Config.currentMode == Choice.ChoiceType.DepartmentUser) {
                    Choice.submitSearchUser({ "action": "GetDepartmentUser", "id": node.get_value(), "displayAllDept": $uof.tool.htmlDecode(hfDisplayAllDept) });
                }
            }

            function treeGroup_NodeClicked(sender, args) {
                var node = args.get_node();
                if (Choice.Config.currentMode == Choice.ChoiceType.GroupUser) {
                    Choice.submitSearchUser({ "action": "GetGroupUser", "id": node.get_value() });
                }
            }

            //#endregion Tree Click 事件

            //#region 搜尋相關事件
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

                Choice.switchMode(Choice.Config.currentMode);
            }

            function onSearchUserFindClicking(sender, args) {
                /// <summary>
                /// 搜尋使用者find button
                /// </summary>
                /// <param name="sender"></param>
                /// <param name="args"></param>
                args.set_cancel(true);
                Choice.searchUser($uof.tool.htmlDecode(hfUserGuid),$uof.tool.htmlDecode(hfDisplayAllDept));
            }

            function onSearchGroupFindClicking(sender, args) {
                /// <summary>
                /// 搜尋群組find button
                /// </summary>
                /// <param name="sender"></param>
                /// <param name="args"></param>
                args.set_cancel(true);

                if (Choice.Config.groupCache == null) {
                    Choice.searchGroup();
                } else {
                    if (Choice.Config.groupIndex < Choice.Config.groupCache.length - 1) {
                        var node = Choice.Config.Trees.Group.findNodeByValue(Choice.Config.groupCache[++Choice.Config.groupIndex].Value);
                        Choice.submitSearchUser({ "action": "GetGroupUser", "id": node.get_value() });
                        node.select();
                        node.scrollIntoView();
                    }
                }
            }

            function onSearchDeptFindClicking(sender, args) {
                args.set_cancel(true);
                if (Choice.Config.departmentCache == null) {
                    Choice.searchDepartment($uof.tool.htmlDecode(hfDisplayAllDept));
                } else {
                    if (Choice.Config.departmentIndex < Choice.Config.departmentCache.length - 1) {
                        var node = Choice.Config.Trees.Department.findNodeByValue(Choice.Config.departmentCache[++Choice.Config.departmentIndex].Value);
                        Choice.submitSearchUser({ "action": "GetDepartmentUser", "id": node.get_value(), "displayAllDept": $uof.tool.htmlDecode(hfDisplayAllDept) });
                        node.select();
                        node.scrollIntoView();
                    }
                }
            }
            //#endregion 搜尋相關事件

            function Radsplitter2afterResize(s, a) {
                var tabHiehgt = $("#tabStripDiv").height() + 8;

                $("#divTreeContainer").height(s.get_height() - tabHiehgt);
                $(".divTreeBody").height(s.get_height() - (tabHiehgt + 75));

                if($find("<%= treeDepartment.ClientID %>").get_selectedNode() != null)
                    $find("<%= treeDepartment.ClientID %>").get_selectedNode().scrollIntoView();
            }

            function Button2Click() {
                $uof.dialog.open2("~/Common/ChoiceCenter/ChoicePreView.aspx", "", "", 700, 650, function (returnValue) { return false; }, {"displayAllDept":$uof.tool.htmlDecode(hfDisplayAllDept)});

                return false;
            }

            function Button3Click() {
                $uof.dialog.open2("~/Common/ChoiceCenter/ChioceAddToFavorite.aspx", "", "", 350, 150, function (returnValue) { return false; });

                return false;
            }
    </script>

</telerik:RadCodeBlock>
<telerik:RadSplitter ID="Radsplitter1" runat="server" Orientation="Horizontal"
    Width="100%" Height="100%" LiveResize="True" FullScreenMode="True" meta:resourcekey="Radsplitter1Resource1" SplitBarsSize="">
    <telerik:RadPane ID="PanTop" runat="server" Scrolling="None" Index="0" meta:resourcekey="PanTopResource1">
        <telerik:RadSplitter ID="Radsplitter2" runat="server" Height="100%" LiveResize="True" OnClientLoad="Radsplitter2afterResize" OnClientResized="Radsplitter2afterResize" meta:resourcekey="Radsplitter2Resource1" OnClientLoaded="Radsplitter2afterResize" SplitBarsSize="">
            <telerik:RadPane ID="PanRight" runat="server" Scrolling="None" MinWidth="650" Index="0" meta:resourcekey="PanRightResource1">
                <div id="tabStripDiv" style="height: auto; padding: 2px">
                    <telerik:RadTabStrip ID="RadTabStrip1" runat="server" OnClientTabSelected="onClientTabSelected" SelectedIndex="0" meta:resourcekey="RadTabStrip1Resource1">
                        <Tabs>
                            <telerik:RadTab runat="server" Text="依部門" Value="Department" meta:resourcekey="RadTabResource1" Selected="True">
                            </telerik:RadTab>
                            <telerik:RadTab runat="server" Text="依人員" Value="DepartmentUser" meta:resourcekey="RadTabResource2">
                            </telerik:RadTab>
                            <telerik:RadTab runat="server" Text="依職級" Value="JobTitle" meta:resourcekey="RadTabResource3">
                            </telerik:RadTab>
                            <telerik:RadTab runat="server" Text="依職務" Value="JobFunction" meta:resourcekey="RadTabResource4">
                            </telerik:RadTab>
                            <telerik:RadTab runat="server" Text="依群組" Value="Group" meta:resourcekey="RadTabResource5">
                            </telerik:RadTab>
                            <telerik:RadTab runat="server" Text="依外部會員" Value="GroupUser" meta:resourcekey="RadTabResource6">
                            </telerik:RadTab>
                        </Tabs>
                    </telerik:RadTabStrip>
                </div>
                <div id="divTreeContainer">                    
                    <div id="divDepartment" class="divContainer">
                        <div style="height: 25px;white-space:nowrap;text-overflow:ellipsis;">
                            <div style="float: left; margin: 2px;">
                                <asp:Label ID="Label1" runat="server" Text="部門" meta:resourcekey="Label1Resource1"></asp:Label>
                                <input id="txbKeyWordDept" size="10" type="text" />
                            </div>
                            <div>
                                <telerik:RadButton ID="RadButton1" runat="server" Text="Find" OnClientClicking="onSearchDeptFindClicking" meta:resourcekey="RadButton1Resource1"></telerik:RadButton>
                            </div>
                        </div>
                        <div style="height: 25px; clear: both" id="divSubDept" runat="server">
                            <asp:CheckBox ID="cbAllowSubDept" runat="server" Text="包含子部門" meta:resourcekey="cbAllowSubDeptResource2" />
                        </div>
                        <div class="divTreeBody">
                            <telerik:RadTreeView ID="treeDepartment" runat="server" Height="100%" Width="100%" ShowLineImages="False" OnClientNodeClicked="treeDepartment_NodeClicked" EnableNodeTextHtmlEncoding="true" meta:resourcekey="treeDepartmentResource1"></telerik:RadTreeView>
                        </div>
                    </div>
                    <div id="divGroup" class="divContainer">
                        <div style="height: 25px;white-space:nowrap;text-overflow:ellipsis;">
                            <div style="float: left; margin: 2px;">
                                <asp:Label ID="Label3" runat="server" Text="外部群組" meta:resourcekey="Label3Resource1"></asp:Label>
                                <input id="txbKeyWordGroup" size="10" type="text" />
                            </div>
                            <div>
                                <telerik:RadButton ID="RadButton3" runat="server" Text="Find" OnClientClicking="onSearchGroupFindClicking" meta:resourcekey="RadButton3Resource1"></telerik:RadButton>
                            </div>
                        </div>
                        <div style="height: 25px; clear: both" id="divSubGroup" runat="server">
                            <asp:CheckBox ID="cbAllowSubGroup" runat="server" Text="包含子群組" meta:resourcekey="cbAllowSubGroupResource1" />
                        </div>
                        <div class="divTreeBody">
                            <telerik:RadTreeView ID="treeGroup" runat="server" Height="100%" Width="100%" ShowLineImages="False" OnClientNodeClicked="treeGroup_NodeClicked" EnableNodeTextHtmlEncoding="true" meta:resourcekey="treeGroupResource1"></telerik:RadTreeView>
                        </div>
                    </div>
                    <div id="divUser" class="divContainer">
                        <div style="height: 25px;white-space:nowrap;text-overflow:ellipsis;">
                            <div style="float: left; margin: 2px;">
                                <asp:Label ID="Label2" runat="server" Text="人員" meta:resourcekey="Label2Resource1"></asp:Label>
                                <input id="txbKeyWordUser" size="10" type="text" />
                            </div>
                            <div>
                                <telerik:RadButton ID="RadButton2" runat="server" Text="Find" OnClientClicking="onSearchUserFindClicking" meta:resourcekey="RadButton2Resource1"></telerik:RadButton>
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
                            <telerik:RadTreeView ID="treeUser" runat="server" Height="100%" Width="100%" ShowLineImages="False" EnableNodeTextHtmlEncoding="true" meta:resourcekey="treeUserResource2"></telerik:RadTreeView>
                        </div>
                    </div>
                    <div id="divJobTitle" class="divContainer">
                        <div class="divTreeBody">
                            <telerik:RadTreeView ID="treeJobTitle" runat="server" Height="100%" Width="100%" ShowLineImages="False" EnableNodeTextHtmlEncoding="true" meta:resourcekey="treeJobTitleResource1"></telerik:RadTreeView>
                        </div>
                    </div>
                    <div id="divJobFunction" class="divContainer">
                        <div class="divTreeBody">
                            <telerik:RadTreeView ID="treeJobFunction" runat="server" Height="100%" Width="100%" ShowLineImages="False" EnableNodeTextHtmlEncoding="true" meta:resourcekey="treeJobFunctionResource1"></telerik:RadTreeView>
                        </div>
                    </div>
                </div>
            </telerik:RadPane>
        </telerik:RadSplitter>
    </telerik:RadPane>
</telerik:RadSplitter>

<input id="hiddenCheckedNodeIds" type="hidden" runat="server" />
<input id="hiddenXML" runat="server" type="hidden" />
<asp:Label ID="lbOnlyAvailable" runat="server" Visible="False"></asp:Label>
<asp:Label ID="lbShowMember" runat="server" Visible="False" meta:resourcekey="lbShowMemberResource1"></asp:Label>
<asp:Label ID="lbShowSubDept" runat="server" Visible="False" meta:resourcekey="lbShowSubDeptResource1"></asp:Label>
<asp:Label ID="lbKind" runat="server" Visible="False" meta:resourcekey="lbKindResource1"></asp:Label>
<asp:Label ID="lbByFunction" runat="server" Text="依職務" Visible="False" meta:resourcekey="lbByFunctionResource1"></asp:Label>
<asp:Label ID="lbByTitle" runat="server" Text="依職級" Visible="False" meta:resourcekey="lbByTitleResource1"></asp:Label>
<asp:Label ID="lbByEmployee" runat="server" Text="依人員" Visible="False" meta:resourcekey="lbByEmployeeResource1"></asp:Label>
<asp:Label ID="lbByDepartment" runat="server" Text="依部門" Visible="False" meta:resourcekey="lbByDepartmentResource1"></asp:Label>

<asp:Label ID="lbTxtMember" runat="server" Text="外部會員" Visible="False" meta:resourcekey="lbTxtMemberResource1"></asp:Label>
<asp:Label ID="lbTxtGroup" runat="server" Text="外部群組" Visible="False" meta:resourcekey="lbTxtGroupResource1"></asp:Label>
<asp:Label ID="lbTxtSubGroup" runat="server" Text="包含子群組" Visible="False" meta:resourcekey="lbTxtSubGroupResource1"></asp:Label>

<asp:Label ID="lbByMember" runat="server" Text="依外部會員" Visible="False" meta:resourcekey="lbByMemberResource1"></asp:Label>
<asp:Label ID="lbByGroup" runat="server" Text="依群組" Visible="False" meta:resourcekey="lbByGroupResource1"></asp:Label>
<span style="display: none">
    <asp:Label ID="lblErrorNotFind" runat="server" Text="找不到" meta:resourcekey="lblErrorNotFindResource1"></asp:Label>
    <asp:Label ID="lblErrorIsEnd" runat="server" Text="已經是最後一筆" meta:resourcekey="lblErrorIsEndResource1"></asp:Label>
</span>
<input id="hideUserGUID" type="hidden" runat="Server" />
<asp:HiddenField ID="hidDisplayAllDept" runat="server" Value="0" />
