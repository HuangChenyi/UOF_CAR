<%@ Page Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="WKF_FlowManagement_SetupAssignableSite"
    Title="設定簽核式站點" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" Codebehind="SetupAssignableSite.aspx.cs" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>
<%@ Register Src="../../Common/ChoiceCenter/UC_ChoiceList.ascx" TagName="UC_ChoiceList"
    TagPrefix="uc1" %>
<%@ Register Src="UC_LimitChoice2.ascx" TagName="UC_LimitChoice" TagPrefix="uc2" %>
<%@ Register Src="~/WKF/FlowManagement/UC_SignDirections.ascx" TagPrefix="uc1" TagName="UC_SignDirections" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <script type="text/javascript" id="telerikClientEvents1">

        function radToolBarByBeforeSign_Clicking(sender, args) {
            var value = args.get_item().get_value();

            if (value == "SetNodify") {
                var formVersionId = $uof.tool.htmlDecode('<%=System.Web.Security.AntiXss.AntiXssEncoder.HtmlEncode(Request.QueryString["formVersionId"], true) %>')
                var siteId = $uof.tool.htmlDecode('<%= System.Web.Security.AntiXss.AntiXssEncoder.HtmlEncode(Request.QueryString["siteId"], true) %>');
                args.set_cancel(true);
                $uof.dialog.open2("~/WKF/FormManagement/ManageSiteNotifyCondition.aspx", args.get_item(), "", 1200, 700, openDialogResult, {"SITE_ID":siteId,"formVersionId":formVersionId,"notifyType":"0"});
            }
        }

        function openDialogResult(returnValue) {
            if (typeof (returnValue) == "undefined") {
                return false;
            }
            return true;
        }

        function radToolBarByAfterSign_Clicking(sender, args) {
            var value = args.get_item().get_value();

            if (value == "SetNodify") {
                var formVersionId = $uof.tool.htmlDecode('<%= System.Web.Security.AntiXss.AntiXssEncoder.HtmlEncode(Request.QueryString["formVersionId"],true) %>')
                var siteId = $uof.tool.htmlDecode('<%= System.Web.Security.AntiXss.AntiXssEncoder.HtmlEncode(Request.QueryString["siteId"], true) %>');
                var notifyType = 1;
                args.set_cancel(true);
                $uof.dialog.open2("~/WKF/FormManagement/ManageSiteNotifyCondition.aspx", args.get_item(), "", 1200, 700, openDialogResult, { "SITE_ID": siteId, "formVersionId": formVersionId, "notifyType": "1" });

            }
        }
    </script>
    <table width="100%" class="PopTable" cellspacing="1">
        <tr>
            <td align="center" class="PopTableHeader" colspan="4" style="height: 27px">
                <center>
                    <asp:Label ID="lblSiteSignTitle" runat="server" Text="簽核式站點" meta:resourcekey="lblSiteSignTitleResource1"></asp:Label>
                </center>
            </td>
        </tr>
        <tr>
            <td class="PopTableLeftTD" style="width: 20%; height: 27px">
                <asp:Label ID="lblIsAssign" runat="server" Text="是否由上一站點指定" meta:resourcekey="lblIsAssignResource1"></asp:Label>
            </td>
            <td class="PopTableRightTD" style="width: 30%; height: 27px; white-space:nowrap">
                <asp:RadioButton ID="rdYesAssign" runat="server" GroupName="isAssign" Text="是" AutoPostBack="True"
                    OnCheckedChanged="rdYesAssign_CheckedChanged" meta:resourcekey="rdYesAssignResource1" />
                <asp:RadioButton ID="rdNoAssign" runat="server" Checked="True" GroupName="isAssign"
                    Text="否" AutoPostBack="True" OnCheckedChanged="rdNoAssign_CheckedChanged" meta:resourcekey="rdNoAssignResource1" />
                <br />
                <asp:Label ID="Label3" runat="server" Text="( 指定[簽核人員]與[型態] ) " meta:resourcekey="Label3Resource1"></asp:Label>
            </td>
            <td class="PopTableLeftTD" style="width: 20%; height: 27px">
                <asp:Label ID="lblSignType" runat="server" Text="簽核型態" meta:resourcekey="lblSignTypeResource1"></asp:Label>
            </td>
            <td class="PopTableRightTD" style="height: 27px; white-space:nowrap">
                <asp:RadioButton ID="rbSignType0" runat="server" Checked="True" GroupName="singType" Text="一般" meta:resourcekey="rbSignType0Resource1" />
                <asp:RadioButton ID="rbSignType1" runat="server" GroupName="singType" Text="並簽" meta:resourcekey="rbSignType1Resource1" />
                <asp:RadioButton ID="rbSignType2" runat="server" GroupName="singType" Text="會簽" meta:resourcekey="rbSignType2Resource1" />
                <br />
                <uc1:UC_SignDirections runat="server" ID="UC_SignDirections" />
            </td>
        </tr>
        <tr>
            <td style="width: 20%; height: 27px" class="PopTableLeftTD">
                <asp:Label ID="Label1" runat="server" Text="此站點是否可變更" meta:resourcekey="Label1Resource1"></asp:Label>
            </td>
            <td style="width: 30%; height: 27px" class="PopTableRightTD">
                <asp:RadioButton ID="rbYesModify" runat="server" GroupName="IsModifiable" Text="是"
                    OnCheckedChanged="rdYesAssign_CheckedChanged" meta:resourcekey="rbYesModifyResource1" />
                <asp:RadioButton ID="rbNoModify" runat="server" GroupName="IsModifiable" Text="否"
                    OnCheckedChanged="rdNoAssign_CheckedChanged" meta:resourcekey="rbNoModifyResource1"
                    Checked="True" />
            </td>
            <td style="height: 27px; width: 20%;" class="PopTableLeftTD">&nbsp;<asp:Label ID="lblTimeoutCount" runat="server" Text="逾時設定" meta:resourcekey="lblTimeoutCountResource1"></asp:Label>
            </td>
            <td style="height: 27px" class="PopTableRightTD">
                <telerik:RadNumericTextBox ID="txtTimeoutCount" runat="server" Width="60px" MinValue="0" Value="0" DataType="System.String" Culture="zh-TW" DbValueFactor="1" LabelWidth="24px" meta:resourcekey="txtTimeoutCountResource2">
                    <NumberFormat ZeroPattern="n" AllowRounding="False" DecimalDigits="0"  ></NumberFormat>
                </telerik:RadNumericTextBox>
                <asp:Label ID="Label2" runat="server" Text="小時" meta:resourcekey="Label2Resource1"></asp:Label>
                <asp:Label ID="Label10" runat="server" Text="[0表示不設定]" CssClass="SizeMemo" meta:resourcekey="Label10Resource1"></asp:Label>
            </td>
        </tr>
        <tr>
           <td style="height: 27px; width: 20%;" class="PopTableLeftTD">
               <asp:Label ID="Label12" runat="server" Text="簽核提醒頻率" meta:resourcekey="Label12Resource1" ></asp:Label>
            </td>
            <td style="height: 27px" class="PopTableRightTD">
                <telerik:RadNumericTextBox ID="txtCycleHour" runat="server" Width="60px" MinValue="0" Value="0" DataType="System.String" Culture="zh-TW" DbValueFactor="1" LabelWidth="24px" meta:resourcekey="txtCycleHourResource1">
                    <NumberFormat ZeroPattern="n" AllowRounding="False" DecimalDigits="0"  ></NumberFormat>
                </telerik:RadNumericTextBox>
                <asp:Label ID="Label6" runat="server" Text="小時" meta:resourcekey="Label2Resource1"></asp:Label>
                <asp:Label ID="Label9" runat="server" Text="[0表示不設定]" CssClass="SizeMemo" meta:resourcekey="Label9Resource1"></asp:Label>
            </td>
            <td>
                <asp:Label ID="Label7" runat="server" Text="自動送至下一站" meta:resourcekey="Label7Resource1"></asp:Label>
            </td>
            <td>
                <telerik:RadNumericTextBox ID="txtAutoSignHour" runat="server" Width="60px" MinValue="0" Value="0" DataType="System.String" Culture="zh-TW" DbValueFactor="1" LabelWidth="24px" meta:resourcekey="txtAutoSignHourResource1">
                    <NumberFormat ZeroPattern="n" AllowRounding="False" DecimalDigits="0"  ></NumberFormat>
                </telerik:RadNumericTextBox>
                <asp:Label ID="Label8" runat="server" Text="小時" meta:resourcekey="Label2Resource1"></asp:Label>
                <asp:Label ID="Label11" runat="server" Text="[0表示不設定]" CssClass="SizeMemo" meta:resourcekey="Label11Resource1"></asp:Label>
            </td>
        </tr>
    </table>
    <table width="100%" class="PopTable" cellspacing="1" runat="server" id="tbSetupSigner">
        <tr>
            <td class="PopTableHeader" style="height: 27px" align="center">
                <center>
                    <asp:Label ID="lblSetupSignerTitle" runat="server" Text="設定人員" meta:resourcekey="lblSetupSignerTitleResource1"></asp:Label>
                </center>
            </td>
        </tr>
        <tr>
            <td class="PopTableLeftTD">
                <telerik:RadTabStrip ID="RadTabStrip1" runat="server" SelectedIndex="0" MultiPageID="RadMultiPage1" meta:resourcekey="RadTabStrip1Resource1">
                    <Tabs>
                        <telerik:RadTab runat="server" Text="簽核人員" meta:resourcekey="RadTabResource1">
                        </telerik:RadTab>
                        <telerik:RadTab runat="server" Text="簽核前知會" meta:resourcekey="RadTabResource2">
                        </telerik:RadTab>
                        <telerik:RadTab runat="server" Text="簽核後知會" meta:resourcekey="RadTabResource3">
                        </telerik:RadTab>
                    </Tabs>
                </telerik:RadTabStrip>
                <telerik:RadMultiPage ID="RadMultiPage1" runat="server" SelectedIndex="0" meta:resourcekey="RadMultiPage1Resource1">
                    <telerik:RadPageView ID="RadPageView1" runat="server" meta:resourcekey="RadPageView1Resource1" Selected="True">
                        <table class="PopTable" cellpadding="0" cellspacing="1">
                                    <tr>
                                        <td class="popTableLeftTD">
                                            <div align="center">
                                                <asp:CustomValidator ID="SignerCustomValidator" runat="server" Display="Dynamic"
                                                    ErrorMessage="簽核人員至少需有一位，請至少選擇一位特殊人員或簽核人員<br/>" meta:resourcekey="SignerCustomValidatorResource1"></asp:CustomValidator>
                                                <asp:Label ID="lblSpecialSingers" runat="server" Text="特殊簽核" meta:resourcekey="lblSpecialSingersResource1"></asp:Label>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="PopTableRightTD" style="text-align: left">
                                            <table cellpadding="0" cellspacing="0" align="left" width="100%">
                                                <tr>
                                                    <td style="background-color: White; height: 27px" valign="top">
                                                        <asp:CheckBoxList ID="cblSpecialSingers" runat="server" RepeatColumns="2" Width="100%"
                                                            meta:resourcekey="cblSpecialSingersResource1">
                                                            <asp:ListItem Value="IS_APPLYER_SIGN" meta:resourcekey="ListItemResource1" Text="申請者"></asp:ListItem>
                                                            <asp:ListItem Value="IS_LAST_AGENT_SIGN" meta:resourcekey="ListItemResource3" Text="上一站點代理人"></asp:ListItem>
                                                            <asp:ListItem Value="IS_APPLYER_SUPERIOR_SIGN" meta:resourcekey="ListItemResource4"
                                                                Text="申請者直屬主管"></asp:ListItem>
                                                            <asp:ListItem Value="IS_LAST_SUPERIOR_SIGN" meta:resourcekey="ListItemResource5"
                                                                Text="上一站直屬主管"></asp:ListItem>
                                                        </asp:CheckBoxList>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="PopTableLeftTD">
                                            <div align="center">
                                                <asp:Label ID="lblGeneralSingers" runat="server" Text="一般簽核" meta:resourcekey="lblGeneralSingersResource1"></asp:Label>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="PopTableRightTD" style="text-align: center; width: 100%" align="center">
                                            <center style="width: 100%">
                                                <div style="width: 100%">
                                                    <uc1:UC_ChoiceList ID="UC_ChoiceList_Sign" runat="server" ShowMember="False" />
                                                </div>
                                            </center>
                                        </td>
                                    </tr>
                                </table>
                    </telerik:RadPageView>
                    <telerik:RadPageView ID="RadPageView2" runat="server" meta:resourcekey="RadPageView2Resource1">
                        <table class="PopTable" cellpadding="0" cellspacing="1">
                                    <tr>
                                        <td class="PopTableLeftTD">
                                            <telerik:RadToolBar ID="radToolBarByBeforeSign" runat="server" meta:resourcekey="webToolBarByBeforeSignResource1"
                                                OnClientButtonClicking="radToolBarByBeforeSign_Clicking" OnButtonClick="radToolBarByBeforeSign_Click" Width="100%" SingleClick="None">
                                                <Items>
                                                    <telerik:RadToolBarButton runat="server"
                                                         Text="設定知會人員" Value="SetNodify" meta:resourcekey="TBarButtonResource1">
                                                    </telerik:RadToolBarButton>
                                                    <telerik:RadToolBarButton runat="server" IsSeparator="True" Text="Button 1" ImageUrl="~/App_Themes/DefaultTheme/images/toolbarSp.jpg" meta:resourcekey="RadToolBarButtonResource1">
                                                    </telerik:RadToolBarButton>                                    
                                                </Items>
                                            </telerik:RadToolBar>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="PopTableRightTD" style="text-align: center">
                                            <Fast:Grid ID="gridSignAlter" runat="server" Width="100%"  
                                                DataKeyNames="NOTIFY_ID"  AutoGenerateCheckBoxColumn="False"
                                                DataKeyOnClientWithCheckBox="True" EnhancePager="True" PageSize="15" AutoGenerateColumns="False"
                                                AllowSorting="True" DefaultSortDirection="Ascending" OnRowDataBound="gridSignAlter_RowDataBound"
                                                EmptyDataText="沒有資料" KeepSelectedRows="False"
                                                meta:resourcekey="gridSignAlterResource1"   >
                                                <EnhancePagerSettings ShowHeaderPager="True" />
                                                <ExportExcelSettings AllowExportToExcel="False" />
                                                <Columns>
                                                    <asp:BoundField DataField="COND_ID" HeaderText="條件" meta:resourcekey="BoundFieldResource1" >
                                                        <HeaderStyle Wrap="false" />
                                                        <ItemStyle Width="100px" HorizontalAlign="Left" />
                                                    </asp:BoundField>
                                                    <asp:TemplateField HeaderText="特殊知會" meta:resourcekey="TemplateFieldResource1">
                                                        <HeaderStyle Wrap="false" />
                                                        <ItemStyle Width="125px" HorizontalAlign="Left" />
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblSpecialAlter" runat="server" meta:resourcekey="lblSpecialAlterResource1"></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="一般知會" meta:resourcekey="TemplateFieldResource2">
                                                        <HeaderStyle Wrap="false" />
                                                        <ItemStyle HorizontalAlign="Left" />
                                                        <ItemTemplate>
                                                            <uc1:UC_ChoiceList ID="uc_Alter" IsAllowEdit="false" runat="server" ShowMember="False" ExpandToUser="False" />
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                </Columns>
                                            </Fast:Grid>
                                        </td>
                                    </tr>
                                </table>
                    </telerik:RadPageView>
                    <telerik:RadPageView ID="RadPageView3" runat="server" meta:resourcekey="RadPageView3Resource1">
                        <table class="PopTable" cellpadding="0" cellspacing="1">
                                    <tr>
                                        <td class="PopTableLeftTD">
                                            <telerik:RadToolBar ID="radToolBarByAfterSign" Runat="server" meta:resourcekey="webToolBarByAfterSignResource1"
                                                OnClientButtonClicking="radToolBarByAfterSign_Clicking" OnButtonClick="radToolBarByAfterSign_Click" Width="100%" SingleClick="None">
                                                <Items>
                                                    <telerik:RadToolBarButton runat="server"
                                                         Text="設定知會人員" Value="SetNodify" meta:resourcekey="TBarButtonResource2">
                                                    </telerik:RadToolBarButton>
                                                    <telerik:RadToolBarButton runat="server" IsSeparator="True" Text="Button 1" ImageUrl="~/App_Themes/DefaultTheme/images/toolbarSp.jpg" meta:resourcekey="RadToolBarButtonResource2">
                                                    </telerik:RadToolBarButton>                                    
                                                </Items>
                                            </telerik:RadToolBar>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="PopTableRightTD" style="text-align: center">
                                            <Fast:Grid ID="gridSignedAlter" runat="server" Width="100%" 
                                                 DataKeyNames="NOTIFY_ID"  AutoGenerateCheckBoxColumn="False"
                                                DataKeyOnClientWithCheckBox="True" EnhancePager="True" PageSize="15" AutoGenerateColumns="False"
                                                AllowSorting="True" DefaultSortDirection="Ascending" OnRowDataBound="gridSignedAlter_RowDataBound"
                                                EmptyDataText="沒有資料" KeepSelectedRows="False"
                                                meta:resourcekey="gridSignedAlterResource1"   >
                                                <EnhancePagerSettings ShowHeaderPager="True" />
                                                <ExportExcelSettings AllowExportToExcel="False" />
                                                <Columns>
                                                    <asp:BoundField DataField="COND_ID" HeaderText="條件" meta:resourcekey="BoundFieldResource2" >
                                                        <HeaderStyle Wrap="false" />
                                                        <ItemStyle Width="100px" HorizontalAlign="Left" />
                                                    </asp:BoundField>
                                                    <asp:TemplateField HeaderText="特殊知會" meta:resourcekey="TemplateFieldResource3">
                                                        <HeaderStyle Wrap="false" />
                                                        <ItemStyle Width="125px" HorizontalAlign="Left" />
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblSpecialAlter" runat="server" meta:resourcekey="lblSpecialAlterResource2"></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="一般知會" meta:resourcekey="TemplateFieldResource4">
                                                        <HeaderStyle Wrap="false" />
                                                        <ItemStyle HorizontalAlign="Left" />
                                                        <ItemTemplate>
                                                            <uc1:UC_ChoiceList ID="uc_Alter" IsAllowEdit="false" runat="server" ShowMember="False" ExpandToUser="False" />
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                </Columns>
                                            </Fast:Grid>
                                        </td>
                                    </tr>
                                </table>
                    </telerik:RadPageView>
                </telerik:RadMultiPage>
            </td>
        </tr>
    </table>
    <asp:Panel ID="panelLimit" runat="server" Visible="False" meta:resourcekey="panelLimitResource1">
        <table width="100%" class="PopTable" cellspacing="1">
            <tr>
                <td class="PopTableHeader" style="height: 27px; text-align: center" align="center">
                    <center>
                        <asp:Label ID="Label4" runat="server" Text="限定人員" meta:resourcekey="Label4Resource1"></asp:Label>
                    </center>
                </td>
            </tr>
            <tr>
                <td style="background-color: White; height: 27px" valign="top">
                    <asp:CustomValidator ID="cvLimit" runat="server" ErrorMessage="限定人員(選擇允許下列人員)，至少選擇包含同部門人員或選取限制人員範圍。"
                        Display="Dynamic" meta:resourcekey="cvLimitResource1"></asp:CustomValidator>
                    <uc2:UC_LimitChoice ID="UC_LimitChoice" runat="server" />
                </td>
            </tr>
        </table>
    </asp:Panel>
    <br />
    &nbsp;
    <asp:Label ID="lblComment" runat="server" Text="註：此為觀看頁面，若要修改站點資訊，請至「維護流程」中設定。" Visible="False"
        meta:resourcekey="lblCommentResource1"></asp:Label><br />
    <asp:Panel ID="Panel2" runat="server" Height="50px" Visible="False" Width="125px"
        meta:resourcekey="Panel2Resource1">
        <asp:Label ID="lblIsEndFlow" runat="server" Text="可否結束流程" meta:resourcekey="lblIsEndFlowResource1"
            Visible="False"></asp:Label>
        <asp:RadioButton ID="rbAllowEndFlow" runat="server" GroupName="isEndFlow" Text="允許"
            meta:resourcekey="rbAllowEndFlowResource1" Visible="False" /><asp:RadioButton ID="rbDisallowEndFlow"
                runat="server" Checked="True" GroupName="isEndFlow" Text="不允許" meta:resourcekey="rbDisallowEndFlowResource1"
                Visible="False" />
    </asp:Panel>
    <asp:Panel ID="Panel3" runat="server" Visible="False" meta:resourcekey="Panel3Resource1">
        <asp:Label ID="lblIsJumpSign" runat="server" Text="可否跳簽" meta:resourcekey="lblIsJumpSignResource1"></asp:Label>
        <asp:RadioButton ID="rdAllowJumpSign" runat="server" GroupName="isJumpSign" Text="允許"
            meta:resourcekey="rdAllowJumpSignResource1" />
        <asp:RadioButton ID="rdDisAllowJumpSign" runat="server" GroupName="isJumpSign" Text="不允許"
            meta:resourcekey="rdDisAllowJumpSignResource1" Checked="True" />
    </asp:Panel>
    <asp:Panel ID="Panel1" runat="server" Visible="False" meta:resourcekey="Panel1Resource1">
        <asp:Label ID="lblIsAdditionalSign" runat="server" Text="可否加簽" meta:resourcekey="lblIsAdditionalSignResource1"
            Visible="False"></asp:Label>
        <asp:RadioButton ID="rdAllowAdditionalSign" runat="server" GroupName="isAdditionalSign"
            Text="允許" meta:resourcekey="rdAllowAdditionalSignResource1" />
        <asp:RadioButton ID="rdDisallowAdditionalSign" runat="server" Checked="True" GroupName="isAdditionalSign"
            Text="不允許" meta:resourcekey="rdDisallowAdditionalSignResource1" />
    </asp:Panel>
    <telerik:RadTreeView ID="treeCondition" runat="server" Visible="False" meta:resourcekey="treeConditionResource2"></telerik:RadTreeView>
    <asp:Label ID="lblAfterNotified" runat="server" Text="簽核後知會" Visible="False" meta:resourcekey="lblAfterNotifiedResource1"></asp:Label>
    <asp:Label ID="lblBeforeNotified" runat="server" Text="簽核前知會" Visible="False" meta:resourcekey="lblBeforeNotifiedResource1"></asp:Label>
    <asp:Label ID="lblApprover" runat="server" Text="簽核人員" Visible="False" meta:resourcekey="lblApproverResource1"></asp:Label>
    <asp:Label ID="lblDefault" runat="server" Text="其他" Visible="False" meta:resourcekey="lblDefaultResource1"></asp:Label>
</asp:Content>
