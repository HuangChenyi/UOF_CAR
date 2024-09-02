<%@ Page Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="WKF_ExternalModule_ExternalFormScript" Title="" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" CodeBehind="ExternalFormScript.aspx.cs" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>
<%@ Register Src="~/Common/FileCenter/V3/UC_FileCenter.ascx" TagPrefix="uc1" TagName="UC_FileCenter" %>
<%@ Register Src="~/WKF/FormManagement/MultiColumnDesign/UC_VersionFieldCollectionUsing.ascx" TagPrefix="uc1" TagName="UC_VersionFieldCollectionUsing" %>
<%@ Register Src="~/WKF/FormManagement/VersionFieldUserControl/VersionFieldCollectionUsingUC.ascx" TagPrefix="uc2" TagName="VersionFieldCollectionUsingUC" %>
<%@ Register Src="~/WKF/Common/UC_FileOnlinePreview.ascx" TagPrefix="uc9" TagName="UC_FileOnlinePreview" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <head>
        <script id="ExternalFormScriptJS" type="text/javascript">
            $(function () {
                try {
                    var actionMode = $('#<%=hiddenActionMode.ClientID%>').val();
                    if (actionMode != "Init") {
                        $uof.dialog.open2("<%=confirmWinUrl%>", "", "<%=dialogTitleName%>", "<%=confirmWinWidth%>", "<%=confirmWinHeight%>", function checkReturn(returnValue) {
                            if (typeof (returnValue) == "undefined") {
                                $('#<%=hiddenActionMode.ClientID%>').val("Init");
                                return false;
                            }
                            else {
                                $uof.dialog.set_returnValue(returnValue);
                                $uof.dialog.close();
                                return true;
                            }
                        });

                    }
                } catch (e) {
                    alert("<%=lblnewWindowMsg.Text%>");
                }
            });

        </script>

        <script type="text/javascript" id="telerikClientEvents1">
            function RadToolBar1_ButtonClicking(sender, args) {
                var value = args.get_item().get_value();
                if (value == "ShowFlow") {
                    args.set_cancel(true);
                    $uof.dialog.open2("~/WKF/Browse/ViewMasterFlow.aspx", args.get_item(), "<%=dialogTitleName%>", 1280, 1080, function checkReturn(returenValue) {
                        if (typeof (returnValue) == "undefined") {
                            return false;
                        }
                        return true;
                    }, { "formVersionId": "<%=formVersionId%>", "flowId": "<%=flowId%>" });
                }

                if (value === "SimulationFlow") {

                }

                if (value === "PreAdditionalSign") {

                }
            }
        </script>

        <style type="text/css">
            .formTitle {
                background-image: url(../../App_Themes/DefaultTheme/images/po_06.gif);
                text-align: center;
                height: 20px;
            }

            .formInfo {
                background-color: White;
                vertical-align: top;
            }

            .bigT {
                color: #ffffff;
                font-size: 25px;
                font-weight: bolder;
            }

            .applicantInfo {
                table-layout: fixed;
                white-space: nowrap;
                height: inherit;
            }

            .applicantInfo > tbody {
                display: block;
                height: inherit;
                white-space: nowrap;
                padding-left: 5px;
            }
        </style>
    </head>

    <table width="100%" cellpadding="0" cellpadding="0" border="0" height="100%">
        <tr>
            <td style="background-image: url(<%=themePath %>/images/wf_bg.gif)" valign="top">
                <center>
                    <table width="96%" border="0" align="center" cellpadding="0" cellspacing="0">
                      <tr>
                        <td>
                            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                                <tr>
                                    <td style="background-image:url(<%=themePath %>/images/wf_a01.gif);background-position:0% 100%;height:15px;width:15px"></td>
                                    <td style="background-image:url(<%=themePath %>/images/wf_a09.gif);background-position:0% 100%;background-repeat:repeat-x;height:15px"></td>
                                    <td style="background-image:url(<%=themePath %>/images/wf_a02.gif);background-position:0% 100%;height:15px;width:15px"></td>
                                </tr>
                                <tr>
                                    <td style="background-image: url(<%=themePath %>/images/wf_a03.gif)"></td>
                                    <td style="background-image: url(<%=themePath %>/images/wf_a04.gif)">
                                        <table width="100%">
                                            <tr>
                                                <td>
                                                    <telerik:RadToolBar ID="RadToolBar1" runat="server" meta:resourcekey="UltraWebToolbar1Resource1" Width="100%" OnButtonClick="RadToolBar1_ButtonClick" OnClientButtonClicking="RadToolBar1_ButtonClicking">
                                                        <Items>
                                                            <telerik:RadToolBarButton runat="server" Text="觀看表單流程" meta:resourceKey="TBarButtonResource3"
                                                                ImageUrl="~/Common/Images/Icon/icon_m101.gif"
                                                                HoveredImageUrl="~/Common/Images/Icon/icon_m101.gif"
                                                                DisabledImageUrl="~/Common/Images/Icon/icon_m101.gif"
                                                                CheckedImageUrl="~/Common/Images/Icon/icon_m101.gif"
                                                                Value="ShowFlow">
                                                            </telerik:RadToolBarButton>
                                                            <telerik:RadToolBarButton runat="server" IsSeparator="True" Text="Button 1"  ImageUrl="~/App_Themes/DefaultTheme/images/toolbarSp.jpg" meta:resourcekey="RadToolBarButtonResource1">
                                                            </telerik:RadToolBarButton>
                                                            <telerik:RadToolBarButton runat="server" CausesValidation="false"
                                                                        ImageUrl="~/Common/Images/Icon/icon_m101.gif"
                                                                        Value="SimulationFlow"
                                                                        HoveredImageUrl="~/Common/Images/Icon/icon_m101.gif"
                                                                        CheckedImageUrl="~/Common/Images/Icon/icon_m101.gif"
                                                                        Text="模擬流程" meta:resourcekey="TBarButtonResource11">
                                                            </telerik:RadToolBarButton>
                                                            <telerik:RadToolBarButton runat="server" IsSeparator="True" Text="Button 3" 
                                                                ImageUrl="~/App_Themes/DefaultTheme/images/toolbarSp.jpg" meta:resourcekey="RadToolBarButtonResource2">
                                                            </telerik:RadToolBarButton>
                                                            <telerik:RadToolBarButton runat="server" CausesValidation="false"
                                                                ImageUrl="~/Common/Images/Icon/icon_m101.gif"
                                                                Value="PreAdditionalSign"
                                                                HoveredImageUrl="~/Common/Images/Icon/icon_m101.gif"
                                                                CheckedImageUrl="~/Common/Images/Icon/icon_m101.gif"
                                                                Text="進階加簽" meta:resourcekey="TBarButtonResource14">
                                                            </telerik:RadToolBarButton>
                                                            <telerik:RadToolBarButton Value="PreAdd" runat="server" IsSeparator="True" 
                                                                Text="Button 5" ImageUrl="~/App_Themes/DefaultTheme/images/toolbarSp.jpg" meta:resourcekey="RadToolBarButtonResource3">
                                                            </telerik:RadToolBarButton>
                                                        </Items>
                                                    </telerik:RadToolBar>
                                                </td>
                                            </tr>
                                        </table>
                                        <table width="100%">
                                            <tr>
                                                <td style="width: 25%; height: 100%; margin: 0; padding: 0; padding-right: 3px;" valign="top">
                                                            <table class="PopTable" style="height: 140px;" width="100%">
                                                                <tr style="vertical-align: top;">
                                                                    <td align="center" class="PopTableHeader" height="20px" style="text-align: center;">
                                                                            <center>
                                                                                <asp:Label ID="Label4" runat="server" Text="申請資訊" meta:resourcekey="Label4Resource1"></asp:Label>
                                                                            </center>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td style="background-color: white; height: 100%; margin: 0; padding: 0" valign="top">
                                                                        <asp:Panel ID="pnlAppInfo" runat="server" Height="140px" ScrollBars="Auto">
                                                                            <table cellpadding="0" cellspacing="0" width="100%" id="TABLE1" runat="server" style="height: 135px; margin: 0; padding: 0" class="applicantInfo">
                                                                                <tr>
                                                                                    <td align="right" style="width: 26%;" nowrap="nowrap">
                                                                                        <asp:Label ID="Label1" runat="server" Text="申請者：" meta:resourcekey="Label1Resource1"></asp:Label>
                                                                                            &nbsp;
                                                                                    </td>
                                                                                    <td style="text-align: left">&nbsp;<asp:Label ID="lblApplicant" runat="server" meta:resourcekey="lblApplicantResource1"></asp:Label></td>
                                                                                    <td style="height: 28px"></td>
                                                                                    <td style="height: 28px"></td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <td align="right" style="width: 26%;" nowrap="nowrap">
                                                                                        <asp:Label ID="lbeFormStatusTitle" runat="server" Text="表單狀態：" meta:resourcekey="lbeFormStatusTitleResource1"></asp:Label>
                                                                                            &nbsp;
                                                                                    </td>
                                                                                    <td style="text-align: left">
                                                                                        <asp:RadioButtonList ID="rblFormType" runat="server" RepeatDirection="Horizontal" meta:resourcekey="rblFormTypeResource1">
                                                                                            <asp:ListItem Value="0" meta:resourcekey="ListItemResource1" Text="緊急"></asp:ListItem>
                                                                                            <asp:ListItem Value="1" meta:resourcekey="ListItemResource2" Text="急"></asp:ListItem>
                                                                                            <asp:ListItem Selected="True" Value="2" meta:resourcekey="ListItemResource3" Text="普通"></asp:ListItem>
                                                                                        </asp:RadioButtonList>
                                                                                    </td>
                                                                                    <td style="height: 28px"></td>
                                                                                    <td style="height: 28px"></td>
                                                                                </tr>
                                                                                <tr id="trApplicantDept" runat="server">
                                                                                    <td align="right" style="width: 26%;" nowrap="nowrap">
                                                                                        <asp:Label ID="Label2" runat="server" Text="申請部門：" meta:resourcekey="Label2Resource1"></asp:Label>
                                                                                            &nbsp;
                                                                                    </td>
                                                                                    <td style="text-align: left">&nbsp;
                                                                                        <asp:DropDownList ID="ddlUserDept" runat="server" OnSelectedIndexChanged="ddlUserDept_SelectedIndexChanged" meta:resourcekey="ddlUserDeptResource1" AutoPostBack="True"></asp:DropDownList>
                                                                                        <asp:Label ID="lblMsgNoSettingJobTitle" runat="server" Text="無設定申請者職級" Visible="False" ForeColor="Red" meta:resourcekey="lblMsgNoSettingJobTitleResource1"></asp:Label>
                                                                                    </td>
                                                                                    <td style="height: 28px"></td>
                                                                                    <td style="height: 28px"></td>
                                                                                </tr>
                                                                            </table>
                                                                        </asp:Panel>
                                                                    </td>
                                                                    </tr>
                                                            </table>
                                                    </td>
                                                <td style="width: 25%; height: 100%; padding-left: 0; padding-right: 3px; margin: 0; padding-bottom: 0; padding-top: 0;" valign="top">
                                                        <table cellspacing="0" class="PopTable" style="height: 160px; margin: 0; padding: 0" width="100%">
                                                            <tr style="vertical-align: top;">
                                                                <td align="center" class="PopTableHeader" style="text-align: center; height: 20px">
                                                                    <center>
                                                                    <asp:Label ID="Label6" runat="server" Text="意見" meta:resourcekey="Label6Resource1"></asp:Label>
                                                                    </center>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td style="background-color: white; height: 140px; margin: 0; padding-bottom: 0; padding-top: 0;" valign="top" align="left">
                                                                    <asp:TextBox ID="tbxComment" runat="server" TextMode="MultiLine" Width="100%" Height="100%" meta:resourcekey="tbxCommentResource1"></asp:TextBox>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                <td id="AttachmentsByForm" runat="server" style="width: 25%; height: 100%; margin: 0; padding: 0; padding-right: 3px;" valign="top">
                                                        <table cellspacing="0" class="PopTable" style="height: 160px; margin: 0; padding: 0;table-layout:fixed;word-wrap:break-word" width="100%">
                                                            <tr style="vertical-align: top;">
                                                                <td align="center" class="PopTableHeader" height="20px" style="text-align: center;">
                                                                    <center>
                                                                    <asp:Label ID="Label5" runat="server" Text="相關附件(表單)" meta:resourcekey="Label5Resource1"></asp:Label>
                                                                    </center>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td style="background-color: white; height: 140px; margin: 0; padding: 0; width: 100%; vertical-align: top; text-align: center">
                                                                    <div align="center" style="height: 135px; overflow: auto; width: 100%; margin: 0; padding: 0">
                                                                    <asp:LinkButton ID="lbtnRemoteFileCenter" runat="server" ForeColor="OliveDrab"   CausesValidation="False" Text="檔案操作" meta:resourcekey="lbtnRemoteFileCenterResource1" OnClick="lbtnRemoteFileCenter_Click"></asp:LinkButton>
                                                                        <div id="divFC" runat="server" style="text-align:left">
                                                                            <uc1:UC_FileCenter runat="server" id="UC_FileCenter1" ProxyEnabled="true"/>
                                                                        </div>
                                                                        <div id="divFOP" runat="server" style="text-align:left;">
                                                                            <uc9:UC_FileOnlinePreview runat="server" ID="UC_FileOnlinePreview" />
                                                                        </div>
                                                                    <asp:Label ID="lblRemoteFileGroupId" runat="server" Visible="False" meta:resourcekey="lblRemoteFileGroupIdResource1"></asp:Label>
                                                                    </div>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                <td id="AttachmentsBySite" runat="server" style="width: 25%; height: 100%; margin: 0; padding: 0" valign="top">
                                                        <table cellspacing="0" class="PopTable" style="height: 160px; margin: 0; padding: 0;table-layout:fixed;word-wrap:break-word" width="100%">
                                                            <tr style="vertical-align: top;">
                                                                <td align="center" class="PopTableHeader" height="20px" style="text-align: center;">
                                                                    <center>
                                                                        <asp:Label ID="lblPersonal" runat="server" Text="個人附件(站點)" meta:resourcekey="lblPersonalResource1"></asp:Label>
                                                                    </center>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td align="center" style="background-color: white; height: 140px; margin: 0; padding: 0; width: 100%" valign="top">
                                                                    <div align="center" style="height: 135px; overflow: auto; width: 100%; margin: 0; padding: 0">
                                                                    <asp:LinkButton ID="lbtnPersonalRemoteFileCenter" runat="server" ForeColor="OliveDrab"  meta:resourcekey="LinkButton1Resource1" CausesValidation="False" Text="檔案操作"></asp:LinkButton>
                                                                        <div id="divFCPersonal" runat="server" style="text-align:left">
                                                                            <uc1:UC_FileCenter runat="server" id="UC_PersonalFileCenter" ProxyEnabled="true"/>
                                                                        </div>
                                                                        <div id="divFOPPersonal" runat="server" style="text-align:left;">
                                                                            <uc9:UC_FileOnlinePreview runat="server" ID="UC_FileOnlinePreviewPersonal" />
                                                                        </div>
                                                                    <asp:Label ID="lblPersonalRemoteFileGroupId" runat="server" Visible="False" meta:resourcekey="lblPersonalRemoteFileGroupIdResource1"></asp:Label>
                                                                    </div>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                            </tr>
                                        </table>
                            </td>
                                    <td style="background-image: url(<%=themePath %>/images/wf_a05.gif)"></td>
                                </tr>
                                <tr>
                                    <td style="background-image:url(<%=themePath %>/images/wf_a06.gif);background-position:0% 0%;height:20px;width:15px"></td>
                                    <td style="background-image:url(<%=themePath %>/images/wf_a07.gif);background-position:0% 0%;height:20px"></td>
                                    <td style="background-image:url(<%=themePath %>/images/wf_a08.gif);background-position:0% 0%;height:20px;width:15px"></td>
                                </tr>
                            </table>
                        </td>
                      </tr>
                    </table>
                    <table width="96%" border="0" align="center" cellpadding="0" cellspacing="0">
                        <tr>
                          <td class="blank8"></td>
                        </tr>
                    </table>
                    <table width="96%" border="0" align="center" cellpadding="0" cellspacing="0">
                        <tr>
                          <td>
                              <table width="100%" border="0" cellpadding="0" cellspacing="0">
                                <tr>
                                  <td width="75"><img src="<%=themePath %>/images/wf_icon01.jpg" width="120" height="65"></td>
                                  <td style="background-image: url(<%=themePath %>/images/wf_a01.jpg);background-repeat:repeat-x;height:65px;background-position: 0% 100%;"><table width="100%" border="0" cellpadding="0" cellspacing="0">
                                    <tr>
                                      <td class="bigT" style="height:65px;vertical-align:middle;text-align:left"><asp:Label ID="lblFormName" runat="server" meta:resourcekey="lblFormNameResource1"></asp:Label></td>
                                      <td style="height:65px;vertical-align:middle;text-align:right"><asp:Panel ID="ScriptNamePanel" runat="server" meta:resourcekey="ScriptNamePanelResource1"><table><tr><td><asp:Label ID="Label3" runat="server" ForeColor="Red" Text="＊" meta:resourcekey="Label3Resource1"></asp:Label><asp:Label ID="lblScriptName" runat="server" Text="草稿名稱" meta:resourcekey="lblScriptNameResource1" CssClass="h"></asp:Label>：<asp:TextBox ID="tbxScriptName" runat="server" meta:resourcekey="tbxScriptNameResource1" Width="200px"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidatorScriptName" runat="server" ControlToValidate="tbxScriptName"  Display="Dynamic" ErrorMessage="請輸入草稿名稱" meta:resourcekey="RequiredFieldValidatorScriptNameResource1"></asp:RequiredFieldValidator><asp:CheckBox ID="cbxSendNeedSave" runat="server" Text="送出後儲存副本至草稿匣" Checked="True" meta:resourcekey="cbxSendNeedSaveResource1"  CssClass="h" /></td></tr></table></asp:Panel></td>
                                    </tr>
                                  </table></td>
                                  <td width="26"><img src="<%=themePath %>/images/wf_a02.jpg" width="26" height="65"></td>
                                </tr>
                              </table>
                          </td>
                        </tr>
                        <tr>
                          <td>
                              <table width="100%" border="0" cellpadding="0" cellspacing="0">
                                <tr>
                                  <td width="15" height="8" style="background-image: url(<%=themePath %>/images/wf_a03.gif)"><img src="<%=themePath %>/images/wf_a03.gif" width="15" height="8"></td>
                                  <td height="8" style="background-image: url(<%=themePath %>/images/wf_a04.gif)"></td>
                                  <td width="15" height="8" style="background-image: url(<%=themePath %>/images/wf_a05.gif)"><img src="<%=themePath %>/images/wf_a05.gif" width="15" height="8"></td>
                                </tr>
                                <tr>
                                  <td style="background-image: url(<%=themePath %>/images/wf_a03.gif)"><img src="<%=themePath %>/images/wf_a03.gif" width="15" height="8"></td>
                                  <td style="background-image: url(<%=themePath %>/images/wf_a04.gif)">
                                      <table border="0" align="center" cellpadding="0" cellspacing="0" style="margin-left:auto; margin-right:auto; width:95%">
                                          <tr>
                                              <td>
                                                  <asp:Panel ID="Panel4" runat="server" Width="100%" meta:resourcekey="Panel1Resource2">
                                                  </asp:Panel>
                                              </td>
                                          </tr>
                                      </table>
                                  </td>
                                  <td style="background-image: url(<%=themePath %>/images/wf_a05.gif)"><img src="<%=themePath %>/images/wf_a05.gif" width="15" height="8"></td>
                                </tr>
                                <tr>
                                  <td style="background-image:url(<%=themePath %>/images/wf_a06.gif);background-position:0% 0%;height:20px;width:15px"></td>
                                  <td style="background-image:url(<%=themePath %>/images/wf_a07.gif);background-position:0% 0%;height:20px"></td>
                                  <td style="background-image:url(<%=themePath %>/images/wf_a08.gif);background-position:0% 0%;height:20px;width:15px"></td>
                                </tr>
                              </table>
                          </td>
                        </tr>
                    </table>
                    <table width="96%" border="0" align="center" cellpadding="0" cellspacing="0">
                        <tr>
                          <td class="blank8"></td>
                        </tr>
                    </table>
                </center>
                <asp:HiddenField ID="HiddenField1" runat="server" Value="0" />
                <asp:HiddenField ID="hiddenTempScriptId" runat="server" />
                <asp:HiddenField ID="hiddenActionMode" runat="server" Value="Init" />
                <asp:Label ID="lblSaveTxt" runat="server" Text="儲存" Visible="False" meta:resourcekey="lblSaveTxtResource1"></asp:Label>
                <asp:Label ID="lblSendTxt" runat="server" Text="送出" Visible="False" meta:resourcekey="lblSendTxtResource1"></asp:Label>
                <asp:Label ID="lblConfirmWinTitle" runat="server" Text="簽核確認" Visible="False" meta:resourcekey="lblConfirmWinTitleResource1"></asp:Label>
                <asp:Label ID="lblnewWindowMsg" Visible="False" runat="server" Text="無法開啟簽核視窗，請嘗試將快顯封鎖程式關閉" meta:resourcekey="lblnewWindowMsgResource1"></asp:Label>
                <asp:Label ID="lblAdditionalSign" runat="server" Text="加簽" Visible="False" meta:resourcekey="lblAdditionalSignResource2"></asp:Label>
            </td>
        </tr>
    </table>
</asp:Content>