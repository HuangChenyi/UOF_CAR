<%@ Page Title="" Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="WKF_FormUse_ViewFormScript" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" Codebehind="ViewFormScript.aspx.cs" %>
<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register src="../../Common/ChoiceCenter/UC_ChoiceList.ascx" tagname="UC_ChoiceList" tagprefix="uc6" %>
<%@ Register src="FormIQY/UC_QueryIqyTask.ascx" tagname="UC_QueryIqyTask" tagprefix="uc7" %>
<%@ Register src="FormIQY/UC_QueryIqySingle.ascx" tagname="UC_QueryIqySingle" tagprefix="uc8" %>
<%@ Register Src="~/Common/FileCenter/V3/UC_FileCenter.ascx" TagPrefix="uc1" TagName="UC_FileCenter" %>
<%@ Register Src="~/WKF/FormManagement/MultiColumnDesign/UC_VersionFieldCollectionUsing.ascx" TagPrefix="uc2" TagName="UC_VersionFieldCollectionUsing" %>
<%@ Register Src="~/WKF/FormManagement/VersionFieldUserControl/VersionFieldCollectionUsingUC.ascx" TagPrefix="uc2" TagName="VersionFieldCollectionUsingUC" %>



<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <head>
    <script id="ViewFormScriptjs" type="text/javascript">
        $(function() {
            //表單計算欄位
            try {
                calculate();
                SetDivZero();
            } catch(e) {
            }

            try {
                //setScrollPosition();
            } catch(e) {
                alert("<%=lblnewWindowMsg.Text%>");
            }
        });


         function OnBarMainClick(sender, args)
        {
            if (args.get_item().get_value()== "ReplyIQY")
            {
                var para = {
                    "IS_SCRIPT_IQY": $uof.tool.htmlDecode("<%=System.Web.Security.AntiXss.AntiXssEncoder.HtmlEncode(IS_SCRIPT_IQY, true)%>"),
                    "TASK_ID": $uof.tool.htmlDecode("<%=System.Web.Security.AntiXss.AntiXssEncoder.HtmlEncode(scriptId, true)%>"),
                    "USER_GUID": $uof.tool.htmlDecode("<%=System.Web.Security.AntiXss.AntiXssEncoder.HtmlEncode(USER_GUID, true)%>"),
                    "IQY_ID": $uof.tool.htmlDecode("<%=System.Web.Security.AntiXss.AntiXssEncoder.HtmlEncode(iqyId, true)%>"),
                    "USER_DEPT": $uof.tool.htmlDecode("<%=System.Web.Security.AntiXss.AntiXssEncoder.HtmlEncode(USER_DEPT, true)%>"),
                    "SITE_ID": $uof.tool.htmlDecode("<%=System.Web.Security.AntiXss.AntiXssEncoder.HtmlEncode(SITE_ID, true)%>")
                };
                args.set_cancel(true);
                $uof.dialog.open2('~/WKF/FormUse/FormIQY/ReplyIQY.aspx',args.get_item(),'',850,700,openDialogResult,para);
            }
            else if (args.get_item().get_value() == "Forum") {
                args.set_cancel(true);
                $uof.dialog.open2("~/WKF/FormForum/DefaultDialog.aspx", args.get_item(), '', 0, 0, function () { return false; }, { "taskid": $uof.tool.htmlDecode("<%=System.Web.Security.AntiXss.AntiXssEncoder.HtmlEncode(TASK_ID, true)%>")});
            }
         }

        function openDialogResult(returnValue) {
            if (typeof (returnValue) == "undefined") {
                return false;
            }
            return true;
        }
    </script>

    <style type="text/css"> 
        .formTitle {background-image: url(../../App_Themes/DefaultTheme/images/po_06.gif);text-align:center;height:20px}
        .formInfo {background-color:White;vertical-align:top}
        .bigT 
            {
                color:#ffffff;	font-size:25px; font-weight: bolder; 
            }
    </style>
    
    </head>

