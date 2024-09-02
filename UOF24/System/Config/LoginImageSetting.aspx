<%@ Page Title="" Language="C#" MasterPageFile="~/Master/DefaultMasterPage.master" AutoEventWireup="true" CodeBehind="LoginImageSetting.aspx.cs" Inherits="System_Config_LoginImageSetting" meta:resourcekey="PageResource1" culture="auto" uiculture="auto"%>
<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style type="text/css">
        .rowcontent {
          
            line-height: normal;  
            vertical-align:middle;
        }
        .rowcontent td {    
            vertical-align:middle;          
        }
    </style>
    <script type="text/javascript">
        function RadToolBar_ButtonClicking(sender, args) {
            var Key = args.get_item().get_value();

            if (Key == "Insert") {
                args.set_cancel(true);
                $uof.dialog.open2("~/System/Config/EditLoginImg.aspx", args.get_item(), "<%= lblDialogTitle.Text %>", 550, 500, OpenDialogResult);
            }

            if (Key == "Delete") {
                if (!confirm('<%= lblDeleteTitle.Text%>')) {
                    args.set_cancel(true);
                }
                else {
                    args.set_cancel(false);
                }
            }
        }

        function OpenDialogResult(returnValue) {
            if (typeof (returnValue) == "undefined" || returnValue == null) {
                return false;
            }
            else {
                return true;
            }
        }
    </script>

    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>
        <table style="width: 100%">
            <tr>
                <td>
                    <telerik:RadToolBar ID="RadToolBarLoginImg" runat="server" Width="100%"
                        OnButtonClick="RadToolBar_ButtonClick"
                        OnClientButtonClicking="RadToolBar_ButtonClicking"
                        meta:resourcekey="RadToolBarLoginImgResource1" SingleClick="None">
                        <Items>
                            <telerik:RadToolBarButton runat="server" Value="Insert" Text="新增" meta:resourcekey="InsertResource1"
                                DisabledImageUrl="~/Common/Images/Icon/icon_m71.png" HoveredImageUrl="~/Common/Images/Icon/icon_m71.png"
                                ImageUrl="~/Common/Images/Icon/icon_m71.png"
                                CheckedImageUrl="~/Common/Images/Icon/icon_m71.png">
                            </telerik:RadToolBarButton>
                            <telerik:RadToolBarButton runat="server" IsSeparator="True"
                                meta:resourcekey="RadToolBarButtonResource1">
                            </telerik:RadToolBarButton>
                            <telerik:RadToolBarButton runat="server" Value="Delete" Text="刪除" meta:resourcekey="DeleteResource1"
                                DisabledImageUrl="~/Common/Images/Icon/icon_m03.png" HoveredImageUrl="~/Common/Images/Icon/icon_m03.png"
                                ImageUrl="~/Common/Images/Icon/icon_m03.png"
                                CheckedImageUrl="~/Common/Images/Icon/icon_m03.png">
                            </telerik:RadToolBarButton>
                            <telerik:RadToolBarButton runat="server" IsSeparator="True"
                                meta:resourcekey="RadToolBarButtonResource2">
                            </telerik:RadToolBarButton>
                            <telerik:RadToolBarButton runat="server" Value="LoginImgSafeZone" meta:resourcekey="RadToolBarButtonResource4">
                                <ItemTemplate>
                                    <table>
                                        <tr>
                                            <td>
                                                <asp:HyperLink ID="hySafeZone" runat="server" NavigateUrl="~/System/Config/Image/LoginImgSafeZone.png" Text="UOF登入底圖製作說明" Target="_blank"
                                                    meta:resourcekey="hySafeZoneResource1"></asp:HyperLink>
                                            </td>
                                        </tr>
                                    </table>
                                </ItemTemplate>
                            </telerik:RadToolBarButton>
                            <telerik:RadToolBarButton runat="server" IsSeparator="True"
                                meta:resourcekey="RadToolBarButtonResource5">
                            </telerik:RadToolBarButton>
                            <telerik:RadToolBarButton runat="server" Value="LoginEnable" meta:resourcekey="RadToolBarButtonResource3">
                                <ItemTemplate>
                                    <table>
                                        <tr>
                                            <td>
                                                <asp:CheckBox ID="chkCusLoginEnable" runat="server" Text="啟用自訂登入頁面" AutoPostBack="True" OnCheckedChanged="chkCusLoginEnable_CheckedChanged" meta:resourcekey="chkCusLoginEnableResource1">
                                                </asp:CheckBox>
                                                <asp:Label ID="lblMemo" runat="server" CssClass="SizeMemo" Text="啟用後，列表中的登入頁面才會依設定時間自動上下架"
                                                    meta:resourcekey="lblMemoResource1"></asp:Label>
                                            </td>
                                        </tr>
                                    </table>
                                </ItemTemplate>
                            </telerik:RadToolBarButton>
                        </Items>
                    </telerik:RadToolBar>
                </td>
            </tr>
            <tr>
                <td class="rowcontent">
                    <Fast:Grid ID="gridLoginImg" runat="server" AllowSorting="True" AutoGenerateCheckBoxColumn="True"
                        AutoGenerateColumns="False" DataKeyNames="LOGIN_IMAGE_GUID" AllowPaging="True" 
                        DataKeyOnClientWithCheckBox="False" EnhancePager="True"
                        OnPageIndexChanging="gridLoginImg_PageIndexChanging"
                        OnRowDataBound="gridLoginImg_RowDataBound" PageSize="15"
                        Width="100%" EmptyDataText="沒有資料" meta:resourcekey="gridLoginImgResource1"
                        KeepSelectedRows="False" CustomDropDownListPage="False" SelectedRowColor="" UnSelectedRowColor="" DefaultSortDirection="Ascending">
                        <EnhancePagerSettings ShowHeaderPager="True" FirstAltImageUrl="" FirstImageUrl="" LastAltImage="" LastImageUrl="" NextIAltImageUrl="" NextImageUrl="" PageInfoCssClass="" PageNumberCssClass="" PageNumberCurrentCssClass="" PageRedirectCssClass="" PreviousAltImageUrl="" PreviousImageUrl="" />
                        <ExportExcelSettings AllowExportToExcel="False" />
                        <Columns>
                            <asp:TemplateField HeaderText="名稱" meta:resourcekey="TemplateFieldResource1">
                                <ItemTemplate>
                                    <asp:LinkButton ID="lbtnLoginImageName" runat="server" OnClick="lbtnLoginImageName_Click" meta:resourcekey="lbtnLoginImageNameResource1"></asp:LinkButton>
                                </ItemTemplate>
                                <HeaderStyle Wrap="False"></HeaderStyle>
                                <ItemStyle Wrap="False" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="背景圖" meta:resourcekey="TemplateFieldResource2">
                                <ItemTemplate>
                                    <asp:HyperLink ID="hlkImgLogin" runat="server" Target="_blank"  meta:resourcekey="hlkImgLoginResource1"></asp:HyperLink>
                                </ItemTemplate>
                                <HeaderStyle Wrap="False" Width="260px"/>                                 
                                <ItemStyle Height="260px" Width="260px" HorizontalAlign="Center"/>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="登入區色系" meta:resourcekey="TemplateFieldResource3">
                                <ItemTemplate>
                                    <asp:TextBox ID="txtLoginColorClass" runat="server" Width="150px" ReadOnly="True" meta:resourcekey="txtLoginColorClassResource1"></asp:TextBox>
                                </ItemTemplate>
                                <HeaderStyle Wrap="False" Width="150px"></HeaderStyle>
                                <ItemStyle Wrap="False" Width="150px"/>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="預設值" meta:resourcekey="TemplateFieldResource6">
                                <ItemTemplate>
                                    <asp:Label ID="lblISDefault" runat="server" meta:resourcekey="lblISDefaultResource1"></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle Wrap="False"></HeaderStyle>
                                <ItemStyle Wrap="False" HorizontalAlign="Center"/>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="上架時間" meta:resourcekey="TemplateFieldResource4">
                                <ItemTemplate>
                                    <asp:Label ID="lblStartDate" runat="server" meta:resourcekey="lblStartDateResource1"></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle Wrap="False"></HeaderStyle>
                                <ItemStyle Wrap="False" HorizontalAlign="Center"/>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="下架時間" meta:resourcekey="TemplateFieldResource5">
                                <ItemTemplate>
                                    <asp:Label ID="lblEndDate" runat="server" meta:resourcekey="lblEndDateResource1"></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle Wrap="False"></HeaderStyle>
                                <ItemStyle Wrap="False" HorizontalAlign="Center"/>
                            </asp:TemplateField>
                        </Columns>
                    </Fast:Grid>
                </td>
            </tr>
        </table>

        <asp:Label ID="lblDialogTitle" runat="server" Text="自訂登入頁面維護" Style="display: none" meta:resourcekey="lblDialogTitleResource1"></asp:Label>
        <asp:Label ID="lblDeleteTitle" runat="server" Text="確定刪除?" Style="display: none" meta:resourcekey="lblDeleteTitleResource1"></asp:Label>
        <asp:Label ID="lblYesTitle" runat="server" Text="是" Style="display: none" meta:resourcekey="lblYesTitleResource1"></asp:Label>
        <asp:Label ID="lblNOTitle" runat="server" Text="否" Style="display: none" meta:resourcekey="lblNOTitleResource1"></asp:Label>
        <asp:Label ID="lblNow" runat="server" Text="立即上架" Style="display: none" meta:resourcekey="lblNowResource1"></asp:Label>
        <asp:Label ID="lblForever" runat="server" Text="永不下架" Style="display: none" meta:resourcekey="lblForeverResource1"></asp:Label>
    </ContentTemplate>
</asp:UpdatePanel>
</asp:Content>
