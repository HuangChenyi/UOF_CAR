<%@ Page Language="C#" MasterPageFile="~/Master/DefaultMasterPage.master" AutoEventWireup="true" Inherits="EIP_Forum_AllSubjectList" Title="討論主題列表" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" Codebehind="AllSubjectList.aspx.cs" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register Src="UC_SearchResultList.ascx" TagName="UC_SearchResultList" TagPrefix="uc1" %>
<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>
<%@ Register Assembly="System.Web, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a" Namespace="System.Web.UI.HtmlControls" TagPrefix="cc1" %>
<%@ Register Assembly="System.Web, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a" Namespace="System.Web.UI" TagPrefix="cc2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <script type="text/javascript">
        function radToolBarClicking(sender, args) {
            var key = args.get_item().get_value();
            var text = args.get_item().get_text();
            var boardID = $uof.tool.htmlDecode('<%=System.Web.Security.AntiXss.AntiXssEncoder.HtmlEncode(Request.QueryString["boardid"],true)%>');
            var boardName = $uof.tool.htmlDecode('<%=System.Web.Security.AntiXss.AntiXssEncoder.HtmlEncode(Request.QueryString["boardname"],true)%>');
            switch (key) {
                case "Create":
                    args.set_cancel(true);                    
                    $uof.dialog.open2("~/EIP/Forum/CreateSubject.aspx", args.get_item(), "", 1024, 768, CreateResult, { "boardid": boardID });
                    break;
                case "Search":
                    var result = $uof.pageMethod.sync("TornadoSearchEnabled", []);
                    if (result == 'false') {
                        ClearSiteMapNode();
                        AddSiteMapNodeWithLink(boardName, 'AllSubjectList.aspx?boardid=' + boardID + "&boardname=" + escape(boardName));
                        AddSiteMapNode(text);
                    }
                    //有使用龍捲風權限
                    else {
                        var keywordCid = $uof.tool.htmlDecode('<%=System.Web.Security.AntiXss.AntiXssEncoder.HtmlEncode(hfKeyworCID.Value,true)%>')
                        var keyword = $("#" + keywordCid).val();
                        if (keyword == "") {
                            alert('<%=Ede.Uof.Utility.Page.Common.Resource.GetResource("Common","ErrorNotAllowEmpty", Ede.Uof.EIP.SystemInfo.Current.Culture) %>');
                    } else {
                         var msg = checkStrPass(keyword, "Normal");
                         if (msg != "PASS") {
                            alert('<%=lblErrmsg.Text %>' + msg);
                         args.set_cancel(true);
                        }
                      }
                    }               
                break;
                case "AdvanceSearch":
                    args.set_cancel(true);
                    $uof.dialog.open2("~/EIP/Forum/AdvanceSearch.aspx", args.get_item(), "", 700, 650, AdvanceSearchResult, { "boardid": boardID });
                break;
            case "ReturnForum":
                return;
                break;
        }
        }

        function CreateResult(returnValue) {
            if (typeof (returnValue) == 'undefined') {
                return false;
            }
            else {
                ClearSiteMapNode();
                var boardID = $uof.tool.htmlDecode('<%=System.Web.Security.AntiXss.AntiXssEncoder.HtmlEncode(Request.QueryString["boardid"],true)%>');
                var boardName = $uof.tool.htmlDecode('<%=System.Web.Security.AntiXss.AntiXssEncoder.HtmlEncode(Request.QueryString["boardname"],true)%>');
                AddSiteMapNodeWithLink(boardName, 'AllSubjectList.aspx?boardid=' + boardID + "&boardname=" + escape(boardName));
                return true;
            }
        }

        function AdvanceSearchResult(returnValue){
            if (typeof (returnValue) == 'undefined') {
                return false;
            }
            else {
                ClearSiteMapNode();
                var boardID = $uof.tool.htmlDecode('<%=System.Web.Security.AntiXss.AntiXssEncoder.HtmlEncode(Request.QueryString["boardid"],true)%>');
                var boardName = $uof.tool.htmlDecode('<%=System.Web.Security.AntiXss.AntiXssEncoder.HtmlEncode(Request.QueryString["boardname"],true)%>');
                AddSiteMapNodeWithLink(boardName, 'AllSubjectList.aspx?boardid=' + boardID + "&boardname=" + escape(boardName));
                AddSiteMapNode('<%=UC_SearchResultList1.Title %>');
                return true;
            }
        }

        /// <summary> 
        /// 檢查是否有特殊字元
        /// </summary> 
        function checkStrPass(str, source) {
            var illegalch;
            if (source == "Normal")
                illegalCh = new Array("\'", "\''\'", "\"\"", ">", "<", ";", "+", "--", "/\"", ":", "/", "\\"); // 特殊字元
            else {

                illegalCh = new Array("\'", "\''\'", "\"\"", ">", "<", ";", "+", "--", "*", "/\"", "?", "|", "\"", "*", ":", "/", "\\", "&"); // 特殊字元
            }
            var sqlCmd = new Array("select", "update", "insert", "union", "delete", "drop"); // sql指令
            var msg = "";

            if (typeof (str) !== 'undefined' && str != "" && str.length > 0) {
                for (var key in illegalCh) { // 先檢查特殊字元
                    if (str.indexOf(illegalCh[key]) != -1) {
                        if (msg == "") {
                            msg += illegalCh[key];
                        } else {
                            msg += (" " + illegalCh[key]);
                        } // end else

                    } // end if
                } // end for()

                str = str.toLowerCase(); // 統一轉小寫比較
                for (var key in sqlCmd) { // 再檢查sql指令
                    var address = str.indexOf(sqlCmd[key]);
                    if (address == 0) { // 在起始位置發現，檢查下個字元是否為空白
                        if (str.charAt(sqlCmd[key].length) == " ") { // 是空白
                            if (msg == "") {
                                msg += sqlCmd[key];
                            } else {
                                msg += (" " + sqlCmd[key]);
                            } // end else
                        } // end if
                    } else if (address > 0) { // 在中間發現，分別檢查上下字元是否為空白
                        if (str.charAt(address - 1) == " ") { // 上個字元是空白
                            if (str.length == address + sqlCmd[key].length) { // 他在字串最末端，後面不用檢查了
                                if (msg == "") {
                                    msg += sqlCmd[key];
                                } else {
                                    msg += (" " + sqlCmd[key]);
                                } // end else
                            } else { // 在字串中間，要檢查下一個
                                if (str.charAt(address + sqlCmd[key].length) == " ") { // 前後都空白-->非法
                                    if (msg == "") {
                                        msg += sqlCmd[key];
                                    } else {
                                        msg += (" " + sqlCmd[key]);
                                    } // end else
                                } // end if
                            } // end else
                        } // end if
                    } // end else if
                } // end for()

                // 有找到可疑輸入回傳msg，否則回傳true
                if (msg != "") {
                    return msg;
                } else {
                    return "PASS";
                } // end else
            } else {
                return "PASS";
            } // end else

        } // end checkStrPass()
    </script>

    <script type="text/javascript">
        $(resizeStuff);
        var TO = false;
        $(window).resize(function () {
            if (TO !== false)
                clearTimeout(TO);
            TO = setTimeout(resizeStuff, 200);
        });

        function resizeStuff() {

            var sprNone = $("#<%=lblNone.ClientID %>").val();
            sprNone.innerText = "";
            sprNone.width = ($("body").width() - 620) + 'px';
            var i = 0;

            var maxCount = ($("body").width() - 620) / 4;
            if ($("#HeadRow").width() > $("body").width()) {
                maxCount = ($("#HeadRow").width() - 620) / 4;
            }

            for (i = 0; i <= maxCount; i++) {
                sprNone.innerText += " ";
            }
        }
    </script>
    <table  style="height: auto;width:100%;"">
        <tr>
            <td style="height: 600px; max-height: inherit; vertical-align: top; white-space:nowrap">
                <asp:CustomValidator ID="cvReadAuthority" runat="server" ErrorMessage="沒有權限閱讀" meta:resourcekey="cvReadAuthorityResource1" ForeColor="Red"></asp:CustomValidator>
                <table border="0" cellpadding="0" cellspacing="0" style="width:100%">
                    <tr>
                        <td>
                            <asp:UpdatePanel ID="UpdatePanel3" runat="server" UpdateMode="conditional">
                                <ContentTemplate>
                                    <telerik:RadToolBar ID="RadToolBar1" runat="server" Width="100%" OnButtonClick="RadToolBar1_OnButtonClick" OnClientButtonClicking="radToolBarClicking">
                                        <Items>
                                            <telerik:RadToolBarButton runat="server" Text="新增主題" Value="Create"
                                                CheckedImageUrl="~/Common/Images/Icon/icon_m12.gif"
                                                DisabledImageUrl="~/Common/Images/Icon/icon_m12.gif"
                                                HoveredImageUrl="~/Common/Images/Icon/icon_m12.gif"
                                                ImageUrl="~/Common/Images/Icon/icon_m12.gif"
                                                meta:resourceKey="RadToolBarCreateResource1">
                                            </telerik:RadToolBarButton>
                                            <telerik:RadToolBarButton IsSeparator="true"></telerik:RadToolBarButton>
                                            <telerik:RadToolBarButton runat="server" Text="本版精華區" Value="Essence"
                                                CheckedImageUrl="~/Common/Images/Icon/icon_m63.gif"
                                                DisabledImageUrl="~/Common/Images/Icon/icon_m63.gif"
                                                HoveredImageUrl="~/Common/Images/Icon/icon_m63.gif"
                                                ImageUrl="~/Common/Images/Icon/icon_m63.gif"
                                                meta:resourceKey="RadToolBarEssenceResource1">
                                            </telerik:RadToolBarButton>
                                            <telerik:RadToolBarButton IsSeparator="true"></telerik:RadToolBarButton>
                                            <telerik:RadToolBarButton runat="server" Text="返回主題列表" Value="ReturnForum"
                                                CheckedImageUrl="~/Common/Images/Icon/icon_m62.gif"
                                                DisabledImageUrl="~/Common/Images/Icon/icon_m62.gif"
                                                HoveredImageUrl="~/Common/Images/Icon/icon_m62.gif"
                                                ImageUrl="~/Common/Images/Icon/icon_m62.gif"
                                                meta:resourceKey="RadToolBarReturnForumResource1">
                                            </telerik:RadToolBarButton>
                                            <telerik:RadToolBarButton IsSeparator="true"></telerik:RadToolBarButton>
                                            <telerik:RadToolBarButton runat="server" Value="text">
                                                <ItemTemplate>
                                                    <asp:TextBox ID="KeyWord" runat="server"></asp:TextBox>
                                                </ItemTemplate>
                                            </telerik:RadToolBarButton>
                                            <telerik:RadToolBarButton runat="server" Text="搜尋" Value="Search"
                                                CheckedImageUrl="~/Common/Images/Icon/icon_m39.gif"
                                                DisabledImageUrl="~/Common/Images/Icon/icon_m39.gif"
                                                HoveredImageUrl="~/Common/Images/Icon/icon_m39.gif"
                                                ImageUrl="~/Common/Images/Icon/icon_m39.gif"
                                                meta:resourceKey="RadToolBarSearchResource1">
                                            </telerik:RadToolBarButton>
                                            <telerik:RadToolBarButton IsSeparator="true"></telerik:RadToolBarButton>
                                            <telerik:RadToolBarButton runat="server" Text="進階搜尋" Value="AdvanceSearch"
                                                CheckedImageUrl="~/Common/Images/Icon/icon_m64.gif"
                                                DisabledImageUrl="~/Common/Images/Icon/icon_m64.gif"
                                                HoveredImageUrl="~/Common/Images/Icon/icon_m64.gif"
                                                ImageUrl="~/Common/Images/Icon/icon_m64.gif"
                                                meta:resourceKey="RadToolBarAdvanceSearchResource1">
                                            </telerik:RadToolBarButton>
                                            <telerik:RadToolBarButton Value="separatorOne" IsSeparator="true"></telerik:RadToolBarButton>
                                            <telerik:RadToolBarButton runat="server" Value="datasource">
                                                <ItemTemplate>
                                                    <asp:HiddenField ID="hideDatasource" runat="server" />
                                                </ItemTemplate>
                                            </telerik:RadToolBarButton>
                                        </Items>
                                    </telerik:RadToolBar>
                                    <asp:Label ID="lblNone" runat="server" Text=""></asp:Label>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </td>
                    </tr>
                    <tr>
                        <td style="white-space:nowrap">
                            <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                                <ContentTemplate>
                                    <Fast:Grid ID="Grid1" runat="server" AutoGenerateCheckBoxColumn="False" Width="100%"
                                        AllowSorting="True" OnRowDataBound="Grid1_RowDataBound"
                                        AutoGenerateColumns="False" DataKeyNames="TOPIC_GUID" DataSourceID="ObjectDataSource2"
                                        OnRowCommand="Grid1_RowCommand" EmptyDataText="沒有置頂主題"
                                        DataKeyOnClientWithCheckBox="False"
                                        meta:resourcekey="Grid1Resource2" PageSize="15">
                                        <EnhancePagerSettings FirstAltImageUrl="" FirstImageUrl="" LastAltImage=""
                                            LastImageUrl="" NextIAltImageUrl="" NextImageUrl="" PageInfoCssClass=""
                                            PageNumberCssClass="" PageNumberCurrentCssClass="" PageRedirectCssClass=""
                                            PreviousAltImageUrl="" PreviousImageUrl="" ShowHeaderPager="True" />
                                        <ExportExcelSettings AllowExportToExcel="False" />
                                        <Columns>
                                            <asp:TemplateField HeaderText="標題" SortExpression="SUBJECT" meta:resourcekey="TemplateFieldResource1" ItemStyle-Width="50%">
                                                <ItemTemplate>
                                                    <asp:HyperLink runat="server" ID="HyperLink3" meta:resourceKey="HyperLink3Resource1"></asp:HyperLink>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="作者" SortExpression="ANNOUNCER" meta:resourcekey="TemplateFieldResource2" ItemStyle-Width="200px" ItemStyle-Wrap="false">
                                                <ItemTemplate>
                                                    <asp:Label runat="server" ID="lblAnnounce" meta:resourceKey="lblAnnounceResource1"></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="最後發表" meta:resourcekey="TemplateFieldResource3" ItemStyle-Width="200px" ItemStyle-Wrap="false">
                                                <ItemTemplate>
                                                    <asp:Label runat="server" ID="lblLastUser" meta:resourceKey="lblLastUserResource1"></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:BoundField DataField="REPLY_TIMES" HeaderText="回覆數" SortExpression="REPLY_TIMES" meta:resourcekey="BoundFieldResource1" HeaderStyle-Width="100px" ItemStyle-HorizontalAlign="Center" />
                                            <asp:BoundField DataField="READ_TIMES" HeaderText="查看" SortExpression="READ_TIMES" meta:resourcekey="BoundFieldResource2" HeaderStyle-Width="100px" ItemStyle-HorizontalAlign="Center"/>
                                            <asp:BoundField DataField="RECOMMEND_TIMES" HeaderText="推薦" SortExpression="RECOMMEND_TIMES" meta:resourcekey="BoundFieldResource3" HeaderStyle-Width="100px" ItemStyle-HorizontalAlign="Center"/>
                                            <asp:ButtonField HeaderText="操作" Text="取消置頂" CommandName="Cancel" meta:resourcekey="ButtonFieldResource1" HeaderStyle-Width="150px"/>
                                        </Columns>
                                    </Fast:Grid>
                                </ContentTemplate>
                                <Triggers>
                                    <asp:AsyncPostBackTrigger ControlID="RadToolBar1" EventName="ButtonClick" />
                                </Triggers>
                            </asp:UpdatePanel>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="conditional">
                                <ContentTemplate>
                                    <asp:Label ID="Label2" runat="server" meta:resourcekey="Label2Resource1"></asp:Label><br />
                                    <Fast:Grid ID="Grid2" runat="server" AutoGenerateCheckBoxColumn="False" Width="100%"
                                        AllowSorting="True" AutoGenerateColumns="False"
                                        DataKeyNames="TOPIC_GUID" DataSourceID="ObjectDataSource1" OnRowDataBound="Grid2_RowDataBound"
                                        AllowPaging="True"
                                        PageSize="30"
                                        DataKeyOnClientWithCheckBox="False"
                                        OnPageIndexChanging="Grid2_PageIndexChanging">
                                        <EnhancePagerSettings FirstAltImageUrl="" FirstImageUrl="" LastAltImage=""
                                            LastImageUrl="" NextIAltImageUrl="" NextImageUrl="" PageInfoCssClass=""
                                            PageNumberCssClass="" PageNumberCurrentCssClass="" PageRedirectCssClass=""
                                            PreviousAltImageUrl="" PreviousImageUrl="" ShowHeaderPager="True" />
                                        <ExportExcelSettings AllowExportToExcel="False" />
                                        <Columns>
                                            <asp:TemplateField meta:resourcekey="TemplateFieldResource4">
                                                <ItemStyle  HorizontalAlign="Center" Width="22px" />
                                                <ItemTemplate>
                                                    <div style="width:20px;">
                                                    <asp:Image runat="server" DescriptionUrl="~/Common/Images/Icon05.gif" ID="Image1" meta:resourceKey="Image1Resource1"></asp:Image>
                                                        </div>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="標題" SortExpression="SUBJECT" meta:resourcekey="TemplateFieldResource5" ItemStyle-Width="900px">
                                                <ItemTemplate>
                                                    <asp:HyperLink runat="server" ID="HyperLink2" meta:resourceKey="HyperLink2Resource1"></asp:HyperLink>
                                                </ItemTemplate>
                                                <ItemStyle Width="900px" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="作者" SortExpression="ANNOUNCER" meta:resourcekey="TemplateFieldResource6" ItemStyle-Width="200px" ItemStyle-Wrap="false">
                                                <ItemTemplate>
                                                    <asp:Label runat="server" ID="lblAuthor" meta:resourceKey="lblAuthorResource1"></asp:Label>


                                                </ItemTemplate>
                                                <ItemStyle Width="200px" Wrap="False" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="張貼時間" SortExpression="CREATE_DATE" meta:resourcekey="BoundFieldResource4">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblCreateDate" runat="server" Text='<%# Bind("CREATE_DATE") %>'></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle Width="120px" Wrap="False" />
                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderText="最後發表" meta:resourcekey="TemplateFieldResource7" ItemStyle-Width="200px" ItemStyle-Wrap="false">
                                                <ItemTemplate>
                                                    <asp:Label runat="server" ID="lblLastUser" meta:resourceKey="lblLastUserResource2"></asp:Label>


                                                </ItemTemplate>
                                                <ItemStyle Width="200px" Wrap="False" />
                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderText="回覆時間" SortExpression="LAST_REPLY_DATE" meta:resourcekey="BoundFieldResource5">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblLastReplyDate" runat="server" Text='<%# Bind("LAST_REPLY_DATE") %>'></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle Width="120px" Wrap="False" />
                                            </asp:TemplateField>

                                            <asp:BoundField DataField="REPLY_TIMES" HeaderText="回覆" ItemStyle-Wrap="false"
                                                SortExpression="REPLY_TIMES" meta:resourcekey="BoundFieldResource6" ItemStyle-Width="120px" >
                                            <HeaderStyle Width="100px" />
                                            <ItemStyle HorizontalAlign="Center" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="READ_TIMES" HeaderText="查看" SortExpression="READ_TIMES" meta:resourcekey="BoundFieldResource7" HeaderStyle-Width="100px" ItemStyle-HorizontalAlign="Center">
                                            <HeaderStyle Width="100px" />
                                            <ItemStyle HorizontalAlign="Center" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="RECOMMEND_TIMES" HeaderText="推薦" SortExpression="RECOMMEND_TIMES" meta:resourcekey="BoundFieldResource8" HeaderStyle-Width="100px" ItemStyle-HorizontalAlign="Center">
                                            <HeaderStyle Width="100px" />
                                            <ItemStyle HorizontalAlign="Center" />
                                            </asp:BoundField>

                                        </Columns>
                                        <HeaderStyle Wrap="False" />
                                    </Fast:Grid>
                                    <uc1:UC_SearchResultList ID="UC_SearchResultList1" runat="server" Visible="false" />
                                </ContentTemplate>
                                <Triggers>
                                    <asp:AsyncPostBackTrigger ControlID="RadToolBar1" EventName="ButtonClick" />
                                    <asp:AsyncPostBackTrigger ControlID="Grid1" EventName="RowCommand" />
                                </Triggers>
                            </asp:UpdatePanel>
                        </td>
                    </tr>
                    <tr>
                        <td align="left">
                            <asp:Label ID="Label1" runat="server" Text="版主:" meta:resourcekey="Label1Resource1"></asp:Label>
                            <asp:Label ID="lblMaster" runat="server" meta:resourcekey="lblMasterResource1"></asp:Label></td>
                    </tr>

                </table>
                <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="GetAllTopic"
                    TypeName="Ede.Uof.EIP.Forum.ReadArticleUCO" OnSelected="ObjectDataSource1_Selected">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="hideUser" Name="userGUID" PropertyName="Value" Type="String" />
                        <asp:QueryStringParameter Name="boardID" QueryStringField="boardid" Type="String" />
                    </SelectParameters>
                </asp:ObjectDataSource>
                <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" SelectMethod="GetTopTopic"
                    TypeName="Ede.Uof.EIP.Forum.ReadArticleUCO" OnSelected="ObjectDataSource2_Selected">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="hideUser" Name="userGUID" PropertyName="Value" Type="String" />
                        <asp:QueryStringParameter Name="boardID" QueryStringField="boardid" Type="String" />
                    </SelectParameters>
                </asp:ObjectDataSource>
                <asp:ObjectDataSource ID="ObjectDataSource3" runat="server" SelectMethod="Search"
                    TypeName="Ede.Uof.EIP.Forum.ReadArticleUCO">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="hideUser" Name="userGUID" PropertyName="Value" Type="String" />
                        <asp:QueryStringParameter Name="boardGUID" QueryStringField="boardid" Type="String" />
                        <asp:ControlParameter ControlID="hideKeyWord" Name="likeText" PropertyName="Value" Type="String" />
                    </SelectParameters>
                </asp:ObjectDataSource>
                <input id="hideUser" runat="server" type="hidden" />
                <input id="hideKeyWord" runat="server" type="hidden" />
                <input id="hideBoardmaster" type="hidden" runat="server" />
                <asp:Label ID="msgNone" runat="server" Text="無" Visible="False" meta:resourcekey="msgNoneResource1"></asp:Label>
                <asp:Label ID="msgAnonymous" runat="server" Text="匿名" Visible="False" meta:resourcekey="msgAnonymousResource1"></asp:Label>
                <asp:Label ID="lblNotAllowEmpty" runat="server" Text="不允許空白!" Visible="False" meta:resourcekey="lblNotAllowEmptyResource1"></asp:Label>
                <asp:Label ID="lblErrmsg" runat="server" Text="關鍵字請勿輸入符號或指令" Visible="false" meta:resourcekey="lblErrmsgResource1"></asp:Label>
                <asp:HiddenField ID="hfKeyworCID" runat="server" />
            </td>
        </tr>
    </table>

</asp:Content>