<table style="width:100%;height:100%" cellpadding="0" cellpadding="0" border="0">
<tr>
<td  style="background-image: url(<%=themePath %>/images/wf_bg.gif)" valign="top">
    
    
    
    <table style="width:96% ;margin-left:2%;text-align:center" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td><table width="100%" border="0" cellpadding="0" cellspacing="0">
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

                <telerik:RadToolBar ID="webToolBar" runat="server" OnClientButtonClicking="OnBarMainClick" CausesValidation="false"
                                            OnButtonClick="webToolBar_ButtonClick" Width="100%">
                                            <Items>
                                                 <telerik:RadToolBarButton runat="server"  
                    meta:resourceKey="TBarButtonResource1" 
                        CheckedImageUrl="~/Common/Images/Icon/icon_m181.gif"
                        DisabledImageUrl="~/Common/Images/Icon/icon_m181.gif" 
                        HoveredImageUrl="~/Common/Images/Icon/icon_m181.gif"
                        ImageUrl="~/Common/Images/Icon/icon_m181.gif" Text="回覆徵詢" Value="ReplyIQY" >
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton runat="server" IsSeparator="true" Value="sReplyIQY" >
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton runat="server" 
                        meta:resourcekey="FormForumResource"
                        CheckedImageUrl="~/Common/Images/Icon/icon_m12.gif"
                        DisabledImageUrl="~/Common/Images/Icon/icon_m12.gif" 
                        HoveredImageUrl="~/Common/Images/Icon/icon_m12.gif"
                        ImageUrl="~/Common/Images/Icon/icon_m12.gif"
                        Text="表單討論" Value="Forum">
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton runat="server" IsSeparator="true" Value="Separator3">
                    </telerik:RadToolBarButton>
                    </Items>
                    </telerik:RadToolBar>
            </td>
        </tr>
    </table>
    
    <table width="100%" style="height:130px; margin:0; padding:0" >
        <tbody>
            <tr>
                <td style="background-color: white;height: 130px; padding:0; margin:0" valign="top" width="33%" >
                    <table class="PopTable" cellspacing="0" width="100%" style="height: 130px; border:0; margin:0; padding:0;">
                        <tbody>
                            <tr style="vertical-align:top;">
                                <td class="PopTableHeader" align="center" style="height: 20px;text-align:center;" >
                                    <center>
                                    <asp:Label ID="Label4" runat="server" Text="申請資訊" meta:resourcekey="Label4Resource1" Height="20px"></asp:Label>
                                    </center>
                                </td>
                            </tr>
                            <tr>
                                <td style="background-color: white; margin:0; padding:0; height:110px" valign="top" >
                                    <table width="100%" cellpadding="0" cellspacing="0" border="0" style="height:110px; margin:0; padding:0">
                                        <tr>
                                            <td style="width: 26%; text-align: right" align="right" nowrap="nowrap">
                                                <asp:Label ID="Label1" runat="server" Text="申請者：" meta:resourcekey="Label1Resource1"></asp:Label>&nbsp;
                                            </td>
                                            <td style="text-align: left">
                                                <asp:Label ID="lblApplicant" runat="server" meta:resourcekey="lblApplicantResource1"></asp:Label>
                                            </td>
                                            <td ></td>
                                            <td ></td>
                                        </tr>
                                        <tr>
                                            <td align="right" style="width: 26%; text-align: right" nowrap="nowrap"><asp:Label ID="lbeFormStatusTitle" runat="server" Text="表單狀態：" meta:resourcekey="lbeFormStatusTitleResource1"></asp:Label>&nbsp;</td>
                                            <td style="text-align: left"><asp:Label ID="lbl_rblFormType" runat="server" 
                                                    meta:resourcekey="lbl_rblFormTypeResource1"></asp:Label></td>
                                            <td ></td>
                                            <td ></td>
                                        </tr>
                                        <tr>
                                            <td align="right" style="width: 26%; text-align: right" nowrap="nowrap"><asp:Label ID="Label2" runat="server" Text="申請部門：" meta:resourcekey="Label2Resource1"></asp:Label>&nbsp;</td>
                                            <td style="text-align: left"><asp:Label ID="lbl_ddlUserDept" runat="server" 
                                                    meta:resourcekey="lbl_ddlUserDeptResource1"></asp:Label></td>
                                            <td ></td>
                                            <td ></td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </td>
                <td style="width: 34%;height: 130px; padding-left:3px; padding-right:3px;" valign="top">
                    <table class="PopTable" style="height: 100%;"  cellspacing="0" width="100%">
                        <tbody>
                            <tr style="vertical-align:top;">
                                <td class="PopTableHeader" style="height: 20px;text-align:center;" >
                                    <center>
                                    <asp:Label ID="Label6" runat="server" Text="意見" meta:resourcekey="Label6Resource1" Height="20px"></asp:Label>
                                    </center>
                                </td>
                            </tr>
                            <tr style="margin:0; padding:0">
                                <td style="background-color: white;height: 110px;width:99%;margin:0; padding:0" valign="top"  >
                             
                                    <asp:TextBox ID="tbxComment" runat="server" TextMode="MultiLine" Width="98%" 
                                        Height="100px" meta:resourcekey="tbxCommentResource1" Enabled="False"></asp:TextBox>
                                        
                                        </td>
                            </tr>
                        </tbody>
                    </table>
                </td>
                <td id="AttachmentsByForm" runat="server" style="width: 33%;height: 130px; " valign="top">
                    <table class="PopTable" style="height: 130px;"  cellspacing="0" width="99%">
                        <tbody>
                            <tr style="vertical-align:top;">
                                <td class="PopTableHeader"  style="height: 20px;text-align:center;" >
                                    <center>
                                    <asp:Label ID="Label5" runat="server" Text="相關附件(表單)" meta:resourcekey="Label5Resource1" Height="20px"></asp:Label>
                                    </center>
                                </td>
                            </tr>
                            <tr>
                                <td style="background-color: white;height: 110px;margin:0; padding:0" valign="top" >
                                <div  style="width:100%; height:99%; overflow:auto;">
                                    <uc1:UC_FileCenter runat="server" ID="UC_FileCenter" ProxyEnabled="true"/>
                                    </div>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </td>
            </tr>
        </tbody>
    </table>
    
    
    
    
    
        </td>
        <td style="background-image: url(<%=themePath %>/images/wf_a05.gif)"></td>
      </tr>
      <tr>
        <td style="background-image:url(<%=themePath %>/images/wf_a06.gif);background-position:0% 0%;height:20px;width:15px"></td>
        <td style="background-image:url(<%=themePath %>/images/wf_a07.gif);background-position:0% 0%;height:20px"></td>
        <td style="background-image:url(<%=themePath %>/images/wf_a08.gif);background-position:0% 0%;height:20px;width:15px"></td>
      </tr>
    </table></td>
  </tr>
