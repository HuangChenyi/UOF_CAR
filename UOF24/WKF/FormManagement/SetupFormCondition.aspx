<%@ Page Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="WKF_FormManagement_SetupFormCondition" Title="設定表單條件" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" CodeBehind="SetupFormCondition.aspx.cs" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <script type="text/javascript" id="telerikClientEvents1">

        function RadToolBar1_ButtonClicking(sender, args) {
            var value = args.get_item().get_value();
            var formVersionId = $uof.tool.htmlDecode('<%=System.Web.Security.AntiXss.AntiXssEncoder.HtmlEncode(formVersionId,true)%>');
             if (value == "AddConditionBase") {//新增判斷式
                 args.set_cancel(true);
                 $uof.dialog.open2("~/WKF/FormManagement/ManageFormConditionBase.aspx", args.get_item(), "", 1000, 270, openDialogResult,
                     {
                         "FormCondition": "Y",
                         "formVersionId": formVersionId
                     });
             }
             else if (value == "AddCondition") {//新增條件
                 args.set_cancel(true);
                 $uof.dialog.open2("~/WKF/FormManagement/ManageFormCondition.aspx", args.get_item(), "", 800, 270, openDialogResult, { "formVersionId": formVersionId });
             }

             else if (value == "DeleteCondition") {
                 if (confirm('<%=lblConfirmDelete.Text %>') == false)
                     args.set_cancel(true);
             }
        }

        function openDialogResult(returnValue) {
            if (typeof (returnValue) == "undefined") {
                return false;
            }
            return true;
        }
    </script>

    <script id="redirectjs" type="text/javascript">
         //導頁
         function RedirectPage(url) {
             window.location = url;
             return false;
         }
    </script>


    <table width="100%">
        <tr>
            <td>
                <table>
                    <tr>
                        <td>
                            <telerik:RadButton ID="ibtnDesignField" runat="server" Text="1.設計欄位>>" CausesValidation="False"
                                meta:resourcekey="ibtnDesignFieldResource1" AutoPostBack="false">
                            </telerik:RadButton>
                        </td>
                        <td>
                            <telerik:RadButton ID="ibtnSetupCondition" runat="server" Text="2.設定條件>>" CausesValidation="False"
                                meta:resourcekey="ibtnSetupConditionResource1" AutoPostBack="false">
                            </telerik:RadButton>
                        </td>
                        <td>
                            <telerik:RadButton ID="ibtnSetupNotify" runat="server" Text="3.設定起結案通知>>" CausesValidation="False"
                                meta:resourcekey="ibtnSetupNotifyResource1" AutoPostBack="false">
                            </telerik:RadButton>
                        </td>
                        <td>
                            <telerik:RadButton ID="ibtnDesignFlow" runat="server" Text="4.設定流程>>" CausesValidation="False"
                                meta:resourcekey="ibtnDesignFlowResource1" AutoPostBack="false">
                            </telerik:RadButton>
                        </td>
                        <td>
                            <telerik:RadButton ID="ibtnSetupRelease" runat="server" Text="5.設定發佈資訊>>" CausesValidation="False"
                                meta:resourcekey="ibtnSetupReleaseResource1" AutoPostBack="false">
                            </telerik:RadButton>
                        </td>
                        <td>
                            <telerik:RadButton ID="ibtnSetupMail" runat="server" Text="6.設定郵件樣板>>" CausesValidation="False"
                                meta:resourcekey="ibtnSetupMailResource1" AutoPostBack="false">
                            </telerik:RadButton>
                        </td>
                        <td>
                            <telerik:RadButton ID="ibtnSetupDes" runat="server" Text="7.設定使用說明>>" CausesValidation="False"
                                meta:resourcekey="ibtnSetupDesResource1" AutoPostBack="false">
                            </telerik:RadButton>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server" RenderMode="Inline" UpdateMode="Conditional">
        <ContentTemplate>
            <table width="100%">
                <tr>
                    <td>
                        <telerik:RadToolBar ID="RadToolBar1" runat="server" OnClientButtonClicking="RadToolBar1_ButtonClicking" Width="100%"
                            meta:resourcekey="UltraWebToolbar1Resource1" OnButtonClick="RadToolBar1_ButtonClick">
                            <Items>
                                <telerik:RadToolBarButton runat="server" DisabledImageUrl="~/Common/Images/Icon/icon_m06_g.gif"
                                    HoveredImageUrl="~/Common/Images/Icon/icon_m06.gif" ImageUrl="~/Common/Images/Icon/icon_m06.gif"
                                    Value="AddConditionBase" meta:resourceKey="TBarButtonResource1" CheckedImageUrl="~/Common/Images/Icon/icon_m06.gif"
                                    Text="新增判斷式">
                                </telerik:RadToolBarButton>
                                <telerik:RadToolBarButton runat="server" IsSeparator="True" Text="Button 1" ImageUrl="~/App_Themes/DefaultTheme/images/toolbarSp.jpg">
                                </telerik:RadToolBarButton>
                                <telerik:RadToolBarButton runat="server" DisabledImageUrl="~/Common/Images/Icon/icon_m07_g.gif"
                                    HoveredImageUrl="~/Common/Images/Icon/icon_m07.gif" ImageUrl="~/Common/Images/Icon/icon_m07.gif"
                                    Value="AddCondition" meta:resourceKey="TBarButtonResource2" CheckedImageUrl="~/Common/Images/Icon/icon_m07.gif"
                                    Text="新增條件">
                                </telerik:RadToolBarButton>
                                <telerik:RadToolBarButton runat="server" IsSeparator="True" Text="Button 3" ImageUrl="~/App_Themes/DefaultTheme/images/toolbarSp.jpg">
                                </telerik:RadToolBarButton>
                                <telerik:RadToolBarButton runat="server" DisabledImageUrl="~/Common/Images/Icon/icon_m03_g.gif"
                                    HoveredImageUrl="~/Common/Images/Icon/icon_m03.gif" ImageUrl="~/Common/Images/Icon/icon_m03.gif"
                                    Value="DeleteCondition" meta:resourceKey="TBarButtonResource3" CheckedImageUrl="~/Common/Images/Icon/icon_m03.gif"
                                    Text="刪除表單條件">
                                </telerik:RadToolBarButton>
                                <telerik:RadToolBarButton runat="server" IsSeparator="True" Text="Button 5" ImageUrl="~/App_Themes/DefaultTheme/images/toolbarSp.jpg">
                                </telerik:RadToolBarButton>
                            </Items>
                        </telerik:RadToolBar>
                    </td>
                </tr>
                <tr>
                    <td style="height: 149px" valign="top">
                        <Fast:Grid ID="Grid1" runat="server"
                            OnRowCommand="Grid1_RowCommand" OnRowDataBound="Grid1_RowDataBound"
                            Width="100%" DataKeyNames="COND_ID"
                            AutoGenerateColumns="False"
                            AutoGenerateCheckBoxColumn="True" AllowSorting="True"
                            DataKeyOnClientWithCheckBox="False"
                            EnhancePager="True" PageSize="15">
                            <EnhancePagerSettings FirstAltImageUrl="" FirstImageUrl="" LastAltImage=""
                                LastImageUrl="" NextIAltImageUrl="" NextImageUrl="" PageInfoCssClass=""
                                PageNumberCssClass="" PageNumberCurrentCssClass="" PageRedirectCssClass=""
                                PreviousAltImageUrl="" PreviousImageUrl="" ShowHeaderPager="True" />
                            <Columns>
                                <asp:TemplateField HeaderText="表單條件" meta:resourcekey="TemplateFieldResource1">
                                    <ItemStyle Width="85%" />
                                    <HeaderStyle Width="85%" />
                                    <ItemTemplate>
                                        <asp:LinkButton runat="server" ID="LinkButton1" Text='<%#: Eval("COND_NAME") %>' meta:resourceKey="LinkButton1Resource1" __designer:wfdid="w5"></asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="屬性" meta:resourcekey="TemplateFieldResource2">
                                    <EditItemTemplate>
                                        <asp:TextBox runat="server" Text='<%#: Bind("COND_ATTRIBUTE") %>' ID="TextBox2" meta:resourceKey="TextBox2Resource1" __designer:wfdid="w13"></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" />
                                    <ItemTemplate>
                                        <asp:Label runat="server" Text='<%#: Bind("COND_ATTRIBUTE") %>' ID="dgItem_lblCondAttribute" Visible="False" meta:resourceKey="dgItem_lblCondAttributeResource1" __designer:wfdid="w11"></asp:Label>
                                        <asp:Label runat="server" ID="dgItem_lblCondAttributeName" meta:resourceKey="dgItem_lblCondAttributeNameResource1" __designer:wfdid="w12"></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField Visible="False" meta:resourcekey="TemplateFieldResource3">
                                    <EditItemTemplate>
                                        <asp:TextBox runat="server" Text='<%#: Bind("COND_ID") %>' ID="TextBox1" meta:resourceKey="TextBox1Resource1" __designer:wfdid="w19"></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label runat="server" Text='<%#: Bind("COND_ID") %>' ID="dgItem_lblCondId" meta:resourceKey="dgItem_lblCondIdResource1" __designer:wfdid="w18"></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField Visible="False" meta:resourcekey="TemplateFieldResource4">
                                    <EditItemTemplate>
                                        <asp:TextBox runat="server" Text='<%#: Bind("COMBINE_TYPE") %>' ID="TextBox3" meta:resourceKey="TextBox3Resource1" __designer:wfdid="w5"></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label runat="server" Text='<%#: Bind("COMBINE_TYPE") %>' ID="dgItem_lblcombineType" meta:resourceKey="dgItem_lblcombineTypeResource1" __designer:wfdid="w4"></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField Visible="False" meta:resourcekey="TemplateFieldResource5">
                                    <EditItemTemplate>
                                        <asp:TextBox runat="server" Text='<%#: Bind("IS_COMBINED") %>' ID="TextBox4" meta:resourceKey="TextBox4Resource1" __designer:wfdid="w7"></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label runat="server" Text='<%#: Bind("IS_COMBINED") %>' ID="dgItem_lblIsCombined" meta:resourceKey="dgItem_lblIsCombinedResource1" __designer:wfdid="w2"></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </Fast:Grid>
                    </td>
                </tr>
            </table>
        </ContentTemplate>

    </asp:UpdatePanel>
    <asp:Label ID="lblConfirmDelete" runat="server" Text="確定要刪除?" Visible="False" meta:resourcekey="lblConfirmDeleteResource1"></asp:Label>
    <asp:Label ID="lblFieldDesgin" runat="server" meta:resourcekey="lblFieldDesginResource1"
        Text="1.設計欄位>>" Visible="False"></asp:Label>
    <asp:Label ID="lblFormCondition" runat="server" meta:resourcekey="lblFormConditionResource1"
        Text="2.設定條件>>" Visible="False"></asp:Label>
    <asp:Label ID="lblFormFlow" runat="server" meta:resourcekey="lblFormFlowResource1"
        Text="4.設定流程>>" Visible="False"></asp:Label>
    <asp:Label ID="lblPublish" runat="server" meta:resourcekey="lblPublishResource1"
        Text="5.設定發佈資訊>>" Visible="False"></asp:Label>
    <asp:Label ID="lblSelf" runat="server" meta:resourcekey="lblSelfResource1" Text="自訂"
        Visible="False"></asp:Label>
    <asp:Label ID="lblSystem" runat="server" meta:resourcekey="lblSystemResource1" Text="系統"
        Visible="False"></asp:Label>
    <asp:Label ID="lblDeleteCondition" runat="server" meta:resourcekey="lblDeleteConditionResource1"
        Text="刪除的條件被流程所使用，不允許刪除" Visible="False"></asp:Label>
</asp:Content>
