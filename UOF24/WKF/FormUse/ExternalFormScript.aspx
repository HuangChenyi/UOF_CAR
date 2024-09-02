<%@ Page Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="WKF_FormUse_ExternalFormScript" Title="" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" Codebehind="ExternalFormScript.aspx.cs" %>
<%@ Register Src="~/WKF/FormManagement/VersionFieldUserControl/VersionFieldCollectionUsingUC.ascx" TagName="VersionFieldCollectionUsingUC" TagPrefix="uc5" %>
<%@ Register Src="~/WKF/FormManagement/VersionFieldUserControl/VersionFieldCollectionUC.ascx" TagName="VersionFieldCollectionUC" TagPrefix="uc3" %>
<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register Src="~/Common/FileCenter/V3/UC_FileCenter.ascx" TagPrefix="uc3" TagName="UC_FileCenter" %>
<%@ Register Src="~/WKF/Common/UC_FileOnlinePreview.ascx" TagPrefix="uc9" TagName="UC_FileOnlinePreview" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <head>

<script id="ExternalFormScriptjs" type="text/javascript">

    function saveScrollPosition() {
        $('#<%=this.HiddenField1.ClientID%>').val($('#<%=this.Panel1.ClientID%>').scrollTop());
        }

        $(function () {
            $('#<%=this.Panel1.ClientID%>').scrollTop($('#<%=this.HiddenField1.ClientID%>').val());
            });

    function OnBarMainClick(sender, args) {
        if (args.get_item().get_value() == "ShowFlow") {
            args.set_cancel(true);
            $uof.dialog.open2("~/WKF/Browse/ViewMasterFlow.aspx", args.get_item(), $uof.tool.htmlDecode('<%=System.Web.Security.AntiXss.AntiXssEncoder.HtmlEncode(dialogTitleName, true)%>'), 800, 650, openDialogResult,
                {
                    "formVersionId": $uof.tool.htmlDecode('<%=System.Web.Security.AntiXss.AntiXssEncoder.HtmlEncode(formVersionId, true)%>'),
                    "flowId": $uof.tool.htmlDecode('<%=System.Web.Security.AntiXss.AntiXssEncoder.HtmlEncode(flowId, true)%>')
                });
        }
        function openDialogResult(returnValue) {
            if (typeof (returnValue) == "undefined") {
                return false;
            }
            return true;
        }
    }
