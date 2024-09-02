<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UC_VersionFieldCollection.ascx.cs" Inherits="Ede.Uof.Web.WKF.FormManagement.MultiColumnDesign.UC_VersionFieldCollection" %>
<%@ Reference Control="~/WKF/FormManagement/VersionFieldUserControl/hiddenFieldUC.ascx" %>
<%@ Reference Control="~/WKF/FormManagement/VersionFieldUserControl/SingleLineTextUC.ascx" %>
<%@ Reference Control="~/WKF/FormManagement/VersionFieldUserControl/MultiLineTextUC.ascx" %>
<%@ Reference Control="~/WKF/FormManagement/VersionFieldUserControl/VersionFieldUC.ascx" %>
<%@ Reference Control="~/WKF/FormManagement/VersionFieldUserControl/AutoNumberUC.ascx" %>
<%@ Reference Control="~/WKF/FormManagement/VersionFieldUserControl/CalculateTextUC.ascx" %>
<%@ Reference Control="~/WKF/FormManagement/VersionFieldUserControl/CheckBoxUC.ascx" %>
<%@ Reference Control="~/WKF/FormManagement/VersionFieldUserControl/DataGridUC.ascx" %>
<%@ Reference Control="~/WKF/FormManagement/VersionFieldUserControl/DateSelectUC.ascx" %>
<%@ Reference Control="~/WKF/FormManagement/VersionFieldUserControl/DropDownListUC.ascx" %>
<%@ Reference Control="~/WKF/FormManagement/VersionFieldUserControl/FileButtonUC.ascx" %>
<%@ Reference Control="~/WKF/FormManagement/VersionFieldUserControl/HyperLinkUC.ascx" %>
<%@ Reference Control="~/WKF/FormManagement/VersionFieldUserControl/MultiLineTextUC.ascx" %>
<%@ Reference Control="~/WKF/FormManagement/VersionFieldUserControl/NumberTextUC.ascx" %>
<%@ Reference Control="~/WKF/FormManagement/VersionFieldUserControl/SingleLineTextUC.ascx" %>
<%@ Reference Control="~/WKF/FormManagement/VersionFieldUserControl/RadioButtonUC.ascx" %>
<%@ Reference Control="~/WKF/FormManagement/VersionFieldUserControl/TimeSelectUC.ascx" %>
<%@ Reference Control="~/WKF/FormManagement/VersionFieldUserControl/ProposerUC.ascx" %>
<%@ Reference Control="~/WKF/FormManagement/VersionFieldUserControl/AllUserSetUC.ascx" %>
<%@ Reference Control="~/WKF/FormManagement/VersionFieldUserControl/AggregateTextUC.ascx" %>
<%@ Reference Control="~/WKF/FormManagement/VersionFieldUserControl/hiddenFieldUC.ascx" %>
<%@ Reference Control="~/WKF/FormManagement/VersionFieldUserControl/LimitUserSetUC.ascx" %>
<%@ Reference Control="~/WKF/FormManagement/VersionFieldUserControl/UserAgentUC.ascx" %>
<%@ Reference Control="~/WKF/FormManagement/VersionFieldUserControl/HtmlEditorUC.ascx" %>
<%@ Reference Control="~/WKF/FormManagement/VersionFieldUserControl/DisplayUC.ascx" %>
<%@ Reference Control="~/WKF/FormManagement/VersionFieldUserControl/CanvasUC.ascx" %>
<%@ Register Src="~/WKF/FormManagement/MultiColumnDesign/UC_DisplayLayout.ascx" TagPrefix="uc1" TagName="UC_DisplayLayout" %>
<%@ Register Src="~/WKF/FormManagement/VersionFieldUserControl/VersionFieldCollectionUC.ascx" TagPrefix="uc1" TagName="VersionFieldCollectionUC" %>
<%@ Register Src="~/WKF/FormManagement/VersionFieldUserControl/VersionFieldCollectionUsingUC.ascx" TagPrefix="uc1" TagName="VersionFieldCollectionUsingUC" %>
<%@ Register Src="~/WKF/FormManagement/MultiColumnDesign/UC_VersionFieldCollectionUsing.ascx" TagPrefix="uc1" TagName="UC_VersionFieldCollectionUsing" %>

<style>
    /*.ul {
        border-bottom: 1px dotted silver;
        vertical-align: middle;
    }*/

    .Preview {
        height: calc(100% - 41px) !important;
    }

    .rpRootGroup {
        border-width: 0 !important;
    }

    .textDot {
        white-space: nowrap;
        word-wrap: break-word;
        overflow: hidden;
        -ms-text-overflow: ellipsis;
        -o-text-overflow: ellipsis;
        text-overflow: ellipsis;
    }

    .UofFont {
        font-size: inherit !important;
        text-align: center
    }

    /*.RadPanelBar .rpRootGroup {
        border-style:none !important;
    }*/

    .RadDockBackPanel {
        border: dotted 2px blue !important;
        min-height: 80px;
        margin-bottom: 10px;
        margin-top: 10px;
        -moz-border-radius: 12px;
        -webkit-border-radius: 12px;
        border-radius: 12px;
    }

    /*控制radpanelbar繼承UOF Font的大小*/
    .rpTemplate {
        font: inherit !important;
    }

    .RadDockZoneGarbage {
        border: 0;
        /*padding: 1px;*/
        border-width: 0 !important;
        padding-bottom: 10px;
        padding-left: 0;
        padding-right: 0;
        min-height: 0;
        margin-bottom: 15px;
        margin-left: 0;
        margin-right: 0;
        -moz-border-radius: 0;
        -webkit-border-radius: 0;
        border-radius: 0;
        -moz-box-shadow: none;
        -webkit-box-shadow: none;
        box-shadow: none;
        border-collapse: separate;
        text-align: center;
        width: calc(100% - 15px) !important;
        background: url('../../../Common/Images/WKF/recycle.png') center center no-repeat !important;
    }

    .RadDockZoneHiddenField {
        min-height: 0 !important;
        margin-bottom: 1px !important;
        width: 100px !important;
        height: 40px !important;
    }


    .RadDockZone {
        position: relative;
        border-style: none;
        border-width: 1px;
        padding: 0 !important;
        height: calc(100% - 4px) !important;
        background-color: white;
        -webkit-border-radius: 10px;
        -moz-border-radius: 10px;
        border-radius: 10px;
    }

    .RadDockZoneSelf {
        position: relative;
        border-style: dotted !important;
        padding: 0 !important;
        min-height: 32px !important;
        /*height:100% ;*/
        width: initial !important;
        border-color: darkgray;
    }

    .TemplateFields {
        border-width: 0 !important;
        -webkit-border-radius: 0;
        -moz-border-radius: 0;
        border-radius: 0;
        /*margin-bottom: 9px;*/
    }

    .RadDockZoneSelf.rdPlaceHolder {
        border-style: dashed !important;
        border-width: 1px;
    }

    .RadDockZone.rdPlaceHolder {
        border: 2px dotted blue !important;
    }

    .RadDockZone_Default {
        overflow-y: hidden !important;
    }

    .RadDock_Default.rdPlaceHolder {
        border: 2px dotted blue !important;
    }

    .RadDock_Design {
        border: 0 !important;
        padding: 0 !important;
        min-height: 0;
        margin-bottom: 0;
        margin-left: 0;
        margin-right: 0;
        background: none;
        -moz-border-radius: 0;
        -webkit-border-radius: 0;
        border-radius: 0;
        -moz-box-shadow: none;
        -webkit-box-shadow: none;
        box-shadow: none;
        border-collapse: separate;
    }

    /*.Display {
        display: none;
    }*/

    .NonDisplayPlaceHolder {
        display: none !important;
    }

    /*.RadDock_Design.rdTop {
        background-image: url(images/webpart/bg.png);
        background-repeat: repeat-x;
    }*/

    .RadDock_Long {
        border: 0 !important;
        padding: 0;
        min-height: 40px;
        margin-top: 0;
        margin-bottom: 0;
        margin-left: 0;
        margin-right: 0;
        background: none;
        -moz-border-radius: 0;
        -webkit-border-radius: 0;
        border-radius: 0;
        -moz-box-shadow: none;
        -webkit-box-shadow: none;
        box-shadow: none;
        border-collapse: separate;
    }

        .RadDock_Long .rdMiddle .rdCenter {
            vertical-align: middle;
        }

    .TemplateTwoFields {
        border: 0;
        border-style: none !important;
        /*padding: 1px;*/
        padding-bottom: 0;
        padding-left: 0;
        padding-right: 0;
        min-height: x;
        margin-bottom: 0;
        margin-left: 0;
        margin-right: 0;
        background: none;
        -moz-border-radius: 0;
        -webkit-border-radius: 0;
        border-radius: 0;
        -moz-box-shadow: none;
        -webkit-box-shadow: none;
        box-shadow: none;
        border-collapse: separate;
        width: 120px !important;
        height: 95px !important;
        text-align: center;
    }

    .TemplateThreeFields {
        border: 0;
        border-style: none !important;
        /*padding: 1px;*/
        padding-bottom: 0;
        padding-left: 0;
        padding-right: 0;
        min-height: 0;
        margin-bottom: 0;
        margin-left: 0;
        margin-right: 0;
        background: none;
        -moz-border-radius: 0;
        -webkit-border-radius: 0;
        border-radius: 0;
        -moz-box-shadow: none;
        -webkit-box-shadow: none;
        box-shadow: none;
        border-collapse: separate;
        width: 85px !important;
        height: 95px !important;
        text-align: center;
    }

    .DataGridDesignZone {
        overflow-y: visible !important;
        min-height: 30px !important;
        border-style: none !important;
    }

        .DataGridDesignZone.rdPlaceHolder {
            border-style: dotted !important;
            border-width: 1px;
        }

    .NoneDisplay {
        /*height:0px !important;
        width:0px !important;
        border-style: none !important;
        border-radius: 0px !important;*/
        display: none !important;
    }

    .rdDisabled .rdMiddle .rdLeft,
    .rdDisabled .rdMiddle .rdRight,
    .rdDisabled .rdBottom .rdLeft,
    .rdDisabled .rdBottom .rdCenter,
    .rdDisabled .rdBottom .rdRight,
    .rdDisabled .rdTop .rdCenter,
    .rdDisabled .rdTop .rdRight,
    .rdDisabled .rdTop .rdLeft,
    .RadDockZone .rdTop {
        background-image: none !important;
    }

    /* 去除背景 */
    .rdRowDisabled .rdMiddle .rdLeft,
    .rdRowDisabled .rdMiddle .rdRight,
    .rdRowDisabled .rdBottom .rdLeft,
    /*.rdRowDisabled .rdBottom .rdCenter,*/
    .rdRowDisabled .rdBottom .rdRight,
    .rdRowDisabled .rdTop .rdCenter,
    .rdRowDisabled .rdTop .rdRight,
    .rdRowDisabled .rdTop .rdLeft,
    .RadDockZone .rdTop,
    .rdTable {
        background-image: none !important;
        height: 5px !important;
    }

    .rdDisabledHeight .rdBottom .rdLeft,
    .rdDisabledHeight .rdBottom .rdCenter,
    .rdDisabledHeight .rdBottom .rdRight {
        height: 1px;
    }

    .rdContent {
        overflow-y: hidden !important;
    }

    .NonScroll {
        overflow: hidden !important;
    }

    .ColumnImageWhite {
        background-image: url('../../..//Common/Images/WKF/light_white.png') !important;
    }

    .ColumnImageGreen {
        background-image: url('../../../Common/Images/WKF/light_green.png') !important;
    }
