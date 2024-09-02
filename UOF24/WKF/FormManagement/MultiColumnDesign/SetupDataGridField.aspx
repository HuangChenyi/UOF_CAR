<%@ Page Title="" Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" CodeBehind="SetupDataGridField.aspx.cs" Inherits="Ede.Uof.Web.WKF.FormManagement.MultiColumnDesign.SetupDataGridField" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>
<%@ Register Src="~/WKF/FormManagement/MultiColumnDesign/UC_VersionFieldCollection.ascx" TagPrefix="uc1" TagName="UC_VersionFieldCollection" %>



<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <script type="text/javascript">
        function RadToolBar1_ButtonClicking(sender, args) {
            var value = args.get_item().get_value();

            if (value == "AddField") {//新增欄位
                args.set_cancel(true);
                $uof.dialog.open2("~/WKF/FormManagement/SetupField_SingleLineText.aspx", args.get_item(), "", 800, 600, openDialogResult,
                    { "formVersionId": "<%=this.formVersionId%>", "fieldParentId": "<%=fieldId%>" });
            }
            else if (value == "AdjustField") {//調整欄位順序
                args.set_cancel(true);
                $uof.dialog.open2("~/WKF/FormManagement/ChangeFieldSeq.aspx", args.get_item(), "", 400, 500, openDialogResult,
                    { "formVersionId": "<%=formVersionId%>", "fieldParentId": "<%=fieldId%>" });

            }
            else if (value == "DeleteField") {
                if (confirm('<%=lblConfirmDelete.Text %>') == false)
                    args.set_cancel(true);
            }
        }

        function openDialogResult(returnValue) {
            if(typeof(returnValue)=="undefined"){
                return false;
            }
            return true;
        }
    </script>
<table width="100%">
   <tr>
      <td>
          <telerik:RadToolBar ID="RadToolBar1" runat="server" Width="100%" meta:resourcekey="UltraWebToolbar1Resource1" OnClientButtonClicking="RadToolBar1_ButtonClicking" OnButtonClick="RadToolBar1_ButtonClick" SingleClick="None">
              <Items>
                  <telerik:RadToolBarButton runat="server" 
                      HoveredImageUrl="~/Common/Images/Icon/icon_m84.gif"
                      ImageUrl="~/Common/Images/Icon/icon_m84.gif" 
                      Value="AddField" CausesValidation="false"
                      CheckedImageUrl="~/Common/Images/Icon/icon_m84.gif"
                      Text="新增欄位" 
                      meta:resourcekey="TBarButtonResource4">
                  </telerik:RadToolBarButton>
                  <telerik:RadToolBarButton runat="server" IsSeparator="True" Text="Button 1" ImageUrl="~/App_Themes/DefaultTheme/images/toolbarSp.jpg" meta:resourcekey="RadToolBarButtonResource1">
                  </telerik:RadToolBarButton>
                  <telerik:RadToolBarButton runat="server" 
                      HoveredImageUrl="~/Common/Images/Icon/icon_m85.gif"
                      ImageUrl="~/Common/Images/Icon/icon_m85.gif" 
                      Value="AdjustField"  CausesValidation="false"
                      CheckedImageUrl="~/Common/Images/Icon/icon_m85.gif" 
                      Text="調整欄位順序" meta:resourcekey="TBarButtonResource5">
                  </telerik:RadToolBarButton>
                  <telerik:RadToolBarButton runat="server" IsSeparator="True" Text="Button 3" ImageUrl="~/App_Themes/DefaultTheme/images/toolbarSp.jpg" meta:resourcekey="RadToolBarButtonResource2">
                  </telerik:RadToolBarButton>
                  <telerik:RadToolBarButton runat="server" 
                      HoveredImageUrl="~/Common/Images/Icon/icon_m03.gif"
                      ImageUrl="~/Common/Images/Icon/icon_m03.gif" 
                      Value="DeleteField"
                      CheckedImageUrl="~/Common/Images/Icon/icon_m03.gif"  CausesValidation="false"
                      Text="刪除選擇欄位" meta:resourcekey="TBarButtonResource6">
                  </telerik:RadToolBarButton>
                  <telerik:RadToolBarButton runat="server" IsSeparator="True" Text="Button 5" ImageUrl="~/App_Themes/DefaultTheme/images/toolbarSp.jpg" meta:resourcekey="RadToolBarButtonResource3">
                  </telerik:RadToolBarButton>
              </Items>
          </telerik:RadToolBar>      
      </td>
   </tr>
   <tr>
      <td>
          <table border="0" cellpadding="0" cellspacing="0" width="100%">
              <tr>
                  <td>
                      <uc1:UC_VersionFieldCollection runat="server" ID="VersionFieldCollectionUC1" />
                  </td>
              </tr>
          </table>
          </td>
   </tr>
</table>
    <asp:Label ID="lblConfirmDelete" runat="server" Text="確定要刪除?" Visible="False" meta:resourcekey="lblConfirmDeleteResource1"></asp:Label>
    <asp:Label ID="lblDeleteExecMsg" runat="server" Text="有欄位有被當成加總或計算欄位，不允許刪除 !" Visible="False" meta:resourcekey="lblDeleteExecMsgResource1"></asp:Label>
</asp:Content>
