<%@ Page Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="EIP_Chat_Room" Title="對話室記錄" Culture="auto" UICulture="auto" meta:resourcekey="PageResource2" Codebehind="Room.aspx.cs" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>
<%@ Register Assembly="System.Web, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a" Namespace="System.Web.UI" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <script type="text/javascript">
        function RadToolBar1_ButtonClicking(sender, args) {
            var toolbar = sender;
            var value = args.get_item().get_value();

            if (value == "Config") {
                args.set_cancel(true);                
                $uof.dialog.open2("~/EIP/Chat/RoomConfig.aspx", args.get_item(), '<%=lblEditConfig.Text%>', 600, 250, OpenDialogResult, { "ROOM_ID": '<%=Request.QueryString["ROOM_ID"]%>' });                
            }
        }

        function OpenDialogResult(returnValue) {
            if (typeof (returnValue) == 'undefined')
                return false;
            else
                return true;
        }
    </script>
    <telerik:RadToolBar ID="RadToolBar1" runat="server" Width="100%" OnButtonClick="RadToolBar1_ButtonClick" OnClientButtonClicking="RadToolBar1_ButtonClicking" meta:resourcekey="RadToolBar1Resource2">
        <Items>
            <telerik:RadToolBarButton runat="server" CheckedImageUrl="~/Common/Images/Icon/icon_j05.gif" HoveredImageUrl="~/Common/Images/Icon/icon_j05.gif" ImageUrl="~/Common/Images/Icon/icon_j05.gif" Text="修改權限" Value="Config" meta:resourcekey="RadToolBarButtonResource6">
            </telerik:RadToolBarButton>
            <telerik:RadToolBarButton runat="server" IsSeparator="True" Text="Button 1" meta:resourcekey="RadToolBarButtonResource7">
            </telerik:RadToolBarButton>
            <telerik:RadToolBarButton runat="server" ClickedImageUrl="~/Common/Images/Icon/icon_m144.gif" HoveredImageUrl="~/Common/Images/Icon/icon_m144.gif" ImageUrl="~/Common/Images/Icon/icon_m144.gif" Text="匯出對話紀錄" Value="Export" meta:resourcekey="RadToolBarButtonResource8">
            </telerik:RadToolBarButton>
            <telerik:RadToolBarButton runat="server" IsSeparator="True" Text="Button 3" meta:resourcekey="RadToolBarButtonResource9">
            </telerik:RadToolBarButton>
            <telerik:RadToolBarButton runat="server" Text="Button 4" Value="Type" Visible="False" meta:resourcekey="RadToolBarButtonResource10">
                <ItemTemplate>
                    <asp:DropDownList ID="ddlExportType" runat="server" Enabled="False"
                        CssClass="aspNetDisabled aspNetDisabled aspNetDisabled aspNetDisabled" meta:resourcekey="ddlExportTypeResource2">

                        <asp:ListItem Text="Excel" Value="XLS" Selected="True" meta:resourcekey="ListItemResource3"></asp:ListItem>

                        <asp:ListItem Text="Xml" Value="XML" meta:resourcekey="ListItemResource4"></asp:ListItem>
                    </asp:DropDownList>
                </ItemTemplate>
            </telerik:RadToolBarButton>

        </Items>
    </telerik:RadToolBar>


    <table cellspacing="1" class="PopTable" width="100%">
        <tr>
            <td class="PopTableLeftTD">
                <asp:Label ID="Label1" runat="server" Text="對話室名稱" meta:resourcekey="Label1Resource2"></asp:Label>
            </td>
            <td class="PopTableRightTD">
                <asp:Label ID="lblRoomName" runat="server" meta:resourcekey="lblRoomNameResource2"></asp:Label>
            </td>
            <td class="PopTableLeftTD">
                <asp:Label ID="Label2" runat="server" Text="主席" meta:resourcekey="Label2Resource2"></asp:Label>
            </td>
            <td class="PopTableRightTD">
                <asp:Label ID="lblChairName" runat="server" meta:resourcekey="lblChairNameResource2"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="PopTableLeftTD">
                <asp:Label ID="Label3" runat="server" Text="期間" meta:resourcekey="Label3Resource2"></asp:Label>
            </td>
            <td class="PopTableRightTD">
                <asp:Label ID="lblCreateDate" runat="server" meta:resourcekey="lblCreateDateResource2"></asp:Label>
                <asp:Label ID="Label6" runat="server" Text="～" meta:resourcekey="Label6Resource2"></asp:Label>
                <asp:Label ID="lblCloseDate" runat="server" meta:resourcekey="lblCloseDateResource2"></asp:Label>
            </td>
            <td class="PopTableLeftTD">
                <asp:Label ID="Label4" runat="server" Text="結束原因" meta:resourcekey="Label4Resource2"></asp:Label>
            </td>
            <td class="PopTableRightTD">
                <asp:Label ID="lblCloseReason" runat="server" meta:resourcekey="lblCloseReasonResource2"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="PopTableLeftTD">
                <asp:Label ID="Label5" runat="server" Text="成員" meta:resourcekey="Label5Resource2"></asp:Label>
            </td>
            <td class="PopTableRightTD" colspan="3">
                <asp:Literal ID="ltlMember" runat="server" meta:resourcekey="ltlMemberResource2"></asp:Literal>
            </td>
        </tr>
    </table>

    <Fast:Grid ID="gridChatLog" runat="server" AllowPaging="True" AllowSorting="True"
        AutoGenerateCheckBoxColumn="False" AutoGenerateColumns="False"
        DataKeyNames="LOG_INDEX" Width="100%"
        DataKeyOnClientWithCheckBox="False"
        DefaultSortDirection="Descending" EnhancePager="True" PageSize="15"
        EmptyDataText="沒有資料"
        OnPageIndexChanging="gridChatLog_PageIndexChanging"
        OnRowDataBound="gridChatLog_RowDataBound"
        KeepSelectedRows="False"  meta:resourcekey="gridChatLogResource2"  >




        <EnhancePagerSettings FirstImageUrl="" FirstAltImageUrl="" PreviousImageUrl="" NextImageUrl="" LastImageUrl="" LastAltImage="" PageNumberCssClass="" PageNumberCurrentCssClass="" PageInfoCssClass="" PageRedirectCssClass="" NextIAltImageUrl="" PreviousAltImageUrl="" ShowHeaderPager="True"></EnhancePagerSettings>

        <ExportExcelSettings AllowExportToExcel="False"></ExportExcelSettings>
        <Columns>
            <asp:BoundField DataField="LOG_INDEX" HeaderText="索引" meta:resourcekey="BoundFieldResource5">
                <HeaderStyle Width="30px" />
                <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="CREATE_DATE" DataFormatString="{0:yyyy/MM/dd HH:mm:ss}"
                HeaderText="時間" meta:resourcekey="BoundFieldResource6">
                <HeaderStyle Width="140px" HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="MEMBER_NAME" HeaderText="成員" meta:resourcekey="BoundFieldResource7" />
            <asp:BoundField DataField="MESSAGE" HeaderText="訊息" meta:resourcekey="BoundFieldResource8" />
        </Columns>

    </Fast:Grid>
    <asp:Label ID="lblEditConfig" runat="server" Text="修改權限" Visible="False" meta:resourcekey="lblEditConfigResource2"></asp:Label>

    <asp:Label ID="lblMsgNull" runat="server" Text="正在使用" Visible="False" meta:resourcekey="lblMsgNullResource2"></asp:Label>

    <asp:Label ID="lblMsgNormal" runat="server" Text="正常關閉" Visible="False" meta:resourcekey="lblMsgNormalResource2"></asp:Label>

    <asp:Label ID="lblMsgTimeout" runat="server" Text="逾時" Visible="False" meta:resourcekey="lblMsgTimeoutResource2"></asp:Label>

</asp:Content>

