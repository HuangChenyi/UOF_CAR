<%@ Page Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="WKF_FormUse_ViewAlertForm" Title="檢視知會表單" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" Codebehind="ViewAlertForm.aspx.cs" %>

<%@ Register Src="../Browse/TaskRecord/UC_TaskSiteRecord.ascx" TagName="UC_TaskSiteRecord"
    TagPrefix="uc4" %>
<%@ Register Src="../FormManagement/UC_FormFileCenter.ascx" TagName="UC_FormFileCenter"
    TagPrefix="uc3" %>
<%@ Register Src="../FormManagement/VersionFieldUserControl/VersionFieldCollectionUsingUC.ascx"
    TagName="VersionFieldCollectionUsingUC" TagPrefix="uc1" %>
<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>

 <asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

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
        
       
</style></head>


  <table width="100%">
        <tr>
            <td style="width: 50%" valign="top">
                <table width="100%" class="PopTable" cellspacing="1">
                    <tr>
                        <td class="PopTableHeader" align="center" height= "20">
                            <asp:Label ID="lblComment" runat="server" Text="申請資訊" meta:resourcekey="lblCommentResource1"></asp:Label></td>
                    </tr>
                    <tr>
                        <td style="background-color: White; height: 79px;">
                            <table width="100%" cellpadding="0" cellspacing="0" height="58">
                                <tr>
                                    <td>
                                        <asp:Label ID="Label9" runat="server" Text="緊急程度：" meta:resourcekey="Label9Resource1"></asp:Label>
                                        <asp:Label ID="lblurgentLevel" runat="server" meta:resourcekey="lblurgentLevelResource1"></asp:Label></td>
                                    <td>
                                        <asp:Label ID="Label15" runat="server" Text="申請人：" meta:resourcekey="Label15Resource1"></asp:Label>
                                        <asp:Label ID="lblApplicant" runat="server" meta:resourcekey="lblApplicantResource1"></asp:Label></td>
                                </tr>
                                <tr>
                                    <td nowrap valign="top" style="height: 29px">
                                        <asp:Label ID="Label17" runat="server" Text="部門：" meta:resourcekey="Label17Resource1"></asp:Label>
                                        <asp:Label ID="lblDepartment" runat="server" meta:resourcekey="lblDepartmentResource1"></asp:Label></td>
                                    <td>
                                        <asp:Label ID="Label1" runat="server" Text="現在鎖單者：" meta:resourcekey="Label1Resource1"></asp:Label>
                                        <asp:Label ID="lblLocker" runat="server" meta:resourcekey="lblLockerResource1"></asp:Label></td>
                                </tr>
                                <tr>
                                    <td nowrap valign="top" style="height: 29px" colspan = 2>
                                        <asp:Label ID="lblApplyTimeTitle" runat="server" Text="申請時間：" meta:resourcekey="lblApplyTimeTitleResource1"></asp:Label>
                                        <asp:Label ID="lblApplyTime" runat="server"></asp:Label></td>
                                    
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </td>
            <td style="width: 50%" valign="top">
                <table width="100%" class="PopTable" cellspacing="1" height="100%">
                     <tr>
                        <td class="PopTableHeader" align="center" height="20">
                            <asp:Label ID="lblFileUpload" runat="server" Text="相關附件(表單)" meta:resourcekey="lblFileUploadResource1"></asp:Label></td>
                    </tr>
                    <tr>
                        <td style="background-color: White; height: 79px;" valign="top">
                            <uc3:UC_FormFileCenter ID="UC_FormFileCenter1" runat="server" />
                        </td>
                    </tr>
                </table>
            </td>
            
        </tr>
    </table>
    <table width="100%">
        <tr>
            <td style="width: 200px ;background-color:transparent" align="center" valign="top" nowrap>
                <uc4:UC_TaskSiteRecord ID="UC_TaskSiteRecord1" runat="server"></uc4:UC_TaskSiteRecord>
            </td>
            <td valign="top">
                <uc1:VersionFieldCollectionUsingUC ID="VersionFieldCollectionUsingUC1" runat="server" />
            </td>
        </tr>
    </table>
    <asp:Label ID="lblDialogTitleMsg" runat="server" Text="送出表單" Visible="False" meta:resourcekey="lblDialogTitleMsgResource1"></asp:Label><asp:Label
        ID="lblNormal" runat="server" Text="普通" Visible="False" meta:resourcekey="lblNormalResource1"></asp:Label><asp:Label ID="lblUrgent"
            runat="server" Text="急" Visible="False" meta:resourcekey="lblUrgentResource1"></asp:Label><asp:Label ID="lblMostUrgent"
                runat="server" Text="緊急" Visible="False" meta:resourcekey="lblMostUrgentResource1"></asp:Label>
</asp:Content>
