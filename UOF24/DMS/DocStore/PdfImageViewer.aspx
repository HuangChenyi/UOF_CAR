<%@ Page Title="" Language="C#" AutoEventWireup="true" CodeBehind="PdfImageViewer.aspx.cs" Inherits="Ede.Uof.Web.DMS.DocStore.PdfImageViewer" %>
<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Web.UI" tagprefix="telerik" %>
<!DOCTYPE html>
<html style="overflow: hidden">
<head runat="server">
    <meta http-equiv="X-UA-Compatible" content="IE=edge"> 
    <meta content="text/html; charset=utf-8"/>

    <style type="text/css">
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
            width: 50px;
            margin: 0 auto;
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
            text-align: center;
            width: 32px;
            height: 32px;
            line-height: 32px;
            background: url('data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACAAAAAgCAYAAABzenr0AAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAvBJREFUeNq0V81y4jAMlkwu9MQzcOZJyomX3XJvt2wPzPAEDE/AbZcAibW2bCd2YjvO7tRtxmA7lvTp0w8Ig3E8Hul8PkNsICLkRmrfrVdVBev1GjabTXewGh7Wwne7HXzHIAJ4e/sRrFWpw9frtXspZhipPwRMrg33EQWsVqvRPWJK61A4drPARXB5uIYj5VJuqtKCU7qFVun72FpkswGF3SeRMaRIgRHmALE18qxC7xAm3il1gbHEezBc5xmdpm5NhCh5VgghyhBw1iCpWRDPhJpQgqE2Shgvg53ZBYTGYgH2nX7OjSrHPhaCPZtDYqFHSeysRYsWdndY0orZJPSu177lf6NQbxYG1DQuJ7OtSGiwEf+GwCj8OhpgkljoooeTxwClRBhUs9KqMzMWlZR/9z8V8CTjZHqYlVfSUTB6wZMQ8KBsdKminITZ6yYtLh3zOPANI61AgYlkozL1PV6SqVABlTn0YYeE/7lHqeeC3heYdw2RnJEJdVb1LuwV8fnh9p1yw+pjv3vLUkr9kKoNmI0CwQhIjoZ+VlYKDOD0EeozZ3jGKUkE8xDgULSFyCiFXacz7HiErZK9HsY9nBiltlwrK6Ft2/IwdFb3dd4pY+cI4xxytlRahYg/tLJlF/hIZEnoOhwjB00x6nKSWe9wQA2xwQbsu450BJK52jwbVqAwDP0W0C/HFDQcfj1EDE855mv4SUHfNM20C9Kp2JFOJEgouz1nuRbM5FNWP5T1dV3DcrksJ2GQ99FrPNGFI4YtHFnWq2e/38dDW7lnsRA4oxZg6A9M1Qq0sCuPW5a9vm5ZoefzCfW9ho/3d9hut6UIYKYlplGZJo5zClgulSsej4eC/gafPz9ZuPATSZELosU+0ivoBpRMsmmaJ+/U9zvcbzc4HA5R4VkSzvjFx0JtimXhGnI9br//wNfXr6TwLAJStkU/Np1gfV6HmRZ+V5brMSU82kidTie6XC7FiBjYyVNEwsvLC+9NCdfjrwADAItIds/iz1bHAAAAAElFTkSuQmCC');
            border: none;
            font-size: 15px;
            margin: 9px;
            _margin-left: 4px; /*IE6*/
        }
        .indexes:hover {
            color: #0b25d4;
            background: url('data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACAAAAAgCAYAAABzenr0AAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAjpJREFUeNrMVstKxDAUTdIqOLgYXAiKLl2Im1n4DS7Vnbp06Qf4USq4UEEEFUH9gNGF6OhOEBwEF86rM9PYmzadNpPm0XlooDS9SXPu49x7g5EwDk/L9KnyiWSDEIzyDBz9NuE6aHlpFq2vrcQHueJmAN/dWkWjGL5P0cFJOSVzszZXv2rsTSkNLOi3XCZPysR1mM4UC/1e1bsPa8PBt6Rl2CiMri5uJrFNzrElTQj640FsXc/lsnWsMN9x5FCuOrY4JQcWc3n4nZbrlDBSQJXzoox/m9SHHkeGSEK7YoTtPIBzakCC/3xKpXK7EAzgAmJB0KF7wDakY+MAJ6p4rlUWjGKMLQT/phSLCaIMgaq9mrRn2R4rD7CSGz0OIXF6kYScy2BdXEumJH93uz56//immR6Ie3tWP5fIRZAsucQBdhxQ9XyQqSLQDToXVMhO4AHjOgAhEOOmu3hw7oikg7cPSgSdM3mkNg3zpGOSuOwyGr29djfVukdaiJJAMAfytQMFIBRKBVSWi6mWlabccuZ2Stk3WN9otlFhatLMA+qwhIenr909cLD46OxBfjULPLs4X8QDNyPZeo9w4WR7oxRbX2946OLmBe1sltD+Xk4P6EosgEGsuSIwB/Ba3UOXtxUGvjBXxLlDYEI8AOe53vI6DPzq7lUKrr0V21gP1oICAA7AMH5qHrq+zwZXekDM16w97ImIB2kG4M1WqIAOnHFJFByfP9Lnt6rxvYCzPqnMdCFMNR04jF8BBgBcZhuE9wqn3gAAAABJRU5ErkJggg==');
            border: none;
        }
        .demo-container {
            border: 1px solid #e2e4e7;
            background-color: #f5f7f8;
            padding: 3px;
            text-align: center;            
            *zoom: 1:;
        }
        .splitterWrapper {
            width: 98%;
            margin: 7px;            
        }
        .indexDisplayed {
            float: left;
            list-style: none;
            cursor: pointer;
            text-align: center;
            width: 32px;
            height: 32px;
            line-height: 32px;
            border: none;
            font-size: 15px;
            margin: 9px;
            color: #0b25d4;
            background: url('data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACAAAAAgCAYAAABzenr0AAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAjpJREFUeNrMVstKxDAUTdIqOLgYXAiKLl2Im1n4DS7Vnbp06Qf4USq4UEEEFUH9gNGF6OhOEBwEF86rM9PYmzadNpPm0XlooDS9SXPu49x7g5EwDk/L9KnyiWSDEIzyDBz9NuE6aHlpFq2vrcQHueJmAN/dWkWjGL5P0cFJOSVzszZXv2rsTSkNLOi3XCZPysR1mM4UC/1e1bsPa8PBt6Rl2CiMri5uJrFNzrElTQj640FsXc/lsnWsMN9x5FCuOrY4JQcWc3n4nZbrlDBSQJXzoox/m9SHHkeGSEK7YoTtPIBzakCC/3xKpXK7EAzgAmJB0KF7wDakY+MAJ6p4rlUWjGKMLQT/phSLCaIMgaq9mrRn2R4rD7CSGz0OIXF6kYScy2BdXEumJH93uz56//immR6Ie3tWP5fIRZAsucQBdhxQ9XyQqSLQDToXVMhO4AHjOgAhEOOmu3hw7oikg7cPSgSdM3mkNg3zpGOSuOwyGr29djfVukdaiJJAMAfytQMFIBRKBVSWi6mWlabccuZ2Stk3WN9otlFhatLMA+qwhIenr909cLD46OxBfjULPLs4X8QDNyPZeo9w4WR7oxRbX2946OLmBe1sltD+Xk4P6EosgEGsuSIwB/Ba3UOXtxUGvjBXxLlDYEI8AOe53vI6DPzq7lUKrr0V21gP1oICAA7AMH5qHrq+zwZXekDM16w97ImIB2kG4M1WqIAOnHFJFByfP9Lnt6rxvYCzPqnMdCFMNR04jF8BBgBcZhuE9wqn3gAAAABJRU5ErkJggg==');
            _margin-left: 4px; /*IE6*/
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

	    <telerik:RadAjaxLoadingPanel ID="RadAjaxLoadingPanel" runat="server"></telerik:RadAjaxLoadingPanel>
	    <div class="demo-container">
		    <div class="splitterWrapper">
			    <telerik:RadSplitter ID="RadSplitter1" Width="100%" Height="100%" runat="server" Orientation="Vertical" Skin="Telerik" 
                    ResizeWithParentPane="False" ResizeWithBrowserWindow="True">
			    
				    <telerik:RadPane ID="RadPane3" CssClass="contentPaneDecorator" runat="server" Width="70px"
					    MinWidth="50" MinHeight="50">
					    <ul id="indexesList" class="verticalIndexes"></ul>
				    </telerik:RadPane>                
                    <telerik:RadSplitBar ID="RadSplitBar1" runat="server"/>						
				    <telerik:RadPane ID="RadPane2" CssClass="contentPaneDecorator" runat="server">
                        <div id="div_content" style="overflow:auto; position:relative; width:100%; height:100%;">
                            <table id="xps_content" width="100%" cellpadding="0" cellspacing="0"></table>    
                        </div>					
				    </telerik:RadPane>
			        <telerik:RadSplitBar ID="RadSplitBar2" runat="server"/>                
				    <telerik:RadPane ID="RadPane1" runat="server" Width="22px" >
					    <telerik:RadSlidingZone ID="RadSlidingZone1" runat="server" Width="22px" SlideDirection="Left">
					        <telerik:RadSlidingPane ID="RadSlidingPane1" runat="server" Width="250px" Title="Search Results" 
					                                EnableDock="false" MinWidth="225" MinHeight="225"/>						
					    </telerik:RadSlidingZone>
				    </telerik:RadPane>                
			    </telerik:RadSplitter>
		    </div>
	    </div>
    
        <div style="text-align: center; margin-top: 5px">
            <telerik:RadToolBar ID="RadToolBar1" runat="server" OnClientButtonClicking="OnBarMainClicking">
                <Items>
                    <telerik:RadToolBarButton Value="template">
                        <ItemTemplate>
                            <telerik:RadNumericTextBox ID="RadNumericTextBox1" runat="server" Type="Number" Value="1" SelectionOnFocus="SelectAll"
                                Width="36" NumberFormat-DecimalDigits="0" MinValue="1" AutoPostBack="False" AllowOutOfRangeAutoCorrect="True">
                                <ClientEvents OnKeyPress="numeric_onchanged" />
                            </telerik:RadNumericTextBox>
                            <div style="display:inline; ">
                                ／<asp:Label ID="lblNumberOfPages" runat="server"></asp:Label>
                            </div>
                        </ItemTemplate>
                    </telerik:RadToolBarButton>                
                    <telerik:RadToolBarButton runat="server" DisabledImageUrl="~/dms/images/docviewer/up.png"
                        HoveredImageUrl="~/dms/images/docviewer/up.png" ImageUrl="~/dms/images/docviewer/up.png"
                        CheckedImageUrl="~/dms/images/docviewer/up.png" Text="" ToolTip="Previous page" Value="Previous" >                 
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton runat="server" DisabledImageUrl="~/dms/images/docviewer/down.png"
                        HoveredImageUrl="~/dms/images/docviewer/down.png" ImageUrl="~/dms/images/docviewer/down.png"
                        CheckedImageUrl="~/dms/images/docviewer/down.png" Text="" ToolTip="Next page" Value="Next" >
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton runat="server" DisabledImageUrl="~/dms/images/docviewer/rotate.png"
                        HoveredImageUrl="~/dms/images/docviewer/rotate.png" ImageUrl="~/dms/images/docviewer/rotate.png"
                        CheckedImageUrl="~/dms/images/docviewer/rotate.png" Text="" ToolTip="Rotate" Value="Rotate" >
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton runat="server" DisabledImageUrl="~/dms/images/docviewer/download.png"
                        HoveredImageUrl="~/dms/images/docviewer/download.png" ImageUrl="~/dms/images/docviewer/download.png"
                        CheckedImageUrl="~/dms/images/docviewer/download.png" Text="" ToolTip="Download" Value="Download" >
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton Value="textbox">
                        <ItemTemplate>
                            <telerik:RadTextBox ID="RadTextBox1" runat="server" Width="120" AutoPostBack="False">                            
                            </telerik:RadTextBox>
                        </ItemTemplate>
                    </telerik:RadToolBarButton> 
                    <telerik:RadToolBarButton runat="server" DisabledImageUrl="~/dms/images/docviewer/search2.png"
                        HoveredImageUrl="~/dms/images/docviewer/search2.png" ImageUrl="~/dms/images/docviewer/search2.png"
                        CheckedImageUrl="~/dms/images/docviewer/search2.png" Text="" ToolTip="Search" Value="Search" >
                    </telerik:RadToolBarButton>
                </Items>
            </telerik:RadToolBar>           
        </div>
 
        <asp:HiddenField ID="hdnQueryString" runat="server" Value="0"/>
        <asp:HiddenField ID="hdnAngle" runat="server" Value="0"/>    
        <asp:HiddenField ID="hdnHistoryImagesStringJson" runat="server" Value="[]" />
        <asp:HiddenField ID="hdnSummaryImageStr" runat="server" />
        <asp:HiddenField ID="hdnSearchUrl" runat="server" />
        <asp:HiddenField ID="hdnDownloadUrl" runat="server" />
        <asp:HiddenField ID="hdnSearchTextboxId" runat="server" /> 
        <asp:HiddenField ID="hdnNumericId" runat="server" /> 
    
    
        <telerik:RadScriptBlock runat="server">
            <script type="text/javascript">
                var m_NumberOfDocPages = -1;
                var m_TotalPagesCount = -1;
                var m_SystemAddedCount = -1;
                var m_XpsId = '';
                var m_XpsWidth = -1;
                var m_XpsHeight = -1;
                var m_WebCache = null;

                function body_ready() {
                    
                    m_NumberOfDocPages = '<%=NumberOfPages%>';
                    m_TotalPagesCount = '<%=TotalPagesCount%>';
                    m_SystemAddedCount = m_TotalPagesCount - m_NumberOfDocPages;
                    m_XpsId = '<%=SourceXpsId%>';

                    var angle = $uof.tool.htmlDecode($('#<%=hdnAngle.ClientID%>').val());
                    if (angle === "90" || angle === "270") {
                        m_XpsWidth = '<%=XpsHeight%>';
                        m_XpsHeight = '<%=XpsWidth%>';
                    } else {
                        m_XpsWidth = '<%=XpsWidth%>';
                        m_XpsHeight = '<%=XpsHeight%>';
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
                }

                $(document).ready(body_ready);

                // disable context menu
                $(document).bind("contextmenu", function (e) { e.preventDefault(); });


                var last_scroll_time = new Date().getTime();
                function initial_page() {

                    var toolBar = $find("<%= RadToolBar1.ClientID %>");
                    var previousItem = toolBar.findItemByValue("Previous");
                    var nextItem = toolBar.findItemByValue("Next");
                    previousItem.set_enabled(false);

                    // 設定 scroll 事件
                    $('#div_content').scroll(function() {
                        last_scroll_time = new Date().getTime();
                    
                        // 捲動時, 重設 Show FLAG
                        is_show_current_image = false;
                    
                        // 計算目前 Page 的 PageIndex
                        var $content = $('#div_content');
                        var top = $content.scrollTop();
                        var topIndex = top / m_XpsHeight;
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
                        var pageHtml = "<tr id='trpagenumber" + initNumber + "'><td class='page_normal' style=\"height:" + m_XpsHeight + "px\" >"
                                + "<img src='data:image/png;base64," + imageStr + "' alt='Doc Cover' />"
                                + "</td></tr>\r\n";
                        $xpsContent.append(pageHtml);
                        $indexList.append("<li class='indexes' id='lipagenumber" + initNumber + "' onclick='li_onclick(\"trpagenumber" + initNumber + "\");'>" + initNumber + "</li>");
                        initNumber++;
                    }

                    // 建立所有空白 Page
                    for (var i = 0 ; i < m_NumberOfDocPages ; i++) {
                        var pageHtml = "<tr id='trpagenumber" + initNumber + "'><td class='page_normal' style=\"height:" + m_XpsHeight + "px\" onclick='page_onclick(this);' ></td></tr>\r\n";
                        $xpsContent.append(pageHtml);
                        $indexList.append("<li class='indexes' id='lipagenumber" + initNumber + "' onclick='li_onclick(\"trpagenumber" + initNumber + "\");'>" + initNumber + "</li>");
                        initNumber++;                    
                    }               

                    // 建立 初始化 WebCache 物件 物件
                    m_WebCache = new webcache();

                    var all_item = [];
                    for (var i = 0 ; i < m_NumberOfDocPages ; i++) {
                        var url = get_img_url(i);
                        all_item.push({ url: url, index: i });
                    }
                    m_WebCache.init(all_item, item_load_callback, item_error_callback);
                
                    time_proc();
                }

                function li_onclick(trtagId) {
                    var $divContent = $('#div_content');
                    var trtagOffsetTop = $('#' + trtagId).offset().top;
                    var contentScrollTop = $divContent.scrollTop();
                    $divContent.animate({ scrollTop: contentScrollTop + trtagOffsetTop }, 750);
                }

                function liScrollToView(litagId, index) {
                   var splitter = $find("<%= RadSplitter1.ClientID %>");
                    var pane = splitter.getPaneById("<%= RadPane3.ClientID %>");
                    pane.setScrollPos(0, --index * 48);
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

                    // 計算目前 Page 的 PageIndex
                    var $content = $('#div_content');
                    var top = $content.scrollTop();
                    var topIndex = top / m_XpsHeight;
                    topIndex = 1 + parseInt(topIndex, 10);

                    var oButton = args.get_item();
                    switch(oButton.get_value()) {
                        case "Next":
                            li_onclick("trpagenumber" + (++topIndex));
                            break;
                        case "Previous":
                            li_onclick("trpagenumber" + (--topIndex));
                            break;
                        case "Rotate":
                            rotation_click();
                            break;
                        case "Download":
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
                            $.getJSON(url, function(data) {
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
                }

                //===== WebCache Function =====

                function item_load_callback(item, response, statusText, xhr) {
                    var url = item.url;
                    var index = item.index;
                    index += m_SystemAddedCount;
                    var td = $('#xps_content').find('tbody').children().eq(index).children().eq(0);

                    // 加上已經載入 Cache 區的 IMG
                    var img_html = "<img style='display:none' src='" + url + "'\ onload=\"img_onload(this);\" onerror=\"img_onerror(this);\" />";
                    if (response == null)
                        td.html(img_html);  // 從 Cache 中取出的資料, 直接顯示出來, 不需等待
                    else
                        setTimeout(function () { td.html(img_html); }, 200);    // delay 等待 Ajax 寫入 Cache        
                }

                function item_error_callback(item, xhr, statusText, throwError) {
                    var index = item.index;
                    var td = $('#xps_content').find('tbody').children().eq(index).children().eq(0);

                    // 將前景圖 [X] 換成 Alert.png
                    var img_html = "<img src='../../Common/Images/XpsViewer/M_Document_Alert.png' >";
                    td.html(img_html);
                }

                function img_onload(img) {

                    // 調整長寬, 再顯示圖片        
                    var visual_img_obj = $(img);
                    visual_img_obj.css("height", m_XpsHeight);

                    // 如果 Page 長寬不一致, 則調整長寬比
                    var w = visual_img_obj.width();
                    var h = visual_img_obj.height();

                    if (w > m_XpsWidth) {
                        h = h * m_XpsWidth / w;
                        visual_img_obj.width(m_XpsWidth);
                        visual_img_obj.height(h);

                        var offset_y = parseInt((m_XpsHeight - h) / 2, 10);
                        visual_img_obj.position({ top: offset_y, left: visual_img_obj.position().left });   // vertical middle
                    }

                    visual_img_obj.css('display', '');
                }

                function img_onerror(img) {
                    // 將前景圖 [Loading...] 換成 Alert.png
                    $(img).attr("src", "../../Common/Images/XpsViewer/M_Document_Alert.png");
                }

                function get_img_url(page_index) {
                    var angle = $uof.tool.htmlDecode($('#<%=hdnAngle.ClientID%>').val());
                    return '../Service/GetDocToImageHandler.ashx?Index=' + page_index + '&Angle=' + angle + '&xid=' + m_XpsId + '&uid=<%=UniqueId%>';
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
                        var topIndex = top / m_XpsHeight;
                        topIndex = parseInt(topIndex, 10) + 1;
                        if (currentIndex !== topIndex) {
                            $('.indexDisplayed').switchClass("indexDisplayed", "indexes");
                            currentIndex = topIndex;
                            var $li = $('#lipagenumber' + currentIndex);
                            setTimeout(function () { $li.switchClass("indexes", "indexDisplayed"); }, 100);
                        }
                    }
                    setTimeout(time_proc, 100);
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
                
                    // check 是否重讀
                    if (page_obj.children().length > 0) {
                        var img = page_obj.children().eq(0);
                        var src = img.attr("src");

                        if (src.indexOf("Alert.png") != -1) {
                            // 如果出現載入失敗, 則重 redload                
                            var loading_obj = create_loading_img();
                            page_obj.html(loading_obj); // TD 放入 [loading...]

                            // 使用 WebCache 載入
                            var item_list = [{ url: get_img_url(page_index), index: page_index }];
                            m_WebCache.request(item_list);
                        }
                    }
                }

                function show_current_image() {
                    var $content = $('#div_content');
                
                    // 計算目前 Page 的 PageIndex
                    var top = $content.scrollTop();
                    var topIndex = top/ m_XpsHeight;
                    topIndex = parseInt(topIndex, 10);

                    var divHeight = $content.height();
                    var bottomIndex = (top + divHeight) / m_XpsHeight;
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
                    for (var i = 0 ; i < index_list.length; i++) {
                        var index = index_list[i];
                        if (index < m_SystemAddedCount)continue;

                        var page_obj = xps_content.find('tbody').children().eq(index).children().eq(0);    // TD            

                        var need_load = false;
                        if (page_obj.children().length <= 0) {
                            // 如果圖片未載入, 則建立 Load 物件
                            need_load = true;
                        }
                        else {
                            // 如果是 loading 圖片
                            var src = page_obj.children().eq(0).attr("src");
                            if (src.indexOf("Loading") != -1)
                                need_load = true;
                        }

                        // 如果需要重新 loading
                        if (need_load == true) {
                            // 加入 Loading...
                            var visual_img_obj = create_loading_img();
                            page_obj.html(visual_img_obj);

                            index -= m_SystemAddedCount;
                            // 加入載入清單
                            var url = get_img_url(index);
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
                    for (var i = 0 ; i < m_TotalPagesCount ; i++) {
                        if (i >= topIndex && i <= bottomIndex) continue;
                        if (i < m_SystemAddedCount) continue;
                        var page_td = xps_content.find('tbody').children().eq(i).children().eq(0);
                        page_td.empty();
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
                    var url = "PdfImageViewer.aspx?p=" + p + "&Rotation=" + r;
                    location.replace(url);                    
                }

            </script>
        
        </telerik:RadScriptBlock>


    </form>
</body>
</html>
