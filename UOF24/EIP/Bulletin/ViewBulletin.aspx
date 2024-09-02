<%@ Page Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="EIP_Bulletin_ViewBulletin" Title="瀏覽公告" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" Codebehind="ViewBulletin.aspx.cs" %>

<%@ Register Src="../../Common/ChoiceCenter/UC_ChoiceList.ascx" TagName="UC_ChoiceList" TagPrefix="uc2" %>
<%@ Register Src="~/Common/FileCenter/V3/UC_FileCenter.ascx" TagPrefix="uc2" TagName="UC_FileCenter" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <style type="text/css">
        span.JustAddBorder table tr td {
            border-width: 1px;
            border-style: solid;
        }
        span.RadButton_Silk.rbSkinnedButton, span.RadButton_Silk.rbVerticalButton{
            padding:0 10px;
            border-color: rgb(196, 196, 196);
        }
        span.RadButton_Silk.rbVerticalButton:hover{
            pointer-events: none;
        }
        span.RadButton_Silk.rbVerticalButton.rbDisabled{             
             color: rgb(215, 215, 215);
             background-color: rgb(227, 227, 227);
             background-image: linear-gradient(rgb(254, 254, 254) 0px, rgb(227, 227, 227) 100%);
             box-shadow: none;
             border-color: rgb(201, 201, 201);
             background-position: 0px 0px;
        }
        span.RadButton_Silk.RadButton.rbDisabled{
            border-radius: 4px;
            border-style: solid;
            border-width: 1px;
        }
    </style>
    <script type="text/javascript">
