<%@ Page Language="C#" MasterPageFile="~/Master/TwoColumn.master" AutoEventWireup="true" Inherits="EIP_Album_User_BrowePhoto" Title="相簿專區" Culture="auto" meta:resourcekey="PageResource2" UICulture="auto" Codebehind="BrowePhoto.aspx.cs" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ScriptContentPlaceHolder" runat="Server">
    <script type="text/javascript">
        function PlayPhoto() {
            window.open("PlayPhoto.aspx");
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ToolbarContentPlaceHolder" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="LeftContentPlaceHolder" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel3" runat="server">
        <ContentTemplate>
            <telerik:RadTreeView ID="treeAlbumList" runat="server"></telerik:RadTreeView>
            <asp:HiddenField ID="HiddenField1" runat="server" />
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="RightContentPlaceHolder" runat="Server">

    <asp:UpdatePanel ID="UpdatePanel4" UpdateMode="Conditional" runat="server">
        <ContentTemplate>
            <table width="100%" cellpadding="0" cellspacing="0" border="0" frame="void">
                <tr>
                    <td style="height: 137px; width: 142px; text-align:center; vertical-align:middle;background-image:url('../../../Common/Images/Icon/icon_j35.gif')">
                        <asp:Image ID="imgAlbumCover" runat="server"
                            meta:resourcekey="imgAlbumCoverResource1" />
                    </td>
                    <td style="height: 137px; width: 46px;text-align:center; vertical-align:middle;background-image:url('../../../Common/Images/Icon/icon_j36_2.gif')"></td>
                    <td style="background-image:url('../../../Common/Images/Icon/icon_j36_3.gif')" >

                        <asp:Panel ID="Panel1" runat="server" ScrollBars="Auto" Height="105px" meta:resourcekey="Panel1Resource1">
                            <br />
                           <span style="color: #515151;" class="SizeL">
                            <asp:Label ID="lblAlbumTopic" runat="server" Font-Bold="True" meta:resourcekey="lblAlbumTopicResource1"></asp:Label>
                           </span>
                            <br />
                            <br />
                            <span style="color: #336699;" class="SizeMemo" >
                            <asp:Label ID="lblAlbumDESC" runat="server" meta:resourcekey="lblAlbumDESCResource1"></asp:Label>
                                </span>
                        </asp:Panel>
                        <span style="color: #666666; font-size: 9pt" />
                        <asp:Label ID="lblAlbumDate" runat="server" meta:resourcekey="lblAlbumDateResource1"></asp:Label>
                    </td>
                </tr>
            </table>
            <table width="100%" style="background-color: #dcdcdc">
                <tr>
                    <td width="120px" style="text-align:left;">
                            <table border="1" cellpadding="0" cellspacing="0" >
                            <tr>
                                <td style="white-space: nowrap;text-align:left;">
                                    <asp:DropDownList ID="ddlSort" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlSort_SelectedIndexChanged" meta:resourcekey="ddlSortResource1">
                                        <asp:ListItem Value="0" meta:resourcekey="ListItemResource1">依相片主題</asp:ListItem>
                                        <asp:ListItem Value="1" Selected="True" meta:resourcekey="ListItemResource2">依最近上傳時間</asp:ListItem>
                                        <asp:ListItem Value="2" Enabled="False" meta:resourcekey="ListItemResource3">依推薦數</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                                <td style="width: 5px;" align="center">
                                </td>
                                <td style="white-space: nowrap;text-align:left;">
                                    <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                        <tr>
                                            <td width="90%" style="text-align:left;">
                                                <asp:Table ID="table2" runat="server">
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
                            RepeatDirection="Horizontal" OnItemDataBound="DLPhoto_ItemDataBound" meta:resourcekey="DLPhotoResource1">
                            <ItemTemplate>
                                <table id="Table1" runat="server" style="width: 140px">
                                    <tr id="Tr1" runat="server">
                                        <td id="itemTD" runat="server" width="136px" style="height: 137px;text-align:center; vertical-align:middle;">
                                            <asp:ImageButton ID="imgbtnPhoto" runat="server" />
                                        </td>
                                        <td style="width: 4px">&nbsp;
                                        </td>
                                    </tr>
                                    <tr id="Tr2" runat="server">
                                        <td id="Td1" valign="top" align="left" runat="server">
                                            <asp:Image ID="imgNew" runat="server"
                                                ImageUrl="~/Common/Images/Icon/icon_j31.gif"
                                                Visible="False" />
                                            <asp:Label ID="lblPhotoTopic" runat="server" Width="100px"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr id="Tr3" runat="server">
                                        <td id="Td2" runat="server">
                                            <asp:Label ID="lblPhotoDate" runat="server"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr id="Tr4" runat="server">
                                        <td id="Td3" runat="server">
                                            <asp:Label ID="Label3" runat="server" Text="推薦數" Visible="False"></asp:Label>
                                            <asp:Label ID="lblWatchNumber" runat="server"
                                                Text='<%#: Bind("COMMEND_COUNT") %>' Visible="False"></asp:Label>
                                            <asp:Label ID="lblAlbumGUID" runat="server" Visible="False"
                                                Text='<%#: Bind("ALBUM_GUID") %>'></asp:Label>
                                        </td>
                                    </tr>
                                </table>
                            </ItemTemplate>
                            <ItemStyle VerticalAlign="Top" Wrap="True" />
                            <FooterTemplate>
                            </FooterTemplate>
                        </asp:DataList>
                    </td>
                </tr>
                <tr>
                    <td valign="top" width="120px">
                        <table border="0" cellpadding="0" cellspacing="0" >
                            <tr>
                                <td>
                                    <asp:DropDownList ID="ddlSort1" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlSort1_SelectedIndexChanged" meta:resourcekey="ddlSort1Resource1">
                                        <asp:ListItem Value="0" meta:resourcekey="ListItemResource4">依相片主題</asp:ListItem>
                                        <asp:ListItem Value="1" Selected="True" meta:resourcekey="ListItemResource5">依最近上傳時間</asp:ListItem>
                                        <asp:ListItem Value="2" Enabled="False" meta:resourcekey="ListItemResource6">依推薦數</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                                <td style="width: 5px;" align="center">
                                </td>
                                <td style="white-space: nowrap">
                                    <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                        <tr>
                                            <td>
                                                <asp:Table ID="table1" runat="server">
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
        </ContentTemplate>
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="DLPhoto" EventName="ItemDataBound" />
            <asp:AsyncPostBackTrigger ControlID="ddlSort"
                EventName="SelectedIndexChanged" />
            <asp:AsyncPostBackTrigger ControlID="ddlSort1"
                EventName="SelectedIndexChanged" />
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
    <asp:Label ID="lblTitle" runat="server" Text="相簿類別" meta:resourcekey="Label7Resource1" Visible="false"></asp:Label>
    <asp:HiddenField ID="hfCurrentUser" runat="server" />
</asp:Content>


