<%@ Page Language="C#" MasterPageFile="~/Master/TwoColumn.master" AutoEventWireup="true" Inherits="EIP_Album_User_Default" Title="相簿專區" Culture="auto" meta:resourcekey="PageResource2" UICulture="auto" Codebehind="Default.aspx.cs" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ScriptContentPlaceHolder" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ToolbarContentPlaceHolder" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="LeftContentPlaceHolder" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel3" UpdateMode="Conditional" runat="server">
        <ContentTemplate>
            <telerik:RadTreeView ID="treeAlbumList" runat="server" OnNodeClick="treeAlbumList_NodeClick" ></telerik:RadTreeView>
            <asp:HiddenField ID="HiddenField1" runat="server" />
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="RightContentPlaceHolder" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel4" UpdateMode="Conditional" runat="server">
        <ContentTemplate>
            <asp:Label ID="lblNoAuthMsg" runat="server" Text="沒有權限觀看" Visible="false" ForeColor="Red" meta:resourcekey="lblNoAuthMsgResource1"></asp:Label>
            <table runat="server" id="titleDT" width="100%" cellpadding="0" cellspacing="0" border="0">
                <tr>
                    <td style="vertical-align: middle;background-image:url('../../../Common/Images/Icon/icon_j36_1.gif')">
                        <table>
                            <tr>
                                <td style=" vertical-align:middle;white-space:nowrap;">
                                    <asp:Image ID="imgAlbumIcon" runat="server" ImageUrl="~/Common/Images/Icon/icon_j40.gif" meta:resourcekey="imgAlbumIconResource1" /></td>
                                <td style=" vertical-align:middle; white-space:nowrap;">
                                    <span id="labFolderName" class="SizeXL" style="font-size: 20px; font-weight: bold; font-style: italic;">
                                        <asp:Label ID="lblAlbumTopic"  runat="server" Font-Bold="True" meta:resourcekey="lblAlbumTopicResource1"></asp:Label>
                                    </span>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
            <table runat="server" id="contentDT" style="background-color: #dcdcdc" width="100%">
                <tr>
                    <td >
                        <table border="0" cellpadding="0" cellspacing="0" >
                            <tr>
                                <td style="white-space: nowrap">
                                    <asp:DropDownList ID="ddlSort" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlSort_SelectedIndexChanged" meta:resourcekey="ddlSortResource1">
                                        <asp:ListItem Value="0" meta:resourcekey="ListItemResource1">依相簿名稱</asp:ListItem>
                                        <asp:ListItem Value="1" Selected="True" meta:resourcekey="ListItemResource2">依最近上傳時間</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                                <td style="width: 5px;" align="center">
                                </td>
                                <td style="white-space: nowrap">
                                    <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                        <tr>
                                            <td>
                                                <asp:Table ID="table1" runat="server"></asp:Table>
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
                        <table style="background-color: #cccccc;" width="100%">
                            <tr>
                                <td style="padding-top: 6px; padding-left: 5px">
                                    <asp:Label ID="lblNoData" runat="server" Text="沒有資料"
                                        meta:resourcekey="lblNoDataResource1"></asp:Label>
                                    <asp:DataList ID="DLPhoto" runat="server" RepeatColumns="5"
                                        RepeatDirection="Horizontal" OnItemDataBound="DLPhoto_ItemDataBound" meta:resourcekey="DLPhotoResource1">
                                        <EditItemStyle BorderStyle="None" />
                                        <ItemTemplate>
                                            <table id="Table2" runat="server" width="150px">
                                                <tr id="Tr1" runat="server">
                                                    <td id="Td1" width="150px" style=" text-align:center; vertical-align:middle;height: 145px; background-image:url('../../../Common/Images/Icon/icon_j39.gif')" runat="server">
                                                        <asp:ImageButton ID="imgbtnPhoto" runat="server" />
                                                    </td>
                                                </tr>
                                                <tr id="Tr2" runat="server">
                                                    <td id="Td2" runat="server" style="text-align:center;">
                                                        <asp:Image ID="Image1" runat="server" ImageUrl="~/Common/Images/Icon/icon_j31.gif"
                                                            Visible="False" />
                                                        <asp:Label ID="lblName" runat="server"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr id="Tr3" runat="server">
                                                    <td id="Td3" runat="server">
                                                        <asp:Label ID="Label3" runat="server" Text="|瀏覽量" Visible="False"></asp:Label>
                                                        <asp:Label ID="lblWatchNumber" runat="server"
                                                            Text='<%# Bind("REVIEW_COUNT") %>' Visible="False"></asp:Label>
                                                        <asp:Label ID="lblAlbumGUID" runat="server" Visible="False"
                                                            Text='<%# Bind("ALBUM_GUID") %>'></asp:Label>
                                                    </td>
                                                </tr>
                                            </table>
                                        </ItemTemplate>
                                        <ItemStyle VerticalAlign="Top" Wrap="True" />
                                    </asp:DataList>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td width="120px">
                        <table border="0" cellpadding="0" cellspacing="0">
                            <tr>
                                <td>
                                    <asp:DropDownList ID="ddlSort1" runat="server"
                                        AutoPostBack="True"
                                        OnSelectedIndexChanged="ddlSort1_SelectedIndexChanged1"
                                        meta:resourcekey="ddlSort1Resource1">
                                        <asp:ListItem Value="0" meta:resourcekey="ListItemResource3">依相簿名稱</asp:ListItem>
                                        <asp:ListItem Value="1" Selected="True" meta:resourcekey="ListItemResource4">依最近上傳時間</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                                <td style="width: 5px;" align="center">
                                </td>
                                <td>
                                    <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                        <tr>
                                            <td>
                                                <asp:Table ID="table2" runat="server"></asp:Table>
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
        </ContentTemplate>
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
    <asp:Label ID="lblZhang" runat="server" Text="張" Visible="False"
        meta:resourcekey="lblZhangResource1"></asp:Label>
    <asp:Label ID="lblTitle" Visible="false" runat="server" Text="相簿類別" meta:resourcekey="Label7Resource1"></asp:Label>
    <asp:HiddenField ID="hfCurrentUser" runat="server" />
</asp:Content>



