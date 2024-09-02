<%@ Page Title="" Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" CodeBehind="DesignFormField.aspx.cs" Inherits="Ede.Uof.Web.WKF.FormManagement.MultiColumnDesign.DesignFormField" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" %>

<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>
<%@ Register Src="~/WKF/FormManagement/MultiColumnDesign/UC_DisplayLayout.ascx" TagPrefix="uc1" TagName="UC_DisplayLayout" %>
<%@ Register Src="~/WKF/FormManagement/VersionFieldUserControl/VersionFieldCollectionUsingUC.ascx" TagPrefix="uc1" TagName="VersionFieldCollectionUsingUC" %>
<%@ Register Src="~/WKF/FormManagement/VersionFieldUserControl/VersionFieldCollectionUC.ascx" TagPrefix="uc1" TagName="VersionFieldCollectionUC" %>
<%@ Register Src="~/WKF/FormManagement/MultiColumnDesign/UC_VersionFieldCollectionUsing.ascx" TagPrefix="uc1" TagName="UC_VersionFieldCollectionUsing" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <style>
        .PanelHeight {
            height: calc(100% - 70px);
        }
    </style>
    <script type="text/javascript">

        Sys.Application.add_load(function () {
            ShowHiddenField();
        });


        function ShowHiddenField() {
            if ($("#<%=cbShowHiddenField.ClientID%>").is(":checked")) {
                $(".RowHide").css("display", "table-row");
                $(".RowHide .fieldPadding span").remove();
                $(".RowHide .fieldPadding").append("<span style='color:gray'><%=lblhiddenFieldNote.Text%></span>")
            }
            else {
                $(".RowHide").css("display", "none");
            }
        }

        function saveScrollPosition() {
            $('#<%=HiddenField1.ClientID %>').val($('#<%=Panel1.ClientID %>').scrollTop());
        }

        $(function () {
            $('#<%=Panel1.ClientID %>').scrollTop($('#<%=HiddenField1.ClientID %>').val())
        });

        //導頁
        function RedirectPage(url) {
            window.location = url;
            return false;
        }

        function RadToolBar1_ButtonClicking(sender, args) {
            var value = args.get_item().get_value();

            if (value == "AddField") {//新增欄位
                args.set_cancel(true);
                $uof.dialog.open2("~/WKF/FormManagement/SetupField_SingleLineText.aspx", args.get_item(), "", 800, 600, openDialogResult, { "formVersionId": $uof.tool.htmlDecode("<%=System.Web.Security.AntiXss.AntiXssEncoder.HtmlEncode(formVersionId, true)%>") });
            }

            else if (value == "DeleteField") {
                if (confirm('<%=lblConfirmDelete.Text %>') == false)
                    args.set_cancel(true);
            }

            else if (value == "ChangeFieldSeq") {//調整欄位順序
                args.set_cancel(true);
                $uof.dialog.open2("~/WKF/FormManagement/MultiColumnDesign/DesignFormLayout.aspx", args.get_item(), "", 0, 0, function (returnValue) {

                    return true;
                },
                    { "formVersionId": $uof.tool.htmlDecode("<%=System.Web.Security.AntiXss.AntiXssEncoder.HtmlEncode(formVersionId, true)%>"), "IsVersionNum": $uof.tool.htmlDecode("<%=System.Web.Security.AntiXss.AntiXssEncoder.HtmlEncode(IsVersionNum, true)%>"), "IsReleased": $uof.tool.htmlDecode("<%=System.Web.Security.AntiXss.AntiXssEncoder.HtmlEncode(IsReleased, true)%>") });
            }

            if (value == "AddFieldNum") {//新增欄位
                args.set_cancel(true);
                $uof.dialog.open2("~/WKF/FormManagement/SetupField_AutoNumber.aspx", args.get_item(), "", 700, 550, openDialogResult, { "IsAddFieldNum": "Y", "formVersionId": $uof.tool.htmlDecode("<%=System.Web.Security.AntiXss.AntiXssEncoder.HtmlEncode(formVersionId, true)%>") });
            }

            if (value == "ImportForm") {
                args.set_cancel(true);
                $uof.dialog.open2("~/WKF/FormManagement/ExternalFieldList.aspx", args.get_item(), "", 700, 500, openDialogResult);
            }

            if (value == "DesignSubject") {
                args.set_cancel(true);
                $uof.dialog.open2("~/WKF/FormManagement/DesignSubject.aspx", args.get_item(), "", 650, 530, openDialogResult, { "formVersionId": $uof.tool.htmlDecode("<%=System.Web.Security.AntiXss.AntiXssEncoder.HtmlEncode(formVersionId, true)%>") });
            }

            if (value == "BatchSign") {
                args.set_cancel(true);
                $uof.dialog.open2("~/WKF/FormManagement/SetBatchSignTitle.aspx", args.get_item(), "", 565, 620, openDialogResult, { "formVersionId": $uof.tool.htmlDecode("<%=System.Web.Security.AntiXss.AntiXssEncoder.HtmlEncode(formVersionId, true)%>") });
            }

            if (value == "DesignFieldCulture") {
                args.set_cancel(true);
                $uof.dialog.open2("~/WKF/FormManagement/DesignFieldCulture.aspx", args.get_item(), "", 900, 620, openDialogResult, { "formVersionId": $uof.tool.htmlDecode("<%=System.Web.Security.AntiXss.AntiXssEncoder.HtmlEncode(formVersionId, true)%>") });
            }
        }

        function openDialogResult(returnValue) {
            if (typeof (returnValue) == "undefined") {
                return false;
            }
            return true;
        }
    </script>
    <table width="100%">
        <tr>
            <td>
                <table cellpadding="0" cellspacing="0">
                    <tr>
                        <td>
                            <telerik:RadButton ID="ibtnDesignField" runat="server" Text="1.設計版面>>" AutoPostBack="false" CausesValidation="False"
                                meta:resourcekey="ibtnDesignFieldResource1" Style="position: relative;">
                            </telerik:RadButton>
                        </td>
                        <td>
                            <telerik:RadButton ID="ibtnSetupCondition" runat="server" Text="2.設定條件>>" AutoPostBack="false" CausesValidation="False"
                                meta:resourcekey="ibtnSetupConditionResource1" Style="position: relative;">
                            </telerik:RadButton>
                        </td>
                        <td>
                            <telerik:RadButton ID="ibtnSetupNotify" runat="server" Text="3.設定起結案通知條件>>" AutoPostBack="false" CausesValidation="False"
                                meta:resourcekey="ibtnSetupNotifyResource1" Style="position: relative;">
                            </telerik:RadButton>
                        </td>
                        <td>
                            <telerik:RadButton ID="ibtnDesignFlow" runat="server" Text="4.設定流程>>" AutoPostBack="false" CausesValidation="False"
                                meta:resourcekey="ibtnDesignFlowResource1" Style="position: relative;">
                            </telerik:RadButton>
                        </td>
                        <td>
                            <telerik:RadButton ID="ibtnSetupRelease" runat="server" Text="5.設定發佈資訊>>" AutoPostBack="false" CausesValidation="False"
                                meta:resourcekey="ibtnSetupReleaseResource1" Style="position: relative;">
                            </telerik:RadButton>
                        </td>
                        <td>
                            <telerik:RadButton ID="ibtnSetupMail" runat="server" Text="6.設定郵件樣板>>" AutoPostBack="false" CausesValidation="False"
                                meta:resourcekey="ibtnSetupMailResource1" Style="position: relative;">
                            </telerik:RadButton>
                        </td>
                        <td>
                            <telerik:RadButton ID="ibtnSetupDes" runat="server" Text="7.設定使用說明>>" AutoPostBack="false" CausesValidation="False"
                                meta:resourcekey="ibtnSetupDesResource1" Style="position: relative;">
                            </telerik:RadButton>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                <asp:UpdatePanel ID="updatepanel2" runat="server">
                    <ContentTemplate>
                        <telerik:RadToolBar ID="RadToolBar1" runat="server" CausesValidation="False" OnClientButtonClicking="RadToolBar1_ButtonClicking" OnButtonClick="RadToolBar1_ButtonClick" Width="100%" meta:resourcekey="RadToolBar1Resource1" SingleClick="None">
                            <Items>
                                <telerik:RadToolBarButton runat="server" DisabledImageUrl="~/Common/Images/Icon/icon_m84_g.gif"
                                    HoveredImageUrl="~/Common/Images/Icon/icon_m84.gif" ImageUrl="~/Common/Images/Icon/icon_m84.gif"
                                    Value="AddField" CheckedImageUrl="~/Common/Images/Icon/icon_m84.gif" CausesValidation="False"
                                    Text="新增欄位" meta:resourcekey="TBarButtonResource9" Visible="False">
                                </telerik:RadToolBarButton>
                                <telerik:RadToolBarButton runat="server" IsSeparator="True" Text="Button 1" ImageUrl="~/App_Themes/DefaultTheme/images/toolbarSp.jpg" Visible="False" meta:resourcekey="RadToolBarButtonResource1">
                                </telerik:RadToolBarButton>
                                <telerik:RadToolBarButton runat="server" DisabledImageUrl="~/Common/Images/Icon/icon_m85_g.gif"
                                    HoveredImageUrl="~/Common/Images/Icon/icon_m85.gif" ImageUrl="~/Common/Images/Icon/icon_m85.gif"
                                    Value="ChangeFieldSeq" CheckedImageUrl="~/Common/Images/Icon/icon_m85.gif" CausesValidation="False"
                                    Text="調整版面" meta:resourcekey="TBarButtonResource10">
                                </telerik:RadToolBarButton>
                                <telerik:RadToolBarButton runat="server" IsSeparator="True" Text="Button 3" ImageUrl="~/App_Themes/DefaultTheme/images/toolbarSp.jpg" Visible="False" meta:resourcekey="RadToolBarButtonResource2">
                                </telerik:RadToolBarButton>
                                <telerik:RadToolBarButton runat="server" DisabledImageUrl="~/Common/Images/Icon/icon_m03_g.gif"
                                    HoveredImageUrl="~/Common/Images/Icon/icon_m03.gif" ImageUrl="~/Common/Images/Icon/icon_m03.gif"
                                    Value="DeleteField" CheckedImageUrl="~/Common/Images/Icon/icon_m03.gif" CausesValidation="False"
                                    Text="刪除選擇欄位" meta:resourcekey="TBarButtonResource11" Visible="False">
                                </telerik:RadToolBarButton>
                                <telerik:RadToolBarButton runat="server" IsSeparator="True" Text="Button 5" ImageUrl="~/App_Themes/DefaultTheme/images/toolbarSp.jpg" meta:resourcekey="RadToolBarButtonResource3">
                                </telerik:RadToolBarButton>
                                <telerik:RadToolBarButton runat="server" Value="ImportForm" Text="選擇表單範本" DisabledImageUrl="~/Common/Images/Icon/icon_m86_g.gif" HoveredImageUrl="~/Common/Images/Icon/icon_m86.gif" ImageUrl="~/Common/Images/Icon/icon_m86.gif" CheckedImageUrl="~/Common/Images/Icon/icon_m86.gif" meta:resourcekey="TBarButtonResource12" CausesValidation="False">
                                </telerik:RadToolBarButton>
                                <telerik:RadToolBarButton runat="server" IsSeparator="True" Text="Button 7" ImageUrl="~/App_Themes/DefaultTheme/images/toolbarSp.jpg" meta:resourcekey="RadToolBarButtonResource4">
                                </telerik:RadToolBarButton>
                                <telerik:RadToolBarButton runat="server" Value="DesignSubject" Text="設定顯示標題" DisabledImageUrl="~/Common/Images/Icon/icon_j04.gif" HoveredImageUrl="~/Common/Images/Icon/icon_j04.gif" ImageUrl="~/Common/Images/Icon/icon_j04.gif" CheckedImageUrl="~/Common/Images/Icon/icon_j04.gif"
                                    meta:resourcekey="TBarButtonResource13" CausesValidation="False">
                                </telerik:RadToolBarButton>
                                <telerik:RadToolBarButton runat="server" IsSeparator="True" Text="Button 9" ImageUrl="~/App_Themes/DefaultTheme/images/toolbarSp.jpg" meta:resourcekey="RadToolBarButtonResource5">
                                </telerik:RadToolBarButton>
                                <telerik:RadToolBarButton runat="server" Value="BatchSign" Text="批次簽核標題" DisabledImageUrl="~/Common/Images/Icon/icon_j05.gif" HoveredImageUrl="~/Common/Images/Icon/icon_j05.gif" ImageUrl="~/Common/Images/Icon/icon_j05.gif" CheckedImageUrl="~/Common/Images/Icon/icon_j05.gif"
                                    meta:resourcekey="TBarButtonResource14" CausesValidation="False">
                                </telerik:RadToolBarButton>
                                <telerik:RadToolBarButton runat="server" IsSeparator="True" Text="Button 11" ImageUrl="~/App_Themes/DefaultTheme/images/toolbarSp.jpg" meta:resourcekey="RadToolBarButtonResource6">
                                </telerik:RadToolBarButton>
                                <telerik:RadToolBarButton runat="server" Value="DesignFieldCulture" Text="設定欄位多國語言"
                                    DisabledImageUrl="~/Common/Images/Icon/icon_j02.gif"
                                    HoveredImageUrl="~/Common/Images/Icon/icon_j02.gif"
                                    ImageUrl="~/Common/Images/Icon/icon_j02.gif"
                                    CheckedImageUrl="~/Common/Images/Icon/icon_j02.gif"
                                    meta:resourcekey="TBarButtonResource15" CausesValidation="False">
                                </telerik:RadToolBarButton>
                                <telerik:RadToolBarButton runat="server" IsSeparator="True" Text="Button 13" ImageUrl="~/App_Themes/DefaultTheme/images/toolbarSp.jpg" meta:resourcekey="RadToolBarButtonResource7">
                                </telerik:RadToolBarButton>
                            </Items>
                        </telerik:RadToolBar>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </td>
        </tr>
        <tr>
            <td>
                <table width="100%" class="PopTable" cellspacing="1" style="display: none">
                    <colgroup class="PopTableLeftTD"></colgroup>
                    <colgroup class="PopTableRightTD"></colgroup>
                    <colgroup class="PopTableLeftTD"></colgroup>
                    <colgroup class="PopTableRightTD"></colgroup>
                    <tr>
                        <td>
                            <asp:Label ID="lblTitleFormName" runat="server" Text="表單名稱" meta:resourcekey="lblTitleFormNameResource1"></asp:Label></td>
                        <td style="width: 267px">
                            <asp:Label ID="lblFormName" runat="server" meta:resourcekey="lblFormNameResource1"></asp:Label></td>
                        <td>
                            <asp:Label ID="lblTitleFormType" runat="server" Text="表單類別" meta:resourcekey="lblTitleFormTypeResource1"></asp:Label></td>
                        <td>
                            <asp:Label ID="lblFormCategory" runat="server" meta:resourcekey="lblFormCategoryResource1"></asp:Label></td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lblFormVersion" runat="server" Text="版本" meta:resourcekey="lblFormVersionResource1"></asp:Label></td>
                        <td>
                            <asp:TextBox ID="txtVersionID" runat="server" Width="34px" Enabled="False" Style="text-align: right"
                                meta:resourcekey="txtVersionIDResource1"></asp:TextBox>
                            <asp:Label ID="Label2" runat="server" Text="●" meta:resourcekey="Label2Resource1"></asp:Label>
                            <asp:TextBox ID="txtVersion" runat="server" Width="43px" Enabled="False" Style="text-align: right"
                                meta:resourcekey="txtVersionResource1"></asp:TextBox></td>
                        <td>
                            <asp:Label ID="lblFormTitle" runat="server" Text="表單標題"
                                meta:resourcekey="lblFormTitleResource1"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lblFormTitleValue" runat="server"
                                meta:resourcekey="lblFormTitleValueResource1"></asp:Label>
                            &nbsp;</td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <asp:Panel ID="Panel1" runat="server" Width="100%" CssClass="PanelHeight" meta:resourcekey="Panel1Resource1">
        <table style="width: 100%; height: 100%" border="0">
            <tr>
                <td style="background-image: url(<%=ThemePath %>/images/wf_bg.gif); vertical-align: top">
                    <center>        
                        <table width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
                            <tr>
                                <td>
                                    <table width="100%" border="0" cellpadding="0" cellspacing="0">
                                        <tr>
                                            <td style="width:120px;min-width:120px;">
                                                <img src="<%=ThemePath %>/images/wf_icon01.jpg" width="120" height="65">
                                            </td>
                                            <td style="background-image: url(<%=ThemePath %>/images/wf_a01.jpg);background-repeat:repeat-x;height:65px;background-position: 0% 100%;">
                                                <table width="100%" border="0" cellpadding="0" cellspacing="0">
                                                    <tr>
                                                        <td class="bigT" style="height: 65px; vertical-align: middle;text-align:left">
                                                            <asp:Label ID="lblFormName2" runat="server"  meta:resourcekey="lblFormNameResource1"></asp:Label>
                                                        </td>
                                                        <td style="vertical-align:middle; text-align:right">
                                                            
                                                            <asp:CheckBox ID="cbShowHiddenField" runat="server" Text ="顯示隱藏欄位" onchange="ShowHiddenField()" meta:resourcekey="cbShowHiddenFieldResource1"></asp:CheckBox>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                            <td width="26">
                                                <img src="<%=ThemePath %>/images/wf_a02.jpg" width="26" height="65">
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <table width="100%" border="0" cellpadding="0" cellspacing="0">
                                        <tr>
                                            <td width="15" height="8" style="background-image: url(<%=ThemePath %>/images/wf_a03.gif)">
                                                <img src="<%=ThemePath %>/images/wf_a03.gif" width="15" height="8">
                                            </td>
                                            <td height="8" style="background-image: url(<%=ThemePath %>/images/wf_a04.gif)"></td>
                                            <td width="15" height="8" style="background-image: url(<%=ThemePath %>/images/wf_a05.gif)">
                                                <img src="<%=ThemePath %>/images/wf_a05.gif" width="15" height="8">
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="background-image: url(<%=ThemePath %>/images/wf_a03.gif)">
                                                <img src="<%=ThemePath %>/images/wf_a03.gif" width="15" height="8">
                                            </td>
                                            <td style="background-image: url(<%=ThemePath %>/images/wf_a04.gif)">
                                                <table border="0" align="center" cellpadding="0" cellspacing="0" style="margin-left:auto; margin-right:auto;width:95%">
                                                    <tr>
                                                        <td>
                                                            <div id="fieldScripts">

                                                            </div>
                                                            <asp:UpdatePanel ID="updatepanel1" runat="server" ><ContentTemplate>
                                                                <uc1:UC_VersionFieldCollectionUsing runat="server" id="VersionFieldCollectionUsingUC" />
                                                                <uc1:VersionFieldCollectionUC runat="server" id="VersionFieldCollectionUC" />
                                                                <%--<uc1:UC_DisplayLayout runat="server" id="UC_DisplayLayout" />--%>
                                                                 
                                                            </ContentTemplate></asp:UpdatePanel>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                            <td style="background-image: url(<%=ThemePath %>/images/wf_a05.gif)">
                                                <img src="<%=ThemePath %>/images/wf_a05.gif" width="15" height="8">
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="background-image: url(<%=ThemePath %>/images/wf_a06.gif); background-position: 0% 0%; height: 20px"></td>
                                            <td style="background-image: url(<%=ThemePath %>/images/wf_a07.gif)"></td>
                                            <td style="background-image: url(<%=ThemePath %>/images/wf_a08.gif); background-position: 0% 0%; height: 20px"></td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </center>
                </td>
            </tr>
        </table>
    </asp:Panel>

    <asp:Label ID="lblDeleteErrorMsg" runat="server" Text="欄位如被設定為表單條件不允許刪除，請先移除此表單條件！" Visible="False" meta:resourcekey="lblDeleteErrorMsgResource1"></asp:Label>
    <asp:Label ID="lblAggDeleteExecMsg" runat="server" Text="欄位不允許刪除! 明細欄位中有子欄位被使用於加總平均欄位中!" Visible="False" meta:resourcekey="lblAggDeleteExecMsgResource1"></asp:Label>
    <asp:Label ID="lblCalcDeleteExecMsg" runat="server" Text="欄位不允許刪除! 欄位被當作計算欄位運算元!" Visible="False" meta:resourcekey="lblCalcDeleteExecMsgResource1"></asp:Label>
    <asp:Label ID="lblConfirmDelete" runat="server" Text="確定要刪除?" Visible="False" meta:resourcekey="lblConfirmDeleteResource1"></asp:Label>
    <asp:Label ID="lblYes" runat="server" Text="是" Visible="False" meta:resourcekey="lblYesResource1"></asp:Label>
    <asp:Label ID="lblFieldInfo" runat="server" Text="欄位資訊" Visible="False" meta:resourcekey="lblFieldInfoResource1"></asp:Label>
    <asp:Label ID="lblFieldDesign" runat="server" meta:resourcekey="lblFieldDesignResource1" Text="1.設計欄位>>" Visible="False"></asp:Label>
    <asp:Label ID="lblFormCondition" runat="server" meta:resourcekey="lblFormConditionResource1" Text="2.設定表單條件>>" Visible="False"></asp:Label>
    <asp:Label ID="lblFormFlow" runat="server" meta:resourcekey="lblFormFlowResource1" Text="4.設定表單流程>>" Visible="False"></asp:Label>
    <asp:Label ID="lblFormPublish" runat="server" meta:resourcekey="lblFormPublishResource1" Text="5.設定發佈資訊>>" Visible="False"></asp:Label>
    <asp:Label ID="lblAutoNumberRepeat" runat="server" meta:resourcekey="lblAutoNumberRepeatResource1" Text="表單內已有自動編號欄位" Visible="False"></asp:Label>
    <asp:Label ID="lblFieldIdRepeat" runat="server" meta:resourcekey="lblFieldIdRepeatResource1" Text="欄位重覆" Visible="False"></asp:Label>
    <asp:Label ID="lblhiddenFieldNote" runat="server" Text="隱藏欄位" Visible="False" meta:resourcekey="lblhiddenFieldNoteResource1"></asp:Label>
    <asp:Label ID="lblEnabledReleaseApprovalForm" runat="server" Text="已啟用表單發佈審核功能，不可修改此版本設定內容。" Visible="False" meta:resourcekey="lblEnabledReleaseApprovalFormResource1"></asp:Label>

    <asp:HiddenField ID="HiddenField1" runat="server" Value="0" />
</asp:Content>
