<%@ Page Language="C#" MasterPageFile="~/Master/TwoColumn.master" AutoEventWireup="true" Inherits="WKF_FlowManagement_Default" Title="副流程設計" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" Codebehind="Default.aspx.cs" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register Src="../Browse/UC_SubFlowLayOut/UC_SubFlow.ascx" TagName="UC_SubFlow" TagPrefix="uc2" %>
<%@ Register Src="Layout/UC_SubFlow.ascx" TagName="UC_SubFlow" TagPrefix="uc1" %>
<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ScriptContentPlaceHolder" runat="Server">
     <script type="text/javascript" id="Script1">

         function RadToolBar1_ButtonClicking(sender, args) {
             var value = args.get_item().get_value();
             if (value == "FlowMT") {
                 args.set_cancel(true);
                 $uof.dialog.open2("~/WKF/FlowManagement/SubFlowMT.aspx", args.get_item(), "", 380, 540, openDialogResult);
             }
             else if (value == "SetSubFlow") {
                 args.set_cancel(true);
                 $uof.dialog.open2("~/WKF/FlowManagement/SetupSupFlow.aspx", args.get_item(), "", 1024, 1024, openDialogResult, {"subFlowId":GetSeletedTagValue()});
             }

             else if (value == "AddSubFlow") {
                 args.set_cancel(true);
                 $uof.dialog.open2("~/WKF/FlowManagement/SetupSupFlow.aspx", args.get_item(), "", 1024, 1024, openDialogResult, {"flowCatagoryId":GetSeletedTagValue()});
             }

             else if (value == "DeleteSubFlow") {
                 if (confirm('<%=lblDelete.Text %>') == false) {
                     args.set_cancel(true);
                 }
             }

             else if (value == 'tempBtn') {
                 args.set_cancel(true);
             }

             else {
                 var tree = $find('<%=treeSubFlow.ClientID %>');
                 var obj = tree.get_selectedNode();
                 var categoryId = '';
                 var flowId = '';
                 if (obj != null) {
                     if (obj.get_parent().get_value) {
                         categoryId = obj.get_parent().get_value();
                         flowId = obj.get_value();
                     } else {
                         categoryId = obj.get_value();
                     }
                 }

                 if (value == "ExportSubFlow" || value == "ExportCategorySubFlow") {
                     window.open('ExportSubFlow.aspx?categoryId=' + categoryId + '&flowId=' + flowId);
                 }
                 else if (value == "ImportSubFlow") {
                     args.set_cancel(true);
                     $uof.dialog.open2("~/WKF/FlowManagement/ImportSubFlow.aspx", args.get_item(), "", 600, 600, openDialogResult, { "categoryId": categoryId, "flowId": flowId });
                 }
             }
         }

         function openDialogResult(returnValue) {
             if (typeof (returnValue) == "undefined") {
                 return false;
             }
             return true;
         }
    </script>

    <script id="Script2" type="text/javascript">
        function GetSeletedTagValue() {
            var treeClientId = '<%=treeSubFlow.ClientID %>'
            var tree = $find(treeClientId);
            var obj = tree.get_selectedNode();
            return obj.get_value();
        }
    </script>

     <style>
        .SubFlowTD {vertical-align:top; background-attachment: fixed; background-image: url("../../App_Themes/DefaultTheme/images/wkf/line1.gif"); background-repeat: repeat-y;}
        .EmptyTable {padding:0px;border:0px;margin:0px;text-align:center}
        .SignerTD {color:blue;text-align:left}
        .SiteLeftTD {background-image: url("<%=themePath %>/images/wkf/site_left.gif"); background-repeat: repeat-y;}
        .SiteMiddleTD {background-image: url("<%=themePath %>/images/wkf/app_con.gif"); background-repeat: repeat-y;}
        .SiteRightTD {width:8px;background-image: url("<%=themePath %>/images/wkf/site_right.gif"); background-repeat: repeat-y;}
        .CondTextTD {text-align:center;font-weight:bold;}
        .CondLeftTD {background-image: url("<%=themePath %>/images/wkf/site_left_big.gif"); background-repeat: repeat-y;}
        .CondMiddleTD { background-image: url("<%=themePath %>/images/wkf/cond_con.gif");background-repeat: repeat-y;text-align:center}
        .CondRightTD {background-image: url("<%=themePath %>/images/wkf/site_rig_big.gif"); background-repeat: repeat-y;}
        td_{text-align:center;vertical-align:top;font-size:12px;width:120;}
        table_{text-align:center;border:0px}
     </style>