</table>







<table width="96%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td class="blank8"></td>
  </tr>
</table>
<table style="width:96%;margin-left:2%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td><table width="100%" border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td style="min-width:120px;width:120px"><img src="<%=themePath %>/images/wf_icon01.jpg" width="120px" height="65px"></td>
        <td style="background-image: url(<%=themePath %>/images/wf_a01.jpg);background-repeat:repeat-x;height:65px;background-position: 0% 100%;"><table width="100%" border="0" cellpadding="0" cellspacing="0">
          <tr>
            <td class="bigT" style=" vertical-align:middle; height:50px;text-align:left"><asp:Label ID="lblFormName" runat="server" Text="" meta:resourcekey="lblFormNameResource1" ></asp:Label></td>
            </tr>
        </table></td>
        <td width="26px"><img src="<%=themePath %>/images/wf_a02.jpg" width="26px" height="65px"></td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td><table width="100%" border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td width="15" height="8" style="background-image: url(<%=themePath %>/images/wf_a03.gif)"><img src="<%=themePath %>/images/wf_a03.gif" width="15" height="8"></td>
        <td height="8" style="background-image: url(<%=themePath %>/images/wf_a04.gif)"></td>
        <td width="15" height="8" style="background-image: url(<%=themePath %>/images/wf_a05.gif)"><img src="<%=themePath %>/images/wf_a05.gif" width="15" height="8"></td>
      </tr>
      <tr>
        <td style="background-image: url(<%=themePath %>/images/wf_a03.gif)"><img src="<%=themePath %>/images/wf_a03.gif" width="15" height="8"></td>
        <td style="background-image: url(<%=themePath %>/images/wf_a04.gif)"><table border="0" align="center" cellpadding="0" cellspacing="0" style="margin-left:auto; margin-right:auto;width:95%">
                                            <tr>
                                                <td>
                                                    <asp:Panel ID="Panel1" runat="server" Width="100%" meta:resourcekey="Panel1Resource1">
                                                        
                                                    </asp:Panel>
                                                </td>
                                            </tr>
                                        </table></td>
        <td style="background-image: url(<%=themePath %>/images/wf_a05.gif)"><img src="<%=themePath %>/images/wf_a05.gif" width="15" height="8"></td>
      </tr>
      <tr>
        <td style="background-image:url(<%=themePath %>/images/wf_a06.gif);background-position:0% 0%;height:20px;width:15px"></td>
        <td style="background-image:url(<%=themePath %>/images/wf_a07.gif);background-position:0% 0%;height:20px"></td>
        <td style="background-image:url(<%=themePath %>/images/wf_a08.gif);background-position:0% 0%;height:20px;width:15px"></td>
      </tr>
    </table></td>
  </tr>
