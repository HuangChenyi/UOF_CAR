<%@ Page Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="WKF_ExternalModule_DesignFormFlow" Title="" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" Codebehind="DesignFormFlow.aspx.cs" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register Src="../FlowManagement/Layout/UC_SetMastFlow.ascx" TagName="UC_SetMastFlow" TagPrefix="uc3" %>
<%@ Register Src="~/WKF/FlowManagement/UC_MasterFlow.ascx" TagName="UC_MasterFlow" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <head>
        <style>
            .SubFlowTD {vertical-align:top; background-attachment: fixed; background-image: url("<%=themePath %>/images/wkf/line1.gif"); background-repeat: repeat-y;}
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
    </head>

    <script id="DesignFormFlowJS" type="text/javascript">
        //導頁
        function RedirectPage(url) {
            window.location = url;
            return false;
        }
        function SaveFlowName() {
            var formverid = $uof.tool.htmlDecode("<%=System.Web.Security.AntiXss.AntiXssEncoder.HtmlEncode(formVersionId, true)%>");
            var masterFlowid = $uof.tool.htmlDecode("<%=System.Web.Security.AntiXss.AntiXssEncoder.HtmlEncode(flowId, true)%>");
            $uof.dialog.open2("~/WKF/ExternalModule/ModifyMasterFlowName.aspx", this, "", 400, 200, openDialogResult, { "formVersionId": formverid, "masterFlowId": masterFlowid });
            return false;
        }

        function openDialogResult(returnValue) {
            if (typeof (returnValue) == "undefined") {
                return false;
            }
            return true;
        }
    </script>
    <script type="text/javascript" id="telerikClientEvents1">
        function RadToolBar1_ButtonClicking(sender, args) {
            var formverid = $uof.tool.htmlDecode("<%=System.Web.Security.AntiXss.AntiXssEncoder.HtmlEncode(formVersionId, true)%>");
            var masterFlowid = $uof.tool.htmlDecode("<%=System.Web.Security.AntiXss.AntiXssEncoder.HtmlEncode(flowId, true)%>");
            var currentuser = $uof.tool.htmlDecode("<%=System.Web.Security.AntiXss.AntiXssEncoder.HtmlEncode(CurrentUser, true)%>");
            var currentculture = $uof.tool.htmlDecode("<%=System.Web.Security.AntiXss.AntiXssEncoder.HtmlEncode(CurrentCulture, true)%>");

            var value = args.get_item().get_value();
            if (value == "ModifyMasterFlow") {//維護主流程
                args.set_cancel(true);
                $uof.dialog.open2("~/WKF/FlowManagement/SetupMasterFlow.aspx", args.get_item(), "", 800, 800, openDialogResult, { "formVersionId": formverid, "masterFlowId": masterFlowid});
            }
            else if (value == "ModifyFlowName") {
                $("#<% = lblFlowNameSave.ClientID %>").css("display", "none");

            }
            else if (value == "DownloadDiagram") {
                window.open("../../WKF/Browse/Service/FormFlowPrintHandler.ashx?formVersionId=" + formverid + "&user=" + currentuser + "&cul=" + currentculture);
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
    <table>
        <tr>
            <td>
                <telerik:RadButton ID="ibtnSetupCondition" runat="server" CausesValidation="False" AutoPostBack="false"
                    Text="1.設定表單條件>>" meta:resourcekey="ibtnSetupConditionResource1"></telerik:RadButton>
                <telerik:RadButton ID="ibtnDesignFlow" runat="server" CausesValidation="False" AutoPostBack="false"
                    Text="2.設定表單流程>>" meta:resourcekey="ibtnDesignFlowResource1"></telerik:RadButton>
                &nbsp;
            </td>
        </tr>
    </table>
    <table width="100%">
        <tr>
            <td>
                <telerik:RadToolBar ID="RadToolBar1" runat="server" meta:resourcekey="UltraWebToolbar1Resource1" 
                    OnButtonClick="RadToolBar1_ButtonClick" OnClientButtonClicking="RadToolBar1_ButtonClicking" Width="100%">
                    <Items>
                        <telerik:RadToolBarButton runat="server" Text="維護流程" meta:resourcekey="TBarButtonResource1"
                            ImageUrl="~/Common/Images/Icon/icon_m109.gif"
                            HoveredImageUrl="~/Common/Images/Icon/icon_m109.gif"
                            DisabledImageUrl="~/Common/Images/Icon/icon_m109.gif"
                            CheckedImageUrl="~/Common/Images/Icon/icon_m109.gif"
                            Value="ModifyMasterFlow">
                        </telerik:RadToolBarButton>
                        <telerik:RadToolBarButton runat="server" IsSeparator="True" Text="Button 1" meta:resourcekey="UltraWebToolbar1Resource1">
                        </telerik:RadToolBarButton>
                        <telerik:RadToolBarButton runat="server" Text="儲存流程名稱" meta:resourcekey="TBarButtonResource2"
                            ImageUrl="~/Common/Images/Icon/icon_m66.gif"
                            HoveredImageUrl="~/Common/Images/Icon/icon_m66.gif"
                            DisabledCssClass="~/Common/Images/Icon/icon_m66.gif"
                            CheckedImageUrl="~/Common/Images/Icon/icon_m66.gif"
                            Value="ModifyFlowName">
                        </telerik:RadToolBarButton>
                        <telerik:RadToolBarButton runat="server" IsSeparator="True" Value="spSaveName" meta:resourcekey="UltraWebToolbar1Resource1">
                        </telerik:RadToolBarButton>
                        <telerik:RadToolBarButton runat="server" Value="DownloadDiagram" Text="下載流程圖" ImageUrl="~/Common/Images/Icon/icon_el01.png"  meta:resourcekey="TBarButtonResource3">
                        </telerik:RadToolBarButton>
                        <telerik:RadToolBarButton runat="server" IsSeparator="true"></telerik:RadToolBarButton>
                    </Items>
                </telerik:RadToolBar>
                <table align="left" cellspacing="1" class="PopTable" width="100%">
                    <tr>
                        <td class="PopTableLeftTD" style="width:20%">
                            <asp:Label ID="lblTitleFlowName" runat="server" meta:resourcekey="lblTitleFlowNameResource1"
                                Text="流程名稱"></asp:Label></td>
                        <td class="PopTableRightTD" style="width:30%">
                            <asp:Label ID="Label2" runat="server" ></asp:Label>

                            <asp:TextBox
                                ID="txtFlowName" runat="server" meta:resourcekey="txtFlowNameResource1"></asp:TextBox>
                            <asp:CustomValidator ID="rfvFlowName" runat="server" ErrorMessage="請輸入流程名稱" ControlToValidate="txtFlowName" Display="Dynamic" meta:resourcekey="rfvFlowNameResource1"></asp:CustomValidator><asp:Label ID="lblFlowNameSave" runat="server" Text="名稱已儲存" ForeColor="Red" Visible="False" meta:resourcekey="lblFlowNameSaveResource1"></asp:Label></td>
                        <td class="PopTableLeftTD" style="width:20%">
                            <asp:Label ID="Label1" runat="server" meta:resourcekey="Label1Resource1" Text="是否啟用流程設定"></asp:Label>
                        </td>
                        <td class="PopTableRightTD" style="width:30%" >
                            <asp:RadioButtonList ID="rblEnableFlow" runat="server" AutoPostBack="True" Enabled="False"
                                meta:resourcekey="rblEnableFlowResource1" OnSelectedIndexChanged="rblEnableFlow_SelectedIndexChanged"
                                RepeatDirection="Horizontal">
                                <asp:ListItem meta:resourcekey="ListItemResource1" Value="1">是</asp:ListItem>
                                <asp:ListItem meta:resourcekey="ListItemResource2" Selected="True" Value="0">否</asp:ListItem>
                            </asp:RadioButtonList>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td align="center" style="height: 71px;">

                <asp:Panel ID="Panel1" ScrollBars="Auto" runat="server" Width="100%" meta:resourcekey="Panel1Resource1">
                    <table>
                        <tr>
                            <td>
                                <uc3:UC_SetMastFlow ID="UC_SetMastFlow1" runat="server" />
                            </td>
                        </tr>
                    </table>

                </asp:Panel>
            </td>
        </tr>
    </table>
    <asp:Label ID="lblConfirmDelete" runat="server" meta:resourcekey="lblConfirmDeleteResource1"
        Text="確定要刪除?" Visible="False"></asp:Label>&nbsp;
    <asp:Label ID="lblFormCondition" runat="server" Text="1.設定表單條件>>" Visible="False" meta:resourcekey="lblFormConditionResource1"></asp:Label>
    <asp:Label ID="lblFormFlow" runat="server" Text="2.設定表單流程>>" Visible="False" meta:resourcekey="lblFormFlowResource1"></asp:Label>
    <asp:Label ID="lblInsert" runat="server" Text="確定新增" Visible="False" meta:resourcekey="lblInsertResource1"></asp:Label>

</asp:Content>

