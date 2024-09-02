<%@ Page Language="C#" MasterPageFile="~/Master/TwoColumn.master" AutoEventWireup="true" Inherits="EIP_Bulletin_Default" Title="公告" Culture="auto" UICulture="auto" meta:resourcekey="PageResource1" Codebehind="Default.aspx.cs" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>
<%@ Register Assembly="System.Web, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a" Namespace="System.Web.UI" TagPrefix="cc2" %>
<%@ Register Assembly="System.Web, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a" Namespace="System.Web.UI.HtmlControls" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ScriptContentPlaceHolder" runat="Server">
    <script id="defaultjs" type="text/javascript">
        Sys.Application.add_load(function () {
            //目的:公告私人訊息中link 連結網頁後所欲開啟的dialog
            var BULLETINE_ID = $uof.tool.htmlDecode('<%=System.Web.Security.AntiXss.AntiXssEncoder.HtmlEncode(Request.QueryString["BULLETINEID"],true)%>');   
            
            if (BULLETINE_ID != "" && $('#<%=HiddenFieldPostBack.ClientID%>').val() == 'True') {           
               $('#<%=HiddenFieldPostBack.ClientID%>').val('False');              
                $uof.dialog.open2("~/EIP/Bulletin/ViewBulletin.aspx", "" ,"", 1024, 768, openDialogResult,{"BULLETINID":BULLETINE_ID});
            }
        });

        function RadToolBar1_ButtonClicking(sender, args) {            
            var Key = args.get_item().get_value();
            if (Key == "AdvanceSearch") {
                args.set_cancel(true);
                $uof.dialog.open2("~/EIP/Bulletin/AdvanceSearch.aspx", args.get_item(), "", 600, 570, openDialogResult);
            }
            else if (Key == "Create") {
                args.set_cancel(true);
                var tree = $find('<%=classTree.ClientID %>');                
                var node = tree.get_selectedNode();                
                var classID = node.get_value();                
                var className = node.get_text();                

                $uof.dialog.open2("~/Eip/Bulletin/CreateBulletin.aspx", args.get_item(), "", 1100, 800, openDialogResult, { "Classid": classID, "Classname": className });
            }
            else if (Key == "Authority") {
                args.set_cancel(true);
                $uof.dialog.open2("~/Eip/Bulletin/AuthoritySetting.aspx", args.get_item(), "", 800, 800, openDialogResult);
            }
            else if (Key == "Class") {
                var culture = ("<%=Ede.Uof.EIP.SystemInfo.Current.Culture %>");
                args.set_cancel(true);
                if (culture == "zh-TW" || culture == "zh-CN") {
                    $uof.dialog.open2("~/Eip/Bulletin/ClassSetting.aspx", args.get_item(), "", 700, 600, openDialogResult);
                }
                else {
                    $uof.dialog.open2("~/Eip/Bulletin/ClassSetting.aspx", args.get_item(), "", 1100, 600, openDialogResult);
                }
            }
            else if (Key == "Delete") {
                args.set_cancel(true);
                if (confirm('<%=msgDelconfirm.Text %>') == false)
                    args.set_cancel(true);
            }
        }

        function RadToolBar2_ButtonClicking(sender, args) {            
            var Key = args.get_item().get_value();
            if (Key == "Add") {
                args.set_cancel(true);
                var TYPE = "Add";
                var classType = $uof.tool.htmlDecode('<%=System.Web.Security.AntiXss.AntiXssEncoder.HtmlEncode(hfClassType.Value,true)%>');     
                var BULLETINE_ID = $uof.fastGrid.getChecked('<%= listGrid.ClientID %>');
                if (BULLETINE_ID == "") {
                    alert('<%=ErrorMsg.Text %>');
                    args.set_cancel(true);
                    return;
                }
                $uof.dialog.open2("~/EIP/Bulletin/ModifyPublishers.aspx", args.get_item(), "", 500, 300, openDialogResult, { "BULLETINID": BULLETINE_ID, "TYPE": TYPE, "CLASSTYPE": classType });

            } else if (Key == "Delete") {
                args.set_cancel(true);
                var TYPE = "Delete";
                var classType = $uof.tool.htmlDecode('<%=System.Web.Security.AntiXss.AntiXssEncoder.HtmlEncode(hfClassType.Value,true)%>');
                var BULLETINE_ID = $uof.fastGrid.getChecked('<%= listGrid.ClientID %>');
                if (BULLETINE_ID == "") {
                    alert('<%=ErrorMsg.Text %>');
                    args.set_cancel(true);
                    return;
                }
                $uof.dialog.open2("~/EIP/Bulletin/ModifyPublishers.aspx", args.get_item(), "", 500, 300, openDialogResult, { "BULLETINID": BULLETINE_ID, "TYPE": TYPE, "CLASSTYPE": classType });
            }
        }

        function openDialogResult(returnValue) {

            if (typeof(returnValue) == 'undefined')
                return false;
            else
                return true;
        }

        //2012/03/19 add by Taylor
        function ConfirmAddFavorites(bulletinGUID, userGuid) {
            if (window.confirm('<%=lblConfirmAdd.Text %>')) {
                var data = [bulletinGUID, userGuid];
                var result = $uof.pageMethod.sync("AddFavorites", data);
                if (result == "true") {
                    alert('<%= lblSuccessAdd.Text %>');
                }
            }
        }

        function OnValueChanging(sender, args) {
            if (args.get_newValue() == "") {
                args.set_newValue(args.get_oldValue());
            }
        }

        function resizeTree(X, Y) {

            var tree = $find("<%=classTree.ClientID %>");
            tree.get_element().style.overflow = "auto";
            tree.get_element().style.height = (Y - 30) + "px";
            tree.get_element().style.width = (X) + "px";

            $("#<%=leftX.ClientID%>").val(X);
            $("#<%=leftY.ClientID%>").val(Y);
        }       

        function OpenWin(sender, item) {

            var hidBulletinID = $("#<%=hidBulletinID.ClientID%>").val();
            var hidisAllResend = $("#<%=hidisAllResend.ClientID%>").val();
            var hidstickyStr = $("#<%=hidstickyStr.ClientID%>").val();
            var stickyStr = hidBulletinID + "|" + hidstickyStr;
        switch (item) {
            case 1:
                    var ajaxManager = $find("<%= Manager.ClientID %>");
                    ajaxManager.ajaxRequest(JSON.stringify({ "Key": "AddSticky", "Value": stickyStr }));
                break;
            case 2:
                if (window.confirm('<%=lblConfirmAdd.Text  %>')) {
                    var ajaxManager = $find("<%= Manager.ClientID %>");
                    ajaxManager.ajaxRequest(JSON.stringify({ "Key": "AddFavorites", "Value": hidBulletinID }));
                }
                break;
            case 3:
                $uof.dialog.open2("~/EIP/Bulletin/browsedUserList.aspx", '', '', 650, 650, function () { return false; }, { 'BULLETINID': hidBulletinID, 'EnableSendMsg': hidisAllResend });               
                break;
            case 4:
                $uof.dialog.open2("~/EIP/Bulletin/UpdateBulletin.aspx", sender, '', 1100, 800, function (returnValue) { if (returnValue != null || typeof (returnValue) != 'undefined') { return true; } return false; }, { 'BULLETINID': hidBulletinID });            
                break;
            }            
         }
    </script>
    <style type="text/css">
        .breakword {
            table-layout:fixed;
            word-break:break-all; 
            word-break:break-word; 
            word-wrap:break-word;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ToolbarContentPlaceHolder" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel4" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <telerik:RadToolBar ID="RadToolBar1" runat="server" OnClientButtonClicking="RadToolBar1_ButtonClicking"
                OnButtonClick="RadToolBar1_ButtonClick" Width="100%" meta:resourcekey="RadToolBar1Resource1">
                <Items>
                    <telerik:RadToolBarButton runat="server" DisabledImageUrl="~/Common/Images/Icon/icon_m42.png"
                        HoveredImageUrl="~/Common/Images/Icon/icon_m42.png" ImageUrl="~/Common/Images/Icon/icon_m42.png"
                        Value="Authority" CheckedImageUrl="~/Common/Images/Icon/icon_m42.png" Text="權限設定" ToolTip="權限設定"
                        meta:resourcekey="TBarButtonResource1">
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton runat="server" IsSeparator="True" Value="s1" meta:resourcekey="RadToolBarButtonResource1">
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton runat="server" DisabledImageUrl="~/Common/Images/Icon/icon_m43.png"
                        HoveredImageUrl="~/Common/Images/Icon/icon_m43.png" ImageUrl="~/Common/Images/Icon/icon_m43.png"
                        Value="Class" CheckedImageUrl="~/Common/Images/Icon/icon_m43.png" Text="類別維護" ToolTip="類別維護"
                        meta:resourcekey="TBarButtonResource2">
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton runat="server" IsSeparator="True" Value="s2" meta:resourcekey="RadToolBarButtonResource2">
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton runat="server" DisabledImageUrl="~/Common/Images/Icon/icon_m44.png"
                        HoveredImageUrl="~/Common/Images/Icon/icon_m44.png" ImageUrl="~/Common/Images/Icon/icon_m44.png"
                        Value="Create" CheckedImageUrl="~/Common/Images/Icon/icon_m44.png" Text="新增公告" ToolTip="新增公告"
                        meta:resourcekey="TBarButtonResource3">
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton runat="server" IsSeparator="True" Value="s3" meta:resourcekey="RadToolBarButtonResource3">
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton runat="server" DisabledImageUrl="~/Common/Images/Icon/icon_m45.png"
                        HoveredImageUrl="~/Common/Images/Icon/icon_m45.png" ImageUrl="~/Common/Images/Icon/icon_m45.png"
                        Value="Subscribe" CheckedImageUrl="~/Common/Images/Icon/icon_m45.png" Text="訂閱" ToolTip="訂閱"
                        meta:resourcekey="TBarButtonResource4">
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton runat="server" IsSeparator="True" Value="s4" meta:resourcekey="RadToolBarButtonResource4">
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton runat="server" DisabledImageUrl="~/Common/Images/Icon/icon_m46.png"
                        HoveredImageUrl="~/Common/Images/Icon/icon_m46.png" ImageUrl="~/Common/Images/Icon/icon_m46.png"
                        Value="CancelSubscribe" CheckedImageUrl="~/Common/Images/Icon/icon_m46.png" Text="取消訂閱" ToolTip="取消訂閱"
                        meta:resourcekey="TBarButtonResource5">
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton runat="server" IsSeparator="True" Value="s5" meta:resourcekey="RadToolBarButtonResource5">
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton runat="server" DisabledImageUrl="~/Common/Images/Icon/icon_m39.png"
                        HoveredImageUrl="~/Common/Images/Icon/icon_m39.png" ImageUrl="~/Common/Images/Icon/icon_m39.png"
                        Value="AdvanceSearch" CheckedImageUrl="~/Common/Images/Icon/icon_m39.png" Text="搜尋" ToolTip="搜尋"
                        meta:resourcekey="TBarButtonResource6">
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton runat="server" IsSeparator="True" Value="s6" meta:resourcekey="RadToolBarButtonResource6">
                    </telerik:RadToolBarButton>
                </Items>
            </telerik:RadToolBar>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="LeftContentPlaceHolder" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional" RenderMode="Inline" ChildrenAsTriggers="false">
        <ContentTemplate>
            <telerik:RadTreeView ID="classTree" runat="server" OnNodeClick="classTree_NodeClick" onclick="Window_OnClick()" Height="100%" meta:resourcekey="classTreeResource2">
                <Nodes>
                    <telerik:RadTreeNode runat="server" Value="month" 
                        ImageUrl="~/Common/Images/Icon/icon_m47.png" SelectedImageUrl="~/Common/Images/Icon/icon_m47.png" meta:resourcekey="RadTreeNodeResource1">
                    </telerik:RadTreeNode>
                    <telerik:RadTreeNode runat="server" Value="unread"
                        ImageUrl="~/Common/Images/Icon/icon_m47.png" SelectedImageUrl="~/Common/Images/Icon/icon_m47.png" meta:resourcekey="RadTreeNodeResource2">
                    </telerik:RadTreeNode>
                    <telerik:RadTreeNode runat="server" Value="innerclass" Enabled="False" ForeColor="Black"
                        ImageUrl="~/Common/Images/Icon/icon_m47.png" SelectedImageUrl="~/Common/Images/Icon/icon_m47.png" meta:resourcekey="RadTreeNodeResource3">
                    </telerik:RadTreeNode>
                    <telerik:RadTreeNode runat="server" Value="outerclass" Enabled="False" ForeColor="Black"
                        ImageUrl="~/Common/Images/Icon/icon_m47.png" SelectedImageUrl="~/Common/Images/Icon/icon_m47.png" meta:resourcekey="RadTreeNodeResource4">
                    </telerik:RadTreeNode>
                </Nodes>
            </telerik:RadTreeView>

            <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="GetBulletinList"
                TypeName="Ede.Uof.EIP.Bulletin.ReadUCO">
                <SelectParameters>
                    <asp:ControlParameter Name="classGUID" ControlID="classTree" DefaultValue="" PropertyName="SelectedNode.Value"
                        Type="String" />
                </SelectParameters>
            </asp:ObjectDataSource>

            <asp:HiddenField ID="leftX" runat="server" />
    <asp:HiddenField ID="leftY" runat="server" />
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="RightContentPlaceHolder" runat="Server">
     <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server" meta:resourcekey="RadAjaxManager1Resource1">
        <AjaxSettings>
            <telerik:AjaxSetting AjaxControlID="RadAjaxManager1">
                <UpdatedControls>
                </UpdatedControls>
            </telerik:AjaxSetting>           
        </AjaxSettings>
    </telerik:RadAjaxManager> 
    <table border="0" cellpadding="0" cellspacing="0" width="100%" onclick="Window_OnClick()">
        <tr>
            <td valign="top">
                <table width="100%" cellpadding="0" cellspacing="0" border="0">
                    <tr>
                        <td>
                            <asp:UpdatePanel ID="UpdatePanel5" runat="server" UpdateMode="Conditional">
                                <ContentTemplate>
                                    <telerik:RadToolBar ID="RadToolBar2" runat="server" Width="100%" OnButtonClick="RadToolBar2_ButtonClick"
                                        OnClientButtonClicking="RadToolBar2_ButtonClicking" meta:resourcekey="RadToolBar2Resource1">
                                        <Items>
                                            <telerik:RadToolBarButton runat="server" Value="QueryDate" meta:resourcekey="RadToolBarButtonResource7">
                                                <ItemTemplate>
                                                    <table width="100%">
                                                        <tr>
                                                            <td>
                                                                <asp:Label ID="lblQueryDate" runat="server" Text="查詢日期" meta:resourceKey="lblQueryDateResource1" ToolTip="查詢日期"></asp:Label>
                                                            </td>
                                                            <td>
                                                                <telerik:RadDatePicker runat="server" ID="WebDateStart" meta:resourcekey="WebDateStartResource1">
                                                                    <DateInput ID="DateInput1" runat="server" ClientEvents-OnValueChanging="OnValueChanging"></DateInput>
                                                                </telerik:RadDatePicker>
                                                            </td>
                                                            <td>~
                                                            </td>
                                                            <td>
                                                                <telerik:RadDatePicker runat="server" ID="WebDateEnd" meta:resourcekey="WebDateEndResource1">
                                                                    <DateInput ID="DateInput2" runat="server" ClientEvents-OnValueChanging="OnValueChanging"></DateInput>
                                                                </telerik:RadDatePicker>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </ItemTemplate>
                                            </telerik:RadToolBarButton>
                                            <telerik:RadToolBarButton runat="server" IsSeparator="True" Value="s1" meta:resourcekey="RadToolBarButtonResource8">
                                            </telerik:RadToolBarButton>
                                            <telerik:RadToolBarButton runat="server" DisabledImageUrl="~/Common/Images/Icon/icon_m39.png"
                                                HoveredImageUrl="~/Common/Images/Icon/icon_m39.png" ImageUrl="~/Common/Images/Icon/icon_m39.png"
                                                CheckedImageUrl="~/Common/Images/Icon/icon_m39.png"  Text="查詢" meta:resourceKey="TBarButtonResource7"
                                                Value="Query" ToolTip="查詢">
                                            </telerik:RadToolBarButton>
                                            <telerik:RadToolBarButton runat="server" IsSeparator="True" Value="s2" meta:resourcekey="RadToolBarButtonResource9">
                                            </telerik:RadToolBarButton>
                                            <telerik:RadToolBarButton runat="server" DisabledImageUrl="~/Common/Images/Icon/icon_m105.png"
                                                HoveredImageUrl="~/Common/Images/Icon/icon_m105.png" ImageUrl="~/Common/Images/Icon/icon_m105.png"
                                                CheckedImageUrl="~/Common/Images/Icon/icon_m105.png" Text="加入發佈對象" Value="Add" ToolTip="加入發佈對象"
                                                meta:resourceKey="btnAddResource1">
                                            </telerik:RadToolBarButton>
                                            <telerik:RadToolBarButton runat="server" IsSeparator="True" Value="s3" meta:resourcekey="RadToolBarButtonResource10">
                                            </telerik:RadToolBarButton>
                                            <telerik:RadToolBarButton runat="server" DisabledImageUrl="~/Common/Images/Icon/icon_m107.png"
                                                HoveredImageUrl="~/Common/Images/Icon/icon_m107.png" ImageUrl="~/Common/Images/Icon/icon_m107.png"
                                                CheckedImageUrl="~/Common/Images/Icon/icon_m107.png" Text="移除發佈對象" Value="Delete" ToolTip="移除發佈對象"
                                                meta:resourceKey="btnDeleteResource1">
                                            </telerik:RadToolBarButton>
                                            <telerik:RadToolBarButton runat="server" IsSeparator="True" Value="s4" meta:resourcekey="RadToolBarButtonResource11">
                                            </telerik:RadToolBarButton>
                                        </Items>
                                    </telerik:RadToolBar>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
                                <ContentTemplate>
                                    <Fast:Grid ID="listGrid" runat="server" AutoGenerateCheckBoxColumn="True" AllowSorting="True"
                                        OnRowDataBound="listGrid_RowDataBound" Width="100%" DataKeyNames="BULLETIN_GUID"
                                        AutoGenerateColumns="False" AllowPaging="True" OnPageIndexChanging="listGrid_PageIndexChanging"
                                        DataKeyOnClientWithCheckBox="True" EnhancePager="True" OnSorting="listGrid_Sorting"
                                        PageSize="15" DefaultSortDirection="Descending" DefaultSortColumnName="CREATE_DATE"  EmptyDataText="沒有資料"
                                        KeepSelectedRows="False" meta:resourcekey="listGridResource2">
                                        <EnhancePagerSettings ShowHeaderPager="True" />
                                        <ExportExcelSettings AllowExportToExcel="False" />
                                        <Columns>
                                            <asp:TemplateField HeaderText="new" meta:resourcekey="TemplateFieldResource4" SortExpression="READED">
                                                <ItemStyle Width="20px" HorizontalAlign="Center" />
                                                <ItemTemplate>
                                                    <asp:Image ID="ImageStatus" runat="server" ImageUrl="~/Common/Images/BulletinNew.gif"
                                                        meta:resourcekey="ImageStatusResource1" />
                                                    <asp:Image ID="ImageSticky" runat="server" ImageUrl="~/Common/Images/Icon/icon_m225.png"
                                                       />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="主旨" meta:resourcekey="TemplateFieldResource1" SortExpression="TOPIC" >
                                                <ItemTemplate>
                                                    <asp:LinkButton runat="server" ID="LinkButton1" Text='<%#: Bind("TOPIC") %>' meta:resourcekey="LinkButton1Resource2"
                                                        OnClick="LinkButton1_Click"></asp:LinkButton>
                                                </ItemTemplate>
                                                <HeaderStyle Wrap="false"/>
                                                <ItemStyle Width="40%" CssClass="breakword"/>
                                            </asp:TemplateField>
                                            <asp:BoundField DataField="ANNOUNCER" HeaderText="ANNOUNCER" Visible="False" meta:resourcekey="BoundFieldResource1" />
                                            <asp:TemplateField HeaderText="發佈者" SortExpression="CURRENT_ANNOUNCER_DEP" meta:resourcekey="TemplateFieldResource2">
                                                <ItemTemplate>
                                                    <asp:Label runat="server" Text="Label" ID="lblAnnouncer" meta:resourceKey="lblAnnouncerResource1"></asp:Label>
                                                </ItemTemplate>
                                                <HeaderStyle Wrap="false"/>
                                                <ItemStyle Width="40%" CssClass="breakword"/>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="張貼部門" meta:resourcekey="TemplateFieldAnnouncerDepResource1" SortExpression="ANNOUNCER_DEP" ItemStyle-Wrap="false" HeaderStyle-Wrap="false">
                                                <ItemTemplate>
                                                    <asp:Label runat="server" ID="lblAnnouncerDep" Text='<%#: Bind("ANNOUNCER_DEP") %>'></asp:Label>
                                                </ItemTemplate>
                                                <HeaderStyle Wrap="False" />
                                                <ItemStyle Width="150px"/>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="發佈時間" meta:resourcekey="BoundFieldResource2" SortExpression="CREATE_DATE">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblPublishDate" runat="server" Text=""></asp:Label>
                                                </ItemTemplate>
                                                <HeaderStyle Wrap="False" />
                                                <ItemStyle Width="120px" Wrap="False" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="發佈狀態" meta:resourcekey="TemplateFieldResource5" ItemStyle-Wrap="false" HeaderStyle-Wrap="false">
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="TextBox1" runat="server" meta:resourcekey="TextBox1Resource1"></asp:TextBox>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="lblStatus" runat="server" meta:resourcekey="lblStatusResource1"></asp:Label>
                                                </ItemTemplate>
                                                <HeaderStyle Width="80px" />
                                                <ItemStyle Width="80px" />
                                            </asp:TemplateField>
                                             <asp:TemplateField HeaderText="瀏覽" ShowHeader="False" SortExpression="READ_NUM" meta:resourcekey="TemplateViewerResource"
                                                ItemStyle-Wrap="false" HeaderStyle-Wrap="false" ItemStyle-HorizontalAlign="Center">
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="lbtnViewNum" Text="" runat="server"></asp:LinkButton>
                                                </ItemTemplate>
                                                <ItemStyle Width="100px" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="推薦" ShowHeader="False" SortExpression="RECOMMEND_NUM" meta:resourcekey="TemplateRecommendResource"
                                                ItemStyle-Wrap="false" HeaderStyle-Wrap="false" ItemStyle-HorizontalAlign="Center">
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="lbtnRecommendNum" Text="" runat="server"></asp:LinkButton>
                                                </ItemTemplate>
                                                <ItemStyle Width="100px" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="操作" ShowHeader="False" meta:resourcekey="TemplateFieldResource3"
                                                ItemStyle-Wrap="false">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblAdvanced" Text="操作" runat="server" meta:resourcekey="lbtnAdvancedResource1" Visible="false"></asp:Label>                                                                    
                                                    <asp:LinkButton ID="lbtnAdvanced" Text="操作" runat="server" meta:resourcekey="lbtnAdvancedResource1"></asp:LinkButton>
                                                    <asp:LinkButton ID="lbtnRecognize" Text="附件辨識" runat="server"></asp:LinkButton>&nbsp
                                                </ItemTemplate>
                                                <ItemStyle Width="100px" />
                                            </asp:TemplateField>
                                        </Columns>
                                    </Fast:Grid>

                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <div class="contextMenu" id="contextRoleView" style="display: none; left: 870px; top: 69px;">
        <table cellspacing="0" cellpadding="0" border="0" onclick="Window_OnClick()">
            <tbody>
                <tr>
                    <td align="center" style="background-color: darkolivegreen" valign="top">
                        <nobr><SPAN style="COLOR: #ffffff"><asp:Label id="lblFuncTable" runat="server" Text="功能表" meta:resourcekey="lblFuncTableResource1" ></asp:Label></SPAN></nobr>
                    </td>
                </tr>
                <tr id="ViewRecordTR" style="display: none;">
                    <td class="menuItem" valign="top" style="background-color: #ececec">
                        <table cellpadding="0" cellspacing="0" border="0" width="100%">
                            <tr>
                                <td width="3" runat="server" style="background-color: #898951">&nbsp;</td>
                                <td nowrap>&nbsp;
                                <asp:Label ID="lblViewRecord" runat="server" Text="瀏覽紀錄" ForeColor="Gray" meta:resourcekey="lblViewRecordResource1"></asp:Label>
                                    <asp:HyperLink ID="hyViewRecord" runat="server" NavigateUrl="#" Text="瀏覽紀錄" onclick="OpenWin(this, 3);return;" meta:resourcekey="hyViewRecordResource1"></asp:HyperLink></td>
                            </tr>
                        </table>
                    </td>
                </tr>       
                 <tr id="AddFavoritesTR" style="display: none;">
                    <td class="menuItem" valign="top" style="background-color: #ececec">
                        <table cellpadding="0" cellspacing="0" border="0" width="100%">
                            <tr>
                                <td width="3" runat="server" style="background-color: #CC3333">&nbsp;</td>
                                <td nowrap>&nbsp;
                                <asp:Label ID="lblAddFavorites" runat="server" Text="加入收藏" ForeColor="Green" meta:resourcekey="lblAddFavoritesResource1"></asp:Label>
                                    <asp:HyperLink ID="hyAddFavorites" runat="server" NavigateUrl="#" Text="加入收藏" onclick="OpenWin(this, 2);return;" meta:resourcekey="hyAddFavoritesResource1"></asp:HyperLink></td>
                            </tr>
                        </table>
                    </td>
                </tr>       
                 <tr id="EditBullTR" style="display: none;">
                    <td class="menuItem" valign="top" style="background-color: #ececec">
                        <table cellpadding="0" cellspacing="0" border="0" width="100%">
                            <tr>
                                <td width="3" runat="server" style="background-color: #336699">&nbsp;</td>
                                <td nowrap>&nbsp;
                                  <asp:Label ID="lblEditBull" runat="server" Text="維護" ForeColor="Gray" meta:resourcekey="lblEditBullResource1"></asp:Label>
                                  <asp:LinkButton ID="lbtnEditBull" OnClientClick="OpenWin(this, 4);return false;" Text="維護" runat="server" OnClick="EditBull_Bind" meta:resourcekey="lbtnEditBullResource1"></asp:LinkButton>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>       
                 <tr id="StickyTR" style="display: none;">
                    <td class="menuItem" valign="top" style="background-color: #ececec">
                        <table cellpadding="0" cellspacing="0" border="0" width="100%">
                            <tr>
                                <td width="3" runat="server" style="background-color: #22AA99">&nbsp;</td>
                                <td nowrap>&nbsp;
                                <asp:Label ID="lblStickytr" runat="server" Text="置頂" ForeColor="Gray" meta:resourcekey="lblStickytrResource1"></asp:Label>
                                    <asp:HyperLink ID="hyStickytr" runat="server" NavigateUrl="#" Text="置頂" onclick="OpenWin(this, 1);return;"  meta:resourcekey="hyStickytrResource1"></asp:HyperLink></td>
                            </tr>
                        </table>
                    </td>
                </tr>       
        </table>
    </div>
    <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" SelectMethod="SearchBulletin"
        TypeName="Ede.Uof.EIP.Bulletin.ReadUCO">
        <SelectParameters>
            <asp:ControlParameter ControlID="hideclass" Name="classGUID" PropertyName="Value"
                Type="String" />
            <asp:ControlParameter ControlID="hidekeyword" Name="topic" PropertyName="Value" Type="String" />
            <asp:ControlParameter ControlID="hideannouncer" Name="announcer" PropertyName="Value"
                Type="String" />
            <asp:ControlParameter ControlID="startChooser" Name="startDate" PropertyName="SelectedDate"
                Type="DateTime" DefaultValue="" />
            <asp:ControlParameter ControlID="endChooser" Name="endDate" PropertyName="SelectedDate"
                Type="DateTime" />
        </SelectParameters>
    </asp:ObjectDataSource>
    <asp:UpdatePanel ID="UpdatePanel3" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <input id="hideclass" runat="server" type="hidden"></input>
            <input id="hidekeyword" runat="server" type="hidden"></input>
            <input id="hideannouncer" runat="server" type="hidden"></input>
            <input id="hideName" runat="server" type="hidden"></input>
            <telerik:RadDatePicker ID="startChooser" runat="server" Visible="False" meta:resourcekey="startChooserResource2"></telerik:RadDatePicker>
            <telerik:RadDatePicker ID="endChooser" runat="server" Visible="False" meta:resourcekey="endChooserResource2"></telerik:RadDatePicker>
            <input id="hideDatasource" runat="server" type="hidden"></input>
            <input id="hidePermission" runat="server" type="hidden"></input>
            <br />
            <input id="hideViewUser" runat="server" type="hidden"></input>
            <input id="hfClassType" runat="server" type="hidden"></input>
        </ContentTemplate>
    </asp:UpdatePanel>
    <asp:Label ID="msgDelconfirm" runat="server" Text="確定要刪除?" Visible="False" meta:resourcekey="msgDelconfirmResource1"></asp:Label>
    <asp:Label ID="msgUnread" runat="server" Text="未讀公告" Visible="False" meta:resourcekey="msgUnreadResource1"></asp:Label>
    <asp:Label ID="msgInnerclass" runat="server" Text="內部公告" Visible="False" meta:resourcekey="msgInnerclassResource1"></asp:Label>
    <asp:Label ID="msgOuterclass" runat="server" Text="外部公告" Visible="False" meta:resourcekey="msgOuterclassResource1"></asp:Label>
    <asp:Label ID="msgMonth" runat="server" Text="最新公告" Visible="False" meta:resourcekey="msgMonthResource1"></asp:Label>
    <asp:Label ID="msgUnReaded" runat="server" Text="new" Visible="False" meta:resourcekey="msgUnReadedResource1"></asp:Label>
    <asp:Label ID="ErrorMsg" runat="server" Text="未選擇公告" Visible="False" meta:resourcekey="ErrorMsgResource1"></asp:Label>
    <asp:Label ID="lblSuccessAdd" runat="server" Text="已成功加入我的收藏。" Visible="False" meta:resourcekey="lblSuccessAddResource1"></asp:Label>
    <asp:Label ID="lblConfirmAdd" runat="server" Text="確定要加入收藏嗎?" Visible="False" meta:resourcekey="lblConfirmAddResource1"></asp:Label>
    <asp:Label ID="lblMsgPublish" runat="server" Text="已發佈" Visible="False" meta:resourcekey="lblMsgPublishResource1"></asp:Label>
    <asp:Label ID="lblMsgProcess" runat="server" Text="審核中" Visible="False" meta:resourcekey="lblMsgProcessResource1"></asp:Label>
    <asp:Label ID="lblMsgDeny" runat="server" Text="發佈拒絕" Visible="False" meta:resourcekey="lblMsgDenyResource1"></asp:Label>
    <asp:Label ID="Label1" runat="server" Text="公告類別列表" meta:resourcekey="Label1Resource1" Visible="False"></asp:Label>
    <asp:Label ID="lblMsgPublishing" runat="server" Text="未發佈" Visible="False" meta:resourcekey="lblMsgPublishingResource1"></asp:Label>
    <asp:Label ID="lblRecognizeTitle" runat="server" Text="附件辨識" Visible="False"></asp:Label>
    <asp:Label ID="lblSticky" runat="server" Text="置頂" Visible="False" meta:resourcekey="lblStickyResource1"></asp:Label>
    <asp:Label ID="lblNotSticky" runat="server" Text="取消置頂" Visible="False" meta:resourcekey="lblNotStickyResource1"></asp:Label>
    <asp:HiddenField ID="HiddenFieldPostBack" runat="server" Value="True" />
    <asp:HiddenField ID="hfCurrentUser" runat="server" />
    <asp:HiddenField ID="hidBulletinID" runat="server" />
    <asp:HiddenField ID="hidisAllResend" runat="server" /> 
    <asp:HiddenField ID="hidstickyStr" runat="server" /> 
</asp:Content>

