<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UC_DMSXpsViewer.ascx.cs" Inherits="Ede.Uof.Web.DMS.WKFOptionalFields.UC_DMSXpsViewer" %>

<%@ Register Src="~/Common/FileCenter/V3/UC_FileCenter.ascx" TagName="UC_FileCenter" TagPrefix="uc1" %>

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
    .xps-image-container {
        border: 1px solid #e2e4e7;
        background-color: #f5f7f8;
        padding: 3px;
        text-align: center;            
        *zoom: 1:;
    }
    .xps-image-warpper {
        width: 98%;
        margin: 7px;            
    }
    .xps-image-content-uc {
        overflow:auto; 
        position:relative; 
        width:100%; 
        height:100%;
    }
    .xps-image-table {
        width: 100%;
        border-collapse: separate;
        border-spacing: 0;
        text-align:center;
    }
        .xps-image-table td, .xps-image-table th {
            padding: 0;
        }
   .ug-image-warpper {
        width: 98%;
        margin: 7px;            
    }
</style>
<script type="text/javascript" src="<%=ResolveUrl("~") %>Common/javascript/webcache.js"></script>

<script type="text/javascript">
    /* <![CDATA[ */

    var <%=ClientID %>fitstyle = '';
    var clientpageratio = 1;
        var <%=ClientID %>defaultWidth= 1;    //頁面給的預設值放大寬度
        var <%=ClientID %>orgwidth;//$(window).width() * 0.7;   

    $(function() {
        control_init<%=ClientID %>();
    });
    function control_init<%=ClientID %>() {
        console.log('ugclientid=' + '#<%=ClientID %>');
          $("body").on("contextmenu", "img", function(e) { return false; });
        <%=ClientID %>defaultWidth=$("#<%=hdnDefaultRatio.ClientID %>").val();
        var <%=ClientID %>width = $("#<%=hdnWidth.ClientID %>").val();
        var wp = $("#<%=hdnWidthPercentage.ClientID %>").val();
        var height = $("#<%=hdnHeight.ClientID %>").val();
        var hp = $("#<%=hdnHeightPercentage.ClientID %>").val();
        var percent = "%";
        var $xpsvw = $("#<%=ClientID %> .xps-image-container");
        var $uimgvw = $("#<%=ClientID %> .ug-image-container");
        var $divug = $('#<%=divug_content.ClientID %>');
        var $divxps = $('#<%=div_content.ClientID %>');
        var $select = $("#<%=ClientID %> .selectratiostyle");

         <%=ClientID %>orgwidth=<%=ClientID %>width;
        if(<%=ClientID %>defaultWidth>1){
            var toolBar = $find("<%=RadToolBar2.ClientID %>");
            if(toolBar != null) {
                var ratiobutton = toolBar.findItemByValue("RatioValue");
                var lblratio = $telerik.findElement(ratiobutton.get_element(), ("lblRatio"));
                lblratio.innerHTML=(<%=ClientID %>defaultWidth *100)+'%';
            }
         }

        if (<%=ClientID %>width > 0) {
            var tmpwidth = $(window).width() * 0.7 * <%=ClientID %>defaultWidth;
            if (wp === "true") {
                if (<%=ClientID %>width < 100) {
                    $xpsvw.width(<%=ClientID %>width + percent);
                    $uimgvw.width(<%=ClientID %>width + percent);
                    $divxps.width(<%=ClientID %>width + percent);
                    $divug.width(<%=ClientID %>width + percent);                   
                }
                

                setTimeout(function () {
                    $("#<%=hdnUgWidth.ClientID %>").val(tmpwidth);
                    
                },100);
               <%=ClientID %>orgwidth=$(window).width() * 0.7 ;
            } else {
                $xpsvw.width(<%=ClientID %>width > 610 ? <%=ClientID %>width : "610"); //min:610    
                $uimgvw.width(<%=ClientID %>width > 610 ? <%=ClientID %>width : "610"); //min:610    
                $divxps.width(<%=ClientID %>width > 610 ? <%=ClientID %>width : "610"); //min:610   
                $divug.width(<%=ClientID %>width > 610 ? <%=ClientID %>width : "610"); //min:610  
                $("#<%=hdnUgWidth.ClientID %>").val(<%=ClientID %>width  * <%=ClientID %>defaultWidth);
                <%=ClientID %>orgwidth=<%=ClientID %>width ;
            }
            if (Number(<%=ClientID %>width) === 1160 || Number(<%=ClientID %>width) === 100) {
                $select.val('Fit');
                
                $select.find("option:selected").text('Fit Width');
                if (Number(<%=ClientID %>width) === 100) {
                    <%=ClientID %>fitstyle = 'screen';
                    clientpageratio = tmpwidth / 1160;
                }
            }
            
            console.log('init width='+<%=ClientID %>orgwidth);
        }

        if (height > 0) {
            var tmpheight = $(window).height()-70 * <%=ClientID %>defaultWidth;
            if (hp === "true") {
                if (height < 100) {
                    $xpsvw.height(height + percent);
                    $uimgvw.height(height + percent);
                    $divxps.height(height + percent);
                    $divug.height(height + percent);
                    
                }
                $("#<%=hdnUgHeight.ClientID %>").val(tmpheight);
            } else {
                $xpsvw.height(height);
                $uimgvw.height(height);
                $divxps.height(height - 60);
                $divug.height(height - 60);
                if(<%=ClientID %>defaultWidth>1){
                    $select.val((<%=ClientID %>defaultWidth*100)+'%');
                }
                else
                    $select.val('Fit');

            }
            if (Number(height) === 1160) {
                var heightratio = '<%=glbPdfHeight%>' / 1160; //clientpageratio
                if (heightratio > clientpageratio)
                    clientpageratio = heightratio;
            }
        }
        else {
            $xpsvw.height("100%");
            $uimgvw.height("100%");
            $divxps.height("100%");
            $divug.height("100%");
             
        }

        if ($("#<%=hdnUse.ClientID %>").val() === "XPS") {
            $("#<%=ClientID %> .xps-image-container").show();
        }
        else {
            $("#<%=ClientID %> .ug-image-container").show();
        }
        
        if ($divug.css("display") == "none")
            $uimgvw.height(0);
       
    }
       
    /* ]]> */
