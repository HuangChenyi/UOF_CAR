<%@ Page Title="" Language="C#" AutoEventWireup="true" CodeBehind="PdfImageViewerUG.aspx.cs" Inherits="Ede.Uof.Web.DMS.DocStore.PdfImageViewerUG" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE html>
<html style="overflow: hidden">
<head runat="server">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta content="text/html; charset=utf-8" />

    <style type="text/css">
        br {
            display: block;
            line-height: 5px;
        }

        .page_normal {
            border-bottom: 1px solid gray;
            text-align: center;
            background-color: lightgrey;
            vertical-align: middle;
        }

        .contentPaneDecorator * {
            margin: 0;
            padding: 0;
        }

        .contentPaneDecorator p {
            margin-top: 1em;
        }

        .verticalIndexes {
            width: 95px;
            margin: 0 auto;
            margin-top: 5px;
        }

        .clear {
            clear: both;
            line-height: 1px;
            margin-top: -1px;
            list-style: none;
        }

        .indexes {
            float: left;
            list-style: none;
            cursor: pointer;
            color: #001119;
            width: 90px;
            height: 115px;
            border: none;
            font-size: 12px;
            _margin-left: 5px; /*IE6*/
        }

            .indexes:hover {
                color: #0b25d4;
                border: none;
            }

            .indexes > img {
                height: 90px;
                width: 70px;
                border: solid 1px;
            }

        .demo-container {
            border: 1px solid #e2e4e7;
            background-color: #f5f7f8;
            padding: 3px;
            text-align: center;
            *zoom: 1;
        }

        .splitterWrapper {
            width: 98%;
            margin: 7px;
        }

        .indexDisplayed {
            float: left;
            list-style: outside;
            cursor: pointer;
            width: 90px;
            height: 115px;
            border: none;
            font-size: 12px;
            color: #0b25d4;
            _margin-left: 5px; /*IE6*/
        }

            .indexDisplayed > img {
                height: 90px;
                width: 70px;
                border: solid 3px;
            }
    </style>
