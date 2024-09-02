<%@ Page Language="C#" AutoEventWireup="true" Inherits="EIP_Bulletin_pp" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" Codebehind="BulletinPrintFriendly.aspx.cs" %>
<%@ Register Src="../../Common/ChoiceCenter/UC_ChoiceList.ascx" TagName="UC_ChoiceList" TagPrefix="uc2" %>
<%@ Register Src="~/Common/FileCenter/V3/UC_FileCenter.ascx" TagPrefix="uc2" TagName="UC_FileCenter" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />
    <meta name="referrer" content="no-referrer" />
    <title></title>    
    <link href="../../Common/Style/telerik.css" rel="stylesheet" />
    <link href="../../Common/Style/uof-fixed.css" rel="stylesheet" />
    <link href="../../Common/Style/cssReset.css" rel="stylesheet" />            
</head>
<body style="background-color:#FFFFFF;">

    <form id="form1" runat="server">
        <telerik:RadScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="True" AsyncPostBackTimeout="36000">
            <Scripts>
	            <asp:ScriptReference Assembly="Telerik.Web.UI" Name="Telerik.Web.UI.Common.Core.js" />
                <asp:ScriptReference Assembly="Telerik.Web.UI" Name="Telerik.Web.UI.Common.jQuery.js" />
                <asp:ScriptReference Assembly="Telerik.Web.UI" Name="Telerik.Web.UI.Common.jQueryInclude.js" />
                <asp:ScriptReference Path="~/Common/javascript/json2.min.js" ScriptMode="Release" />
                <asp:ScriptReference Path="~/Common/javascript/jQuery/plugin/jquery-ui.min.js" ScriptMode="Release" />
                <asp:ScriptReference Path="~/Common/javascript/jQuery/plugin/jquery.blockUI.js" ScriptMode="Release" />
                <asp:ScriptReference Path="~/Common/javascript/jQuery/plugin/ticker.js?v=11.40" ScriptMode="Release" />
                <asp:ScriptReference Path="~/Common/javascript/uofScript.js" ScriptMode="Release" />
                <asp:ScriptReference Path="~/Common/javascript/jQuery/plugin/jquery.cookie.js" ScriptMode="Release" />                
                <asp:ScriptReference Path="~/Common/javascript/jQuery/plugin/jquery.validate.min.js" ScriptMode="Release" />
            </Scripts>
        </telerik:RadScriptManager>

        <script type="text/javascript">
            window.onload = function () {                
                setTimeout(function () { window.print(); window.close(); }, 500);
            }            
        </script>
        <style>
            #printtable {
                font-size: <%=hfFontsize.Value%>;
            }
            span.JustAddBorder table tr td {
                border-width: 1px;
                border-style: solid;
            }
            span.RadButton_Silk{
                width:40px !important;
            }
        </style>
        
        <div style="width: 100%" id="printtable" align="center">
            <table style="width: 100%; height: 100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
            <td>
                <table style="width: 100%; height: 100%; vertical-align: top; text-align: center; background-image: url(../../Common/Images/EIP/Bulletin/bu_bg.gif)" border="0" cellpadding="0" cellspacing="0">
                    <tr>
                        <td style="width: 100%; height: 12px"></td>
                    </tr>
                    <tr>
                        <td style="width:100%" >
                            <center>
                            <table style="width: 95%; background-color: #FFFFFF;text-align:left;margin-left:10px;margin-right:10px" border="0" cellpadding="0" cellspacing="0">
                                <tr>
                                    <td colspan="3" style="width:100%;">
                                        <table style="width: 100%;" border="0" cellspacing="0" cellpadding="0"; >
                                            <tr >
                                                <td style="width: 104px; background-image: url(../../Common/Images/EIP/Bulletin/bu_a01.gif); height: 77px;min-width:104px"></td>
                                                <td style="padding-top:6px;vertical-align:middle;background-image: url(../../Common/Images/EIP/Bulletin/bu_a02.gif); height: 77px;min-width:10px">
                                                    <div style="padding-top:5px;max-height: 50px; min-height: 40px; overflow-y: auto;display: inline-block;width:100%; word-break:break-all">
                                                        <asp:Label ID="ltTopic" ForeColor="White" runat="server" meta:resourcekey="ltTopicResource1" CssClass="bigT"></asp:Label>    
                                                    </div>
                                                    </td>
                                                <td style="width: 19px; background-image: url(../../Common/Images/EIP/Bulletin/bu_a03.gif); height: 77px"></td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 15px;min-width:15px;max-width:15px; background-image: url(../../Common/Images/EIP/Bulletin/bu_b01.gif);"></td>
                                    <td style="padding-right:20px ;padding-left:20px ;width: 100%;text-align:left;" >
                                        <table style="width:100%;text-align:left;white-space:nowrap;word-break:break-all" border="0">
                                            <tr>
                                                <td style="white-space: nowrap;" >
                                                    <asp:Label ID="Label1" runat="server" Text="張貼者:" meta:resourcekey="Label1Resource1"></asp:Label></td>

                                                <td style="padding-left:5px;white-space:nowrap">
                                                    <asp:Label ID="LBLannouncer" runat="server" meta:resourcekey="LBLannouncerResource1"></asp:Label>
                                                </td>
                                                <td style="padding-left:10px;padding-right:10px">│</td>
                                                <td style="white-space: nowrap;">
                                                    <asp:Label ID="Label2" runat="server" Text="張貼部門:" meta:resourcekey="Label2Resource1"></asp:Label>
                                                </td>
                                                <td style="padding-left:5px;white-space: nowrap">
                                                    <asp:Label ID="LBDepartment" runat="server"></asp:Label>
                                                </td>
                                                <td style="padding-left:10px;padding-right:10px">│</td>
                                                <td style="white-space: nowrap;">
                                                    <asp:Label ID="Label3" runat="server" Text="分類:" meta:resourcekey="Label3Resource1"></asp:Label></td>
                                                <td style="padding-left:5px;white-space: nowrap">
                                                    <asp:Label ID="LBLclass" runat="server" meta:resourcekey="LBLclassResource1"></asp:Label></td>
                                                <td style="padding-left:10px;padding-right:10px">│</td>
                                                <td style="white-space: nowrap;">
                                                    <asp:Label ID="lblPublishDate" runat="server" Text="發佈日期:" meta:resourcekey="lblPublishDateResource1"></asp:Label>
                                                </td>
                                                <td style="padding-left:5px;white-space: nowrap">
                                                <asp:Label ID="lblPublicDateStart" runat="server"></asp:Label>
                                                </td>
                                                <td> ~ </td>
                                                <td style="white-space: nowrap;"><asp:Label ID="lblPublicDateEnd" runat="server"></asp:Label></td>
                                            </tr>
                                        </table>
                                        <table runat="server" id="tbPublish" style="width:100%;text-align:left;"  >
                                            <tr>
                                                <td style="white-space: nowrap;width:80px;vertical-align:middle" >
                                                    <asp:Label ID="lblPublishInnerList" runat="server" Text="內部發佈對象:"
                                                    Visible="false" meta:resourcekey="lblPublishInnerListResource1"></asp:Label>
                                                    <asp:Label ID="lblPublishList" runat="server" Text="發佈對象:"
                                                    Visible="false" meta:resourcekey="lblPublishListResource1"></asp:Label>
                                                </td>
                                                <td colspan="10" style="width:100%;">
                                                    <uc2:UC_ChoiceList ID="UC_ChoiceListPublish" runat="server" IsAllowEdit="false"  />

                                                </td>
                                            </tr>
                                              <tr runat="server" id="trOuterPublish" visible="false" >
                                                <td style="white-space: nowrap;width:80px;vertical-align:middle" >
                                                    <asp:Label ID="lblOuterPublish" runat="server" Text="外部發佈對象:"
                                                   Visible="false" meta:resourcekey="lblOuterPublishResource1"></asp:Label>
                                                </td>
                                                <td colspan="10" style="width:100%;">
                                                    <uc2:UC_ChoiceList ID="UC_ChoiceListOuterPublish" runat="server" IsAllowEdit="false"  />

                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                    <td style="width: 15px;min-width:15px;max-width:15px; background-image: url(../../Common/Images/EIP/Bulletin/bu_b03.gif);"></td>
                                </tr>
                                <tr>
                                    <td style="width: 15px;min-width:15px;max-width:15px; background-image: url(../../Common/Images/EIP/Bulletin/bu_b01.gif);"></td>
                                    <td style="padding-right:20px ;padding-left:20px ;width: 100%;vertical-align:top;background-image: url(../../Common/Images/EIP/Bulletin/bu_b02.gif);">
                                        <hr />
                                    </td>
                                    <td style="width: 15px;min-width:15px;max-width:15px; background-image: url(../../Common/Images/EIP/Bulletin/bu_b03.gif);"></td>
                                </tr>
                                <tr>
                                    <td style="width: 15px;min-width:15px;max-width:15px; background-image: url(../../Common/Images/EIP/Bulletin/bu_b01.gif);"></td>
                                    <td style="padding-right:20px ;padding-left:20px ;width: 100%;background-image: url(../../Common/Images/EIP/Bulletin/bu_b02.gif);">
                                        <table style="width:100%;">
                                            <tr>
                                                <td style="width: 5%; white-space: nowrap; white-space:nowrap">
                                                    <asp:Label ID="Label5" runat="server" Text="附件" Visible="false" meta:resourcekey="Label5Resource1"></asp:Label></td>
                                                <td>                                                    
                                                    <uc2:UC_FileCenter runat="server" id="UC_FileCenter" Visible="false" AllowedMultipleFileSelection="false" Editable="false" />
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                    <td style="width: 15px;min-width:15px;max-width:15px; background-image: url(../../Common/Images/EIP/Bulletin/bu_b03.gif);"></td>
                                </tr>
                                <tr>
                                    <td style="width: 15px;min-width:15px;max-width:15px; background-image: url(../../Common/Images/EIP/Bulletin/bu_b01.gif);"></td>
                                    <td style="padding-right:20px ;padding-left:20px ;width: 100%;vertical-align:top;background-image: url(../../Common/Images/EIP/Bulletin/bu_b02.gif);">
                                        <asp:Panel ID="plHr" runat="server" Visible="false"> <hr/> </asp:Panel>
                                    </td>
                                    <td style="width: 15px;min-width:15px;max-width:15px; background-image: url(../../Common/Images/EIP/Bulletin/bu_b03.gif);"></td>
                                </tr>
                                <tr>
                                    <td style="width: 15px;min-width:15px;max-width:15px; background-image: url(../../Common/Images/EIP/Bulletin/bu_b01.gif);"></td>
                                    <td style="padding-right:20px ;padding-left:20px ;width: 100%; text-align:right">                                    
                                      <telerik:RadButton  ID="rdtnBulletinRecommend" runat="server" Skin="Silk"  SkinID="YellowButton" Height="25px" Text="" Visible="false">
                                          <Image ImageUrl="~/Common/Images/Buttons/yellow.png" HoveredImageUrl="~/Common/Images/Buttons/yellow_hover.png" PressedImageUrl="~/Common/Images/Buttons/yellow_hover.png" IsBackgroundImage="true" />
                                        <Icon PrimaryIconUrl="../../Common/images/icon/icon_m228.png" PrimaryIconTop="6px" PrimaryIconLeft="8px" PrimaryIconWidth="18px" PrimaryIconHeight="18px" ></Icon>
                                      </telerik:RadButton>
                                        <telerik:RadButton  ID="rdtnBulletinIsRecommend" runat="server" Height="25px" Text="" Enabled="false" Visible="false">
                                        <Icon PrimaryIconUrl="../../Common/images/icon/icon_m227.png" PrimaryIconTop="6px" PrimaryIconLeft="8px" PrimaryIconWidth="18px" PrimaryIconHeight="18px" ></Icon>
                                      </telerik:RadButton>
                                    </td>                              
                                    <td style="width: 15px;min-width:15px;max-width:15px; background-image: url(../../Common/Images/EIP/Bulletin/bu_b03.gif);"></td>
                                </tr>
                                <tr>
                                    <td style="width: 15px;min-width:15px;max-width:15px; background-image: url(../../Common/Images/EIP/Bulletin/bu_b01.gif);"></td>
                                    <td style="padding-right:20px ;padding-left:20px ;width: 100%;vertical-align:top;background-image: url(../../Common/Images/EIP/Bulletin/bu_b02.gif);">
                                        <table style="width:100%;">
                                            <tr><td></td><td style="min-height:420px;height:420px; vertical-align:baseline">
                                                <asp:Label ID="lblContext" runat="server" class="editorcontentstyle JustAddBorder" ></asp:Label>
                                                </td></tr>
                                        </table>
                                    </td>
                                    <td style="width: 15px;min-width:15px;max-width:15px; background-image: url(../../Common/Images/EIP/Bulletin/bu_b03.gif);"></td>
                                </tr>                                
                                <tr>
                                    <td style="width: 15px;min-width:15px;max-width:15px;height:20px;min-height:20px; background-image: url(../../Common/Images/EIP/Bulletin/bu_c01.gif);"></td>
                                    <td style="width: 15px;min-width:15px;max-width:15px;height:20px;min-height:20px; background-image: url(../../Common/Images/EIP/Bulletin/bu_c02.gif);"></td>
                                    <td style="width: 15px;min-width:15px;max-width:15px;height:20px;min-height:20px; background-image: url(../../Common/Images/EIP/Bulletin/bu_c03.gif);"></td>
                                </tr>
                            </table>           
                            </center>                 
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
        </div>                
        <div style="display: none">
            <asp:Label ID="lblTitle" runat="server" Text="瀏覽公告" meta:resourcekey="lblTitleResource1"></asp:Label>
            <asp:Label ID="lblPrintMsg" runat="server" Text="友善列印" meta:resourcekey="lblPrintMsgResource1"></asp:Label>
            <asp:Label ID="lblPrintMsg2" runat="server" Text="列印" meta:resourcekey="lblPrintMsg2Resource1"></asp:Label>
            <asp:Label ID="lblMsgNeverExpired" runat="server" Text="永不下架" Visible="False" meta:resourcekey="lblMsgNeverExpiredResource1"></asp:Label> 
            <asp:HiddenField ID="hfCurrentUser" runat="server" />
            <asp:HiddenField ID="hfRecommendNum" runat="server" />
            <asp:HiddenField ID="hfFontsize" runat="server" />
        </div>
    </form>
</body>
</html>
