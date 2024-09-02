<%@ Page Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="WKF_lookgrlTest_ViewFormTask" Title="觀看" Culture="auto"
    meta:resourcekey="PageResource1" UICulture="auto" Codebehind="ViewFormFlow.aspx.cs" %>

<%@ Register Src="../Browse/TaskRecord/UC_TaskSiteRecord.ascx" TagName="UC_TaskSiteRecord"
    TagPrefix="uc4" %>
<%@ Register Src="../FormManagement/UC_FormFileCenter.ascx" TagName="UC_FormFileCenter"
    TagPrefix="uc3" %>
<%@ Register Src="../FormManagement/VersionFieldUserControl/VersionFieldCollectionUsingUC.ascx"
    TagName="VersionFieldCollectionUsingUC" TagPrefix="uc1" %>
<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <head>
        <style>
            .SubFlowTD {vertical-align:top; background-attachment: fixed; background-image: url("../../App_Themes/DefaultTheme/images/wkf/line1.gif"); background-repeat: repeat-y;}
            .EmptyTable {padding:0px;border:0px;margin:0px;text-align:center}
            .SignerTD {color:blue;text-align:left}
            .SiteLeftTD {background-image: url("../../App_Themes/DefaultTheme/images/wkf/site_left.gif"); background-repeat: repeat-y;}
            .SiteMiddleTD {background-image: url("../../App_Themes/DefaultTheme/images/wkf/app_con.gif"); background-repeat: repeat-y;}
            .SiteRightTD {width:8px;background-image: url("../../App_Themes/DefaultTheme/images/wkf/site_right.gif"); background-repeat: repeat-y;}
            .CondTextTD {text-align:center;font-weight:bold;}
            .CondLeftTD {background-image: url("../../App_Themes/DefaultTheme/images/wkf/site_left_big.gif"); background-repeat: repeat-y;}
            .CondMiddleTD { background-image: url("../../App_Themes/DefaultTheme/images/wkf/cond_con.gif");background-repeat: repeat-y;text-align:center}
            .CondRightTD {background-image: url("../../App_Themes/DefaultTheme/images/wkf/site_rig_big.gif"); background-repeat: repeat-y;}
            td_{text-align:center;vertical-align:top;font-size:12px;width:120;}
            table_{text-align:center;border:0px}
        
       
</style>
    </head>
    <table width="100%">
        <tr>
            <td style="background-color: White" align="center" valign="top" colspan="2">
                &nbsp;<asp:Panel ID="Panel1" runat="server" Height="520px" ScrollBars="Auto" Width="100%">
                    <table border="0" cellpadding="2" cellspacing="0" width="100%">
                        <tr>
                            <td align="middle" bgcolor="#6699ff" width="23%">
                                <strong><font color="#ffffff" size="2">申請資訊</font></strong></td>
                            <td width="77%">
                            </td>
                        </tr>
                        <tr>
                            <td bgcolor="#6699ff" colspan="2">
                                <table border="0" cellpadding="5" cellspacing="1" width="100%">
                                    <tr>
                                        <td align="left" bgcolor="#ffffff" width="50%">
                                歸檔人員：Eric</td>
                                        <td align="left" bgcolor="#ffffff" colspan="4">
                                現在處理者：王猩猩</td>
                                    </tr>
                                    <tr>
                                        <td align="left" bgcolor="#ffffff" width="50%">
                                            <span style="font-size: 10pt">申請人：系統管理員(副理)</span></td>
                                        <td align="left" bgcolor="#ffffff" colspan="4">
                                            部門：一等一科技</td>
                                    </tr>
                                    <tr>
                                        <td align="left" bgcolor="#ffffff" colspan="5">
                                            知會人員：sean</td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                    <br />
                    <asp:Image ID="Image1" runat="server" ImageUrl="~/Common/Images/Icon/icon_m54.gif" /><br />
                    <br />
                    <table border="0" cellpadding="2" cellspacing="0" width="100%">
                        <tr>
                            <td align="middle" bgcolor="#6699ff" width="23%" style="height: 23px">
                                <strong><font color="#ffffff" size="2">站點資訊：一般</font></strong></td>
                            <td width="77%" style="height: 23px">
                            </td>
                        </tr>
                        <tr>
                            <td bgcolor="#6699ff" colspan="2">
                                <table border="0" cellpadding="5" cellspacing="1" width="100%">
                                    <tr>
                                        <td align="left" bgcolor="#ffffff" width="50%">
                                            <span style="font-size: 10pt">簽核人員：系統管理員</span><span style="font-size: 12pt"></span></td>
                                        <td align="left" bgcolor="#ffffff" colspan="4">
                                            簽核狀態：同意</td>
                                    </tr>
                                    <tr>
                                        <td align="left" bgcolor="#ffffff" colspan="5">
                                            <span style="font-size: 10pt">知會人員：lookgrl</span><span></span></td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                    <br />
                    <asp:Image ID="Image2" runat="server" ImageUrl="~/Common/Images/Icon/icon_m54.gif" /><br />
                    <br />
                    <table border="0" cellpadding="2" cellspacing="0" width="100%">
                        <tr>
                            <td align="middle" bgcolor="#00C000" width="23%" style="height: 23px">
                                <strong><font color="#ffffff" size="2">流程式站點：嘰哩咕嚕</font></strong></td>
                            <td width="77%" style="height: 23px">
                            </td>
                        </tr>
                        <tr>
                            <td bgcolor="#00C000" colspan="2">
                           <TABLE width="100%" cellpadding="0" bordercolorlight="#FFFFFF" bordercolordark="#000000" cellspacing="1">
