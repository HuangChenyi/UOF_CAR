<%@ Page Title="自訂面板與通知" Language="C#" MasterPageFile="~/Master/TwoColumn.master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="System_CustomMenuM_Default" Culture="auto" meta:resourcekey="PageResource2" UICulture="auto" %>

<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>
<%@ Register Src="~/Common/FileCenter/V3/UC_FileCenter.ascx" TagPrefix="uc1" TagName="UC_FileCenter" %>
<%@ Register Src="../../Common/ChoiceCenter/UC_ChoiceList.ascx" TagName="UC_ChoiceList" TagPrefix="uc1" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ScriptContentPlaceHolder" runat="server">
    <script type="text/javascript">
        var prm = Sys.WebForms.PageRequestManager.getInstance();
        prm.add_pageLoaded(pageLoaded);

        function pageLoaded(sender, args) {
            var lblRequireMenuTextMsg = $("#<%=lblRequireMenuTextMsg.ClientID %>");
            if (lblRequireMenuTextMsg.length) {
                lblRequireMenuTextMsg.hide();
            }

            var lblRequiredLinkUrl = $("#<%=lblRequiredLinkUrl.ClientID %>");
            if (lblRequiredLinkUrl.length) {
                lblRequiredLinkUrl.hide();
            }
        }

        function btSave_Clicking(sender, args) {
            //Add code to handle your event here.
            var txtMenu = $("#<%=txtMenuText.ClientID %>");
            var lblRequireMenuTextMsg = $("#<%=lblRequireMenuTextMsg.ClientID %>");
            if (txtMenu.val().trim() === "") {
                lblRequireMenuTextMsg.css("display", "");
                args.set_cancel(true);
            }
            else {
                lblRequireMenuTextMsg.css("display", "none");
                args.set_cancel(false);
            }

            var tree = $find("<%= this.rdMenuTree.ClientID %>");
            var node = tree.get_selectedNode();
            if (node) {
                var selectNodeLevel = node.get_level();
                if (selectNodeLevel > 1) {
                    var txtLinkUrl = $("#<%=txtLinkUrl.ClientID %>");
                    var lblRequiredLinkUrl = $("#<%=lblRequiredLinkUrl.ClientID %>");
                    if (txtLinkUrl.length > 0 && txtLinkUrl.val().trim() === "") {
                        lblRequiredLinkUrl.show()
                        args.set_cancel(true);
                    }
                    else {
                        lblRequiredLinkUrl.hide();
                        args.set_cancel(false);
                    }
                }
            }
        }

        function rdToolBar_OnClientButtonClicking(sender, args) {
            var key = args.get_item().get_value();

            if (key == "delMenu") {
                if (confirm('<%=lblMsgCheckDel.Text%>') == false) {
                    args.set_cancel(true);
                }
            }
        }

        function rdParaToolBar_ButtonClicking(sender, args) {
            var key = args.get_item().get_value();

            if (key == "AddPara") {
                args.set_cancel(true);
                $uof.dialog.open2("~/System/CustomMenu/AddParameter.aspx", args.get_item(), "", 800, 650, OpenDialogResult);
            }
            else if (key == "DelPara") {
                if (confirm('<%=lblMsgCheckDel.Text%>') == false) {
                    args.set_cancel(true);
                }
            }
        }

        function OpenDialogResult(retuenValue) {
            if (typeof (retuenValue) === 'undefined' || retuenValue === null) {
                return false;
            }
            else {
                return true;
            }
        }

        function CheckParameterName(name, orgName) {
            var hfParaGridJson = $('#<%=hfParaGridJson.ClientID%>').val();

            if (hfParaGridJson !== '') {
                var gridJson = JSON.parse(hfParaGridJson);
                var isExist = false;
                isExist = gridJson.some(function (item) {
                    if (orgName === "") {
                        return item.PARA_NAME == name;
                    }
                    else {
                        if (orgName !== name) {
                            return item.PARA_NAME == name;
                        }
                    }
                });
                return isExist;
            }
        }

        function rdBadgeToolBar_ButtonClicking(sender, args) {
            var key = args.get_item().get_value();

            if (key == "delBadge") {
                if (confirm('<%=lblMsgCheckDel.Text%>') == false) {
                    args.set_cancel(true);
                }
            }
        }
        
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ToolbarContentPlaceHolder" runat="server">
    <asp:UpdatePanel ID="upToolBar" runat="server">
        <ContentTemplate>
            <telerik:RadTabStrip ID="radMobileTab" runat="server" MultiPageID="rmpMobile" OnTabClick="radMobileTab_TabClick" SelectedIndex="0" AutoPostBack="true">
                <Tabs>
                    <telerik:RadTab PageViewID="pvMenu" runat="server" Text="選單面板" Selected="true" meta:resourcekey="pvMenuResource1"></telerik:RadTab>
                    <telerik:RadTab PageViewID="pvBadge" runat="server" Text="通知" meta:resourcekey="pvBadgeResource1"></telerik:RadTab>
                </Tabs>
            </telerik:RadTabStrip>
            <telerik:RadToolBar ID="rdToolBar" OnButtonClick="rdToolBar_ButtonClick" OnClientButtonClicking="rdToolBar_OnClientButtonClicking" SingleClick="None" runat="server" Width="100%" meta:resourcekey="rdToolBarResource1">
                <Items>
                    <telerik:RadToolBarButton runat="server" HoveredImageUrl="~/Common/Images/Icon/icon_m112.gif"
                        ImageUrl="~/Common/Images/Icon/icon_m112.gif" CheckedImageUrl="~/Common/Images/Icon/icon_m112.gif"
                        Value="addMenu" Text="新增選單" meta:resourcekey="RadToolBarButtonResource1">
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton runat="server" IsSeparator="true" meta:resourcekey="RadToolBarButtonResource2" />
                    <telerik:RadToolBarButton runat="server" HoveredImageUrl="~/Common/Images/Icon/icon_m113.gif"
                        ImageUrl="~/Common/Images/Icon/icon_m113.gif" CheckedImageUrl="~/Common/Images/Icon/icon_m113.gif"
                        Value="menuUp" Text="選單順序上移" meta:resourcekey="RadToolBarButtonResource3">
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton runat="server" IsSeparator="true" meta:resourcekey="RadToolBarButtonResource4" />
                    <telerik:RadToolBarButton runat="server" HoveredImageUrl="~/Common/Images/Icon/icon_m114.gif"
                        ImageUrl="~/Common/Images/Icon/icon_m114.gif" CheckedImageUrl="~/Common/Images/Icon/icon_m114.gif"
                        Value="menuDown" Text="選單順序下移" meta:resourcekey="RadToolBarButtonResource5">
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton runat="server" IsSeparator="true" meta:resourcekey="RadToolBarButtonResource6" />
                    <telerik:RadToolBarButton runat="server" HoveredImageUrl="~/Common/Images/Icon/icon_m115.gif"
                        ImageUrl="~/Common/Images/Icon/icon_m115.gif" CheckedImageUrl="~/Common/Images/Icon/icon_m115.gif"
                        Value="delMenu" Text="刪除選單" meta:resourcekey="RadToolBarButtonResource7">
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton runat="server" HoveredImageUrl="~/Common/Images/Icon/icon_m49.gif"
                        ImageUrl="~/Common/Images/Icon/icon_m49.gif" CheckedImageUrl="~/Common/Images/Icon/icon_m49.gif"
                        Value="reloadMenu" Text="更新選單面板" meta:resourcekey="RadToolBarButtonResource9">
                    </telerik:RadToolBarButton>
            <telerik:RadToolBarButton runat="server" IsSeparator="True" Value="s5" meta:resourcekey="RadToolBarButtonResource5">
            </telerik:RadToolBarButton>
                </Items>
            </telerik:RadToolBar>
            <telerik:RadToolBar ID="rdBadgeToolBar" runat="server" OnButtonClick="rdBadgeToolBar_ButtonClick" OnClientButtonClicking="rdBadgeToolBar_ButtonClicking" SingleClick="None" Width="100%" Visible="false">
                <Items>
                    <telerik:RadToolBarButton runat="server" HoveredImageUrl="~/Common/Images/Icon/icon_m71.png"
                        ImageUrl="~/Common/Images/Icon/icon_m71.png" CheckedImageUrl="~/Common/Images/Icon/icon_m71.png"
                        Value="addBadge" Text="新增" meta:resourcekey="rdBadgeTooladdBadgeBarResource1">
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton runat="server" IsSeparator="true" />
                    <telerik:RadToolBarButton runat="server" HoveredImageUrl="~/Common/Images/Icon/icon_m113.gif"
                        ImageUrl="~/Common/Images/Icon/icon_m113.gif" CheckedImageUrl="~/Common/Images/Icon/icon_m113.gif"
                        Value="seqUp" Text="順序上移" meta:resourcekey="rdBadgeToolseqUpResource1">
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton runat="server" IsSeparator="true" />
                    <telerik:RadToolBarButton runat="server" HoveredImageUrl="~/Common/Images/Icon/icon_m114.gif"
                        ImageUrl="~/Common/Images/Icon/icon_m114.gif" CheckedImageUrl="~/Common/Images/Icon/icon_m114.gif"
                        Value="seqDown" Text="順序下移" meta:resourcekey="rdBadgeToolseqDownResource1">
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton runat="server" IsSeparator="true" />
                    <telerik:RadToolBarButton runat="server" HoveredImageUrl="~/Common/Images/Icon/icon_m03.png"
                        ImageUrl="~/Common/Images/Icon/icon_m03.png" CheckedImageUrl="~/Common/Images/Icon/icon_m03.png"
                        Value="delBadge" Text="刪除" meta:resourcekey="rdBadgeTooldelBadgeResource1">
                    </telerik:RadToolBarButton>
                </Items>
            </telerik:RadToolBar>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="LeftContentPlaceHolder" runat="server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server" RenderMode="Inline" UpdateMode="Conditional" ChildrenAsTriggers="False">
        <ContentTemplate>
            <telerik:RadMultiPage ID="rmpMobile" runat="server" SelectedIndex="0">
                <telerik:RadPageView ID="rpvMenu" runat="server" Selected="true">
                    <telerik:RadTreeView ID="rdMenuTree" runat="server"
                        EnableNodeTextHtmlEncoding="True"
                        OnNodeClick="rdMenuTree_NodeClick" meta:resourcekey="rdMenuTreeResource1">
                    </telerik:RadTreeView>
                </telerik:RadPageView>
                <telerik:RadPageView ID="rpvBadge" runat="server">
                    <telerik:RadTreeView ID="rdBadgeTree" runat="server"
                        EnableNodeTextHtmlEncoding="True"
                        OnNodeClick="rdBadgeTree_NodeClick">
                    </telerik:RadTreeView>
                </telerik:RadPageView>
            </telerik:RadMultiPage>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="RightContentPlaceHolder" runat="server">
    <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <asp:Panel ID="pMenu" runat="server">
                <asp:CustomValidator ID="cvSelectNode" runat="server" Display="Dynamic" ErrorMessage="請選擇節點，或點選新增選單開始" Font-Bold="True" meta:resourcekey="cvSelectNodeResource1"></asp:CustomValidator>
                <asp:CustomValidator ID="cvNotDeleteNode" runat="server" ErrorMessage="此為根節點或尚有子節點存在，不可刪除" Display="Dynamic" Font-Bold="True" meta:resourcekey="cvNotDeleteNodeResource1"></asp:CustomValidator>

                <asp:Panel ID="pnlTable" runat="server">
                    <table class="PopTable" style="width: 100%;">

                        <tr>
                            <td style="width: 15%; white-space: nowrap">
                                <asp:Label ID="lblSign" runat="server" Text="*" ForeColor="Red"></asp:Label>
                                <asp:Label ID="lblMenuText" runat="server" Text="選單文字" meta:resourcekey="lblMenuTextResource1"></asp:Label>
                            </td>
                            <td runat="server" id="tdMenuText">
                                <asp:TextBox ID="txtMenuText" runat="server" Columns="50" MaxLength="50" meta:resourcekey="txtMenuTextResource1"></asp:TextBox>
                                <asp:Label ID="lblRequireMenuTextMsg" runat="server" Text="請輸入文字" Font-Bold="True" ForeColor="Red" meta:resourcekey="lblRequireMenuTextMsgResource1"></asp:Label>
                            </td>
                            <td style="width: 15%; white-space: nowrap; border-top: none" runat="server" id="tdModeTitle">
                                <asp:Label ID="lblMode" runat="server" Text="模式" meta:resourcekey="lblModeResource1" />
                            </td>
                            <td style="width: 35%; white-space: nowrap; border-top: none" runat="server" id="tdMode">
                                <asp:CheckBox ID="cbMenu" runat="server" Text="選單" meta:resourcekey="cbMenuResource1" />
                                <asp:CheckBox ID="cbPanel" runat="server" Text="面板" meta:resourcekey="cbPanelResource1" />
                            </td>
                        </tr>
                        <tr id="groupResourceTR" runat="server">
                            <td>
                                <asp:Label ID="Label1" runat="server" Text="多國語言" meta:resourcekey="lblResourceResource1"></asp:Label>
                            </td>
                            <td style="line-height: 2.2em">
                                <table id="groupResourceTable" runat="server" />
                            </td>
                        </tr>

                        <asp:Panel ID="pnlChild" runat="server">
                            <tr>
                                <td style="border-top: none; width: 15%; white-space: nowrap">
                                    <asp:Label ID="Label2" runat="server" Text="*" ForeColor="Red"></asp:Label>
                                    <asp:Label ID="lblLinkUrl" runat="server" Text=" 連結網頁" meta:resourcekey="lblLinkUrlResource1" />
                                </td>
                                <td style="border-top: none">
                                    <table>
                                        <tr>
                                            <td runat="server">
                                                <asp:TextBox ID="txtLinkUrl" runat="server" Columns="50"></asp:TextBox>
                                                <asp:Label ID="lblRequiredLinkUrl" runat="server" Text="請輸入網址" Font-Bold="True" ForeColor="Red" meta:resourcekey="lblRequiredLinkUrlResource1"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:RadioButton runat="server" ID="rbtnOpenInappBrowser" GroupName="OpenMobileBrowser" Text="使用App內嵌瀏覽器開啟視窗" Checked="true" OnCheckedChanged="rbtnOpenInappBrowser_CheckedChanged" AutoPostBack="true" meta:resourcekey="rbtnOpenInappBrowserResource1" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="padding-left: 15px;">
                                                <asp:CheckBox ID="cbVisableBtnOff" runat="server" Text="顯示關閉視窗按鈕" meta:resourcekey="cbVisableBtnOffResource1" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:RadioButton runat="server" ID="rbtnOpenMobileBrower" GroupName="OpenMobileBrowser" Text="使用裝置內建瀏覽器另開新視窗" OnCheckedChanged="rbtnOpenInappBrowser_CheckedChanged" AutoPostBack="true" meta:resourcekey="rbtnOpenMobileBrowerResource1" />
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                                <td style="width: 15%; white-space: nowrap; border-top: none">
                                    <asp:Label ID="lblSetWS" runat="server" Text="面板提示來源" meta:resourcekey="lblSetWSResource1" />
                                </td>
                                <td style="width: 35%; white-space: nowrap; border-top: none">
                                    <telerik:RadButton ID="radbtnWS_Set" runat="server" Text="設定" Visible="true" Height="100%" BackColor="Blue" meta:resourcekey="radbtnWS_SetResource1" OnClick="radbtnWS_Set_Click"></telerik:RadButton>
                                    <br>
                                    <asp:Label ID="lblUrl" runat="server" Text="" ForeColor="Blue"></asp:Label>
                                    <asp:HiddenField ID="hfwsUrl" runat="server" />
                                    <asp:HiddenField ID="hfwsMethod" runat="server" />
                                </td>
                            </tr>

                            <tr>
                                <td>
                                    <asp:Label ID="lblResource" runat="server" Text="多國語言" meta:resourcekey="lblResourceResource1"></asp:Label>
                                </td>
                                <td style="line-height: 2.2em">
                                    <table id="resourceMenuTable" runat="server" />
                                </td>
                                <td>
                                    <asp:Label ID="lblMenuIcon" runat="server" meta:resourcekey="lblMenuIconResource1" Text="選單圖示"></asp:Label>
                                </td>
                                <td>
                                    <asp:UpdatePanel runat="server" UpdateMode="Conditional">
                                        <ContentTemplate>
                                            <table>
                                                <tr>
                                                    <td colspan="2" style="white-space: nowrap">
                                                        <asp:RadioButton ID="rbDefault" runat="server" AutoPostBack="True" GroupName="iconType" meta:resourcekey="rbDefaultResource1" OnCheckedChanged="rbIcon_CheckedChanged" Text="不設定" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="white-space: nowrap">
                                                        <asp:RadioButton ID="rbCustomIcon" runat="server" AutoPostBack="True" GroupName="iconType" meta:resourcekey="rbCustomIconResource1" OnCheckedChanged="rbIcon_CheckedChanged" Text="自訂" />
                                                    </td>
                                                    <td>
                                                        <telerik:RadButton ID="rbtnImageFile" runat="server" Text="選取圖示" CausesValidation="false" OnClick="rbtnImageFile_Click" meta:resourcekey="rbtnImageFileResource1" />
                                                        <uc1:UC_FileCenter ID="UC_FileCenter" runat="server" ModuleName="EIP" Editable="false"/>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="white-space: nowrap">
                                                        <asp:RadioButton ID="rbSystemIcon" runat="server" AutoPostBack="True" GroupName="iconType" meta:resourcekey="rbSystemIconResource1" OnCheckedChanged="rbIcon_CheckedChanged" Text="內建icon" />
                                                    </td>
                                                    <td>
                                                        <asp:TextBox ID="txtSystemIcon" runat="server" MaxLength="50" meta:resourcekey="txtSystemIconResource1" Visible="False"></asp:TextBox><br />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td colspan="4">
                                                        <asp:Label ID="lblPrompt" runat="server" ForeColor="Blue" meta:resourcekey="lblPromptResource1" Visible="False"></asp:Label>
                                                        <asp:HyperLink ID="hyImgInfo" Visible="false" runat="server" NavigateUrl="~/System/CustomMenuM/Image/add_example.png" Text="範例說明。" Target="_blank" meta:resourcekey="hyImgInfoResource2"></asp:HyperLink>
                                                    </td>
                                                </tr>
                                            </table>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="lblLinkPara" runat="server" Text="連結參數" meta:resourcekey="lblLinkParaResource1"></asp:Label>
                                </td>
                                <td runat="server" colspan="3">
                                    <asp:Panel ID="PanelParameter" runat="server">
                                        <telerik:RadToolBar ID="rdParaToolBar" runat="server" OnButtonClick="rdParaToolBar_ButtonClick" OnClientButtonClicking="rdParaToolBar_ButtonClicking" SingleClick="None" Width="100%">
                                            <Items>
                                                <telerik:RadToolBarButton runat="server" CheckedImageUrl="~/Common/Images/Icon/icon_j13.gif" HoveredImageUrl="~/Common/Images/Icon/icon_j13.gif" ImageUrl="~/Common/Images/Icon/icon_j13.gif" Text="新增參數" Value="AddPara" meta:resourcekey="AddParaResource1">
                                                </telerik:RadToolBarButton>
                                                <telerik:RadToolBarButton runat="server" IsSeparator="True" Value="s1">
                                                </telerik:RadToolBarButton>
                                                <telerik:RadToolBarButton runat="server" CheckedImageUrl="~/Common/Images/Icon/icon_m115.gif" HoveredImageUrl="~/Common/Images/Icon/icon_m115.gif" ImageUrl="~/Common/Images/Icon/icon_m115.gif" Text="刪除參數" Value="DelPara" meta:resourcekey="DelParaResource1">
                                                </telerik:RadToolBarButton>
                                                <telerik:RadToolBarButton runat="server" IsSeparator="True" Value="s2">
                                                </telerik:RadToolBarButton>
                                            </Items>
                                        </telerik:RadToolBar>
                                        <Fast:Grid ID="gridLinkPara" runat="server" AllowSorting="True" AutoGenerateCheckBoxColumn="True" AutoGenerateColumns="False" CustomDropDownListPage="False" DataKeyNames="PARA_GUID" DataKeyOnClientWithCheckBox="False" DefaultSortColumnName="PARA_NAME"
                                            DefaultSortDirection="Ascending" EmptyDataText="沒有資料" EnhancePager="True" KeepSelectedRows="False" OnRowDataBound="gridLinkPara_RowDataBound" meta:resourcekey="gridLinkParaResource"
                                            OnSorting="gridLinkPara_Sorting" PageSize="15" SelectedRowColor="" UnSelectedRowColor="">
                                            <EnhancePagerSettings FirstAltImageUrl="" FirstImageUrl="" LastAltImage="" LastImageUrl="" NextIAltImageUrl="" NextImageUrl="" PageInfoCssClass="" PageNumberCssClass="" PageNumberCurrentCssClass="" PageRedirectCssClass="" PreviousAltImageUrl="" PreviousImageUrl="" ShowHeaderPager="True" />
                                            <ExportExcelSettings AllowExportToExcel="False" />
                                            <Columns>
                                                <asp:TemplateField HeaderText="參數名稱" meta:resourcekey="TemplateFieldResource1">
                                                    <ItemTemplate>
                                                        <asp:LinkButton ID="lbtnName" runat="server" OnCommand="lbtnName_Command"></asp:LinkButton>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="資料來源" meta:resourcekey="TemplateField2Resource1">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lbSource" runat="server"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="加密" meta:resourcekey="TemplateField3Resource1">
                                                    <ItemTemplate>
                                                        <asp:CheckBox ID="cbEncryption" runat="server" Enabled="false" />
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                            </Columns>
                                        </Fast:Grid>
                                        <table>
                                            <tr>
                                                <td colspan="2">
                                                    <br />
                                                    <asp:Label ID="lblEncyption" runat="server" Text="加密演算法(Advanced Encryption Standard,AES 128bits)" meta:resourcekey="lblEncyptionResource1"></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <table style="line-height: 2.2em">
                                                        <tr>
                                                            <td style="padding-right: 5px">
                                                                <asp:Label ID="lblEncyptionKey" runat="server" Text="Key" meta:resourcekey="lblEncyptionKeyResource1"></asp:Label>
                                                            </td>
                                                            <td>
                                                                <asp:TextBox ID="txtKey" runat="server" MaxLength="50"></asp:TextBox>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <asp:Label ID="lblEncyptionIV" runat="server" Text="IV" meta:resourcekey="lblEncyptionIVResource1"></asp:Label>
                                                            </td>
                                                            <td>
                                                                <asp:TextBox ID="txtIV" runat="server" MaxLength="50"></asp:TextBox>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </td>
                                            </tr>
                                        </table>
                                        <br />
                                        <telerik:RadButton ID="btnPreview" runat="server" OnClick="btnPreview_Click" Text="預覽連結" meta:resourcekey="btnPreviewResource1">
                                        </telerik:RadButton>
                                        <asp:HyperLink ID="hlPreview" runat="server" Target="_blank"></asp:HyperLink>
                                    </asp:Panel>
                                </td>
                            </tr>
                            <tr>
                                <td style="border-top: none; width: 15%">
                                    <asp:Label ID="lblAuthorization" runat="server" Text="權限" meta:resourcekey="lblAuthorizationResource1" />
                                </td>
                                <td style="border-top: none; width: 85%" colspan="3">
                                    <uc1:UC_ChoiceList ID="UC_ChoiceStaff" runat="server" ExpandToUser="false" TreeHeight="100px" />
                                </td>
                            </tr>
                        </asp:Panel>
                    </table>
                </asp:Panel>

                <asp:UpdatePanel runat="server" ID="SaveSuccessPanel" UpdateMode="Conditional">
                    <ContentTemplate>
                        <table class="PopTable" style="width: 100%" id="saveDT" runat="server">
                            <tr>
                                <td colspan="4" style="text-align: center; border-top: none;">
                                    <telerik:RadButton ID="btSave" runat="server" AutoSubmit="False" meta:resourcekey="btSaveResource1" OnClick="btSave_Click" OnClientClicking="btSave_Clicking" Text="儲存"></telerik:RadButton>
                                    <asp:Label ID="lblSaveSuccess" runat="server" Font-Bold="True" ForeColor="Blue" meta:resourcekey="lblSaveSuccessResource1" Text="儲存成功" Visible="False"></asp:Label>
                                </td>
                            </tr>
                        </table>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </asp:Panel>
            <asp:Panel ID="pBadge" runat="server" Visible="false">
                <asp:CustomValidator ID="cvBadgeValidator" runat="server" Display="Dynamic" ErrorMessage="點選新增開始" Font-Bold="True" meta:resourcekey="cvBadgeValidatorResource1"></asp:CustomValidator>
                <table class="PopTable" style="width: 100%" id="badgeTB" runat="server">
                    <tr>
                        <td>
                            <asp:Label ID="Label3" runat="server" Text="*" ForeColor="Red"></asp:Label>
                            <asp:Label ID="lblBadgeName" runat="server" Text="通知名稱" meta:resourcekey="lblBadgeNameResource1"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtBadgeName" runat="server" MaxLength="50" Width="30%"></asp:TextBox>
                            <asp:CustomValidator ID="cvBadgeName" runat="server" ErrorMessage="請輸入通知名稱" Display="Dynamic" meta:resourcekey="cvBadgeNameResource1"></asp:CustomValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label4" runat="server" Text="*" ForeColor="Red"></asp:Label>
                            <asp:Label ID="lblSource" runat="server" Text="提示來源" meta:resourcekey="lblSourceResource1"></asp:Label>
                        </td>
                        <td>
                           <table  style="width: 100%">
                               <tr style="line-height: 2.2em">
                                   <td style="width: 5%; white-space: nowrap; text-align: left;padding-right: 5px;">
                                        <asp:Label ID="lblWSUrl" runat="server" Text="來源網址" meta:resourcekey="lblWSUrlResource1"></asp:Label>
                                   </td>
                                    <td>
                                        <asp:TextBox ID="txtWSUrl" runat="server" MaxLength="200" Width="70%"></asp:TextBox>                                   
                                        <asp:CustomValidator ID="cvWSUrlValid" runat="server" ErrorMessage="請輸入來源網址" Display="Dynamic" meta:resourcekey="cvWSUrlValidResource1"></asp:CustomValidator>
                                   </td>
                               </tr>
                               <tr style="line-height: 2.2em">
                                   <td style="width: 5%; white-space: nowrap; text-align: left;padding-right: 5px;">
                                        <asp:Label ID="lblWSMethod" runat="server" Text="呼叫的方法" meta:resourcekey="lblWSMethodResource1"></asp:Label>
                                   </td>
                                    <td>
                                        <asp:TextBox ID="txtWSMethod" runat="server" MaxLength="100" Width="70%"></asp:TextBox>                                   
                                        <asp:CustomValidator ID="cvWSMethodValid" runat="server" ErrorMessage="請輸入呼叫的方法" Display="Dynamic" meta:resourcekey="cvWSMethodValidResource1"></asp:CustomValidator>
                                   </td>
                               </tr>
                               <tr>
                                   <td colspan="2">
                                        <telerik:RadButton ID="rbtnConnTest" runat="server" OnClick="rbtnConnTest_Click" Text="連線測試"  meta:resourcekey="rbtnConnTestResource1"/>
                                        <asp:Label ID="lblSuccess" runat="server" Text="連線成功" ForeColor="Blue" Visible="false"  meta:resourcekey="lblSuccessResource1"/>
                                   </td>
                               </tr>
                               <tr>
                                   <td colspan="2">
                                        <asp:Label ID="lblRemaek" runat="server" Text="透過來源及呼叫方法取得的資訊會於App上顯示通知數量。" ForeColor="Blue"  meta:resourcekey="lblRemaekResource1"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <asp:HyperLink ID="hlsample" runat="server" NavigateUrl="~/System/CustomMenuM/Image/img-info-app badge.png" Text="顯示範例" Target="_blank"  meta:resourcekey="hlsampleResource1"></asp:HyperLink>
                                    </td>
                                </tr>
                           </table>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lblCulture" runat="server" Text="多國語言" meta:resourcekey="lblResourceResource1"></asp:Label>
                        </td>
                        <td style="line-height: 2.2em">
                            <table ID="badgeResourceTB" runat="server" />  
                            <asp:Label ID="lblResourceKey" runat="server" Text="" Visible="false"></asp:Label>                             
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lblAuth" runat="server" Text="權限" meta:resourcekey="lblAuthorizationResource1"></asp:Label>
                        </td>
                        <td>
                            <uc1:UC_ChoiceList ID="UC_BadgeAllowUser" runat="server" ExpandToUser="false" TreeHeight="100px" />
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3" style="text-align: center;">
                            <asp:UpdatePanel runat="server" ID="upBtnBadgeSave" UpdateMode="Conditional">
                                <ContentTemplate>
                                    <telerik:RadButton ID="rBtnBadgeSave" runat="server" AutoSubmit="False" OnClick="rBtnBadgeSave_Click" meta:resourcekey="btSaveResource1" Text="儲存"></telerik:RadButton>
                                    <asp:Label ID="lblBadgeSaveSuccess" runat="server" Font-Bold="True" ForeColor="Blue" meta:resourcekey="lblSaveSuccessResource1" Text="儲存成功" Visible="False"></asp:Label>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </td>
                    </tr>
                </table>
            </asp:Panel>
            <asp:HiddenField ID="hfParaGridJson" runat="server" />
            <asp:HiddenField ID="hfNodeLevel" runat="server" />

            <asp:Label ID="lblWSEdit" runat="server" Text="面板提示來源" Visible="False" meta:resourcekey="lblWSEditResource1" />
            <asp:Label ID="lblCustomMenu" runat="server" Text="自訂選單" Visible="False" meta:resourcekey="lblCustomMenuResource1" />
            <asp:Label ID="lblMsgCheckDel" runat="server" Text="確定要刪除此選單嗎？" Visible="False" meta:resourcekey="lblMsgCheckDelResource1"></asp:Label>
            <asp:Label ID="lblNotAllowEmpty" runat="server" Text="不允許空白！" Visible="False" meta:resourcekey="lblNotAllowEmptyResource1"></asp:Label>
            <asp:Label ID="lblRangeError" runat="server" Text="字數不可超過50！" Visible="False" meta:resourcekey="lblRangeErrorResource1"></asp:Label>
            <asp:Label ID="lblExamplle" runat="server" Text="註:可連結至此" Visible="False" meta:resourcekey="lblExamplleResource1"></asp:Label>
            <asp:Label ID="lblPage" runat="server" Text="頁面" Visible="False" meta:resourcekey="lblPageResource1"></asp:Label>
            <asp:Label ID="lblPaste" runat="server" Text="點按欲顯示的圖示，複製標題並貼上即可" Visible="False" meta:resourcekey="lblPasteResource1"></asp:Label>
            <asp:Label ID="lblFail" runat="server" Text="連線失敗" ForeColor="Blue" Visible="False" meta:resourcekey="lblFailResource1"/>
            <asp:Label ID="lblCustomMenuMImage" runat="server" Text="自訂選單圖示" Visible="false" meta:resourcekey="lblCustomMenuMImageResource1"></asp:Label>
            <asp:Label ID="lblRegisterDynamicTaskForMenuStartTip" runat="server" Text="已進入選單面板權限更新排程" Visible="false" meta:resourcekey="lblRegisterDynamicTaskForMenuStartTipResource1"></asp:Label>
            <asp:Label ID="lblProcessMessage" runat="server" Text="已有同步排程執行中" Visible="False" meta:resourcekey="lblProcessMessageResource1"></asp:Label>
            
            <asp:HiddenField ID="hfCurrentUser" runat="server" />
            <asp:HiddenField ID="hfUserIPAddress" runat="server" />
            <asp:HiddenField ID="hfEncryptionCheck" runat="server" />
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