</head>
<body id="Body">

    <form id="form1" runat="server">
        <telerik:RadScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="True" AsyncPostBackTimeout="36000">
            <Scripts>
	            <asp:ScriptReference Assembly="Telerik.Web.UI" Name="Telerik.Web.UI.Common.Core.js" />
                <asp:ScriptReference Assembly="Telerik.Web.UI" Name="Telerik.Web.UI.Common.jQuery.js" />
                <asp:ScriptReference Assembly="Telerik.Web.UI" Name="Telerik.Web.UI.Common.jQueryInclude.js" />
                <asp:ScriptReference Path="~/Common/javascript/json2.min.js" ScriptMode="Release" />
                <asp:ScriptReference Path="~/Common/javascript/jQuery/plugin/jquery-ui.min.js" ScriptMode="Release" />
                <asp:ScriptReference Path="~/Common/javascript/jQuery/plugin/jquery.blockUI.js" ScriptMode="Release" />
                <asp:ScriptReference Path="~/Common/javascript/jQuery/plugin/ticker.js" ScriptMode="Release" />
                <asp:ScriptReference Path="~/Common/javascript/uofScript.js" ScriptMode="Release" />
                <asp:ScriptReference Path="~/Common/javascript/jQuery/plugin/jquery.cookie.js" ScriptMode="Release" />
                <asp:ScriptReference Path="~/Common/javascript/webcache.js" ScriptMode="Auto" />
            </Scripts>
        </telerik:RadScriptManager>

        <telerik:RadAjaxLoadingPanel ID="RadAjaxLoadingPanel" runat="server" meta:resourcekey="RadAjaxLoadingPanelResource1"></telerik:RadAjaxLoadingPanel>
        <div class="demo-container">
            <div class="splitterWrapper">
                <telerik:RadSplitter ID="RadSplitter1" Width="100%" Height="100%" runat="server" Orientation="Vertical" Skin="Telerik"
                    ResizeWithParentPane="False" ResizeWithBrowserWindow="True" meta:resourcekey="RadSplitter1Resource1" SplitBarsSize="">

                    <telerik:RadPane ID="RadPane3" CssClass="contentPaneDecorator" runat="server" Width="115px"
                        MinWidth="100" MinHeight="100" Index="0" meta:resourcekey="RadPane3Resource1">
                        <ul id="indexesList" class="verticalIndexes"></ul>
                    </telerik:RadPane>
                    <telerik:RadSplitBar ID="RadSplitBar1" runat="server" Index="1" meta:resourcekey="RadSplitBar1Resource1" />
                    <telerik:RadPane ID="RadPane2" CssClass="contentPaneDecorator" runat="server" Index="2" meta:resourcekey="RadPane2Resource1">
                        <div id="div_content" style="overflow: auto; position: relative; width: 100%; height: 100%;">
                            <table id="xps_content" width="100%" cellpadding="0" cellspacing="0"></table>
                        </div>
                    </telerik:RadPane>
                    <telerik:RadSplitBar ID="RadSplitBar2" runat="server" Index="3" meta:resourcekey="RadSplitBar2Resource1" />
                    <telerik:RadPane ID="RadPane1" runat="server" Width="22px" Index="4" meta:resourcekey="RadPane1Resource1">
                        <telerik:RadSlidingZone ID="RadSlidingZone1" runat="server" Width="22px" SlideDirection="Left" meta:resourcekey="RadSlidingZone1Resource1">
                            <telerik:RadSlidingPane ID="RadSlidingPane1" runat="server" Width="250px" Title="Search Results"
                                EnableDock="False" MinWidth="225" MinHeight="225" Index="0" meta:resourcekey="RadSlidingPane1Resource1" />
                        </telerik:RadSlidingZone>
                    </telerik:RadPane>
                </telerik:RadSplitter>
            </div>
        </div>

        <div style="text-align: center; margin-top: 5px">
            <telerik:RadToolBar ID="RadToolBar1" runat="server" OnClientButtonClicking="OnBarMainClicking" meta:resourcekey="RadToolBar1Resource1" SingleClick="None">
                <Items>
                    <telerik:RadToolBarButton Value="template" meta:resourcekey="RadToolBarButtonResource1">
                        <ItemTemplate>
                            <telerik:RadNumericTextBox ID="RadNumericTextBox1" runat="server" Type="Number" Value="1" SelectionOnFocus="SelectAll"
                                Width="36" NumberFormat-DecimalDigits="0" MinValue="1" AutoPostBack="False" AllowOutOfRangeAutoCorrect="True" meta:resourcekey="RadNumericTextBox1Resource1">
                                <ClientEvents OnKeyPress="numeric_onchanged" />
                            </telerik:RadNumericTextBox>
                            <div style="display: inline;">
                                ／<asp:Label ID="lblNumberOfPages" runat="server" meta:resourcekey="lblNumberOfPagesResource1"></asp:Label>
                            </div>
                        </ItemTemplate>
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton runat="server" DisabledImageUrl="~/dms/images/docviewer/up.png"
                        HoveredImageUrl="~/dms/images/docviewer/up.png" ImageUrl="~/dms/images/docviewer/up.png"
                        CheckedImageUrl="~/dms/images/docviewer/up.png" Text="" ToolTip="Previous page" Value="Previous" meta:resourcekey="RadToolBarButtonResource2">
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton runat="server" DisabledImageUrl="~/dms/images/docviewer/down.png"
                        HoveredImageUrl="~/dms/images/docviewer/down.png" ImageUrl="~/dms/images/docviewer/down.png"
                        CheckedImageUrl="~/dms/images/docviewer/down.png" Text="" ToolTip="Next page" Value="Next" meta:resourcekey="RadToolBarButtonResource3">
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton runat="server" IsSeparator="true" meta:resourcekey="RadToolBarButtonResource4">
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton runat="server" Text="" ToolTip="Plus" Value="Plus"
                        DisabledImageUrl="~/Common/Images/Icon/icon_m209.png"
                        HoveredImageUrl="~/Common/Images/Icon/icon_m209.png"
                        ImageUrl="~/Common/Images/Icon/icon_m209.png"
                        CheckedImageUrl="~/Common/Images/Icon/icon_m209.png" meta:resourcekey="RadToolBarButtonResource5">
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton runat="server" Value="RatioValue" meta:resourcekey="RadToolBarButtonResource6">
                        <ItemTemplate>
                            <asp:Label ID="lblRatio" runat="server" Text="150%" meta:resourcekey="lblRatioResource1"></asp:Label>
                        </ItemTemplate>
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton runat="server" Text="" ToolTip="Minus" Value="Minus"
                        DisabledImageUrl="~/Common/Images/Icon/icon_m210.png"
                        HoveredImageUrl="~/Common/Images/Icon/icon_m210.png"
                        ImageUrl="~/Common/Images/Icon/icon_m210.png"
                        CheckedImageUrl="~/Common/Images/Icon/icon_m210.png" meta:resourcekey="RadToolBarButtonResource7">
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton Value="ratioselect" Visible="false" meta:resourcekey="RadToolBarButtonResource8">
                        <ItemTemplate>
                            <select id="Select1" onchange="ratiochange();">
                                <option>50%</option>
                                <option>75%</option>
                                <option>100%</option>
                                <option selected="true">150%</option>
                                <option>200%</option>
                                <option>400%</option>
                                <option>800%</option>
                                <option>1600%</option>
                            </select>
                        </ItemTemplate>
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton runat="server" DisabledImageUrl="~/dms/images/docviewer/rotate.png"
                        HoveredImageUrl="~/dms/images/docviewer/rotate.png" ImageUrl="~/dms/images/docviewer/rotate.png"
                        CheckedImageUrl="~/dms/images/docviewer/rotate.png" Text="" ToolTip="Rotate" Value="Rotate" meta:resourcekey="RadToolBarButtonResource9">
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton runat="server" DisabledImageUrl="~/dms/images/docviewer/download.png"
                        HoveredImageUrl="~/dms/images/docviewer/download.png" ImageUrl="~/dms/images/docviewer/download.png"
                        CheckedImageUrl="~/dms/images/docviewer/download.png" Text="" ToolTip="Download" Value="Download" meta:resourcekey="RadToolBarButtonResource10">
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton Value="textbox" meta:resourcekey="RadToolBarButtonResource11">
                        <ItemTemplate>
                            <telerik:RadTextBox ID="RadTextBox1" runat="server" Width="120px" AutoPostBack="False" meta:resourcekey="RadTextBox1Resource1">
                            </telerik:RadTextBox>
                        </ItemTemplate>
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton runat="server" DisabledImageUrl="~/dms/images/docviewer/search2.png"
                        HoveredImageUrl="~/dms/images/docviewer/search2.png" ImageUrl="~/dms/images/docviewer/search2.png"
                        CheckedImageUrl="~/dms/images/docviewer/search2.png" Text="" ToolTip="Search" Value="Search" meta:resourcekey="RadToolBarButtonResource12">
                    </telerik:RadToolBarButton>
                </Items>
            </telerik:RadToolBar>
        </div>

        <asp:HiddenField ID="hdnQueryString" runat="server" Value="0" />
        <asp:HiddenField ID="hdnAngle" runat="server" Value="0" />
        <asp:HiddenField ID="hdnHistoryImagesStringJson" runat="server" Value="[]" />
        <asp:HiddenField ID="hdnSummaryImageStr" runat="server" />
        <asp:HiddenField ID="hdnSearchUrl" runat="server" />
        <asp:HiddenField ID="hdnDownloadUrl" runat="server" />
        <asp:HiddenField ID="hdnSearchTextboxId" runat="server" />
        <asp:HiddenField ID="hdnNumericId" runat="server" />
        <asp:HiddenField ID="hdnOffsetTop" runat="server" />
        <asp:HiddenField ID="hdnOffsetLeft" runat="server" />
        <asp:HiddenField ID="hdnWidth" runat="server" />
        <asp:HiddenField ID="hdnDivHeigh" runat="server" />
        <asp:Label runat="server" ID="lblDownLoading" Text="下載檔案中，請稍後。" style="display: none;" meta:resourcekey="lblDownLoadingResource1"></asp:Label>

        <telerik:RadScriptBlock runat="server">
            <script type="text/javascript">
                var m_NumberOfDocPages = -1;
                var m_TotalPagesCount = -1;
                var m_SystemAddedCount = -1;
                var m_UgId = '';
                var m_PdfWidth = -1;
                var m_PdfHeight = -1;
                var m_WebCache = null;
                var m_clickpage = -1;
                var _imageHandlerUrl = '';
                var _imageHandlerArgs = '';

                function body_ready() {
                    m_NumberOfDocPages = '<%=NumberOfPages%>';
                    m_TotalPagesCount = '<%=TotalPagesCount%>';
                    m_SystemAddedCount = m_TotalPagesCount - m_NumberOfDocPages;
                    m_UgId = '<%=SourceUgId%>';
                    _imageHandlerUrl = '<%=PageImageHandler%>';
                    _imageHandlerArgs = escape('<%=PageImageHandlerArgs%>');

                    var angle = $uof.tool.htmlDecode($('#<%=hdnAngle.ClientID%>').val());
                    if (angle === "90" || angle === "270") {
                        m_PdfWidth = '<%=PdfHeight%>';
                        m_PdfHeight = '<%=PdfWidth%>';
                    } else {
                        m_PdfWidth = '<%=PdfWidth%>';
                        m_PdfHeight = '<%=PdfHeight%>';
                    }

                    $(window).resize(splitterRisize);

                    $(window).on('beforeunload', function () {
                        var url = String.format("PdfViewerSLDeleteHandler.ashx?uid={0}", "<%=UniqueId%>");
                        $.get(url, function (data) { });
                    });

                    $(window).on('load',function () {
                        self.moveTo(0, 0);
                        self.resizeTo(screen.availWidth, screen.availHeight);
                    });

                    splitterRisize();
                    // 建立所有 Page 的 BLOCK
                    initial_page();
                    ratiochange(150);
                }

                $(document).ready(body_ready);

                // disable context menu
                $(document).bind("contextmenu", function (e) { e.preventDefault(); });


                var last_scroll_time = new Date().getTime();
                function initial_page() {
                    var $div = $('.splitterWrapper');
                    // alert($div.height());
                    // m_PdfHeight = $div.height();
                    $("#<%=hdnDivHeigh.ClientID%>").val(m_PdfHeight);
                    //alert(m_PdfHeight);
                    var toolBar = $find("<%= RadToolBar1.ClientID %>");
                    var previousItem = toolBar.findItemByValue("Previous");
                    var nextItem = toolBar.findItemByValue("Next");
                    previousItem.set_enabled(false);

                    // 設定 scroll 事件
                    $('#div_content').scroll(function () {
                        last_scroll_time = new Date().getTime();

                        // 捲動時, 重設 Show FLAG
                        is_show_current_image = false;

                        // 計算目前 Page 的 PageIndex
                        var $content = $('#div_content');
                        var top = $content.scrollTop();
                        var topIndex = top / m_PdfHeight;
                        topIndex = parseInt(topIndex, 10);
                        var numericId = $("#<%=hdnNumericId.ClientID%>").val();
                        $find(numericId).set_textBoxValue(++topIndex);

                        liScrollToView("lipagenumber" + topIndex, topIndex);

                        previousItem.set_enabled(true);
                        nextItem.set_enabled(true);
                        if (topIndex == 1) { previousItem.set_enabled(false); }
                        if (topIndex == m_TotalPagesCount) { nextItem.set_enabled(false); }
                    });

                    var $xpsContent = $('#xps_content').append('<tbody></tbody>');
                    var $indexList = $("#indexesList");
                    var initNumber = 1;

                    // add cover image and wkf approval records
                    var json = $('#<%=hdnHistoryImagesStringJson.ClientID%>').val();
                    var wkfInfo = JSON.parse(json);
                    for (var i = 0; i < m_SystemAddedCount; i++) {
                        var imageStr;
                        if (i == 0) {
                            imageStr = $("#<%=hdnSummaryImageStr.ClientID%>").val();
                        } else {
                            imageStr = wkfInfo[i - 1];
                        }
                        var n = 'trpagenumber' + initNumber;
                        var pageHtml = "<tr id='trpagenumber" + initNumber + "'><td class='page_normal' style=\"height:" + m_PdfHeight + "px\" >"
                            + "<div id='div_" + n + "'><img class='book'  style=\"height:" + m_PdfHeight + "px\" src='data:image/png;base64," + imageStr + "' alt='Doc Cover' /></div>"
                            + "</td></tr>\r\n";
                        $xpsContent.append(pageHtml);
                        //$indexList.append("<li class='indexes' id='lipagenumber" + initNumber + "' onclick='li_onclick(\"trpagenumber" + initNumber + "\");'>" + initNumber + "</li>");
                        //$indexList.append("<li class='indexes' style=\"background-image: url('data:image/png;base64," + escape(imageStr) + "'); id='lipagenumber" + initNumber + "' onclick='li_onclick(\"trpagenumber" + initNumber + "\");'>" + initNumber + "</li>");
                        if (i == 0) {
                            $indexList.append("<li class='indexes' id='lipagenumber" + initNumber + "' onclick='li_onclick(\"trpagenumber" + initNumber + "\");'>" + "<img  src='../images/DocViewer/category.png' /><br/>" + initNumber + "<span></li>");
                        }
                        else {
                            $indexList.append("<li class='indexes' id='lipagenumber" + initNumber + "' onclick='li_onclick(\"trpagenumber" + initNumber + "\");'>" + "<img  src='../images/DocViewer/category.png' /><br/><span style=\"height:5px\" >" + initNumber + "</span></li>");
                        }
                        initNumber++;
                    }

                    initNumber = 1 + m_SystemAddedCount;
                    // 建立所有空白 Page
                    for (var i = 0; i < m_NumberOfDocPages; i++) {
                        n = 'trpagenumber' + initNumber;
                        var pageHtml = "<tr id='trpagenumber" + initNumber + "'><td class='page_normal' style=\"height:" + m_PdfHeight + "px\" onclick='page_onclick(this);' ><div id='div_" + n + "'></div></td></tr>\r\n";
                        $xpsContent.append(pageHtml);
                        //$indexList.append("<li class='indexes' style=\"background-image: url('" + get_thumbnail_url(i + 1) + "');\"" + " id='lipagenumber" + initNumber + "' onclick='li_onclick(\"trpagenumber" + initNumber + "\");'>" + initNumber + "</li>");
                        $indexList.append("<li class='indexes' id='lipagenumber" + initNumber + "' onclick='li_onclick(\"trpagenumber" + initNumber + "\");'>" + "<img  src=\"" + get_thumbnail_url(i + 1) + "\" /><br/><span style=\"height:5px\">" + initNumber + "</span></li>");
                        initNumber++;
                    }

                    // 建立 初始化 WebCache 物件 物件
                    m_WebCache = new webcache();

                    var all_item = [];
                    for (var i = 0; i < m_NumberOfDocPages; i++) {
                        var url = get_img_url(i + 1);
                        all_item.push({ url: url, index: i });
                    }
                    m_WebCache.init(all_item, item_load_callback, item_error_callback);

                    time_proc();
                    $(".page_normal").each(function (index) {
                        $(this).height(m_PdfHeight);
                    });

                }

                function reinitial_page(stype) {

                    $(".page_normal").each(function (index) {
                        $(this).height(m_PdfHeight);
                    });
                    var orgsizeh = m_PdfHeight;
                    var orgsizew = m_PdfWidth;
                    $(".book").each(function (index) {

                        $(this).height(m_PdfHeight);
                        $("#<%=hdnWidth.ClientID%>").val($(this).width());
                        show_current_image();
                        $(this).css('display', '');
                    });
                }



                function li_onclick(trtagId) {
                    var $divContent = $('#div_content');
                    var trtagOffsetTop = $('#' + trtagId).offset().top;
                    var contentScrollTop = $divContent.scrollTop();
                    var tdobj = $('#' + trtagId).children('.page_normal');
                    var $li = $('#lipagenumber' + trtagId.replace('trpagenumber', ''));
                    var $img = $li.children('img');
                    m_clickpage = trtagId.replace('trpagenumber', '');

                    $divContent.animate({ scrollTop: contentScrollTop + trtagOffsetTop }, 750);
                }

                function li_onclickZoom(trtagId) {
                    var $divContent = $('#div_content');
                    var trtagOffsetTop = $('#' + trtagId).offset().top;
                    var trtagOffsetLeft = $('#' + trtagId).offset().left;
                    var contentScrollTop = $divContent.scrollTop();
                    var contentScrollLeft = $divContent.scrollLeft();

                    var nowoffsettop = $("#<%=hdnOffsetTop.ClientID%>").val();
                    var nowoffsetleft = $("#<%=hdnOffsetLeft.ClientID%>").val();
                    $divContent.animate({ scrollTop: (contentScrollTop) + trtagOffsetTop, scrollLeft: contentScrollLeft }, 10);//contentScrollTop + trtagOffsetTop
                }

                function liScrollToView(litagId, index) {
                    var splitter = $find("<%= RadSplitter1.ClientID %>");
                    var pane = splitter.getPaneById("<%= RadPane3.ClientID %>");
                   pane.setScrollPos(0, --index * 113);
                }

                function splitterRisize() {
                    $(".splitterWrapper").height($(window).height() - 75);
                    var splitter = $find("<%= RadSplitter1.ClientID %>");
                    splitter.set_height($(".splitterWrapper").height());
                }

                function numeric_onchanged(sender, eventArgs) {
                    if (eventArgs.get_keyCode() === 13) {
                        var numericId = $("#<%=hdnNumericId.ClientID%>").val();
                        var numericInput = $find(numericId);
                        li_onclick("trpagenumber" + numericInput.get_textBoxValue());
                        eventArgs.set_cancel(true);
                    }
                }

                //===== Toolbar ======
                function OnBarMainClicking(sender, args) {
                    args.set_cancel(true);

                    var toolBar = $find("<%=RadToolBar1.ClientID %>");
                    var ratiobutton = toolBar.findItemByValue("RatioValue");
                    var lblratio = $telerik.findElement(ratiobutton.get_element(), ("lblRatio"));
                    var orgRatio = lblratio.innerHTML;
                    orgRatio = orgRatio.replace('%', '');
                    orgRatio = Number(orgRatio);
                    // 計算目前 Page 的 PageIndex
                    var $content = $('#div_content');
                    var top = $content.scrollTop();
                    var topIndex = top / m_PdfHeight;
                    topIndex = 1 + parseInt(topIndex, 10);

                    var oButton = args.get_item();
                    switch (oButton.get_value()) {
                        case "Next":
                            li_onclick("trpagenumber" + (++topIndex));
                            break;
                        case "Previous":
                            li_onclick("trpagenumber" + (--topIndex));
                            break;
                        case "Rotate":
                            rotation_click();
                            break;
                        case "Minus":
                            orgRatio = orgRatio - 50;
                            if (orgRatio < 50)
                                orgRatio = 50;
                            ratiochange(orgRatio);
                            break;
                        case "Plus":
                            orgRatio = orgRatio + 50;
                            if (orgRatio > 1600)
                                orgRatio = 1600;
                            ratiochange(orgRatio);
                            break;
                        case "Download":
                            alert($("#<%=lblDownLoading.ClientID%>").text());
                            $uof.download($("#<%=hdnDownloadUrl.ClientID%>").val());
                            break;
                        case "Search":
                            var textboxId = $("#<%=hdnSearchTextboxId.ClientID%>").val();
                            var text = $("#" + textboxId).val();
                            if (text === "") {
                                alert("Please input keyword");
                                return;
                            }

                            var slidingZone = $find("<%= RadSlidingZone1.ClientID %>");
                            var pane = slidingZone.getPaneById("<%=RadSlidingPane1.ClientID%>");
                            pane.setContent("Searching now, please wait...");
                            slidingZone.expandPane("<%=RadSlidingPane1.ClientID%>");

                            var url = $("#<%=hdnSearchUrl.ClientID%>").val() + encodeURIComponent(text);
                            $.getJSON(url, function (data) {
                                var items = [];
                                $.each(data, function (key, val) {
                                    var pageIndex = Number(m_SystemAddedCount) + Number(val.Start);
                                    items.push("<li style='margin-top:3px; margin-left: 5px; cursor:pointer;' onclick='li_onclick(\"trpagenumber" + pageIndex + "\");'>Page:" + pageIndex + ", " + val.Text + "</li>");
                                });

                                var html = "<strong>Found " + items.length + " match(es)</strong>";
                                html += $("<ul/>", { html: items.join("") }).html();
                                pane.setContent(html);
                            });
                            break;
                    }
                    lblratio.innerHTML = orgRatio + '%';
                }

                //===== WebCache Function =====

                function item_load_callback(item, response, statusText, xhr) {
                    var url = item.url;
                    var index = item.index;
                    index += m_SystemAddedCount;
                    var td = $('#xps_content').find('tbody').children().eq(index).children().eq(0);
                    var div = $('#xps_content').find('tbody').children().eq(index).children().eq(0).children().eq(0);
                    // 加上已經載入 Cache 區的 IMG
                    var img_html = "<img class='book' style='display:none' height='" + m_PdfHeight + "' src='" + url + "'\ onload=\"img_onload(this);\" onerror=\"img_onerror(this);\" />";
                    if (response == null)
                        div.html(img_html);  // 從 Cache 中取出的資料, 直接顯示出來, 不需等待
                    else
                        setTimeout(function () { div.html(img_html); }, 200);    // delay 等待 Ajax 寫入 Cache        
                }

                function item_error_callback(item, xhr, statusText, throwError) {
                    var index = item.index;
                    var td = $('#xps_content').find('tbody').children().eq(index).children().eq(0);
                    var div = $('#xps_content').find('tbody').children().eq(index).children().eq(0).children().eq(0);
                    // 將前景圖 [X] 換成 Alert.png
                    var img_html = "<img src='../../Common/Images/XpsViewer/M_Document_Alert.png' >";
                    div.html(img_html);
                }

                function img_onload(img) {

                    // 調整長寬, 再顯示圖片        
                    var visual_img_obj = $(img);
                    visual_img_obj.css("height", m_PdfHeight);
                    // visual_img_obj.css("width",m_PdfWidth);
                    // 如果 Page 長寬不一致, 則調整長寬比
                    var w = visual_img_obj.width();
                    var h = visual_img_obj.height();

                    //if (w > m_PdfWidth) {
                    //    h = h * m_PdfWidth / w;
                    //    visual_img_obj.width(m_PdfWidth);
                    //    visual_img_obj.height(h);

                    //    var offset_y = parseInt((m_PdfHeight - h) / 2, 10);
                    //    visual_img_obj.position({ top: offset_y, left: visual_img_obj.position().left });   // vertical middle
                    //}

                    visual_img_obj.css('display', '');
                }

                function img_onerror(img) {
                    // 將前景圖 [Loading...] 換成 Alert.png
                    $(img).attr("src", "../../Common/Images/XpsViewer/M_Document_Alert.png");
                }

                function get_img_url(page_index) {
                    var angle = $uof.tool.htmlDecode($('#<%=hdnAngle.ClientID%>').val());
                    //return '../Service/GetDocToImageUGHandler.ashx?Index=' + page_index + '&Angle=' + angle + '&xid=' + m_UgId + '&uid=<%=UniqueId%>';
                    return _imageHandlerUrl + encodeURIComponent(_imageHandlerArgs.replace("__pageindex___", page_index).replace('&', '|'));
                }

                function get_thumbnail_url(page_index) {
                    var angle = $uof.tool.htmlDecode($('#<%=hdnAngle.ClientID%>').val());
                    return '../Service/GetDocToImageUGHandler.ashx?thumbnail=y&Index=' + page_index + '&Angle=' + angle + '&xid=' + m_UgId + '&uid=<%=UniqueId%>';
                }

                var is_show_current_image = false;  // 標示 ShowCurrentImage 是否已經執行過    
                var currentIndex = -1;
                function time_proc() {
                    // 停止大於 0.2 秒才會 Show 圖片
                    var dt0 = ((new Date()).getTime() - last_scroll_time) / 1000;
                    if (dt0 > 0.20 && is_show_current_image == false) {
                        is_show_current_image = true;
                        show_current_image();

                        var $content = $('#div_content');
                        var top = $content.scrollTop();
                        var topIndex = top / m_PdfHeight;
                        topIndex = parseInt(topIndex, 10) + 1;
                        var total = parseInt(m_NumberOfDocPages, 10) + parseInt(m_SystemAddedCount, 10);
                        if ((currentIndex !== topIndex)) {
                            $('.indexDisplayed').switchClass("indexDisplayed", "indexes");
                            //$('.imgDisplayed').switchClass("imgDisplayed", "imgsty");
                            currentIndex = topIndex;
                            var $li;
                            if (m_clickpage < total)
                                $li = $('#lipagenumber' + currentIndex);
                            else {
                                $li = $('#lipagenumber' + m_clickpage);
                            }
                            var $img = $li.children('img');
                            setTimeout(function () {
                                $li.switchClass("indexes", "indexDisplayed");

                            }, 10);

                        }
                    }
                    setTimeout(time_proc, 10);
                }

                function create_loading_img() {
                    var visual_img_html = "<img src='../../Common/Images/XpsViewer/M_Document_Loading.gif'\ >";
                    return $(visual_img_html);
                }


                //===== Page Function =====

                function page_onclick(page_td) {
                    var page_index = page_td.parentNode.rowIndex;
                    page_index -= m_SystemAddedCount;
                    var page_obj = $(page_td);
                    var div_obj = page_obj.children().eq(0);

                    // check 是否重讀
                    if (div_obj.children().length > 0) {
                        var img = div_obj.children().eq(0);
                        var src = img.attr("src");
                        if (src.indexOf("Alert.png") != -1) {
                            // 如果出現載入失敗, 則重 redload                
                            var loading_obj = create_loading_img();
                            div_obj.html(loading_obj); // TD 放入 [loading...]
                            // 使用 WebCache 載入
                            var item_list = [{ url: get_img_url(page_index), index: page_index }];
                            m_WebCache.request(item_list);
                        }
                    }
                }

                function show_current_image() {
                    var $content = $('#div_content');
                    var $divcontent = $('.splitterWrapper');

                    // 計算目前 Page 的 PageIndex
                    var top = $content.scrollTop();
                    var topIndex = top / m_PdfHeight;
                    topIndex = parseInt(topIndex, 10);

                    var divHeight = $content.height();
                    var bottomIndex = (top + divHeight) / m_PdfHeight;
                    bottomIndex = parseInt(bottomIndex, 10);
                    var xps_content = $('#xps_content');

                    // 上下 2 頁預載入 (視線內的 Page 先載入)
                    var index_list = [];
                    for (var i = topIndex; i <= bottomIndex; i++)
                        index_list.push(i);
                    index_list.push(bottomIndex + 1);
                    index_list.push(topIndex - 1);
                    index_list.push(bottomIndex + 2);
                    index_list.push(topIndex - 2);
                    // 過濾無效的 page number
                    var idx = 0;
                    while (idx < index_list.length) {
                        if (index_list[idx] < 0 || index_list[idx] >= m_TotalPagesCount)
                            index_list.splice(idx, 1);
                        else
                            idx++;
                    }

                    var item_list = []; // 載入清單
                    for (var i = 0; i < index_list.length; i++) {
                        var index = index_list[i];
                        if (index < m_SystemAddedCount) continue;

                        var page_obj = xps_content.find('tbody').children().eq(index).children().eq(0);    // TD            
                        var div_obj = page_obj.children().eq(0);

                        var need_load = false;
                        if (div_obj.children().length <= 0) {
                            // 如果圖片未載入, 則建立 Load 物件
                            need_load = true;
                        }
                        else {
                            // 如果是 loading 圖片
                            var src = div_obj.children().eq(0).attr("src");
                            if (src.indexOf("Loading") != -1)
                                need_load = true;
                        }

                        // 如果需要重新 loading
                        if (need_load == true) {
                            // 加入 Loading...
                            var visual_img_obj = create_loading_img();
                            div_obj.html(visual_img_obj);

                            index -= m_SystemAddedCount;
                            // 加入載入清單
                            var url = get_img_url(index + 1);
                            var item = { url: url, index: index };
                            item_list.push(item);
                        }
                    }

                    m_WebCache.request(item_list);  // 使用 WebCache 載入

                    topIndex -= 2;
                    bottomIndex += 2;
                    if (topIndex < 0)
                        topIndex = 0;
                    if (bottomIndex > m_TotalPagesCount - 1)
                        bottomIndex = m_TotalPagesCount - 1;

                    // 清除看不到的 Page 內容
                    for (var i = 0; i < m_TotalPagesCount; i++) {
                        if (i >= topIndex && i <= bottomIndex) continue;
                        if (i < m_SystemAddedCount) continue;
                        var page_td = xps_content.find('tbody').children().eq(i).children().eq(0);
                        var page_div = page_td.children().eq(0);
                        page_div.empty();
                    }
                }

                function rotation_click() {
                    var r = "0";
                    var value = $uof.tool.htmlDecode($('#<%=hdnAngle.ClientID%>').val());
                    if (value === "0") r = "90";
                    if (value === "90") r = "180";
                    if (value === "180") r = "270";

                    // 使用 replace 用來忽略頁面內的操作
                    var p = $uof.tool.htmlDecode($('#<%=hdnQueryString.ClientID%>').val());
                    var url = "PdfImageViewerUG.aspx?p=" + p + "&Rotation=" + r;
                    location.replace(url);
                }

                function ratiochange(ratioval) {
                    var $content = $('#div_content');
                    var top = $content.scrollTop();
                    var topIndex = top / m_PdfHeight;
                    topIndex = 1 + parseInt(topIndex, 10);

                    var selected_value = $('#Select1').val();
                    selected_value = ratioval;//selected_value.replace('%', '');
                    var ratio = selected_value / 100;
                    var orgh = '<%=PdfHeight%>';
                    var $div = $('.splitterWrapper');
                    //m_PdfHeight = $div.height();
                    m_PdfHeight = orgh * ratio;
                    // m_PdfWidth = orgw * ratio;
                    reinitial_page('zoomin');
                    var offsettop = m_PdfHeight;
                    var offsetleft = $('#div_content').scrollLeft();
                    var offset_y = offsettop;//offsettop - parseInt(m_PdfHeight / 2, 10)
                    $("#<%=hdnOffsetTop.ClientID%>").val(offsettop);
                    var offset_x = parseInt($("#<%=hdnWidth.ClientID%>").val() / 2, 10);


                    $("#<%=hdnOffsetLeft.ClientID%>").val(offsetleft);
                    li_onclickZoom("trpagenumber" + topIndex);
                }

                <%--function ratiochange() {
                    var $content = $('#div_content');
                    var top = $content.scrollTop();
                    var topIndex = top / m_PdfHeight;
                    topIndex = 1 + parseInt(topIndex, 10);

                    var selected_value = $('#Select1').val();
                    selected_value = selected_value.replace('%', '');
                    var ratio = selected_value / 100;
                    var orgh = '<%=PdfHeight%>';
                    var $div = $('.splitterWrapper');
                    //m_PdfHeight = $div.height();
                    m_PdfHeight = orgh * ratio;
                    // m_PdfWidth = orgw * ratio;
                    reinitial_page('zoomin');
                    var offsettop = m_PdfHeight;
                    var offsetleft = $('#div_content').scrollLeft() ;
                    var offset_y = offsettop ;//offsettop - parseInt(m_PdfHeight / 2, 10)
                    $("#<%=hdnOffsetTop.ClientID%>").val(offsettop);
                    var offset_x = parseInt($("#<%=hdnWidth.ClientID%>").val() / 2, 10);
                    

                    $("#<%=hdnOffsetLeft.ClientID%>").val(offsetleft);
                            li_onclickZoom("trpagenumber" + topIndex);
                }--%>
            </script>

        </telerik:RadScriptBlock>


    </form>
</body>
</html>