<TR>
    <td bgcolor="#ffffff" colspan="3" rowspan="3" style="text-align: center" valign="top">
        <br />
        <table style="width: 95%">
            <tr>
                <td style="width: 100%; text-align: center;">
                    <table border="0" cellpadding="2" cellspacing="0" width="100%">
                        <tr>
                            <td align="middle" bgcolor="#6699ff" width="23%" style="height: 23px">
                                <strong><font color="#ffffff" size="2">站點資訊：並簽</font></strong></td>
                            <td width="77%" style="height: 23px">
                            </td>
                        </tr>
                        <tr>
                            <td bgcolor="#6699ff" colspan="2">
                                <table border="0" cellpadding="5" cellspacing="1" width="100%">
                                    <tr>
                                        <td align="left" bgcolor="#ffffff" width="50%">
                                            <span style="font-size: 10pt">簽核人員：王猩猩</span></td>
                                        <td align="left" bgcolor="#ffffff" colspan="4">
                                            簽核狀態：尚未簽核</td>
                                    </tr>
                                    <tr>
                                        <td align="left" bgcolor="#ffffff" width="50%">
                                            <span style="font-size: 10pt">簽核人員：系統管理員</span><span style="font-size: 12pt"></span></td>
                                        <td align="left" bgcolor="#ffffff" colspan="4">
                                            簽核狀態：不同意</td>
                                    </tr>
                                    <tr>
                                        <td align="left" bgcolor="#ffffff" colspan="5">
                                            <span style="font-size: 10pt">知會人員：lookgrl</span><span></span></td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
        <br />
    </td>
</TR>
<TR>
</TR>
<TR>
</TR>
</TABLE>
 
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
                &nbsp;</td>
        </tr>
    </table>
    <asp:Label ID="lblDialogTitleMsg" runat="server" Text="送出表單" Visible="False" meta:resourcekey="lblDialogTitleMsgResource1"></asp:Label><asp:Label
        ID="lblNormal" runat="server" Text="普通" Visible="False" meta:resourcekey="lblNormalResource1"></asp:Label><asp:Label
            ID="lblUrgent" runat="server" Text="急" Visible="False" meta:resourcekey="lblUrgentResource1"></asp:Label><asp:Label
                ID="lblMostUrgent" runat="server" Text="緊急" Visible="False" meta:resourcekey="lblMostUrgentResource1"></asp:Label>
</asp:Content>
