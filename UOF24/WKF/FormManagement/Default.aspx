<%@ Page Language="C#" MasterPageFile="~/Master/TwoColumn.master" AutoEventWireup="true" Inherits="WKF_FormManagement_Default" Title="表單設計管理主畫面" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" Codebehind="Default.aspx.cs" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ScriptContentPlaceHolder" runat="Server">
    <style>

        .SearchBoxMargin {
            margin-top: 2px;
            margin-left: 1px;
        }
        .TreeMargin {
            margin-left: 5px;
        }
        .rbPrimary{
            padding-left:0px !important;
        }
    </style>
      
    <script type="text/javascript" id="telerikClientEvents1">
        function RadToolBar1_ButtonClicking(sender, args) {
            var value = args.get_item().get_value();

            if (value == "ManageFormType") {//類別管理
                args.set_cancel(true);
                $uof.dialog.open2("~/WKF/FormManagement/ManageFormType.aspx", args.get_item(), "", 380, 530, openDialogResult);
            }
            else if (value == "AddForm") {//新增表單

                var tree = $find('<%=treeFormList.ClientID%>');
                var obj = tree.get_selectedNode();
                if (obj.get_level() == "0") {
                    var categoryId = obj.get_value();
                }
                else {
                    var categoryId = obj.get_parent().get_value();
                }
                args.set_cancel(true);
                $uof.dialog.open2("~/WKF/FormManagement/AddForm.aspx", args.get_item(), "", 850, 740, openDialogResult, { "formCategoryId": categoryId });

            }

            else if (value == "MaintainForm") {
                //維護表單
                args.set_cancel(true);
                $uof.dialog.open2("~/WKF/FormManagement/ModifyForm.aspx",args.get_item(),"",850,740,openDialogResult,{"formId":GetSelectedTag()});
            }

            else if (value == "DeleteForm") {
                //確定要刪除?
                if (confirm('<%=lbConfirmDelete.Text %>') == false) {
                    args.set_cancel(true);
                }
            }
            else if (value == "AddVersion") {//新增表單版本
                args.set_cancel(true);
                $uof.dialog.open2("~/WKF/FormManagement/AddFormVersion.aspx", args.get_item(), "", 650, 600, openDialogResult, { "formId": GetSelectedTag() });
            }
            else if (value == "DeleteVersion") {
                //確定要刪除?
                if (confirm('<%=lbConfirmDelete.Text %>') == false) {
                    args.set_cancel(true);
                }
            }
            else if (value == 'tempBtn') {
                args.set_cancel(true);
            }
            else if (value == "Import") {

                var tree = $find('<%=treeFormList.ClientID %>');
                var obj = tree.get_selectedNode();

                var formId = obj.get_value();
                var categroyId = obj.get_parent().get_value();
                
                args.set_cancel(true);
                $uof.dialog.open2("~/WKF/FormManagement/ImportForm.aspx", args.get_item(),"", 600, 600, openDialogResult, { "formId": formId, "categroyId": categroyId });
            }

            function openDialogResult(returnValue) {
                if (typeof (returnValue) == "undefined") {
                    return false;
                }
                return true;
            }
    }
    </script>
    
    <script id="Defaultjs" type="text/javascript">
        var IsSearh = "";   //紀錄是不是查詢表單的動作

    function CollapseAllNodes() {
        var tree = $find("<%=treeFormList.ClientID%>");
        if (tree != null)
        {
            var nodes = tree.get_allNodes();
            for (var i = 0; i < nodes.length; i++) {

                if (nodes[i].get_nodes() != null) {
                    nodes[i].collapse();
                }
            }

            $("#<%=divCollapse.ClientID%>").hide();
            $("#<%=divExpand.ClientID%>").show();
        }
    }

    function ExpandAllNodes()
    {
        var tree = $find("<%=treeFormList.ClientID%>");
        if (tree != null)
        {
            var nodes = tree.get_allNodes();
            for (var i = 0; i < nodes.length; i++) {

                if (nodes[i].get_nodes() != null) {
                    nodes[i].expand();
                }
            }

            $("#<%=divCollapse.ClientID%>").show();
            $("#<%=divExpand.ClientID%>").hide();
        }
    }


    function Search(sender, args)
    {
        KeywordSearch();
    }

    function KeywordSearch() {
        var text = $("#<%=txtSearch.ClientID%>").val();
        var tree = $find("<%=treeFormList.ClientID%>");

        if (text !== "") {
            var categoryNodes = tree.get_nodes();

            //每一個類別
            for (var i = 0; i < categoryNodes.get_count() ; i++) {

                //拿到該類別
                var categoryNode = categoryNodes.getNode(i);

                //拿到該類別底下的所有表單
                var formNodes = categoryNode.get_nodes();

                var searchExist = false;
                //每一個表單
                for (var j = 0; j < formNodes.get_count() ; j++) {

                    //拿到該表單
                    var formNode = formNodes.getNode(j);

                    //拿到該表單的文字
                    var formText = formNode.get_text();

                    if (formText.indexOf(text) < 0) {
                        formNode.set_visible(false);
                    }
                    else {
                        formNode.set_visible(true);
                        searchExist = true;
                    }
                }

                if (!searchExist) {
                    categoryNode.set_visible(false);
                }
                else {
                    if (IsSearh != "false") {
                        //查詢表單展開符合關鍵字的表單類別
                        categoryNode.set_visible(true);
                        categoryNode.expand();
                        $("#<%=divCollapse.ClientID%>").show();
                        $("#<%=divExpand.ClientID%>").hide();                        
                    } else {
                        //點選節點則判斷要展開還是收合(查詢表單狀態)
                        if (categoryNode.get_text() == tree.get_selectedNode().get_text()) {
                            if (categoryNode.get_expanded()) {                               
                                categoryNode.collapse();                                
                            } else {                                
                                categoryNode.expand();                                
                            }
                        } 
                    }
                }                
            }
            IsSearh = "";
        }
        else {
            var nodes = tree.get_allNodes();

            for (var i = 0; i < nodes.length; i++) {
                nodes[i].set_visible(true);
            }
        }

    }

    Sys.Application.add_load(function () {
        var lblSearch = $("#<%=lblSearch.ClientID%>");
        var txtSearch = $("#<%=txtSearch.ClientID%>");

        txtSearch.attr("placeholder", lblSearch.text());

        txtSearch.keyup(function (e) {
            if ((e.which == 8 && txtSearch.val() == "") ||
                (e.which == 13 && txtSearch.val() != "") ||
                (e.which == 46 && txtSearch.val() == "")) {
                KeywordSearch();
            }
        });

        txtSearch.bind("mouseup", function (e) {
            var $input = $(this),
                oldValue = $input.val();

            if (oldValue == "") return;

            setTimeout(function () {
                var newValue = $input.val();

                if (newValue == "") {
                    KeywordSearch();
                }
            }, 10);
        });

        if (txtSearch.val() != "") {
            IsSearh = "false";     //點選類別節點改狀態為false
            KeywordSearch();
        }
    });

         function GetSelectedTag() {
             var tree = $find('<%=treeFormList.ClientID%>');
             var obj = tree.get_selectedNode();
             return obj.get_value();
         }

         function treeFormList_NodeClicking(sebder, args) {
 	
             //單擊類別文字即展開或收合列表(非查詢表單狀態)
             var txtSearch = $("#<%=txtSearch.ClientID%>");
             if (txtSearch.val() == "") {                 
                 var node = args.get_node();
                 node.toggle();
             } 

             var toolBar = $find("<%= RadToolBar1.ClientID %>");

             var item = toolBar.findItemByValue("tempBtn");

             item.enable();
         }
    </script>

