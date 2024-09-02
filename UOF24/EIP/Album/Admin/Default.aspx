<%@ Page Title="相簿維護" Language="C#" MasterPageFile="~/Master/TwoColumn.master" AutoEventWireup="true" Inherits="EIP_Album_Admin_Default" Culture="auto" meta:resourcekey="PageResource2" UICulture="auto" CodeBehind="Default.aspx.cs" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ScriptContentPlaceHolder" runat="Server">
    <script id="toolbarjs" type="text/javascript">

        function MoveAlbum(albumGuids, Tag) {
            $uof.dialog.open2("~/EIP/Album/Admin/MoveAlbum.aspx", "", "", 368, 600, MoveAlbumReturn, { "AlbumGuid": albumGuids, "Tag": Tag });
            return false;
        }

        function MoveAlbumReturn(returnValue) {
            $("#<%=hiReturnValue.ClientID%>").val(returnValue);
            $("#<%=Button1.ClientID%>").click();
        }

        function RadToolBar1_ButtonClicking(sender, args) {
            var value = args.get_item().get_value();
            switch (value) {
                case "MaintainAlbumClass":
                    args.set_cancel(true);
                    var param = { "state": "treeSetting" };
                    $uof.dialog.open2("~/EIP/Album/Admin/MaintainAlbumClass.aspx", args.get_item(), '<%=lblClassTitle.Text%>', 400, 500, OpenDialogResult, param);
                    break;
                case "MaintainAlbumClassSetting":
                    args.set_cancel(true);
                    var classGuid = $("#<%=hiddenNodeId.ClientID %>").val();
                    var param = { "state": "classSetting", "classGuid": classGuid };
                    $uof.dialog.open2("~/EIP/Album/Admin/MaintainAlbumClass.aspx", args.get_item(), '<%=lblAuthClassTitle.Text%>', 600, 400, OpenDialogResult, param);
                    break;

                case "AddAlbum":
                    args.set_cancel(true);
                    var tree = $find('<%=treeAlbumClass.ClientID%>');
                    var node = tree.get_selectedNode();
                    if (node == null || node == '') {
                        alert('<%=lblSelected.Text %>');
                        return;
                    }
                    var classGuid = $("#<%=hiddenNodeId.ClientID %>").val();
                    $uof.dialog.open2("~/EIP/Album/Admin/MaintainAlbum.aspx", args.get_item(), "", 500, 400, OpenDialogResult, { "classGuid": classGuid });
                    break;
                case "DeleteAlbum":

                    if ($("#<%=hiddenCheck.ClientID %>").val() != "") {
                        if (!confirm("<%=lblDeleteMsg.Text %>")) {
                            args.set_cancel(true);
                        }
                    }
                    else {
                        alert("<%=lblNotDeleteAlbumMsg.Text %>");
                        args.set_cancel(true);
                    }
                    break;
            }
        }

        function OpenDialogResult(returnValue) {
            //if (typeof (returnValue) == 'undefined') {            
            if (typeof (returnValue) === 'undefined' || returnValue === null) {
                return false;
            }
            else
                return true;
        }

        function CheckAlbum(checked) {
            var m_hiddenCheck = $("#<%=hiddenCheck.ClientID %>");

            if (checked == true) {
                m_hiddenCheck.val(m_hiddenCheck.val() + "0");
            }
            else if (checked == false) {
                if (m_hiddenCheck.val().length > 0) {
                    m_hiddenCheck.val(m_hiddenCheck.val().substring(0, m_hiddenCheck.val().length - 1));
                }
            }
        }
        function MaintainAlbum(albumGuid, classGuid) {
            var albumGuid = albumGuid;
            var classGuid = classGuid;
            $uof.dialog.open2("~/EIP/MaintainAlbum.aspx", "", "", 500, 400, OpenDialogResult, { "albumGuid": albumGuid, "classGuid": classGuid });
            return false;

        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ToolbarContentPlaceHolder" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel2" UpdateMode="Conditional" runat="server">
        <ContentTemplate>
            <telerik:RadToolBar ID="RadToolBar1" runat="server" OnClientButtonClicking="RadToolBar1_ButtonClicking" Width="100%" OnButtonClick="RadToolBar1_ButtonClick" meta:resourcekey="RadToolBar1Resource1">
                <Items>
                    <telerik:RadToolBarButton runat="server" Text="類別權限設定" Value="MaintainAlbumClassSetting"
                        ClickedImageUrl="~/Common/images/icon/icon_j20.gif" DisabledImageUrl="~/Common/images/icon/icon_j20.gif"
                        HoveredImageUrl="~/Common/images/icon/icon_j20.gif" ImageUrl="~/Common/images/icon/icon_j20.gif" meta:resourcekey="RadToolBarButtonResource15">
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton runat="server" IsSeparator="True">
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton runat="server" Text="類別維護" Value="MaintainAlbumClass"
                        ClickedImageUrl="~/Common/images/icon/icon_j28.gif" DisabledImageUrl="~/Common/images/icon/icon_j28.gif"
                        HoveredImageUrl="~/Common/images/icon/icon_j28.gif" ImageUrl="~/Common/images/icon/icon_j28.gif" meta:resourcekey="RadToolBarButtonResource1">
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton runat="server" IsSeparator="True" meta:resourcekey="RadToolBarButtonResource2">
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton runat="server" Text="新增相簿" Value="AddAlbum"
                        ClickedImageUrl="~/Common/images/icon/icon_j21.gif" DisabledImageUrl="~/Common/images/icon/icon_j21.gif"
                        HoveredImageUrl="~/Common/images/icon/icon_j21.gif" ImageUrl="~/Common/images/icon/icon_j21.gif" meta:resourcekey="RadToolBarButtonResource3">
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton runat="server" IsSeparator="True" meta:resourcekey="RadToolBarButtonResource4">
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton runat="server" Text="刪除相簿" Value="DeleteAlbum"
                        ClickedImageUrl="~/Common/images/icon/icon_j22.gif" DisabledImageUrl="~/Common/images/icon/icon_j22.gif"
                        HoveredImageUrl="~/Common/images/icon/icon_j22.gif" ImageUrl="~/Common/images/icon/icon_j22.gif" meta:resourcekey="RadToolBarButtonResource5">
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton runat="server" IsSeparator="True" meta:resourcekey="RadToolBarButtonResource6">
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton runat="server" Text="搬移相簿" Value="MoveAlbum"
                        ClickedImageUrl="~/Common/images/icon/icon_j23.gif" DisabledImageUrl="~/Common/images/icon/icon_j23.gif"
                        HoveredImageUrl="~/Common/images/icon/icon_j23.gif" ImageUrl="~/Common/images/icon/icon_j23.gif" meta:resourcekey="RadToolBarButtonResource7">
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton runat="server" IsSeparator="True" meta:resourcekey="RadToolBarButtonResource8">
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton runat="server" Text="新增相片" Value="AddPhoto" Enabled="False"
                        ClickedImageUrl="~/Common/images/icon/icon_j24.gif" DisabledImageUrl="~/Common/images/icon/icon_j24.gif"
                        HoveredImageUrl="~/Common/images/icon/icon_j24.gif" ImageUrl="~/Common/images/icon/icon_j24.gif" meta:resourcekey="RadToolBarButtonResource9">
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton runat="server" IsSeparator="True" meta:resourcekey="RadToolBarButtonResource10">
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton runat="server" Text="刪除相片" Value="MaintainPhoto" Enabled="False"
                        ClickedImageUrl="~/Common/images/icon/icon_j25.gif" DisabledImageUrl="~/Common/images/icon/icon_j25.gif"
                        HoveredImageUrl="~/Common/images/icon/icon_j25.gif" ImageUrl="~/Common/images/icon/icon_j25.gif" meta:resourcekey="RadToolBarButtonResource11">
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton runat="server" IsSeparator="True" meta:resourcekey="RadToolBarButtonResource12">
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton runat="server" Text="搬移相片" Enabled="False"
                        ClickedImageUrl="~/Common/images/icon/icon_j26.gif" DisabledImageUrl="~/Common/images/icon/icon_j26.gif"
                        HoveredImageUrl="~/Common/images/icon/icon_j26.gif" ImageUrl="~/Common/images/icon/icon_j26.gif" meta:resourcekey="RadToolBarButtonResource13">
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton runat="server" IsSeparator="True" meta:resourcekey="RadToolBarButtonResource14">
                    </telerik:RadToolBarButton>
                </Items>
            </telerik:RadToolBar>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="LeftContentPlaceHolder" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel3" UpdateMode="Conditional" runat="server">
        <ContentTemplate>
            <telerik:RadTreeView ID="treeAlbumClass" runat="server"
                OnNodeClick="treeAlbumClass_NodeClick">
                <%--OnClientNodeDropping="classTreeClientNodeDropping">--%>
            </telerik:RadTreeView>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="RightContentPlaceHolder" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" UpdateMode="Conditional" runat="server">
        <ContentTemplate>
            <asp:Label ID="lblNoAuthMsg" runat="server" Text="沒有權限維護" Visible="false" ForeColor="Red" meta:resourcekey="lblNoAuthMsgResource1"></asp:Label>
            <table runat="server" id="dataDT" style="background-color: #dcdcdc" width="100%">
                <tr>
                    <td colspan="2" style="background-image: url('../../../Common/Images/Icon/icon_j36_1.gif')">
                        <table>
                            <tr>
                                <td valign="middle" style="white-space: nowrap">
                                    <asp:Image ID="imgIcon" runat="server"
                                        ImageUrl="~/Common/Images/Icon/icon_j40.gif"
                                        meta:resourcekey="imgIconResource1" /></td>
                                <td style="white-space: nowrap; vertical-align: middle;">
                                    <span id="labFolderName" class="SizeXL" style="font-size: 20px; font-weight: bold; font-style: italic;">
                                        <asp:Label ID="lblAlbumTopic" runat="server" meta:resourcekey="lblAlbumTopicResource1"></asp:Label>
                                    </span>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td width="170px" style="text-align: left;">
                        <table border="0" cellpadding="0" cellspacing="0">
                            <tr>
                                <td style="white-space: nowrap;">
                                    <asp:CheckBox ID="cbSelectAll" runat="server" AutoPostBack="True" OnCheckedChanged="cbSelectAll_CheckedChanged" Text="全選" meta:resourcekey="cbSelectAllResource1" />
                                </td>
                                <td style="width: 5px;" align="center"></td>
                                <td style="white-space: nowrap;">
                                    <asp:DropDownList ID="ddlSort" runat="server" OnSelectedIndexChanged="ddlSort_SelectedIndexChanged" AutoPostBack="True" meta:resourcekey="ddlSortResource1">
                                        <asp:ListItem Value="0" meta:resourcekey="ListItemResource1" Text="依相簿名稱"></asp:ListItem>
                                        <asp:ListItem Value="1" Selected="True" meta:resourcekey="ListItemResource2" Text="依最近上傳時間"></asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                                <td style="width: 5px;" align="center"></td>
                                <td style="white-space: nowrap;">
                                    <table border="0" cellpadding="0" cellspacing="0">
                                        <tr>
                                            <td>
                                                <asp:Table ID="table1" runat="server" CellPadding="0" CellSpacing="0" BorderWidth="0px" meta:resourcekey="table1Resource1"></asp:Table>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </td>

                </tr>
                <tr>
                    <td colspan="2">
                        <table style="background-color: #cccccc" width="100%">
                            <tr>
                                <td style="padding-top: 6px; padding-left: 5px;">
                                    <asp:Label ID="lblNoData" runat="server" Text="沒有資料" meta:resourcekey="lblNoDataResource1"></asp:Label>
                                    <asp:DataList ID="DLPhoto" runat="server" RepeatColumns="5"
                                        RepeatDirection="Horizontal"
                                        OnItemCommand="DLPhoto_ItemCommand"
                                        OnItemDataBound="DLPhoto_ItemDataBound"
                                        meta:resourcekey="DLPhotoResource1">
                                        <ItemTemplate>
                                            <table id="Table2" runat="server">
                                                <tr id="Tr1" runat="server">
                                                    <td id="Td1" width="150px" style="height: 145px; text-align: center; vertical-align: middle; background-image: url('../../../Common/Images/Icon/icon_j39.gif')"
                                                        runat="server">
                                                        <asp:ImageButton ID="imgbtnPhoto" runat="server" />
                                                    </td>
                                                </tr>
                                                <tr id="Tr2" runat="server">
                                                    <td id="Td2" width="105px" runat="server" style="text-align: center;">
                                                        <asp:Image ID="Image1" runat="server"
                                                            ImageUrl="~/Common/Images/Icon/icon_j31.gif"
                                                            Visible="False" />

                                                        <asp:CheckBox ID="cbItem" runat="server" />
                                                        <asp:LinkButton ID="lnkbtnAlbtmName" runat="server"
                                                            OnClick="lnkbtnAlbtmName_Click"></asp:LinkButton>
                                                    </td>
                                                </tr>
                                                <tr id="Tr3" runat="server">
                                                    <td id="Td3" runat="server">
                                                        <asp:Label ID="Label3" runat="server" Text="|瀏覽量" Visible="False"></asp:Label>
                                                        <asp:Label ID="lblWatchNumber" runat="server"
                                                            Text='<%# Bind("REVIEW_COUNT") %>' Visible="False"></asp:Label>
                                                        <asp:Label ID="lblFileGroupID" runat="server" Visible="False"
                                                            Text='<%# Bind("FILE_GROUP_ID") %>'></asp:Label>
                                                        <asp:Label ID="lblAlbumGuid" runat="server" Visible="False"
                                                            Text='<%# Bind("ALBUM_GUID") %>'></asp:Label>
                                                    </td>
                                                </tr>
                                            </table>
                                        </ItemTemplate>
                                        <ItemStyle VerticalAlign="Top" />
                                        <FooterTemplate>
                                        </FooterTemplate>
                                    </asp:DataList>
                                    <asp:Label ID="Label1" runat="server" meta:resourcekey="Label1Resource1"></asp:Label>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td width="170px">
                        <table border="0" cellpadding="0" cellspacing="0">
                            <tr>
                                <td style="white-space: nowrap">
                                    <asp:CheckBox ID="cbSelectAll1" runat="server" Text="全選" OnCheckedChanged="cbSelectAll1_CheckedChanged" AutoPostBack="True" meta:resourcekey="cbSelectAll1Resource1" />

                                </td>
                                <td style="width: 5px;" align="center"></td>
                                <td style="white-space: nowrap">
                                    <asp:DropDownList ID="ddlSort1" runat="server" OnSelectedIndexChanged="ddlSort1_SelectedIndexChanged" AutoPostBack="True" meta:resourcekey="ddlSort1Resource1">
                                        <asp:ListItem Value="0" meta:resourcekey="ListItemResource3" Text="依相簿名稱"></asp:ListItem>
                                        <asp:ListItem Value="1" Selected="True" meta:resourcekey="ListItemResource4" Text="依最近上傳時間"></asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                                <td style="width: 5px;" align="center"></td>
                                <td style="white-space: nowrap">
                                    <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                        <tr>
                                            <td>
                                                <asp:Table ID="table2" runat="server" meta:resourcekey="table2Resource1"></asp:Table>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
            <asp:HiddenField ID="hfCurrentPage" runat="server" />
            <asp:HiddenField ID="hiddenCheck" runat="server" />

            <input id="hiddenNodeId" runat="server" type="hidden">
                <div style="display: none">
                    <asp:Button ID="Button1" runat="server" meta:resourcekey="Button1Resource1"
                        OnClick="Button1_Click" Text="Button" />
                </div>
            </input>
        </ContentTemplate>
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="cbSelectAll" EventName="CheckedChanged" />
            <asp:AsyncPostBackTrigger ControlID="cbSelectAll1" EventName="CheckedChanged" />
        </Triggers>
    </asp:UpdatePanel>
    <asp:Label ID="lblPrevious" runat="server" Text="上一頁" Visible="False"
        meta:resourcekey="lblPreviousResource1"></asp:Label>
    <asp:Label ID="lblNext" runat="server" Text="下一頁" Visible="False"
        meta:resourcekey="lblNextResource1"></asp:Label>
    <asp:Label ID="lblAlbumClass" runat="server" Text="相簿類別" Visible="False"
        meta:resourcekey="lblAlbumClassResource1"></asp:Label>
    <asp:Label ID="lblCurrentPage" runat="server" Text="筆數:{0}到{1} 共{2}筆"
        Visible="False" meta:resourcekey="lblCurrentPageResource1"></asp:Label>
    <asp:Label ID="lblPageCount" runat="server" Text="共{0}頁" Visible="False"
        meta:resourcekey="lblPageCountResource1"></asp:Label>
    <asp:Label ID="lblRootName" runat="server" Text="相簿類別" Visible="False"
        meta:resourcekey="lblRootNameResource1"></asp:Label>
    <asp:Label ID="lblDelete" runat="server" Text="確定要刪除嗎?" Visible="False"
        meta:resourcekey="lblDeleteResource1"></asp:Label>
    <asp:Label ID="lblSelected" runat="server" Text="請選擇要新增相簿的類別" Visible="False"
        meta:resourcekey="lblSelectedResource1"></asp:Label>
    <asp:Label ID="lblDeleteMsg" runat="server" Text="刪除相簿會連同相片一起刪除，確定要刪除相簿?"
        Visible="False" meta:resourcekey="lblDeleteMsgResource1"></asp:Label>
    <asp:Label ID="lblNotCheckAlbumMsg" runat="server" Text="請選擇要搬移的相簿" Visible="False"
        meta:resourcekey="lblNotCheckAlbumMsgResource1"></asp:Label>
    <asp:Label ID="lblNotDeleteAlbumMsg" runat="server" Text="請選擇要刪除的相簿"
        Visible="False" meta:resourcekey="lblNotDeleteAlbumMsgResource1"></asp:Label>
    <asp:Label ID="lblZhang" runat="server" Text="張" Visible="False"
        meta:resourcekey="lblZhangResource1"></asp:Label>
    <asp:Label ID="lblTitle" runat="server" Text="相簿類別" Visible="false"
        meta:resourcekey="Label5Resource1"></asp:Label>
    <asp:Label ID="lblAuthClassTitle" runat="server" Text="類別權限設定" Visible="false" meta:resourcekey="lblAuthClassTitleResource1"></asp:Label>
    <asp:Label ID="lblClassTitle" runat="server" Text="類別維護" Visible="false" meta:resourcekey="lblClassTitleResource1"></asp:Label>
    <asp:HiddenField ID="hiReturnValue" runat="server"></asp:HiddenField>
    <asp:CustomValidator ID="CustomValidator1" runat="server" ErrorMessage="CustomValidator" Display="Dynamic"></asp:CustomValidator>
    <asp:HiddenField ID="hfCurrentUser" runat="server" />
</asp:Content>