</script>

        <style type="text/css">
            .formTitle
            {
                background-image: url(../../App_Themes/DefaultTheme/images/po_06.gif);
                text-align: center;
                height: 20px;
            }

            .formInfo
            {
                background-color: White;
                vertical-align: top;
            }
        </style>
    </head>
    <table width="100%">
        <tr>
            <td>

            <telerik:RadToolBar ID="webToolBar" runat="server" OnClientButtonClicking="OnBarMainClick"
                                            OnButtonClick="webToolBar_ButtonClick" Width="100%">
                                            <Items>
                                                 <telerik:RadToolBarButton runat="server"  
                    meta:resourceKey="TBarButtonResource3"
                        CheckedImageUrl="~/Common/Images/Icon/icon_m101.gif"
                        DisabledImageUrl="~/Common/Images/Icon/icon_m101.gif" 
                        HoveredImageUrl="~/Common/Images/Icon/icon_m101.gif"
                        ImageUrl="~/Common/Images/Icon/icon_m101.gif" Text="觀看表單流程" Value="ShowFlow" >
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton runat="server" IsSeparator="true" Value="sShowFlow" >
                    </telerik:RadToolBarButton>
                    </Items>
                    </telerik:RadToolBar>
            </td>
        </tr>
    </table>
    <table width="100%" border="0" cellpadding="0" cellspacing="0">
        <tbody>
            <tr>
                <td style="background-color: white;width:33%; height:170px" valign="top"  >
                    <table class="PopTable" cellspacing="0" width="100%"  style=" height:170px;margin:0">
                        <tbody>
                            <tr>
                                <td class="PopTableHeader""
                                    align="center" height="20px">
                                    <center>
                                    <asp:Label ID="Label4" runat="server" Text="申請資訊" meta:resourcekey="Label4Resource1"></asp:Label></center>
                                    </td>
                            </tr>
                            <tr>
                                <td style="background-color: white;height:150px" valign="top">
                                    <table  cellpadding="0" cellspacing="0"  style="height:150px; width:100%">
                                        <tr>
                                            <td style="width: 26%; height: 21px; text-align:right;" align="right">
                                                <asp:Label ID="Label1" runat="server" Text="申請者：" meta:resourcekey="Label1Resource1"></asp:Label></td>
                                            <td style="height: 21px; text-align:left;" >&nbsp;
                                                <asp:Label ID="lblApplicant" runat="server" meta:resourcekey="lblApplicantResource1"></asp:Label></td>
                                            <td style="height: 21px"></td>
                                            <td style="height: 21px"></td>
                                        </tr>
                                        <tr>
                                            <td align="right" style="width: 26%; height: 21px; text-align:right;">
                                                <asp:Label ID="lbeFormStatusTitle" runat="server" Text="表單狀態：" meta:resourcekey="lbeFormStatusTitleResource1"></asp:Label></td>
                                            <td style="height: 21px;text-align:left;">
                                                <asp:RadioButtonList ID="rblFormType" runat="server" RepeatDirection="Horizontal"
                                                    meta:resourcekey="rblFormTypeResource1">
                                                    <asp:ListItem Value="0" meta:resourcekey="ListItemResource1" Text="緊急"></asp:ListItem>
                                                    <asp:ListItem Value="1" meta:resourcekey="ListItemResource2" Text="急"></asp:ListItem>
                                                    <asp:ListItem Selected="True" Value="2" meta:resourcekey="ListItemResource3" Text="普通"></asp:ListItem>
                                                </asp:RadioButtonList></td>
                                            <td style="height: 21px"></td>
                                            <td style="height: 21px"></td>
                                        </tr>
                                        <tr>
                                            <td align="right" style="width: 26%; height: 43px; text-align:right;">
                                                <asp:Label ID="Label2" runat="server" Text="申請部門：" meta:resourcekey="Label2Resource1"></asp:Label></td>
                                            <td style="height: 43px;text-align:left;">&nbsp;
                                                <asp:DropDownList ID="ddlUserDept" runat="server" OnSelectedIndexChanged="ddlUserDept_SelectedIndexChanged"
                                                    meta:resourcekey="ddlUserDeptResource1">
                                                </asp:DropDownList>
                                              <asp:Label ID="lblMsgNoSettingJobTitle" runat="server" Text="無設定申請者職級" Visible="False"
                                                    ForeColor="Red" meta:resourcekey="lblMsgNoSettingJobTitleResource1"></asp:Label> 
                                                </td>
                                            <td style="height: 43px"></td>
                                            <td style="height: 43px"></td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </td>
                <td style="width: 33%" valign="top" height="170px">
                    <table class="PopTable" style=" height:170px;width:100%;padding-left:3px; padding-right:3px;margin:0" cellspacing="0" >
                        <tbody>
                            <tr>
                                <td class="PopTableHeader" style="height:20px"
                                    align="center">
                                    <center>
                                    <asp:Label ID="Label6" runat="server" Text="意見" meta:resourcekey="Label6Resource1"></asp:Label>
                                    </center>
                                    </td>
                            </tr>
                            <tr>
                                <td style="background-color: white; margin:0" valign="top" height="150px">
                                    <asp:TextBox ID="tbxComment" runat="server" TextMode="MultiLine" Width="100%" Height="99%"
                                        meta:resourcekey="tbxCommentResource1"></asp:TextBox></td>
                            </tr>
                        </tbody>
                    </table>
                </td>
                <td style="width: 34%" valign="top" height="170px">
                    <table class="PopTable" style="height:170px;margin:0" cellspacing="0" width="100%">
                        <tbody>
                            <tr>
                                <td class="PopTableHeader""
                                    align="center" height="20px">
                                    <center>
                                    <asp:Label ID="Label5" runat="server" Text="相關附件(表單)" meta:resourcekey="Label5Resource1"></asp:Label>
                                    </center>
                                    </td>
                            </tr>
                            <tr>
                                <td style="background-color: white; height:150px" valign="top">
                                    <div style=" width:100%; height:99%; overflow:auto;">
                                        <div id="divFC" runat="server" style="text-align:left">
                                            <uc3:UC_FileCenter runat="server" id="UC_FileCenter" ModuleName="WKF" Editable="false" ProxyEnabled="true"/>
                                        </div>
                                        <div id="divFOP" runat="server" style="text-align:left;">
                                            <uc9:UC_FileOnlinePreview runat="server" ID="UC_FileOnlinePreview" />
                                        </div>
                                    </div>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </td>
            </tr>
        </tbody>
    </table>
    <asp:Panel ID="Panel1" runat="server" Height="500px" ScrollBars="Auto" Width="100%"
        meta:resourcekey="Panel1Resource1">
        <table width="100%" border="0" cellpadding="0" cellspacing="0">
            <tr>
                <td width="18" style="height: 25px"></td>
                <td style="height: 25px">&nbsp;<asp:Label ID="Label3" runat="server" ForeColor="Red" Text="＊" meta:resourcekey="Label3Resource1"></asp:Label><font
                    color="red">&nbsp;</font><asp:Label ID="lblScriptName" runat="server" Text="草稿名稱"
                        meta:resourcekey="lblScriptNameResource1"></asp:Label>：<asp:TextBox ID="tbxScriptName"
                            runat="server" meta:resourcekey="tbxScriptNameResource1" Width="200px" Visible="False"></asp:TextBox><asp:RequiredFieldValidator
                                ID="RequiredFieldValidatorScriptName" runat="server" ControlToValidate="tbxScriptName"
                                Display="Dynamic" ErrorMessage="請輸入草稿名稱" meta:resourcekey="RequiredFieldValidatorScriptNameResource1"></asp:RequiredFieldValidator>
                    <asp:CheckBox ID="cbxSendNeedSave" runat="server" Text="送出後儲存副本至草稿匣"
                        meta:resourcekey="cbxSendNeedSaveResource1" Visible="False" /></td>
                <td width="18" style="height: 25px"></td>
            </tr>
            <tr>
                <td style="height: 18px">&nbsp;</td>
                <td valign="top" style="height: 18px">
                    <uc5:VersionFieldCollectionUsingUC ID="VersionFieldCollectionUsingUC1" runat="server" />
                </td>
            </tr>
        </table>
    </asp:Panel>
    <asp:HiddenField ID="HiddenField1" runat="server" Value="0" />
    <asp:HiddenField ID="hiddenTempScriptId" runat="server" />
    <asp:Label ID="lblSaveTxt" runat="server" Text="儲存" Visible="False" meta:resourcekey="lblSaveTxtResource1"></asp:Label>
    <asp:Label ID="lblSendTxt" runat="server" Text="送出" Visible="False" meta:resourcekey="lblSendTxtResource1"></asp:Label>
</asp:Content>