<!--

    function CopyText() {
        //Add code to handle your event here.
        var target = $("#<%= lblContext.ClientID%>");
        var data = target.text();
        clipboardData.setData("Text", data);
    }

    function openDialogResult(returnValue) {
        if (typeof (returnValue) == 'undefined')
            return false;
        else
            return true;
    }

    function PrintFriently() {
        var BULLETINE_ID = '<%=lblBulletinID.Text%>';
        var fontsize = $("#<%=hfFontSize.ClientID%>").val();
        var url = '../Bulletin/BulletinPrintFriendly.aspx?BULLETINID=' + BULLETINE_ID + '&fontsize=' + fontsize;
        window.open(url, "", "width = 980, height = 700");
        return false;
    }
    // -->
    </script>
    <asp:CustomValidator ID="CustomValidator1" runat="server" Display="Dynamic" ErrorMessage="無權限瀏覽" meta:resourcekey="CustomValidator1Resource1"></asp:CustomValidator>
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
                            <table style="width: 955px; background-color: #FFFFFF;text-align:left;margin-left:10px;margin-right:10px" border="0" cellpadding="0" cellspacing="0">
                                <tr>
                                    <td colspan="3" style="width:100%;">
                                        <table style="width: 100%;" border="0" cellspacing="0" cellpadding="0"; >
                                            <tr >
                                                <td style="width: 104px; background-image: url(../../Common/Images/EIP/Bulletin/bu_a01.gif); height: 77px;min-width:104px"></td>
                                                <td style="padding-top:6px;vertical-align:middle;background-image: url(../../Common/Images/EIP/Bulletin/bu_a02.gif); height: 77px;min-width:10px">
                                                    <div style="padding-top:2px;max-height: 50px; min-height: 40px; overflow-y: auto;display: inline-block;width:100%; word-break:break-all">
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
                                    <td style="padding-right:20px ;padding-left:20px ;width: 100%;text-align:left; background-image: url(../../Common/Images/EIP/Bulletin/bu_b02.gif);">
                                        <table style="width:10%;text-align:left;white-space:nowrap">
                                            <tr>
                                                <td style="white-space: nowrap;width:80px" >
                                                    <asp:Label ID="Label1" runat="server" Text="張貼者:" meta:resourcekey="Label1Resource1"></asp:Label></td>

                                                <td style="width:200px;padding-left:5px">
                                                    <asp:Label ID="LBLannouncer" runat="server" meta:resourcekey="LBLannouncerResource1"></asp:Label>
                                                </td>
                                                <td style="padding-left:10px;padding-right:10px">│</td>
                                                <td style="white-space: nowrap;width:80px">
                                                    <asp:Label ID="Label10" runat="server" Text="張貼部門:" meta:resourcekey="Label10Resource1"></asp:Label>
                                                </td>
                                                <td style="width:200px;padding-left:5px">
                                                    <asp:Label ID="LBDepartment" runat="server"></asp:Label>
                                                </td>
                                                <td style="padding-left:10px;padding-right:10px">│</td>
                                                <td style="white-space: nowrap;width:80px">
                                                    <asp:Label ID="Label2" runat="server" Text="分類:" meta:resourcekey="Label2Resource1"></asp:Label></td>
                                                <td style="width:200px;padding-left:5px">
                                                    <asp:Label ID="LBLclass" runat="server" meta:resourcekey="LBLclassResource1"></asp:Label></td>
                                                <td style="padding-left:10px;padding-right:10px">│</td>
                                                <td style="white-space: nowrap;width:80px">
                                                    <asp:Label ID="lblPublishDate" runat="server" Text="發佈時間:" meta:resourcekey="lblPublishDateResource1"></asp:Label>
                                                </td>
                                                <td style="padding-left:5px">
                                                <asp:Label ID="lblPublicDateStart" runat="server"></asp:Label>
                                                </td>
                                                <td> ~ </td>
                                                <td>
                                                    <asp:Label ID="lblPublicDateEnd" runat="server"></asp:Label>
                                                </td>
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
                                                    <uc2:UC_ChoiceList ID="UC_ChoiceListPublish" runat="server" IsAllowEdit="false"/>
                                                </td>
                                            </tr> 
                                           
                                              <tr runat="server" id="trOuterPublish" visible="false" >
                                                <td style="white-space: nowrap;width:80px;vertical-align:middle" >
                                                    <asp:Label ID="lblOuterPublish" runat="server" Text="外部發佈對象:"
                                                   Visible="false" meta:resourcekey="lblOuterPublishResource1"></asp:Label>
                                                </td>
                                                <td colspan="10" style="width:100%;">
                                                    <uc2:UC_ChoiceList ID="UC_ChoiceListOuterPublish" runat="server" IsAllowEdit="false"/>
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
                                                    <asp:Label ID="Label5" runat="server" Text="附件" meta:resourcekey="Label5Resource1" Visible="false"></asp:Label></td>
                                                <td>                                                    
                                                    <uc2:UC_FileCenter runat="server" id="UC_FileCenter" AllowedMultipleFileSelection="false" Visible="false" Editable="false" />
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
                                      <telerik:RadButton  ID="rdtnBulletinRecommend" runat="server" Skin="Silk"  SkinID="YellowButton"  Height="25px" Text="" Visible="false" OnClick="rdtnBulletinRecommend_Click" >
                                          <Image ImageUrl="~/Common/Images/Buttons/yellow.png" HoveredImageUrl="~/Common/Images/Buttons/yellow_hover.png" PressedImageUrl="~/Common/Images/Buttons/yellow_hover.png" IsBackgroundImage="true" />
                                        <Icon PrimaryIconUrl="../../Common/images/icon/icon_m228.png" PrimaryIconTop="6px" PrimaryIconLeft="8px" PrimaryIconWidth="18px" PrimaryIconHeight="18px" ></Icon>
                                      </telerik:RadButton>
                                        <telerik:RadButton  ID="rdtnBulletinIsRecommend" runat="server"  Skin="Silk"  SkinID="RadButton" Height="25px" Text="" Enabled="false" Visible="false">
                                        <Icon PrimaryIconUrl="../../Common/images/icon/icon_m227.png" PrimaryHoveredIconUrl="../../Common/images/icon/icon_m227.png"  PrimaryIconTop="6px" PrimaryIconLeft="8px" PrimaryIconWidth="18px" PrimaryIconHeight="18px" ></Icon>
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

    <asp:Label ID="lblPrintMsg" runat="server" Text="友善列印" Visible="False" meta:resourcekey="lblPrintMsgResource1"></asp:Label>
    <asp:Label ID="lblPrintMsg2" runat="server" Text="列印" Visible="False" meta:resourcekey="lblPrintMsg2Resource1"></asp:Label>
    <asp:Label ID="lblLoginAlert" runat="server" Text="登入者非該公告發佈對象,所以無法連結此公告 !" Visible="False" meta:resourcekey="lblLoginAlertResource1"></asp:Label>
    <asp:Label ID="lblMsgBullProcessing" runat="server" Text="公告審核中，所以無法連結此公告!" Visible="false" meta:resourcekey="lblMsgBullProcessingResource1"></asp:Label>
    <asp:Label ID="lblMsgBullDeny" runat="server" Text="公告發佈拒絕，所以無法連結此公告!" Visible="false" meta:resourcekey="lblMsgBullDenyResource1"></asp:Label>
    <asp:Label ID="lblMsgBullPublishing" runat="server" Text="公告還未發佈，所以無法連結此公告!" Visible="false" meta:resourcekey="lblMsgBullPublishingResource1"></asp:Label>
    <asp:Label ID="lblExpire" runat="server" Text="公告已下架，無法觀看。" Visible="false" meta:resourcekey="lblExpireResource1"></asp:Label>
    <asp:Label ID="lblNotExist" runat="server" Text="該公告已被刪除!" Visible="false" meta:resourcekey="lblNotExistResource1"></asp:Label>
    <asp:Label ID="lblBulletinID" runat="server" Visible="false"></asp:Label>
    <asp:Label ID="lblMsgNeverExpired" runat="server" Text="永不下架" Visible="False" meta:resourcekey="lblMsgNeverExpiredResource1"></asp:Label>    
    <asp:HiddenField ID="hfCurrentUser" runat="server" />
    <asp:HiddenField ID="hfFontSize" runat="server" />
    <asp:HiddenField ID="hfRecommendNum" runat="server" />
</asp:Content>
