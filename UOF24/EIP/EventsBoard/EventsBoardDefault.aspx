<%@ Page Title="" Language="C#" MasterPageFile="~/Master/DefaultMasterPage.master" AutoEventWireup="true" CodeBehind="EventsBoardDefault.aspx.cs" Inherits="Ede.Uof.Web.EIP.EventsBoard.EventsBoardDefault" culture="auto" meta:resourcekey="PageResource2" uiculture="auto" %>

<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Ede" %>
<%@ Register Src="~/Common/ChoiceCenter/UC_ChoiceList.ascx" TagPrefix="uc1" TagName="UC_ChoiceList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">    
        <style type="text/css">
        .rowcontent {
            border-width: 1px;
            border-style: solid;
            line-height: normal;  
            vertical-align:middle;
        }
        .rowcontent td {    
            vertical-align:middle;          
        }
        .toolbarAlign{
            margin-bottom: 0.38em;
        }
    </style>
    <script  type="text/javascript">

        function radButtonClicking(sender, args) {
            var key = args.get_item().get_value();
            if (key == 'create') {
                $uof.dialog.open2("~/EIP/EventsBoard/EventsBoardEdit.aspx", args.get_item(), '<%=lblEditTitle.Text%>', 550, 600, OpenDialogResult);
            }
            else if (key == 'delete') {
                if (!confirm('<%=lblDelConfirm.Text%>')) {
                    args.set_cancel(true);
                }
            }
            else if (key == 'change') {
                $uof.dialog.open2("~/EIP/EventsBoard/EventsBoardOrderEdit.aspx", args.get_item(), '<%=lblEditOrderTitle.Text%>', 500, 600,
                                function (returnValue) {
                                    return true;
                                });
            }
        }
    
        function OnValueChange(sender, args) {
            var newValue = args.get_newValue();            
            if (newValue == '' || isNaN(newValue) || newValue == null) {
                args.set_cancel(true);
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
    <asp:UpdatePanel runat="server" ID="tabUpdatpanel" >
        <ContentTemplate>
            <telerik:RadTabStrip ID="radBoardTab" AutoPostBack="True" MultiPageID="radSettingPage" BackColor="White" runat="server" SelectedIndex="0" OnTabClick="radBoardTab_TabClick" meta:resourcekey="radBoardTabResource1">
                <Tabs>
                    <telerik:RadTab Text="活動看板" Value="events" Selected="True" runat="server" meta:resourcekey="RadTabResource1"></telerik:RadTab>
                    <telerik:RadTab Text="基本設定" Value="basicSet" runat="server" meta:resourcekey="RadTabResource2"></telerik:RadTab>
                </Tabs>
            </telerik:RadTabStrip>
            <telerik:RadMultiPage ID="radSettingPage" runat="server" meta:resourcekey="radSettingPageResource1" SelectedIndex="0">
                <telerik:RadPageView ID="events" runat="server" Selected="True" meta:resourcekey="eventsResource1">                                               
                    <telerik:RadToolBar ID="radToolBar" runat="server" Width="100%" OnClientButtonClicking="radButtonClicking" OnButtonClick="radToolBar_ButtonClick" meta:resourcekey="radToolBarResource1" SingleClick="None">
                        <Items>
                            <telerik:RadToolBarButton runat="server" Value="create" Text="新增" CssClass="toolbarAlign"
                                CheckedImageUrl="~/Common/Images/Icon/icon_m59.gif"
                                DisabledImageUrl="~/Common/Images/Icon/icon_m59.gif"
                                HoveredImageUrl="~/Common/Images/Icon/icon_m59.gif"
                                ImageUrl="~/Common/Images/Icon/icon_m59.gif" meta:resourcekey="RadToolBarButtonResource1"></telerik:RadToolBarButton>
                            <telerik:RadToolBarButton runat="server" IsSeparator="True" meta:resourcekey="RadToolBarButtonResource2"></telerik:RadToolBarButton>
                            <telerik:RadToolBarButton runat="server" Value="delete"  Text="刪除" CssClass="toolbarAlign"
                                CheckedImageUrl="~/Common/Images/Icon/icon_m03.gif"
                                DisabledImageUrl="~/Common/Images/Icon/icon_m03.gif"
                                HoveredImageUrl="~/Common/Images/Icon/icon_m03.gif"
                                ImageUrl="~/Common/Images/Icon/icon_m03.gif" meta:resourcekey="RadToolBarButtonResource3">
                            </telerik:RadToolBarButton>
                            <telerik:RadToolBarButton runat="server" IsSeparator="True" meta:resourcekey="RadToolBarButtonResource4"></telerik:RadToolBarButton>
                            <telerik:RadToolBarButton runat="server" Value="change"  Text="調整順序" CssClass="toolbarAlign"
                                CheckedImageUrl="~/Common/Images/Icon/icon_m38.gif"
                                DisabledImageUrl="~/Common/Images/Icon/icon_m38.gif"
                                HoveredImageUrl="~/Common/Images/Icon/icon_m38.gif"
                                ImageUrl="~/Common/Images/Icon/icon_m38.gif" meta:resourcekey="RadToolBarButtonResource8">
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
                        </Items>
                    </telerik:RadToolBar>                                          
                    <Ede:Grid ID="boardGrid" runat="server"  Width="100%" AutoGenerateCheckBoxColumn="True" DataKeyNames="EVENTS_GUID" OnRowDataBound="boardGrid_RowDataBound"
                                AllowSorting="True" CustomDropDownListPage="False" DataKeyOnClientWithCheckBox="False" AutoGenerateColumns="False" 
                            DefaultSortDirection="Ascending" EmptyDataText="沒有資料" EnhancePager="True" KeepSelectedRows="False" PageSize="15"  CssClass="rowcontent" meta:resourcekey="boardGridResource1" SelectedRowColor="" UnSelectedRowColor="">
                            <EnhancePagerSettings FirstAltImageUrl="" FirstImageUrl="" LastAltImage="" LastImageUrl="" NextIAltImageUrl="" NextImageUrl="" PageInfoCssClass="" PageNumberCssClass="" PageNumberCurrentCssClass="" PageRedirectCssClass="" PreviousAltImageUrl="" PreviousImageUrl="" ShowHeaderPager="True"/>
                            <ExportExcelSettings AllowExportToExcel="False" />                           
                        <Columns>
                            <asp:TemplateField HeaderText="順序"  meta:resourcekey="TemplateFieldResource7">
                                <ItemTemplate>   
                                    <asp:Label ID="lblSeqNo" runat="server" Text='<%#Container.DataItemIndex+1 %>'></asp:Label>   
                                </ItemTemplate> 
                                <HeaderStyle Wrap="false" Width="50px" />
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="名稱" meta:resourcekey="TemplateFieldResource1">
                                <ItemTemplate>
                                    <asp:LinkButton ID="lbtnEventsName" runat="server" meta:resourcekey="lbtnEventsNameResource1"></asp:LinkButton>
                                </ItemTemplate>
                                <HeaderStyle Wrap="False" Width="320" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="內容" meta:resourcekey="TemplateFieldResource2">
                                <ItemTemplate>
                                    <asp:HyperLink ID="hlkPhoto" runat="server" Target="_blank" meta:resourcekey="hlkPhotoResource1" ></asp:HyperLink>                                                               
                                </ItemTemplate>
                                <HeaderStyle Wrap="False" />                                 
                                <ItemStyle Height="135px" Width="160px" HorizontalAlign="Center"/>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="上架時間" meta:resourcekey="TemplateFieldResource3">
                                <ItemTemplate>
                                    <asp:Label ID="lblPublishDate" runat="server" meta:resourcekey="lblPublishDateResource1"></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle Wrap="False" />
                                <ItemStyle Width="200" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="下架時間" meta:resourcekey="TemplateFieldResource4">
                                <ItemTemplate>
                                    <asp:Label ID="lblExpireDate" runat="server" meta:resourcekey="lblExpireDateResource1"></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle Wrap="False" />
                                <ItemStyle Width="200" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="狀態" meta:resourcekey="TemplateFieldResource6">
                                <ItemTemplate>
                                    <asp:Label ID="lblStatus" runat="server"></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle Wrap="False" />
                                <ItemStyle  HorizontalAlign="Center" Width="150"/>
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
                </telerik:RadPageView>
                <telerik:RadPageView ID="basicSet" runat="server" meta:resourcekey="basicSetResource1">
                    <asp:UpdatePanel runat="server">
                        <ContentTemplate>
                            <telerik:RadToolBar ID="radSettingToolBar" runat="server" Width="100%" OnButtonClick="radSettingToolBar_ButtonClick" meta:resourcekey="radSettingToolBarResource1" SingleClick="None" >
                                <Items>
                                     <telerik:RadToolBarButton runat="server" Text="儲存" DisabledImageUrl="~/Common/Images/Icon/icon_m66.png"
                                                HoveredImageUrl="~/Common/Images/Icon/icon_m66.png" ImageUrl="~/Common/Images/Icon/icon_m66.png"
                                                CheckedImageUrl="~/Common/Images/Icon/icon_m66.png" Value="Save" meta:resourcekey="RadToolBarButtonResource5">
                                    </telerik:RadToolBarButton>
                                    <telerik:RadToolBarButton runat="server" IsSeparator="True" meta:resourcekey="RadToolBarButtonResource6" />
                                    <telerik:RadToolBarButton runat="server" Value="hasSave" meta:resourcekey="RadToolBarButtonResource7">
                                        <ItemTemplate>
                                            <asp:Label runat="server" ID="lalSaveMsg" Text="己儲存" ForeColor="Blue" Visible="False" meta:resourcekey="lalSaveMsgResource1" ></asp:Label>
                                        </ItemTemplate>
                                    </telerik:RadToolBarButton>
                                </Items>
                            </telerik:RadToolBar>
                            <table class="PopTable" style="width:100%">
                                <tr>                
                                    <td style="vertical-align:middle">
                                        <asp:Label ID="lblMarkOne" runat="server" Text="*" ForeColor="Red" meta:resourcekey="lblMarkOneResource1"></asp:Label>
                                        <asp:Label ID="lblBoardHeight" runat="server" Text="面板高度" meta:resourcekey="lblBoardHeightResource1" ></asp:Label>
                                    </td>
                                    <td>
                                        <table>
                                            <tr>
                                                <td>
                                                    <tr style="white-space:nowrap">
                                                        <td>
                                                            <asp:Label ID="lblOneColumn" runat="server" Text="一欄式"  meta:resourcekey="lblOneColumnResource1" ></asp:Label>
                                                        </td>
                                                        <td style="width:110px;height:30px">
                                                            <telerik:RadNumericTextBox ID="radtxtOneColumn" runat="server" Width="100px"
                                                                    MinValue="100" MaxValue="900" Culture="zh-TW" DbValueFactor="1" LabelWidth="64px" meta:resourcekey="radtxtOneColumnResource1">
                                                                <NegativeStyle Resize="None" />
                                                                <NumberFormat DecimalDigits="0" ZeroPattern="n" />
                                                                <ClientEvents OnValueChanging="OnValueChange" />
                                                                <EmptyMessageStyle Resize="None" />
                                                                <ReadOnlyStyle Resize="None" />
                                                                <FocusedStyle Resize="None" />
                                                                <DisabledStyle Resize="None" />
                                                                <InvalidStyle Resize="None" />
                                                                <HoveredStyle Resize="None" />
                                                                <EnabledStyle Resize="None" />
                                                            </telerik:RadNumericTextBox>                              
                                                        </td>
                                                        <td>
                                                            <asp:Label ID="lblPrompt1" runat="server" Text="px(100~900px)" meta:resourcekey="lblPrompt1Resource1"></asp:Label>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="width:100px">
                                                            <asp:Label ID="lblTwoColumn" runat="server" Text="二欄式" meta:resourcekey="lblTwoColumnResource1" ></asp:Label>
                                                        </td>
                                                        <td style="height:30px">                     
                                                            <telerik:RadNumericTextBox ID="radtxtTwoColumn" runat="server" Width="100px"
                                                                MinValue="100" MaxValue="900" Culture="zh-TW" DbValueFactor="1" LabelWidth="64px" meta:resourcekey="radtxtTwoColumnResource1" >
                                                                <NegativeStyle Resize="None" />
                                                                <NumberFormat DecimalDigits="0" ZeroPattern="n" />
                                                                <ClientEvents OnValueChanging="OnValueChange" />
                                                                <EmptyMessageStyle Resize="None" />
                                                                <ReadOnlyStyle Resize="None" />
                                                                <FocusedStyle Resize="None" />
                                                                <DisabledStyle Resize="None" />
                                                                <InvalidStyle Resize="None" />
                                                                <HoveredStyle Resize="None" />
                                                                <EnabledStyle Resize="None" />
                                                            </telerik:RadNumericTextBox>                                                       
                                                        </td>
                                                        <td>
                                                            <asp:Label ID="lblPrompt2" runat="server" Text="px(100~900px)" meta:resourcekey="lblPrompt2Resource1"></asp:Label>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <asp:Label ID="lblThreeColumn" runat="server" Text="三欄式" meta:resourcekey="lblThreeColumnResource1" ></asp:Label>
                                                        </td>
                                                        <td style="height:30px">
                                                            <telerik:RadNumericTextBox ID="radtxtTreeColumn" runat="server" Width="100px"
                                                                MinValue="100" MaxValue="900" Culture="zh-TW" DbValueFactor="1" LabelWidth="64px" meta:resourcekey="radtxtTreeColumnResource1">
                                                                <NegativeStyle Resize="None" />
                                                                <NumberFormat DecimalDigits="0" ZeroPattern="n" />
                                                                <ClientEvents OnValueChanging="OnValueChange" />
                                                                <EmptyMessageStyle Resize="None" />
                                                                <ReadOnlyStyle Resize="None" />
                                                                <FocusedStyle Resize="None" />
                                                                <DisabledStyle Resize="None" />
                                                                <InvalidStyle Resize="None" />
                                                                <HoveredStyle Resize="None" />
                                                                <EnabledStyle Resize="None" />
                                                            </telerik:RadNumericTextBox>                                                     
                                                        </td>
                                                        <td>
                                                            <asp:Label ID="lblPrompt3" runat="server" Text="px(100~900px)" meta:resourcekey="lblPrompt3Resource1"></asp:Label>
                                                        </td>
                                                    </tr>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <tr>
                                                    <td colspan="3">
                                                        <asp:Label ID="lblPrompt" runat="server" Text="面板中的圖片會依此設定等比例縮放" ForeColor="Blue" meta:resourcekey="lblPromptResource1"></asp:Label>
                                                        <asp:LinkButton ID="lbtnSettingExample" Font-Underline="True" runat="server" Text="範例說明" meta:resourcekey="lbtnSettingExampleResource1"></asp:LinkButton>
                                                    </td>
                                                </tr>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="lblMarkTwo" runat="server" Text="*" ForeColor="Red" meta:resourcekey="lblMarkTwoResource1"></asp:Label>
                                        <asp:Label ID="lblSpeed" runat="server" Text="播放速度" meta:resourcekey="lblSpeedResource1" ></asp:Label>
                                    </td>
                                    <td style="text-wrap:none">
                                        <asp:RadioButtonList ID="rbtnSpeed" runat="server" RepeatDirection="Horizontal"  AutoPostBack="True" OnSelectedIndexChanged="rbtnSpeed_SelectedIndexChanged" meta:resourcekey="rbtnSpeedResource1">
                                            <asp:ListItem Value="2" meta:resourcekey="ListItemResource1">快</asp:ListItem>
                                            <asp:ListItem Value="4" meta:resourcekey="ListItemResource2">中</asp:ListItem>
                                            <asp:ListItem Value="8" meta:resourcekey="ListItemResource3">慢</asp:ListItem>
                                        </asp:RadioButtonList>
                                    </td>
                                </tr>
                            </table>
                             <asp:HiddenField ID="hidIsEdit" runat="server" Value="N" />
                        </ContentTemplate>
                    </asp:UpdatePanel>     
                </telerik:RadPageView>
            </telerik:RadMultiPage>
    </ContentTemplate>
</asp:UpdatePanel>

<asp:Label ID="lblDelConfirm" runat="server" Text="確定要刪除以下看板?" Visible="False" meta:resourcekey="lblDelConfirmResource1"></asp:Label>
<asp:Label ID="lblEditTitle" runat="server" Text="新增/維護活動內容"  Visible="False" meta:resourcekey="lblEditTitleResource1"></asp:Label>
<asp:Label ID="lblEditOrderTitle" runat="server" Text="調整播放順序" Visible="False" meta:resourcekey="lblEditOrderTitleResource1"></asp:Label>
<asp:Label ID="lblAlwaysOpen" runat="server" Text="永久開放"  Visible="False" meta:resourcekey="lblAlwaysOpenResource1"></asp:Label>
<asp:Label ID="lblYes" runat="server" Text="是"  Visible="False" meta:resourcekey="lblYesResource1"></asp:Label>
<asp:Label ID="lblNO" runat="server" Text="否"  Visible="False" meta:resourcekey="lblNOResource1"></asp:Label>
<asp:Label ID="lblSettingExample" runat="server" Text="活動看板高度設定說明"  Visible="False" meta:resourcekey="lblSettingExampleResource1"></asp:Label>
<asp:Label ID="lblLimitStr" runat="server" Text="*最多可設定{0}張圖片" Visible="false" meta:resourcekey="lblLimitStrResource1"></asp:Label>
<asp:Label ID="lblPublish" runat="server" Text="已上架" Visible="false" meta:resourcekey="ListItemResource5"></asp:Label>
<asp:Label ID="lblWaiting" runat="server" Text="待上架" Visible="false" meta:resourcekey="ListItemResource6"></asp:Label>
<asp:Label ID="lblExpire" runat="server" Text="已下架" Visible="false" meta:resourcekey="ListItemResource7"></asp:Label>

</asp:Content>