</script>
<div id="<%=ClientID %>" class="<%=ClientID %>" style="overflow: hidden">
<%--<asp:UpdatePanel ID="UpdatePanel1" runat="server" ChildrenAsTriggers="True" UpdateMode="Conditional">
    <ContentTemplate>
        <asp:Button ID="btnReconvert" runat="server" Text="重新轉檔" OnClick="btnReconvert_Click" Visible="False" CausesValidation="false" meta:resourcekey="btnReconvertResource1"/>   
        <asp:HiddenField ID="hdnViewerVisible" runat="server" Value="1" />                               
        </ContentTemplate>
</asp:UpdatePanel>--%>
 
<div class="xps-image-container" style="display: none">
        <div style="text-align: center; margin-top: 5px;">
        <telerik:RadToolBar ID="RadToolBar1" runat="server"  Visible="False" meta:resourcekey="RadToolBar1Resource1" SingleClick="None" >
            <Items>
                <telerik:RadToolBarButton runat="server" Text="" ToolTip="Rotate" Value="Rotate" 
                    DisabledImageUrl="~/dms/images/docviewer/rotate.png"
                    HoveredImageUrl="~/dms/images/docviewer/rotate.png" 
                    ImageUrl="~/dms/images/docviewer/rotate.png"
                    CheckedImageUrl="~/dms/images/docviewer/rotate.png" meta:resourcekey="RadToolBarButtonResource1" >
                </telerik:RadToolBarButton>

            </Items>
        </telerik:RadToolBar>           
    </div>
	<div class="xps-image-warpper">

                <div id="div_content"  runat="server"  class="xps-image-content-uc">
                    <table id="xps_content" runat="server"  class="xps-image-table" ></table>
                </div>				

	</div>

</div>
<div class="ug-image-container" style="display: none">
        <div style="text-align: center; margin-top: 5px;">
        <telerik:RadToolBar ID="RadToolBar2" runat="server" Visible="False" meta:resourcekey="RadToolBar2Resource1" SingleClick="None" >
            <Items>
                <telerik:RadToolBarButton runat="server" Text="" ToolTip="Rotate" Value="Rotate" 
                    DisabledImageUrl="~/dms/images/docviewer/rotate2.png"
                    HoveredImageUrl="~/dms/images/docviewer/rotate2.png" 
                    ImageUrl="~/dms/images/docviewer/rotate2.png"
                    CheckedImageUrl="~/dms/images/docviewer/rotate2.png" meta:resourcekey="RadToolBarButtonResource2" >
                </telerik:RadToolBarButton>
                <telerik:RadToolBarButton runat="server" IsSeparator="true" meta:resourcekey="RadToolBarButtonResource3" >
                            </telerik:RadToolBarButton>
                <telerik:RadToolBarButton runat="server" Text="" ToolTip="Plus" Value="Plus" 
                    DisabledImageUrl="~/dms/images/docviewer/plus.png"
                    HoveredImageUrl="~/dms/images/docviewer/plus.png" 
                    ImageUrl="~/dms/images/docviewer/plus.png"
                    CheckedImageUrl="~/dms/images/docviewer/plus.png" meta:resourcekey="RadToolBarButtonResource4" >
                </telerik:RadToolBarButton>
                <telerik:RadToolBarButton runat="server" Value="RatioValue" meta:resourcekey="RadToolBarButtonResource5"  >
                                            <ItemTemplate>
                                                <asp:Label ID="lblRatio" runat="server" Text="100%" meta:resourcekey="lblRatioResource1"></asp:Label>
                                                </ItemTemplate>
                </telerik:RadToolBarButton>
                 <telerik:RadToolBarButton runat="server" Text="" ToolTip="Minus" Value="Minus" 
                    DisabledImageUrl="~/dms/images/docviewer/minus.png"
                    HoveredImageUrl="~/dms/images/docviewer/minus.png" 
                    ImageUrl="~/dms/images/docviewer/minus.png"
                    CheckedImageUrl="~/dms/images/docviewer/minus.png" meta:resourcekey="RadToolBarButtonResource6" >
                </telerik:RadToolBarButton>
                <telerik:RadToolBarButton Value="ratioselect" Visible="false" meta:resourcekey="RadToolBarButtonResource7">
                        <ItemTemplate>
                            <select id="Select1" runat="server" class="selectratiostyle">
                            </select>
                        </ItemTemplate>
                    </telerik:RadToolBarButton> 
                 <telerik:RadToolBarButton Value="Left" Visible="true" meta:resourcekey="RadToolBarButtonResource8"  >
                     <ItemTemplate>
                     <asp:CheckBox ID="CheckBox1" runat="server" Text="置中" meta:resourcekey="CheckBox1Resource1" />
                        </ItemTemplate>
                </telerik:RadToolBarButton> 
            </Items>
        </telerik:RadToolBar>           
    </div>
	<div class="ug-image-warpper" >
                <div id="divug_content" runat="server" class="xps-image-content-uc">
                    <table id="ug_content" runat="server" class="xps-image-table" ></table>
                </div>				
	

        </div>

</div>

<asp:HiddenField ID="hdnQueryString" runat="server" Value="0"/>
<asp:HiddenField ID="hdnAngle" runat="server" Value="0"/>    
<asp:HiddenField ID="hdnHistoryImagesStringJson" runat="server" Value="[]" />
<asp:HiddenField ID="hdnSummaryImageStr" runat="server" />
<asp:HiddenField ID="hdnSearchUrl" runat="server" />
<asp:HiddenField ID="hdnDownloadUrl" runat="server" />
<asp:HiddenField ID="hdnDownloadViewerImage" runat="server" />
<asp:HiddenField ID="hdnSearchTextboxId" runat="server" /> 
<asp:HiddenField ID="hdnSourceXpsId" runat="server" /> 
<asp:HiddenField ID="hdnSourceUgId" runat="server" /> 
<asp:HiddenField ID="hdnNumericId" runat="server" /> 

