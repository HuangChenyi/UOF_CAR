<%@ Page Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="WKF_FormUse_ViewFormFromSign" Title="觀看" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" Codebehind="ViewFormFromSign.aspx.cs" %>
<%@ Register Src="../../Common/ChoiceCenter/UC_ChoiceList.ascx" TagName="UC_ChoiceList" TagPrefix="uc1" %>     
<%@ Register Src="../Browse/TaskRecord/UC_TaskSiteRecord.ascx" TagName="UC_TaskSiteRecord" TagPrefix="uc4" %>
<%@ Register src="FormIQY/UC_QueryIqyTask.ascx" tagname="UC_QueryIqyTask" tagprefix="uc5" %>
<%@ Register src="TaskSiteSignInfo/UC_SignComment.ascx" tagname="UC_SignComment" tagprefix="uc6" %>
<%@ Register Src="~/Common/FileCenter/V3/UC_FileCenter.ascx" TagPrefix="uc7" TagName="UC_FileCenter" %>
<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register Src="~/WKF/FormManagement/MultiColumnDesign/UC_VersionFieldCollectionUsing.ascx" TagPrefix="uc2" TagName="UC_VersionFieldCollectionUsing" %>
<%@ Register Src="~/WKF/FormManagement/VersionFieldUserControl/VersionFieldCollectionUsingUC.ascx" TagPrefix="uc2" TagName="VersionFieldCollectionUsingUC" %>
<%@ Register Src="~/WKF/Common/UC_FileOnlinePreview.ascx" TagPrefix="uc9" TagName="UC_FileOnlinePreview" %>

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
            .bigT 
            {
                color:#ffffff;	font-size:25px; font-weight: bolder; 
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
<script>        
    Sys.Application.add_load(function () {
        try {
            //隱藏所有欄位的填寫者Label
            $('.FillerVisible').hide();
            ////因進入此頁面的路徑不同，會影響[顯示填寫者]預設勾選或不勾選，故於此處再判斷一次[顯示填寫者]的勾選狀態，決定顯示/隱藏所有欄位的填寫者
            oncbShowFillerChecked();
            calculate();
       }
       catch (e) {
       }
    });

    $(function() {
        try {
            calculate();
            SetDivZero();
        } catch(e) {
        }
    
        var isForce = $uof.tool.htmlDecode("<%=System.Web.Security.AntiXss.AntiXssEncoder.HtmlEncode(isForce, true) %>");
        var alertStr = $uof.tool.htmlDecode("<%=alertStr %>");
    
        //20140317 為了判斷是否已自行解除鎖定多加了一個hiddenField
        //20140324 暫時隱藏此功能
        //var nowLocking =$("#<%=hfIsForce.ClientID%>").val();
        //if (isForce == "true" && nowLocking !="false") {
        if(isForce =="true"){
            alert(alertStr);
        }
    });

 function OnBarMainClick(sender, args)
 {
     if (args.get_item().get_value() == "PrintForm") {
         var TASK_ID = $uof.tool.htmlDecode("<%=hfTASK_ID.Value%>");
         args.set_cancel(true);
         var w = $uof.tool.printScreenSize('w', 800);
        var h = $uof.tool.printScreenSize('h', 768);
        var url = 'FormPrint.aspx?TASK_ID=' + TASK_ID + '&SHOW_FILLER='+ $('#<%=cbShowFiller.ClientID %>').is(':checked');
        $uof.window.open(url, w, h, true);
     }

    if ( args.get_item().get_value() == "ForOpinion")
    {	    
      var IS_SCRIPT_IQY=0;
      var TASK_ID = $uof.tool.htmlDecode("<%=hfTASK_ID.Value%>");
      var USER_GUID ="<%=hfUSER_GUID.Value%>";
      var USER_DEPT = "<%=hfUSER_DEPT.Value%>";
      var SITE_ID = $uof.tool.htmlDecode("<%=hfSITE_ID.Value%>");
        var NODE_SEQ = "<%=hfNODE_SEQ.Value%>";
        args.set_cancel(true);
        $uof.dialog.open2("~/WKF/FormUse/FormIQY/IssueIQY.aspx", args.get_item(), "", 850, 700, openDialogResult, { "USER_GUID": USER_GUID, "TASK_ID": TASK_ID, "IS_SCRIPT_IQY": IS_SCRIPT_IQY, "USER_DEPT": USER_DEPT, "SITE_ID": SITE_ID, "NODE_SEQ": NODE_SEQ });
      

    }
    else if (args.get_item().get_value() == "ShowFlow")
    {
        args.set_cancel(true);
        $uof.dialog.open2("~/WKF/Browse/ViewMasterFlow.aspx?formVersionId=" + $uof.tool.htmlDecode("<%=System.Web.Security.AntiXss.AntiXssEncoder.HtmlEncode(formVersionId, true)%>") + "&flowId=" + $uof.tool.htmlDecode("<%= System.Web.Security.AntiXss.AntiXssEncoder.HtmlEncode(flowId, true)%>"), args.get_item(), '', 1280, 1080, openDialogResult);
    }
    else if (args.get_item().get_value() == "Simulation") {
        args.set_cancel(true);
        $uof.dialog.open2("~/WKF/Browse/ViewSimulationFlow.aspx", args.get_item(), '', 800, 650, openDialogResult, { "formVersionId": $uof.tool.htmlDecode("<%=System.Web.Security.AntiXss.AntiXssEncoder.HtmlEncode(formVersionId, true)%>"), "flowId": $uof.tool.htmlDecode("<%=System.Web.Security.AntiXss.AntiXssEncoder.HtmlEncode(flowId, true)%>"), "scriptId": $uof.tool.htmlDecode("<%=hfTASK_ID.Value%>"), "IS_TASK": "1", "NODE_SEQ": "<%=hfNODE_SEQ.Value%>", "SITE_ID": $uof.tool.htmlDecode("<%=hfSITE_ID.Value%>") });
    }
    else if (args.get_item().get_value() == "Forum") {
        var TaskID = $uof.tool.htmlDecode("<%=hfTASK_ID.Value%>");
        args.set_cancel(true);
        $uof.dialog.open2("~/WKF/FormForum/DefaultDialog.aspx", args.get_item(), "", 0, 0, function () { return false; }, {"taskid":TaskID});
        
    }

    else if (args.get_item().get_value() == "btnUnlock") {
        if (! confirm('<%=lblConfirmUnlock.Text %>')){
            args.set_cancel(true);
        }
    }
    else if (args.get_item().get_value() == "FormDescription") {
        args.set_cancel(true);
        var w = $uof.tool.computeScreenSize('w', 1024);
        var h = $uof.tool.computeScreenSize('h', 768);
        var url = '../FormManagement/EditFormDescription.aspx?formVersionId=' + $uof.tool.htmlDecode("<%= System.Web.Security.AntiXss.AntiXssEncoder.HtmlEncode(formVersionId, true)%>") + '&type=View&culture=<%=Ede.Uof.EIP.SystemInfo.Current.Culture%>';
                $uof.window.open(url, w, h, true);
            }
    }
    function openDialogResult(returnValue) {
        //判斷是否PostBack
        if (typeof (returnValue) == 'undefined')
            return false;
        else
            return true;
    }

    function oncbShowFillerChecked() {

        if ($('#<%=cbShowFiller.ClientID %>').is(':checked')) {
            $('.FillerVisible').show();
        }
        else {
            $('.FillerVisible').hide();
        }
    }
</script>
    </head>

<table width="100%" cellpadding="0" cellpadding="0" border="0" height="100%">
<tr>
<td  style="background-image: url(<%=themePath %>/images/wf_bg.gif);vertical-align:top">

    <center>
<table width="96%" border="0" align="center" cellpadding="0" cellspacing="0">
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
            <telerik:RadToolBar ID="webToolBar" runat="server" OnClientButtonClicking="OnBarMainClick"
                                            OnButtonClick="webToolBar_ButtonClick" Width="100%">
                <Items>
                    <telerik:RadToolBarButton runat="server"  
                    meta:resourceKey="TBarButtonResource1"
                        CheckedImageUrl="~/Common/Images/Icon/icon_m02.gif"
                        DisabledImageUrl="~/Common/Images/Icon/icon_m02.gif" 
                        HoveredImageUrl="~/Common/Images/Icon/icon_m02.gif"
                        ImageUrl="~/Common/Images/Icon/icon_m02.gif" Text="進行處理" Value="Process" CausesValidation="false">
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton runat="server" IsSeparator="true" Value="sProcess" >
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton runat="server"
                        meta:resourceKey="TBarButtonResource6" CausesValidation="false"
                        CheckedImageUrl="~/Common/Images/Icon/icon_m101.gif"
                        DisabledImageUrl="~/Common/Images/Icon/icon_m101.gif"
                        HoveredImageUrl="~/Common/Images/Icon/icon_m101.gif"
                        ImageUrl="~/Common/Images/Icon/icon_m101.gif" Text="表單流程" Value="ShowFlow">
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton runat="server" IsSeparator="true" Value="sShowFlow" >
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton runat="server"
                        meta:resourceKey="TBarButtonResource11" CausesValidation="false"
                        CheckedImageUrl="~/Common/Images/Icon/icon_m101.gif"
                        DisabledImageUrl="~/Common/Images/Icon/icon_m101.gif"
                        HoveredImageUrl="~/Common/Images/Icon/icon_m101.gif"
                        ImageUrl="~/Common/Images/Icon/icon_m101.gif" Text="模擬流程" Value="Simulation">
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton runat="server" IsSeparator="true" Value="sSimulation">
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton runat="server"  
                    meta:resourceKey="TBarButtonResource2"
                        CheckedImageUrl="~/Common/Images/Icon/icon_m180.gif"
                        DisabledImageUrl="~/Common/Images/Icon/icon_m180.gif" 
                        HoveredImageUrl="~/Common/Images/Icon/icon_m180.gif"
                        ImageUrl="~/Common/Images/Icon/icon_m180.gif" Text="發出徵詢" Value="ForOpinion" >
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton runat="server" IsSeparator="true" Value="sForOpinion" >
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
                    <telerik:RadToolBarButton runat="server"
                        meta:resourceKey="TBarButtonResource15" CausesValidation="false"
                        CheckedImageUrl="~/Common/Images/Icon/print_down.gif"
                        DisabledImageUrl="~/Common/Images/Icon/print_down.gif"
                        HoveredImageUrl="~/Common/Images/Icon/print_down.gif"
                        ImageUrl="~/Common/Images/Icon/print_down.gif" Text="表單列印" Value="PrintForm">
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton runat="server" Value="sPrintForm" IsSeparator="true" ></telerik:RadToolBarButton>
                    <telerik:RadToolBarButton runat="server" value="btnUnlock" Text="表單解除鎖定" Visible="false" ImageUrl="~/Common/Images/Icon/icon_m127.gif" meta:resourcekey="btnUnlockResource1"></telerik:RadToolBarButton>
                    <telerik:RadToolBarButton runat="server" Value="sepUnlock" IsSeparator="true" Visible="false"></telerik:RadToolBarButton>
                    <telerik:RadToolBarButton runat="server"
                        CausesValidation="false"
                        CheckedImageUrl="~/Common/Images/Icon/icon_m12.gif"
                        DisabledImageUrl="~/Common/Images/Icon/icon_m12.gif"
                        HoveredImageUrl="~/Common/Images/Icon/icon_m12.gif"
                        ImageUrl="~/Common/Images/Icon/icon_m12.gif"
                        Text="表單說明" Value="FormDescription" meta:resourcekey="RadToolBarButtonResource11">
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton runat="server" IsSeparator="true" Value="SeparatorbyDescription" meta:resourcekey="RadToolBarButtonResource12">
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton runat="server" Value="Message" > 
                        <ItemTemplate>
                            <asp:Label ID="lblAlertBeLocked" runat="server" Text=""  meta:resourcekey="lblNotCurrentSiteResource1" ForeColor="Red"></asp:Label>
                        </ItemTemplate>
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton runat="server" Value="ShowFiller" >
                        <ItemTemplate>
                            <asp:CheckBox ID="cbShowFiller" onclick="oncbShowFillerChecked()" runat="server" meta:resourcekey="cbShowFillerResource1" />
                            <asp:Label ID="lblShowFiller" runat="server" Text="顯示填寫者" meta:resourcekey="lblShowFillerResource1"></asp:Label>
                        </ItemTemplate>
                    </telerik:RadToolBarButton>        
                </Items>
            </telerik:RadToolBar>
            </td>
        </tr>
    </table>
    
    <table style=" margin-top:4px;width:100%">
        <tr>
            <td style="width: 30%; height: 100%; margin: 0; padding: 0; padding-right: 3px;" valign="top">
                <table class="PopTable" style="height: 160px;" width="100%">
                    <tr style="vertical-align: top;">
                        <td align="center" class="PopTableHeader" height="20px" style="text-align: center;">
                            <center>
                            <asp:Label ID="lblComment" runat="server" Text="申請資訊" meta:resourcekey="lblCommentResource1"></asp:Label>
                            </center>
                        </td>
                    </tr>
                    <tr>
                        <td style="background-color: white; height: 100%; margin: 0; padding: 0" valign="top">
                            <asp:Panel ID="pnlAppInfo" runat="server" Height="140px" ScrollBars="Auto">
                                <table id="Table1" cellpadding="0" cellspacing="0" width="100%" runat="server" style="margin: 0; padding: 0" class="applicantInfo">
                                    <tr>
                                        <td style="text-align: right; width: 35%;">
                                            <asp:Label ID="Label15" runat="server" Text="申請人：" meta:resourcekey="Label15Resource1"></asp:Label>&nbsp;
                                        </td>
                                        <td style="text-align: left">
                                            <asp:Label ID="lblApplicant" runat="server" meta:resourcekey="lblApplicantResource1"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr id="trApplicantDept" runat="server">
                                        <td style="text-align: right; width: 35%;">
                                            <asp:Label ID="Label17" runat="server" Text="部門：" meta:resourcekey="Label17Resource1"></asp:Label>&nbsp;
                                        </td>
                                        <td style="text-align: left">
                                            <asp:Label ID="lblDepartment" runat="server" meta:resourcekey="lblDepartmentResource1"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: right; width: 35%;">
                                            <asp:Label ID="Label3" runat="server" Text="申請時間：" meta:resourcekey="Label3Resource1"></asp:Label>&nbsp;
                                        </td>
                                        <td style="text-align: left">
                                            <asp:Label ID="lblApplyTime" runat="server" meta:resourcekey="lblApplyTimeResource1"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: right; width: 35%;">
                                            <asp:Label ID="Label9" runat="server" Text="緊急程度：" meta:resourcekey="Label9Resource1"></asp:Label>&nbsp;
                                        </td>
                                        <td style="text-align: left">
                                            <asp:Label ID="lblurgentLevel" runat="server" meta:resourcekey="lblurgentLevelResource1"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: right; width: 35%;">
                                            <asp:Label ID="Label1" runat="server" Text="現在鎖單者：" meta:resourcekey="Label1Resource1"></asp:Label>&nbsp;
                                        </td>
                                        <td style="text-align: left">
                                            <asp:Label ID="lblLocker" runat="server" meta:resourcekey="lblLockerResource1"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr id="agentLableDisplayTR" runat="server">
                                        <td style="text-align: right; width: 35%;">
                                            <asp:Label ID="lblAgentApplicant" runat="server" Text="代理填寫者：" meta:resourcekey="lblAgentApplicantResource1"></asp:Label>&nbsp;
                                        </td>
                                        <td style="text-align: left">
                                            <asp:Label ID="lblAgentUser" runat="server" meta:resourcekey="lblAgentUserResource1"></asp:Label>
                                        </td>
                                    </tr>
                                </table>
                            </asp:Panel>
                        </td>
                    </tr>
                </table>
            </td>

            <td id="AttachmentsByForm" runat="server" style="width: 30%; height: 100%; margin: 0; padding: 0; padding-right: 3px;" valign="top">
                <table cellspacing="0" class="PopTable" style="height: 160px; margin: 0; padding: 0;table-layout:fixed;word-wrap:break-word" width="100%">
                    <tr style="vertical-align: top;">
                        <td align="center" class="PopTableHeader" height="20px" style="text-align: center;">
                            <center>
                            <asp:Label ID="lblFileUpload" runat="server" Text="相關附件(表單)" meta:resourcekey="lblFileUploadResource1"></asp:Label>
                            </center>
                        </td>
                    </tr>
                    <tr style="vertical-align:top;">
                        <td style="background-color: white; height: 140px; margin: 0; padding: 0; width: 100%; vertical-align: top; text-align: center">
                            <div align="center" style="height: 135px; overflow: auto; width: 100%; margin: 0; padding: 0">
                                <div id="divFC" runat="server" style="text-align:left">
                                <uc7:UC_FileCenter runat="server" id="UC_FileCenter" ModuleName="WKF" Editable="false" ProxyEnabled="true"/>
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
    </table></td>
  </tr>
</table>









<table width="96%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td class="blank8"></td>
  </tr>
</table>
<table width="96%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td><table width="100%" border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td style="min-width:120px;width:120px"><img src="<%=themePath %>/images/wf_icon01.jpg" width="120px" height="65px"></td>
        <td style="background-image: url(<%=themePath %>/images/wf_a01.jpg);background-repeat:repeat-x;height:65px;background-position: 0% 100%;"><table width="100%" border="0" cellpadding="0" cellspacing="0">
          <tr>
            <td class="bigT" style="height:65px; vertical-align:middle;text-align:left"><asp:Label ID="lblFormName" runat="server" Text="" meta:resourcekey="lblFormNameResource1"></asp:Label></td>
            </tr>
        </table></td>
        <td width="26"><img src="<%=themePath %>/images/wf_a02.jpg" width="26px" height="65px"></td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td><table width="100%" border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td width="15px" height="8px" style="background-image: url(<%=themePath %>/images/wf_a03.gif)"><img src="<%=themePath %>/images/wf_a03.gif" width="15" height="8"></td>
        <td height="8px" style="background-image: url(<%=themePath %>/images/wf_a04.gif)"></td>
        <td width="15px" height="8px" style="background-image: url(<%=themePath %>/images/wf_a05.gif)"><img src="<%=themePath %>/images/wf_a05.gif" width="15" height="8"></td>
      </tr>
      <tr>
        <td style="background-image: url(<%=themePath %>/images/wf_a03.gif)"><img src="<%=themePath %>/images/wf_a03.gif" width="15" height="8"></td>
        <td style="background-image: url(<%=themePath %>/images/wf_a04.gif)">
            
            <table border="0" align="center" cellpadding="0" cellspacing="0" style="margin-left:auto; margin-right:auto;width:95%">
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










<table width="96%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td><table width="100%" border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td style="min-width:120px;width:120px"><img src="<%=themePath %>/images/wf_icon02.jpg" width="120" height="65"></td>
        <td style="background-image: url(<%=themePath %>/images/wf_a01.jpg);background-repeat:repeat-x;height:65px;background-position: 0% 100%;"><table width="100%" border="0" cellpadding="0" cellspacing="0">
          <tr>
            <td class="bigT" style="height:65px;vertical-align:middle;text-align:left">表單流程</td>
            </tr>
        </table></td>
        <td width="26"><img src="<%=themePath %>/images/wf_a02.jpg" width="26" height="65"></td>
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
        <td style="background-image: url(<%=themePath %>/images/wf_a04.gif)"><table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td><asp:Panel ID="Panel3" runat="server"> <uc6:UC_SignComment ID="UC_SignComment1" runat="server" /></asp:Panel></td>
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
                </center>





<asp:Panel ID="Panel2" runat="server" Width="100%" meta:resourcekey="Panel1Resource1"><uc5:UC_QueryIqyTask ID="UC_QueryIqyTask1" runat="server" /></asp:Panel>


    
    <asp:Label ID="lblDialogTitleMsg" runat="server" Text="送出表單" Visible="False" meta:resourcekey="lblDialogTitleMsgResource1"></asp:Label>
    <asp:Label ID="lblNormal" runat="server" Text="普通" Visible="False" meta:resourcekey="lblNormalResource1"></asp:Label>
    <asp:Label ID="lblUrgent" runat="server" Text="急" Visible="False" meta:resourcekey="lblUrgentResource1"></asp:Label>
    <asp:Label ID="lblMostUrgent" runat="server" Text="緊急" Visible="False" meta:resourcekey="lblMostUrgentResource1"></asp:Label>
    <asp:Label ID="lblNotCurrentSite" runat="server" Text="此站點非可處理站點" Visible="False"  meta:resourcekey="lblNotCurrentSiteResource1"></asp:Label>
    <asp:Label ID="lblAlert" runat="server" Text="表單目前有他人正在處理，請稍後再進行簽核！" Visible="False" meta:resourcekey="lblAlertResource1"></asp:Label>
    <asp:Label ID="lblLockerMsg" runat="server" Text="表單目前正由{0}鎖定處理中，請稍後再進行簽核！" Visible="False" meta:resourcekey="lblLockerMsgResource1"></asp:Label>
    <asp:Label ID="lblConfirmUnlock" runat="server" Text="是否解除鎖定表單？" Visible="false" meta:resourcekey="lblConfirmUnlockResource1"></asp:Label>
    <asp:Label ID="lblUnlockSuccessed" runat="server" Text="表單解鎖成功" Visible="false" meta:resourcekey="lblUnlockSuccessedResource1"></asp:Label>
    <asp:Label ID="lblNodata" runat="server" Text="表單已被刪除，無法找到表單相關資訊" Visible="False" meta:resourcekey="lblNodataResource1"></asp:Label>
    <asp:HiddenField ID="hfTASK_ID" runat="server" />
    <asp:HiddenField ID="hfUSER_GUID" runat="server" />
    <asp:HiddenField ID="hfUSER_DEPT" runat="server" />
    <asp:HiddenField ID="hfSITE_ID" runat="server" />
    <asp:HiddenField ID="hfNODE_SEQ" runat="server" />
    <asp:HiddenField ID="hfIQY_ID" runat="server" />
    <asp:HiddenField ID="hfIsForce" runat="server" />
</td>
</tr>
</table>
    
</asp:Content>
