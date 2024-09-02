<%@ Page Title="" Language="C#" MasterPageFile="~/Master/TwoColumn.master" AutoEventWireup="true" Inherits="EIP_Album_Admin_BrowePhoto" Culture="auto" meta:resourcekey="PageResource2" UICulture="auto" Codebehind="BrowePhoto.aspx.cs" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ScriptContentPlaceHolder" runat="Server">

    <script language="javascript" type="text/javascript">
        function MovePhoto(photoGuids) {
            $uof.dialog.open2("~/EIP/Album/Admin/MovePhoto.aspx", "", "", 360, 600, MovePhotoReturn, { "PhotoGuid": photoGuids });
            return false;
        }

        function MovePhotoReturn(returnValue) {
            setTimeout(function () {
                $("#<%=Button1.ClientID%>").click();
            }, 500);            
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
        function MaintainPhoto(sender,albumGuid, photoGuid) {            
            $uof.dialog.open2("~/EIP/Album/Admin/UploadPhoto.aspx", sender, "", 550, 580, OpenDialogResult, { "AlbumGUID": albumGuid, "PhotoGUID": photoGuid });
            return false;
        }

        function PlayPhoto(albumGUID, photoGUID) {
            var albumGUID = albumGUID;
            var photoGUID = photoGUID;
            window.open("../User/PlayPhoto.aspx?ALBUM_GUID={0}&PHOTO_GUID={1}");
        }

        function RadToolBar1_ButtonClicking(sender, args) {
            var value = args.get_item().get_value();
            switch (value) {
                case "MaintainAlbumClass":
                    args.set_cancel(true);
                    $uof.dialog.open2("~/EIP/Album/Admin/MaintainAlbumClass.aspx", args.get_item(), "", 350, 500, OpenDialogResult);
                    break;
                case "AddPhoto":
                    args.set_cancel(true);
                    var AlbumGUID = $("#<%=hfAlbumID.ClientID%>").val();
                    $uof.dialog.open2("~/EIP/Album/Admin/UploadPhoto.aspx", args.get_item(), "", 900, 500 , OpenDialogResult, {"AlbumGUID":AlbumGUID});
                    break;
                case "DeletePhoto":                    
                    if ($("#<%=hiddenCheck.ClientID %>").val() != "") {   
                        $("#<%=hfIsBindEvent.ClientID%>").val("true");
                        args.set_cancel(!confirm("<%=lblDelete.Text %>"));
                    }
                    else {
                        alert("<%=lblDeleteMsg.Text%>");
                        args.set_cancel(true);
                    }
                    break;
                case "MovePhoto":
                    $("#<%=hfIsBindEvent.ClientID%>").val("true");
                    break;
        }
    }

    function OpenDialogResult(returnValue) {            
        if (typeof (returnValue) == 'undefined')
            return false;
        else
            return true;
    }
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ToolbarContentPlaceHolder" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>

            <telerik:RadToolBar ID="RadToolBar1" runat="server" Width="100%" OnButtonClick="RadToolBar1_ButtonClick" OnClientButtonClicking="RadToolBar1_ButtonClicking" meta:resourcekey="RadToolBar1Resource1">
                <Items>
                    <telerik:RadToolBarButton runat="server" Text="類別權限設定" Value="MaintainAlbumClassSetting" Enabled="false"
                        ClickedImageUrl="~/Common/images/icon/icon_j20.gif" DisabledImageUrl="~/Common/images/icon/icon_j20.gif"
                        HoveredImageUrl="~/Common/images/icon/icon_j20.gif" ImageUrl="~/Common/images/icon/icon_j20.gif" meta:resourcekey="RadToolBarButtonResource15">
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton runat="server" IsSeparator="True">
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton runat="server" Text="類別維護" Value="MaintainAlbumClass" Enabled="false"
                        ClickedImageUrl="~/Common/Images/Icon/icon_j28.gif" DisabledImageUrl="~/Common/Images/Icon/icon_j28.gif"
                        HoveredImageUrl="~/Common/Images/Icon/icon_j28.gif" ImageUrl="~/Common/Images/Icon/icon_j28.gif" meta:resourcekey="RadToolBarButtonResource1">
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton runat="server" IsSeparator="true" meta:resourcekey="RadToolBarButtonResource2">
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton runat="server" Text="新增相簿" Value="AddAlbum" Enabled="false"
                        ClickedImageUrl="~/Common/Images/Icon/icon_j21.gif" DisabledImageUrl="~/Common/Images/Icon/icon_j21.gif"
                        HoveredImageUrl="~/Common/Images/Icon/icon_j21.gif" ImageUrl="~/Common/Images/Icon/icon_j21.gif" meta:resourcekey="RadToolBarButtonResource3">
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton runat="server" IsSeparator="true" meta:resourcekey="RadToolBarButtonResource4">
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton runat="server" Text="刪除相簿" Enabled="false"
                        ClickedImageUrl="~/Common/Images/Icon/icon_j22.gif" DisabledImageUrl="~/Common/Images/Icon/icon_j22.gif"
                        HoveredImageUrl="~/Common/Images/Icon/icon_j22.gif" ImageUrl="~/Common/Images/Icon/icon_j22.gif" meta:resourcekey="RadToolBarButtonResource5">
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton runat="server" IsSeparator="true" meta:resourcekey="RadToolBarButtonResource6">
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton runat="server" Text="搬移相簿" Enabled="false"
                        ClickedImageUrl="~/Common/Images/Icon/icon_j23.gif" DisabledImageUrl="~/Common/Images/Icon/icon_j23.gif"
                        HoveredImageUrl="~/Common/Images/Icon/icon_j23.gif" ImageUrl="~/Common/Images/Icon/icon_j23.gif" meta:resourcekey="RadToolBarButtonResource7">
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton runat="server" IsSeparator="true" meta:resourcekey="RadToolBarButtonResource8">
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton runat="server" Text="新增相片" Value="AddPhoto"
                        ClickedImageUrl="~/Common/Images/Icon/icon_j24.gif" DisabledImageUrl="~/Common/Images/Icon/icon_j24.gif"
                        HoveredImageUrl="~/Common/Images/Icon/icon_j24.gif" ImageUrl="~/Common/Images/Icon/icon_j24.gif" meta:resourcekey="RadToolBarButtonResource9">
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton runat="server" IsSeparator="true" meta:resourcekey="RadToolBarButtonResource10">
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton runat="server" Text="刪除相片" Value="DeletePhoto"
                        ClickedImageUrl="~/Common/Images/Icon/icon_j25.gif" DisabledImageUrl="~/Common/Images/Icon/icon_j25.gif"
                        HoveredImageUrl="~/Common/Images/Icon/icon_j25.gif" ImageUrl="~/Common/Images/Icon/icon_j25.gif" meta:resourcekey="RadToolBarButtonResource11">
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton runat="server" IsSeparator="true" meta:resourcekey="RadToolBarButtonResource12">
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton runat="server" Text="搬移相片" Value="MovePhoto"
                        ClickedImageUrl="~/Common/Images/Icon/icon_j26.gif" DisabledImageUrl="~/Common/Images/Icon/icon_j26.gif"
                        HoveredImageUrl="~/Common/Images/Icon/icon_j26.gif" ImageUrl="~/Common/Images/Icon/icon_j26.gif" meta:resourcekey="RadToolBarButtonResource13">
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton runat="server" IsSeparator="true" meta:resourcekey="RadToolBarButtonResource14">
                    </telerik:RadToolBarButton>
                </Items>
            </telerik:RadToolBar>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="LeftContentPlaceHolder" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel3" UpdateMode="Conditional" runat="server">
        <ContentTemplate>
            <telerik:RadTreeView ID="treeAlbumList" runat="server"></telerik:RadTreeView>
            <asp:HiddenField ID="HiddenField1" runat="server" />
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="RightContentPlaceHolder" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel4" UpdateMode="Conditional" runat="server">
        <ContentTemplate>
            <table border="0" cellpadding="0" cellspacing="0" width="100%">
                <tr>
                    <td colspan="2">
                        <table width="100%" border="0" cellpadding="0" cellspacing="0">
                            <tr>
                                <td style="height: 137px; width: 142px; vertical-align: middle; text-align: center; background-image: url('../../../Common/Images/Icon/icon_j35.gif')">
                                    <asp:Image ID="imgAlbumCover" runat="server"
                                        meta:resourcekey="imgAlbumCoverResource1" />
                                </td>
                                <td style="height: 137px; width: 46px; vertical-align: middle; text-align: center; background-image: url('../../../Common/Images/Icon/icon_j36_2.gif')"></td>
                                <td style="background-image: url('../../../Common/Images/Icon/icon_j36_3.gif')">

                                    <asp:Panel ID="Panel1" runat="server" ScrollBars="Auto" Height="105px"
                                        meta:resourcekey="Panel1Resource1">
                                        <br />
                                        <span style="color: #515151;" class="SizeL">
                                            <asp:LinkButton ID="lblAlbumTopic" runat="server" Font-Bold="True"
                                                meta:resourcekey="lblAlbumTopicResource1" CausesValidation="False"
                                                OnClick="lblAlbumTopic_Click"></asp:LinkButton></span>
                                        <br />
                                        <br />
                                        <span style="color: #336699;" class="SizeMemo">
                                            <asp:Label ID="lblAlbumDesc" runat="server" meta:resourcekey="lblAlbumDescResource1"></asp:Label>
                                        </span>
                                    </asp:Panel>
                                    <span style="color: #666666; font-size: 9pt">
                                        <asp:Label ID="lblAlbumDate" runat="server" ForeColor="#666665" meta:resourcekey="lblAlbumDateResource1"></asp:Label>
                                    </span>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
            <table style="background-color: #dcdcdc" width="100%">
                <tr>
                    <td style="width: 200px; height: 20px; text-align: left">
                        <table border="0" cellpadding="0" cellspacing="0">
                            <tr>
                                <td style="white-space: nowrap;">
                                    <asp:CheckBox ID="cbSelectAll" runat="server" OnCheckedChanged="cbSelectAll_CheckedChanged" Text="全選" AutoPostBack="True" meta:resourcekey="cbSelectAllResource1" />
                                </td>
                                <td style="width: 5px;" align="center"></td>
                                <td style="white-space: nowrap;">
                                    <asp:DropDownList ID="ddlSort" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlSort_SelectedIndexChanged" meta:resourcekey="ddlSortResource1">
                                        <asp:ListItem Value="0" meta:resourcekey="ListItemResource1" Text="依相片主題"></asp:ListItem>
                                        <asp:ListItem Value="1" Selected="True" meta:resourcekey="ListItemResource2" Text="依最近上傳時間"></asp:ListItem>
                                        <asp:ListItem Value="2" Enabled="False" meta:resourcekey="ListItemResource3" Text="依推薦數"></asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                                <td style="width: 5px;" align="center"></td>
                                <td style="white-space: nowrap;">
                                    <table border="0" cellpadding="0" cellspacing="0">
                                        <tr>
                                            <td align="left" style="background-color: #cccccc" nowrap>
                                                <asp:Table ID="table2" runat="server" meta:resourcekey="table2Resource1">
                                                </asp:Table>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </td>

                </tr>
                <tr>
                    <td colspan="2" style="background-color: #cccccc; padding: 6px">
                        <asp:Label ID="lblNoData" runat="server" Text="沒有資料"
                            meta:resourcekey="lblNoDataResource1"></asp:Label>
                        <asp:DataList ID="DLPhoto" runat="server" RepeatColumns="5"
                            OnItemDataBound="DLPhoto_ItemDataBound" RepeatDirection="Horizontal"
                            meta:resourcekey="DLPhotoResource1">
                            <ItemTemplate>
                                <table style="width: 140px">
                                    <tr>
                                        <td id="itemTD" runat="server" style="height: 137px; width: 136px; background-repeat: no-repeat; vertical-align: middle; text-align: center;">
                                            <asp:ImageButton ID="imgbtnPhoto" runat="server"
                                                meta:resourcekey="imgbtnPhotoResource1" />

                                        </td>
                                        <td style="width: 4px">&nbsp;
                                        </td>
                                    </tr>
                                    <tr>
                                        <td valign="top" align="left">
                                            <asp:Image ID="imgNew" runat="server" ImageUrl="~/Common/Images/Icon/icon_j31.gif"
                                                Visible="False" meta:resourcekey="imgNewResource1" />
                                            <asp:CheckBox ID="cbItem" runat="server" meta:resourcekey="cbItemResource1" />
                                            <asp:LinkButton ID="lbtnPhotoTopic" runat="server"
                                                OnClick="lbtnPhotoTopic_Click" meta:resourcekey="lbtnPhotoTopicResource1"></asp:LinkButton>
                                            <asp:Label ID="lblPhotoTopic" runat="server"
                                                meta:resourcekey="lblPhotoTopicResource1"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="lblPhotoDate" runat="server"
                                                meta:resourcekey="lblPhotoDateResource1"></asp:Label>
                                            <asp:Label ID="Label3" runat="server" Text="推薦數" Visible="False"
                                                meta:resourcekey="Label3Resource1"></asp:Label>
                                            <asp:Label ID="lblWatchNumber" runat="server"
                                                Text='<%# Bind("COMMEND_COUNT") %>' Visible="False"
                                                meta:resourcekey="lblWatchNumberResource1"></asp:Label>
                                            <asp:Label ID="lblAlbumGUID" runat="server" Visible="False"
                                                Text='<%# Bind("ALBUM_GUID") %>' meta:resourcekey="lblAlbumGUIDResource1"></asp:Label>
                                            <asp:Label ID="lblPhotoGUID" runat="server" Visible="False"
                                                meta:resourcekey="lblPhotoGUIDResource1"></asp:Label>
                                        </td>
                                    </tr>
                                </table>
                            </ItemTemplate>
                            <ItemStyle Wrap="True" VerticalAlign="Top" />
                            <FooterTemplate>
                            </FooterTemplate>
                        </asp:DataList>

                    </td>
                </tr>
                <tr>
                    <td style="width: 200px">
                        <table border="0" cellpadding="0" cellspacing="0">
                            <tr>
                                <td style="white-space: nowrap;">
                                    <asp:CheckBox ID="cbSelectAll1" runat="server" OnCheckedChanged="cbSelectAll1_CheckedChanged" Text="全選" AutoPostBack="True" meta:resourcekey="cbSelectAll1Resource1" />
                                </td>
                                <td style="width: 5px;" align="center"></td>
                                <td style="white-space: nowrap;">
                                    <asp:DropDownList ID="ddlSort1" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlSort1_SelectedIndexChanged" meta:resourcekey="ddlSort1Resource1">
                                        <asp:ListItem Value="0" meta:resourcekey="ListItemResource4" Text="依相片主題"></asp:ListItem>
                                        <asp:ListItem Value="1" Selected="True" meta:resourcekey="ListItemResource5" Text="依最近上傳時間"></asp:ListItem>
                                        <asp:ListItem Value="2" Enabled="False" meta:resourcekey="ListItemResource6" Text="依推薦數"></asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                                <td style="width: 5px;" align="center"></td>
                                <td style="white-space: nowrap;">
                                    <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                        <tr>
                                            <td align="left" style="background-color: #cccccc" nowrap>
                                                <asp:Table ID="table1" runat="server" meta:resourcekey="table1Resource1">
                                                </asp:Table>
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
            <asp:HiddenField ID="hfAlbumID" runat="server" />
            <asp:HiddenField ID="hfPhotoID" runat="server" />
            <asp:HiddenField ID="hiddenCheck" runat="server" />
            <asp:HiddenField ID="hfIsBindEvent" runat="server" />
        </ContentTemplate>
    </asp:UpdatePanel>
    <div style="display: none">
        <asp:Button ID="Button1" runat="server" Text="Button" OnClick="Button1_Click"
            meta:resourcekey="Button1Resource1" />
    </div>
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
    <asp:Label ID="lblDelete" runat="server" Text="確定要刪除嗎?" Visible="False"
        meta:resourcekey="lblDeleteResource1"></asp:Label>
    <asp:Label ID="lblDeleteMsg" runat="server" Text="請選擇要刪除的相片" Visible="False"
        meta:resourcekey="lblDeleteMsgResource1"></asp:Label>
    <asp:Label ID="lblNotCheckPhotoMsg" runat="server" Text="請選擇要搬移的相片"
        Visible="False" meta:resourcekey="lblNotCheckPhotoMsgResource1"></asp:Label>
    <asp:Label ID="lblTitle" runat="server" Text="相簿類別" meta:resourcekey="Label7Resource1" Visible="false"></asp:Label>
    <asp:HiddenField ID="hfCurrentUser" runat="server" />
</asp:Content>