</table>
<table width="96%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td class="blank8"></td>
  </tr>
</table>





    <asp:Panel ID="Panel2" runat="server" Width="100%" 
        meta:resourcekey="Panel2Resource1">
        <uc8:UC_QueryIqySingle ID="UC_QueryIqySingle1" runat="server" />
    </asp:Panel>
    <asp:HiddenField ID="HiddenField1" runat="server" Value="0" />
    <asp:HiddenField ID="hiddenTempScriptId" runat="server" />
    <asp:HiddenField ID="HiIsModify" runat="server" Value="False" />
    <asp:HiddenField ID="hiddenScriptId" runat="server" />
    <asp:HiddenField ID="hiddenUserGUID" runat="server" />
    <asp:Label ID="lblSaveTxt" runat="server" Text="儲存" Visible="False" meta:resourcekey="lblSaveTxtResource1"></asp:Label>
    <asp:Label ID="lblSendTxt" runat="server" Text="送出" Visible="False" meta:resourcekey="lblSendTxtResource1"></asp:Label>
    <asp:Label ID="lblNoJobTitleMsg" Visible="False" runat="server" Text="您還沒有設定職級! \n\n如有問題請洽詢管理員。" meta:resourcekey="lblNoJobTitleMsgResource1"></asp:Label>
    <asp:Label ID="lblConfirmWinTitle" Visible="False" runat="server" Text="簽核確認" 
        meta:resourcekey="lblConfirmWinTitleResource1" ></asp:Label>
    <asp:Label ID="lblnewWindowMsg" Visible="False" runat="server" 
        Text="無法開啟簽核視窗，請嘗試將快顯封鎖程式關閉" meta:resourcekey="lblnewWindowMsgResource1"></asp:Label>
    <asp:Label ID="lblIqyDeleteMsg" runat="server" Text="此徵詢已被徵詢者刪除或送出!!" Visible="False" meta:resourcekey="lblIqyDeleteMsgResource1"></asp:Label>
    <asp:Label ID="lblNotScript" runat="server" Text="此筆徵詢已被刪除或是已簽核中" Visible="False" meta:resourcekey="lblNotScriptResource1"></asp:Label>
    <asp:Label ID="lblLabel1" runat="server" Text="普通" Visible="False" 
        meta:resourcekey="lblLabel1Resource1"></asp:Label>
    <asp:Label ID="lblLabel2" runat="server" Text="急" Visible="False" 
        meta:resourcekey="lblLabel2Resource1"></asp:Label>
    <asp:Label ID="lblLabel3" runat="server" Text="緊急" Visible="False" 
        meta:resourcekey="lblLabel3Resource1"></asp:Label>
        
        
</td>
</tr>
</table>        
</asp:Content>

