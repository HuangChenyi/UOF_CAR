<%@ Page Title="聊天室紀錄查詢" Language="C#" MasterPageFile="~/Master/DefaultMasterPage.master" AutoEventWireup="true" CodeBehind="QueryUChatRoomDefault.aspx.cs" Inherits="Ede.Uof.Web.EIP.Chat.QueryUChatRoomDefault" meta:resourcekey="PageResource1" culture="auto" uiculture="auto"%>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script type="text/javascript">
        function RadToolBarButtonClicking(sender, args) {
            var key = args.get_item().get_value();
            switch (key) {
                case "Delete":
                        args.set_cancel(!confirm('<%=lblDelConfirm.Text %>'));
                    break;
                case "Add":
                    $uof.dialog.open2("~/EIP/Chat/EditUChatRoom.aspx", args.get_item(), '<%=lblEditTitle.Text%>', 600, 470, DialogResult);
                    break;
            }
        }
        function DialogResult(returnValue)
        {
            if (returnValue == null || typeof (returnValue) == 'undefined')
                return false;
            else
                return true;
        }
    </script>

    <asp:UpdatePanel ID="UpdataPanel1" runat="server">
        <ContentTemplate>
            <telerik:RadToolBar ID="RadToolBar1" runat="server" SingleClick="None" Width="100%" OnButtonClick="RadToolBar1_ButtonClick" OnClientButtonClicking="RadToolBarButtonClicking" meta:resourcekey="RadToolBar1Resource1">
                <Items>
                    <telerik:RadToolBarButton runat="server" Text="新增" Value="Add"
                        ClickedImageUrl="~/Common/Images/Icon/icon_m02.gif" HoveredImageUrl="~/Common/Images/Icon/icon_m02.gif" ImageUrl="~/Common/Images/Icon/icon_m02.gif" meta:resourcekey="RadToolBarButtonResource4">
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton runat="server" IsSeparator="True" meta:resourcekey="RadToolBarButtonResource5"/>
                    <telerik:RadToolBarButton runat="server" Text="刪除" Value="Delete"
                        ClickedImageUrl="~/Common/Images/Icon/icon_m03.gif" HoveredImageUrl="~/Common/Images/Icon/icon_m03.gif" ImageUrl="~/Common/Images/Icon/icon_m03.gif" meta:resourcekey="RadToolBarButtonResource6">
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton runat="server" IsSeparator="True" meta:resourcekey="RadToolBarButtonResource7"/>
                    <telerik:RadToolBarButton runat="server" Value="UChatRoomName" meta:resourcekey="UChatRoomNameResource1">
                        <ItemTemplate>
                            <table style="margin-left: 2px; margin-right: 2px;">
                                <tr>
                                    <td>&nbsp;<asp:Label ID="lblUChatRoomName" runat="server" Text="聊天室名稱" meta:resourcekey="lblUChatRoomNameResource1"></asp:Label>
                                        &nbsp;
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtUChatRoomName" runat="server" Width="120px" meta:resourcekey="txtUChatRoomNameResource1"></asp:TextBox>
                                    </td>
                                </tr>
                            </table>
                        </ItemTemplate>
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton runat="server" IsSeparator="True" meta:resourcekey="RadToolBarButtonResource2">
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton runat="server" Text="查詢" Value="Query" meta:resourcekey="RadToolBarButtonResource1"
                        ClickedImageUrl="~/Common/Images/Icon/icon_m39.gif" HoveredImageUrl="~/Common/Images/Icon/icon_m39.gif" ImageUrl="~/Common/Images/Icon/icon_m39.gif">
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton runat="server" IsSeparator="True" meta:resourcekey="RadToolBarButtonResource3">
                    </telerik:RadToolBarButton>
                </Items>
            </telerik:RadToolBar>

            <Fast:Grid ID="gridUChatRoom" runat="server" AllowPaging="True"
                AllowSorting="True" AutoGenerateCheckBoxColumn="True"
                AutoGenerateColumns="False" DataKeyNames="ROOM_ID" DataKeyOnClientWithCheckBox="False"
                DefaultSortDirection="Descending" EmptyDataText="沒有資料" EnhancePager="True" KeepSelectedRows="False"
                OnPageIndexChanging="gridUChatRoom_PageIndexChanging"
                OnRowDataBound="gridUChatRoom_RowDataBound" OnSorting="gridUChatRoom_Sorting"
                PageSize="15" Width="100%" meta:resourcekey="gridChatRoomResource1" DefaultSortColumnName="LAST_LOG_TIME" CustomDropDownListPage="False" SelectedRowColor="" UnSelectedRowColor="">
                <EnhancePagerSettings ShowHeaderPager="True" />
                <ExportExcelSettings AllowExportToExcel="False" />
                <Columns>
                    <asp:TemplateField HeaderText="圖片" meta:resourcekey="TemplateFieldResource3">
                        <ItemTemplate>
                            <asp:Image ID="imgRoomPicture" runat="server" Width="100px" Height="100px" meta:resourcekey="imgRoomPictureResource1" />                            
                        </ItemTemplate>
                        <HeaderStyle Width="110px" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="聊天室名稱" SortExpression="ROOM_NAME" meta:resourcekey="TemplateFieldResource1">
                        <ItemTemplate>
                            <asp:LinkButton ID="lbtnUChatRoomName" runat="server" Text='<%# Bind("ROOM_NAME") %>' meta:resourcekey="lbtnUChatRoomNameResource1"></asp:LinkButton>
                        </ItemTemplate>
                        <HeaderStyle Wrap="False"/>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="啟用" SortExpression="ENABLED" meta:resourcekey="TemplateFieldResource4">
                        <ItemTemplate>
                            <asp:Label ID="lblIsEnabled" runat="server" Text='<%# Bind("ENABLED") %>' meta:resourcekey="lblIsEnabledResource1"></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle Wrap="False" Width="5%" />
                        <ItemStyle HorizontalAlign="Center" Wrap="False" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="最後聊天時間" SortExpression="LAST_LOG_TIME" meta:resourcekey="BoundFieldResource3">
                        <ItemTemplate>
                            <asp:Label ID="lblLastLogTime" runat="server" Text='<%# Bind("LAST_LOG_TIME") %>'></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle Width="10%" Wrap="False" />
                        <ItemStyle Wrap="False" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="操作" meta:resourcekey="TemplateFieldResource2">
                        <ItemTemplate>
                            <asp:LinkButton ID="lbtnUChatMember" runat="server" Text="成員" meta:resourcekey="lbtnUChatMemberResource1"></asp:LinkButton>
                            <asp:Label ID="Label1" runat="server" Width="3px" meta:resourcekey="Label1Resource1"></asp:Label>
                            <asp:LinkButton ID="lbtnEdit" runat="server" Text="維護" OnClick="lbtnEdit_Click" meta:resourcekey="lbtnEditResource1"></asp:LinkButton>
                        </ItemTemplate>
                        <HeaderStyle Wrap="False" Width="5%" />
                        <ItemStyle Wrap="False"  />
                    </asp:TemplateField>
                </Columns>
            </Fast:Grid>
        </ContentTemplate>
    </asp:UpdatePanel>
    <asp:Label ID="lblDelConfirm" runat="server" Text="確定要刪除？" Visible="False" meta:resourcekey="lblDelConfirmResource1"></asp:Label>
    <asp:Label ID="lblEditTitle" runat="server" Text="新增/維護聊天室" Visible="False" meta:resourcekey="lblEditTitleResource1"></asp:Label>
    <asp:Label ID="lblEnabled" runat="server" Text="是" Visible="False" meta:resourcekey="lblEnabledResource1"></asp:Label>
    <asp:Label ID="lblDisabled" runat="server" Text="否" Visible="False" meta:resourcekey="lblDisabledResource1"></asp:Label>
</asp:Content>
