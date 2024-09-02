<%@ Page Language="C#" MasterPageFile="~/Master/TwoColumn.master" AutoEventWireup="true" Inherits="DMS_Admin_ClassModify" Title="類別維護" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" Codebehind="ClassModify.aspx.cs" %>
<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ScriptContentPlaceHolder" runat="Server">
        <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server" OnAjaxRequest="RadAjaxManager1_AjaxRequest">
    </telerik:RadAjaxManager>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ToolbarContentPlaceHolder" runat="Server">
    <script id="script1" type="text/javascript">

        var currentSelNode;
        var nodeCurrentSelect;
        var DMSClassTreeID;
        var DMSAuthorTreeID;
        var DMSGetAuthor;
        var DMSGetClass;
        var nodeCurrentClassSelect;

        function RadFolderToolbar2_Click(sender, args) {

            var toolBar = sender;
            var button = args.get_item();
            // 修改類別
            if (button.get_value() == "ChangeClass") {
                $("#<%=hidEvent.ClientID%>").val("ModifyDoc");
                var checkedData = $uof.fastGrid.getChecked('<%=Grid1.ClientID%>');
                args.set_cancel(true);
                $uof.dialog.open2("~/DMS/Admin/ChangeClass.aspx", args.get_item(), "", 500, 460, OpenDialogResult, { "key": checkedData, "classid": currentSelNode });
            }
        }

        function ClassTreeClientOnLoad(sender, eventArgs) {

            var tree = sender;
            if ($("#<%=hidEvent.ClientID%>").val() == "ModifyDoc") {
                if ($("#<%=hidSelectNodeID.ClientID%>").val() != "") {
                    var node = tree.findNodeByValue($("#<%=hidSelectNodeID.ClientID%>").val());
                    if (node && !node.get_selected()) {
                        node.set_selected(true);
                    }
                }
            }


            //Add code to handle your event here.
            var selNode = tree.get_selectedNode();

            if (selNode != null) {
                selNode.set_selected(true);
                nodeCurrentSelect = selNode;
                currentSelNode = nodeCurrentSelect.get_value();
                $("#<%=hidSelectNodeID.ClientID%>").val(currentSelNode);
            }

        }

        function ClassTreeClientNodeClicked(sender, eventArgs) {            
            //Add code to handle your event here.
            var node = eventArgs.get_node();
            if (node == null)
                return;

            var oldclassid = $("#<%=hidSelectNodeID.ClientID%>").val();

            nodeCurrentSelect = node;
            currentSelNode = nodeCurrentSelect.get_value();

            $("#<%=hidSelectNodeID.ClientID%>").val(currentSelNode);
            if (oldclassid != currentSelNode) {
                var ajaxManager = $find("<%= RadAjaxManager1.ClientID %>");
                ajaxManager.ajaxRequest(JSON.stringify({ "Key": "ClassClick", "Value": currentSelNode }));
            }
        }



        function RadFolderToolbar1_Click(sender, args) {

            var toolBar = sender;
            var button = args.get_item();
            if (button.get_value() == "ClassManage") {
                $("#<%=hidEvent.ClientID%>").val("ModifyClass");
                args.set_cancel(true);
                $uof.dialog.open2("~/DMS/Admin/ClassMaintain.aspx", args.get_item(), "", 500, 500, OpenDialogResult, { "classid": currentSelNode });

            }
        }

        function OpenDialogResult(returnValue) {
            if (typeof (returnValue) == 'undefined' || returnValue == null)
                return false;
            else
                return true;
        }
    </script>
    <telerik:RadToolBar ID="RadFolderToolbar1" runat="server" Width="100%" OnButtonClick="RadFolderToolbar1_ButtonClicked" OnClientButtonClicking="RadFolderToolbar1_Click" meta:resourcekey="barMainResource1" Height="31px">
        <Items>
            <telerik:RadToolBarButton runat="server" CheckedImageUrl="~/Common/Images/Icon/icon_m124.gif" DisabledImageUrl="~/Common/Images/Icon/icon_m124.gif" HoveredImageUrl="~/Common/Images/Icon/icon_m124.gif" ImageUrl="~/Common/Images/Icon/icon_m124.gif" Text="類別維護" Value="ClassManage" meta:resourcekey="TBarButtonResource1">
            </telerik:RadToolBarButton>
            <telerik:RadToolBarButton runat="server" IsSeparator="True" Value="s1" meta:resourcekey="RadToolBarButtonResource2" />

        </Items>
    </telerik:RadToolBar>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="LeftContentPlaceHolder" runat="Server">
    <div runat="server" id="treeBG" style="background-repeat: repeat; width: 100%; height: 100%">
        <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
            <ContentTemplate>
                <telerik:RadTreeView runat="server" ID="treeClass" EnableNodeTextHtmlEncoding="true"
                    OnNodeCreated="ClassTreeClientOnNodeCreated"
                    OnClientNodeClicked="ClassTreeClientNodeClicked" OnClientLoad="ClassTreeClientOnLoad">
                </telerik:RadTreeView>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="RightContentPlaceHolder" runat="Server">
    <asp:Panel ID="Panel1" runat="server">
        <telerik:RadToolBar ID="RadFolderToolbar2" runat="server" Width="100%" OnButtonClick="RadFolderToolbar2_ButtonClicked" OnClientButtonClicking="RadFolderToolbar2_Click" meta:resourcekey="barMainResource1">
            <Items>
                <telerik:RadToolBarButton runat="server" Enabled="true" CheckedImageUrl="~/Common/Images/Icon/icon_m43.gif" DisabledImageUrl="~/Common/Images/Icon/icon_m43.gif" HoveredImageUrl="~/Common/Images/Icon/icon_m43.gif" ImageUrl="~/Common/Images/Icon/icon_m43.gif" Text="變更文件所屬類別" Value="ChangeClass" meta:resourcekey="TBarButtonResource2">
                </telerik:RadToolBarButton>
                <telerik:RadToolBarButton runat="server" IsSeparator="True" Value="s1" meta:resourcekey="RadToolBarButtonResource2" />

            </Items>
        </telerik:RadToolBar>
        <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
            <ContentTemplate>
                <div style="width: 100%; float: left; display: block;">
                    <table style="width: 100%;">
                        <tr>
                            <td style="height: 50px; width: 50px;">&nbsp;&nbsp;&nbsp;&nbsp;<asp:Image ID="imgFolder" runat="server" />

                            </td>
                            <td style="height: 50px; vertical-align: bottom;">
                                <span style="width: 350px; word-break: break-all">
                                    <asp:Label ID="labFolderName" runat="server" Font-Bold="True" Font-Italic="True"
                                        CssClass="SizeL"></asp:Label>
                                </span>
                            </td>
                        </tr>
                    </table>
                </div>
                <div style="width: 2%; float: left; display: block">
                    &nbsp;
                </div>
                <div style="width: 97%; float: left; display: block">
                    <Fast:Grid ID="Grid1" runat="server" AutoGenerateCheckBoxColumn="True" Width="100%"
                        AllowSorting="True" AutoGenerateColumns="False"
                        DataKeyNames="DOC_ID" AllowPaging="True" DataKeyOnClientWithCheckBox="True" OnPageIndexChanging="Grid1_PageIndexChanging" OnRowDataBound="Grid1_RowDataBound" EnhancePager="True" OnSorting="Grid1_Sorting" PageSize="15"  DefaultSortDirection="Ascending" EmptyDataText="No data found" KeepSelectedRows="False"  >
                        <ExportExcelSettings AllowExportToExcel="False" />
                        <Columns>
                            <asp:TemplateField HeaderText="文件編號" meta:resourcekey="TemplateFieldResource4" SortExpression="DOC_SERIAL">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("DOC_SERIAL") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <span style="width: 80px;">
                                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("DOC_SERIAL") %>'></asp:Label>
                                    </span>
                                </ItemTemplate>
                                <HeaderStyle Width="100px" Wrap="false" />
                                <ItemStyle Width="100px" Wrap="false" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="文件名稱" meta:resourcekey="TemplateFieldResource1" SortExpression="DOC_NAME">
                                <ItemTemplate>
                                    <span style="word-break: break-all; width: 230px;">
                                        <asp:Image ID="docIcon" runat="server" ImageUrl="~/DMS/images/icon/unknown.gif" />
                                        &nbsp;
                            <asp:Label ID="lblDocName" runat="server" Text='<%# Bind("DOC_NAME") %>'></asp:Label>
                                    </span>
                                </ItemTemplate>
                                <HeaderStyle  Wrap="false"/>
                                <ItemStyle  Wrap="false"/>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="作者" meta:resourcekey="TemplateFieldResource2" SortExpression="DOC_AUTHOR">
                                <ItemTemplate>
                                    <asp:Label ID="lblAuthor" runat="server"></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle Width="200px" Wrap="False" />
                                <ItemStyle Width="200px" Wrap="False" />
                            </asp:TemplateField>
                            <asp:BoundField DataField="MANUAL_VERSION" HeaderText="版本" meta:resourcekey="BoundFieldResource2" SortExpression="MANUAL_VERSION">
                                    <HeaderStyle Width="100px" Wrap="false" />
                                    <ItemStyle Width="100px" HorizontalAlign="Center" Wrap="false" />
                            </asp:BoundField>
                            <asp:TemplateField HeaderText="狀態" meta:resourcekey="TemplateFieldResource3" SortExpression="DOC_STATUS">
                                <ItemTemplate>
                                    <asp:Label ID="lblStatus" runat="server"></asp:Label>
                                </ItemTemplate>
                                    <HeaderStyle Width="100px" Wrap="false" />
                                    <ItemStyle HorizontalAlign="Center" Wrap="false" />
                            </asp:TemplateField>
                        </Columns>
                        <EnhancePagerSettings
                            ShowHeaderPager="True" />
                    </Fast:Grid>

                </div>
                <asp:HiddenField ID="hideClass" runat="server" />
                <asp:HiddenField ID="hideTag" runat="server" />
                <asp:HiddenField ID="hidSelectNodeID" runat="server" />
                <asp:HiddenField ID="hidEvent" runat="server" />
            </ContentTemplate>
        </asp:UpdatePanel>

        <asp:Label ID="lblConfirmDelete" runat="server" Text="確定要將此類別刪除?" Visible="False" meta:resourcekey="lblConfirmDeleteResource1"></asp:Label>
        <asp:Label ID="lblDeleteError" runat="server" Text="發生錯誤,無法刪除!" Visible="False" meta:resourcekey="lblDeleteErrorResource1"></asp:Label>
        <asp:Label ID="lblNameExist" runat="server" Text="類別名稱已存在" Visible="False" meta:resourcekey="lblNameExistResource1"></asp:Label>
        <asp:Label ID="lblModifyError" runat="server" Text="修改名稱失敗" Visible="False" meta:resourcekey="lblModifyErrorResource1"></asp:Label>
        <asp:Label ID="lblCheckin" runat="server" Text="已存回" Visible="False" meta:resourcekey="lblCheckinResource1"></asp:Label>
        <asp:Label
            ID="lblCheckOut" runat="server" Text="已取出" Visible="False" meta:resourcekey="lblCheckOutResource1"></asp:Label>
        <asp:Label
            ID="lblApproval" runat="server" Text="審核中" Visible="False" meta:resourcekey="lblApprovalResource1"></asp:Label>
        <asp:Label
            ID="lblPublish" runat="server" Text="已公佈" Visible="False" meta:resourcekey="lblPublishResource1"></asp:Label>
        <asp:Label
            ID="lblInactive" runat="server" Text="已失效" Visible="False" meta:resourcekey="lblInactiveResource1"></asp:Label>
        <asp:Label
            ID="lblVoid" runat="server" Text="已作廢" Visible="False" meta:resourcekey="lblVoidResource1"></asp:Label>
        <asp:Label ID="lblTempInact"
            runat="server" Text="已下架" Visible="False" meta:resourcekey="lblTempInactResource1"></asp:Label>
        <asp:Label ID="lblOldVer" runat="server"
            Text="舊版本" Visible="False" meta:resourcekey="lblOldVerResource1"></asp:Label>
        <asp:Label ID="lblReAct" runat="server" Text="已上架"
            Visible="False" meta:resourcekey="lblReActResource1"></asp:Label>
        <asp:Label ID="labDocDeny" runat="server" Text="發佈拒絕"
            Visible="False" meta:resourcekey="labDocDenyResource1"></asp:Label>
        <asp:Label ID="lblClass" runat="server" Text="文件類別" Visible="False" meta:resourcekey="lblClassResource1"></asp:Label>

    </asp:Panel>
</asp:Content>
