<%@ Page Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="WKF_Protyping_SiteSignInfo" Title="" Codebehind="SiteSignInfo.aspx.cs" %>

<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <p align=center>
        &nbsp;<p align="center">
        
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
                                    <span style="font-size: 10pt">申請人：系統管理員(副理)</span></td>
                                <td align="left" bgcolor="#ffffff" colspan="4" style="font-size: 10pt">
                                    部門：一等一科技</td>
                            </tr>
                            <tr style="font-size: 12pt">
                                <td align="left" bgcolor="#ffffff" width="50%" style="height: 29px">
                                    <span style="font-size: 10pt">
                                    歸檔人員：Eric<span style="font-size: 10pt"></span></span></td>
                                <td align="left" bgcolor="#ffffff" colspan="4" style="height: 29px">
                                    現在處理者：王猩猩</td>
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
                    <td align="middle" bgcolor="#6699ff" style="height: 23px" width="23%">
                        <strong><font color="#ffffff" size="2">站點資訊：一般</font></strong></td>
                    <td style="height: 23px" width="77%">
                    </td>
                </tr>
                <tr>
                    <td bgcolor="#6699ff" colspan="2">
                        <table border="0" cellpadding="5" cellspacing="1" width="100%">
                            <tr>
                                <td align="left" bgcolor="#ffffff" width="50%">
                                    簽核者：系統管理員(張進鑫)<asp:Image ID="Image3" runat="server" ImageUrl="~/Common/Images/Icon/icon_m119.gif" /></td>
                                <td align="left" bgcolor="#ffffff" colspan="4">
                                    簽核意見：aaaaaaaaabbbbbbbbbbbbccccccccccccc</td>
                            </tr>
                            <tr>
                                <td align="left" bgcolor="#ffffff" colspan="5">
                                    <span style="font-size: 10pt"><table width="100%">
                                        <tr>
                                            <td style="width: 120px">
                                                <span style="font-size: 10pt">知會人員：</span></td>
                                            <td>
                                                <table style="font-size: 10pt" width="100%">
                                                    <tr>
                                                        <td colspan="3">
                                                            lookgrl(已讀取)</td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                    </table>
                                    </span></td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
            <br />
            <asp:Image ID="Image2" runat="server" ImageUrl="~/Common/Images/Icon/icon_m54.gif" /></p>
        <p
                align="center">
                <table border="0" cellpadding="2" cellspacing="0" width="100%">
                    <tr>
                        <td align="middle" bgcolor="#00c000" style="height: 23px" width="23%">
                            <strong><font color="#ffffff" size="2">流程式站點：嘰哩咕嚕</font></strong></td>
                        <td style="height: 23px" width="77%">
                        </td>
                    </tr>
                    <tr>
                        <td bgcolor="#00c000" colspan="2">
                            <table bordercolordark="#000000" bordercolorlight="#ffffff" cellpadding="0" cellspacing="1"
                                width="100%">
                                <tr>
                                    <td bgcolor="#ffffff" colspan="3" rowspan="3" style="text-align: center" valign="top">
                                        <br />
                                        <table style="width: 95%">
                                            <tr>
                                                <td style="width: 100%; text-align: center">
                                                    <table border="0" cellpadding="2" cellspacing="0" width="100%">
                                                        <tr>
                                                            <td align="middle" bgcolor="#6699ff" style="height: 23px" width="23%">
                                                                <strong><font color="#ffffff" size="2">站點資訊：並簽</font></strong></td>
                                                            <td style="height: 23px; font-size: 12pt;" width="77%">
                                                            </td>
                                                        </tr>
                                                        <tr style="font-size: 12pt">
                                                            <td bgcolor="#6699ff" colspan="2">
                                                                <table border="0" cellpadding="5" cellspacing="1" width="100%">
                                                                    <tr>
                                                                        <td align="left" bgcolor="#ffffff" width="50%" style="height: 29px">
                                                                            <span>簽核者：王猩猩</span></td>
                                                                        <td align="left" bgcolor="#ffffff" colspan="4" width="50%" style="height: 29px">
                                    簽核意見：</td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td align="left" bgcolor="#ffffff" width="50%" nowrap>
                                                                            簽核者：<span style="font-size: 10pt">系統管理員(<span style="font-size: 10pt">張進鑫)<asp:Image ID="Image4" runat="server" ImageUrl="~/Common/Images/Icon/icon_m73.gif" /></span></span><span></span></td>
                                                                        <td align="left" bgcolor="#ffffff" colspan="4" style="font-size: 10pt;" width="50%">
                                                                                        簽核意見：9999999999999111111118888888888888888855662158</td>

                                                                    </tr>
                                                                    <tr>
                                                                        <td align="left" bgcolor="#ffffff" colspan="5">
                                                                            <span style="font-size: 10pt">
                                                                            </span><span>
                                                                                <table width="100%">
                                                                                    <tr>
                                                                                        <td style="height: 67px; width: 120px;">
                                                                                            <span style="font-size: 10pt">
                                                                                            知會人員：</span></td>
                                                                                        <td style="height: 67px">
                                                                                            <table style="font-size: 10pt" width="100%">
                                                                                    <tr>
                                                                                        <td colspan="3">
                                                                                            lookgrl(已讀取)</td>
                                                                                    </tr>
                                                                                    <tr>
                                                                                        <td colspan="3">
                                                                                            Sean(未讀取)</td>
                                                                                    </tr>
                                                                                </table>
                                                                                        </td>
                                                                                    </tr>
                                                                                </table>
                                                                            </span>
                                                                        </td>
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
                                </tr>
                                <tr>
                                </tr>
                                <tr>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
                <br />
            </p>
                                                          

        </asp:Content>

