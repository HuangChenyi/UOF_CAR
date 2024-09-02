<%@ Page Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="WKF_FormManagement_DesignFormField" Title="表單版本設定" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" Codebehind="DesignFormField.aspx.cs" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>
<%@ Register Src="../../Common/ChoiceCenter/UC_ChoiceList.ascx" TagName="UC_ChoiceList" TagPrefix="uc1" %>
<%@ Register Src="VersionFieldUserControl/VersionFieldCollectionUC.ascx" TagName="VersionFieldCollectionUC" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

<script id="DesignFormFieldjs" type="text/javascript">
        function saveScrollPosition() {           
            $('#<%=HiddenField1.ClientID %>').val($('#<%=Panel1.ClientID %>').scrollTop());
        }

        $(function() {
            $('#<%=Panel1.ClientID %>').scrollTop($('#<%=HiddenField1.ClientID %>').val())
        });
        
    //導頁
    function RedirectPage(url){       
        window.location = url;
        return false;
    }
</script>
          <script type="text/javascript" id="telerikClientEvents1">
              function RadToolBar1_ButtonClicking(sender, args) {
                  var value = args.get_item().get_value();

                  if (value == "AddField") {//新增欄位
                      args.set_cancel(true);
                      $uof.dialog.open2("~/WKF/FormManagement/SetupField_SingleLineText.aspx", args.get_item(), "", 800, 600, openDialogResult, {"formVersionId":"<%=formVersionId%>"});
                  }

                  else if (value== "DeleteField") {
                      if (confirm('<%=lblConfirmDelete.Text %>') == false)
                          args.set_cancel(true);
                  }

                  else if (value == "ChangeFieldSeq") {//調整欄位順序
                      args.set_cancel(true);
                      $uof.dialog.open2("~/WKF/FormManagement/ChangeFieldSeq.aspx", args.get_item(), "", 400, 530, openDialogResult,
                          { "formVersionId": "<%=formVersionId%>", "IsVersionNum": "<%=IsVersionNum%>" });
                  }

                  if (value == "AddFieldNum") {//新增欄位
                      args.set_cancel(true);
                      $uof.dialog.open2("~/WKF/FormManagement/SetupField_AutoNumber.aspx", args.get_item(), "", 700, 550, openDialogResult, { "IsAddFieldNum": "Y", "formVersionId": "<%=formVersionId%>" });
                  }

                  if (value == "ImportForm") {
                      args.set_cancel(true);
                      $uof.dialog.open2("~/WKF/FormManagement/ExternalFieldList.aspx", args.get_item(), "", 700, 500, openDialogResult);
                  }

                  if (value == "DesignSubject") {
                      args.set_cancel(true);
                      $uof.dialog.open2("~/WKF/FormManagement/DesignSubject.aspx", args.get_item(), "", 650, 530, openDialogResult, { "formVersionId": "<%=formVersionId%>" });
                  }

                  if (value == "BatchSign") {
                      args.set_cancel(true);
                      $uof.dialog.open2("~/WKF/FormManagement/SetBatchSignTitle.aspx",args.get_item(),"",565,620,openDialogResult,{"formVersionId":"<%=formVersionId%>"});
                  }

                  if (value == "DesignFieldCulture") {
                      args.set_cancel(true);
                      $uof.dialog.open2("~/WKF/FormManagement/DesignFieldCulture.aspx",args.get_item(),"",900,620,openDialogResult,{"formVersionId":"<%=formVersionId%>"});
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
                        <telerik:RadButton ID="ibtnDesignField" runat="server" Text="1.設計欄位>>" CausesValidation="False"
                           meta:resourcekey="ibtnDesignFieldResource1" ></telerik:RadButton>
                    </td>
                    <td>
                        <telerik:RadButton ID="ibtnSetupCondition" runat="server" Text="2.設定條件>>" CausesValidation="False"
                            meta:resourcekey="ibtnSetupConditionResource1" OnClick="ibtnSetup_Click"></telerik:RadButton>
                    </td>
                    <td>
                        <telerik:RadButton ID="ibtnSetupNotify" runat="server" Text="3.設定起結案通知條件>>" CausesValidation="False"
                            meta:resourcekey="ibtnSetupNotifyResource1" OnClick="ibtnSetup_Click"></telerik:RadButton>
                    </td>
                    <td>
                        <telerik:RadButton ID="ibtnDesignFlow" runat="server" Text="4.設定流程>>" CausesValidation="False"
                            meta:resourcekey="ibtnDesignFlowResource1" OnClick="ibtnSetup_Click"></telerik:RadButton>
                    </td>
                    <td>
                        <telerik:RadButton ID="ibtnSetupRelease" runat="server" Text="5.設定發佈資訊>>" CausesValidation="False"
                            meta:resourcekey="ibtnSetupReleaseResource1" OnClick="ibtnSetup_Click"></telerik:RadButton>
                    </td>
                    <td>
                        <telerik:RadButton ID="ibtnSetupMail" runat="server" Text="6.設定郵件樣板>>" CausesValidation="False"
                            meta:resourcekey="ibtnSetupMailResource1" OnClick="ibtnSetup_Click"></telerik:RadButton>
                    </td>           
                        <td>
                            <telerik:RadButton ID="ibtnSetupDes" runat="server" Text="7.設定使用說明>>" CausesValidation="False"
                                meta:resourcekey="ibtnSetupDesResource1" OnClick="ibtnSetup_Click">
                            </telerik:RadButton>
                        </td>      
                </tr>
            </table>
            </td>
        </tr>
        <tr>
            <td>
                <telerik:RadToolBar ID="RadToolBar1" runat="server"  CausesValidation="false" OnClientButtonClicking="RadToolBar1_ButtonClicking" OnButtonClick="RadToolBar1_ButtonClick" Width="100%">
                    <Items>
                        <telerik:RadToolBarButton runat="server" DisabledImageUrl="~/Common/Images/Icon/icon_m84_g.gif"
                            HoveredImageUrl="~/Common/Images/Icon/icon_m84.gif" ImageUrl="~/Common/Images/Icon/icon_m84.gif"
                            Value="AddField" CheckedImageUrl="~/Common/Images/Icon/icon_m84.gif" CausesValidation="false"
                            Text="新增欄位" meta:resourcekey="TBarButtonResource9">
                        </telerik:RadToolBarButton>
                        <telerik:RadToolBarButton runat="server" IsSeparator="True" Text="Button 1" ImageUrl="~/App_Themes/DefaultTheme/images/toolbarSp.jpg">
                        </telerik:RadToolBarButton>
                        <telerik:RadToolBarButton runat="server" DisabledImageUrl="~/Common/Images/Icon/icon_m85_g.gif"
                            HoveredImageUrl="~/Common/Images/Icon/icon_m85.gif" ImageUrl="~/Common/Images/Icon/icon_m85.gif"
                            Value="ChangeFieldSeq" CheckedImageUrl="~/Common/Images/Icon/icon_m85.gif" CausesValidation="false"
                            Text="調整欄位順序" meta:resourcekey="TBarButtonResource10">
                        </telerik:RadToolBarButton>
                        <telerik:RadToolBarButton runat="server" IsSeparator="True" Text="Button 3" ImageUrl="~/App_Themes/DefaultTheme/images/toolbarSp.jpg">
                        </telerik:RadToolBarButton>
                        <telerik:RadToolBarButton runat="server" DisabledImageUrl="~/Common/Images/Icon/icon_m03_g.gif"
                            HoveredImageUrl="~/Common/Images/Icon/icon_m03.gif" ImageUrl="~/Common/Images/Icon/icon_m03.gif"
                            Value="DeleteField" CheckedImageUrl="~/Common/Images/Icon/icon_m03.gif"   CausesValidation="false"
                            Text="刪除選擇欄位" meta:resourcekey="TBarButtonResource11">
                        </telerik:RadToolBarButton>
                        <telerik:RadToolBarButton runat="server" IsSeparator="True" Text="Button 5" ImageUrl="~/App_Themes/DefaultTheme/images/toolbarSp.jpg">
                        </telerik:RadToolBarButton>
                        <telerik:RadToolBarButton runat="server" Value="ImportForm" Text="選擇表單範本" DisabledImageUrl="~/Common/Images/Icon/icon_m86_g.gif" HoveredImageUrl="~/Common/Images/Icon/icon_m86.gif" ImageUrl="~/Common/Images/Icon/icon_m86.gif" CheckedImageUrl="~/Common/Images/Icon/icon_m86.gif" meta:resourcekey="TBarButtonResource12" CausesValidation="false">
                        </telerik:RadToolBarButton>
                        <telerik:RadToolBarButton runat="server" IsSeparator="True" Text="Button 7" ImageUrl="~/App_Themes/DefaultTheme/images/toolbarSp.jpg">
                        </telerik:RadToolBarButton>
                        <telerik:RadToolBarButton runat="server" Value="DesignSubject" Text="設定顯示標題"  DisabledImageUrl="~/Common/Images/Icon/icon_j04.gif" HoveredImageUrl="~/Common/Images/Icon/icon_j04.gif" ImageUrl="~/Common/Images/Icon/icon_j04.gif" CheckedImageUrl="~/Common/Images/Icon/icon_j04.gif" 
                            meta:resourcekey="TBarButtonResource13" CausesValidation="false">
                        </telerik:RadToolBarButton>
                        <telerik:RadToolBarButton runat="server" IsSeparator="True" Text="Button 9" ImageUrl="~/App_Themes/DefaultTheme/images/toolbarSp.jpg">
                        </telerik:RadToolBarButton>
                        <telerik:RadToolBarButton runat="server" Value="BatchSign" Text="批次簽核標題"  DisabledImageUrl="~/Common/Images/Icon/icon_j05.gif" HoveredImageUrl="~/Common/Images/Icon/icon_j05.gif" ImageUrl="~/Common/Images/Icon/icon_j05.gif" CheckedImageUrl="~/Common/Images/Icon/icon_j05.gif" 
                            meta:resourcekey="TBarButtonResource14" CausesValidation="false">
                        </telerik:RadToolBarButton>
                        <telerik:RadToolBarButton runat="server" IsSeparator="True" Text="Button 11" ImageUrl="~/App_Themes/DefaultTheme/images/toolbarSp.jpg">
                        </telerik:RadToolBarButton>
                        <telerik:RadToolBarButton runat="server" Value="DesignFieldCulture" Text="設定欄位多國語言"  
                            DisabledImageUrl="~/Common/Images/Icon/icon_j02.gif" 
                            HoveredImageUrl="~/Common/Images/Icon/icon_j02.gif" 
                            ImageUrl="~/Common/Images/Icon/icon_j02.gif" 
                            CheckedImageUrl="~/Common/Images/Icon/icon_j02.gif" 
                            meta:resourcekey="TBarButtonResource15"  CausesValidation="false">
                        </telerik:RadToolBarButton>
                        <telerik:RadToolBarButton runat="server" IsSeparator="True" Text="Button 13" ImageUrl="~/App_Themes/DefaultTheme/images/toolbarSp.jpg">
                        </telerik:RadToolBarButton>
                    </Items>
                </telerik:RadToolBar>
            </td>
        </tr>
        <tr>
            <td>
                <table width="100%" class="PopTable" cellspacing="1">
                    <colgroup class="PopTableLeftTD">
                    </colgroup>
                    <colgroup class="PopTableRightTD">
                    </colgroup>
                    <colgroup class="PopTableLeftTD">
                    </colgroup>
                    <colgroup class="PopTableRightTD">
                    </colgroup>
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
                        <td >
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

                <asp:Panel ID="Panel1" runat="server"   Width="100%"
                    meta:resourcekey="Panel1Resource1">
                    <table  border="0" cellpadding="0" cellspacing="0" width="100%">
                        <tr>
                            <td width="18"></td>
                            <td></td>
                            <td width="18"></td>
                        </tr>
                        <tr>
                            <td style="height: 27px">&nbsp;</td>
                            <td valign="top" style="height: 27px">
                                <uc1:VersionFieldCollectionUC ID="VersionFieldCollectionUC1" runat="server" EnableViewState="False">
                                </uc1:VersionFieldCollectionUC>
                            </td>
                        </tr>
                        <tr>
                            <td style="height: 27px"></td>
                            <td align="right" style="height: 27px" valign="bottom">
                                <asp:Label ID="lblDesignFieldRemark" CssClass="SizeMemo" runat="server" Text="註：表單一般一行顯示一個欄位，欄位順序於表單顯示時依由上而下排列"
                                    meta:resourcekey="lblDesignFieldRemarkResource1" ></asp:Label></td>
                        </tr>
                    </table>
                </asp:Panel>
                <asp:Label ID="lblDeleteErrorMsg" runat="server" Text="欄位如被設定為表單條件不允許刪除，請先移除此表單條件！"
                    Visible="False" meta:resourcekey="lblDeleteErrorMsgResource1"></asp:Label>
                <asp:Label ID="lblAggDeleteExecMsg" runat="server" Text="欄位不允許刪除! 明細欄位中有子欄位被使用於加總平均欄位中!" Visible="False" meta:resourcekey="lblAggDeleteExecMsgResource1"></asp:Label>
                <asp:Label ID="lblCalcDeleteExecMsg" runat="server" Text="欄位不允許刪除! 欄位被當作計算欄位運算元!" Visible="False" meta:resourcekey="lblCalcDeleteExecMsgResource1"></asp:Label>
    <asp:Label ID="lblConfirmDelete" runat="server" Text="確定要刪除?" Visible="False" meta:resourcekey="lblConfirmDeleteResource1"></asp:Label>
    <asp:Label ID="lblYes" runat="server" Text="是" Visible="False" meta:resourcekey="lblYesResource1"></asp:Label>
    <asp:Label ID="lblFieldDesign" runat="server" meta:resourcekey="lblFieldDesignResource1"
        Text="1.設計欄位>>" Visible="False"></asp:Label>
    <asp:Label ID="lblFormCondition" runat="server" meta:resourcekey="lblFormConditionResource1"
        Text="2.設定條件>>" Visible="False"></asp:Label>
    <asp:Label ID="lblFormFlow" runat="server" meta:resourcekey="lblFormFlowResource1"
        Text="4.設定流程>>" Visible="False"></asp:Label>
    <asp:Label ID="lblFormPublish" runat="server" meta:resourcekey="lblFormPublishResource1"
        Text="5.設定發佈資訊>>" Visible="False"></asp:Label>
    <asp:HiddenField ID="HiddenField1" runat="server" Value="0" />
    <asp:Label ID="lblAutoNumberRepeat" runat="server" meta:resourcekey="lblAutoNumberRepeatResource1"
        Text="表單內已有自動編號欄位" Visible="False"></asp:Label>
    <asp:Label ID="lblFieldIdRepeat" runat="server" meta:resourcekey="lblFieldIdRepeatResource1"
        Text="欄位重覆" Visible="False"></asp:Label>
</asp:Content>
