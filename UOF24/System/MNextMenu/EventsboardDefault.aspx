<%@ Page Title="" Language="C#" MasterPageFile="~/Master/DefaultMasterPage.master" AutoEventWireup="true" CodeBehind="EventsboardDefault.aspx.cs" Inherits="System_MNextMenu_EventsboardDefault" Culture="auto" meta:resourcekey="PageResource2" UICulture="auto" %>

<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Ede" %>
<%@ Register Src="~/Common/ChoiceCenter/UC_ChoiceList.ascx" TagPrefix="uc1" TagName="UC_ChoiceList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script type="text/javascript">
         function RadToolEventsboard_ButtonClicking(sender, args) {
            var value = args.get_item().get_value();
            if (value == "Insert") {
                $uof.dialog.open2("~/System/MNextMenu/EventsboardEdit.aspx", args.get_item(), '<%=lbldialogTitle.Text %>', 600, 600, OpenDialogResult);               
            }
            else if (value == "Delete") {
                 args.set_cancel(!confirm('<%=lbConfirmDelete.Text %>'));
            }
            else if (value == 'change') {
                $uof.dialog.open2("~/System/MNextMenu/EventsBoardOrderEdit.aspx", args.get_item(), '<%=lblEditOrderTitle.Text%>', 500, 600,
                    function (returnValue) {
                        return true;
                    });
            }
        }

         function OpenDialogResult(returnValue) {
            if (typeof (returnValue) == "undefined")
                return false;
            else
                return true;
        }
    </script>
    <style type="text/css">
        .lbtnUpPadding {
            padding-left: 5px;
            width: 65px;
        }

        .toolbarAlign {
            margin-bottom: 0.38em;
        }

        .GridItem {
            border-width: 1px;
            border-style: solid;
            line-height: normal;  
            vertical-align: middle;
        }
        .GridItem td, .GridItemAlternating td {    
            vertical-align: middle;
        }
    </style>
    <asp:UpdatePanel ID="upEventboard" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <telerik:RadToolBar ID="radtoolEventboard" runat="server" Width="100%" OnButtonClick="radtoolEventboard_ButtonClick" OnClientButtonClicking="RadToolEventsboard_ButtonClicking" meta:resourcekey="radtoolEventboardResource2" SingleClick="None">
                <Items>
                    <telerik:RadToolBarButton runat="server" Value="Insert" Text="新增" CssClass="toolbarAlign"
                        ClickedImageUrl="~/Common/Images/Icon/icon_m71.png" DisabledImageUrl="~/Common/Images/Icon/icon_m71.png"
                        HoveredImageUrl="~/Common/Images/Icon/icon_m71.png" ImageUrl="~/Common/Images/Icon/icon_m71.png" meta:resourcekey="RadToolBarButtonResource8">
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton runat="server" IsSeparator="True" meta:resourcekey="RadToolBarButtonResource9"></telerik:RadToolBarButton>
                    <telerik:RadToolBarButton runat="server" Value="Delete" Text="刪除" CssClass="toolbarAlign"
                        DisabledImageUrl="~/Common/Images/Icon/icon_m03.png" HoveredImageUrl="~/Common/Images/Icon/icon_m03.png"
                        ImageUrl="~/Common/Images/Icon/icon_m03.png" CheckedImageUrl="~/Common/Images/Icon/icon_m03.png" meta:resourcekey="RadToolBarButtonResource10">
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton runat="server" IsSeparator="True" meta:resourcekey="RadToolBarButtonResource11"></telerik:RadToolBarButton>
                    <telerik:RadToolBarButton runat="server" Value="change" Text="調整順序" CssClass="toolbarAlign"
                        CheckedImageUrl="~/Common/Images/Icon/icon_m38.gif"
                        DisabledImageUrl="~/Common/Images/Icon/icon_m38.gif"
                        HoveredImageUrl="~/Common/Images/Icon/icon_m38.gif"
                        ImageUrl="~/Common/Images/Icon/icon_m38.gif" meta:resourcekey="RadToolBarButtonResource15">
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton runat="server" IsSeparator="True"></telerik:RadToolBarButton>
                    <telerik:RadToolBarButton Value="status">
                        <ItemTemplate>
                            <asp:Label ID="lblStatus" runat="server" Text="狀態：" meta:resourcekey="lblStatusResource1"></asp:Label>
                            <asp:DropDownList ID="ddlStatus" AutoPostBack="true" OnSelectedIndexChanged="ddlStatus_SelectedIndexChanged" runat="server">
                                <asp:ListItem Text="全部" Value="All" Selected="True" meta:resourcekey="ListItemResource4"></asp:ListItem>
                                <asp:ListItem Text="已上架 " Value="Publish" meta:resourcekey="ListItemResource5"></asp:ListItem>
                                <asp:ListItem Text="待上架" Value="Waiting" meta:resourcekey="ListItemResource6"></asp:ListItem>
                                <asp:ListItem Text="已下架" Value="Expire" meta:resourcekey="ListItemResource7"></asp:ListItem>
                            </asp:DropDownList>
                            <asp:Label ID="lblAddLimit" runat="server" ForeColor="Blue"></asp:Label>
                        </ItemTemplate>
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton runat="server" IsSeparator="True" meta:resourcekey="RadToolBarButtonResource11"></telerik:RadToolBarButton>
                    <telerik:RadToolBarButton runat="server" Value="EventboardInfo" meta:resourcekey="RadToolBarButtonResource12">
                        <ItemTemplate>
                            <table>
                                <tr>
                                    <td>
                                        <asp:HyperLink ID="hyImgInfo" runat="server" NavigateUrl="~/System/MNextMenu/Image/EventsboardInfo.png" Text="製圖說明" Target="_blank" meta:resourcekey="hyImgInfoResource2"></asp:HyperLink>
                                    </td>
                                </tr>
                            </table>
                        </ItemTemplate>
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton runat="server" IsSeparator="True" meta:resourcekey="RadToolBarButtonResource13"></telerik:RadToolBarButton>
                    <telerik:RadToolBarButton runat="server" Value="EventboardMsg" meta:resourcekey="RadToolBarButtonResource14">
                        <ItemTemplate>
                            <asp:Label ID="lblEventboardMsg" runat="server" Text="*最多可設定30張圖片" ForeColor="Blue" meta:resourcekey="lblEventboardMsgResource2"></asp:Label>
                        </ItemTemplate>
                    </telerik:RadToolBarButton>
                </Items>
            </telerik:RadToolBar>
            <Ede:Grid ID="gridEventboard" runat="server" AutoGenerateCheckBoxColumn="True" AutoGenerateColumns="False" CustomDropDownListPage="False"           
                DataKeyOnClientWithCheckBox="False"
                EmptyDataText="沒有資料" EnhancePager="True" KeepSelectedRows="False" DataKeyNames="EVENTS_GUID" OnRowDataBound="gridEventboard_RowDataBound" Width="100%" 
                AllowSorting="True" DefaultSortDirection="Ascending" meta:resourcekey="gridEventboardResource2" PageSize="15" SelectedRowColor="" UnSelectedRowColor="">
                <EnhancePagerSettings ShowHeaderPager="False"></EnhancePagerSettings>
                <ExportExcelSettings AllowExportToExcel="False"></ExportExcelSettings>
                <Columns>
                    <asp:TemplateField HeaderText="順序" meta:resourcekey="TemplateFieldResource1">
                        <ItemTemplate>   
                            <asp:Label ID="lblSeqNo" runat="server" Text='<%#Container.DataItemIndex+1 %>'></asp:Label>   
                        </ItemTemplate> 
                        <HeaderStyle Wrap="false" Width="50px" />
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="名稱" meta:resourcekey="TemplateFieldResource7">
                        <ItemTemplate>
                            <table style="max-width: 400px; white-space: normal;">
                                <tr>
                                    <td style="max-width: 400px; word-break: break-all;">
                                        <asp:LinkButton runat="server" ID="lbtnEventboardName" OnClick="lbtnEventboardName_Click" meta:resourcekey="lbtnEventboardNameResource2"></asp:LinkButton>
                                    </td>
                                </tr>
                            </table>
                        </ItemTemplate>
                        <HeaderStyle Wrap="False" Width="320px" HorizontalAlign="Center" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="內容" meta:resourcekey="TemplateFieldResource8">
                        <ItemTemplate>
                            <asp:HyperLink ID="imgInfo" runat="server" style="max-height: 200px;max-width: 375px;" Target="_blank" meta:resourcekey="imgInfoResource2" />
                        </ItemTemplate>
                        <HeaderStyle Wrap="False" Width="400px" HorizontalAlign="Center" />
                        <ItemStyle Wrap="False" Width="400px" HorizontalAlign="Center" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="上架時間" meta:resourcekey="TemplateFieldResource9">
                        <ItemTemplate>
                            <asp:Label ID="lblPunlishDate" runat="server" Text="Label" meta:resourcekey="lblPunlishDateResource2"></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle Wrap="False" Width="200px" HorizontalAlign="Center" />
                        <ItemStyle Wrap="False" Width="200px" HorizontalAlign="Left" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="下架時間" meta:resourcekey="TemplateFieldResource10">
                        <ItemTemplate>
                            <asp:Label ID="lblExpireDate" runat="server" Text="Label" meta:resourcekey="lblExpireDateResource2"></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle Wrap="False" Width="200px" HorizontalAlign="Center" />
                        <ItemStyle Wrap="False" Width="200px" HorizontalAlign="Left" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="狀態" meta:resourcekey="TemplateFieldStatusResource1">
                        <ItemTemplate>
                            <asp:Label ID="lblStatus" runat="server"></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle Wrap="False" />
                        <ItemStyle  Wrap="false" HorizontalAlign="Center" Width="150" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="可觀看人員" meta:resourcekey="TemplateFieldUserSetResource1">
                        <ItemTemplate>
                            <uc1:UC_ChoiceList runat="server" ID="UC_ChoiceListUser" IsAllowEdit="false" TreeHeight="200" />
                        </ItemTemplate>
                        <HeaderStyle Wrap="False" />
                        <ItemStyle Width="400px" />
                    </asp:TemplateField>
                </Columns>
            </Ede:Grid>
        </ContentTemplate>
    </asp:UpdatePanel>
    <asp:Label ID="lbConfirmDelete" runat="server" Text="確定刪除?" Visible="False" meta:resourcekey="lbConfirmDeleteResource2"></asp:Label>
    <asp:Label ID="lbldialogTitle" runat="server" Text="新增/維護活動內容" Visible="False" meta:resourcekey="lbldialogTitleResource2"></asp:Label>
    <asp:Label ID="lblyes" runat="server" Text="是" Visible="False" meta:resourcekey="lblyesResource2"></asp:Label>
    <asp:Label ID="lblno" runat="server" Text="否" Visible="False" meta:resourcekey="lblnoResource2"></asp:Label>
    <asp:Label ID="lblnoExpire" runat="server" Text="永不下架" Visible="False" meta:resourcekey="lblnoExpireResource2"></asp:Label>
    <asp:Label ID="lblPublish" runat="server" Text="已上架" Visible="false" meta:resourcekey="ListItemResource5"></asp:Label>
    <asp:Label ID="lblWaiting" runat="server" Text="待上架" Visible="false" meta:resourcekey="ListItemResource6"></asp:Label>
    <asp:Label ID="lblExpire" runat="server" Text="已下架" Visible="false" meta:resourcekey="ListItemResource7"></asp:Label>
    <asp:Label ID="lblEditOrderTitle" runat="server" Text="調整播放順序" Visible="False" meta:resourcekey="lblEditOrderTitleResource1"></asp:Label>
    <asp:HiddenField ID="hfCurrentGuid" runat="server" />
    <asp:HiddenField ID="hfOrderCount" runat="server" />
</asp:Content>