</asp:Content>
    <asp:Content ID="Content2" ContentPlaceHolderID="ToolbarContentPlaceHolder" runat="Server">

        <asp:UpdatePanel ID="UpdatePanel2" runat="server" RenderMode="Inline" UpdateMode="Conditional">
                    <ContentTemplate>
                        <telerik:RadToolBar ID="RadToolBar1" Runat="server" meta:resourcekey="ToolbarFormMTResource1"
                            OnClientButtonClicking="RadToolBar1_ButtonClicking" OnButtonClick="RadToolBar1_ButtonClick" Width="100%">
                            <Items>
                                <telerik:RadToolBarButton runat="server" 
                                    ImageUrl="~/Common/Images/Icon/icon_m43.gif" 
                                    DisabledImageUrl="~/Common/Images/Icon/icon_m43.gif"
                                    Value="ManageFormType" 
                                    HoveredImageUrl="~/Common/Images/Icon/icon_m43.gif"
                                    CheckedImageUrl="~/Common/Images/Icon/icon_m43.gif" 
                                    Text="類別管理" ToolTip="類別管理"
                                    meta:resourceKey="TBarButtonResource1">
                                </telerik:RadToolBarButton>
                                <telerik:RadToolBarButton runat="server" IsSeparator="True" meta:resourcekey="RadToolBarButtonResource1">
                                </telerik:RadToolBarButton>
                                <telerik:RadToolBarButton runat="server"  
                                    ImageUrl="~/Common/Images/Icon/icon_m80.gif" 
                                    Enabled="False"
                                    DisabledImageUrl="~/Common/Images/Icon/icon_m80_g.gif" 
                                    Value="AddForm"
                                    HoveredImageUrl="~/Common/Images/Icon/icon_m80.gif" 
                                    CheckedImageUrl="~/Common/Images/Icon/icon_m80.gif"
                                    Text="新增表單" ToolTip="新增表單"
                                    meta:resourceKey="TBarButtonResource2">
                                </telerik:RadToolBarButton>
                                <telerik:RadToolBarButton runat="server" IsSeparator="True" meta:resourcekey="RadToolBarButtonResource2">
                                </telerik:RadToolBarButton>
                                <telerik:RadToolBarButton runat="server" 
                                    ImageUrl="~/Common/Images/Icon/icon_m134.gif" 
                                    Enabled="False"
                                    DisabledImageUrl="~/Common/Images/Icon/icon_m134_g.gif" 
                                    Value="MaintainForm"
                                    HoveredImageUrl="~/Common/Images/Icon/icon_m134.gif" 
                                    CheckedImageUrl="~/Common/Images/Icon/icon_m134.gif"
                                    Text="維護表單" ToolTip="維護表單"
                                    meta:resourceKey="TBarButtonResource6">
                                </telerik:RadToolBarButton>
                                <telerik:RadToolBarButton runat="server" IsSeparator="True" meta:resourcekey="RadToolBarButtonResource3">
                                </telerik:RadToolBarButton>
                                <telerik:RadToolBarButton runat="server"  
                                    ImageUrl="~/Common/Images/Icon/icon_m03.gif" 
                                    Enabled="False"
                                    DisabledImageUrl="~/Common/Images/Icon/icon_m03_g.gif" 
                                    Value="DeleteForm"
                                    HoveredImageUrl="~/Common/Images/Icon/icon_m03.gif" 
                                    CheckedImageUrl="~/Common/Images/Icon/icon_m03.gif"
                                    Text="刪除表單" ToolTip="刪除表單"
                                    meta:resourceKey="TBarButtonResource3">
                                </telerik:RadToolBarButton>
                                <telerik:RadToolBarButton runat="server" IsSeparator="True" meta:resourcekey="RadToolBarButtonResource4">
                                </telerik:RadToolBarButton>
                                <telerik:RadToolBarButton runat="server" 
                                    ImageUrl="~/Common/Images/Icon/icon_m81.gif" 
                                    Enabled="False"
                                    DisabledImageUrl="~/Common/Images/Icon/icon_m81_g.gif" 
                                    Value="AddVersion"
                                    HoveredImageUrl="~/Common/Images/Icon/icon_m81.gif" 
                                    CheckedImageUrl="~/Common/Images/Icon/icon_m81.gif"
                                    Text="新增表單版本" ToolTip="新增表單版本"
                                    meta:resourceKey="TBarButtonResource4">
                                </telerik:RadToolBarButton>
                                <telerik:RadToolBarButton runat="server" IsSeparator="True" meta:resourcekey="RadToolBarButtonResource5">
                                </telerik:RadToolBarButton>
                                <telerik:RadToolBarButton runat="server"  
                                    ImageUrl="~/Common/Images/Icon/icon_m03.gif" 
                                    Enabled="False"
                                    DisabledImageUrl="~/Common/Images/Icon/icon_m03_g.gif" 
                                    Value="DeleteVersion"
                                    HoveredImageUrl="~/Common/Images/Icon/icon_m03.gif" 
                                    CheckedImageUrl="~/Common/Images/Icon/icon_m03.gif"
                                    Text="刪除表單版本" ToolTip="刪除表單版本"
                                    meta:resourceKey="TBarButtonResource5">
                                </telerik:RadToolBarButton>
                                <telerik:RadToolBarButton runat="server" IsSeparator="True" meta:resourcekey="RadToolBarButtonResource6">
                                </telerik:RadToolBarButton>
                                <telerik:RadToolBarButton runat="server" 
                                    Value="Import" Text="匯入表單" 
                                    Enabled="False" ToolTip="匯入表單"
                                     ImageUrl="~/Common/Images/Icon/icon_m59.gif"
                                    CheckedImageUrl="~/Common/Images/Icon/icon_m59.gif" 
                                    HoveredImageUrl="~/Common/Images/Icon/icon_m59.gif"
                                    DisabledImageUrl="~/Common/Images/Icon/icon_m59.gif" 
                                    meta:resourcekey="TBarButtonResource10">
                                </telerik:RadToolBarButton>
                                <telerik:RadToolBarButton runat="server" IsSeparator="True" meta:resourcekey="RadToolBarButtonResource7">
                                </telerik:RadToolBarButton>
                                <telerik:RadToolBarButton runat="server" Value="tempBtn" meta:resourcekey="TBarButtonResource7">
                                </telerik:RadToolBarButton>
                            </Items>
                        </telerik:RadToolBar>
                    </ContentTemplate>
                </asp:UpdatePanel>
    </asp:Content>
 <asp:Content ID="Content3" ContentPlaceHolderID="LeftContentPlaceHolder" runat="server" >
     <asp:UpdatePanel ID="UpdatePanel3" runat="server" RenderMode="Inline" UpdateMode="Conditional">
         <ContentTemplate>
             <asp:Label ID="lblSearch" runat="server" Text="表單名稱" meta:resourcekey="lblSearchResource1"></asp:Label>
             <table style="width: 100%">
                 <tr>
                     <td style="width: 100%">
                         <asp:TextBox ID="txtSearch" runat="server" Width="100%" placeholder="" CssClass="SearchBoxMargin"></asp:TextBox>

                     </td>
                     <td>
                         <telerik:RadButton ID="btnSearh" runat="server" AutoPostBack="false" OnClientClicked="Search">

                             <Icon PrimaryIconUrl="~/Common/Images/Icon/icon_m39.png" PrimaryIconLeft="2px" />
                         </telerik:RadButton>
                     </td>

                 </tr>
                 <tr>
                     <td colspan="2">
                         <table>
                            <tr>
                                <td>
                                    <div id="divExpand" style="cursor: pointer" onclick="ExpandAllNodes()" runat="server">
                                         <img src="../../Common/Images/Icon/icon_m209.png" style="margin-left:5px;margin-bottom:3px"/>
                                         <asp:Label ID="lblExpand" runat="server" Text="展開"  meta:resourcekey="lblExpandResource1"></asp:Label>
                                     </div>
                                </td>
                                <td>
                                    <div id="divCollapse" style="cursor: pointer" onclick="CollapseAllNodes()" runat="server">
                                         <img src="../../Common/Images/Icon/icon_m210.png" style="margin-left:5px;margin-bottom:3px"/>
                                         <asp:Label ID="lblCollapse" runat="server" Text="收合" meta:resourcekey="lblCollapseResource1"></asp:Label>
                                     </div>
                                </td>
                            </tr>
                         </table>
                         

                         
                     </td>

                 </tr>
             </table>
             <telerik:RadTreeView ID="treeFormList" runat="server" OnNodeClick="treeFormList_NodeClick"
                 OnClientNodeClicking="treeFormList_NodeClicking" meta:resourcekey="treeFormListResource2" CssClass="TreeMargin">
             </telerik:RadTreeView>
         </ContentTemplate>

     </asp:UpdatePanel>

 </asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="RightContentPlaceHolder" runat="Server">

    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional" RenderMode="Inline">
        <ContentTemplate>
            <asp:Panel ID="PanelSummary" runat="server" meta:resourcekey="PanelSummaryResource1"
                            __designer:wfdid="w86" Width="100%">
                <span style="color: #ff0000">
                    <table class="PopTable" cellspacing="1" width="99%">
                        <tbody>
                            <tr>
                                <td style="width: 30px" class="PopTableLeftTD">
                                    <table>
                                        <tr>
                                            <td nowrap="nowrap">
                                                <asp:Label ID="Label3" runat="server" meta:resourcekey="Label3Resource1" Text="使用說明"
                                                    __designer:wfdid="w87"></asp:Label>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                                <td style="text-align: left" class="PopTableRightTD">
                                    <asp:Label ID="Label4" runat="server" meta:resourcekey="Label4Resource1" Text="1.欲維護表單類別或移動表單至不同類別，請點選類別管理"
                                        __designer:wfdid="w88"></asp:Label><br />
                                    <asp:Label ID="Label5" runat="server" meta:resourcekey="Label5Resource1" Text="2.欲維護表單，請先選擇左邊表單列表中的表單類別"
                                        __designer:wfdid="w89"></asp:Label><br />
                                    <asp:Label ID="Label6" runat="server" meta:resourcekey="Label6Resource1" Text="3.欲維護表單版本，則需先選擇左邊表單列表中的表單"
                                        __designer:wfdid="w90"></asp:Label>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </span>
            </asp:Panel>
            <asp:Panel ID="PanelDesignForm" runat="server" meta:resourcekey="PanelDesignFormResource1"
                            Visible="False" __designer:wfdid="w91" Width="100%">
                <table cellspacing="0" cellpadding="0" width="100%" border="0">
                    <tbody>
                        <tr>
                            <td style="height: 42px" align="center">
                                <table class="PopTable" cellspacing="1" width="99%">
                                    <colgroup class="PopTableLeftTD">
                                    </colgroup>
                                    <colgroup class="PopTableRightTD">
                                    </colgroup>
                                    <colgroup class="PopTableLeftTD">
                                    </colgroup>
                                    <colgroup class="PopTableRightTD">
                                    </colgroup>
                                    <tbody>
                                        <tr>
                                            <td>
                                                <asp:Label ID="lblTitleFormType" runat="server" meta:resourcekey="lblTitleFormTypeResource1"
                                                    Text="表單類別" __designer:wfdid="w92"></asp:Label>
                                            </td>
                                            <td style="text-align: left;width: 100%" >
                                                <asp:Label ID="lblFormTypeByForm" runat="server" meta:resourcekey="lblFormTypeByFormResource1"
                                                    __designer:wfdid="w93"></asp:Label>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                                <Fast:Grid ID="FormGrid" runat="server" __designer:wfdid="w94" Width="100%" OnRowCommand="FormGrid_RowCommand"
                                    AllowSorting="True" AutoGenerateCheckBoxColumn="True"  
                                    AutoGenerateColumns="False" DataKeyNames="FORM_ID" OnRowDataBound="FormGrid_RowDataBound"
                                     DataKeyOnClientWithCheckBox="False" DefaultSortDirection="Ascending"
                                    EnhancePager="True" PageSize="15" meta:resourcekey="FormGridResource2">
                                    <EnhancePagerSettings FirstAltImageUrl="" FirstImageUrl="" LastAltImage="" LastImageUrl=""
                                        NextIAltImageUrl="" NextImageUrl="" PageInfoCssClass="" PageNumberCssClass=""
                                        PageNumberCurrentCssClass="" PageRedirectCssClass="" PreviousAltImageUrl="" PreviousImageUrl=""
                                        ShowHeaderPager="True" />
                                    <ExportExcelSettings AllowExportToExcel="False" />
                                    <Columns>
                                        <asp:TemplateField Visible="False" meta:resourcekey="TemplateFieldResource1">
                                            <EditItemTemplate>
                                                <asp:Label runat="server" Text='<%# Bind("FORM_ID") %>' ID="lblFormId2" meta:resourceKey="lblFormId2Resource1"></asp:Label>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label runat="server" Text='<%# Bind("FORM_ID") %>' ID="lblFormId" meta:resourceKey="lblFormIdResource1"></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="表單名稱" meta:resourcekey="TemplateFieldResource2">
                                            <ItemTemplate>
                                                <asp:LinkButton runat="server" ID="LinkBtnFromName" 
                                                    meta:resourceKey="LinkBtnFromNameResource1"></asp:LinkButton>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Left" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="表單逾時" meta:resourcekey="TemplateFieldResource3">
                                            <EditItemTemplate>
                                                <asp:TextBox runat="server" ID="TextBox1" meta:resourceKey="TextBox1Resource1"></asp:TextBox>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label runat="server" Text='<%# Bind("DELAY_HOUR") %>' ID="lblDELAY_HOUR" meta:resourceKey="lblDELAY_HOURResource1"></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="表單停用" meta:resourcekey="TemplateFieldResource4">
                                            <EditItemTemplate>
                                                <asp:TextBox runat="server" ID="TextBox2" meta:resourceKey="TextBox2Resource1"></asp:TextBox>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label runat="server" Text='<%# Bind("FORM_CTL") %>' ID="lblFORM_CTL" meta:resourceKey="lblFORM_CTLResource1"></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" />
                                        </asp:TemplateField>
                                        <asp:TemplateField Visible="False" meta:resourcekey="TemplateFieldResource5">
                                            <EditItemTemplate>
                                                <asp:TextBox runat="server" Text='<%# Bind("VERSION_CNT") %>' ID="TextBox3" meta:resourceKey="TextBox3Resource1"></asp:TextBox>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label runat="server" Text='<%# Bind("VERSION_CNT") %>' ID="dgItemlblVersionCnt"
                                                    meta:resourceKey="dgItemlblVersionCntResource1"></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Left" />
                                        </asp:TemplateField>
                                    </Columns>
                                </Fast:Grid>
                            </td>
                        </tr>
                        <tr>
                            <td height="2">
                            </td>
                        </tr>
                        <tr>
                            <td style="height: 166px" valign="top" align="center">
                                <br />
                                &nbsp;
                            </td>
                        </tr>
                    </tbody>
                </table>
            </asp:Panel>
            <asp:Panel ID="PanelDesignFormVersion" runat="server" meta:resourcekey="PanelDesignFormVersionResource1"
                            Visible="False" __designer:wfdid="w95" Width="100%">
                <table cellspacing="0" cellpadding="0" width="100%" border="0">
                    <tbody>
                        <tr>
                            <td style="height: 65px" align="center">
                                <table class="PopTable" cellspacing="1" width="99%">
                                    <colgroup class="PopTableLeftTD">
                                    </colgroup>
                                    <colgroup class="PopTableRightTD">
                                    </colgroup>
                                    <colgroup class="PopTableLeftTD">
                                    </colgroup>
                                    <colgroup class="PopTableRightTD">
                                    </colgroup>
                                    <tbody>
                                        <tr>
                                            <td>
                                                <asp:Label ID="Label1" runat="server" meta:resourcekey="Label1Resource2" Text="表單類別"
                                                    __designer:wfdid="w96"></asp:Label>
                                            </td>
                                            <td style="text-align: left;">
                                                <asp:Label ID="lblFormVersion_formType" runat="server" meta:resourcekey="lblFormVersion_formTypeResource1"
                                                    __designer:wfdid="w97"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:Label ID="lblFormDelay" runat="server" meta:resourcekey="lblFormDelayResource1"
                                                    Text="表單逾時" __designer:wfdid="w98"></asp:Label>
                                            </td>
                                            <td class="PopTableRightTD" style="text-align: left;">
                                                <asp:Label ID="lblFormVersion_formDelay" runat="server" meta:resourcekey="lblFormVersion_formDelayResource1"
                                                    __designer:wfdid="w99"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="height: 11px">
                                                <asp:Label ID="lblFormName" runat="server" meta:resourcekey="lblFormNameResource1"
                                                    Text="表單名稱" __designer:wfdid="w100"></asp:Label>
                                            </td>
                                            <td style="height: 11px; text-align: left;" class="PopTableRightTD">
                                                <asp:Label ID="lblFormVersion_formName" runat="server" meta:resourcekey="lblFormVersion_formNameResource1"
                                                    __designer:wfdid="w101"></asp:Label>
                                            </td>
                                            <td style="height: 11px">
                                                <asp:Label ID="lblFormCtl" runat="server" meta:resourcekey="lblFormCtlResource1"
                                                    Text="表單停用" __designer:wfdid="w102"></asp:Label>
                                            </td>
                                            <td style="height: 11px; text-align: left;" class="PopTableRightTD">
                                                <asp:CheckBox ID="cbFormCtl" runat="server" meta:resourcekey="cbFormCtlResource1"
                                                    __designer:wfdid="w103" Enabled="False"></asp:CheckBox>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td>
                            </td>
                        </tr>
                        <tr>
                            <td align="center">
                                <Fast:Grid ID="FormVersionGrid" runat="server" __designer:wfdid="w104" Width="100%"
                                     OnRowDataBound="FormVersionGrid_RowDataBound"
                                    DataKeyNames="FORM_VERSION_ID" AutoGenerateColumns="False" 
                                     AutoGenerateCheckBoxColumn="True" AllowSorting="True" DataKeyOnClientWithCheckBox="False"
                                    DefaultSortDirection="Ascending" EnhancePager="True" PageSize="15" EmptyDataText="沒有資料"
                                    EnableModelValidation="True" KeepSelectedRows="False" meta:resourcekey="FormVersionGridResource2">
                                    <EnhancePagerSettings FirstAltImageUrl="" FirstImageUrl="" LastAltImage="" LastImageUrl=""
                                        NextIAltImageUrl="" NextImageUrl="" PageInfoCssClass="" PageNumberCssClass=""
                                        PageNumberCurrentCssClass="" PageRedirectCssClass="" PreviousAltImageUrl="" PreviousImageUrl=""
                                        ShowHeaderPager="True" />
                                    <ExportExcelSettings AllowExportToExcel="False" />
                                    <Columns>
                                        <asp:TemplateField Visible="False" meta:resourcekey="TemplateFieldResource6">
                                            <EditItemTemplate>
                                                <asp:TextBox runat="server" Text='<%#: Bind("FLOW_ID") %>' ID="TextBox4" meta:resourceKey="TextBox4Resource1"></asp:TextBox>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label runat="server" Text='<%#: Bind("FLOW_ID") %>' ID="lblFLOW_ID" meta:resourceKey="lblFLOW_IDResource1"></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Left" />
                                        </asp:TemplateField>
                                        <asp:TemplateField FooterText="[FORM_VERSION_ID]" Visible="False" meta:resourcekey="TemplateFieldResource7">
                                            <EditItemTemplate>
                                                <asp:TextBox runat="server" Text='<%#: Bind("FORM_VERSION_ID") %>' ID="TextBox5" meta:resourceKey="TextBox3Resource2"></asp:TextBox>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label runat="server" Text='<%#: Bind("FORM_VERSION_ID") %>' ID="lblFORM_VERSION_ID"
                                                    meta:resourceKey="lblFORM_VERSION_IDResource1"></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Left" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="版本" meta:resourcekey="TemplateFieldResource8">
                                            <ItemTemplate>
                                                <asp:LinkButton runat="server" ID="linkBtnVERSION" Text='<%#: Bind("VERSION") %>'
                                                    meta:resourceKey="linkBtnVERSIONResource1"></asp:LinkButton>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="狀態" meta:resourcekey="TemplateFieldResource9">
                                            <EditItemTemplate>
                                                <asp:TextBox runat="server" Text='<%#: Bind("ISSUE_CTL") %>' ID="TextBox6" meta:resourceKey="TextBox1Resource2"></asp:TextBox>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label runat="server" Text='<%#: Bind("ISSUE_CTL") %>' ID="lblISSUE_CTL" meta:resourceKey="lblISSUE_CTLResource1"></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="自動發佈時間" meta:resourcekey="TemplateFieldResource10">
                                            <ItemTemplate>
                                                <asp:Label runat="server" ID="lblISSUE_TIME"></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="禁止發表" Visible="False" meta:resourcekey="TemplateFieldResource11">
                                            <ItemTemplate>
                                                <asp:Label runat="server" Text='<%#: Bind("IS_ALLOW_ISSUE") %>' ID="lblIS_ALLOW_ISSUE"
                                                    meta:resourceKey="lblIS_ALLOW_ISSUEResource1"></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Left" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="操作" meta:resourcekey="TemplateFieldResource12">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="lbtnExport" runat="server" CommandName="lbtnExport" Text="匯出表單"
                                                    CommandArgument='<%#: Bind("FORM_VERSION_ID") %>' meta:resourcekey="lbtnExportResource1" />
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" />
                                        </asp:TemplateField>
                                    </Columns>
                                </Fast:Grid>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </asp:Panel>
            <Fast:Grid ID="Grid1" runat="server" __designer:wfdid="w1" Width="100%" OnRowCommand="FormGrid_RowCommand"
                AllowSorting="True" AutoGenerateCheckBoxColumn="True"  
                AutoGenerateColumns="False" DataKeyNames="FORM_ID" OnRowDataBound="FormGrid_RowDataBound"
                 DataKeyOnClientWithCheckBox="False" DefaultSortDirection="Ascending"
                EnhancePager="True" PageSize="15" meta:resourcekey="Grid1Resource1">
                <EnhancePagerSettings FirstAltImageUrl="" FirstImageUrl="" LastAltImage="" LastImageUrl=""
                    NextIAltImageUrl="" NextImageUrl="" PageInfoCssClass="" PageNumberCssClass=""
                    PageNumberCurrentCssClass="" PageRedirectCssClass="" PreviousAltImageUrl="" PreviousImageUrl=""
                    ShowHeaderPager="True" />
                <ExportExcelSettings AllowExportToExcel="False" />
                <Columns>
                    <asp:TemplateField Visible="False" meta:resourcekey="TemplateFieldResource1">
                        <EditItemTemplate>
                            <asp:Label runat="server" Text='<%#: Bind("FORM_ID") %>' ID="Label2" meta:resourceKey="lblFormId2Resource1"></asp:Label>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label runat="server" Text='<%#: Bind("FORM_ID") %>' ID="Label8" meta:resourceKey="lblFormIdResource1"></asp:Label>
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Left" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="表單名稱" meta:resourcekey="TemplateFieldResource2">
                        <ItemTemplate>
                            <asp:LinkButton runat="server" ID="LinkBtnFromName" 
                                meta:resourceKey="LinkBtnFromNameResource1"></asp:LinkButton>
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Left" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="表單逾時" meta:resourcekey="TemplateFieldResource3">
                        <EditItemTemplate>
                            <asp:TextBox runat="server" ID="TextBox8" meta:resourceKey="TextBox1Resource1"></asp:TextBox>
                        </EditItemTemplate>
                        <ItemStyle HorizontalAlign="Center" />
                        <ItemTemplate>
                            <asp:Label runat="server" Text='<%#: Bind("DELAY_HOUR") %>' ID="Label9" meta:resourceKey="lblDELAY_HOURResource1"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="表單停用" meta:resourcekey="TemplateFieldResource4">
                        <EditItemTemplate>
                            <asp:TextBox runat="server" ID="TextBox9" meta:resourceKey="TextBox2Resource1"></asp:TextBox>
                        </EditItemTemplate>
                        <ItemStyle HorizontalAlign="Center" />
                        <ItemTemplate>
                            <asp:Label runat="server" Text='<%#: Bind("FORM_CTL") %>' ID="Label10" meta:resourceKey="lblFORM_CTLResource1"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField Visible="False" meta:resourcekey="TemplateFieldResource5">
                        <EditItemTemplate>
                            <asp:TextBox runat="server" Text='<%#: Bind("VERSION_CNT") %>' ID="TextBox10" meta:resourceKey="TextBox3Resource1"></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label runat="server" Text='<%#: Bind("VERSION_CNT") %>' ID="Label11"
                                meta:resourceKey="dgItemlblVersionCntResource1"></asp:Label>
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Left" />
                    </asp:TemplateField>
                </Columns>
            </Fast:Grid>
        </ContentTemplate>
    </asp:UpdatePanel>

    <asp:Label ID="lbConfirmDelete" runat="server" Text="確定要刪除?" Visible="False" meta:resourcekey="lbConfirmDeleteResource1"></asp:Label>
    <asp:Label ID="lblNoBridle" runat="server" Text="不限制" Visible="False" meta:resourcekey="lblNoBridleResource1"></asp:Label>
    <asp:Label ID="lblPosted" runat="server" Text="已發佈" Visible="False" meta:resourcekey="lblPostedResource1"></asp:Label>
    <asp:Label ID="lblNoPost" runat="server" Text="未發佈" Visible="False" meta:resourcekey="lblNoPostResource1"></asp:Label>
    <asp:Label ID="lblNoAllowIssue" runat="server" Text="禁止發佈" Visible="False" meta:resourcekey="lblNoAllowIssueResource1"></asp:Label>
    <asp:Label ID="lblWaitPost" runat="server" Text="待發佈" Visible="False" meta:resourcekey="lblWaitPostResource1"></asp:Label>
    <asp:Label ID="lblIsApproval" runat="server" Text="審核中" Visible="False" meta:resourcekey="lblIsApprovalResource1"></asp:Label>

    <asp:Label ID="lblYes" runat="server" Text="是" Visible="False" meta:resourcekey="lblYesResource1"></asp:Label>
    <asp:Label ID="lblNo" runat="server" Text="否" Visible="False" meta:resourcekey="lblNoResource1"></asp:Label>
    <asp:Label ID="lblDay" runat="server" Text="日" Visible="False" meta:resourcekey="lblDayResource1"></asp:Label>
    <asp:Label ID="lblHour" runat="server" Text="時" Visible="False" meta:resourcekey="lblHourResource1"></asp:Label>
     
    <asp:Label ID="lblLeftTitle" runat="server" meta:resourcekey="Label1Resource1" Text="表單列表" Visible="False"></asp:Label>

</asp:Content>

