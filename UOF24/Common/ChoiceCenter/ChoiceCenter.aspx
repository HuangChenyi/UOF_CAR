<%@ Page Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="Common_ChoiceCenter_ChoiceCenter" Title="選取人員"
    Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" Codebehind="ChoiceCenter.aspx.cs" %>

<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>

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
    <telerik:RadSplitter ID="Radsplitter1" runat="server" Orientation="Horizontal"
        Width="100%" Height="100%" LiveResize="True" FullScreenMode="True" meta:resourcekey="Radsplitter1Resource1" SplitBarsSize="">
        <telerik:RadPane ID="PanTop" runat="server" Scrolling="None" Index="0" meta:resourcekey="PanTopResource1">
            <telerik:RadSplitter ID="Radsplitter2" runat="server" Height="100%" LiveResize="True" OnClientLoad="Radsplitter2afterResize" OnClientResized="Radsplitter2afterResize" meta:resourcekey="Radsplitter2Resource1" OnClientLoaded="Radsplitter2afterResize" SplitBarsSize="" >
                <telerik:RadPane ID="PanLeft" runat="server" Width="33%" MinWidth="330" Index="0" meta:resourcekey="PanLeftResource1">
                    <div id="flashMessage" style="float:right;color:red;display:none;" class="SizeL">
                        <asp:Label ID="lbMsg" runat="server" Text="已加入" meta:resourcekey="lbMsgResource1"></asp:Label>
                    </div>
                    <div>
                        <telerik:RadButton runat="server" id="rdbtnAllClear" Text="全部清除" CausesValidation="False" OnClientClicked="rdbtnAllClear_OnClientClicked" AutoPostBack="False" meta:resourcekey="rdbtnAllClearResource1"></telerik:RadButton>
                    </div>
                    <div style="height: 30px">
                        <asp:Label ID="lblResultPage" runat="server" Text="頁次:" meta:resourcekey="lblResultPageResource1" />
                        <span id="ResultPageSize" style="color:blue">0/0</span>&nbsp; 
                        <a href="#" id="ResultPrevPage"><asp:Literal ID="msgPrevPage2" runat="server" Text="上一頁" meta:resourcekey="msgPrevPage2Resource1" /></a>&nbsp; 
                        <a href="#" id="ResultNextPage"><asp:Literal ID="msgNextPage2" runat="server" Text="下一頁" meta:resourcekey="msgNextPage2Resource1" /></a>&nbsp; 
                        <asp:Label ID="lbResultCount" runat="server" Text="筆數:" meta:resourcekey="lbResultCountResource1" />
                        <span id="ResultCount" style="color:blue">0</span>
                    </div>
                    <div>
                        <telerik:RadTreeView ID="treeResult" runat="server" OnClientNodeClicked="treeResult_NodeClicked" meta:resourcekey="treeResultResource1" EnableNodeTextHtmlEncoding="True"></telerik:RadTreeView>
                    </div>
                </telerik:RadPane>

                <telerik:RadPane ID="PanRight" runat="server" Scrolling="None" MinWidth="640" Index="1" meta:resourcekey="PanRightResource1" >
                    <div id="tabStripDiv" style="height:auto;padding:2px">
                        <telerik:RadTabStrip ID="RadTabStrip1" runat="server" OnClientTabSelected="onClientTabSelected" SelectedIndex="0" meta:resourcekey="RadTabStrip1Resource1">
                            <Tabs>
                                <telerik:RadTab runat="server" Text="部門" Value="Department" meta:resourcekey="RadTabResource1" Selected="True" >
                                </telerik:RadTab>
                                <telerik:RadTab runat="server" Text="員工" Value="DepartmentUser" meta:resourcekey="RadTabResource2">
                                </telerik:RadTab>
                                <telerik:RadTab runat="server" Text="職級" Value="JobTitle" meta:resourcekey="RadTabResource3">
                                </telerik:RadTab>
                                <telerik:RadTab runat="server" Text="職務" Value="JobFunction" meta:resourcekey="RadTabResource4">
                                </telerik:RadTab>
                                <telerik:RadTab runat="server" Text="部門+職級" Value="DepartmentJobTitle" meta:resourcekey="RadTabResource5">
                                </telerik:RadTab>
                                <telerik:RadTab runat="server" Text="部門+職務" Value="DepartmentJobFunction" IsBreak="True" meta:resourcekey="RadTabResource6">
                                </telerik:RadTab>
                                <telerik:RadTab runat="server" Text="外部群組" Value="Group" meta:resourcekey="RadTabResource7">
                                </telerik:RadTab>
                                <telerik:RadTab runat="server" Text="外部會員" Value="GroupUser" meta:resourcekey="RadTabResource8">
                                </telerik:RadTab>
                                <telerik:RadTab runat="server" Text="會員類別" Value="MemberClass" meta:resourcekey="RadTabResource9">
                                </telerik:RadTab>
                                <telerik:RadTab runat="server" Text="外部群組+類別" Value="GroupMemberClass" meta:resourcekey="RadTabResource10">
                                </telerik:RadTab>
                                <telerik:RadTab runat="server" Text="常用組合" Value="Favorite" meta:resourcekey="RadTabResource11">
                                </telerik:RadTab>
                            </Tabs>
                        </telerik:RadTabStrip>
                    </div>    
                    <div id="divTreeContainer">
                        <div id="divDepartment" class="divContainer" >
                            <div style="height: 25px;clear:both;white-space:nowrap;text-overflow:ellipsis; " >
                                <div style="float:left;margin:2px;">
                                    <input id="txbKeyWordDept" size="10" type="text"  style="width:200px"/>
                                </div>
                                <div>
                                    <telerik:RadButton ID="RadButton1" runat="server" Text="Find" OnClientClicking="onSearchDeptFindClicking" meta:resourcekey="RadButton1Resource1"></telerik:RadButton>
                                </div>
                            </div>
                            <div style="height: 25px;clear:both" id="divAllowSubDept">
                                <asp:CheckBox ID="cbAllowSubDept" runat="server" Text="包含子部門" Checked="true" meta:resourcekey="cbAllowSubDeptResource2" />
                            </div>
                            <div class="divTreeBody" style=" text-align:left;clear:both;">
                                <telerik:RadTreeView ID="treeDepartment" runat="server" Height="100%" Width="100%" ShowLineImages="False" OnClientNodeClicked="treeDepartment_NodeClicked" EnableNodeTextHtmlEncoding="True" meta:resourcekey="treeDepartmentResource1"></telerik:RadTreeView>
                            </div>
                        </div>
                        <div id="divGroup" class="divContainer">
                            <div style="height: 25px;clear:both;white-space:nowrap;text-overflow:ellipsis;">
                                <div style="float:left;margin:2px;">
                                    <input id="txbKeyWordGroup" size="10" type="text" style="width:200px;" />
                                </div>
                                <div>
                                    <telerik:RadButton ID="RadButton3" runat="server" Text="Find" OnClientClicking="onSearchGroupFindClicking" meta:resourcekey="RadButton3Resource1"></telerik:RadButton>
                                </div>
                            </div>
                            <div style="height: 25px;clear:both" id="divAllowSubGroup">
                                <asp:CheckBox ID="cbAllowSubGroup" runat="server" Text="包含子群組" Checked="true" meta:resourcekey="cbAllowSubGroupResource1" />
                            </div>
                            <div class="divTreeBody" style=" text-align:left;clear:both;">
                                <telerik:RadTreeView ID="treeGroup" runat="server" Height="100%" Width="100%" ShowLineImages="False" OnClientNodeClicked="treeGroup_NodeClicked" EnableNodeTextHtmlEncoding="True" meta:resourcekey="treeGroupResource2"></telerik:RadTreeView>
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
                            <div style="height: 25px;clear:both">
                                <div id="SearchUserDiv">
                                    <asp:Label ID="lblSearchUserPage" runat="server" Text="頁次:" meta:resourcekey="lblSearchUserPageResource1" />
                                    <span id="SearchUserPageSize" style="color:blue">0/0</span>&nbsp; 
                                    <a href="#" id="SearchUserPrevPage"><asp:Literal ID="msgPrevPage" runat="server" Text="上一頁" meta:resourcekey="msgPrevPageResource1" /></a>&nbsp; 
                                    <a href="#" id="SearchUserNextPage"><asp:Literal ID="msgNextPage" runat="server" Text="下一頁" meta:resourcekey="msgNextPageResource1" /></a>&nbsp; 
                                    <asp:Label ID="lbSearchUserCount" runat="server" Text="筆數:" meta:resourcekey="lbSearchUserCountResource1" />
                                    <span id="SearchUserCount" style="color:blue">0</span>
                                </div>
                            </div>
                            <div class="divTreeBody">
                                <telerik:RadTreeView ID="treeUser" runat="server" Height="100%" Width="100%" ShowLineImages="False" OnClientNodeClicked="treeUser_NodeClicked" EnableNodeTextHtmlEncoding="True" meta:resourcekey="treeUserResource1"></telerik:RadTreeView>
                            </div>
                        </div>
                        <div id="divJobTitle" class="divContainer">
                            <div style="height: 50px"></div>
                            <div class="divTreeBody">
                                <telerik:RadTreeView ID="treeJobTitle" runat="server" Height="100%" Width="100%" ShowLineImages="False" OnClientNodeClicked="treeJobTitle_NodeClicked" EnableNodeTextHtmlEncoding="True" meta:resourcekey="treeJobTitleResource1"></telerik:RadTreeView>
                            </div>
                        </div>
                        <div id="divJobFunction" class="divContainer">
                            <div style="height: 50px"></div>
                            <div class="divTreeBody">
                                <telerik:RadTreeView ID="treeJobFunction" runat="server" Height="100%" Width="100%" ShowLineImages="False" OnClientNodeClicked="treeJobFunction_NodeClicked" EnableNodeTextHtmlEncoding="True" meta:resourcekey="treeJobFunctionResource1"></telerik:RadTreeView>
                            </div>
                        </div>
                        <div id="divMemberClass" class="divContainer">
                            <div style="height: 50px"></div>
                            <div class="divTreeBody">
                                <telerik:RadTreeView ID="treeMemberClass" runat="server" Height="100%" Width="100%" ShowLineImages="False" OnClientNodeClicked="treeMemberClass_NodeClicked" EnableNodeTextHtmlEncoding="True" meta:resourcekey="treeMemberClassResource2"></telerik:RadTreeView>
                            </div>
                        </div>
                        <div id="divFavorite" class="divContainer">
                            <div style="height: 50px"></div>
                            <div class="divTreeBody">
                                <telerik:RadTreeView ID="treeFavorite" runat="server" Height="100%" Width="100%" ShowLineImages="False" OnClientNodeClicked="treeFavorite_NodeClicked" EnableNodeTextHtmlEncoding="True" meta:resourcekey="treeFavoriteResource2"></telerik:RadTreeView>
                            </div>
                        </div>
                    </div>          
                </telerik:RadPane>
            </telerik:RadSplitter>
        </telerik:RadPane>
        <telerik:RadPane ID="PanButtom" runat="server" Height="50px" Index="1" Scrolling="None" meta:resourcekey="PanButtomResource1">
              <asp:Panel ID="panelIcon" runat="server" meta:resourcekey="panelIconResource1">
        <table border="0" width="100%">
            <tr>
                <td nowrap="noWrap">
                    <asp:Image ID="Image1" runat="server" ImageUrl="~/Common/Images/Icon/icon_m01.png"
                        meta:resourcekey="Image1Resource1" /><asp:Label ID="Label4" runat="server" Text="部門"
                            meta:resourcekey="Label4Resource1"></asp:Label></td>
                <td nowrap="noWrap">
                    <asp:Image ID="Image2" runat="server" ImageUrl="~/Common/Images/Icon/icon_m17.png"
                        meta:resourcekey="Image2Resource1" /><asp:Label ID="Label5" runat="server" Text="員工"
                            meta:resourcekey="Label5Resource1"></asp:Label></td>
                <td nowrap="noWrap">
                    <asp:Image ID="Image3" runat="server" ImageUrl="~/Common/Images/Icon/icon_m18.png"
                        meta:resourcekey="Image3Resource1" /><asp:Label ID="Label1" runat="server" Text="職級"
                            meta:resourcekey="Label1Resource1"></asp:Label></td>
                <td nowrap="noWrap">
                    <asp:Image ID="Image5" runat="server" ImageUrl="~/Common/Images/Icon/icon_m19.png"
                        meta:resourcekey="Image5Resource1" /><asp:Label ID="Label10" runat="server" Text="職務"
                            meta:resourcekey="Label10Resource1"></asp:Label></td>
                <td nowrap="noWrap">
                    <asp:Image ID="Image7" runat="server" ImageUrl="~/Common/Images/Icon/icon_m20.png"
                        meta:resourcekey="Image7Resource1" /><asp:Label ID="Label11" runat="server" Text="部門+職級"
                            meta:resourcekey="Label11Resource1"></asp:Label></td>
                <td nowrap="noWrap">
                    <asp:Image ID="Image9" runat="server" ImageUrl="~/Common/Images/Icon/icon_m21.png"
                        meta:resourcekey="Image9Resource1" /><asp:Label ID="Label6" runat="server" Text="部門+職務"
                            meta:resourcekey="Label6Resource1"></asp:Label></td>
                <td nowrap="noWrap">
                    <asp:Image ID="Image4" runat="server" ImageUrl="~/Common/Images/Icon/icon_m22.png"
                        meta:resourcekey="Image4Resource1" /><asp:Label ID="Label7" runat="server" Text="部門(含子部門)"
                            meta:resourcekey="Label7Resource1"></asp:Label></td>
                <td nowrap="noWrap">
                    <asp:Image ID="Image8" runat="server" ImageUrl="~/Common/Images/Icon/icon_m23.png"
                        meta:resourcekey="Image8Resource1" /><asp:Label ID="Label8" runat="server" Text="部門+職級(含子部門)"
                            meta:resourcekey="Label8Resource1"></asp:Label></td>
                <td nowrap="noWrap">
                    <asp:Image ID="Image6" runat="server" ImageUrl="~/Common/Images/Icon/icon_m24.png"
                        meta:resourcekey="Image6Resource1" /><asp:Label ID="Label9" runat="server" Text="部門+職務(含子部門)"
                            meta:resourcekey="Label9Resource1"></asp:Label></td>
            </tr>
        </table>
        <table border="0" width="100%">
            <tr>
                <td nowrap="noWrap">
                    <asp:Image ID="Image10" runat="server" ImageUrl="~/Common/Images/Icon/icon_m05.png" meta:resourcekey="Image10Resource1" /><asp:Label
                        ID="Label13" runat="server" Text="外部群組" meta:resourcekey="Label13Resource1"></asp:Label></td>
                <td nowrap="noWrap">
                    <asp:Image ID="Image11" runat="server" ImageUrl="~/Common/Images/Icon/icon_m30.png" meta:resourcekey="Image11Resource1" /><asp:Label
                        ID="Label14" runat="server" Text="外部會員" meta:resourcekey="Label14Resource1"></asp:Label></td>
                <td nowrap="noWrap">
                    <asp:Image ID="Image12" runat="server" ImageUrl="~/Common/Images/Icon/icon_m137.png" meta:resourcekey="Image12Resource1" /><asp:Label
                        ID="Label15" runat="server" Text="外部群組(含子群組)" meta:resourcekey="Label15Resource1"></asp:Label></td>
                <td nowrap="noWrap">
                    <asp:Image ID="Image13" runat="server" ImageUrl="~/Common/Images/Icon/icon_m138.png" meta:resourcekey="Image13Resource1" /><asp:Label
                        ID="Label16" runat="server" Text="會員類別" meta:resourcekey="Label16Resource1"></asp:Label></td>
                <td nowrap="noWrap">
                    <asp:Image ID="Image14" runat="server" ImageUrl="~/Common/Images/Icon/icon_m139.png" meta:resourcekey="Image14Resource1" /><asp:Label
                        ID="Label17" runat="server" Text="外部群組+會員類別" meta:resourcekey="Label17Resource1"></asp:Label></td>
                <td nowrap="noWrap">
                    <asp:Image ID="Image15" runat="server" ImageUrl="~/Common/Images/Icon/icon_m140.png" meta:resourcekey="Image15Resource1" /><asp:Label
                        ID="Label18" runat="server" Text="外部群組+會員類別(含子群組)" meta:resourcekey="Label18Resource1"></asp:Label></td>
            </tr>
        </table>
    </asp:Panel>
        </telerik:RadPane>
    </telerik:RadSplitter>
    <telerik:RadCodeBlock ID="RadCodeBlock1" runat="server">
        <script type="text/javascript" src="../javascript/jQuery/plugin/jquery.ba-dotimeout.min.js"></script>
        <script src="../javascript/ChoiceCenterV2.js"></script>
        <script type="text/javascript">

            var expandToUser = '<%=System.Web.Security.AntiXss.AntiXssEncoder.HtmlEncode(ExpandToUser.ToString().ToLower(), true)%>';
            var showEmployee = '<%=System.Web.Security.AntiXss.AntiXssEncoder.HtmlEncode(ShowEmployee.ToString().ToLower(), true)%>';
            var showMember = '<%=System.Web.Security.AntiXss.AntiXssEncoder.HtmlEncode(ShowMember.ToString().ToLower(), true)%>';
            var specifiedSort = '<%=System.Web.Security.AntiXss.AntiXssEncoder.HtmlEncode(SpecifiedSort.ToString().ToLower(), true)%>';
            var chioceType = '<%=System.Web.Security.AntiXss.AntiXssEncoder.HtmlEncode(ChioceType.ToString().ToLower(), true)%>';
            var hfUserGuid = '<%=System.Web.Security.AntiXss.AntiXssEncoder.HtmlEncode(UserGuid, true)%>';
            var hfDisplayAllDept = '<%=System.Web.Security.AntiXss.AntiXssEncoder.HtmlEncode(DisplayAllDept.ToString().ToLower(), true)%>';

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
                    Group: $find("<%= treeGroup.ClientID %>"),
                    MemberClass: $find("<%= treeMemberClass.ClientID %>"),
                    Favorite: $find("<%= treeFavorite.ClientID %>"),
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
                    Choice.Config.resultUserSet.fromString($("#" + hfClientID, pd).val());
                 }

                Choice.setResultPaging();

                $('#txbKeyWordUser').keypress(function (event) {
                    if (event.keyCode == 10 || event.keyCode == 13) {
                        event.preventDefault();
                        $(this).doTimeout("findEmpName",
                            500, Choice.searchUser($uof.tool.htmlDecode(hfUserGuid), $uof.tool.htmlDecode(hfDisplayAllDept)));
                    }
                }).keyup(
                    function (event) {
                        $(this).doTimeout("findEmpName",
                            500, Choice.searchUser($uof.tool.htmlDecode(hfUserGuid), $uof.tool.htmlDecode(hfDisplayAllDept)));
                    });

                $('#txbKeyWordDept').keypress(function (event) {
                    if (event.keyCode == 10 || event.keyCode == 13) {
                        event.preventDefault();
                        $(this).doTimeout("findDeptName",
                            500, Choice.searchDepartment($uof.tool.htmlDecode(hfDisplayAllDept)));
                    }
                }).keyup(
                    function (event) {
                        $(this).doTimeout("findDeptName",
                            500, Choice.searchDepartment($uof.tool.htmlDecode(hfDisplayAllDept)));
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


                $("#SearchUserNextPage").on("click", Choice.moveUserToNextPage);
                $("#SearchUserPrevPage").on("click", Choice.moveUserToPrevPage);

                $("#ResultNextPage").on("click", Choice.moveResultToNextPage);
                $("#ResultPrevPage").on("click", Choice.moveResultToPrevPage);

                Choice.switchMode(Choice.Config.currentMode);
            });
            //#endregion initial

            //#region Tree Click 事件
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

            function treeDepartment_NodeClicked(sender, args) {
                var node = args.get_node();
                if (Choice.Config.currentMode == Choice.ChoiceType.DepartmentUser) {
                    Choice.submitSearchUser({ "action": "GetDepartmentUser", "id": node.get_value(), "displayAllDept": $uof.tool.htmlDecode(hfDisplayAllDept) });
                } else if (Choice.Config.currentMode == Choice.ChoiceType.Department) {
                    var depth = $('#<%=cbAllowSubDept.ClientID%>').is(":checked");
                    var groupId = node.get_value();
                    if (Choice.Config.expendToUser) {
                        Choice.setExpendToUser(Choice.Config.currentMode, null, groupId, depth, $uof.tool.htmlDecode(hfDisplayAllDept), $uof.tool.htmlDecode(specifiedSort));
                    } else {
                        Choice.addToResult(Choice.Config.currentMode, null, null, node.get_text(), groupId, depth);
                    }
                }
            }

            function treeGroup_NodeClicked(sender, args) {
                var node = args.get_node();
                if (Choice.Config.currentMode == Choice.ChoiceType.GroupUser) {
                    Choice.submitSearchUser({ "action": "GetGroupUser", "id": node.get_value() });
                } else if (Choice.Config.currentMode == Choice.ChoiceType.Group) {
                    var depth = $('#<%=cbAllowSubGroup.ClientID%>').is(":checked");
                    var groupId = node.get_value();
                    if (Choice.Config.expendToUser) {
                        Choice.setExpendToUser(Choice.Config.currentMode, null, groupId, depth, $uof.tool.htmlDecode(hfDisplayAllDept), $uof.tool.htmlDecode(specifiedSort));
                    } else {
                        Choice.addToResult(Choice.Config.currentMode, null, null, node.get_text(), groupId, depth);
                    }
                }
            }

            function treeUser_NodeClicked(sender, args) {
                var node = args.get_node();
                Choice.addToResult(Choice.Config.currentMode, node.get_text(), node.get_value());
            }

            function treeJobTitle_NodeClicked(sender, args) {
                var node = args.get_node();
                if (node.get_level() == 1) {
                    var id = node.get_value();
                    if (Choice.Config.currentMode == Choice.ChoiceType.JobTitle) {
                        if (Choice.Config.expendToUser) {
                            Choice.setExpendToUser(Choice.Config.currentMode, id,null, null, $uof.tool.htmlDecode(hfDisplayAllDept), $uof.tool.htmlDecode(specifiedSort));
                        } else {
                            Choice.addToResult(Choice.Config.currentMode, node.get_text(), id);
                        }
                    } else if (Choice.Config.currentMode == Choice.ChoiceType.DepartmentJobTitle) {
                        var depth = $('#<%=cbAllowSubDept.ClientID%>').is(":checked");
                        var groupNode = Choice.Config.Trees.Department.get_selectedNode();
                        var groupId = groupNode.get_value();
                        if (Choice.Config.expendToUser) {
                            Choice.setExpendToUser(Choice.Config.currentMode, id, groupId, depth, $uof.tool.htmlDecode(hfDisplayAllDept), $uof.tool.htmlDecode(specifiedSort));
                        } else {
                            Choice.addToResult(Choice.Config.currentMode, node.get_text(), id, groupNode.get_text(), groupId, depth);
                        }
                    }
                }
            }

            function treeJobFunction_NodeClicked(sender, args) {
                var node = args.get_node();
                var id = node.get_value();
                if (Choice.Config.currentMode == Choice.ChoiceType.JobFunction) {
                    if (Choice.Config.expendToUser) {
                        Choice.setExpendToUser(Choice.Config.currentMode, id, null, null, $uof.tool.htmlDecode(hfDisplayAllDept), $uof.tool.htmlDecode(specifiedSort));
                    } else {
                        Choice.addToResult(Choice.Config.currentMode, node.get_text(), node.get_value());
                    }
                } else if (Choice.Config.currentMode == Choice.ChoiceType.DepartmentJobFunction) {
                    var depth = $('#<%=cbAllowSubDept.ClientID%>').is(":checked");
                    var groupNode = Choice.Config.Trees.Department.get_selectedNode();
                    var groupId = groupNode.get_value();
                    if (Choice.Config.expendToUser) {
                        Choice.setExpendToUser(Choice.Config.currentMode, id, groupId, depth, $uof.tool.htmlDecode(hfDisplayAllDept), $uof.tool.htmlDecode(specifiedSort));
                    } else {
                        Choice.addToResult(Choice.Config.currentMode, node.get_text(), id, groupNode.get_text(), groupId, depth);
                    }
                }
            }

            function treeMemberClass_NodeClicked(sender, args) {
                var node = args.get_node();
                if (node.get_level() == 1) {
                    var id = node.get_value();
                    if (Choice.Config.currentMode == Choice.ChoiceType.MemberClass) {
                        if (Choice.Config.expendToUser) {
                            Choice.setExpendToUser(Choice.Config.currentMode, id, null, null, $uof.tool.htmlDecode(hfDisplayAllDept), $uof.tool.htmlDecode(specifiedSort));
                        } else {
                            Choice.addToResult(Choice.Config.currentMode, node.get_text(), node.get_value());
                        }
                    } else if (Choice.Config.currentMode == Choice.ChoiceType.GroupMemberClass) {
                        var depth = $('#<%=cbAllowSubGroup.ClientID%>').is(":checked");
                        var groupNode = Choice.Config.Trees.Group.get_selectedNode();
                        var groupId = groupNode.get_value();
                        if (Choice.Config.expendToUser) {
                            Choice.setExpendToUser(Choice.Config.currentMode, id, groupId, depth, $uof.tool.htmlDecode(hfDisplayAllDept), $uof.tool.htmlDecode(specifiedSort));
                        } else {
                            Choice.addToResult(Choice.Config.currentMode, node.get_text(), id, groupNode.get_text(), groupId, depth);
                        }
                    }
                }
            }

            function treeFavorite_NodeClicked(sender, args) {
                var node = args.get_node();
                $.ajax({
                    url: "ChoiceHandler.ashx",
                    type: "POST",
                    dataType: "json",
                    data: { "action": "GetFavorite", "favoriteGuid": node.get_value(), "expandToUser": $uof.tool.htmlDecode(expandToUser), "showEmployee": $uof.tool.htmlDecode(showEmployee), "showMember": $uof.tool.htmlDecode(showMember), "displayAllDept": $uof.tool.htmlDecode(hfDisplayAllDept) }
                }).done(function (response, textStatus, jqXHR) {
                    for (var i = 0; i < response.length; i++) {
                        var item = response[i];
                        var exists = false;
                        var text = "";
                        var image = "";
                        var index;
                        Choice.addToResult(item.type, item.name, item.id, item.groupName, item.groupId, item.isDepth, true);
                       
                        Choice.setResultPaging(true);
                    }
                }).fail(function (jqXHR, textStatus, errorThrown) {
                    console.error(
                        "The following error occured: " +
                            textStatus, errorThrown
                    );
                });
            }

            function treeResult_NodeClicked(sender, args) {
                var node = args.get_node();
                var attributes = node.get_attributes();
                var key = attributes.getAttribute("key");
                Choice.Config.resultUserSet.removeByKey(key);

                Choice.setResultPaging();
            }

            //#endregion Tree Click 事件

            //#region 搜尋相關事件
            function onClientTabSelected(sender, args) {
                var tab = args.get_tab();
                var mode = tab.get_value();
                $(".divContainer").hide();

                for (var name in Choice.ChoiceType) {

                    if (mode == "Department" || mode == "DepartmentJobTitle" || mode == "DepartmentJobFunction")
                        $("#divAllowSubDept").show();
                    else 
                        $("#divAllowSubDept").hide();

                    if (mode == "Group" || mode == "GroupMemberClass")
                        $("#divAllowSubGroup").show();
                    else 
                        $("#divAllowSubGroup").hide();

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
                Choice.searchUser($uof.tool.htmlDecode(hfUserGuid), $uof.tool.htmlDecode(hfDisplayAllDept));
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

    <asp:Label ID="lbAddFavorite" runat="server" Text="加到常用組合" Visible="False" meta:resourcekey="lbAddFavoriteResource1"></asp:Label>
    <asp:Label ID="lbPreView" runat="server" Text="預覽" Visible="False" meta:resourcekey="lbPreViewResource1"></asp:Label>
    <asp:Label ID="lbNoSelectedItemWarning" runat="server" Text="您沒有選取任何項目,確定要關閉嗎?" Visible="False" meta:resourcekey="lbNoSelectedItemWarningResource1"></asp:Label>
</asp:Content>