</style>

<script type="text/javascript">
    var originalZoneID = "";
    var originalIndex = "";
    var AllDockZoneIDs = new Array();
    var ForbiddenZones = new Array("DestZone");
    var EmptyForbiddenZones = new Array();
    var LatestMovedRadDockInDestZone;
    var yCoor;
    var leftPos;
    var topPos;



    //一開始先把垃圾桶隱藏
    Sys.Application.add_load(function () {
        if ($find("<%=rts.ClientID %>").get_selectedTab().get_value() == "preview")
            return;

        var culture = "<%=Ede.Uof.EIP.SystemInfo.Current.Culture%>";

        //如果不是繁體 簡體 英文的話 左側欄位列表的文字設為超過就用...取代
        if (culture != "zh-TW" && culture != "en-US" && culture != "zh-CN") {
            SetTextOverflowDot();
        }

        var txtSearch = $("#<%=txtSearch.ClientID%>");

        if (txtSearch !== "undefined") {
            txtSearch.keyup(function (e) {
                SearchFields();
            });


            if (txtSearch.val() !== "") {
                SearchFields();
            }
        }

        var designZone = $find("<%=rdzDesign.ClientID%>");

        if (designZone !== null) {
            var isDataGrid = "<%=m_IsDataGirdFiled %>";
            if (isDataGrid === "True") {
                //明細設計的專屬CSS

                $('#<%=rdzDesign.ClientID%>').addClass("DataGridDesignZone");
            }
            else {
                if (designZone.get_docks().length != 0) {
                    $('#<%=rdzDesign.ClientID%>').removeAttr("class");
                }
                else {
                    $("#<%=rdzDesign.ClientID%>").css('cssText', 'height:' + "40px!important");
                }
            }
        }

        ResetFieldsHeight();

        $('#<%=rdzDesign.ClientID%>' + '_D').addClass("RadDockBackPanel");
        DisableGarbageCan();
        window.setTimeout(function () {
            if ("<%=m_IsDataGirdFiled %>" !== "True") {
                var hiddenDockZone = $find("<%=rdzHiddenField.ClientID%>");

                //預覽沒有隱藏欄位區
                if (hiddenDockZone !== null) {
                    var docks = hiddenDockZone.get_docks();
                    if (docks.length > 0) {
                        var pane = $find("<%=rpHiddenField.ClientID%>");
                        pane.expand();
                        $('#<%=hiddenPaneExpend.ClientID%>').val("true");
                    }
                }
            }
        }, 500);

        SetRowDockZoneSameHight();
    });

    function SetTextOverflowDot() {
        var normalArea = $find("<%=rdzNormalFields.ClientID%>");
        var orgArea = $find("<%=rdzOrganization.ClientID%>");
        var normalFields;
        var orgFields;

        if (normalArea != null) {
            normalFields = normalArea.get_docks();
            for (var i = 0; i < normalFields.length; i++) {
                var dockId = normalFields[i].get_id();
                $("#" + dockId + " span").addClass("textDot");
            }
        }


        if (orgArea != null) {
            var orgFields = orgArea.get_docks();
            for (var i = 0; i < orgFields.length; i++) {
                var dockId = orgFields[i].get_id();
                $("#" + dockId + " span").addClass("textDot");
            }
        }
    }

    function ResetFieldsHeight() {
        $("#<%=rdzOptional.ClientID%>").css('cssText', 'height:' + "100%!important");
        $("#<%=rdzNormalFields.ClientID%>").css('cssText', 'height:' + "100%!important");
        $("#<%=rdzOrganization.ClientID%>").css('cssText', 'height:' + "100%!important");
        var optionalFieldHeight = $("#<%=rdzOptional.ClientID%>").height();
        var normalFieldHeight = $("#<%=rdzNormalFields.ClientID%>").height();
        var orgFieldHeight = $("#<%=rdzOrganization.ClientID%>").height();
        optionalFieldHeight += 20;
        normalFieldHeight += 20;
        orgFieldHeight += 20;
        $("#<%=rdzOptional.ClientID%>").css('cssText', 'height:' + optionalFieldHeight + "px!important");
        $("#<%=rdzNormalFields.ClientID%>").css('cssText', 'height:' + normalFieldHeight + "px!important");
        $("#<%=rdzOrganization.ClientID%>").css('cssText', 'height:' + orgFieldHeight + "px!important");
    }

    function SearchFields() {
        var text = $("#<%=txtSearch.ClientID%>").val();
        var normalArea = $find("<%=rdzNormalFields.ClientID%>");
        var optionalArea = $find("<%=rdzOptional.ClientID%>");
        var orgArea = $find("<%=rdzOrganization.ClientID%>");
        var normalFields;
        var optionalFields;
        var orgFields;
        var isDataGrid = "<%=m_IsDataGirdFiled %>";

        if (typeof (text) != "undefined") {
            text = text.toLowerCase();
        }

        if (normalArea != null) {
            normalFields = normalArea.get_docks();
            for (var i = 0; i < normalFields.length; i++) {
                $("#" + normalFields[i].get_id()).show();
            }

            if (text !== "") {
                for (var i = 0; i < normalFields.length; i++) {
                    var dockId = normalFields[i].get_id();
                    var dock = $("#" + dockId);
                    var fieldName = dock.find("img").attr("title").toLowerCase();
                    if (fieldName.indexOf(text) < 0) {
                        dock.hide();
                    }
                }
            }
        }

        if (orgArea != null) {
            orgFields = orgArea.get_docks();
            for (var i = 0; i < orgFields.length; i++) {
                $("#" + orgFields[i].get_id()).show();
            }

            if (text !== "") {
                for (var i = 0; i < orgFields.length; i++) {
                    var dockId = orgFields[i].get_id();
                    var dock = $("#" + dockId);
                    var fieldName = dock.find("img").attr("title").toLowerCase();
                    if (fieldName.indexOf(text) < 0) {
                        dock.hide();
                    }
                }
            }
        }

        if (isDataGrid === "False" && optionalArea != null) {
            optionalFields = optionalArea.get_docks();

            for (var i = 0; i < optionalFields.length; i++) {
                $("#" + optionalFields[i].get_id()).show();
            }

            if (text !== "") {
                for (var i = 0; i < optionalFields.length; i++) {
                    var dockId = optionalFields[i].get_id();
                    var dock = $("#" + dockId);
                    var fieldName = dock.find("img").attr("title").toLowerCase();
                    if (fieldName.indexOf(text) < 0) {
                        dock.hide();
                    }
                }
            }
        }
        ResetFieldsHeight();
    }

    function OnClientLoad(sender) {
        ResetWindowHeight();
    }

    function ResetWindowHeight() {
        window.setTimeout(function () {
            var $ = $telerik.$;
            var height = $(window).height();
            var multiPage = $find("<%=RadMultiPage1.ClientID %>");
            var totalHeight = height - $("#<%=rts.ClientID%>").height() - 42;
            var mainRadSplitter = $find("<%=MainRadSplitter.ClientID %>");

            if (mainRadSplitter != null) {
                var rightpane = mainRadSplitter.getPaneById('<%=RightRadPane.ClientID%>');
                if (rightpane != null) {
                    rightpane.set_height(totalHeight);
                }

                var leftpane = mainRadSplitter.getPaneById('<%=LeftRadPane.ClientID%>');
                if (leftpane != null) {
                    leftpane.set_height(totalHeight);
                }


                mainRadSplitter.set_height(totalHeight);
            }

            if (multiPage != null) {
                multiPage.get_element().style.height = totalHeight + "px";
            }


        }, 500);
    }

    function onClientResized(splitter, arg) {
        SetRowDockZoneSameHight();
        ResetWindowHeight();
    }


    //改變一列有幾欄
    function ChangeColumnCount(sender, args) {
        var formVeriosnId = $("#" + sender.get_id()).attr('formVersionId');
        var isDataGrid = "<%=m_IsDataGirdFiled %>";
        var designZone = $find('<%=rdzDesign.ClientID%>');
        var _docks = designZone.get_docks();

        var formLayout = new Array();
        if (isDataGrid == "True")
            return;

        var rowDockId = $("#" + sender.get_id()).attr('id');
        var rowDockClientId = $("#" + sender.get_id()).attr('rowDockClientId');
        var querySelector = "div[rowdockclientid='" + rowDockClientId + "'][rowseq!='']";
        var rowIndex = $(querySelector).attr("rowseq");
        var columnIndex = $("#" + sender.get_id()).attr('columnIndex');
        var closestTd = $("#" + sender.get_id()).closest("td");
        var data = [formVeriosnId, parseInt(rowIndex, 10), columnIndex];

        //變欄位個數必須判斷能不能隱藏後欄位會不會不見
        if (columnIndex == 2) {
            //變成三個欄位的不用判斷
        }
        else if (columnIndex == 1) {
            //變成兩個欄位的判斷 第三欄是否已經存在有欄位

            var contentfieldid = $("#" + rowDockClientId + "_td3 > div").attr("contentfieldid");
            if (contentfieldid != "")
                return;
        }
        else {
            var contentfieldid3 = $("#" + rowDockClientId + "_td3 > div").attr("contentfieldid");
            var contentfieldid2 = $("#" + rowDockClientId + "_td2 > div").attr("contentfieldid");

            if (contentfieldid3 != "" || contentfieldid2 != "")
                return;
        }

        var result = $uof.pageMethod.syncUc("WKF/FormManagement/MultiColumnDesign/UC_VersionFieldCollection.ascx", "ChangeColumnCount", data).value;


        //三欄
        if (columnIndex == 2) {
            $("#" + rowDockClientId + "_td2").show();
            $("#" + rowDockClientId + "_td3").show();

            closestTd.children().each(function () {
                $(this).children("img").attr("src", "../../../Common/Images/WKF/light_green.png");
            })
        }
        else if (columnIndex == 1) { //兩欄
            $("#" + rowDockClientId + "_td2").show();
            $("#" + rowDockClientId + "_td3").hide();

            closestTd.children().each(function (index) {
                if (index == 0 || index == 1) {
                    $(this).children("img").attr("src", "../../../Common/Images/WKF/light_green.png");
                }
                else {
                    $(this).children("img").attr("src", "../../../Common/Images/WKF/light_white.png");
                }
            })
        }
        else { //一欄
            $("#" + rowDockClientId + "_td2").hide();
            $("#" + rowDockClientId + "_td3").hide();

            closestTd.children().each(function (index) {
                if (index == 1 || index == 2) {
                    $(this).children("img").attr("src", "../../../Common/Images/WKF/light_white.png");
                }
                else {
                    $(this).children("img").attr("src", "../../../Common/Images/WKF/light_green.png");
                }
            })
        }
        $uof.dialog.set_returnValue("NeedPostBack");
        ResetWindowHeight();
    }

    //拖拉功能
    function SetHandleDock(dock, args) {
        var dockZoneId = dock.get_dockZoneID();
        var dockZone = $find(dockZoneId);
        AllDockZoneIDs.push(dockZone);
        var dockContent = dock.get_contentContainer();
        var dragHandle = $telerik.$(dockContent).find("[drag^='Handle_']")[0];
        dock.set_handle(dragHandle);
    }

    function SaveLayout(formVersionId) {
        var isDataGrid = "<%=m_IsDataGirdFiled %>";
        var designZone = $find('<%=rdzDesign.ClientID%>');
        var docks = designZone.get_docks();
        var formLayout = new Array();
        if (isDataGrid == "True")
            return;

        //隱藏欄位的UI
        var hiddenZone = $find("<%=rdzHiddenField.ClientID%>");
        var hiddenDocks = hiddenZone.get_docks();
        var hiddenColumns = new Array();
        for (var i = 0; i < hiddenDocks.length; i++) {
            var hiddenColumn = new Array();
            var dockId = hiddenDocks[i].get_id();
            var fieldId = $("#" + dockId).attr("columnFieldId");
            hiddenColumn = { "VersionField": null, "FieldID": fieldId, "Width": "", "Height": "" };
            hiddenColumns.push(hiddenColumn);
        }

        var formRows = new Array();
        for (var i = 0; i < docks.length; i++) {
            var dockId = docks[i].get_id();
            var dock = $("#" + dockId);
            var rowdockclientid = $("#" + dockId).attr("rowdockclientid");
            var querySelector = "#" + rowdockclientid + "_td1";
            var closestTr = $(querySelector).closest("tr");

            var columns = new Array();
            closestTr.children().each(function () {
                var column = new Array();
                var isHidden = $(this).is(":hidden");
                if (!isHidden) {
                    var fieldId = $("#" + $(this).attr("id") + " > div").attr("contentfieldid");
                    column = { "VersionField": null, "FieldID": fieldId, "Width": "", "Height": "" };
                    columns.push(column);
                }
            });

            if (columns.length > 0) {
                formRows = { "Columns": columns };
                formLayout.push(formRows);
            }
        }

        //隱藏欄位與非隱藏欄位放入陣列 準備轉為josn儲存
        formLayout = { "HiddenColumns": hiddenColumns, "Rows": formLayout };
        var layoutString = $uof.json.toString(formLayout);

        try {
            var data = [layoutString, formVersionId];
            $uof.pageMethod.syncUc("WKF/FormManagement/MultiColumnDesign/UC_VersionFieldCollection.ascx", "SaveFormLayout", data);
        }
        catch (e) {
            sender.doPostBack();
        }

    }

    function SavePosition(sender, eventArgs) {
        var currentIndex = sender.get_index();
        var isDataGrid = "<%=m_IsDataGirdFiled %>";
        var dockZoneId = sender.get_dockZoneID();
        var designZone = $find('<%=rdzDesign.ClientID%>');
        var _docks = designZone.get_docks();
        var formVeriosnId = $("#" + sender.get_id()).attr("formVeriosnId");
        var fieldParentId = $("#" + sender.get_id()).attr("fieldParentId");
        var fieldIdList = "";

        //托放完畢必須把設計的zone再顯示出來
        DisableGarbageCan();

        if ($("#" + sender.get_id()).attr("fieldType") == "hiddenField") {
            //隱藏提示方格框
            $('#<%=rdzHiddenField.ClientID%>' + '_D').addClass("NoneDisplay");
             $('#<%=rdzHiddenField.ClientID%>').removeClass("rdPlaceHolder");

        }

        //原本的地方什麼都不做
        if (originalZoneID == dockZoneId && originalIndex == currentIndex) {
            ResetRowDockZoneIndex();
            SetRowDockZoneSameHight();
            return;
        }

        //如果是從左側欄位拖出來新增的話 讓每個高度都一致 
        if ((originalZoneID !== '<%=rdzDesign.ClientID%>' &&
            originalZoneID !== '<%=rdzNormalFields.ClientID%>' &&
            originalZoneID !== '<%=rdzOrganization.ClientID%>' &&
            originalZoneID !== '<%=rdzOptional.ClientID%>') &&
            dockZoneId === '<%=rdzDesign.ClientID%>') {
            ResetRowDockZoneIndex();
            SetRowDockZoneSameHight();
            return;
        }

        //丟到垃圾桶刪除
        if (dockZoneId === '<%=rdzGarbageCan.ClientID%>') {
            var type = $("#" + sender.get_id()).attr("type");
            //刪除整列
            if (type !== undefined && type === "row") {
                var deleteRowDockZone = $find(sender.get_dockZoneID());
                var deleteRowDocks = deleteRowDockZone.get_docks();
                var deleteResult = new Array();

                //跑迴圈處理該列裡面的所有欄位
                for (var i = 0; i < deleteRowDocks.length; i++) {
                    var dockContent = deleteRowDocks[i].get_contentContainer();
                    if ($telerik.$(dockContent).find("[ContentFieldID]").length > 0) {
                        var isEmptyRow = true;
                        for (var j = 0; j < $telerik.$(dockContent).find("[ContentFieldID]").length; j++) {
                            var fieldId = $telerik.$(dockContent).find("[ContentFieldID]")[j].getAttribute("ContentFieldID");
                            var data = [fieldId, formVeriosnId, fieldParentId];
                            if (fieldId != "") {
                                isEmptyRow = false;
                                var v = $uof.pageMethod.syncUc("WKF/FormManagement/MultiColumnDesign/UC_VersionFieldCollection.ascx", "DeleteFields", data);
                                deleteResult.push(v);
                            }
                        }

                        //如果該列裡面都沒有欄位就直接處理layout
                        if (isEmptyRow) {
                            SaveLayout(formVeriosnId);
                        }
                        else {
                            var haveException = false;
                            for (var k = 0; k < deleteResult.length; k++) {
                                if (deleteResult[k] !== "") {
                                    haveException = true;
                                    alert(ExceptionMessage(deleteResult[k]));
                                    break;
                                }
                            }

                            if (haveException === false) {
                                SaveLayout(formVeriosnId);
                                deleteRowDocks[i].undock();
                            }
                            sender.doPostBack();
                        }
                    }
                }
            }
            else //刪除欄
            {
                //如果是undefined 有可能是從隱藏欄位刪除了
                var fieldId = $("#" + sender.get_id()).attr("ColumnfieldId");
                var data = [fieldId, formVeriosnId, fieldParentId];
                var v = $uof.pageMethod.syncUc("WKF/FormManagement/MultiColumnDesign/UC_VersionFieldCollection.ascx", "DeleteFields", data);

                //v沒有值代表沒有例外 可以做layout的update
                if (v === "") {

                    SaveLayout(formVeriosnId);

                    //從隱藏欄位的第一個拉出來刪除的話 就直接postback
                    if ($("#" + sender.get_id()).attr("fieldType") === "hiddenField" && originalIndex === 0) {
                        sender.doPostBack();
                    }
                    //sender.doPostBack();
                }
                else {
                    alert(ExceptionMessage(v));
                    sender.doPostBack();
                }
            }
            ResetRowDockZoneIndex();
            return;
        }

        //交換位置
        if (isDataGrid == "True") {
            for (var i = 0; i < _docks.length; i++) {
                fieldIdList += ',' + $("#" + _docks[i].get_id()).attr("ColumnfieldId");
            }
            var data = [fieldIdList, formVeriosnId, fieldParentId];
            $uof.pageMethod.syncUc("WKF/FormManagement/MultiColumnDesign/UC_VersionFieldCollection.ascx", "ExchangeFieldSeq", data);
            $uof.dialog.set_returnValue("NeedPostBack");
        }
        else {
            for (var i = 0; i < _docks.length; i++) {
                var dockContent = _docks[i].get_contentContainer();
                for (var j = 0; j < $telerik.$(dockContent).find("[ColumnfieldId]").length; j++) {
                    fieldIdList += ',' + $telerik.$(dockContent).find("[ColumnfieldId]")[j].getAttribute("ColumnfieldId");
                }
            }

            //有隱藏欄位也需加入
            var hiddenDockZone = $find('<%=rdzHiddenField.ClientID%>');
            var hiddenDocks = hiddenDockZone.get_docks();
            for (var i = 0; i < hiddenDocks.length; i++) {
                fieldIdList += ',' + $("#" + hiddenDocks[i].get_id()).attr("ColumnfieldId");
            }

            var data = [fieldIdList, formVeriosnId, fieldParentId];
            $uof.pageMethod.syncUc("WKF/FormManagement/MultiColumnDesign/UC_VersionFieldCollection.ascx", "ExchangeFieldSeq", data);
        }

        SaveLayout(formVeriosnId);
        ResetRowDockZoneIndex();
        SetRowDockZoneSameHight();
    }


    function SetRowDockZoneSameHight() {
        var dockZone = $find('<%=rdzDesign.ClientID%>');
        var docks = dockZone.get_docks();

        //針對每一列來處理
        for (var i = 0; i < docks.length; i++) {
            var dockId = docks[i].get_id();
            var maxHeight = 0;
            var columnFields = $("#" + dockId + " div[ColumnFieldId]:not([ColumnFieldId=''])");
            var columnFieldCount = columnFields.length;

            if (columnFieldCount > 0) {
                //找出屬性中有ColumnFieldId的 代表有存在欄位在裡面 並且記錄每個欄位中最高的
                columnFields.each(function () {
                    var tmpHeight = $(this).height();
                    if (tmpHeight > maxHeight) {
                        maxHeight = tmpHeight;
                    }
                });

                $("#" + dockId + " div[ContentFieldId]").each(function () {
                    $(this).attr("style", "min-height:" + maxHeight + "px !important");
                });

            }
            else {
                //都沒有欄位的狀況下給預設40px
                $("#" + dockId + " div[ContentFieldId]").each(function () {
                    $(this).attr("style", "min-height: 40px !important");
                });
            }
        }
    }

    function ResetRowDockZoneIndex() {
        var dockZone = $find('<%=rdzDesign.ClientID%>');
        var docks = dockZone.get_docks();
        for (var i = 0; i < docks.length; i++) {
            var dockId = docks[i].get_id();
            $("#" + dockId + " div[rowIndex]").each(function () {
                $(this).attr("rowIndex", i.toString());
            });

            $("#" + dockId).attr("rowSeq", i.toString());
        }
    }

    function ExceptionMessage(exceptionType) {
        switch (exceptionType) {
            case "FieldNotAllowDeleteException":
                return "<%=lblDeleteErrorMsg.Text%>";
            case "CalculateDeleteOpException":
                return "<%=lblCalcDeleteExecMsg.Text%>";
            case "AggergateDeleteOpException":
                return "<%=lblAggDeleteExecMsg.Text%>";
            case "AutoNumberDeleteOpException":
                return "<%=lblAutoNumDeleteExecMsg.Text%>";
            default:
                return exceptionType;
        }
    }

    function OnClientDockPositionChanged(sender, eventArgs) {
        var dockZoneId = sender.get_dockZoneID();
        var dockZone = $find(dockZoneId);

        if ($("#" + sender.get_id()).attr("type") === "addhiddenField") {
            dockZone = $find("<%=rdzHiddenField.ClientID%>");
        }

        var currentZone = sender.get_dockZone();
        var currentIndex = sender.get_index();
        var docks = currentZone.get_docks();
        var isDataGrid = "<%=m_IsDataGirdFiled %>";
        var formVersionId = $('#<% = hfFormVersionId.ClientID %>').val();
        var fieldParentId = "<%=m_fieldParentId %>";
        var type = sender.get_uniqueName();
        var redirectURL = sender.get_tag();
        var param;
        if (isDataGrid == "True") {
            param = { "formVersionId": formVersionId, "fieldParentId": fieldParentId };
        }
        else {
            param = { "formVersionId": formVersionId };
        }

        //丟到垃圾桶
        if (dockZoneId === '<%=rdzGarbageCan.ClientID%>') {

            for (var i = 0; i < docks.length; i++) {
                var dockId = docks[i].get_id();
                if (sender.get_id() === dockId) {
                    //拖到垃圾桶後 將垃圾桶中的dock給刪掉
                    docks[i].set_closed(true);

                    //除了把dock給刪掉外 還要把包著此dock的dockZone的屬性contentFieldId 中的值給清空
                    $(String.format("div[contentFieldId='{0}']", docks[i].get_element().getAttribute("columnFieldId"))).attr("contentFieldId", "");
                }
            }
            return;
        }


        //換位置
        if (docks.length == 1 || isDataGrid == "True" || $("#" + sender.get_id()).attr("type") === "addhiddenField") {
            if (dockZone) {
                if (redirectURL != null && redirectURL.substr(0, 1).toUpperCase() == '~') {
                    $uof.dialog.open2(redirectURL, sender, "", 800, 600, function (returnValue) {
                        if (typeof (returnValue) == "undefined") {
                            return false;
                        }

                        if (isDataGrid == "True") {
                            $uof.dialog.set_returnValue("NeedPostBack");
                            sender.doPostBack();
                        }
                        else {
                            var columnIndex = $("#" + dockZoneId).attr("columnIndex");
                            var rowIndex = $("#" + dockZoneId).attr("rowIndex");
                            var addType = $("#" + sender.get_id()).attr("type");
                            var data = [rowIndex, columnIndex, formVersionId, addType];

                            $uof.pageMethod.syncUc("WKF/FormManagement/MultiColumnDesign/UC_VersionFieldCollection.ascx", "AddNewColumn", data);

                            sender.doPostBack();
                        }
                        return true;
                    }, param);
                    return false;
                }
                else {
                    var originalContentFieldID = $("#" + originalZoneID).attr("ContentFieldID");
                    var currentContentFieldID = $("#" + dockZoneId).attr("ContentFieldID");
                    $("#" + dockZoneId).attr("ContentFieldID", originalContentFieldID);
                    $("#" + originalZoneID).attr("ContentFieldID", currentContentFieldID);
                }
            }
            else {
                //新增欄位時 因為每個zone裡面只能有一個dock 所以當拖拉到已經有存在的dock就得回到原來的位置
                $find(originalZoneID).dock(sender, originalIndex);
            }
        }
        else {
            var addField = $("#" + sender.get_id()).attr("AddField");
            //如果是新增欄位 而且 新增的位置已經有欄位存在就不允許新增
            if (addField != "undefined" && addField == "true") {
                //新增全新的一欄與一列
                if ((originalZoneID == '<%=rdzNormalFields.ClientID%>' || originalZoneID == '<%=rdzOrganization.ClientID%>' || originalZoneID == '<%=rdzOptional.ClientID%>') && dockZoneId == '<%=rdzDesign.ClientID%>') {
                    $uof.dialog.open2(redirectURL, sender, "", 800, 600, function (returnValue) {
                        if (typeof (returnValue) == "undefined") {
                            return false;
                        }

                        var rowIndex = currentIndex;
                        var data = [rowIndex, formVersionId];
                        $uof.pageMethod.syncUc("WKF/FormManagement/MultiColumnDesign/UC_VersionFieldCollection.ascx", "AddNewRowAndColumn", data);
                        sender.doPostBack();

                    }, param);
                    return false;
                }
                else {

                }
            }
            else {
                //如果是從欄位裡面拉出來要直接新增一列
                if ((originalZoneID !== '<%=rdzDesign.ClientID%>' &&
                    originalZoneID !== '<%=rdzNormalFields.ClientID%>' &&
                    originalZoneID !== '<%=rdzOrganization.ClientID%>' &&
                    originalZoneID !== '<%=rdzOptional.ClientID%>') &&
                    dockZoneId === '<%=rdzDesign.ClientID%>') {

                    var rowIndex = currentIndex;
                    var fieldId = $("#" + sender.get_id()).attr("ColumnfieldId");
                    var data = [rowIndex, formVersionId, fieldId];

                    $uof.pageMethod.syncUc("WKF/FormManagement/MultiColumnDesign/UC_VersionFieldCollection.ascx", "MoveColumnToRow", data);
                    sender.set_closed(true);

                    sender.doPostBack();
                }
                else {
                    //從隱藏欄位拖出來的 如果不是拖到垃圾桶區 就回到原來的位置
                    if (originalZoneID === "<%=rdzHiddenField.ClientID%>" && dockZoneId !== "<%=rdzGarbageCan.ClientID%>") {
                        $find(originalZoneID).dock(sender, originalIndex);
                        return;
                    }

                    //如果和原來的位置不同 就交換位置
                    if (originalZoneID != dockZoneId) {
                        if (currentIndex == 0) {
                            try {
                                $find(originalZoneID).dock(docks[1], originalIndex);
                                var originalContentFieldID = $("#" + originalZoneID).attr("ContentFieldID");
                                var currentContentFieldID = $("#" + dockZoneId).attr("ContentFieldID");
                                $("#" + dockZoneId).attr("ContentFieldID", originalContentFieldID);
                                $("#" + originalZoneID).attr("ContentFieldID", currentContentFieldID);
                            }
                            catch (e) {
                                $find(originalZoneID).dock(sender, originalIndex);
                            }
                        }
                        else {
                            try {
                                $find(originalZoneID).dock(docks[0], originalIndex);
                                var originalContentFieldID = $("#" + originalZoneID).attr("ContentFieldID");
                                var currentContentFieldID = $("#" + dockZoneId).attr("ContentFieldID");
                                $("#" + dockZoneId).attr("ContentFieldID", originalContentFieldID);
                                $("#" + originalZoneID).attr("ContentFieldID", currentContentFieldID);
                            }
                            catch (e) {
                                $find(originalZoneID).dock(sender, originalIndex);
                            }
                        }
                    }
                    else if (originalZoneID == dockZoneId && dockZoneId == '<%=rdzDesign.ClientID%>') {
                        var designZone = $find('<%=rdzDesign.ClientID%>');
                    }
                }
            }
        }
        SetRowDockZoneSameHight();
    }


    //紀錄移動前的資訊
    function SetOldPositionInfo(sender) {
        originalZoneID = sender.get_dockZoneID();
        originalIndex = sender.get_index();
    }

    function CheckClientYPos(args) {
        yCoor = args.clientY;
    }

    function AutoScroll(sender) {
        var a = sender.get_element();
        var actualHeight = $("#tbDesign")[0].scrollHeight;
        var scrollPos = $find("<%=rpDesign.ClientID%>").getScrollPos();
        if (typeof leftPos == 'undefined') {
            leftPos = $telerik.getLocation(a).y;
            topPos = scrollPos.top;
        }


        var currentYCoord = yCoor;

        if (leftPos > actualHeight) {

        }
        else {
            if (currentYCoord > ($find("<%=rpDesign.ClientID%>").getInnerHeight())) {

                leftPos += 20
                $find("<%=rpDesign.ClientID%>").setScrollPos(topPos, leftPos);

            }
        }

        if (currentYCoord < 50) {

            leftPos -= 20
            $find("<%=rpDesign.ClientID%>").setScrollPos(topPos, leftPos);
        }
        else {

        }
    }

    function OnClientTemplateFieldDragStart(sender, args) {
        AutoScroll(sender);
    }

    //拖曳欄位時 要把垃圾桶顯示出來
    function OnClientLayoutFieldDragStart(sender, args) {
        AutoScroll(sender);

        var type = $("#" + sender.get_id()).attr("fieldType");
        if (type === "autoNumber") { }
        else {
            EnableGarbageCan();
        }
    }


    function OnClientDragStart(sender, eventArgs) {
        //紀錄原始位置
        SetOldPositionInfo(sender);

        if ($("#" + sender.get_id()).attr("fieldType") == "hiddenField") {
            //隱藏提示方格框
            $('#<%=rdzHiddenField.ClientID%>' + '_D').addClass("NoneDisplay");
        }

        //隱藏提示方格框
        $('#<%=rdzNormalFields.ClientID%>' + '_D').addClass("NoneDisplay");
        $('#<%=rdzOrganization.ClientID%>' + '_D').addClass("NoneDisplay");
        $('#<%=rdzOptional.ClientID%>' + '_D').addClass("NoneDisplay");

        if (originalZoneID === "<%=rdzNormalFields.ClientID%>" ||
            originalZoneID === "<%=rdzOrganization.ClientID%>" ||
            originalZoneID === "<%=rdzOptional.ClientID%>") {
            //已經有欄位在裡面的就不要再出現提示方格框
            $("#<%=rdzDesign.ClientID%> div[contentfieldid]").each(
                function () {
                    if ($(this).attr("contentfieldid") !== "") {
                        var currentTempZoneId = $(this).attr("id");
                        $("#" + currentTempZoneId + '_D').addClass("NoneDisplay");
                    }
                });
        }

        //判斷隱藏欄位的設計區塊是否要出現
        //如果拉動的是隱藏欄位就讓隱藏欄位的設計區塊出現
        if ($("#" + sender.get_id()).attr("type") == "addhiddenField") {
            $('#<%=rdzHiddenField.ClientID%>' + '_D').removeClass("NoneDisplay");
            var pane = $find("<%=rpHiddenField.ClientID%>");
            var expend = $("#" + "<%=hiddenPaneExpend.ClientID%>").val();
            pane.expand();
            $("#" + "<%=hiddenPaneExpend.ClientID%>").val(expend)
        }
    }

    function OnClientDragEnd(sender, eventArgs) {
        //如果拖曳的是左半邊的dock 要再還原回原本的位置
        var leftZone = $find(originalZoneID);
        leftZone.dock(sender, originalIndex);
        leftZone.dock(sender, originalIndex);

        if ($("#" + sender.get_id()).attr("type") == "addhiddenField") {

            var pane = $find("<%=rpHiddenField.ClientID%>");
            var expend = $("#" + "<%=hiddenPaneExpend.ClientID%>").val();
            if (expend === "false") {
                pane.collapse();
            }
        }


    }

    //複製欄位
    function CopyThisColumn(dockId, formversionId, fieldId, rowindex) {
        var data = [rowindex, formversionId, fieldId];
        $uof.pageMethod.syncUc("WKF/FormManagement/MultiColumnDesign/UC_VersionFieldCollection.ascx", "CopyColumnToRow", data);
        var dock = $find("ctl00_ContentPlaceHolder1_VersionFieldCollectionUC1_" + dockId);
        dock.doPostBack();
        return false;
    }

    //複製明細欄位
    function CopyThisGridColumn(dockId, formversionId, fieldId, parentId, rowindex) {
        var data = [rowindex, formversionId, fieldId, parentId];
        $uof.pageMethod.syncUc("WKF/FormManagement/MultiColumnDesign/UC_VersionFieldCollection.ascx", "CopyGridColumnToRow", data);
        var dock = $find("ctl00_ContentPlaceHolder1_VersionFieldCollectionUC1_" + dockId);
        dock.doPostBack();
        return false;
    }

    function EnableGarbageCan() {
        var $ = $telerik.$;
        var height = $(window).height();
        var multiPage = $find("<%=RadMultiPage1.ClientID %>");
        var totalHeight = height - $("#<%=rts.ClientID%>").height() - 42;

        $("#<%=rdzGarbageCan.ClientID%>").css('cssText', 'height:' + totalHeight + "px!important");

        var isDataGrid = "<%=m_IsDataGirdFiled %>";
        if (isDataGrid == "True") {
            var panelBar = $find("<%= rpbFields.ClientID %>");

            if (panelBar != null) {
                var garbage = panelBar.get_items().getItem(2);
                var normal = panelBar.get_items().getItem(0);
                var organization = panelBar.get_items().getItem(1);

                panelBar.trackChanges();
                garbage.show();
                normal.hide();
                organization.hide();
                panelBar.commitChanges();
            }
        }
        else {
            var panelBar = $find("<%= rpbFields.ClientID %>");
            if (panelBar != null) {
                var garbage = panelBar.get_items().getItem(3);
                var normal = panelBar.get_items().getItem(0);
                var organization = panelBar.get_items().getItem(1);
                var optional = panelBar.get_items().getItem(2);

                panelBar.trackChanges();
                garbage.show();
                garbage.expand();
                normal.hide();
                organization.hide();
                optional.hide();
                panelBar.commitChanges();
            }
        }
    }

    function DisableGarbageCan() {
        var isDataGrid = "<%=m_IsDataGirdFiled %>";
        if (isDataGrid == "True") {
            var panelBar = $find("<%= rpbFields.ClientID %>");
            if (panelBar != null) {
                var garbage = panelBar.get_items().getItem(2);
                var normal = panelBar.get_items().getItem(0);
                var organization = panelBar.get_items().getItem(1);

                panelBar.trackChanges();
                garbage.hide();
                normal.show();
                organization.show();

                panelBar.commitChanges();
            }
        }
        else {
            var panelBar = $find("<%= rpbFields.ClientID %>");
            if (panelBar != null) {
                var garbage = panelBar.get_items().getItem(3);
                var normal = panelBar.get_items().getItem(0);
                var organization = panelBar.get_items().getItem(1);
                var optional = panelBar.get_items().getItem(2);

                panelBar.trackChanges();
                garbage.hide();
                normal.show();
                organization.show();
                optional.show();
                panelBar.commitChanges();
            }
        }
    }

    function OnClientExpanded(sender, args) {
        $("#" + "<%=hiddenPaneExpend.ClientID%>").val("true");
    }

    function OnClientCollapsed(sender, args) {
        $("#" + "<%=hiddenPaneExpend.ClientID%>").val("false");
                 }