<asp:HiddenField ID="hdnWidthPercentage" runat="server" Value="false" />
<asp:HiddenField ID="hdnWidth" runat="server" Value="0" />
<asp:HiddenField ID="hdnHeightPercentage" runat="server" Value="false" />
<asp:HiddenField ID="hdnNumberOfPages" runat="server" Value="0" />
<asp:HiddenField ID="hdnXpsWidth" runat="server" Value="0" />
<asp:HiddenField ID="hdnXpsHeight" runat="server" Value="0" />
<asp:HiddenField ID="hdnUgWidth" runat="server" Value="0" />
<asp:HiddenField ID="hdnUgHeight" runat="server" Value="0" />
<asp:HiddenField ID="hdnHeight" runat="server" Value="0" />
<asp:HiddenField ID="hdnDcsRegistrable" runat="server" />
<asp:HiddenField ID="hdnUse" runat="server" Value="UIMG" />
<asp:HiddenField ID="hdnPageHeight" runat="server" Value="0" />
<asp:HiddenField ID="hdnPageRatio" runat="server" Value="1" />
<asp:HiddenField ID="hdnDefaultRatio" runat="server" Value="1" />
<asp:HiddenField ID="hdnClientId" runat="server" />
<asp:HiddenField ID="hdnIsMobile" runat="server" value="false"/>
<asp:Label ID="lblConverting" runat="server" Visible="False" Text="文件轉檔中，請稍後重新整理。"  meta:resourcekey="lblConvertingResource1"></asp:Label>
<asp:Label ID="lblCenter" runat="server" Visible="False" Text="置中"  meta:resourcekey="lblCenterResource1"></asp:Label>
</div>

    <telerik:RadScriptBlock runat="server">
        <script type="text/javascript">
            var <%=ClientID %>m_NumberOfDocPages = -1;
            var <%=ClientID %>m_TotalPagesCount = -1;
            var <%=ClientID %>m_SystemAddedCount = 0;
            var <%=ClientID %>m_XpsWidth = -1;
            var <%=ClientID %>m_XpsHeight = -1;
            var <%=ClientID %>m_UgWidth = -1;
            var <%=ClientID %>m_UgHeight = -1;
            var <%=ClientID %>m_XpsId = '';
            var <%=ClientID %>m_UgId = '';
            var <%=ClientID %>_imageHandlerUrl = '';
            var <%=ClientID %>_imageHandlerArgs = '';
            var <%=ClientID %>m_WebCache = null;
            function body_ready_<%=ClientID %>() {
                splitterRisize_<%=ClientID %>();
                $(window).resize(splitterRisize_<%=ClientID %>);
                <%=ClientID %>_imageHandlerUrl = '<%=PageImageHandler%>';
                <%=ClientID %>_imageHandlerArgs = '<%=PageImageHandlerArgs%>';
                <%=ClientID %>m_NumberOfDocPages = '<%=NumberOfPages%>';
                <%=ClientID %>m_TotalPagesCount = '<%=TotalPagesCount%>';
                <%=ClientID %>m_SystemAddedCount = <%=ClientID %>m_TotalPagesCount - <%=ClientID %>m_NumberOfDocPages;
                <%=ClientID %>m_XpsWidth = '<%=XpsWidth%>';
                <%=ClientID %>m_XpsHeight = '<%=XpsHeight%>';
                <%=ClientID %>m_UgWidth = 0;
                
                if ($("#<%=hdnUgWidth.ClientID %>").val() !== "") {
                    if ($("#<%=hdnWidthPercentage.ClientID %>").val() === "true"){
                        if(<%=ClientID %>defaultWidth>1)
                            <%=ClientID %>m_UgWidth = (<%=ClientID %>orgwidth - 10);
                        else
                            <%=ClientID %>m_UgWidth = (<%=ClientID %>orgwidth - 10)* <%=ClientID %>defaultWidth;
                    }
                    else
                        <%=ClientID %>m_UgWidth = $("#<%=hdnUgWidth.ClientID %>").val()* <%=ClientID %>defaultWidth;
                }
                else
                    <%=ClientID %>m_UgWidth = '<%=UgWidth%>' * <%=ClientID %>defaultWidth;
                
                console.log('width=' +<%=ClientID %>m_UgWidth);
                
                 <%=ClientID %>m_UgHeight = 0;
                console.log('PageRatio=' + $("#<%=hdnPageRatio.ClientID %>").val());
                if ($("#<%=hdnUgHeight.ClientID %>").val() !== "") {
                    <%=ClientID %>m_UgHeight = $("#<%=hdnPageRatio.ClientID %>").val() * <%=ClientID %>m_UgWidth * <%=ClientID %>defaultWidth;
                } else {
                    <%=ClientID %>m_UgHeight = '<%=UgHeight%>'* <%=ClientID %>defaultWidth;
                }

                <%=ClientID %>m_XpsId = '<%=SourceXpsId%>';
                <%=ClientID %>m_UgId = '<%=SourceUgId%>';
                // 建立所有 Page 的 BLOCK
                if ($("#<%=hdnUse.ClientID %>").val() === "XPS") {
                    initial_page_<%=ClientID %>();
                }
                else {
                    initial_ugpage_<%=ClientID %>();
                }
                var rowCount = $("#<%=ClientID %> .page_normal").length;
                console.log('rowCount=' + rowCount);
                console.log('UniqueId=' + '<%=WatermarkUniqueId%>');
                if (rowCount === 0 ) {
                    $("#<%=ClientID %> .ug-image-container").hide();
                }
                setTimeout(function () {
                    console.log('ug-image-container='+$('#<%=ClientID %> .ug-image-container').width());
                    console.log('defaultWidth'+<%=ClientID %>defaultWidth);
                    var containwidth = $('#<%=ClientID %> .ug-image-container').width() * <%=ClientID %>defaultWidth;
                <%=ClientID %>m_UgWidth =$("#<%=hdnUgWidth.ClientID %>").val(); //containwidth ;
                                console.log('m_UgWidth='+<%=ClientID %>m_UgWidth);
                <%=ClientID %>m_UgHeight = $("#<%=hdnPageRatio.ClientID %>").val() * <%=ClientID %>m_UgWidth;
                $("#<%=ClientID %> .page_normal").each(function (index) {
                    $(this).height(<%=ClientID %>m_UgHeight );
                    $(this).width(<%=ClientID %>m_UgWidth);
                });
               
                    $("#<%=ClientID %> .book").each(function (index) {
                    $(this).height(<%=ClientID %>m_UgHeight);
                    show_current_ugimage_<%=ClientID %>();
                    $(this).css('display', '');
                });
                }, 800);
            }

            $(document).ready(body_ready_<%=ClientID %>);


            function body_ready2_<%=ClientID %>() {
                splitterRisize_<%=ClientID %>();
                $(window).resize(splitterRisize_<%=ClientID %>);
                <%=ClientID %>_imageHandlerUrl = '<%=PageImageHandler%>';
                <%=ClientID %>_imageHandlerArgs = '<%=PageImageHandlerArgs%>';
                <%=ClientID %>m_NumberOfDocPages = '<%=NumberOfPages%>';
                <%=ClientID %>m_XpsWidth = '<%=XpsWidth%>';
                <%=ClientID %>m_XpsHeight = '<%=XpsHeight%>';
                <%=ClientID %>m_UgWidth = 0;
                <%=ClientID %>m_filegroupid = '<%=FileIdOrFileGroupId %>';
                console.log('filegroupid2=' +<%=ClientID %>m_filegroupid );
                if ($("#<%=hdnUgWidth.ClientID %>").val() !== "") {
                    if ($("#<%=hdnWidthPercentage.ClientID %>").val() === "true"){
                        if(<%=ClientID %>defaultWidth>1)
                            <%=ClientID %>m_UgWidth = (<%=ClientID %>orgwidth - 10);
                        else
                            <%=ClientID %>m_UgWidth = (<%=ClientID %>orgwidth - 10)* <%=ClientID %>defaultWidth;
                    }
                    else
                        <%=ClientID %>m_UgWidth = $("#<%=hdnUgWidth.ClientID %>").val()* <%=ClientID %>defaultWidth;
                }
                else
                    <%=ClientID %>m_UgWidth = '<%=UgWidth%>' * <%=ClientID %>defaultWidth;
                
                console.log('width=' +<%=ClientID %>m_UgWidth);
                
                 <%=ClientID %>m_UgHeight = 0;
                console.log('PageRatio=' + $("#<%=hdnPageRatio.ClientID %>").val());
                if ($("#<%=hdnUgHeight.ClientID %>").val() !== "") {
                    <%=ClientID %>m_UgHeight = $("#<%=hdnPageRatio.ClientID %>").val() * <%=ClientID %>m_UgWidth * <%=ClientID %>defaultWidth;
                } else {
                    <%=ClientID %>m_UgHeight = '<%=UgHeight%>'* <%=ClientID %>defaultWidth;
                }

                <%=ClientID %>m_XpsId = '<%=SourceXpsId%>';
                <%=ClientID %>m_UgId = '<%=SourceUgId%>';
                // 建立所有 Page 的 BLOCK
                if ($("#<%=hdnUse.ClientID %>").val() === "XPS") {
                    initial_page_<%=ClientID %>();
                }
                else {
                    initial_ugpage_<%=ClientID %>();
                }
                var rowCount = $("#<%=ClientID %> .page_normal").length;
                console.log('UniqueId=' + '<%=WatermarkUniqueId%>');
                if (rowCount === 0 ) {
                    $("#<%=ClientID %> .ug-image-container").hide();
                }
                setTimeout(function () {
                    console.log('ug-image-container='+$('#<%=ClientID %> .ug-image-container').width());
                    console.log('defaultWidth'+<%=ClientID %>defaultWidth);
                    var containwidth = $('#<%=ClientID %> .ug-image-container').width() * <%=ClientID %>defaultWidth;
                <%=ClientID %>m_UgWidth =$("#<%=hdnUgWidth.ClientID %>").val(); //containwidth ;
                                console.log('m_UgWidth='+<%=ClientID %>m_UgWidth);
                <%=ClientID %>m_UgHeight = $("#<%=hdnPageRatio.ClientID %>").val() * <%=ClientID %>m_UgWidth;
                $("#<%=ClientID %> .page_normal").each(function (index) {
                    $(this).height(<%=ClientID %>m_UgHeight );
                    $(this).width(<%=ClientID %>m_UgWidth);
                });
               
                    $("#<%=ClientID %> .book").each(function (index) {
                    $(this).height(<%=ClientID %>m_UgHeight);
                    show_current_ugimage_<%=ClientID %>();
                    $(this).css('display', '');
                });
                }, 800);
            }

            var last_scroll_time = new Date().getTime();
            function initial_page_<%=ClientID %>() {
                var angle = $("#<%=hdnAngle.ClientID %>").val();
                if ($("#<%=hdnUse.ClientID %>").val() === "XPS") {
                    if (angle === 90 || angle === 270) {
                        <%=ClientID %>m_XpsWidth = '<%=XpsHeight%>';
                        <%=ClientID %>m_XpsHeight = '<%=XpsWidth%>';
                    }
                }
                // 設定 scroll 事件
                $('#<%=div_content.ClientID %>').scroll(function() {
                    last_scroll_time = new Date().getTime();
                    
                    // 捲動時, 重設 Show FLAG
                    <%=ClientID %>is_show_current_xpsimage = false;                   
                });
                              
                var initNumber = 1;
                var $xpsContent =$('#<%=xps_content.ClientID %>'); 
                $xpsContent.empty().append('<tbody></tbody>');

                // add cover image and wkf approval records
                for (var i = 0; i < <%=ClientID %>m_SystemAddedCount; i++) {
                    var angle = +$("#<%=hdnAngle.ClientID%>").val();
                    var summaryjson = $('#<%=hdnSummaryImageStr.ClientID%>').val();
                    var summaryInfo = JSON.parse(summaryjson);
                    var wkfjson = $('#<%=hdnHistoryImagesStringJson.ClientID%>').val();
                    var wkfInfo = JSON.parse(wkfjson);

                    var imageStr;
                    if (i == 0) {
                        imageStr = summaryInfo[angle/90];
                    } else {
                        imageStr = wkfInfo[angle/90][i - 1];
                    }
                    var n = 'trpagenumber' + initNumber;
                    var pageHtml = "<tr id='trpagenumber" + initNumber + "'><td class='page_normal' style=\"height:" + <%=ClientID %>m_XpsHeight + "px\" >"
                        + "<div id='div_" + n + "'><img class='book'  style=\"height:" + <%=ClientID %>m_XpsHeight + "px\" src='data:image/png;base64," + imageStr + "' alt='Doc Cover' /></div>"
                        + "</td></tr>\r\n";
                    $xpsContent.append(pageHtml);
                    initNumber++;
                }

                initNumber = 1 + <%=ClientID %>m_SystemAddedCount;

                // 建立所有空白 Page
                for (var i = 0 ; i < <%=ClientID %>m_NumberOfDocPages ; i++) {
                    var pageHtml = "<tr id='<%=ClientID %>trpagenumber" + initNumber + "'><td class='page_normal' style=\"height:" + <%=ClientID %>m_XpsHeight + "px\" onclick='page_onclick_<%=ClientID %>(this);' ></td></tr>\r\n";
                    $xpsContent.append(pageHtml);
                    initNumber++;                    
                }               

                // 建立 初始化 WebCache 物件 物件
                <%=ClientID %>m_WebCache = new webcache();

                var all_item = [];
                for (var i = 0 ; i < <%=ClientID %>m_NumberOfDocPages ; i++) {
                    var url = get_img_url_<%=ClientID %>(i + 1);
                    url += ';' + '<%=xps_content.ClientID %>';
                    all_item.push({ url: url, index: i });
                }
                <%=ClientID %>m_WebCache.init(all_item, item_load_callback_<%=ClientID %>, item_error_callback_<%=ClientID %>);
                
                time_proc_<%=ClientID %>();
            }
            
            function initial_ugpage_<%=ClientID %>() {
                var angle = $("#<%=hdnAngle.ClientID %>").val();
                var $div = $("#<%=ClientID%> .ug-image-warpper");
                // <%=ClientID %>m_UgHeight = $div.height();
                $("#<%=hdnPageHeight.ClientID%>").val($div.height());
                // 設定 scroll 事件
                $('#<%=divug_content.ClientID %>').scroll(function() {
                    last_scroll_time = new Date().getTime();
                    
                    // 捲動時, 重設 Show FLAG
                    <%=ClientID %>is_show_current_image = false;                   
                });
                              
                var initNumber = 1;
                var $ugContent = $('#<%=ug_content.ClientID %>');
                $ugContent.empty().append('<tbody></tbody>');

                // add cover image and wkf approval records
                for (var i = 0; i < <%=ClientID %>m_SystemAddedCount; i++) {
                    var summaryjson = $('#<%=hdnSummaryImageStr.ClientID%>').val();
                    var summaryInfo = JSON.parse(summaryjson);
                    var wkfjson = $('#<%=hdnHistoryImagesStringJson.ClientID%>').val();
                    var wkfInfo = JSON.parse(wkfjson);

                    var imageStr;
                    if (i == 0) {
                        imageStr = summaryInfo[angle/90];
                    } else {
                        imageStr = wkfInfo[angle/90][i - 1];
                    }
                    var n = 'trpagenumber' + initNumber;
                    var pageHtml = "<tr id='trpagenumber" + initNumber + "'><td class='page_normal' style=\"height:" + <%=ClientID %>m_UgHeight + "px\" >"
                        + "<div id='div_" + n + "'><img class='book'  style=\"height:" + <%=ClientID %>m_UgHeight + "px\" src='data:image/png;base64," + imageStr + "' alt='Doc Cover' /></div>"
                        + "</td></tr>\r\n";
                    $ugContent.append(pageHtml);
                    initNumber++;
                }

                initNumber = 1 + <%=ClientID %>m_SystemAddedCount;

                $("#<%=ClientID%> .ug-image-container").css('display', '');
                $('#<%=divug_content.ClientID %>').css('display', '');
                // 建立所有空白 Page
                for (var i = 0 ; i < <%=ClientID %>m_NumberOfDocPages ; i++) {
                    var pageHtml = "<tr id='<%=ClientID %>trpagenumber" + initNumber + "'><td class='page_normal' style=\"height:" + <%=ClientID %>m_UgHeight + "px\" onclick='ugpage_onclick_<%=ClientID %>(this);' ></td></tr>\r\n";
                    $ugContent.append(pageHtml);
                    <%=ClientID %>is_show_current_image = false;                   
                    initNumber++;                    
                }               

                // 建立 初始化 WebCache 物件 物件
               <%=ClientID %>m_WebCache = new webcache();
                var all_item = [];
                for (var i = 0 ; i < <%=ClientID %>m_NumberOfDocPages ; i++) {
                    var url = ugget_img_url_<%=ClientID %>(i + 1);
                    all_item.push({ url: url, index: i, tdid: '<%=ug_content.ClientID %>' });

                }
               <%=ClientID %>m_WebCache.init(all_item, ugitem_load_callback_<%=ClientID %>, ugitem_error_callback_<%=ClientID %>);

                time_ugproc_<%=ClientID %>();
            }

            function ratiochange_<%=ClientID %>(ratioval) {
                var $content = $('#<%=divug_content.ClientID %>');
                var domcontentid="<%=divug_content.ClientID %>";
                var domcontent=document.getElementById(domcontentid);
                var top =$content.scrollTop();//domcontent.offsetTop;// 
                var UgHeight = 0;
                var UgWidth = 0;
                console.log('orgwidth='+<%=ClientID %>orgwidth);
                if ($("#<%=hdnUgWidth.ClientID %>").val() !== "") {
                    UgWidth =<%=ClientID %>orgwidth-40;
                }
                else
                    UgWidth = '<%=UgWidth%>';

                if ($("#<%=hdnUgHeight.ClientID %>").val() !== "") {
                    if (<%=ClientID %>fitstyle === 'screen') {
                        UgHeight = $("#<%=hdnPageRatio.ClientID %>").val() * UgWidth ;  
                    }
                    else
                        UgHeight = $("#<%=hdnPageRatio.ClientID %>").val() * UgWidth ;
                }
                else
                    UgHeight = '<%=UgHeight%>';                
        
                var topIndex = top / UgHeight;
                topIndex = 1 + parseInt(topIndex, 10);
                var selected_value = ratioval;  //  $('#' + selectitemid).val();
                if (selected_value === "Fit") {
                    selected_value = 100;
                }
                else
                    selected_value = ratioval;
                var ratio = selected_value / 100;
                console.log('UgWidth before='+UgWidth);

                UgHeight = UgHeight * ratio;
                UgWidth = UgWidth * ratio;
                console.log('ratio='+ratio);
                console.log('UgWidth RATIO='+UgWidth);
                if (selected_value === "Fit"){
                    if (<%=ClientID %>fitstyle !== 'screen') 
                        <%=ClientID %>m_UgHeight = 1100;
                    <%=ClientID %>m_UgHeight = UgHeight;
                }
                else {
                    <%=ClientID %>m_UgHeight = UgHeight;
                     <%=ClientID %>m_UgWidth=UgWidth;
                }

                $("#<%=hdnPageHeight.ClientID%>").val(<%=ClientID %>m_UgHeight );
                reinitial_page_<%=ClientID %>();

                li_onclickZoom_<%=ClientID %>("trpagenumber" + topIndex);
            }           

            function li_onclickZoom_<%=ClientID %>(trtagId) {
                var $divContent =$('#<%=divug_content.ClientID %>');
                var divid = '<%=divug_content.ClientID %>';
                var contentScrollTop = $divContent.scrollTop();
                var contentScrollLeft = $divContent.scrollLeft();
                var trid= "<%=ClientID %>"+trtagId;
                var d = document.getElementById(trid);
                if(d != null && d!=undefined){
                var topPos = d.offsetTop;
                var divc= document.getElementById(divid);
                var divscrolltop = divc.scrollTop;
                $divContent.animate({ scrollTop:  topPos }, 10);//contentScrollTop + trtagOffsetTop
                }
            }

            function reinitial_page_<%=ClientID %>() {
                $("#<%=ClientID %> .page_normal").each(function (index) {
                    $(this).height(<%=ClientID %>m_UgHeight );
                });
               
                $("#<%=ClientID %> .book").each(function (index) {
                    $(this).height(<%=ClientID %>m_UgHeight);
                    $("#<%=hdnWidth.ClientID%>").val($(this).width());
                    show_current_ugimage_<%=ClientID %>();
                    $(this).css('display', '');
                });
            }

            function li_onclick(trtagId) {
                var $divContent = $('#<%=ClientID %> #div_content');
                var trtagOffsetTop = $('#<%=ClientID %> #' + trtagId).offset().top;
                var contentScrollTop = $divContent.scrollTop();
                $divContent.animate({ scrollTop: contentScrollTop + trtagOffsetTop }, 750);
            }

            function splitterRisize_<%=ClientID %>() {
                $("#<%=ClientID %> .xps-image-warpper").height($(window).height() - 110);
                $("#<%=ClientID %> .ug-image-warpper").height($(window).height() - 110);
            }


            //===== Toolbar ======
            function <%=RadToolBar1.ClientID%>_OnBarMainClicking(sender, args) {
                args.set_cancel(true);
                var oButton = args.get_item();
                switch(oButton.get_value()) {
                    case "Rotate":
                        var angle = +$("#<%=hdnAngle.ClientID%>").val();
                        angle += 90;
                        if (angle === 360) {angle = 0;}
                        $("#<%=hdnAngle.ClientID%>").val(angle);
                        initial_page_<%=ClientID %>();
                        show_current_image_<%=ClientID %>();
                        break;
                }                
            }

            function <%=RadToolBar2.ClientID%>_OnBarMainClicking(sender, args) {
                args.set_cancel(true);
                
                var oButton = args.get_item();
                var toolBar = $find("<%=RadToolBar2.ClientID %>");
                var ratiobutton = toolBar.findItemByValue("RatioValue");
                var lblratio = $telerik.findElement(ratiobutton.get_element(), ("lblRatio"));
                var orgRatio_<%=ClientID %>=lblratio.innerHTML;
                orgRatio_<%=ClientID %>=orgRatio_<%=ClientID %>.replace('%', '');
                orgRatio_<%=ClientID %>=Number(orgRatio_<%=ClientID %>);
                switch (oButton.get_value()) {
                    case "Rotate":
                        var angle = +$("#<%=hdnAngle.ClientID%>").val();
                        angle += 90;
                        if (angle === 360) { angle = 0; }
                        $("#<%=hdnAngle.ClientID%>").val(angle);
                        initial_ugpage_<%=ClientID %>();
                        show_current_ugimage_<%=ClientID %>();
                        break;
                    case "Minus":
                        orgRatio_<%=ClientID %>= orgRatio_<%=ClientID %>- 50;
                        if (orgRatio_<%=ClientID %>< 50)
                            orgRatio_<%=ClientID %>= 50;
                        ratiochange_<%=ClientID %>(orgRatio_<%=ClientID %>);
                        break;
                    case "Plus":
                        orgRatio_<%=ClientID %>= orgRatio_<%=ClientID %>+ 50;
                        if (orgRatio_<%=ClientID %> > 1600)
                            orgRatio_<%=ClientID %>= 1600;
                        ratiochange_<%=ClientID %>(orgRatio_<%=ClientID %>);
                        break;
                    case "Download":
                        if ($("#<%=hdnIsMobile.ClientID%>").val() == "True") {
                            window.location.href = "#---" + $("#<%=hdnDownloadUrl.ClientID%>").val();
                        }
                        else {
                            $uof.download($("#<%=hdnDownloadUrl.ClientID%>").val());
                        }
                        break;
                }          
                    lblratio.innerHTML=orgRatio_<%=ClientID %>+'%';
            }

            function  <%=RadToolBar2.ClientID%>_CheckBoxClick() {
                if ( $('#<%=ClientID %> .page_normal').css('text-align') == 'center')
                    $('#<%=ClientID %> .page_normal').css('text-align', 'left');
                else
                    $('#<%=ClientID %> .page_normal').css('text-align', 'center');
                        
            }

            //===== WebCache Function =====

            function item_load_callback_<%=ClientID %>(item, response, statusText, xhr) {
                var tmp = item.url.split(';');
                var url = tmp[0];
                var index = item.index;
                index += <%=ClientID %>m_SystemAddedCount;
                var tdid = tmp[1];
                var td = $('#' + tdid).find('tbody').children().eq(index).children().eq(0);
                var imgwidth =<%=ClientID %>m_XpsWidth;
                // 加上已經載入 Cache 區的 IMG
                var img_html = "<img style='display:none' src='" + url + "'\ onload=\"img_onload(this,"+td.height()+","+imgwidth+");\" onerror=\"img_onerror(this);\" />";
                if (response == null)
                    td.html(img_html);  // 從 Cache 中取出的資料, 直接顯示出來, 不需等待
                else
                    setTimeout(function () { td.html(img_html); }, 200);    // delay 等待 Ajax 寫入 Cache        
            }

            function item_error_callback_<%=ClientID %>(item, xhr, statusText, throwError) {
                var index = item.index;
                var td = $('#<%=xps_content.ClientID %>').find('tbody').children().eq(index).children().eq(0);

                // 將前景圖 [X] 換成 Alert.png
                var img_html = "<img src='<%=ResolveUrl("~") %>Common/Images/XpsViewer/M_Document_Alert.png' >";
                td.html(img_html);
            }

            function ugitem_load_callback_<%=ClientID %>(item, response, statusText, xhr) {
                var url = item.url;
                var index = item.index;
                index += <%=ClientID %>m_SystemAddedCount;
                var tdid = item.tdid;
                var td = $('#' + tdid).find('tbody').children().eq(index).children().eq(0);
                // 加上已經載入 Cache 區的 IMG
                var uwidth =<%=ClientID %>m_UgWidth - 20;
                var img_html = "<img class='book' style='display:none' height='" +  td.height() + "' src='" + url + "'\ onload=\"ugimg_onload(this,"+td.height()+","+uwidth+");\" onerror=\"img_onerror(this);\" />";
                if (response == null)
                    td.html(img_html);  // 從 Cache 中取出的資料, 直接顯示出來, 不需等待
                else
                    setTimeout(function () { td.html(img_html); }, 200);    // delay 等待 Ajax 寫入 Cache        
            }

            function ugitem_error_callback_<%=ClientID %>(item, xhr, statusText, throwError) {
                var tmp = item.url.split(';');
                var tdid = tmp[1];
                var index = item.index;
                index += <%=ClientID %>m_SystemAddedCount;
                var td = $('#' + tdid).find('tbody').children().eq(index).children().eq(0);
                // 將前景圖 [X] 換成 Alert.png
                var img_html = "<img src='<%=ResolveUrl("~") %>Common/Images/XpsViewer/M_Document_Alert.png' >";
                td.html(img_html);
            }

            function img_onload(img,tdheight,tdwidth) {
                // 調整長寬, 再顯示圖片        
                var visualImgObj = $(img);
                visualImgObj.css("height", tdheight);
                visualImgObj.css('display', '');
            }

            function ugimg_onload(img,tdheight,tdwidth) {
                // 調整長寬, 再顯示圖片        
                var visualImgObj = $(img);
                visualImgObj.css("height", tdheight);
                visualImgObj.css('display', '');
            }

            function img_onerror(img) {
                // 將前景圖 [Loading...] 換成 Alert.png
                $(img).attr("src", "<%=ResolveUrl("~") %>Common/Images/XpsViewer/M_Document_Alert.png");
            }

            function get_img_url_<%=ClientID %>(page_index) {
                var angle = $('#<%=hdnAngle.ClientID%>').val();
                return '<%=ResolveUrl("~") %>DMS/Service/GetDocToImageHandler.ashx?Index=' + page_index + '&Angle=' + angle + '&xid=' + <%=ClientID %>m_XpsId + '&uid=<%=WatermarkUniqueId%>';
            }

            function ugget_img_url_<%=ClientID %>(page_index) {
                if (isNaN(page_index))
                    page_index = 1;

                var angle = $('#<%=hdnAngle.ClientID%>').val();
                var t = JSON.parse( <%=ClientID %>_imageHandlerArgs);
                t['a'] = angle;
                <%=ClientID %>_imageHandlerArgs = JSON.stringify(t);
                return <%=ClientID %>_imageHandlerUrl +
                    encodeURIComponent(<%=ClientID %>_imageHandlerArgs.replace('<%=PageIndexKey%>', page_index).replace('&', '|'));
            }

            var <%=ClientID %>is_show_current_image = false;  // 標示 ShowCurrentImage 是否已經執行過 
            var <%=ClientID %>is_show_current_xpsimage = false;  // 標示 ShowCurrentImage 是否已經執行過 
            var currentIndex = -1;
            function time_proc_<%=ClientID %>() {                
                // 停止大於 0.2 秒才會 Show 圖片
                var dt0 = ((new Date()).getTime() - last_scroll_time) / 1000;
                if (dt0 > 0.20 && <%=ClientID %>is_show_current_xpsimage == false) {
                    <%=ClientID %>is_show_current_xpsimage = true;
                    show_current_image_<%=ClientID %>();
                }
                setTimeout(time_proc_<%=ClientID %>, 100);
            }
            function time_ugproc_<%=ClientID %>() {                
                // 停止大於 0.2 秒才會 Show 圖片
                var dt0 = ((new Date()).getTime() - last_scroll_time) / 1000;
                if (dt0 > 0.20 && <%=ClientID %>is_show_current_image == false) {
                    <%=ClientID %>is_show_current_image = true;
                    show_current_ugimage_<%=ClientID %>();
                }
                setTimeout(time_ugproc_<%=ClientID %>, 100);
            }

            function create_loading_img() {
                var visual_img_html = "<img src='<%=ResolveUrl("~") %>Common/Images/XpsViewer/M_Document_Loading.gif'\ >";
                return $(visual_img_html);
            }

            //===== Page Function =====

            function page_onclick_<%=ClientID %>(page_td) {
                var page_index = page_td.parentNode.rowIndex;
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
                        var tmpurl = get_img_url_<%=ClientID %>(page_index) + ';' + '<%=xps_content.ClientID %>';
                        var item_list = [{ url: tmpurl, index: page_index }];
                        <%=ClientID %>m_WebCache.request(item_list);
                    }
                }
            }

            function ugpage_onclick_<%=ClientID %>(page_td) {
                var page_index = page_td.parentNode.rowIndex;
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
                        if ($('#<%=hdnUse.ClientID%>').val() === "XPS") {
                            var item_list = [{ url: get_img_url(page_index), index: page_index }];
                            <%=ClientID %>m_WebCache.request(item_list);
                        }
                        else {
                            var tmpurl = ugget_img_url_<%=ClientID %>(page_index);
                            var item_list = [{ url: tmpurl, index: page_index, tdid: '<%=ug_content.ClientID %>' }];
                            <%=ClientID %>m_WebCache.request(item_list);
                        }
                    }
                }
            }

            function show_current_image_<%=ClientID %>() {
                var $content = $('#<%=div_content.ClientID %>');
                
                // 計算目前 Page 的 PageIndex
                var top = $content.scrollTop();
                var topIndex = top/ <%=ClientID %>m_XpsHeight;
                topIndex = parseInt(topIndex, 10);               

                var divHeight = $content.height();
                var bottomIndex = (top + divHeight) / <%=ClientID %>m_XpsHeight;
                bottomIndex = parseInt(bottomIndex, 10);
             
                var xps_content =  $('#<%=xps_content.ClientID %>');
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
                    if (index_list[idx] < 0 || index_list[idx] >= <%=ClientID %>m_TotalPagesCount)
                        index_list.splice(idx, 1);
                    else
                        idx++;
                }

                var item_list = []; // 載入清單
                for (var i = 0 ; i < index_list.length; i++) {
                    var index = index_list[i];
                    if (index < <%=ClientID %>m_SystemAddedCount) continue;
                    
                    var page_obj = xps_content.find('tbody').children().eq(index).children().eq(0);    // TD            

                    var need_load = false;
                    if (page_obj.children().length <= 0) {
                        // 如果圖片未載入, 則建立 Load 物件
                        need_load = true;
                    }
                    else {
                        // 如果是 loading 圖片
                        var src = page_obj.children().eq(0).attr("src");
                        if (src.indexOf("Loading") !== -1)
                            need_load = true;
                    }

                    // 如果需要重新 loading
                    if (need_load === true) {
                        // 加入 Loading...
                        var visualImgObj = create_loading_img();
                        page_obj.html(visualImgObj);

                        index -= <%=ClientID %>m_SystemAddedCount;
                        // 加入載入清單
                        var url = get_img_url_<%=ClientID %>(index + 1);
                         url += ';' + '<%=xps_content.ClientID %>';
                        var item = { url: url, index: index };
                        item_list.push(item);
                    }
                }
                <%=ClientID %>m_WebCache.request(item_list);  // 使用 WebCache 載入

                topIndex -= 2;
                bottomIndex += 2;
                if (topIndex < 0)
                    topIndex = 0;
                if (bottomIndex > <%=ClientID %>m_TotalPagesCount - 1)
                    bottomIndex = <%=ClientID %>m_TotalPagesCount - 1;

                // 清除看不到的 Page 內容
                for (var i = 0 ; i < <%=ClientID %>m_TotalPagesCount ; i++) {
                    if (i >= topIndex && i <= bottomIndex) continue;                    
                    if (i < <%=ClientID %>m_SystemAddedCount) continue; // 封面與歷程不用清
                    var page_td = xps_content.find('tbody').children().eq(i).children().eq(0);
                    page_td.empty();
                }
            }           

            function show_current_ugimage_<%=ClientID %>() {
                var $content = $('#<%=divug_content.ClientID %>');
                
                // 計算目前 Page 的 PageIndex
                var top = $content.scrollTop();
                var topIndex = top/ <%=ClientID %>m_UgHeight;
                topIndex = parseInt(topIndex, 10);

                var divHeight = $content.height();
                var bottomIndex = (top + divHeight) / <%=ClientID %>m_UgHeight;
                bottomIndex = parseInt(bottomIndex, 10);
             
                var ug_content = $('#<%=ug_content.ClientID %>');

                // 上下 2 頁預載入 (視線內的 Page 先載入)
                var index_list = [];
                for (var i = topIndex; i <= <%=ClientID %>m_TotalPagesCount; i++)
                    index_list.push(i);
                index_list.push(bottomIndex + 1);
                index_list.push(topIndex - 1);
                index_list.push(bottomIndex + 2);
                index_list.push(topIndex - 2);
                // 過濾無效的 page number
                var idx = 0;
                while (idx < index_list.length) {
                    if (index_list[idx] < 0 || index_list[idx] >= <%=ClientID %>m_TotalPagesCount)
                        index_list.splice(idx, 1);
                    else
                        idx++;
                }

                var item_list = []; // 載入清單
                for (var i = 0 ; i < index_list.length; i++) {
                    var index = index_list[i];
                    if (index < <%=ClientID %>m_SystemAddedCount) continue;

                    var page_obj = ug_content.find('tbody').children().eq(index).children().eq(0);    // TD            
                    var need_load = false;
                    if (page_obj.children().length <= 0) {
                        // 如果圖片未載入, 則建立 Load 物件
                        need_load = true;
                    }
                    else {
                        // 如果是 loading 圖片
                        var src = page_obj.children().eq(0).attr("src");
                        if (src.indexOf("Loading") !== -1)
                            need_load = true;
                    }
                    // 如果需要重新 loading
                    if (need_load === true) {
                        // 加入 Loading...
                        var visualImgObj = create_loading_img();
                        page_obj.html(visualImgObj);

                        index -= <%=ClientID %>m_SystemAddedCount;
                        // 加入載入清單
                        var url = ugget_img_url_<%=ClientID %>(index + 1);
                        var item = { url: url, index: index, tdid: '<%=ug_content.ClientID %>' };
                        item_list.push(item);
                    }
                }

                <%=ClientID %>m_WebCache.request(item_list);  // 使用 WebCache 載入

                topIndex -= 2;
                bottomIndex += 2;
                if (topIndex < 0)
                    topIndex = 0;
                if (bottomIndex > <%=ClientID %>m_TotalPagesCount - 1)
                    bottomIndex = <%=ClientID %>m_TotalPagesCount - 1;

                // 清除看不到的 Page 內容
                for (var i = 0 ; i < <%=ClientID %>m_TotalPagesCount ; i++) {
                    if (i >= topIndex && i <= bottomIndex) continue;                    
                    if (i < <%=ClientID %>m_SystemAddedCount) continue; // 封面與歷程不用清
                    var page_td = ug_content.find('tbody').children().eq(i).children().eq(0);
                    page_td.empty();
                }
            }
        </script>
        
    </telerik:RadScriptBlock>
