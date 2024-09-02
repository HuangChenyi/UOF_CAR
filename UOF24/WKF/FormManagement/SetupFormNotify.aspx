<%@ Page Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="WKF_FormManagement_SetupFormNotify" Title="設定表單起結案通知" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" Codebehind="SetupFormNotify.aspx.cs" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>
<%@ Reference Control="../../Common/ChoiceCenter/UC_ChoiceList.ascx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <script type="text/javascript" id="telerikClientEvents1">

        function RadToolBar1_ButtonClicking(sender, args) {
            var value = args.get_item().get_value();
            var formVersionId = $uof.tool.htmlDecode("<%=System.Web.Security.AntiXss.AntiXssEncoder.HtmlEncode(formVersionId,true)%>");
            if (value == "SetStartFormCondition") {
                //新增判斷式
                args.set_cancel(true);
                $uof.dialog.open2("~/WKF/FormManagement/ManageFormNotifyCondition.aspx", args.get_item(), "", 940, 600, function () { return true; },
                    {
                        "Notify_Type": "0",
                        "FormCondition": "Y",
                        "formVersionId": formVersionId
                    });
            }

            if (value == "SetEndFormCondition") {
                //新增判斷式
                args.set_cancel(true);
                $uof.dialog.open2("~/WKF/FormManagement/ManageFormNotifyCondition.aspx", args.get_item(), "", 940, 600, function () { return true; },
                    {
                        "Notify_Type": "1",
                        "FormCondition": "Y",
                        "formVersionId": formVersionId
                    });
            }
        }

         function RadToolBar2_ButtonClicking(sender, args) {
             var value = args.get_item().get_value();
             var formVersionId = $uof.tool.htmlDecode("<%=System.Web.Security.AntiXss.AntiXssEncoder.HtmlEncode(formVersionId,true)%>");

             if (value == "SetStartFormCondition") {
                 //新增判斷式
                 args.set_cancel(true);
                 $uof.dialog.open2("~/WKF/FormManagement/ManageFormNotifyCondition.aspx", args.get_item(), "", 940, 600, function () { return true; },
                     {
                         "Notify_Type": "0",
                         "FormCondition": "Y",
                         "formVersionId": formVersionId
                     });
            }

            if (value == "SetEndFormCondition") {
                //新增判斷式
                args.set_cancel(true);
                $uof.dialog.open2("~/WKF/FormManagement/ManageFormNotifyCondition.aspx", args.get_item(), "", 940, 600, function () { return true; },
                    {
                        "Notify_Type": "1",
                        "FormCondition": "Y",
                        "formVersionId": formVersionId
                    });
            }


        }

    </script>
    <script type="text/javascript" id="redirectjs">
        //導頁
        function RedirectPage(url) {
            window.location = url;
            return false;
        }

    </script>

    <table width="100%">
        <tr>
            <td colspan="2">
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
                            <telerik:RadButton ID="ibtnSetupMail" runat="server"
                                Text="6.設定郵件樣板>>" CausesValidation="False"
                                meta:resourcekey="ibtnSetupMailResource1" AutoPostBack="false">
                            </telerik:RadButton>
                        </td>
                                                <td>
                            <telerik:RadButton ID="ibtnSetupDes" runat="server" Text="7.設定使用說明>>" CausesValidation="False"
                                AutoPostBack="false" meta:resourcekey="ibtnSetupDesResource1">
                            </telerik:RadButton>
                        </td>   
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <telerik:RadToolBar ID="RadToolBar1" runat="server" OnClientButtonClicking="RadToolBar1_ButtonClicking" Width="100%" meta:resourcekey="UltraWebToolbar1Resource1" OnButtonClick="RadToolBar1_ButtonClick">
                    <Items>
                        <telerik:RadToolBarButton runat="server" DisabledImageUrl="~/Common/Images/Icon/icon_m06_g.gif"
                            HoveredImageUrl="~/Common/Images/Icon/icon_m06.gif"
                            ImageUrl="~/Common/Images/Icon/icon_m06.gif"
                            Value="SetStartFormCondition"
                            CheckedImageUrl="~/Common/Images/Icon/icon_m06.gif"
                            Text="設定表單起案通知" meta:resourcekey="TBarButtonResource1">
                        </telerik:RadToolBarButton>
                        <telerik:RadToolBarButton runat="server" IsSeparator="True" Text="Button 1" ImageUrl="~/App_Themes/DefaultTheme/images/toolbarSp.jpg">
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
                    EnhancePager="True" PageSize="15">
                    <EnhancePagerSettings FirstAltImageUrl="" FirstImageUrl="" LastAltImage=""
                        LastImageUrl="" NextIAltImageUrl="" NextImageUrl="" PageInfoCssClass=""
                        PageNumberCssClass="" PageNumberCurrentCssClass="" PageRedirectCssClass=""
                        PreviousAltImageUrl="" PreviousImageUrl="" ShowHeaderPager="True" />
                    <Columns>
                        <asp:BoundField DataField="NOTIFY_ID" HeaderText="條件"
                            meta:resourcekey="BoundFieldResource1">
                            <headerstyle width="30%" />
                        </asp:BoundField>
                        <asp:BoundField DataField="COND_ID" HeaderText="起案通知人員"
                            meta:resourcekey="BoundFieldResource2">
                            <headerstyle width="50%" />
                        </asp:BoundField>
                        <asp:BoundField DataField="NOTIFY_TYPE" HeaderText="通知時機"
                            meta:resourcekey="BoundFieldResource3">
                            <headerstyle width="20%" />
                        </asp:BoundField>
                    </Columns>
                </Fast:Grid>

            </td>
        </tr>
        <tr>
            <td valign="top" style="width: 100%" colspan="2">
                <telerik:RadToolBar ID="RadToolBar2" runat="server" OnClientButtonClicking="RadToolBar2_ButtonClicking" meta:resourcekey="UltraWebToolbar2Resource1" Width="100%" OnButtonClick="RadToolBar2_ButtonClick">
                    <Items>
                        <telerik:RadToolBarButton runat="server" DisabledImageUrl="~/Common/Images/Icon/icon_m06_g.gif"
                            HoveredImageUrl="~/Common/Images/Icon/icon_m06.gif"
                            ImageUrl="~/Common/Images/Icon/icon_m06.gif"
                            Value="SetEndFormCondition"
                            CheckedImageUrl="~/Common/Images/Icon/icon_m06.gif"
                            Text="設定表單結案通知" meta:resourcekey="TBarButtonResource2">
                        </telerik:RadToolBarButton>
                        <telerik:RadToolBarButton runat="server" IsSeparator="True" Text="Button 1" ImageUrl="~/App_Themes/DefaultTheme/images/toolbarSp.jpg">
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
                    EnhancePager="True" PageSize="15">
                    <EnhancePagerSettings FirstAltImageUrl="" FirstImageUrl="" LastAltImage=""
                        LastImageUrl="" NextIAltImageUrl="" NextImageUrl="" PageInfoCssClass=""
                        PageNumberCssClass="" PageNumberCurrentCssClass="" PageRedirectCssClass=""
                        PreviousAltImageUrl="" PreviousImageUrl="" ShowHeaderPager="True" />
                    <Columns>
                        <asp:BoundField DataField="NOTIFY_ID" HeaderText="條件"
                            meta:resourcekey="BoundFieldResource4">
                            <headerstyle width="30%" />
                        </asp:BoundField>
                        <asp:BoundField DataField="COND_ID" HeaderText="結案通知人員"
                            meta:resourcekey="BoundFieldResource5">
                            <headerstyle width="50%" />
                        </asp:BoundField>
                        <asp:BoundField DataField="NOTIFY_TYPE" HeaderText="通知時機"
                            meta:resourcekey="BoundFieldResource6">
                            <headerstyle width="20%" />
                        </asp:BoundField>
                    </Columns>
                </Fast:Grid>

            </td>
        </tr>
    </table>
    <telerik:RadTreeView ID="treeCondition" runat="server" Visible="False"></telerik:RadTreeView>
    <asp:Label ID="lblConfirmDelete" runat="server" Text="確定要刪除?" Visible="False" meta:resourcekey="lblConfirmDeleteResource1"></asp:Label>
    <asp:Label ID="lblNotifyBeginTask" runat="server" Text="起案時通知" Visible="false" meta:resourcekey="lblNotifyBeginTaskResource1"></asp:Label>
    <asp:Label ID="lblNotifyEndTask" runat="server" Text="結案時通知" Visible="false" meta:resourcekey="lblNotifyEndTaskResource1"></asp:Label>
            
</asp:Content>
