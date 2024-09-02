<%@ Page Title="" Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" CodeBehind="DMSPropertyCustomizeOptionEdit.aspx.cs" Inherits="Ede.Uof.Web.DMS.DocStore.DMSPropertyCustomizeOptionEdit" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script>
        Sys.Application.add_load(function () {
            if ($('#<%=hfPostBack.ClientID%>').val() != 'True') return;
            $('#<%=hfPostBack.ClientID%>').val('False');

            var curwindow = $uof.dialog.getOpener();
            var pd;
            if (curwindow) {
                pd = curwindow.document;
            } else if (typeof (dialogArguments) != "undefined") {
                pd = dialogArguments.document;
            }
            var hfListItemsId = $uof.tool.htmlDecode('<%=System.Web.Security.AntiXss.AntiXssEncoder.HtmlEncode(Request.QueryString["hfListItemsId"],true)%>');
            var listItemsVal = $("#" + hfListItemsId, pd).val();
            if (pd) {
                $("#<%=hfListItems.ClientID%>").val(listItemsVal);
                $("#<%=btnBindOptions.ClientID%>").click();
            }
        });

        function TreeOptons_OnClientNodeDropping(sender, eventArgs) {
            var tree = $find('<%=RadTreeViewOptions.ClientID %>');
            var sourceNode = eventArgs.get_sourceNode();
            var targetNode = eventArgs.get_destNode();
            if (!sourceNode || !targetNode) {
                eventArgs.set_cancel(true);
            }
        }

        function TreeOptions_Load(sender, eventArgs) {
            var tree = $find("<%= RadTreeViewOptions.ClientID %>");
            var node = tree.get_selectedNode();
            if (node != null && $('#<%=hidNeedEdit.ClientID%>').val() == 'true') {
                node.startEdit();
            }
        }
    </script>

    <telerik:RadToolBar ID="RadToolBarOptions" runat="server" OnButtonClick="RadToolBarOptions_ButtonClick" Width="100%" meta:resourcekey="RadToolBarOptionsResource1" SingleClick="None">
        <Items>
            <telerik:RadToolBarButton runat="server"
                Text="新增項目"
                Value="AddItem"
                ImageUrl="~/System/icon_images/icon_m19.gif"
                HoveredImageUrl="~/System/icon_images/icon_m19.gif"
                CheckedImageUrl="~/System/icon_images/icon_m19.gif"
                meta:resourcekey="RadToolBarAddItemResource1">
            </telerik:RadToolBarButton>
            <telerik:RadToolBarButton runat="server" IsSeparator="True" meta:resourcekey="RadToolBarButtonResource1"></telerik:RadToolBarButton>
            <telerik:RadToolBarButton runat="server"
                Text="刪除"
                Value="DeleteItem"
                ImageUrl="~/System/icon_images/icon_m03.gif"
                HoveredImageUrl="~/System/icon_images/icon_m03.gif"
                CheckedImageUrl="~/System/icon_images/icon_m03.gif"
                meta:resourcekey="RadToolBarDeleteItemResource1">
            </telerik:RadToolBarButton>
            <telerik:RadToolBarButton runat="server" IsSeparator="True" meta:resourcekey="RadToolBarButtonResource2"></telerik:RadToolBarButton>
        </Items>
    </telerik:RadToolBar>
    <asp:UpdatePanel id="UpdatePanel1" runat="server">
        <contenttemplate>
            <telerik:RadTreeView ID="RadTreeViewOptions" Runat="server" 
                CheckBoxes="True"
                EnableDragAndDrop="True"
                EnableDragAndDropBetweenNodes="True"
                OnClientNodeDropping="TreeOptons_OnClientNodeDropping"
                OnNodeDrop="RadTreeViewOptions_NodeDrop"
                AllowNodeEditing="True"
                OnNodeEdit="RadTreeViewOptions_NodeEdit"
                OnClientLoad="TreeOptions_Load" meta:resourcekey="RadTreeViewOptionsResource1" >
            </telerik:RadTreeView>

            <asp:HiddenField runat="server" ID="hidNeedEdit" />
            <asp:HiddenField runat="server" ID="hfListItems" />
            <asp:HiddenField ID="hfPostBack" runat="server" Value="True" />
            <asp:Button runat="server" ID="btnBindOptions" OnClick="btnBindOptions_Click" Style="display: none" meta:resourcekey="btnBindOptionsResource1" />
        </contenttemplate>
        <triggers>
            <asp:AsyncPostBackTrigger ControlID="RadToolBarOptions" EventName="ButtonClick" />
        </triggers>
    </asp:UpdatePanel>

    <asp:Label ID="lblRepeatName" runat="server" Text="名稱重複" Visible="False" meta:resourcekey="lblRepeatNameResource1"></asp:Label>
    <asp:Label ID="lblNotAllowEmpty" runat="server" Text="不允許空白" Visible="False" meta:resourcekey="lblNotAllowEmptyResource1"></asp:Label>
</asp:Content>
