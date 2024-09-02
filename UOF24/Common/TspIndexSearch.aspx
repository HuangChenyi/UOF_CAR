<%@ Page Title="站內搜尋" Language="C#" MasterPageFile="~/Master/DefaultMasterPage.master" AutoEventWireup="true" CodeBehind="TspIndexSearch.aspx.cs" Inherits="Ede.Uof.Web.Common.TspIndexSearch" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>
<%@ Register Src="../DMS/DocStore/UC_ChooseFolder.ascx" TagName="UC_ChooseFolder" TagPrefix="uc1" %>
<%@ Register Src="ChoiceCenter/UC_ChoiceList.ascx" TagName="UC_ChoiceList" TagPrefix="uc2" %>
<%@ Register Src="~/Common/FileCenter/V3/UC_FileCenter.ascx" TagName="UC_FileCenter" TagPrefix="uc3" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <style>
        .keywordstyle {
            font-size: 120%;
            color: #6c6969;
            font-weight: bold;
        }

        .TitleStyle {
            font-size: 120%;
            font-weight: bolder;
            overflow: hidden;
            text-overflow: ellipsis;
            white-space: nowrap;
            display: inline-block;
        }

        .RadMenu .rmLeftImage {
            margin: 4px 2px 0 -3px;
            padding-bottom: 4px;
        }

        .IsLendDocTip {
            background-color:#D0D0D0; 
            border-radius:0.25rem;
            display:inline-block;
            font-size:18px;
            font-weight:bold;
            text-align:center;
            width:70px;
            transform:translateY(-8px);
        }
        .rtbMiddle{
            width:95% !important;
        }
    </style>

    <script type="text/javascript">
        Sys.Application.add_load(function () {
            if ($uof.tool.htmlDecode('<%=System.Web.Security.AntiXss.AntiXssEncoder.HtmlEncode(Request.QueryString["searchtype"],true)%>') == "dms-advance")
                $("#moduletr").hide();
            if (!$("#<%=gridDetail.ClientID %>").is(':visible')) {


                //setTimeout(function () {
                //    var a = GetRightPaneHeight();
                //    if(a != undefined)
                //        $("#tbhot").height(a);
                //}, 100)
            }
            CheckShowDatePicker();


            $(".TitleStyle").each(function () {
                if ($(this).width() > 500)
                    $(this).width(500);

            });
            var tabwidth = $(window).width() - 100;
            $(".tablestyle").each(function () {
                $(this).width(tabwidth);

            });
            //隱藏for dropdowntree trigger的radtoolbarbutton
            $("li.rtbItem.rtbBtn").each(function () {
                if ($(this).width() < 15) {
                    $(this).width(0);
                    $(this).hide();
                }
            });
            //set grid left side have some empty block
            $("tr.GridItemAlternating1S td table tbody tr td[width='10px']").each(function () {
                $(this).width(25);
            });
            $("tr.GridItemS td table tbody tr td[width='10px']").each(function () {
                $(this).width(25);
            });
            $("tr.GridItemAlternating1S td table tbody tr td:nth-last-child(1)").each(function () {
                $(this).css("padding-right", "25px");
            });
            $("tr.GridItemS td table tbody tr td:nth-last-child(1)").each(function () {
                $(this).css("padding-right", "25px");
            });

            //設訂DROPDOWNTREE模組NODE的BACKGROUND COLOR
            $("div.rddtScroll ul li[class='rtLI rtFirst rtLast'] ul:eq(0) > li.rtLI").each(function () {
                $(this).children("div:first").children("span.rtIn").css("font-size", "120%");
                $(this).children("div:first").children("span.rtIn").css("font-weight", "bold");
            });
            //font-weight: bold;

            $("#divPlaceHolder2").width($(window).width() - 50);
            $("#divPlaceHolder3").width($(window).width() - 50);

            var toolBar1 = $find("<%= RadToolBar1.ClientID %>");

            var Querystr2 = toolBar1.findItemByValue("Querystr2");

            var searchbutton = toolBar1.findItemByValue("AdvanceSearch");
            var txtkeyword = $telerik.findElement(Querystr2.get_element(), ("Keyword"));
            $(txtkeyword).keypress(function (event) {
                if (event.keyCode == 10 || event.keyCode == 13) {

                    searchbutton.click();
                }
            });
            ResizeIndexTimeLabel();

        });

        function CheckShowDatePicker() {



            var datepickstart = $find("<%= WebDateChooserBegin1.ClientID %>");
            var datepickend = $find("<%= WebDateChooserEnd1.ClientID %>");
            if ($("#<%=rbcustom.ClientID %>").is(':checked')) {
                datepickstart.get_dateInput().enable();
                datepickend.get_dateInput().enable();

                datepickstart.set_enabled(true);
                datepickend.set_enabled(true);


            }
            else {
                datepickstart.get_dateInput().disable();
                datepickend.get_dateInput().disable();

                datepickstart.set_enabled(false);
                datepickend.set_enabled(false);
            }

        }

        function CheckShowDatePicker2(val) {
            var datepickstart = $find("<%= WebDateChooserBegin1.ClientID %>");
            var datepickend = $find("<%= WebDateChooserEnd1.ClientID %>");

            if (val == "specdate") {
                datepickstart.get_dateInput().enable();
                datepickend.get_dateInput().enable();
                datepickstart.set_enabled(true);
                datepickend.set_enabled(true);
            }
            else {
                datepickstart.get_dateInput().disable();
                datepickend.get_dateInput().disable();
                datepickstart.set_enabled(false);
                datepickend.set_enabled(false);
            }
        }

        function RadToolBar1_ButtonClicking(sender, args) {
            var tabwidth = $(window).width() - 100;
            $(".tablestyle").each(function () {
                $(this).width(tabwidth);

            });
            var Key = args.get_item().get_value();
            if (Key == "AdvanceSearch") {
                var cid = $uof.tool.htmlDecode('<%= System.Web.Security.AntiXss.AntiXssEncoder.HtmlEncode(hfKeyworCID.Value,true)%>');
                var keyword = $("#" + cid).val();

                //如果都沒選擇模組則跳出訊息 請選擇要查詢的模組
                if ($("#<%=chkBulletin.ClientID %>").prop('checked')
                    || $("#<%=chkForum.ClientID %>").prop('checked')
                     || $("#<%=chkDMS.ClientID %>").prop('checked')
                     || $("#<%=chkBRIEFCASE.ClientID %>").prop('checked')
                     || $("#<%=chkWKF.ClientID %>").prop('checked')
                     || $("#<%=chkPRIVATEMSG.ClientID %>").prop('checked')) { }
                 else {
                     //跳訊息
                     alert('<%=lblNullMsg.Text %>');
                    args.set_cancel(true);
                }

                if (keyword == "") {
                    alert('<%=Ede.Uof.Utility.Page.Common.Resource.GetResource("Common","ErrorNotAllowEmpty", Ede.Uof.EIP.SystemInfo.Current.Culture) %>');
                    args.set_cancel(true);
                }
                else {
                    var msg = checkStrPass(keyword, "Normal");
                    if (msg != "PASS") {
                        alert('<%=lblErrmsg.Text %>' + msg);
                        args.set_cancel(true);
                    }
                }
            }
        }

        function OnClientNodeClicking(sender, eventArgs) {
            // alert(eventArgs.get_node().get_value());
        }
        function onkeywordclick(keyvalue) {
            $("#<%=hfKeyworCID.ClientID %>").val(keyvalue);
               //if (keyvalue != "")
               __doPostBack("<%=LinkButton2.UniqueID %>", '');
        }

        function DownloadFileWithHandler(sHandlerUrl, sUserProxyIndex) {
            $uof.download(sHandlerUrl, sUserProxyIndex);
            return false;
        }

        function OnClientEntryAdded(sender, eventArgs) {
            var selectval = eventArgs.get_entry().get_value();
            var toolBar = $find("<%= RadToolBar1.ClientID %>");
            var searchbutton = toolBar.findItemByValue("TreeSearch")
            //var itemKeyword = toolBar.findItemByValue("Querystr"); //for RadControls
            //var txtKeyword = $telerik.findElement(itemKeyword.get_element(), ("Keyword"));
            $("#<%=hideSelectNode.ClientID %>").val(selectval);
            searchbutton.click();
        }



        function ChangeMenuText(sender, args) {
            var templateName = args.get_item().get_text();

            var templateContainer = $get('templateContainer');

            templateContainer.innerHTML = templateName + ' template';
        }

        function classSearchTree_InitializeTree(sender, eventArgs) {
            var chkStatus;
            setTimeout(function () {
                var toolBar2 = $find("<%= RadToolBar1.ClientID %>");

                var dmsblock = toolBar2.findItemByValue("DMSBlock")

                // var chkSearchAllClass = $telerik.findElement(dmsblock.get_element(), ("chkSearchAllClass"));

                //  var panelbar = $telerik.findElement(dmsblock.get_element(), ("RadPanelBar1"));
                var panelbar = dmsblock.findControl("RadMenu1"); //for RadControls
                var item = panelbar.findItemByValue("DMSAdvance");
                var chkSearchAllClass = $telerik.findElement(item.get_element(), ("chkSearchAllClass"));
                chkStatus = chkSearchAllClass.checked;
                treeClassCurrent = sender;
                treeClassCurrent.set_enabled(!chkStatus);
                var treeclass = $("#treeclass");
                if ($("#<%=hideUsertype.ClientID %>").val() != 'Employee') {
                    treeclass.hide();
                }
            }, 50)

        }



        function classSearchTree_NodeChecked(sender, e) {
            var node = e.get_node();

            recSubChilds(node, node.get_checked());

        }
        // 全選 Child Node
        function recSubChilds(nodeClassChild, checkStatus) {
            var childChilds = nodeClassChild.get_allNodes();
            for (var i = 0; i < childChilds.length; i++) {

                childChilds[i].set_checked(!checkStatus);

                if (childChilds[i].get_allNodes().length > 0)
                    recSubChilds(childChilds[i], checkStatus);
            }
        }

        function ChangeClassTree() {
            var chkStatus;
            var toolBar2 = $find("<%= RadToolBar1.ClientID %>");
            var dmsblock = toolBar2.findItemByValue("DMSBlock")
            var panelbar = dmsblock.findControl("RadMenu1"); //for RadControls
            var item = panelbar.findItemByValue("DMSAdvance");
            var chkSearchAllClass = $telerik.findElement(item.get_element(), ("chkSearchAllClass"));
            chkStatus = chkSearchAllClass.checked;
            var tmptree = $telerik.findElement(dmsblock.get_element(), ("classSearchTree"));

            var classSearchTree = $find(tmptree.id);

            divSearchClass = $('#divSearchClass');

            divSearchClass.prop('disabled', chkStatus);
            var tree = classSearchTree;
            if (tree) {
                classSearchTree.set_enabled(!chkStatus);
            }
        }

        function ResizeIndexTimeLabel() {
            var totlawidth = $("div.rtbInner").width();
            var w = 0;
            var flag = false;
            $("div.rtbInner li").each(function () {
                //  alert($(this).width());
                if ($(this).is(':last-child') == false || flag == false)
                    w += $(this).width();
                if ($(this).is(':last-child'))
                    flag = true;
            });
            var tbwidth = totlawidth - w;
            $("#tbindextime").width(tbwidth + 50);
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

    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <telerik:RadToolBar ID="RadToolBar1" runat="server" Width="100%" OnClientButtonClicking="RadToolBar1_ButtonClicking" OnButtonClick="RadToolBar1_ButtonClick" meta:resourcekey="RadToolBar1Resource1" SingleClick="None">
                <Items>
                    <telerik:RadToolBarButton runat="server" Value="DDL" meta:resourcekey="RadToolBarButtonResource1">
                        <ItemTemplate>
                            <table style="vertical-align: top;">
                                <tr style="vertical-align: top;">
                                    <td style="padding-left: 2px; padding-right: 1px">
                                        <telerik:RadDropDownTree ID="RadDropDownTree1" Width="180px" runat="server" DefaultMessage="搜尋結果分類" OnClientEntryAdded="OnClientEntryAdded" Culture="zh-TW" meta:resourcekey="RadDropDownTree1Resource1">
                                            <DropDownSettings AutoWidth="Enabled" />
                                            <FilterSettings Highlight="None" />
                                        </telerik:RadDropDownTree>
                                    </td>
                                </tr>
                            </table>
                        </ItemTemplate>
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton runat="server" IsSeparator="True" meta:resourcekey="RadToolBarButtonResource2">
                    </telerik:RadToolBarButton>

                    <telerik:RadToolBarButton runat="server" Value="SearchAdvance" meta:resourcekey="RadToolBarButtonResource4">
                        <ItemTemplate>
                            <telerik:RadMenu ID="RadMenu2" runat="server" meta:resourcekey="RadMenu2Resource1">
                                <Items>
                                    <telerik:RadMenuItem runat="server" Value="AdvanceOption" Text="條件選項 <span style='font-size:XX-Small;'>▼</span>" StaysOpenOnClick="True" meta:resourcekey="RadMenuItemResource3">
                                        <ContentTemplate>
                                            <table border="1" cellpadding="0" cellspacing="0" class="PopTable" style="table-layout: fixed; height: 100px; width: auto;">
                                                <tr id="moduletr">
                                                    <td class="PopTableLeftTD" style="width: 15%;">
                                                        <asp:Label ID="Label129" runat="server" Text="模組" meta:resourcekey="Label129Resource1"></asp:Label>
                                                    </td>
                                                    <td class="PopTableRightTD">
                                                        <asp:CheckBox ID="chkBulletin" ValidationGroup="Module" Text="公告" runat="server" meta:resourcekey="chkBulletinResource1" />&nbsp;&nbsp;&nbsp;
                                                        <asp:CheckBox ID="chkForum" ValidationGroup="Module" Text="討論" runat="server" meta:resourcekey="chkForumResource1" />&nbsp;&nbsp;&nbsp;
                                                        <asp:CheckBox ID="chkDMS" ValidationGroup="Module" Text="文件管理" runat="server" meta:resourcekey="chkDMSResource1" />&nbsp;&nbsp;&nbsp;          
                                                        <asp:CheckBox ID="chkBRIEFCASE" ValidationGroup="Module" Text="公事包" runat="server" meta:resourcekey="chkBRIEFCASEResource1" />&nbsp;&nbsp;&nbsp;
                                                        <asp:CheckBox ID="chkWKF" ValidationGroup="Module" Text="電子簽核" runat="server" meta:resourcekey="chkWKFResource1" />&nbsp;&nbsp;&nbsp;
                                                        <asp:CheckBox ID="chkPRIVATEMSG" ValidationGroup="Module" Text="私人訊息" runat="server" meta:resourcekey="chkPRIVATEMSGResource1" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="PopTableLeftTD" style="width: 15%;">
                                                        <asp:Label ID="Label15" runat="server" Text="時間範圍" meta:resourcekey="Label15Resource1"></asp:Label></td>
                                                    <td class="PopTableRightTD">
                                                        <asp:RadioButton ID="rbnotset" runat="server" Text="不限時間" Value="Notset" meta:resourcekey="rbnotsetResource1" GroupName="Datepart" onclick="CheckShowDatePicker2('Notset');" />&nbsp;&nbsp;&nbsp;
                                                        <asp:RadioButton ID="rb1day" runat="server" Text="過去1天" Value="24hour" meta:resourcekey="rb1dayResource1" GroupName="Datepart" onclick="CheckShowDatePicker2('24hour');" />&nbsp;&nbsp;&nbsp;
                                                        <asp:RadioButton ID="rb1week" runat="server" Text="過去1周" Value="week" meta:resourcekey="rb1weekResource1" GroupName="Datepart" onclick="CheckShowDatePicker2('week');" />&nbsp;&nbsp;&nbsp;
                                                        <asp:RadioButton ID="rb1month" runat="server" Text="過去1個月" Value="month" meta:resourcekey="rb1monthResource1" GroupName="Datepart" onclick="CheckShowDatePicker2('month');" />&nbsp;&nbsp;&nbsp;
                                                        <asp:RadioButton ID="rb1year" runat="server" Text="過去1年" Value="year" meta:resourcekey="rb1yearResource1" GroupName="Datepart" onclick="CheckShowDatePicker2('year');" />&nbsp;&nbsp;&nbsp;<br />
                                                        <asp:RadioButton ID="rbcustom" runat="server" Text="自訂" Value="specdate" meta:resourcekey="rbcustomResource1" GroupName="Datepart" onclick="CheckShowDatePicker2('specdate');" />
                                                        <telerik:RadDatePicker ID="WebDateChooserBegin1" runat="server">
                                                            <Calendar Culture="zh-TW" EnableWeekends="True" FastNavigationNextText="&amp;lt;&amp;lt;" UseColumnHeadersAsSelectors="False" UseRowHeadersAsSelectors="False">
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
                                                        <telerik:RadDatePicker ID="WebDateChooserEnd1" runat="server" >
                                                            <Calendar Culture="zh-TW" EnableWeekends="True" FastNavigationNextText="&amp;lt;&amp;lt;" UseColumnHeadersAsSelectors="False" UseRowHeadersAsSelectors="False">
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
                                                    <td class="PopTableLeftTD" style="width: 15%;">
                                                        <asp:Label ID="Label14" runat="server" Text="搜尋模式" meta:resourcekey="Label4Resource1"></asp:Label></td>
                                                    <td class="PopTableRightTD">
                                                        <table>
                                                            <tr>
                                                                <td align="left">
                                                                    <asp:RadioButton ID="RadioButton1" runat="server" Text="完全符合" GroupName="rdoSearch" meta:resourcekey="RadioButton1Resource1" />&nbsp;&nbsp;
                                                                </td>
                                                                <td align="left">
                                                                    <asp:RadioButton ID="RadioButton2" runat="server" Text="模糊搜尋" GroupName="rdoSearch" meta:resourcekey="RadioButton2Resource1" />&nbsp;&nbsp;
                                                                </td>
                                                                <td>
                                                                    <asp:RadioButton ID="RadioButton3" runat="server" Text="英文詞性代換" GroupName="rdoSearch" meta:resourcekey="RadioButton3Resource1" />&nbsp;&nbsp;
                                                                </td>
                                                                <td>
                                                                    <asp:RadioButton ID="RadioButton4" runat="server" Text="同音字搜尋" GroupName="rdoSearch" meta:resourcekey="RadioButton4Resource1" />&nbsp;&nbsp;
                                                                </td>
                                                                <td>
                                                                    <asp:RadioButton ID="RadioButton5" runat="server" Text="同義詞搜尋" GroupName="rdoSearch" meta:resourcekey="RadioButton5Resource1" />&nbsp;&nbsp;
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <asp:RadioButton ID="RadioButton6" runat="server" Text="簡繁對譯搜尋" GroupName="rdoSearch" meta:resourcekey="RadioButton6Resource1" />&nbsp;&nbsp;
                                                                </td>
                                                                <td>&nbsp;</td>
                                                                <td>&nbsp;</td>
                                                                <td>&nbsp;</td>
                                                                <td>&nbsp;</td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                </tr>
                                            </table>

                                        </ContentTemplate>
                                    </telerik:RadMenuItem>
                                </Items>
                            </telerik:RadMenu>
                        </ItemTemplate>
                    </telerik:RadToolBarButton>

                    <telerik:RadToolBarButton runat="server" Value="DMSBlock" meta:resourcekey="RadToolBarButtonResource5">
                        <ItemTemplate>
                            <telerik:RadMenu ID="RadMenu1" runat="server" meta:resourcekey="RadMenu1Resource1">
                                <Items>
                                    <telerik:RadMenuItem runat="server" Value="DMSAdvance" Text="進階 <span style='font-size:XX-Small;'>▼</span>" StaysOpenOnClick="True" meta:resourcekey="RadMenuItemResource2">
                                        <ContentTemplate>
                                            <table border="1" cellpadding="0" cellspacing="0" class="PopTable" style="table-layout: fixed; height: 100px; width: auto;">
                                                <tr>
                                                    <td style="text-align: right; width: 12%;" class="PopTableLeftTD">
                                                        <asp:Label ID="Label13" runat="server" Text="檢索範圍:" meta:resourcekey="Label13Resource1"></asp:Label>
                                                    </td>
                                                    <td class="PopTableRightTD">
                                                        <table>
                                                            <tr>
                                                                <td>
                                                                    <asp:CheckBox ID="chkSearchFile" runat="server" Text="文件內容" Checked="True" meta:resourcekey="chkSearchFileResource1" />
                                                                    &nbsp;
                                                                </td>
                                                                <td>
                                                                    <asp:CheckBox ID="chkSearchAuthor" runat="server" Text="作者" Checked="True" meta:resourcekey="chkSearchAuthorResource1" />
                                                                    &nbsp;
                                                                </td>
                                                                <td>
                                                                    <asp:CheckBox ID="chkSearchFilename" runat="server" Text="文件名稱" Checked="True" meta:resourcekey="chkSearchFilenameResource1" />
                                                                    &nbsp;
                                                                </td>
                                                                <td>
                                                                    <asp:CheckBox ID="chkSearchMem" runat="server" Text="摘要" Checked="True" meta:resourcekey="chkSearchMemResource1" />
                                                                    &nbsp;</td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <asp:CheckBox ID="chkKeyWord" runat="server" Text="關鍵字" Checked="True" meta:resourcekey="chkKeyWordResource1" />
                                                                    &nbsp;
                                                                </td>
                                                                <td>
                                                                    <asp:CheckBox ID="chkDocNum" runat="server" Text="文件編號" Checked="True" meta:resourcekey="chkDocNumResource1" />
                                                                    &nbsp;
                                                                </td>
                                                                <td>
                                                                    <asp:CheckBox ID="chkCustodyUser" runat="server" Text="保管者" Checked="True" meta:resourcekey="chkCustodyUserResource1" />
                                                                    &nbsp;
                                                                </td>
                                                                <td>
                                                                    <asp:CheckBox ID="chkCustomProperty" runat="server" Text="其他自訂屬性" Checked="True" meta:resourcekey="chkCustomPropertyResource1" />
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="right" class="PopTableLeftTD">
                                                        <asp:Label ID="Label11" runat="server" Text="版本" meta:resourcekey="Label11Resource1"></asp:Label>
                                                    </td>
                                                    <td class="PopTableRightTD">
                                                        <asp:RadioButtonList ID="rdoSearchVerType" runat="server" RepeatDirection="Horizontal" meta:resourcekey="rdoSearchVerTypeResource1">
                                                            <asp:ListItem Selected="True" Value="newVersion" Text="公佈的最新版本" meta:resourcekey="ListItemResource14"></asp:ListItem>
                                                            <asp:ListItem Value="allVersion" Text="所有公佈的版本" meta:resourcekey="ListItemResource15"></asp:ListItem>
                                                            <asp:ListItem Value="FinalVersion" Text="文件最後版本" meta:resourcekey="ListItemResource16"></asp:ListItem>
                                                        </asp:RadioButtonList>
                                                    </td>
                                                </tr>
                                                <tr id="treeclass">
                                                    <td align="right" class="PopTableLeftTD">
                                                        <asp:Label ID="Label22" runat="server" Text="文件類別" meta:resourcekey="Label22Resource1"></asp:Label>
                                                    </td>
                                                    <td class="PopTableRightTD">
                                                        <asp:CheckBox ID="chkSearchAllClass" runat="server" Checked="True" Font-Bold="True"
                                                            Text="所有的類別" meta:resourcekey="chkSearchAllClassResource1" />
                                                        <div id="divSearchClass" style="overflow: auto; width: 100%; height: 155px">
                                                            <telerik:RadTreeView ID="classSearchTree" runat="server" Height="150px" OnClientLoad="classSearchTree_InitializeTree"
                                                                OnClientNodeChecking="classSearchTree_NodeChecked"
                                                                CheckBoxes="True" TriStateCheckBoxes="False" meta:resourcekey="classSearchTreeResource1">
                                                            </telerik:RadTreeView>
                                                        </div>
                                                    </td>
                                                </tr>
                                            </table>
                                        </ContentTemplate>
                                    </telerik:RadMenuItem>
                                </Items>
                            </telerik:RadMenu>
                        </ItemTemplate>
                    </telerik:RadToolBarButton>

                    <telerik:RadToolBarButton runat="server" Value="Querystr2" meta:resourcekey="RadToolBarButtonResource6">
                        <ItemTemplate>
                            <asp:TextBox ID="Keyword" runat="server" meta:resourcekey="KeywordResource1"></asp:TextBox>
                        </ItemTemplate>
                    </telerik:RadToolBarButton>

                    <telerik:RadToolBarButton runat="server" IsSeparator="True" meta:resourcekey="RadToolBarButtonResource7">
                    </telerik:RadToolBarButton>

                    <telerik:RadToolBarButton runat="server" DisabledImageUrl="~/Common/Images/Icon/icon_m39.gif"
                        HoveredImageUrl="~/Common/Images/Icon/icon_m39.gif" ImageUrl="~/Common/Images/Icon/icon_m39.gif"
                        Value="AdvanceSearch" CheckedImageUrl="~/Common/Images/Icon/icon_m39.gif"
                        Text="搜尋" meta:resourcekey="RadToolBarButtonResource8">
                    </telerik:RadToolBarButton>

                    <telerik:RadToolBarButton runat="server"
                        Value="TreeSearch" Width="0px"
                        Text="搜尋" meta:resourcekey="RadToolBarButtonResource9">
                    </telerik:RadToolBarButton>

                    <telerik:RadToolBarButton runat="server" IsSeparator="True" meta:resourcekey="RadToolBarButtonResource7">
                    </telerik:RadToolBarButton>

                    <telerik:RadToolBarButton runat="server" Value="Text" meta:resourcekey="RadToolBarButtonResource11">
                        <ItemTemplate>
                            <asp:Label ID="Text" runat="server" meta:resourcekey="TextResource1"></asp:Label>
                        </ItemTemplate>
                    </telerik:RadToolBarButton>

                    <telerik:RadToolBarButton runat="server" Value="SearchResult" meta:resourcekey="RadToolBarButtonResource12">
                        <ItemTemplate>
                            <asp:Label ID="lblResultMsg" runat="server" meta:resourcekey="lblResultMsgResource1"></asp:Label>
                        </ItemTemplate>
                    </telerik:RadToolBarButton>

                    <telerik:RadToolBarButton runat="server" Value="IndexTime">
                        <ItemTemplate>
                            <table id="tbindextime">
                                <tr>
                                    <td align="right">
                                        <asp:Label ID="lblIndexTime" runat="server" Text=""></asp:Label>
                                    </td>
                                </tr>
                            </table>
                        </ItemTemplate>
                    </telerik:RadToolBarButton>
                </Items>
            </telerik:RadToolBar>
        </ContentTemplate>
    </asp:UpdatePanel>

    <asp:UpdatePanel ID="UpdatePanel2" UpdateMode="Conditional" runat="server">
        <ContentTemplate>
            <asp:Label ID="lblErrmsg2" runat="server" Text="搜尋結果過多,請縮小條件範圍" Visible="false" meta:resourcekey="lblErrmsg2Resource1" class="SizeL"></asp:Label>

            <table style="background-color: white; width: 100%;" runat="server" id="result">
                <tr>
                    <td>
                        <Fast:Grid ID="gridDetail" runat="server" AllowSorting="True" AutoGenerateCheckBoxColumn="False"
                            AutoGenerateColumns="False" DataKeyNames="id"
                            Width="100%" SkinID="SearchStyle" DataKeyOnClientWithCheckBox="False"
                            EnhancePager="True" ShowHeader="False"
                            AllowPaging="True" DefaultSortDirection="Ascending"
                            PageSize="15" EmptyDataText="沒有資料"
                            KeepSelectedRows="False" OnRowDataBound="gridDetail_RowDataBound" CustomDropDownListPage="False" meta:resourcekey="gridDetailResource1" SelectedRowColor="" UnSelectedRowColor="">
                            <EnhancePagerSettings ShowHeaderPager="True" FirstAltImageUrl="" FirstImageUrl="" LastAltImage="" LastImageUrl="" NextIAltImageUrl="" NextImageUrl="" PageInfoCssClass="" PageNumberCssClass="" PageNumberCurrentCssClass="" PageRedirectCssClass="" PreviousAltImageUrl="" PreviousImageUrl="" />
                            <ExportExcelSettings AllowExportToExcel="False" />
                            <AlternatingRowStyle BackColor="White" />
                            <Columns>
                                <asp:TemplateField meta:resourcekey="TemplateFieldResource1">
                                    <ItemTemplate>
                                        <table style="width: 100%;">
                                            <tr>
                                                <td width="10px"></td>
                                                <td>
                                                    <table>
                                                        <tr>
                                                            <td>
                                                                <asp:Label ID="lblIsLendDocTip" runat="server" Text="可調閱" CssClass="IsLendDocTip" Visible="false" ></asp:Label>
                                                                <asp:HyperLink runat="server" ID="hlLink" meta:resourcekey="hlLinkResource1" CssClass="TitleStyle">
                                                                    <asp:Label runat="server" Text='<%#: Eval("title") %>' ID="lblTitle" CssClass="TitleStyle" meta:resourcekey="Label11Resource2"></asp:Label>
                                                                </asp:HyperLink>

                                                                <asp:LinkButton ID="LinkButton1" runat="server" CssClass="TitleStyle" meta:resourcekey="LinkButton1Resource1"></asp:LinkButton>
                                                            </td>
                                                            <td>
                                                                <asp:Label runat="server" Text='-' ID="Label4"></asp:Label>
                                                                <asp:Label runat="server" Text='<%#: Eval("ModuleName") %>' ID="lbDisplayName" CssClass="keywordstyle" meta:resourcekey="lbDisplayNameResource1"></asp:Label>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                    <div class="tablestyle">
                                                        <asp:Label runat="server" Text='<%# Eval("summary") %>' ID="Label3" meta:resourcekey="Label3Resource1"></asp:Label>
                                                    </div>
                                                    <div class="bottom">
                                                        <asp:Label runat="server" ID="lblbottom" meta:resourcekey="lblbottomResource1"></asp:Label>
                                                    </div>
                                                    <asp:Panel ID="PanelDMS" runat="server">
                                                        <asp:Label runat="server" ID="Label6" Text="路徑：" meta:resourcekey="Label6Resource1"></asp:Label><asp:HyperLink ID="linkDMSPath" runat="server" Text='<%#: Eval("DocPath") %>' meta:resourcekey="linkDMSPathResource1"></asp:HyperLink>
                                                        <br />
                                                        <asp:Label runat="server" ID="Label7" Text="文件編號：" meta:resourcekey="Label7Resource1"></asp:Label><asp:Label runat="server" ID="lblSerial" Text='<%#: Eval("Searial") %>' meta:resourcekey="lblSerialResource1"></asp:Label>&nbsp;&nbsp;
                                                        <asp:Label runat="server" ID="Label8" Text="作者：" meta:resourcekey="Label8Resource1"></asp:Label><asp:Label runat="server" ID="lblAuthor" Text='<%#: Eval("author") %>' meta:resourcekey="lblAuthorResource1"></asp:Label>
                                                        &nbsp;&nbsp;
                                                        <asp:Label runat="server" ID="Label9" Text="版本：" meta:resourcekey="Label9Resource1"></asp:Label>
                                                        <asp:Label runat="server" ID="lblVersion" Text='<%#: Eval("Version") %>' meta:resourcekey="lblVersionResource1"></asp:Label>&nbsp;&nbsp;
                                                        <asp:Label runat="server" ID="Label5" Text="狀態：" meta:resourcekey="Label5Resource1"></asp:Label><asp:Label runat="server" ID="lblDocStatus" Text='<%#: Eval("Docstatus") %>' meta:resourcekey="lblDocStatusResource1"></asp:Label>
                                                    </asp:Panel>
                                                    <asp:Panel ID="PanelForm" runat="server">
                                                        <asp:Label runat="server" ID="Label16" Text="張貼者：" meta:resourcekey="Label16Resource1"></asp:Label><asp:Label runat="server" ID="Label17" Text='<%#: Eval("author") %>'></asp:Label>
                                                    </asp:Panel>
                                                    <asp:Panel ID="PanelBulletin" runat="server">
                                                        <asp:Label runat="server" ID="Label57" Text="發佈者：" meta:resourcekey="Label57Resource1"></asp:Label><asp:Label runat="server" ID="Label18" Text='<%#: Eval("author") %>'></asp:Label>&nbsp;&nbsp;
                                                        <asp:Label runat="server" ID="Label19" Text="張貼部門：" meta:resourcekey="Label19Resource1"></asp:Label><asp:Label runat="server" ID="Label20" Text='<%#: Eval("UsergroupName") %>'></asp:Label>
                                                    </asp:Panel>
                                                    <asp:Panel ID="PanelBriefcase" runat="server">
                                                        <asp:Label runat="server" ID="Label21" Text="檔案大小：" meta:resourcekey="Label21Resource1"></asp:Label><asp:Label runat="server" ID="lblFileLength" Text='<%# Eval("Filelength") %>'></asp:Label>&nbsp;&nbsp;
                                                        <asp:Label runat="server" ID="Label24" Text="檔案來源：" meta:resourcekey="Label24Resource1"></asp:Label><asp:Label runat="server" ID="lblSource" Text='<%#: Eval("Useraccount") %>'></asp:Label>
                                                    </asp:Panel>
                                                    <asp:Panel ID="PanelMessage" runat="server">
                                                        <asp:Label runat="server" ID="Label25" Text="寄件者：" meta:resourcekey="Label25Resource1"></asp:Label><asp:Label runat="server" ID="Label26" Text='<%#: Eval("Useraccount") %>'></asp:Label>&nbsp;&nbsp;
                                                        <asp:Label runat="server" ID="Label27" Text="收件者：" meta:resourcekey="Label27Resource1"></asp:Label><asp:Label runat="server" ID="Label28" Text='<%#: Eval("MessagetoAcc") %>'></asp:Label>
                                                    </asp:Panel>
                                                    <asp:Panel ID="PanelWKF" runat="server">
                                                        <asp:Label runat="server" ID="Label29" Text="表單名稱：" meta:resourcekey="Label29Resource1"></asp:Label><asp:Label runat="server" ID="Label30" Text='<%#: Eval("WKFFormName") %>'></asp:Label>&nbsp;&nbsp;<asp:Label runat="server" ID="Label23" Text="申請者：" meta:resourcekey="Label23Resource1"></asp:Label><asp:Label runat="server" ID="Label31" Text='<%#: Eval("author") %>'></asp:Label>
                                                        &nbsp;&nbsp;<asp:Label runat="server" ID="Label32" Text="申請者部門："></asp:Label><asp:Label runat="server" ID="Label33" Text='<%#: Eval("UsergroupName") %>'></asp:Label>
                                                    </asp:Panel>
                                                </td>
                                            </tr>
                                        </table>
                                        <br />

                                    </ItemTemplate>
                                    <HeaderStyle ForeColor="White" />
                                </asp:TemplateField>
                            </Columns>
                            <RowStyle Height="30px" />
                        </Fast:Grid>

                    </td>
                </tr>
                <tr>
                    <td>
                        <hr />
                        <table id="tbhot">
                            <tr>
                                <td width="30"></td>
                                <td>
                                    <asp:Label ID="Label2" CssClass="keywordstyle" Visible="False" runat="server" Text="熱門關鍵字" meta:resourcekey="Label2Resource1"></asp:Label>
                                    <asp:PlaceHolder ID="PlaceHolder1" runat="server"></asp:PlaceHolder>
                                    <asp:Panel ID="Panel1" runat="server" meta:resourcekey="Panel1Resource1">
                                        <asp:Label ID="lblPlaceHolder2title" CssClass="keywordstyle" runat="server" Text="同音詞推薦" meta:resourcekey="lblPlaceHolder2titleResource1"></asp:Label><br />
                                        <div id="divPlaceHolder2" style="display: block; overflow: hidden">
                                            <asp:PlaceHolder ID="PlaceHolder2" runat="server"></asp:PlaceHolder>
                                        </div>
                                        <br />
                                        <br />
                                        <asp:Label ID="lblPlaceHolder3title" CssClass="keywordstyle" runat="server" Text="同義詞推薦" meta:resourcekey="lblPlaceHolder3titleResource1"></asp:Label><br />
                                        <div id="divPlaceHolder3" style="display: block; overflow: hidden">
                                            <asp:PlaceHolder ID="PlaceHolder3" runat="server"></asp:PlaceHolder>
                                        </div>
                                    </asp:Panel>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>


            <asp:Label ID="lblKeyWord" Visible="False" runat="server" Text="請輸入關鍵字..." meta:resourcekey="lblKeyWordResource1"></asp:Label>
            <asp:LinkButton ID="LinkButton2" runat="server" OnClick="LinkButton2_Click" meta:resourcekey="LinkButton2Resource1"></asp:LinkButton>
            <asp:HiddenField ID="hfKeyworCID" runat="server" />
            <asp:Label runat="server" ID="lblAllSites" Text="全部" Visible="False" meta:resourcekey="lblAllSitesResource1"></asp:Label>
            <asp:Label runat="server" ID="lblLocal" Text="本地" Visible="False" meta:resourcekey="lblLocalResource1"></asp:Label>
            <asp:Label runat="server" ID="lblSource" Text="來源" Visible="False" meta:resourcekey="lblSourceResource1"></asp:Label>

        </ContentTemplate>
    </asp:UpdatePanel>

    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" EnablePaging="True" OldValuesParameterFormatString="original_{0}" SelectMethod="GetDetailData" TypeName="Ede.Uof.Web.Common.SelectSearchData"
        MaximumRowsParameterName="maxRows" StartRowIndexParameterName="startIndex" SelectCountMethod="GetDetailData_Count">
        <SelectParameters>
            <asp:Parameter Name="Condition" Type="Object" />

        </SelectParameters>
    </asp:ObjectDataSource>

    <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" EnablePaging="True" OldValuesParameterFormatString="original_{0}" SelectMethod="GetDetailDataDMS" TypeName="Ede.Uof.Web.Common.SelectSearchData"
        MaximumRowsParameterName="maxRows" StartRowIndexParameterName="startIndex" SelectCountMethod="GetDetailDataDMS_Count">
        <SelectParameters>
            <asp:Parameter Name="Condition" Type="Object" />
        </SelectParameters>
    </asp:ObjectDataSource>

    <asp:HiddenField ID="hideSelectNode" runat="server" />
    <asp:HiddenField ID="hideCount" runat="server" Value="1000" />
    <asp:HiddenField ID="hideCusid" runat="server" />
    <asp:HiddenField ID="hideSubid" runat="server" />
    <asp:HiddenField ID="hideUsertype" runat="server" />

    <asp:Label runat="server" ID="lblBriefcase" Text="公事包" Visible="False" meta:resourcekey="lblBriefcaseResource1"></asp:Label>
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
    <asp:Label ID="lblUpdating" runat="server" Text="改版中" Visible="False" meta:resourcekey="lblUpdatingResource1"></asp:Label>
    <asp:Label ID="lblDraft" runat="server" Text="草稿" Visible="False" meta:resourcekey="lblDraftResource1"></asp:Label>

    <asp:Label runat="server" ID="lblDMS" Text="文件管理" Visible="False" meta:resourcekey="lblDMSResource1"></asp:Label>
    <asp:Label runat="server" ID="lblForum" Text="討論" Visible="False" meta:resourcekey="lblForumResource1"></asp:Label>
    <asp:Label runat="server" ID="lblPrivateMSG" Text="私人訊息" Visible="False" meta:resourcekey="lblPrivateMSGResource1"></asp:Label>
    <asp:Label runat="server" ID="lblBulletin" Text="公告" Visible="False" meta:resourcekey="lblBulletinResource1"></asp:Label>
    <asp:Label runat="server" ID="lblWKF" Text="電子簽核" Visible="False" meta:resourcekey="lblWKFResource1"></asp:Label>
    <asp:Label runat="server" ID="Label10" Text="電子簽核" Visible="False" meta:resourcekey="Label10Resource1"></asp:Label>
    <asp:Label runat="server" ID="lblDMSRoot" Text="文件庫" Visible="False" meta:resourcekey="lblDMSRootResource1"></asp:Label>
    <asp:Label runat="server" ID="lblTimeSpend" Text="共耗時{0}秒" Visible="False" meta:resourcekey="lblTimeSpendResource1"></asp:Label>
    <asp:Label runat="server" ID="lblDMSClass" Text="文件類別" Visible="False" meta:resourcekey="lblDMSClassResource1"></asp:Label>
    <asp:Label runat="server" ID="lblAllclass" Text="全部模組" Visible="False" meta:resourcekey="lblAllclassResource1"></asp:Label>
    <asp:Label ID="lblErrmsg" runat="server" Text="關鍵字請勿輸入符號或指令" Visible="false" meta:resourcekey="lblErrmsgResource1"></asp:Label>
    <asp:Label ID="lblIndexMsg" runat="server" Text="索引庫建立時間" Visible="false" meta:resourcekey="lblIndexMsgResource1"></asp:Label>

    <asp:Label ID="lblNone" runat="server" Text="無" Visible="false" meta:resourcekey="lblNoneResource1"></asp:Label>
    <asp:Label ID="lblNullMsg" runat="server" Text="請選擇要查詢的模組" Visible="False" meta:resourcekey="lblNullMsgResource1"></asp:Label>
</asp:Content>
