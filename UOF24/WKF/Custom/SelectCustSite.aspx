<%@ Page Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="WKF_Custom_SelectCustSite" Title="定義自訂流程" Culture="auto" UICulture="auto" meta:resourcekey="PageResource1" Codebehind="SelectCustSite.aspx.cs" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register Assembly="System.Web.Extensions" Namespace="System.Web.UI" TagPrefix="asp" %>
<%@ Register Src="../Browse/UC_SubFlowLayOut/UC_SubFlow.ascx" TagName="UC_SubFlow" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
     <script type="text/javascript" id="telerikClientEvents1">
         //<![CDATA[
         function RadToolBar1_ButtonClicking(sender, args) {
             var value = args.get_item().get_value();
             if (value == "SetCustFlow") {
                 args.set_cancel(true);
                 $uof.dialog.open2("~/WKF/Custom/AddCustSite.aspx?flowId=" + "<%=this.ddlCommonCustSite.SelectedValue%>", args.get_item(), args.get_item().get_text(), 1024, 768, openDialogResult);
             }

             else if (value == "AddCustFlow") {
                 args.set_cancel(true);
                 $uof.dialog.open2("~/WKF/Custom/AddCustSite.aspx", args.get_item(), args.get_item().get_text(), 1024, 768, openDialogResult);
             }

             else if (value== "DeleteCustFlow") {
                 if (confirm('<%=lblDelete.Text %>') == false) {
                     args.set_cancel(true);
                 }

             } else if (value== "CopyCustFlow") {
                 var data = ['<%=ddlCommonCustSite.SelectedValue %>'];
                 var flowID = $uof.pageMethod.sync("CopyFlow", data);
                 var hfFlowID = $("#<%=hfFlowID.ClientID %>");
                 hfFlowID.val(flowID);
                 args.set_cancel(true);
                 $uof.dialog.open2("~/WKF/Custom/AddCustSite.aspx", args.get_item(), "", 1024, 768, openDialogResult, { "flowId": flowID });

             }


         }

         function openDialogResult(returnValue) {
             //判斷是否PostBack
             if (typeof (returnValue) == 'undefined')
                 return false;
             else
                 return true;
         }
    </script>
    <script id="validatejs" type="text/javascript">
        function ValidateText(source, argument) {
            o = $('#<%=ddlCommonCustSite.ClientID %>');

        }
