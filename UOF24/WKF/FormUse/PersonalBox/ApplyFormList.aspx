<%@ Page Language="C#" MasterPageFile="~/Master/TwoColumn.master" AutoEventWireup="true" Inherits="WKF_FormUse_PersonalBox_ApplyFormList" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" Codebehind="ApplyFormList.aspx.cs" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register Src="../UC_FormList.ascx" TagName="UC_FormList" TagPrefix="uc1" %>
<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ScriptContentPlaceHolder" runat="Server">
    <style>
        .rbPrimary{
            padding-left:0px !important;
        }
    </style>
    <script id="ApplyFormListjs" type="text/javascript">
        var formTreeClientId = $uof.tool.htmlDecode('<%=System.Web.Security.AntiXss.AntiXssEncoder.HtmlEncode(formTreeClientId,true)%>');
        var initialLoad = true;
        Sys.Application.add_load(function () {
            var fillFormDirectly = $uof.tool.htmlDecode('<%=System.Web.Security.AntiXss.AntiXssEncoder.HtmlEncode(Request.QueryString["fillFormDirectly"],true)%>');
            var isCheck = $uof.tool.htmlDecode('<%=System.Web.Security.AntiXss.AntiXssEncoder.HtmlEncode(check,true)%>');
            if (initialLoad && fillFormDirectly === "true" && isCheck === "true") {
                var formVersionID = $uof.tool.htmlDecode('<%=System.Web.Security.AntiXss.AntiXssEncoder.HtmlEncode(formVersionId,true)%>');
                var formID = $uof.tool.htmlDecode('<%=System.Web.Security.AntiXss.AntiXssEncoder.HtmlEncode(Request.QueryString["formId"],true)%>');
                var signWindowWidth = "<%=signWindowWidth%>";
                var signWindowHeight = "<%=signWindowHeight%>";

                var AddFormScriptParams = { "formVersionId": formVersionID, "formId": formID };
                $uof.dialog.open2('~/WKF/FormUse/AddFormScript.aspx', "", '', signWindowWidth, signWindowHeight, openDialogResultDirectly, AddFormScriptParams);

                var tree = $find(formTreeClientId)
                var node = tree.findNodeByValue(formID + "@" + formVersionID);
                initialLoad = false;
                node.select();
            }
        });

        function OnBarMainClick(sender, args)
        {
            var AddFormScriptParams = { "formVersionId": GetFormVersionId(), "formId": GetFormId(), "ShowSubDept": $("#<%= hfShowSubDept.ClientID %>").val() };
            if(args.get_item().get_value()=="AddFormScript")
            {
                var signWindowWidth = "<%=signWindowWidth%>";
                var signWindowHeight = "<%=signWindowHeight%>";
                args.set_cancel(true);
                $uof.dialog.open2('~/WKF/FormUse/AddFormScript.aspx',args.get_item(),'',signWindowWidth,signWindowHeight,openDialogResult,AddFormScriptParams);
            }
            else if (args.get_item().get_value()=="AddAgentFormScript")
            {
                var signWindowWidth = "<%=signWindowWidth%>";
                var signWindowHeight = "<%=signWindowHeight%>";
                args.set_cancel(true);
                $uof.dialog.open2("~/WKF/FormUse/ChoiceOfAnAgent.aspx", args.get_item(), "", signWindowWidth, signWindowHeight, openDialogResult, AddFormScriptParams)
            }
            else if(args.get_item().get_value()=="DeleteFormScript")
            {
                if(confirm('<%=lblDelete.Text %>')==false)
                    args.set_cancel(true);
            }
        }

        function openDialogResultDirectly(returnValue) {
            $('#<%=btn.ClientID %>').click();
        }

        function openDialogResult(returnValue){
            if(typeof(returnValue)=="undefined"){
                return false;
            }
            return true;
        }

        function  GetFormVersionId()
        {
            var tree=$find(formTreeClientId)
            var obj = tree.get_selectedNode();
            var str = obj.get_value().split("@");
            return str[1];
        }

        function GetFormId()
        {
            var tree=$find(formTreeClientId)
            var obj = tree.get_selectedNode();
            var str = obj.get_value().split("@");
            return str[0];
        }
    </script>
    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ToolbarContentPlaceHolder" runat="Server">
        <telerik:RadTabStrip ID="RadTabStrip1" runat="server" SelectedIndex="1" MultiPageID="RadMultiPage1" OnTabClick="RadTabStrip1_TabClick" Width="100%">
            <Tabs>
                <telerik:RadTab runat="server" Value="MyFormList">
                </telerik:RadTab>
                <telerik:RadTab runat="server" Selected="True">
                </telerik:RadTab>
                <telerik:RadTab runat="server" Value="GetbackFormList">
                </telerik:RadTab>
                <telerik:RadTab runat="server" Value="SetAgent">
                </telerik:RadTab>
                <telerik:RadTab runat="server" Value="custFlow">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
            <ContentTemplate>
                <telerik:RadToolBar ID="webToolBar" runat="server" OnClientButtonClicking="OnBarMainClick"
                    OnButtonClick="webToolBar_ButtonClick" Width="100%" meta:resourcekey="UltraWebToolbar1Resource1">
                    <Items>
                        <telerik:RadToolBarButton runat="server" Enabled="false" CheckedImageUrl="~/Common/Images/Icon/icon_m95_g.gif"
                            DisabledImageUrl="~/Common/Images/Icon/icon_m95_g.gif" HoveredImageUrl="~/Common/Images/Icon/icon_m95_g.gif"
                            ImageUrl="~/Common/Images/Icon/icon_m95_g.gif" Text="填寫表單" Value="AddFormScript" meta:resourceKey="TBarButtonResource1">
                        </telerik:RadToolBarButton>
                        <telerik:RadToolBarButton runat="server" IsSeparator="true" Value="sAddFormScript">
                        </telerik:RadToolBarButton>
                        <telerik:RadToolBarButton runat="server" Enabled="false" CheckedImageUrl="~/Common/Images/Icon/icon_m95_g.gif"
                            DisabledImageUrl="~/Common/Images/Icon/icon_m95_g.gif" HoveredImageUrl="~/Common/Images/Icon/icon_m95_g.gif"
                            ImageUrl="~/Common/Images/Icon/icon_m95_g.gif" Text="代理申請" Value="AddAgentFormScript" meta:resourceKey="TBarButtonResource3">
                        </telerik:RadToolBarButton>
                        <telerik:RadToolBarButton runat="server" IsSeparator="true" Value="sAddAgentFormScript">
                        </telerik:RadToolBarButton>
                        <telerik:RadToolBarButton runat="server" Enabled="false" CheckedImageUrl="~/Common/Images/Icon/icon_m03_g.gif"
                            DisabledImageUrl="~/Common/Images/Icon/icon_m03_g.gif" HoveredImageUrl="~/Common/Images/Icon/icon_m03_g.gif"
                            ImageUrl="~/Common/Images/Icon/icon_m03_g.gif" Text="刪除" Value="DeleteFormScript" meta:resourceKey="TBarButtonResource2">
                        </telerik:RadToolBarButton>
                        <telerik:RadToolBarButton runat="server" IsSeparator="true" Value="sDeleteFormScript">
                        </telerik:RadToolBarButton>
                        <telerik:RadToolBarButton runat="server" Enabled ="false" Value="ScriptRetentionTip">
                            <ItemTemplate>
                                <asp:Label ID="lblScriptRetentionTip" runat="server" ForeColor="Blue"></asp:Label>
                            </ItemTemplate>
                        </telerik:RadToolBarButton>
                    </Items>
                </telerik:RadToolBar>
            </ContentTemplate>
        </asp:UpdatePanel>
    </asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="LeftContentPlaceHolder" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel3" runat="server" RenderMode="Inline" UpdateMode="Conditional">
                <ContentTemplate>
                   <uc1:UC_FormList ID="UC_FormList1" runat="server" />
                </ContentTemplate>
     </asp:UpdatePanel>
 </asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="RightContentPlaceHolder" runat="Server">
    <telerik:RadMultiPage ID="RadMultiPage1" runat="server" SelectedIndex="1">
        <telerik:RadPageView ID="RadPageView1" runat="server">RadPageView</telerik:RadPageView>
        <telerik:RadPageView ID="RadPageView2" runat="server">
            <table border="0" cellpadding="0" cellspacing="0" width="100%" class="tbbg01">
                <tr>
                    <td valign="top" width="75%">
                        <asp:UpdatePanel ID="UpdatePanel1" runat="server" RenderMode="Inline" UpdateMode="Conditional">
                            <ContentTemplate>
                                <asp:Panel ID="PanelInfo" runat="server" Width="100%" meta:resourcekey="PanelSummaryResource1"
                                    Visible="False" __designer:wfdid="w96">
                                    <table class="PopTable" cellspacing="1" width="100%">
                                        <colgroup class="PopTableLeftTD">
                                        </colgroup>
                                        <colgroup class="PopTableRightTD">
                                        </colgroup>
                                        <colgroup class="PopTableLeftTD">
                                        </colgroup>
                                        <colgroup class="PopTableRightTD">
                                        </colgroup>
                                        <colgroup class="PopTableRightTD">
                                        </colgroup>
                                        <tbody>
                                            <tr>
                                                <td style="height: 22px;width:15%">
                                                    <asp:Label ID="lblFormClassTitle" runat="server" meta:resourcekey="lblFormClassTitleResource1"
                                                        Text="表單類別" __designer:wfdid="w97"></asp:Label>
                                                </td>
                                                <td style="height: 22px;width:85%">
                                                    <asp:Label ID="lblFormClass" runat="server" meta:resourcekey="lblFormClassResource1"
                                                        __designer:wfdid="w98"></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="height: 22px;width:15%">
                                                    <asp:Label ID="lblFormNameTitle" runat="server" meta:resourcekey="lblFormNameTitleResource1"
                                                        Text="表單名稱" __designer:wfdid="w99"></asp:Label>
                                                </td>
                                                <td style="height: 22px;width:85%">
                                                    <asp:Label ID="lblFormName" runat="server" meta:resourcekey="lblFormNameResource1"
                                                        __designer:wfdid="w100"></asp:Label>
                                                    <asp:Label ID="Label4" runat="server" meta:resourcekey="Label4Resource1" Text="( V"
                                                        __designer:wfdid="w101"></asp:Label>
                                                    <asp:Label ID="lblFormVersionNum" runat="server" meta:resourcekey="lblFormVersionNumResource1"
                                                        __designer:wfdid="w102"></asp:Label>
                                                    <asp:Label ID="Label3" runat="server" meta:resourcekey="Label3Resource1" Text=")"
                                                        __designer:wfdid="w103"></asp:Label>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </asp:Panel>
                                <br />
                                <asp:Button ID="btn" runat="server" Text="Button"  CausesValidation=false  style="display:none" onclick="Button1_Click" />
                                <Fast:Grid ID="DGDraftList" runat="server" Width="100%" PageSize="15" EnhancePager="True"
                                    DataKeyOnClientWithCheckBox="False" OnPageIndexChanging="DGDraftList_PageIndexChanging"
                                    AllowPaging="True" OnRowDataBound="DGDraftList_RowDataBound" DataKeyNames="SCRIPT_ID"
                                    AutoGenerateColumns="False" AutoGenerateCheckBoxColumn="True" AllowSorting="True"
                                    __designer:wfdid="w104" DefaultSortDirection="Ascending">
                                    <ExportExcelSettings AllowExportToExcel="False" />
                                    <Columns>
                                        <asp:TemplateField HeaderText="草稿名稱" meta:resourcekey="TemplateFieldResource1">
                                            <ItemStyle Width="50%" />
                                            <HeaderStyle Width="50%" />
                                            <ItemTemplate>
                                                <asp:LinkButton runat="server" ID="lbtnDraftModify" Text='<%#: Eval("SCRIPT_NAME") %>'
                                                    meta:resourceKey="lbtnDraftModifyResource1"></asp:LinkButton>
                                                <asp:Label runat="server" Text='<%#: Eval("SCRIPT_ID") %>' ID="lblScriptId" Visible="False"
                                                    meta:resourceKey="lblScriptIdResource1"></asp:Label>
                                                <asp:Label runat="server" Text='<%#: Eval("FORM_ID") %>' ID="lblFormId" Visible="False"
                                                    meta:resourceKey="lblFormIdResource1"></asp:Label>
                                                <asp:Label runat="server" Text='<%#: Eval("FORM_VERSION_ID") %>' ID="lblFormVersionId"
                                                    Visible="False" meta:resourceKey="lblFormVersionIdResource1"></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="表單版本" meta:resourcekey="TemplateFieldResource2">
                                            <EditItemTemplate>
                                                <asp:TextBox runat="server" ID="TextBox1" meta:resourceKey="TextBox1Resource1"></asp:TextBox>
                                            </EditItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" />
                                            <ItemTemplate>
                                                &nbsp;<asp:Label runat="server" Text="V" ID="Label2" meta:resourceKey="Label2Resource1"></asp:Label>
                                                <asp:Label runat="server" Text='<%#: Eval("VERSION") %>' ID="lbldgItemVersion" meta:resourceKey="lbldgItemVersionResource1"></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="修改時間" meta:resourcekey="TemplateFieldResource3">
                                            <ItemStyle HorizontalAlign="Center" />
                                            <ItemTemplate>
                                                <asp:Label runat="server" ID="lblDgItemModifyTime"></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                    <EnhancePagerSettings ShowHeaderPager="True" />
                                </Fast:Grid>
                                <asp:HiddenField ID="hfShowSubDept" runat="server" />
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </td>
                </tr>
            </table>
        </telerik:RadPageView>
        <telerik:RadPageView ID="RadPageView3" runat="server">RadPageView</telerik:RadPageView>
        <telerik:RadPageView ID="RadPageView4" runat="server">RadPageView</telerik:RadPageView>
        <telerik:RadPageView ID="RadPageView5" runat="server">RadPageView</telerik:RadPageView>
    </telerik:RadMultiPage>
    <asp:Label ID="lblCustFlow" runat="server" Text="定義自訂流程" Visible="False" meta:resourcekey="lblCustFlowResource1"></asp:Label>
    <asp:Label ID="lblDelete" runat="server" meta:resourcekey="lblDeleteResource1" Text="確定要刪除?"
        Visible="False"></asp:Label>
    <asp:Label ID="lblApplyFormList" runat="server" meta:resourcekey="lblApplyFormListResource1"
        Text="表單申請" Visible="False"></asp:Label>
    <asp:Label ID="lblMyHomepage" runat="server" Text="我的首頁" Visible="False" meta:resourcekey="lblMyHomepageResource2"></asp:Label>
    <asp:Label ID="lblWKF" runat="server" Text="電子簽核" Visible="False" meta:resourcekey="lblWKFResource2"></asp:Label>
    <asp:Label ID="lblMyFormList" runat="server" Text="個人表單" Visible="False" meta:resourcekey="lblMyFormListResource1"></asp:Label>
    <asp:Label ID="Label1" runat="server" Text="表單申請" Visible="False" meta:resourcekey="Label1Resource2"></asp:Label>
    <asp:Label ID="lblGetbackList" runat="server" Text="表單取回" Visible="False" meta:resourcekey="lblGetbackListResource1"></asp:Label>
    <asp:Label ID="lblSetAgent" runat="server" Text="設定代理人" Visible="False" meta:resourcekey="lblSetAgentResource1"></asp:Label>
    <asp:Label ID="lblAgentWirteMsg" runat="server" Text="(代填)" Visible="False" meta:resourcekey="lblAgentWirteMsgResource1"></asp:Label>
    <asp:Label ID="lblList" runat="server" meta:resourcekey="Label1Resource1" Text="表單列表" Visible="false"></asp:Label>
    <asp:Label ID="lblFormDisable" runat="server" meta:resourcekey="lblFormDisableResource1" Text="表單已被停用" Visible="false"></asp:Label>
    <asp:Label ID="lblNoAuthApply" runat="server" meta:resourcekey="lblNoAuthApplyResource1" Text="無權限申請該張表單" Visible="false"></asp:Label>
    
    <asp:Label ID="lblScriptRetentionOneMonth" meta:resourcekey="lblScriptRetentionOneMonthResource1" Visible="false" Text="*草稿只保留1個月" runat="server"></asp:Label>
    <asp:Label ID="lblScriptRetentionThreeMonth" meta:resourcekey="lblScriptRetentionThreeMonthResource1" Visible="false" Text="*草稿只保留3個月" runat="server"></asp:Label>
    <asp:Label ID="lblScriptRetentionSixMonth" meta:resourcekey="lblScriptRetentionSixMonthResource1" Visible="false" Text="*草稿只保留6個月" runat="server"></asp:Label>
    <asp:Label ID="lblScriptRetentionTwelveMonth" meta:resourcekey="lblScriptRetentionTwelveMonthResource1" Visible="false" Text="*草稿只保留12個月" runat="server"></asp:Label>
</asp:Content>