</script>

<div id="fieldsScripts"></div>

<telerik:RadTabStrip ID="rts" runat="server" MultiPageID="RadMultiPage1" SelectedIndex="0" OnTabClick="rts_TabClick" CausesValidation="False" AutoPostBack="True" OnClientLoad="OnClientLoad" meta:resourcekey="rtsResource1">
    <Tabs>
        <telerik:RadTab Text="設計" Value="design" meta:resourcekey="RadTabResource3"></telerik:RadTab>
        <telerik:RadTab Text="預覽" Value="preview" meta:resourcekey="RadTabResource4"></telerik:RadTab>
    </Tabs>
</telerik:RadTabStrip>

<telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" Height="100%" ScrollBars="Vertical" RenderSelectedPageOnly="True" meta:resourcekey="RadMultiPage1Resource1">
    <telerik:RadPageView runat="server" Height="100%" ID="RadPageView1" CssClass="NonScroll" meta:resourcekey="RadPageView1Resource1" Selected="True">
        <telerik:RadSplitter ID="MainRadSplitter" runat="server" Height="100%" Width="100%" LiveResize="True" BorderSize="0" OnClientResized="onClientResized" FullScreenMode="True" meta:resourcekey="MainRadSplitterResource1" PanesBorderSize="0" SplitBarsSize="">
            <telerik:RadPane ID="LeftRadPane" runat="server" Width="278px" Scrolling="Y" Index="0" meta:resourcekey="LeftRadPaneResource1">
                <asp:TextBox ID="txtSearch" runat="server" Width="100%" placeholder="Search..." onkeydown="return (event.keyCode!=13)" meta:resourcekey="txtSearchResource1"></asp:TextBox>
                <asp:UpdatePanel ID="updatepanel2" runat="server">
                    <ContentTemplate>
                        <telerik:RadDockLayout runat="server" ID="RadDockLayout1" EnableViewState="False" StoreLayoutInViewState="False" EnableEmbeddedSkins="False">
                            <telerik:RadPanelBar ID="rpbFields" runat="server" Width="100%" Height="100%" meta:resourcekey="rpbFieldsResource1">
                                <Items>
                                    <telerik:RadPanelItem CssClass="UofFont" Expanded="True" Value="normal" runat="server" meta:resourcekey="RadPanelItemResource5">
                                        <ContentTemplate>
                                            <telerik:RadDockZone runat="server" ID="rdzNormalFields" Orientation="Horizontal" Height="100%" meta:resourcekey="rdzNormalFieldsResource1">
                                            </telerik:RadDockZone>
                                        </ContentTemplate>
                                        <HeaderTemplate>
                                            <asp:Label ID="lblNormalFields" runat="server" meta:resourcekey="lblNormalFieldsResource1" Text="一般欄位"></asp:Label>
                                        </HeaderTemplate>
                                    </telerik:RadPanelItem>

                                    <telerik:RadPanelItem CssClass="UofFont" Value="organization" Expanded="True" runat="server" meta:resourcekey="RadPanelItemResource6">
                                        <ContentTemplate>
                                            <telerik:RadDockZone runat="server" ID="rdzOrganization" Orientation="Horizontal" Height="100%" meta:resourcekey="rdzOrganizationResource1">
                                            </telerik:RadDockZone>
                                        </ContentTemplate>
                                        <HeaderTemplate>
                                            <asp:Label ID="lblUserSet" runat="server" meta:resourcekey="lblUserSetResource1" Text="組織欄位"></asp:Label>
                                        </HeaderTemplate>
                                    </telerik:RadPanelItem>

                                    <telerik:RadPanelItem CssClass="UofFont" Value="optional" Expanded="True" runat="server" meta:resourcekey="RadPanelItemResource7">
                                        <ContentTemplate>
                                            <telerik:RadDockZone runat="server" ID="rdzOptional" Orientation="Horizontal" Height="100%" meta:resourcekey="rdzOptionalResource1">
                                            </telerik:RadDockZone>
                                        </ContentTemplate>
                                        <HeaderTemplate>
                                            <asp:Label ID="lblOptional" runat="server" meta:resourcekey="lblOptionalResource1" Text="外掛欄位"></asp:Label>
                                        </HeaderTemplate>
                                    </telerik:RadPanelItem>

                                    <telerik:RadPanelItem CssClass="top-offers UofFont" Expanded="True" Value="garbage" runat="server" meta:resourcekey="RadPanelItemResource8">
                                        <ContentTemplate>
                                            <telerik:RadDockZone runat="server" ID="rdzGarbageCan" Orientation="Horizontal" Height="500px" CssClass="RadDockZoneGarbage" meta:resourcekey="rdzGarbageCanResource1"></telerik:RadDockZone>
                                        </ContentTemplate>
                                        <HeaderTemplate>
                                            <asp:Label ID="Label4" runat="server" meta:resourcekey="Label4Resource1" Text="垃圾桶"></asp:Label>
                                        </HeaderTemplate>
                                    </telerik:RadPanelItem>
                                </Items>
                            </telerik:RadPanelBar>
                        </telerik:RadDockLayout>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </telerik:RadPane>

            <telerik:RadSplitBar ID="RadSplitBar1" runat="server" CollapseMode="Forward" EnableResize="False" Index="1" meta:resourcekey="RadSplitBar1Resource1"></telerik:RadSplitBar>
            
            <telerik:RadPane ID="RightRadPane" Scrolling="None" runat="server" Index="2" meta:resourcekey="RightRadPaneResource1">
                <asp:UpdatePanel ID="updatepanel1" runat="server">
                    <ContentTemplate>
                        <telerik:RadSplitter ID="RadSplitter1" runat="server" Height="100%" Width="100%" LiveResize="True" Orientation="Horizontal" BorderSize="0" OnClientResized="onClientResized" FullScreenMode="True" meta:resourcekey="RadSplitter1Resource1" PanesBorderSize="0" SplitBarsSize="">

                            <telerik:RadPane ID="rpDesign" runat="server" Scrolling="Y" Height="85%" Index="0" meta:resourcekey="rpDesignResource1">

                                <table id="tbDesign" style="width: 100%; height: 100%" border="0">
                                    <tr>
                                        <td style="background-image: url(<%=ThemePath %>/images/wf_bg.gif); vertical-align: top">
                                            <center>
                                                <table width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
                                                    <tr>
                                                        <td>
                                                            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                                                                <tr>
                                                                    <td style="width:120px;min-width:120px;">
                                                                        <img src="<%=ThemePath %>/images/wf_icon01.jpg" width="120" height="65">
                                                                    </td>
                                                                    <td style="background-image: url(<%=ThemePath %>/images/wf_a01.jpg);background-repeat:repeat-x;height:65px;background-position: 0% 100%;">
                                                                        <table width="100%" border="0" cellpadding="0" cellspacing="0">
                                                                            <tr>
                                                                                <td class="bigT" style="height: 65px; vertical-align: middle;text-align:left">
                                                                                    <asp:Label ID="lblFormName2" runat="server"  meta:resourcekey="lblFormNameResource1"></asp:Label>
                                                                                </td>
                                                                            </tr>
                                                                        </table>
                                                                    </td>
                                                                    <td width="26">
                                                                        <img src="<%=ThemePath %>/images/wf_a02.jpg" width="26" height="65">
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                                                                <tr>
                                                                    <td width="15" height="8" style="background-image: url(<%=ThemePath %>/images/wf_a03.gif)">
                                                                        <img src="<%=ThemePath %>/images/wf_a03.gif" width="15" height="8">
                                                                    </td>
                                                                    <td height="8" style="background-image: url(<%=ThemePath %>/images/wf_a04.gif)">
                                                                        <asp:Label ID="lblTraditionMemo" runat="server" Text="目前表單排版主題樣式為「傳統(一列一欄)」樣式，顯示時會依目前設計由左至右且由上而下，依順序一列一欄顯示，可點選預覽查看表單使用時的畫面" CssClass="SizeMemo" meta:resourcekey="lblTraditionMemoResource1"></asp:Label>
                                                                        <asp:Label ID="lblClassicMemo" runat="server" Text="目前表單排版主題樣式為「經典(一列多欄)」樣式，顯示時會依目前設計顯示，可點選預覽查看表單使用時的畫面" CssClass="SizeMemo" meta:resourcekey="lblClassicMemoResource1"></asp:Label>
                                                                        <asp:Label ID="lblSimpleMemo" runat="server" Text="目前表單排版主題樣式為「簡約(一列多欄)」樣式，顯示時會依目前設計顯示，可點選預覽查看表單使用時的畫面" CssClass="SizeMemo" meta:resourcekey="lblSimpleMemoResource1"></asp:Label>
                                                                    </td>
                                                                    <td width="15" height="8" style="background-image: url(<%=ThemePath %>/images/wf_a05.gif)">
                                                                        <img src="<%=ThemePath %>/images/wf_a05.gif" width="15" height="8">
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td style="background-image: url(<%=ThemePath %>/images/wf_a03.gif)">
                                                                        <img src="<%=ThemePath %>/images/wf_a03.gif" width="15" height="8">
                                                                    </td>
                                                                    <td style="background-image: url(<%=ThemePath %>/images/wf_a04.gif)">
                                                                        <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
                                                                            <tr>
                                                                                <td>
                                                                                    
                                                                                        
                                                                                        <telerik:RadDockLayout runat="server" ID="RadDockLayout3" EnableViewState="False" StoreLayoutInViewState="False" EnableEmbeddedSkins="False" >
                                                                                        <telerik:RadDockZone ID="rdzDesign" runat="server" Height="100%" meta:resourcekey="rdzDesignResource1" >
                                                                                           
                                                                                           
                                                                                        </telerik:RadDockZone>
                                                                                           
                                                                                   </telerik:RadDockLayout>
                                                                                       
                                                                                </td>
                                                                            </tr>
                                                                        </table>
                                                                    </td>
                                                                    <td style="background-image: url(<%=ThemePath %>/images/wf_a05.gif)">
                                                                        <img src="<%=ThemePath %>/images/wf_a05.gif" width="15" height="8">
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td style="background-image: url(<%=ThemePath %>/images/wf_a06.gif); background-position: 0% 0%; height: 20px"></td>
                                                                    <td style="background-image: url(<%=ThemePath %>/images/wf_a07.gif)"></td>
                                                                    <td style="background-image: url(<%=ThemePath %>/images/wf_a08.gif); background-position: 0% 0%; height: 20px"></td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </center>
                                        </td>
                                    </tr>
                                </table>
                            </telerik:RadPane>
                            <telerik:RadSplitBar ID="RadSplitbar2" runat="server" CollapseMode="Backward" Height="20px" Index="1" meta:resourcekey="RadSplitbar2Resource1"></telerik:RadSplitBar>
                            <telerik:RadPane ID="rpHiddenField" runat="server" Scrolling="Y" Height="15%" Collapsed="True" OnClientCollapsed="OnClientCollapsed" OnClientExpanded="OnClientExpanded" Index="2" meta:resourcekey="rpHiddenFieldResource1">
                                <telerik:RadDockLayout runat="server" ID="RadDockLayout2" EnableViewState="False" StoreLayoutInViewState="False" EnableEmbeddedSkins="False">
                                    <telerik:RadDockZone runat="server" ID="rdzHiddenField" Orientation="Horizontal" meta:resourcekey="rdzHiddenFieldResource1"></telerik:RadDockZone>
                                </telerik:RadDockLayout>
                            </telerik:RadPane>

                        </telerik:RadSplitter>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </telerik:RadPane>
        </telerik:RadSplitter>

    </telerik:RadPageView>
    <telerik:RadPageView runat="server" ID="RadPageView2" Height="100%" meta:resourcekey="RadPageView2Resource1" Visible="False">
        <table style="width: 100%; height: 100%" border="0" class="Preview">
            <tr>
                <td style="background-image: url(<%=ThemePath %>/images/wf_bg.gif); vertical-align: top">
                    <center>
                <table width="98%" border="0" align="center">
                    <tr>
                        <td>
                            <table style="width: 100%" border="0">
                                <tr>
                                    <td style="width: 15px; background-repeat: no-repeat; background-image: url(<%=ThemePath %>/images/wf_a01.gif); d height: 15px"></td>
                                    <td style="background-repeat: repeat-x; background-image: url(<%=ThemePath %>/images/wf_a09.gif); background-position: 0% 100%; height: 15px"></td>
                                    <td style="width: 15px; background-repeat: no-repeat; background-image: url(<%=ThemePath %>/images/wf_a02.gif); background-position: 0% 100%; height: 15px"></td>
                                </tr>
                                <tr>
                                    <td style="background-image: url(<%=ThemePath %>/images/wf_a03.gif)"></td>
                                    <td style="background-image: url(<%=ThemePath %>/images/wf_a04.gif)">
                                        
                                        <table width="100%" border="0" cellpadding="0" cellspacing="0">
                                            <tr>
                                                <td style="width: 20%; height: 100%; margin: 0; padding: 0; padding-right: 3px;" valign="top">
                                                    <table class="PopTable" style="height: 160px;" width="100%">
                                                        <tr style="vertical-align: top;">
                                                            <td align="center" class="PopTableHeader" height="20px" style="text-align: center;">
                                                                <center>
                                                                    <asp:Label ID="lblComment" runat="server" Text="申請資訊" meta:resourcekey="lblCommentResource1"></asp:Label>
                                                                </center>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td style="background-color: white; height: 100%; margin: 0; padding: 0" valign="top">
                                                                <asp:Panel ID="pnlAppInfo" runat="server" Height="140px" ScrollBars="Auto" meta:resourcekey="pnlAppInfoResource1">
                                                                    <table cellpadding="0" cellspacing="0" width="100%" id="TABLE1" runat="server" style="height: 135px; margin: 0; padding: 0">

                                                                        <tr runat="server">
                                                                            <td align="right" style="width: 26%;" nowrap="nowrap" runat="server">
                                                                                <asp:Label ID="Label15" runat="server" Text="申請人：" meta:resourcekey="Label15Resource1"></asp:Label>
                                                                            </td>
                                                                            <td style="text-align: left" runat="server">
                                                                                <asp:Label ID="lblApplicant" runat="server" meta:resourcekey="lblApplicantResource1"></asp:Label>
                                                                            </td>
                                                                        </tr>
                                                                        <tr runat="server">
                                                                            <td align="right" style="width: 26%;" nowrap="nowrap" runat="server">
                                                                                <asp:Label ID="Label17" runat="server" Text="部門：" meta:resourcekey="Label17Resource1"></asp:Label>
                                                                            </td>
                                                                            <td style="text-align: left; margin: 0; padding: 0;" runat="server">
                                                                                <asp:Label ID="lblDepartment" runat="server" meta:resourcekey="lblDepartmentResource1"></asp:Label>
                                                                            </td>
                                                                        </tr>
                                                                        <tr runat="server">
                                                                            <td align="right" style="width: 26%;" nowrap="nowrap" runat="server">
                                                                                <asp:Label ID="Label1" runat="server" Text="申請時間：" meta:resourcekey="Label1Resource1"></asp:Label>
                                                                            </td>
                                                                            <td style="text-align: left; margin: 0; padding: 0;" runat="server">
                                                                                <asp:Label ID="lblApplyTime" runat="server" meta:resourcekey="lblApplyTimeResource1"></asp:Label>
                                                                            </td>
                                                                        </tr>
                                                                        <tr runat="server">
                                                                            <td align="right" style="width: 26%;" nowrap="nowrap" runat="server">
                                                                                <asp:Label ID="Label9" runat="server" Text="緊急程度：" meta:resourcekey="Label9Resource1"></asp:Label>
                                                                            </td>
                                                                            <td style="text-align: left; margin: 0; padding: 0;" runat="server">
                                                                                <asp:Label ID="lblurgentLevel" runat="server" meta:resourcekey="lblurgentLevelResource1"></asp:Label>
                                                                            </td>
                                                                        </tr>
                                                                        <tr id="agentLableDisplayTR" runat="server">
                                                                            <td align="right" style="width: 26%;" nowrap="nowrap" runat="server">
                                                                                <asp:Label ID="lblAgentApplicant" runat="server" Text="代理填寫者：" meta:resourcekey="lblAgentApplicantResource1"></asp:Label>
                                                                            </td>
                                                                            <td id="Td1" style="text-align: left; margin: 0; padding: 0;" runat="server">
                                                                                <asp:Label ID="lblAgentUser" runat="server" meta:resourcekey="lblAgentUserResource1"></asp:Label>
                                                                            </td>
                                                                        </tr>

                                                                    </table>
                                                                </asp:Panel>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </td>
                                                <td style="width: 20%; height: 100%; padding-left: 0; padding-right: 3px; margin: 0; padding-bottom: 0; padding-top: 0;" valign="top">
                                                    <table cellspacing="0" class="PopTable" style="height: 160px; margin: 0; padding: 0" width="100%">
                                                        <tr style="vertical-align: top;">
                                                            <td align="center" class="PopTableHeader" style="text-align: center; height: 20px">
                                                                <center>
                                                                    <asp:Label ID="lblOtherInfo" runat="server" Text="意見填寫" meta:resourcekey="lblOtherInfoResource1"></asp:Label>
                                                                </center>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td style="background-color: white; height: 140px; margin: 0; padding-bottom: 0; padding-top: 0;" valign="top" align="left">
                                                                <asp:TextBox ID="txtComment" runat="server" TextMode="MultiLine" Width="100%" Height="100%" meta:resourcekey="txtCommentResource1"></asp:TextBox>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </td>
                                                <td style="width: 20%; height: 100%; margin: 0; padding: 0; padding-right: 3px;" valign="top">
                                                    <table cellspacing="0" class="PopTable" style="height: 160px; margin: 0; padding: 0" width="100%">
                                                        <tr style="vertical-align: top;">
                                                            <td align="center" class="PopTableHeader" height="20px" style="text-align: center;">
                                                                <center>
                                                                    <asp:Label ID="lblFileUpload" runat="server" Text="相關附件(表單)" meta:resourcekey="lblFileUploadResource1"></asp:Label>
                                                                </center>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td style="background-color: white; height: 140px; margin: 0; padding: 0; width: 100%; vertical-align: top; text-align: center">
                                                                <div align="center" style="height: 135px; overflow: auto; width: 100%; margin: 0; padding: 0">
                                                                    
                                                                </div>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </td>
                                                <td style="width: 20%; height: 100%; margin: 0; padding: 0" valign="top">
                                                    <table cellspacing="0" class="PopTable" style="height: 160px; margin: 0; padding: 0" width="100%">
                                                        <tr style="vertical-align: top;">
                                                            <td align="center" class="PopTableHeader" height="20px" style="text-align: center;">
                                                                <center>
                                                                    <asp:Label ID="Label2" runat="server" Text="個人附件(站點)" meta:resourcekey="lblPersonalAttachResource1"></asp:Label>
                                                                </center>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td align="center" style="background-color: white; height: 140px; margin: 0; padding: 0; width: 100%" valign="top">
                                                                <div align="center" style="height: 135px; overflow: auto; width: 100%; margin: 0; padding: 0"></div>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                    <td style="background-image: url(<%=ThemePath %>/images/wf_a05.gif)"></td>
                                </tr>
                                <tr>
                                    <td style="background-image: url(<%=ThemePath %>/images/wf_a06.gif); background-position: 0% 0%; height: 20px"></td>
                                    <td style="background-image: url(<%=ThemePath %>/images/wf_a07.gif)"></td>
                                    <td style="background-image: url(<%=ThemePath %>/images/wf_a08.gif); background-position: 0% 0%; height: 20px"></td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>

                <table width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
                    <tr>
                        <td class="blank8"></td>
                    </tr>
                </table>

                    <table width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
                    <tr>
                        <td>
                            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                                <tr>
                                    <td style="width:120px;min-width:120px;">
                                        <img src="<%=ThemePath %>/images/wf_icon01.jpg" width="120" height="65">
                                    </td>
                                    <td style="background-image: url(<%=ThemePath %>/images/wf_a01.jpg);background-repeat:repeat-x;height:65px;background-position: 0% 100%;">
                                        <table width="100%" border="0" cellpadding="0" cellspacing="0" >
                                            <tr>
                                                <td class="bigT" style="height: 65px; vertical-align: middle;text-align:left">
                                                    <asp:Label ID="lblFormName" runat="server" meta:resourcekey="lblFormNameResource1"></asp:Label>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                    <td width="26">
                                        <img src="<%=ThemePath %>/images/wf_a02.jpg" width="26" height="65">
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                                <tr>
                                    <td width="15" height="8" style="background-image: url(<%=ThemePath %>/images/wf_a03.gif)">
                                        <img src="<%=ThemePath %>/images/wf_a03.gif" width="15" height="8">
                                    </td>
                                    <td height="8" style="background-image: url(<%=ThemePath %>/images/wf_a04.gif)"></td>
                                    <td width="15" height="8" style="background-image: url(<%=ThemePath %>/images/wf_a05.gif)">
                                        <img src="<%=ThemePath %>/images/wf_a05.gif" width="15" height="8">
                                    </td>
                                </tr>
                                <tr>
                                    <td style="background-image: url(<%=ThemePath %>/images/wf_a03.gif)">
                                        <img src="<%=ThemePath %>/images/wf_a03.gif" width="15" height="8">
                                    </td>
                                    <td style="background-image: url(<%=ThemePath %>/images/wf_a04.gif)">
                                        <table width="95%" border="0" align="center" cellpadding="0" cellspacing="0" style="margin-left:auto; margin-right:auto">
                                            <tr>
                                                <td>
                                                    <asp:Panel ID="Panel1" runat="server" Width="100%" meta:resourcekey="Panel1Resource1"></asp:Panel>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                    <td style="background-image: url(<%=ThemePath %>/images/wf_a05.gif)">
                                        <img src="<%=ThemePath %>/images/wf_a05.gif" width="15" height="8">
                                    </td>
                                </tr>
                                <tr>
                                    <td style="background-image: url(<%=ThemePath %>/images/wf_a06.gif); background-position: 0% 0%; height: 20px"></td>
                                    <td style="background-image: url(<%=ThemePath %>/images/wf_a07.gif)"></td>
                                    <td style="background-image: url(<%=ThemePath %>/images/wf_a08.gif); background-position: 0% 0%; height: 20px"></td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>

                <table width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
                   <tr>
                       <td class="blank8"></td>
                   </tr>
                </table>
                                   
                <table width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
                    <tr>
                        <td>
                            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                                <tr>
                                    <td style="width:120px;min-width:120px">
                                        <img src="<%=ThemePath %>/images/wf_icon02.jpg" width="120" height="65">
                                    </td>
                                    <td style="background-image: url(<%=ThemePath %>/images/wf_a01.jpg);background-repeat:repeat-x;height:65px;background-position: 0% 100%;">
                                        <table width="100%" border="0" cellpadding="0" cellspacing="0">
                                            <tr>
                                                <td class="bigT" style="height: 65px; vertical-align: middle;text-align:left">
                                                    <asp:Label ID="lblFormFlow" runat="server" Text="表單流程" meta:resourcekey="lblFormFlowResource1"></asp:Label>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                    <td width="26">
                                        <img src="<%=ThemePath %>/images/wf_a02.jpg" width="26" height="65">
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                                <tr>
                                    <td width="15" height="8" style="background-image: url(<%=ThemePath %>/images/wf_a03.gif)">
                                        <img src="<%=ThemePath %>/images/wf_a03.gif" width="15" height="8">
                                    </td>
                                    <td height="8" style="background-image: url(<%=ThemePath %>/images/wf_a04.gif)"></td>
                                    <td width="15" height="8" style="background-image: url(<%=ThemePath %>/images/wf_a05.gif)">
                                        <img src="<%=ThemePath %>/images/wf_a05.gif" width="15" height="8">
                                    </td>
                                </tr>
                                <tr>
                                    <td style="background-image: url(<%=ThemePath %>/images/wf_a03.gif)">
                                        <img src="<%=ThemePath %>/images/wf_a03.gif" width="15" height="8">
                                    </td>
                                    <td style="background-image: url(<%=ThemePath %>/images/wf_a04.gif)">
                                        <table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">
                                            <tr>
                                                <td>
                                                    <asp:Panel ID="Panel3" runat="server" meta:resourcekey="Panel3Resource1">
                                                        
                                                    </asp:Panel>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                    <td style="background-image: url(<%=ThemePath %>/images/wf_a05.gif)">
                                        <img src="<%=ThemePath %>/images/wf_a05.gif" width="15" height="8">
                                    </td>
                                </tr>
                                <tr>
                                    <td style="background-image: url(<%=ThemePath %>/images/wf_a06.gif); background-position: 0% 0%; height: 20px"></td>
                                    <td style="background-image: url(<%=ThemePath %>/images/wf_a07.gif)"></td>
                                    <td style="background-image: url(<%=ThemePath %>/images/wf_a08.gif); background-position: 0% 0%; height: 20px"></td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
                <table width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
                    <tr>
                        <td class="blank8"></td>
                    </tr>
                </table>
                        </center>
                </td>
            </tr>
        </table>
    </telerik:RadPageView>
