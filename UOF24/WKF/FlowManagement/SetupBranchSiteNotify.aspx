<%@ Page Title="設定副流程起結束通知" Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="WKF_FlowManagement_SetupBranchSiteNotify" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" Codebehind="SetupBranchSiteNotify.aspx.cs" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>
<%@ Register Src="../../Common/ChoiceCenter/UC_ChoiceList.ascx" TagName="UC_ChoiceList" TagPrefix="uc2" %>
<%@ Reference Control="../../Common/ChoiceCenter/UC_ChoiceList.ascx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <style>
        .PageStyle > tbody > tr {
            width:100%;
        }

        .PageStyle > tbody > tr > td:first-child {
            width:180px;
        }
    </style>
    <script type="text/javascript">
        Sys.Application.add_load(function () {
            if ($('#<%=rbBySubFlowDesign.ClientID%>').prop("checked") == true) {
                $('#<%=Panel1.ClientID%>').hide();

            }
            else {
                $('#<%=Panel1.ClientID%>').show();
            }

        });

        function RadToolBar1_ButtonClicking(sender, args) {
            var value = args.get_item().get_value();
            if (value == "SetStartFormCondition") {
                //新增判斷式
                args.set_cancel(true);
                $uof.dialog.open2("~/WKF/FlowManagement/ManageBranchSiteNotifyCondition.aspx", args.get_item(), "", 940, 600, openDialogResult, {
                    "Notify_Type": "0",
                    "FormCondition": "Y",
                    "formVersionId": $uof.tool.htmlDecode("<%=System.Web.Security.AntiXss.AntiXssEncoder.HtmlEncode(formVersionId, true)%>"),
                    "siteId": $uof.tool.htmlDecode("<%=System.Web.Security.AntiXss.AntiXssEncoder.HtmlEncode(siteId, true)%>"),
                    "branchSeq": $uof.tool.htmlDecode("<%=System.Web.Security.AntiXss.AntiXssEncoder.HtmlEncode(branchSeq,true)%>")
                });
            }

            if (value == "SetEndFormCondition") {
                //新增判斷式
                args.set_cancel(true);
                $uof.dialog.open2("~/WKF/FlowManagement/ManageBranchSiteNotifyCondition.aspx", args.get_item(), "", 940, 600, openDialogResult, {
                    "Notify_Type": "1",
                    "FormCondition": "Y",
                    "formVersionId": $uof.tool.htmlDecode("<%=System.Web.Security.AntiXss.AntiXssEncoder.HtmlEncode(formVersionId, true)%>"),
                    "siteId": $uof.tool.htmlDecode("<%=System.Web.Security.AntiXss.AntiXssEncoder.HtmlEncode(siteId,true)%>"),
                    "branchSeq": $uof.tool.htmlDecode("<%=System.Web.Security.AntiXss.AntiXssEncoder.HtmlEncode(branchSeq, true)%>")
                });
            }
        }

        function RadToolBar2_ButtonClicking(sender, args) {
            var value = args.get_item().get_value();
            if (value == "SetStartFormCondition") {
                //新增判斷式
                args.set_cancel(true);
                $uof.dialog.open2("~/WKF/FlowManagement/ManageBranchSiteNotifyCondition.aspx", args.get_item(), "", 940, 600, openDialogResult, {
                    "Notify_Type": "0",
                    "FormCondition": "Y",
                    "formVersionId": $uof.tool.htmlDecode("<%=System.Web.Security.AntiXss.AntiXssEncoder.HtmlEncode(formVersionId, true)%>"),
                    "siteId": $uof.tool.htmlDecode("<%=System.Web.Security.AntiXss.AntiXssEncoder.HtmlEncode(siteId, true)%>"),
                    "branchSeq": $uof.tool.htmlDecode("<%=System.Web.Security.AntiXss.AntiXssEncoder.HtmlEncode(branchSeq, true)%>")
                });
            }

            if (value == "SetEndFormCondition") {
                //新增判斷式
                args.set_cancel(true);
                $uof.dialog.open2("~/WKF/FlowManagement/ManageBranchSiteNotifyCondition.aspx", args.get_item(), "", 940, 600, openDialogResult, {
                    "Notify_Type": "1",
                    "FormCondition": "Y",
                    "formVersionId": $uof.tool.htmlDecode("<%=System.Web.Security.AntiXss.AntiXssEncoder.HtmlEncode(formVersionId, true)%>"),
                    "siteId": $uof.tool.htmlDecode("<%=System.Web.Security.AntiXss.AntiXssEncoder.HtmlEncode(siteId, true)%>"),
                    "branchSeq": $uof.tool.htmlDecode("<%=System.Web.Security.AntiXss.AntiXssEncoder.HtmlEncode(branchSeq, true)%>")
                });
            }
        }

        function openDialogResult(returnValue) {
            if (typeof (returnValue) == "undefined") {
                return false;
            }
            return true;
        }

        function onBasisTypeClick() {
            if ($('#<%=rbBySubFlowDesign.ClientID%>').prop("checked") == true) {
                $('#<%=Panel1.ClientID%>').hide();

            }
            else {
                $('#<%=Panel1.ClientID%>').show();
            }
        }

        function ValidateFieldId(sender, args) {
            if ($('#<%=rbBySubFlowDesign.ClientID%>').prop("checked") == true) {
                args.IsValid = true;
            }
            else {
                if ($('#<%=lblFieldId.ClientID%>').text() == "")
                    args.IsValid = false;
                else
                    args.IsValid = true;
            }
        }
    </script>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
    <table width="100%" class="PopTable PageStyle">
        <tr>
            <td>
                <asp:Label runat="server" Text="至少需簽幾站" meta:resourcekey="LabelResource1"></asp:Label>
            </td>
            <td>
                <telerik:RadNumericTextBox ID="txtSiteNum" runat="server" Width="60px" MinValue="0" Value="0" DataType="System.String" Culture="zh-TW" DbValueFactor="1" LabelWidth="24px" meta:resourcekey="txtSiteNumResource1" LabelCssClass="">
                    <NegativeStyle Resize="None" />
                    <NumberFormat ZeroPattern="n" AllowRounding="False" DecimalDigits="0"></NumberFormat>
                    <EmptyMessageStyle Resize="None" />
                    <ReadOnlyStyle Resize="None" />
                    <FocusedStyle Resize="None" />
                    <DisabledStyle Resize="None" />
                    <InvalidStyle Resize="None" />
                    <HoveredStyle Resize="None" />
                    <EnabledStyle Resize="None" />
                </telerik:RadNumericTextBox><br />
                <asp:Label ID="Label2" runat="server" Text="【注意事項】" CssClass="SizeMemo" meta:resourcekey="Label2Resource1"></asp:Label><br />
                <asp:Label ID="Label3" runat="server" Text="1. 0表示不設定" CssClass="SizeMemo" meta:resourcekey="Label3Resource1"></asp:Label><br />
                <asp:Label ID="Label4" runat="server" Text="2. 至少需簽核幾站才可結束副流程" CssClass="SizeMemo" meta:resourcekey="Label4Resource1"></asp:Label><br />
                <asp:Label ID="Label5" runat="server" Text="3. 會搭配副流程中個別站點的結案設定" CssClass="SizeMemo" meta:resourcekey="Label5Resource1"></asp:Label><br />
                <asp:Label ID="Label1" runat="server" Text="4. 副流程中所設定的自訂流程不列入計數" CssClass="SizeMemo" meta:resourcekey="Label1Resource1"></asp:Label><br />
                <asp:Label ID="Label6" runat="server" Text="5. 副流程中所加簽站點不列入計數" CssClass="SizeMemo" meta:resourcekey="Label6Resource1"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label runat="server" Text="副流程結束後呼叫DLL:"></asp:Label>
            </td>
            <td>
                <asp:DropDownList ID="ddlTriggers" runat="server"></asp:DropDownList>
            </td>
         </tr>
        <tr>
            <td>
                <asp:Label runat="server" Text="副流程起始依據" meta:resourcekey="LabelResource4"></asp:Label>
            </td>
            <td>
                <table cellpadding="0" cellspacing="0">
                    <tr>
                        <td>
                            <asp:RadioButton ID="rbBySubFlowDesign" runat="server" GroupName="rbSetting" Text="繼承副流程設計" onclick="onBasisTypeClick()" Checked="True" meta:resourcekey="rbBySubFlowDesignResource1" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:RadioButton ID="rbByFieldId" runat="server" GroupName="rbSetting" Text="依表單欄位" onclick="onBasisTypeClick()" meta:resourcekey="rbByFieldIdResource1" />
                        </td>

                    </tr>
                    <tr>
                        <td>
                            <asp:Panel ID="Panel1" runat="server" meta:resourcekey="Panel1Resource1">
                                <asp:Label ID="Label7" runat="server" Text="欄位ID: " meta:resourcekey="Label7Resource1"></asp:Label>
                                <asp:Label ID="lblFieldId" runat="server" meta:resourcekey="lblFieldIdResource1"></asp:Label>
                                <asp:Button ID="btnSearchField" runat="server" Text="選擇欄位"
                                    CausesValidation="False" Style="cursor: pointer"
                                    OnClick="btnSearchField_Click" meta:resourcekey="btnSearchFieldResource1" />&nbsp;
    
                                            <asp:CustomValidator ID="CustomValidator1" runat="server" ErrorMessage="請選擇表單欄位代號" Display="Dynamic" ClientValidationFunction="ValidateFieldId" meta:resourcekey="CustomValidator1Resource1"></asp:CustomValidator>
                            </asp:Panel>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label runat="server" Text="起始通知" meta:resourcekey="LabelResource2"></asp:Label>
            </td>
            <td>
                <table style="width:100%">
                    <tr>
                        <td colspan="2">
                            <telerik:RadToolBar ID="RadToolBar1" runat="server" OnClientButtonClicking="RadToolBar1_ButtonClicking" Width="100%" OnButtonClick="RadToolBar1_ButtonClick" meta:resourcekey="UltraWebToolbar1Resource1" SingleClick="None">
                                <Items>
                                    <telerik:RadToolBarButton runat="server" DisabledImageUrl="~/Common/Images/Icon/icon_m06_g.gif"
                                        HoveredImageUrl="~/Common/Images/Icon/icon_m06.gif"
                                        ImageUrl="~/Common/Images/Icon/icon_m06.gif"
                                        Value="SetStartFormCondition"
                                        CheckedImageUrl="~/Common/Images/Icon/icon_m06.gif"
                                        Text="設定" meta:resourcekey="TBarButtonResourceSet1">
                                    </telerik:RadToolBarButton>
                                    <telerik:RadToolBarButton runat="server" IsSeparator="True" Text="Button 1" ImageUrl="~/App_Themes/DefaultTheme/images/toolbarSp.jpg" meta:resourcekey="RadToolBarButtonResource1">
                                    </telerik:RadToolBarButton>
                                </Items>
                            </telerik:RadToolBar>
                        </td>
                    </tr>
                    <tr>
                        <td valign="top" style="width: 100%" colspan="2">
                            <Fast:Grid ID="StartFormGrid" runat="server"
                                Width="100%"
                                AutoGenerateColumns="False"
                                AutoGenerateCheckBoxColumn="False" AllowSorting="True"
                                DataKeyOnClientWithCheckBox="False"
                                EnhancePager="True" PageSize="15"
                                OnRowDataBound="StartFormGrid_RowDataBound"
                                DefaultSortDirection="Ascending" EmptyDataText="沒有資料" KeepSelectedRows="False" CustomDropDownListPage="False" meta:resourcekey="StartFormGridResource1" SelectedRowColor="" UnSelectedRowColor="">
                                <EnhancePagerSettings ShowHeaderPager="True" />

                                <ExportExcelSettings AllowExportToExcel="False"></ExportExcelSettings>
                                <Columns>
                                    <asp:BoundField DataField="NOTIFY_ID" HeaderText="條件"
                                        meta:resourcekey="BoundFieldResource1">
                                        <HeaderStyle Width="30%" />
                                    </asp:BoundField>
                                    <asp:TemplateField HeaderText="起始通知人員" meta:resourcekey="TemplateFieldResource1">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("COND_ID") %>' meta:resourcekey="TextBox1Resource1"></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <uc2:UC_ChoiceList ID="uc_NotifyUsers" runat="server" ExpandToUser="False"
                                                IsAllowEdit="False" />
                                        </ItemTemplate>
                                        <HeaderStyle Width="70%" />
                                    </asp:TemplateField>
                                </Columns>
                            </Fast:Grid>

                        </td>
                    </tr>
                </table>
            </td>
            <tr>
                <td>
                    <asp:Label runat="server" Text="結束通知" meta:resourcekey="LabelResource3"></asp:Label>
                </td>
                <td>
                    <table style="width:100%">
                        <tr>
                            <td valign="top" style="width: 100%" colspan="2">
                                <telerik:RadToolBar ID="RadToolBar2" runat="server" Width="100%" OnClientButtonClicking="RadToolBar2_ButtonClicking" OnButtonClick="RadToolBar2_ButtonClick" meta:resourcekey="UltraWebToolbar2Resource1" SingleClick="None">
                                    <Items>
                                        <telerik:RadToolBarButton runat="server" DisabledImageUrl="~/Common/Images/Icon/icon_m06_g.gif"
                                            HoveredImageUrl="~/Common/Images/Icon/icon_m06.gif"
                                            ImageUrl="~/Common/Images/Icon/icon_m06.gif"
                                            Value="SetEndFormCondition"
                                            CheckedImageUrl="~/Common/Images/Icon/icon_m06.gif"
                                            Text="設定" meta:resourcekey="TBarButtonResourceSet2">
                                        </telerik:RadToolBarButton>
                                        <telerik:RadToolBarButton runat="server" IsSeparator="True" Text="Button 1" ImageUrl="~/App_Themes/DefaultTheme/images/toolbarSp.jpg" meta:resourcekey="RadToolBarButtonResource2">
                                        </telerik:RadToolBarButton>
                                    </Items>
                                </telerik:RadToolBar>
                            </td>
                        </tr>
                        <tr>
                            <td valign="top" style="width: 100%" colspan="2">
                                <Fast:Grid ID="EndFormGrid" runat="server"
                                    Width="100%"
                                    AutoGenerateColumns="False"
                                    AutoGenerateCheckBoxColumn="False" AllowSorting="True"
                                    DataKeyOnClientWithCheckBox="False"
                                    EnhancePager="True" PageSize="15"
                                    OnRowDataBound="EndFormGrid_RowDataBound" DefaultSortDirection="Ascending"
                                    EmptyDataText="沒有資料"
                                    KeepSelectedRows="False" CustomDropDownListPage="False" meta:resourcekey="EndFormGridResource1" SelectedRowColor="" UnSelectedRowColor="">
                                    <EnhancePagerSettings ShowHeaderPager="True" />

                                    <ExportExcelSettings AllowExportToExcel="False"></ExportExcelSettings>
                                    <Columns>
                                        <asp:BoundField DataField="NOTIFY_ID" HeaderText="條件"
                                            meta:resourcekey="BoundFieldResource4">
                                            <HeaderStyle Width="30%" />
                                        </asp:BoundField>
                                        <asp:TemplateField HeaderText="結束通知人員" meta:resourcekey="TemplateFieldResource2">
                                            <EditItemTemplate>
                                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("COND_ID") %>' meta:resourcekey="TextBox1Resource2"></asp:TextBox>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <uc2:UC_ChoiceList ID="uc_NotifyUsers" runat="server" ExpandToUser="False"
                                                    IsAllowEdit="False" />
                                            </ItemTemplate>
                                            <HeaderStyle Width="70%" />
                                        </asp:TemplateField>
                                    </Columns>
                                </Fast:Grid>

                            </td>
                        </tr>
                    </table>
                </td>

            </tr>
    </table>
    <telerik:RadTreeView ID="treeCondition" runat="server" Visible="False" meta:resourcekey="treeConditionResource1"></telerik:RadTreeView>
            <asp:Label ID="lblNonSetting" runat="server" Text="不設定" Visible="False"></asp:Label>    
        </ContentTemplate>
    </asp:UpdatePanel>

<asp:Label ID="lblConfirmDelete" runat="server" Text="確定要刪除?" Visible="False" meta:resourcekey="lblConfirmDeleteResource1"></asp:Label>


</asp:Content>

