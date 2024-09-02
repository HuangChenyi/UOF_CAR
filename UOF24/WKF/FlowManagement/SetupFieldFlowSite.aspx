<%@ Page Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="WKF_FlowManagement_SetupFieldFlowSite" Title="設定組織欄位站點" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" Codebehind="SetupFieldFlowSite.aspx.cs" %>

<%@ Register Src="../../Common/ChoiceCenter/UC_ChoiceList.ascx" TagName="UC_ChoiceList" TagPrefix="uc1" %>
<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register Src="~/WKF/FlowManagement/UC_SignDirections.ascx" TagPrefix="uc1" TagName="UC_SignDirections" %>



<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <script type="text/javascript" id="telerikClientEvents1">
        function radToolBarByBeforeSign_Clicking(sender, args) {
            var value = args.get_item().get_value();

            if (value == "SetNodify") {
                var formVersionId = $uof.tool.htmlDecode('<%= System.Web.Security.AntiXss.AntiXssEncoder.HtmlEncode(Request.QueryString["formVersionId"], true) %>');
                var siteId = $uof.tool.htmlDecode('<%= System.Web.Security.AntiXss.AntiXssEncoder.HtmlEncode(Request.QueryString["siteId"], true) %>');
                args.set_cancel(true);
                $uof.dialog.open2("~/WKF/FormManagement/ManageSiteNotifyCondition.aspx", args.get_item(), "", 1200, 700, openDialogResult, { "SITE_ID": siteId, "formVersionId": formVersionId, "notifyType": "0" });
            }
        }

        function radToolBarByAfterSign_Clicking(sender, args) {
            var value = args.get_item().get_value();

            if (value == "SetNodify") {
                var formVersionId = $uof.tool.htmlDecode('<%= System.Web.Security.AntiXss.AntiXssEncoder.HtmlEncode(Request.QueryString["formVersionId"], true) %>');
                var siteId = $uof.tool.htmlDecode('<%= System.Web.Security.AntiXss.AntiXssEncoder.HtmlEncode(Request.QueryString["siteId"], true) %>');
                args.set_cancel(true);
                $uof.dialog.open2("~/WKF/FormManagement/ManageSiteNotifyCondition.aspx", args.get_item(), "", 1200, 700, openDialogResult, { "SITE_ID": siteId, "formVersionId": formVersionId, "notifyType": "1" });
            }
        }

        function openDialogResult(returnValue) {
            if (typeof (returnValue) == "undefined") {
                return false;
            }
            return true;
        }
    </script>

    <table width="100%" class="PopTable" cellspacing="1">
        <tr>
            <td align="center" class="PopTableHeader" colspan="4" style="height: 27px">
                <center>
             <asp:Label ID="lblSiteSignTitle" runat="server" Text="組織欄位站點" meta:resourcekey="lblSiteSignTitleResource1"></asp:Label>
             </center>
            </td>
        </tr>
        <tr>
            <td class="PopTableLeftTD" style="width: 20%; height: 27px">
                <asp:Label ID="lblSignType" runat="server" Text="簽核型態" meta:resourcekey="lblSignTypeResource1"></asp:Label></td>
            <td class="PopTableRightTD" style="height: 27px; white-space:nowrap">
                <asp:RadioButton ID="rbSignType0" runat="server" Checked="True" GroupName="singType" Text="一般" meta:resourcekey="rbSignType0Resource1" />
                <asp:RadioButton ID="rbSignType1" runat="server" GroupName="singType" Text="並簽" meta:resourcekey="rbSignType1Resource1" />
                <asp:RadioButton ID="rbSignType2" runat="server" GroupName="singType" Text="會簽" meta:resourcekey="rbSignType2Resource1" />
                <br />
                <uc1:UC_SignDirections runat="server" ID="UC_SignDirections" />
            </td>
            <td style="width: 20%; height: 27px; white-space:nowrap" class="PopTableLeftTD">
                <asp:Label ID="Label1" runat="server" Text="此站點是否可變更" meta:resourcekey="Label1Resource1"></asp:Label></td>
            <td style="width: 30%; height: 27px" class="PopTableRightTD">
                <asp:RadioButton ID="rbYesModify" runat="server" GroupName="IsModifiable" Text="是" meta:resourcekey="rbYesModifyResource1" />
                <asp:RadioButton ID="rbNoModify" runat="server" GroupName="IsModifiable" Text="否" meta:resourcekey="rbNoModifyResource1" Checked="True" />
            </td>
        </tr>
        <tr>

            <td style="height: 27px; width: 20%;" class="PopTableLeftTD">
                <asp:Label ID="lblTimeoutCount" runat="server" Text="逾時設定" meta:resourcekey="lblTimeoutCountResource1"></asp:Label></td>
            <td style="height: 27px" class="PopTableRightTD">

                <telerik:RadNumericTextBox ID="txtTimeoutCount" runat="server" Width="60px" MinValue="0" Value="0" DataType="Int32">
                    <NumberFormat ZeroPattern="n" AllowRounding="False" DecimalDigits="0"></NumberFormat>
                </telerik:RadNumericTextBox>
                <asp:Label ID="Label2" runat="server" Text="小時" meta:resourcekey="Label2Resource1"></asp:Label>
                <asp:Label ID="Label8" runat="server" Text="[0表示不設定]" CssClass="SizeMemo" meta:resourcekey="Label8Resource1"></asp:Label>

            </td>
            <td style="height: 27px; width: 20%;" class="PopTableLeftTD">
                <asp:Label ID="Label12" runat="server" Text="簽核提醒頻率" meta:resourcekey="Label12Resource1"></asp:Label>
            </td>
            <td style="height: 27px" class="PopTableRightTD">
                <telerik:RadNumericTextBox ID="txtCycleHour" runat="server" Width="60px" MinValue="0" Value="0" DataType="Int32">
                    <NumberFormat ZeroPattern="n" AllowRounding="False" DecimalDigits="0"></NumberFormat>
                </telerik:RadNumericTextBox>
                <asp:Label ID="Label6" runat="server" Text="小時" meta:resourcekey="Label2Resource1"></asp:Label>
                <asp:Label ID="Label7" runat="server" Text="[0表示不設定]" CssClass="SizeMemo" meta:resourcekey="Label7Resource1"></asp:Label>
            </td>

        </tr>
        <tr>
            <td style="height: 27px">
                <asp:Label runat="server" Text="自動送至下一站" meta:resourcekey="LabelResource1"></asp:Label>
            </td>
            <td style="height: 27px" colspan="3">
                <telerik:RadNumericTextBox ID="txtAutoSignHour" runat="server" Width="60px" MinValue="0" Value="0" DataType="Int32">
                    <NumberFormat ZeroPattern="n" AllowRounding="False" DecimalDigits="0"></NumberFormat>
                </telerik:RadNumericTextBox>
                <asp:Label ID="Label4" runat="server" Text="小時" meta:resourcekey="Label2Resource1"></asp:Label>
                <asp:Label ID="Label9" runat="server" Text="[0表示不設定]" CssClass="SizeMemo" meta:resourcekey="Label9Resource1"></asp:Label>
            </td>
        </tr>
    </table>
    <table width="100%" class="PopTable" cellspacing="1">
        <tr>
            <td class="PopTableHeader" style="height: 27px" align="center">
                <center><asp:Label ID="lblSetupSignerTitle" runat="server" Text="設定人員" meta:resourcekey="lblSetupSignerTitleResource1"></asp:Label>
            </center>
            </td>
        </tr>
        <tr>
            <td>

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
                                <td align="center" class="PopTableLeftTD">
                                    <div align="center">
                                        <asp:Label ID="lblGeneralSingers" runat="server" Text="簽核人員" meta:resourcekey="lblGeneralSingersResource1"></asp:Label>
                                        <asp:Label ID="lblGeneralFieldName" runat="server" Text="(欄位代號)" meta:resourcekey="lblGeneralFieldNameResource1"></asp:Label>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td valign="middle" class="PopTableRightTD">
                                    <div align="center">
                                        <table>
                                            <tr>
                                                <td>
                                                    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                                                        <ContentTemplate>
                                                            <asp:TextBox ID="tbxFieldID" runat="server" Style="text-align: center"
                                                                meta:resourcekey="tbxFieldIDResource1"></asp:TextBox>
                                                        </ContentTemplate>
                                                        <Triggers>
                                                            <asp:AsyncPostBackTrigger ControlID="btnSearchField" EventName="Click" />
                                                        </Triggers>
                                                    </asp:UpdatePanel>
                                                </td>
                                                <td>&nbsp;<asp:Button ID="btnSearchField" runat="server" Text="...."
                                                    CausesValidation="False" Style="cursor: pointer"
                                                    OnClick="btnSearchField_Click" meta:resourcekey="btnSearchFieldResource1" />&nbsp;
                                                        <asp:CustomValidator ID="CustomValidator1" runat="server" ErrorMessage="請輸入表單欄位代號" Display="Dynamic" meta:resourcekey="RequiredFieldValidator2Resource1"></asp:CustomValidator></td>
                                            </tr>
                                        </table>
                                    </div>
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
                                    <Fast:Grid ID="gridSignAlter" runat="server"
                                        Width="100%" DataKeyNames="NOTIFY_ID"
                                        AutoGenerateCheckBoxColumn="False"
                                        DataKeyOnClientWithCheckBox="True"
                                        EnhancePager="True" PageSize="15" AutoGenerateColumns="False" AllowSorting="True"
                                        DefaultSortDirection="Ascending"
                                        OnRowDataBound="gridSignAlter_RowDataBound" EmptyDataText="沒有資料" KeepSelectedRows="False"
                                        meta:resourcekey="gridSignAlterResource1">
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
                                                    <asp:Label ID="lblSpecialAlterBefore" runat="server" meta:resourcekey="lblSpecialAlterResource1"></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="一般知會" meta:resourcekey="TemplateFieldResource2">
                                                <HeaderStyle Wrap="false" />
                                                <ItemStyle HorizontalAlign="Left" />
                                                <ItemTemplate>
                                                    <uc1:UC_ChoiceList ID="UC_ChoiceList1" IsAllowEdit="false" runat="server" ShowMember="False" ExpandToUser="False" />
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
                                    <telerik:RadToolBar ID="radToolBarByAfterSign" runat="server" meta:resourcekey="webToolBarByAfterSignResource1"
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
                                    <Fast:Grid ID="gridSignedAlter" runat="server"
                                        Width="100%" DataKeyNames="NOTIFY_ID"
                                        AutoGenerateCheckBoxColumn="False"
                                        DataKeyOnClientWithCheckBox="True"
                                        EnhancePager="True" PageSize="15" AutoGenerateColumns="False" AllowSorting="True"
                                        DefaultSortDirection="Ascending"
                                        OnRowDataBound="gridSignedAlter_RowDataBound" EmptyDataText="沒有資料" KeepSelectedRows="False" meta:resourcekey="gridSignedAlterResource1">
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
                                                    <asp:Label ID="lblSpecialAlter" runat="server"
                                                        meta:resourcekey="lblSpecialAlterResource2"></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="一般知會" meta:resourcekey="TemplateFieldResource4">
                                                <HeaderStyle Wrap="false" />
                                                <ItemStyle HorizontalAlign="Left" />
                                                <ItemTemplate>
                                                    <uc1:UC_ChoiceList ID="uc_Alter" IsAllowEdit="false" runat="server" ShowMember="False"
                                                        ExpandToUser="False" />
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


    <br />

    &nbsp;
    <asp:Label ID="lblComment" runat="server" Text="註：此為觀看頁面，若要修改站點資訊，請至「維護流程」中設定。" Visible="False" meta:resourcekey="lblCommentResource1"></asp:Label>
    <br />
    <asp:Panel ID="Panel2" runat="server" Height="50px" Visible="False" Width="125px" meta:resourcekey="Panel2Resource1">
        <asp:Label ID="lblIsEndFlow" runat="server" Text="可否結束流程" meta:resourcekey="lblIsEndFlowResource1" Visible="False"></asp:Label>
        <asp:RadioButton ID="rbAllowEndFlow" runat="server" GroupName="isEndFlow" Text="允許" meta:resourcekey="rbAllowEndFlowResource1" Visible="False" />
        <asp:RadioButton ID="rbDisallowEndFlow" runat="server" Checked="True" GroupName="isEndFlow" Text="不允許" meta:resourcekey="rbDisallowEndFlowResource1" Visible="False" />
    </asp:Panel>
    <asp:Panel ID="Panel3" runat="server" Visible="False" meta:resourcekey="Panel3Resource1">
        <asp:Label ID="lblIsJumpSign" runat="server" Text="可否跳簽" meta:resourcekey="lblIsJumpSignResource1"></asp:Label>
        <asp:RadioButton ID="rdAllowJumpSign" runat="server" GroupName="isJumpSign" Text="允許" meta:resourcekey="rdAllowJumpSignResource1" />
        <asp:RadioButton ID="rdDisAllowJumpSign" runat="server" GroupName="isJumpSign" Text="不允許" meta:resourcekey="rdDisAllowJumpSignResource1" Checked="True" />
    </asp:Panel>
    <asp:Panel ID="Panel1" runat="server" Visible="False" meta:resourcekey="Panel1Resource1">
        <asp:Label ID="lblIsAdditionalSign" runat="server" Text="可否加簽" meta:resourcekey="lblIsAdditionalSignResource1" Visible="False"></asp:Label>
        <asp:RadioButton ID="rdAllowAdditionalSign" runat="server" GroupName="isAdditionalSign" Text="允許" meta:resourcekey="rdAllowAdditionalSignResource1" />
        <asp:RadioButton ID="rdDisallowAdditionalSign" runat="server" Checked="True" GroupName="isAdditionalSign" Text="不允許" meta:resourcekey="rdDisallowAdditionalSignResource1" />
    </asp:Panel>
    <asp:Label ID="lblSetFormField" runat="server" Text="選擇表單欄位" Visible="False"
        meta:resourcekey="lblSetFormFieldResource1"></asp:Label>
    <telerik:RadTreeView ID="treeCondition" runat="server" Width="100%" Height="100%" Visible="False" meta:resourcekey="treeConditionResource2"></telerik:RadTreeView>

    <asp:CheckBoxList ID="cblSpecialSingers" runat="server" RepeatColumns="2"
        Width="100%" Visible="False"
        meta:resourcekey="cblSpecialSingersResource1">
        <asp:ListItem Value="IS_APPLYER_SIGN" meta:resourcekey="ListItemResource1" Text="申請者"></asp:ListItem>
        <asp:ListItem Value="IS_LAST_AGENT_SIGN" meta:resourcekey="ListItemResource3" Text="上一站點代理人"></asp:ListItem>
        <asp:ListItem Value="IS_APPLYER_SUPERIOR_SIGN" meta:resourcekey="ListItemResource4"
            Text="申請者直屬主管">
        </asp:ListItem>
        <asp:ListItem Value="IS_LAST_SUPERIOR_SIGN" meta:resourcekey="ListItemResource5"
            Text="上一站直屬主管">
        </asp:ListItem>
    </asp:CheckBoxList>

    <asp:Label ID="lblApprover" runat="server" Text="簽核人員" Visible="False" meta:resourcekey="lblApproverResource1"></asp:Label>
    <asp:Label ID="lblBeforeNotified" runat="server" Text="簽核前知會" Visible="False" meta:resourcekey="lblBeforeNotifiedResource1"></asp:Label>
    <asp:Label ID="lblAfterNotified" runat="server" Text="簽核後知會" Visible="False" meta:resourcekey="lblAfterNotifiedResource1"></asp:Label>
    <asp:Label ID="lblDefault" runat="server" Text="其他" Visible="False" meta:resourcekey="lblDefaultResource1"></asp:Label>

</asp:Content>


