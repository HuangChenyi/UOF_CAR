<%@ Page Title="" Language="C#" MasterPageFile="~/Master/TwoColumn.master" AutoEventWireup="true" Inherits="WKF_FlowManagement_ParallelDefault" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" Codebehind="ParallelDefault.aspx.cs" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register Src="../Browse/UC_SubFlowLayOut/UC_SubFlow.ascx" TagName="UC_SubFlow" TagPrefix="uc2" %>
<%@ Register Src="Layout/UC_SubFlow.ascx" TagName="UC_SubFlow" TagPrefix="uc1" %>
<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>
<%@ Register Src="../Browse/UC_SubFlowLayOut/UC_ParallelSite.ascx" TagName="UC_ParallelSite" TagPrefix="uc3" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ScriptContentPlaceHolder" runat="Server">

    <script type="text/javascript" id="telerikClientEvents1">
        function RadToolBar1_ButtonClicking(sender, args) {
            var value = args.get_item().get_value();

            if (value == "FlowMT") {
                //類別管理
                args.set_cancel(true);
                $uof.dialog.open2("~/WKF/FlowManagement/ParallelFlowMT.aspx", args.get_item(), "<%=lblMTTitle.Text%>", 380, 540, openDialogResult);
            }

            if (value == "AddFlow") {
                //新增平行流程
                var catagoryId = GetSeletedTagValue();
                args.set_cancel(true);
                $uof.dialog.open2("~/WKF/FlowManagement/SetupParallelFlow.aspx", args.get_item(), "<%=lblDiesign.Text%>", 1024, 768, openDialogResult, { "flowCatagoryId": catagoryId });
            }

            if (value == "SetFlow") {
                var catagoryId = GetSeletedTagValue();
                args.set_cancel(true);
                $uof.dialog.open2("~/WKF/FlowManagement/SetupParallelFlow.aspx", args.get_item(), "<%=lblDiesign.Text%>", 1024, 768, openDialogResult, { "ParallelFlowID": catagoryId });
            }

            if (value == "DeleteFlow") {
                if (!confirm('<%=lblDelete.Text %>')) {
                        args.set_cancel(true);
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
    <script id="selectjs" type="text/javascript">

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

    <asp:UpdatePanel id="UpdatePanel2" runat="server" RenderMode="Inline" UpdateMode="Conditional">
        <contenttemplate>
                            <telerik:RadToolBar ID="RadToolBar1" Runat="server" OnButtonClick="RadToolBar1_ButtonClick" OnClientButtonClicking="RadToolBar1_ButtonClicking" Width="100%">
                                <Items>
                                    <telerik:RadToolBarButton runat="server" Text="類別管理"
                                        meta:resourceKey="TBarButtonResource1"
                                        ImageUrl="~/Common/Images/Icon/icon_m43.gif"
                                        HoveredImageUrl="~/Common/Images/Icon/icon_m43.gif"
                                        DisabledImageUrl="~/Common/Images/Icon/icon_m43.gif"
                                        CheckedImageUrl="~/Common/Images/Icon/icon_m43.gif"
                                        Value="FlowMT">
                                    </telerik:RadToolBarButton>
                                    <telerik:RadToolBarButton runat="server" IsSeparator="True" Text="Button 1"  ImageUrl="~/App_Themes/DefaultTheme/images/toolbarSp.jpg">
                                    </telerik:RadToolBarButton>
                                    <telerik:RadToolBarButton runat="server" 
                                        DisabledImageUrl="~/Common/Images/Icon/icon_m87.gif" 
                                        HoveredImageUrl="~/Common/Images/Icon/icon_m87.gif" 
                                        ImageUrl="~/Common/Images/Icon/icon_m87.gif" 
                                        Value="AddFlow" 
                                        CheckedImageUrl="~/Common/Images/Icon/icon_m87.gif" 
                                        Text="新增平行流程"
                                        meta:resourceKey="TBarButtonResource2">
                                    </telerik:RadToolBarButton>
                                    <telerik:RadToolBarButton runat="server" IsSeparator="True" Text="Button 3"  ImageUrl="~/App_Themes/DefaultTheme/images/toolbarSp.jpg">
                                    </telerik:RadToolBarButton>
                                    <telerik:RadToolBarButton runat="server" 
                                        DisabledImageUrl="~/Common/Images/Icon/icon_m88.gif" 
                                        HoveredImageUrl="~/Common/Images/Icon/icon_m88.gif" 
                                        ImageUrl="~/Common/Images/Icon/icon_m88.gif" 
                                        Value="SetFlow" 
                                        CheckedImageUrl="~/Common/Images/Icon/icon_m88.gif" 
                                        Text="設定平行流程"
                                        meta:resourceKey="TBarButtonResource3">
                                    </telerik:RadToolBarButton>
                                    <telerik:RadToolBarButton runat="server" IsSeparator="True" Text="Button 5"  ImageUrl="~/App_Themes/DefaultTheme/images/toolbarSp.jpg">
                                    </telerik:RadToolBarButton>
                                    <telerik:RadToolBarButton runat="server" 
                                        DisabledImageUrl="~/Common/Images/Icon/icon_m03.gif" 
                                        HoveredImageUrl="~/Common/Images/Icon/icon_m03.gif" 
                                        ImageUrl="~/Common/Images/Icon/icon_m03.gif" 
                                        Value="DeleteFlow" 
                                        CheckedImageUrl="~/Common/Images/Icon/icon_m03.gif" 
                                        Text="刪除平行流程"
                                        meta:resourceKey="TBarButtonResource4">
                                    </telerik:RadToolBarButton>
                                    <telerik:RadToolBarButton runat="server" IsSeparator="True" Text="Button 7"  ImageUrl="~/App_Themes/DefaultTheme/images/toolbarSp.jpg">
                                    </telerik:RadToolBarButton>
                                </Items>

                            </telerik:RadToolBar>
                     </contenttemplate>
    </asp:UpdatePanel>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="LeftContentPlaceHolder" runat="server">

                                             <asp:UpdatePanel id="UpdatePanel3" runat="server" RenderMode="Inline" UpdateMode="Conditional">
                                                 <contenttemplate>
                                                    <telerik:RadTreeView ID="treeSubFlow" Runat="server"  OnNodeClick="treeSubFlow_NodeClick"></telerik:RadTreeView>
                                                <asp:HiddenField ID="hfOldNode" runat="server" />
                                        </contenttemplate>
                                             </asp:UpdatePanel>
                   <asp:Label ID="Label1" runat="server" Text="平行流程結構列表" Visible="False"
                       meta:resourcekey="Label1Resource1"></asp:Label>
 </asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="RightContentPlaceHolder" runat="Server">
     <asp:UpdatePanel id="UpdatePanel1" runat="server" RenderMode="Inline" UpdateMode="Conditional">
         <contenttemplate>
                        <TABLE width="100%" border=0>
                            <TBODY>
                                <TR>
                                    <TD align=left colSpan=2>
                                        <asp:Label id="lblErrorMessage" runat="server" Visible="False" Font-Bold="True" 
                                            ForeColor="Red" meta:resourcekey="lblErrorMessageResource1"></asp:Label>
                                    </TD>
                                </TR>
                                <TR>
                                    <TD style="vertical-align:top;text-align:center;word-break:break-all ;width:70%">
                                        <center>
                                        <uc3:UC_ParallelSite ID="UC_ParallelSite1" runat="server" /></center>
                                    </TD>
                                    <TD vAlign=top align=left>
                                        <TABLE width="100%" border=0>
                                            <TBODY>
                                                <TR>
                                                    <TD align=left>
                                                        <asp:Label id="lblDeleteDenied" runat="server"  Text="禁止刪除 ! 此平行流程有被下列主流程所使用：" 
                                                            Visible="False" ForeColor="Red" BackColor="White" 
                                                            meta:resourcekey="lblDeleteDeniedResource1"></asp:Label>
                                                     </TD>
                                                </TR>
                                                <TR>
                                                    <TD align=left>
                                                        <asp:Table id="Table1" runat="server" __designer:wfdid="w87" 
                                                            meta:resourcekey="Table1Resource1"></asp:Table>
                                                    </TD>
                                                </TR>
                                             </TBODY>
                                         </TABLE>
                                     </TD>
                                 </TR>
                             </TBODY>
                         </TABLE>&nbsp;
                         <asp:Label id="lblBeUsedMsg" runat="server"  ForeColor="RoyalBlue" 
                            BackColor="White" meta:resourcekey="lblBeUsedMsgResource1"></asp:Label> &nbsp;&nbsp; 
                    </contenttemplate>
     </asp:UpdatePanel>

        <asp:Label ID="lblDelete" runat="server" Text="確定要刪除?" Visible="False"
            meta:resourcekey="lblDeleteResource1"></asp:Label>&nbsp;
    <asp:Label ID="lbldeleteConfirmMsg" runat="server" Text="確定刪除?" Visible="False"
        meta:resourcekey="lbldeleteConfirmMsgResource1"></asp:Label>&nbsp;
    <asp:Label ID="lblalertEditError" runat="server" Text="請選擇流程!" Visible="False"
        meta:resourcekey="lblalertEditErrorResource1"></asp:Label>
    <asp:Label ID="lblalertInsertError" runat="server" Text="請指定欲新增流程之類別"
        Visible="False" meta:resourcekey="lblalertInsertErrorResource1"></asp:Label>
    <asp:Label ID="lblerrorMsg" runat="server" Text="禁止刪除 ! 此平行流程有被下列主流程所使用："
        Visible="False" meta:resourcekey="lblerrorMsgResource1"></asp:Label>
    <asp:Label ID="lblMTTitle" runat="server" Text="類別管理" Visible="False"
        meta:resourcekey="lblMTTitleResource1"></asp:Label>
    <asp:Label ID="lblDiesign" runat="server" Text="平行副流程設計" Visible="False"
        meta:resourcekey="lblDiesignResource1"></asp:Label>

</asp:Content>