</telerik:RadMultiPage>
<asp:HiddenField ID="hfType" runat="server" />
<asp:HiddenField ID="dockPositionHolder" runat="server" />
<asp:HiddenField ID="hfFormVersionId" runat="server" />
<asp:Table ID="tbFieldCollection" runat="server" EnableViewState="False" BackImageUrl="<%=ThemePath %>/images/line01.gif" BorderWidth="0px" CellPadding="2" Width="100%" meta:resourcekey="tbFieldCollectionResource1" Visible="False" />

<asp:Label ID="lblSelectAll" runat="server" Text="全選" Visible="False" meta:resourcekey="lblSelectAllResource1"></asp:Label>
<asp:Label ID="lblFormNumfield" runat="server" Text=" * 表單編號欄位  " Visible="False" meta:resourcekey="lblFormNumfieldResource1"></asp:Label>
<asp:Label ID="lblMemo" runat="server" Text="註：" Visible="False" meta:resourcekey="lblMemoResource1"></asp:Label>
<asp:Label ID="lblhiddenFieldNote" runat="server" Text="隱藏欄位" Visible="False" meta:resourcekey="lblhiddenFieldNoteResource1"></asp:Label>
<asp:Label ID="lblSingleLineText" runat="server" Text="單行文字" Visible="False" meta:resourcekey="lblSingleLineTextResource1"></asp:Label>
<asp:Label ID="lblMultiLineText" runat="server" Text="多行文字" Visible="False" meta:resourcekey="lblMultiLineTextResource1"></asp:Label>
<asp:Label ID="lblNumberText" runat="server" Text="數值" Visible="False" meta:resourcekey="lblNumberTextResource1"></asp:Label>
<asp:Label ID="lblFileButton" runat="server" Text="檔案選取" Visible="False" meta:resourcekey="lblFileButtonResource1"></asp:Label>
<asp:Label ID="lblDateSelect" runat="server" Text="日期" Visible="False" meta:resourcekey="lblDateSelectResource1"></asp:Label>
<asp:Label ID="lblTimeSelect" runat="server" Text="時間" Visible="False" meta:resourcekey="lblTimeSelectResource1"></asp:Label>
<asp:Label ID="lblCheckBox" runat="server" Text="核選方塊" Visible="False" meta:resourcekey="lblCheckBoxResource1"></asp:Label>
<asp:Label ID="lblRadioButton" runat="server" Text="單選鈕" Visible="False" meta:resourcekey="lblRadioButtonResource1"></asp:Label>
<asp:Label ID="lblDropDownList" runat="server" Text="下拉式選單" Visible="False" meta:resourcekey="lblDropDownListResource1"></asp:Label>
<asp:Label ID="lblHtmlEditor" runat="server" Text="文字編輯" Visible="False" meta:resourcekey="lblHtmlEditorResource1"></asp:Label>
<asp:Label ID="lblDataGrid" runat="server" Text="明細" Visible="False" meta:resourcekey="lblDataGridResource1"></asp:Label>
<asp:Label ID="lblHyperLink" runat="server" Text="超連結" Visible="False" meta:resourcekey="lblHyperLinkResource1"></asp:Label>
<asp:Label ID="lblCalculateText" runat="server" Text="表單計算" Visible="False" meta:resourcekey="lblCalculateTextResource1"></asp:Label>
<asp:Label ID="lblAggregateText" runat="server" Text="加總平均" Visible="False" meta:resourcekey="lblAggregateTextResource1"></asp:Label>
<asp:Label ID="lblDisplayField" runat="server" Text="純顯示" Visible="False" meta:resourcekey="lblDisplayFieldResource1"></asp:Label>
<asp:Label ID="lblHiddenField" runat="server" Text="隱藏" Visible="False" meta:resourcekey="lblHiddenFieldResource1"></asp:Label>
<asp:Label ID="lblUserProposer" runat="server" Text="申請者" Visible="False" meta:resourcekey="lblUserProposerResource1"></asp:Label>
<asp:Label ID="lblUserDept" runat="server" Text="申請者部門" Visible="False" meta:resourcekey="lblUserDeptResource1"></asp:Label>
<asp:Label ID="lblUserRank" runat="server" Text="申請者職級" Visible="False" meta:resourcekey="lblUserRankResource1"></asp:Label>
<asp:Label ID="lblUserFunction" runat="server" Text="申請者職務" Visible="False" meta:resourcekey="lblUserFunctionResource1"></asp:Label>
<asp:Label ID="lblUserAgent" runat="server" Text="申請者代理人" Visible="False" meta:resourcekey="lblUserAgentResource1"></asp:Label>
<asp:Label ID="lblAllDept" runat="server" Text="所有部門" Visible="False" meta:resourcekey="lblAllDeptResource1"></asp:Label>
<asp:Label ID="lblAllRank" runat="server" Text="所有職級" Visible="False" meta:resourcekey="lblAllRankResource1"></asp:Label>
<asp:Label ID="lblAllFunction" runat="server" Text="所有職務" Visible="False" meta:resourcekey="lblAllFunctionResource1"></asp:Label>
<asp:Label ID="lblAllUser" runat="server" Text="所有人員" Visible="False" meta:resourcekey="lblAllUserResource1"></asp:Label>
<asp:Label ID="lblAllMember" runat="server" Text="所有會員" Visible="False" meta:resourcekey="lblAllMemberResource1"></asp:Label>
<asp:Label ID="lblUserSetField" runat="server" Text="人員組織" Visible="False" meta:resourcekey="lblUserSetFieldResource1"></asp:Label>
<asp:Label ID="lblAllMemberGroup" runat="server" Text="所有群組" Visible="False" meta:resourcekey="lblMemberGroupResource1"></asp:Label>
<asp:Label ID="lblCanvas" runat="server" Text="手寫簽名" Visible="False" meta:resourcekey="lblCanvasResource1"></asp:Label>
<asp:Label ID="lblModify" runat="server" Text="編輯" Visible="False" meta:resourcekey="lblModifyResource1"></asp:Label>
<asp:Label ID="lblDeleteErrorMsg" runat="server" Text="欄位如被設定為表單條件不允許刪除，請先移除此表單條件！" Visible="False" meta:resourcekey="lblDeleteErrorMsgResource1"></asp:Label>
<asp:Label ID="lblAggDeleteExecMsg" runat="server" Text="欄位不允許刪除! 明細欄位中有子欄位被使用於加總平均欄位中!" Visible="False" meta:resourcekey="lblAggDeleteExecMsgResource1"></asp:Label>
<asp:Label ID="lblCalcDeleteExecMsg" runat="server" Text="欄位不允許刪除! 欄位被當作計算欄位運算元!" Visible="False" meta:resourcekey="lblCalcDeleteExecMsgResource1"></asp:Label>
<asp:Label ID="lblAutoNumDeleteExecMsg" runat="server" Text="編號欄位不允許刪除!" Visible="False" meta:resourcekey="lblAutoNumDeleteExecMsgResource1"></asp:Label>
<asp:Label ID="lblCopyColumnTip" runat="server" Text="複製此欄位" Visible="false" meta:resourcekey="lblCopyColumnTipResource1"></asp:Label>
<asp:HiddenField ID="hiddenPaneExpend" runat="server" />
<asp:HiddenField ID="hiddenHeight" runat="server" />