</script>
    <head>
        <style>
            .SubFlowTD
            {
                vertical-align: top;
                background-attachment: fixed;
                background-image: url("../../App_Themes/DefaultTheme/images/wkf/line1.gif");
                background-repeat: repeat-y;
            }
            .EmptyTable
            {
                padding: 0px;
                border: 0px;
                margin: 0px;
                text-align: center;
            }
            .SignerTD
            {
                color: blue;
                text-align: left;
            }
            .SiteLeftTD
            {
                background-image: url("<%=themePath %>/images/wkf/site_left.gif");
                background-repeat: repeat-y;
            }
            .SiteMiddleTD
            {
                background-image: url("<%=themePath %>/images/wkf/app_con.gif");
                background-repeat: repeat-y;
            }
            .SiteRightTD
            {
                width: 8px;
                background-image: url("<%=themePath %>/images/wkf/site_right.gif");
                background-repeat: repeat-y;
            }
            .CondTextTD
            {
                text-align: center;
                font-weight: bold;
            }
            .CondLeftTD
            {
                background-image: url("<%=themePath %>/images/wkf/site_left_big.gif");
                background-repeat: repeat-y;
            }
            .CondMiddleTD
            {
                background-image: url("<%=themePath %>/images/wkf/cond_con.gif");
                background-repeat: repeat-y;
                text-align: center;
            }
            .CondRightTD
            {
                background-image: url("<%=themePath %>/images/wkf/site_rig_big.gif");
                background-repeat: repeat-y;
            }
            td_
            {
                text-align: center;
                vertical-align: top;
                font-size: 12px;
                width: 120;
            }
            table_
            {
                text-align: center;
                border: 0px;
            }
        </style>
    </head>
    <div style="text-align: center;">
        <table cellpadding="0" cellspacing="0" width="100%">
            <tr>
                <td>
                    <table class="PopTable" cellspacing="1" border="0" cellpadding="1" width="100%">
                        <tr>
                            <td class="PopTableHeader" colspan="3" align="left">
                                <telerik:RadToolBar ID="RadToolBar1" runat="server" meta:resourcekey="UltraWebToolbar1Resource1" OnClientButtonClicking="RadToolBar1_ButtonClicking" Width="100%" OnButtonClick="RadToolBar1_ButtonClick">
                                    <Items>
                                        <telerik:RadToolBarButton runat="server" DisabledImageUrl="~/Common/Images/Icon/icon_m163.gif"
                                            HoveredImageUrl="~/Common/Images/Icon/icon_m163.gif" ImageUrl="~/Common/Images/Icon/icon_m163.gif"
                                            Value="AddCustFlow" CheckedImageUrl="~/Common/Images/Icon/icon_m163.gif"
                                            Text="新增" meta:resourcekey="TBarButtonResource4">
                                        </telerik:RadToolBarButton>
                                        <telerik:RadToolBarButton runat="server" IsSeparator="True" Text="Button 1" ImageUrl="~/App_Themes/DefaultTheme/images/toolbarSp.jpg">
                                        </telerik:RadToolBarButton>
                                        <telerik:RadToolBarButton runat="server" DisabledImageUrl="~/Common/Images/Icon/icon_m88.gif"
                                            Enabled="False" HoveredImageUrl="~/Common/Images/Icon/icon_m88.gif"
                                            ImageUrl="~/Common/Images/Icon/icon_m88.gif" Value="SetCustFlow"
                                            CheckedImageUrl="~/Common/Images/Icon/icon_m88.gif" Text="設定"
                                            meta:resourcekey="TBarButtonResource5">
                                        </telerik:RadToolBarButton>
                                        <telerik:RadToolBarButton runat="server" IsSeparator="True" Text="Button 3" ImageUrl="~/App_Themes/DefaultTheme/images/toolbarSp.jpg">
                                        </telerik:RadToolBarButton>
                                        <telerik:RadToolBarButton runat="server" DisabledImageUrl="~/Common/Images/Icon/icon_m87.gif"
                                            Enabled="False" HoveredImageUrl="~/Common/Images/Icon/icon_m87.gif"
                                            ImageUrl="~/Common/Images/Icon/icon_m87.gif" Value="CopyCustFlow"
                                            CheckedImageUrl="~/Common/Images/Icon/icon_m87.gif" Text="複製"
                                            meta:resourcekey="TBarButtonResource7">
                                        </telerik:RadToolBarButton>
                                        <telerik:RadToolBarButton runat="server" IsSeparator="True" Text="Button 5" ImageUrl="~/App_Themes/DefaultTheme/images/toolbarSp.jpg">
                                        </telerik:RadToolBarButton>
                                        <telerik:RadToolBarButton runat="server" DisabledImageUrl="~/Common/Images/Icon/icon_m03_g.gif"
                                            Enabled="False" HoveredImageUrl="~/Common/Images/Icon/icon_m03.gif"
                                            ImageUrl="~/Common/Images/Icon/icon_m03.gif" Value="DeleteCustFlow"
                                            CheckedImageUrl="~/Common/Images/Icon/icon_m03.gif" Text="刪除"
                                            meta:resourcekey="TBarButtonResource6">
                                        </telerik:RadToolBarButton>
                                        <telerik:RadToolBarButton runat="server" IsSeparator="True" Text="Button 7" ImageUrl="~/App_Themes/DefaultTheme/images/toolbarSp.jpg">
                                        </telerik:RadToolBarButton>
                                    </Items>

                                </telerik:RadToolBar>
                            </td>
                        </tr>
                        <tr>
                            <td style="text-align:left" class="PopTableRightTD" width="30%">
                                <asp:DropDownList ID="ddlCommonCustSite" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlCommonCustSite_SelectedIndexChanged"
                                    meta:resourcekey="ddlCommonCustSiteResource1" Width="300px">
                                </asp:DropDownList>
                            </td>
                            <td class="PopTableRightTD">
                                <asp:Label ID="Label1" runat="server" Text="關鍵字" meta:resourcekey="Label1Resource1"></asp:Label>
                                <asp:TextBox ID="txtKeyWord" runat="server" meta:resourcekey="txtKeyWordResource1"></asp:TextBox>
                                <telerik:RadButton ID="RadButton1" runat="server" Text="查詢" meta:resourcekey="btnQueryResource1"
                                   OnClick="RadButton1_Click" Icon-PrimaryIconUrl="~/common/images/icon/icon_m39.gif" >
                                </telerik:RadButton>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:CustomValidator ID="CustomValidatorFlowUsing" runat="server" Display="Dynamic" ErrorMessage="此自訂流程正被使用中，不允許刪除!" meta:resourcekey="CustomValidatorFlowUsingResource1"></asp:CustomValidator>
                    <asp:CustomValidator ID="CustomValidatorSelected" runat="server" ErrorMessage="請選擇自訂流程" meta:resourcekey="CustomValidatorSelectedResource1" Display="Dynamic"></asp:CustomValidator>
                     <asp:Label ID="lblDisEditMsg" runat="server" Text="此自訂流程正被使用中，不允許設定與刪除 !" ForeColor="Red" Visible="False" meta:resourcekey="lblDisEditMsgResource1"></asp:Label><br />
                     <asp:CustomValidator ID="CustomValidator1" runat="server" Display="Dynamic" 
                                    ErrorMessage="此自訂流程有目前表單未允許的簽核者，不允許加簽!"></asp:CustomValidator>
                </td>
            </tr>
            <tr>
                <td align="center">
                    <asp:Panel ID="Panel1" runat="server" Height="100%" ScrollBars="Auto" Width="100%"
                        meta:resourcekey="Panel1Resource1">
                        <uc1:UC_SubFlow ID="UC_SubFlow1" runat="server" />
                    </asp:Panel>
                </td>
            </tr>
        </table>
        <asp:HiddenField ID="hfFlowID" runat="server" />
        <asp:HiddenField ID="hfSelectFlowID" runat="server" />
        <asp:Label ID="lblMustHasSiteMsg" runat="server" Text="錯誤!所選流程必須要有站點!" Visible="False"
            meta:resourcekey="lblMustHasSiteMsgResource1"></asp:Label>
        <asp:Label ID="lblDelete" runat="server" Text="確定刪除?" Visible="False" meta:resourcekey="lblDeleteResource1"></asp:Label>
        <asp:Label ID="lblConfirmMsg" runat="server" Text="請選擇自訂流程" Visible="False" meta:resourcekey="lblConfirmMsgResource1"></asp:Label></div>
         <asp:Label ID="lblIsAllAlertSite" runat="server" Text="自訂流程內不可都知會站點" Visible="false" meta:resourcekey="lblIsAllAlertSiteResource1" ></asp:Label>
</asp:Content>
