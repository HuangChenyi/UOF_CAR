<%@ Control Language="C#" AutoEventWireup="true" Inherits="WKF_FlowManagement_UC_SignableSite" Codebehind="UC_SignableSite.ascx.cs" %>
<%@ Register Src="../../Common/ChoiceCenter/UC_ChoiceList.ascx" TagName="UC_ChoiceList"
    TagPrefix="uc1" %>

<script type="text/javascript" id="telerikClientEvents1">
//<![CDATA[

	function WebImageButton_DeleteSite_Clicking(sender,args)
	{
	    args.set_cancel(!confirm('<%=lblDelete.Text %>?'));
	}
//]]>
</script>

<table border="0" cellpadding="0" cellspacing="0" width="100%" style="margin: 0px auto; ">
    <tr>
        <td style="height: 69px" align="center">
            <asp:Image ID="Image1" runat="server" ImageUrl="~/WKF/Images/icon_accept.gif" meta:resourcekey="Image1Resource1" /></td>
    </tr>
    <tr>
        <td style="height: 131px">
            <div style="text-align: center">
                <table width="90%" border="0" cellpadding="1" cellspacing="1" id="TABLE1" runat="server">
                    <tr>
                        <td style="height: 21px" align="center">
                            <asp:Label ID="lbSignType" runat="server" meta:resourcekey="lbSignTypeResource1" Text="型態"></asp:Label></td>
                        <td style="height: 21px" align="center">
                            <asp:Label ID="lblFlowEndTitle" runat="server" Text="結束" meta:resourcekey="lblFlowEndTitleResource1"></asp:Label></td>
                        <td style="height: 21px" align="center">
                            <asp:Label ID="lbAdditionalSignTitle" runat="server" Text="加簽" meta:resourcekey="lbAdditionalSignTitleResource1"></asp:Label></td>
                        <td style="height: 21px" align="center">
                            <asp:Label ID="lblJumpTitle" runat="server" Text="跳簽" meta:resourcekey="lblJumpTitleResource1"></asp:Label></td>
                        <td style="height: 21px; width: 107px;" align="center">
                            <asp:Label ID="lblTimeoutTitle" runat="server" Text="逾時" meta:resourcekey="lblTimeoutTitleResource1"></asp:Label></td>
                    </tr>
                    <tr>
                        <td align="center" class="PopTableRightTD">
                            <asp:Label ID="LblSiteType" runat="server" meta:resourcekey="LblSiteTypeResource1"></asp:Label></td>
                        <td align="center" class="PopTableRightTD">&nbsp;<asp:Label ID="lbFlowEnd" runat="server" meta:resourcekey="lbFlowEndResource1"></asp:Label></td>
                        <td align="center" class="PopTableRightTD">
                            <asp:Label ID="lblAdditionalSign" runat="server" meta:resourcekey="lblAdditionalSignResource1"></asp:Label>&nbsp;</td>
                        <td align="center" class="PopTableRightTD">
                            <asp:Label ID="lblJump" runat="server" meta:resourcekey="lblJumpResource1"></asp:Label>&nbsp;</td>
                        <td style="width: 107px" align="center" class="PopTableRightTD">&nbsp;<asp:Label ID="lblTimeOut" runat="server" meta:resourcekey="lblTimeOutResource1"></asp:Label></td>
                    </tr>
                    <tr>
                        <td align="right" class="PopTableLeftTD">
                            <asp:Label ID="lblTitleSpecialSigner" runat="server" Text="特殊人員" meta:resourcekey="lblTitleSpecialSignerResource1"></asp:Label></td>
                        <td colspan="4" class="PopTableRightTD">&nbsp;&nbsp;
        <asp:Label ID="lblSpecialSigner" runat="server" meta:resourcekey="lblSpecialSignerResource1"></asp:Label></td>
                    </tr>
                    <tr>
                        <td align="right" class="PopTableLeftTD">
                            <asp:Label ID="lbGeneralSigner" runat="server" Text="一般人員" meta:resourcekey="lbGeneralSignerResource1"></asp:Label></td>
                        <td colspan="4" class="PopTableRightTD">
                            <uc1:UC_ChoiceList ID="UC_ChoiceList_GeneralUser" runat="server"
                                ShowMember="False" />
                        </td>
                    </tr>
                    <tr>
                        <td colspan="5" style="text-align: right; width: 100%; height: 34px;">
                            <table>
                                <tr>
                                    <td style="width: 1%">&nbsp;</td>
                                    <td style="text-align:right">
                                        <telerik:RadButton ID="WebImageButton_UPSite" runat="server" Text="↑" Width="20px"
                                            meta:resourcekey="WebImageButton_UPSiteResource1" OnClick="WebImageButton_UPSite_Click1" ></telerik:RadButton>
                            
                                        <telerik:RadButton ID="WebImageButton_DownSite" runat="server" Text="↓" Width="20px" 
                                            meta:resourcekey="WebImageButton_DownSiteResource1" OnClick="WebImageButton_DownSite_Click1"></telerik:RadButton>
                                  
                                        <telerik:RadButton ID="WebImageButton_InsertSite" runat="server"
                                            meta:resourcekey="WebImageButton_InsertSiteResource1" OnClick="WebImageButton_InsertSite_Click1"></telerik:RadButton>
                             
                                        <telerik:RadButton ID="WebImageButton_ModifySite" runat="server"
                                            meta:resourcekey="WebImageButton_ModifySiteResource1"></telerik:RadButton>
                                
                                        <telerik:RadButton ID="WebImageButton_DeleteSite" runat="server" 
                                            meta:resourcekey="WebImageButton_DeleteSiteResource1" OnClientClicking="WebImageButton_DeleteSite_Clicking" OnClick="WebImageButton_DeleteSite_Click1"></telerik:RadButton>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
                <asp:Label ID="lblSite" runat="server" Text="插入站點" Visible="False" meta:resourcekey="lblSiteResource1"></asp:Label>
                <asp:Label ID="lblSet" runat="server" Text="設定" Visible="False" meta:resourcekey="lblSetResource1"></asp:Label>
                <asp:Label ID="lblDeleteSite" runat="server" Text="刪除" Visible="False" meta:resourcekey="lblDeleteSiteResource1"></asp:Label>
                <asp:Label ID="lblDelete" runat="server" Text="確定刪除站點?" Visible="False" meta:resourcekey="lblDeleteResource1"></asp:Label>
                <asp:Label ID="lblSign" runat="server" Text="簽核者" meta:resourcekey="lblSignResource1" Visible="False"></asp:Label>
                <asp:Label ID="lblFlowStartPeople" runat="server" Text="流程起始人員" meta:resourcekey="lblFlowStartPeopleResource1" Visible="False"></asp:Label>
                <asp:Label ID="lblSiteAgent" runat="server" Text="上一站點代理者" meta:resourcekey="lblSiteAgentResource1" Visible="False"></asp:Label>
            </div>
        </td>
    </tr>
</table>