</asp:Content>

    <asp:Content ID="Content2" ContentPlaceHolderID="ToolbarContentPlaceHolder" runat="Server">
         <asp:UpdatePanel ID="UpdatePanel2" runat="server" RenderMode="Inline" UpdateMode="Conditional">
                    <ContentTemplate>
                        <telerik:RadToolBar ID="RadToolBar1" Runat="server" meta:resourcekey="UltraWebToolbar1Resource1"  Width="100%" OnButtonClick="RadToolBar1_ButtonClick" OnClientButtonClicking="RadToolBar1_ButtonClicking" SingleClick="None">
                            <Items>
                                <telerik:RadToolBarButton runat="server" Text="類別管理" meta:resourceKey="TBarButtonResource1"
                                    ImageUrl="~/Common/Images/Icon/icon_m43.gif"
                                    HoveredImageUrl="~/Common/Images/Icon/icon_m43.gif"
                                    DisabledImageUrl="~/Common/Images/Icon/icon_m43.gif"
                                    CheckedImageUrl="~/Common/Images/Icon/icon_m43.gif"
                                    Value="FlowMT">
                                </telerik:RadToolBarButton>
                                <telerik:RadToolBarButton runat="server" IsSeparator="True" Text="Button 1"  ImageUrl="~/App_Themes/DefaultTheme/images/toolbarSp.jpg" meta:resourcekey="RadToolBarButtonResource1">
                                </telerik:RadToolBarButton>
                                <telerik:RadToolBarButton runat="server" Text="新增副流程"
                                    meta:resourceKey="TBarButtonResource2"
                                    ImageUrl="~/Common/Images/Icon/icon_m88.gif"
                                    HoveredImageUrl="~/Common/Images/Icon/icon_m88.gif"
                                    DisabledImageUrl="~/Common/Images/Icon/icon_m88.gif"
                                    CheckedImageUrl="~/Common/Images/Icon/icon_m88.gif"
                                    Value="AddSubFlow">
                                </telerik:RadToolBarButton>
                                <telerik:RadToolBarButton runat="server" IsSeparator="True" Text="Button 3"  ImageUrl="~/App_Themes/DefaultTheme/images/toolbarSp.jpg" meta:resourcekey="RadToolBarButtonResource2">
                                </telerik:RadToolBarButton>
                                <telerik:RadToolBarButton runat="server" Text="設定副流程"
                                    meta:resourceKey="TBarButtonResource3"
                                    ImageUrl="~/Common/Images/Icon/icon_m88.gif"
                                    HoveredImageUrl="~/Common/Images/Icon/icon_m88.gif"
                                    DisabledImageUrl="~/Common/Images/Icon/icon_m88.gif"
                                    CheckedImageUrl="~/Common/Images/Icon/icon_m88.gif"
                                    Value="SetSubFlow">
                                </telerik:RadToolBarButton>
                                <telerik:RadToolBarButton runat="server" IsSeparator="True" Text="Button 5"  ImageUrl="~/App_Themes/DefaultTheme/images/toolbarSp.jpg" meta:resourcekey="RadToolBarButtonResource3">
                                </telerik:RadToolBarButton>
                                <telerik:RadToolBarButton runat="server" Text="刪除副流程"
                                    meta:resourceKey="TBarButtonResource4"
                                    ImageUrl="~/Common/Images/Icon/icon_m03.gif"
                                    HoveredImageUrl="~/Common/Images/Icon/icon_m03.gif"
                                    DisabledImageUrl="~/Common/Images/Icon/icon_m03.gif"
                                    CheckedImageUrl="~/Common/Images/Icon/icon_m03.gif"
                                    Value="DeleteSubFlow">
                                </telerik:RadToolBarButton>
                                <telerik:RadToolBarButton runat="server" IsSeparator="True" Text="Button 7"  ImageUrl="~/App_Themes/DefaultTheme/images/toolbarSp.jpg" meta:resourcekey="RadToolBarButtonResource4">
                                </telerik:RadToolBarButton>
                                <telerik:RadToolBarButton runat="server" Text="匯出類別流程"
                                    meta:resourceKey="TBarButtonResource6"
                                    ImageUrl="~/Common/Images/Icon/icon_m32.gif"
                                    HoveredImageUrl="~/Common/Images/Icon/icon_m32.gif"
                                    DisabledImageUrl="~/Common/Images/Icon/icon_m32.gif"
                                    CheckedImageUrl="~/Common/Images/Icon/icon_m32.gif"
                                    Value="ExportCategorySubFlow">
                                </telerik:RadToolBarButton>
                                <telerik:RadToolBarButton runat="server" IsSeparator="True" Text="Button 9"  ImageUrl="~/App_Themes/DefaultTheme/images/toolbarSp.jpg" meta:resourcekey="RadToolBarButtonResource5">
                                </telerik:RadToolBarButton>
                                 <telerik:RadToolBarButton runat="server" Text="匯出流程"
                                    meta:resourceKey="TBarButtonResource7"
                                    ImageUrl="~/Common/Images/Icon/icon_m32.gif"
                                    HoveredImageUrl="~/Common/Images/Icon/icon_m32.gif"
                                    DisabledImageUrl="~/Common/Images/Icon/icon_m32.gif"
                                    CheckedImageUrl="~/Common/Images/Icon/icon_m32.gif"
                                    Value="ExportSubFlow">
                                </telerik:RadToolBarButton>
                                <telerik:RadToolBarButton runat="server" IsSeparator="True" Text="Button 11"  ImageUrl="~/App_Themes/DefaultTheme/images/toolbarSp.jpg" meta:resourcekey="RadToolBarButtonResource6">
                                </telerik:RadToolBarButton>
                                <telerik:RadToolBarButton runat="server" Text="匯入"
                                    meta:resourceKey="TBarButtonResource8"
                                    ImageUrl="~/Common/Images/Icon/icon_m59.gif"
                                    HoveredImageUrl="~/Common/Images/Icon/icon_m59.gif"
                                    DisabledImageUrl="~/Common/Images/Icon/icon_m59.gif"
                                    CheckedImageUrl="~/Common/Images/Icon/icon_m59.gif"
                                    Value="ImportSubFlow">
                                </telerik:RadToolBarButton>
                                <telerik:RadToolBarButton runat="server" IsSeparator="True" Text="Button 13"  ImageUrl="~/App_Themes/DefaultTheme/images/toolbarSp.jpg" meta:resourcekey="RadToolBarButtonResource7">
                                </telerik:RadToolBarButton>
                            </Items>
                        </telerik:RadToolBar>
                    </ContentTemplate>
                </asp:UpdatePanel>
    </asp:Content>

 <asp:Content ID="Content3" ContentPlaceHolderID="LeftContentPlaceHolder" runat="server" >
     <asp:UpdatePanel id="UpdatePanel3" runat="server" RenderMode="Inline" UpdateMode="Conditional">
         <contenttemplate>
             <telerik:RadTreeView ID="treeSubFlow" Runat="server" OnNodeClick="treeSubFlow_NodeClick" meta:resourcekey="treeSubFlowResource2"></telerik:RadTreeView>
             </contenttemplate>
         </asp:UpdatePanel>
     <asp:Label ID="Label1" runat="server" meta:resourcekey="Label1Resource1" Text="副流程結構列表" Visible="False"></asp:Label>
 </asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="RightContentPlaceHolder" runat="Server">

    <asp:UpdatePanel id="UpdatePanel1" runat="server" RenderMode="Inline"  UpdateMode="Conditional" >
        <contenttemplate>
            <table style="width:100%" border="0">
                <tbody>
                    <tr>
                        <td style="text-align:left" colspan="2">
                            <asp:Label ID="lblErrorMessage" meta:resourcekey="lblErrorMessageResource1" runat="server"
                                Visible="False" Font-Bold="True" ForeColor="Red"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align:center;vertical-align:top;width:25%;word-break:break-all">
                            <center>
                                <uc2:UC_SubFlow ID="UC_SubFlow1" runat="server"></uc2:UC_SubFlow>
                            </center>
                        </td>
                        <td style="text-align:center;vertical-align:top">
                            <table style="width:100%" border="0">
                                <tbody>
                                    <tr>
                                        <td align="left">
                                            <asp:Label ID="lblDeleteDenied" runat="server" meta:resourcekey="lblDeleteDeniedResource1"
                                                Text="禁止刪除 ! 此副流程有被下列主流程所使用：" Visible="False" ForeColor="Red" BackColor="White"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="left">
                                            <asp:Table ID="Table1" runat="server" __designer:wfdid="w87" meta:resourcekey="Table1Resource1">
                                            </asp:Table>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                            <table width="100%" border="0">
                                <tbody>
                                    <tr>
                                        <td align="left">
                                            <asp:Label ID="lblDeleteDeniedByParallel" runat="server" meta:resourcekey="lblDeleteDeniedByParallelResource1"
                                                Text="禁止刪除 ! 此副流程有被下列平行流程所使用：" Visible="False" ForeColor="Red" BackColor="White"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="left">
                                            <asp:Table ID="Table2" runat="server" __designer:wfdid="w87" meta:resourcekey="Table2Resource1">
                                            </asp:Table>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </td>
                    </tr>
                </tbody>
            </table>
            &nbsp;<asp:Label ID="lblBeUsedMsg" runat="server" meta:resourcekey="lblBeUsedMsgResource1"
                ForeColor="RoyalBlue" BackColor="White"></asp:Label>
            &nbsp;&nbsp;
        </contenttemplate>
    </asp:UpdatePanel>

    <asp:Label ID="lblErrorMesg" runat="server" Text="起始依據已變更：因部門或職級不存在！" Visible="False" meta:resourcekey="lblErrorMesgResource1"></asp:Label>&nbsp; 
    <asp:Label ID="lblDelete" runat="server" Text="確定要刪除?" Visible="False" meta:resourcekey="lblDeleteResource1"></asp:Label>&nbsp;
    <asp:Label ID="lbldeleteConfirmMsg" runat="server" Text="確定刪除?" Visible="False" meta:resourcekey="lbldeleteConfirmMsgResource1"></asp:Label>&nbsp;
    <asp:Label ID="lblalertEditError" runat="server" Text="請選擇流程!" Visible="False" meta:resourcekey="lblalertEditErrorResource1"></asp:Label>
    <asp:Label ID="lblalertInsertError" runat="server" Text="請指定欲新增流程之類別" Visible="False" meta:resourcekey="lblalertInsertErrorResource1"></asp:Label>
    <asp:Label ID="lblerrorMsg" runat="server" Text="禁止刪除 ! 此副流程有被下列主流程所使用：" Visible="False" meta:resourcekey="lblerrorMsgResource1"></asp:Label>
</asp:Content>

  
