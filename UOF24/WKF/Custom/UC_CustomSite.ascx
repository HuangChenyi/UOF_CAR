<%@ Control Language="C#" AutoEventWireup="true" Inherits="WKF_Custom_UC_CustomSite" Codebehind="UC_CustomSite.ascx.cs" %>
<%@ Register Src="../../Common/ChoiceCenter/UC_ChoiceOnce.ascx" TagName="UC_ChoiceOnce" TagPrefix="uc2" %>
<%@ Register Src="../../Common/ChoiceCenter/UC_ChoiceList.ascx" TagName="UC_ChoiceList" TagPrefix="uc1" %>

<script type="text/javascript" id="telerikClientEvents1">
    function WebImageButton_DeleteSite_Clicking(sender, args) {
        args.set_cancel(!confirm('<%=lblDelete.Text %>?'));
    }
</script>
<script id="CustomSiteJS" type="text/javascript">
    function UltraWebMenu1_ItemClick(menuId, itemId) {
        alert(igmenu_getItemById(itemId).getText());
    }
</script>
<div style="text-align: center">
    <table border="0" cellpadding="0" cellspacing="0" width="90%" style="margin: 0px auto; ">
        <tbody>
            <tr>
                <td align="center" style="height: 30px">
                    <asp:Image ID="Image1" runat="server" ImageUrl="~/Common/Images/Icon/icon_m54.gif"
                        meta:resourcekey="Image1Resource1" /></td>
            </tr>
            <tr>
                <td>
                    <div style="text-align: center">
                        <table border="0" cellpadding="1" cellspacing="1" class="PopTable" width="500px">
                            <tr>
                                <td align="center" class="PopTableLeftTD" style="height: 24px; text-align: center;"
                                    colspan="2">
                                    <asp:Label ID="lbSignType" runat="server" meta:resourcekey="lbSignTypeResource1"
                                        Text="站點型態"></asp:Label></td>
                                <td align="center" class="PopTableLeftTD" style="height: 24px; text-align: center;"
                                    colspan="2">&nbsp;<asp:Label ID="lblTimeoutTitle" runat="server" Text="逾時" meta:resourcekey="lblTimeoutTitleResource1"></asp:Label></td>
                            </tr>
                            <tr style="height:24px">
                                <td align="center" class="PopTableRightTD" style="height: 24px; text-align:center;" colspan="2">
                               
                                    <asp:Label ID="LblSiteType" runat="server" meta:resourcekey="LblSiteTypeResource1"></asp:Label>
                                 
                                    </td>
                                <td align="center" class="PopTableRightTD" style="height: 24px" colspan="2">
                                    <asp:Label ID="lblTimeOut" runat="server" meta:resourcekey="lblTimeOutResource1"></asp:Label></td>
                            </tr>
                            <tr>
                                <td align="center" class="PopTableLeftTD" style="height: 24px; text-align: center;"
                                    colspan="2">
                                    <asp:Label ID="Label4" runat="server" Text="簽核提醒頻率" meta:resourcekey="Label4Resource1"></asp:Label>
                                </td>
                                <td  align="center" class="PopTableLeftTD" style="height: 24px; text-align: center;"
                                    colspan="2">
                                    <asp:Label ID="Label5" runat="server" Text="自動送至下一站" meta:resourcekey="Label5Resource1"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td align="center" class="PopTableRightTD" style="height: 24px; text-align:center;" colspan="2">
                                    <asp:Label ID="lblCycleAlert" runat="server" meta:resourcekey="lblCycleAlertResource1" ></asp:Label>
                                </td>
                                <td align="center" class="PopTableRightTD" style="height: 24px" colspan="2">
                                    <asp:Label ID="lblAutoSign" runat="server" meta:resourcekey="lblAutoSignResource1"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td align="center" class="PopTableLeftTD" style="height: 24px; text-align: center;"
                                    colspan="2">
                                    <asp:Label ID="lbGeneralSigner" runat="server" Text="簽核人員" meta:resourcekey="lbGeneralSignerResource1"></asp:Label></td>
                                <td align="center" class="PopTableLeftTD" style="height: 24px; text-align: center;"
                                    colspan="2">
                                    <asp:Label ID="Label1" runat="server" Text="簽核前知會人員" 
                                        meta:resourcekey="Label1Resource1"></asp:Label></td>
                            </tr>
                            <tr>
                                <td class="PopTableRightTD" valign="top" colspan="2" style="text-align:center">
                                    <uc1:UC_ChoiceList ID="UC_ChoiceList_GeneralUser" runat="server" 
                                        ShowMember="False" />
                                </td>
                                <td class="PopTableRightTD" valign="top" colspan="2">
                                    <uc1:UC_ChoiceList ID="UC_ChoiceList_AlterUser" runat="server" 
                                        ShowMember="False" />
                                </td>
                            </tr>
                            <tr>
                                <td align="center" class="PopTableLeftTD" style="height: 24px; text-align: center;" colspan="2">
                                    <asp:Label ID="Label2" runat="server" Text="可否修改"  meta:resourcekey="Label2Resource1"></asp:Label>
                                </td>
                                <td align="center" class="PopTableLeftTD" style="height: 24px; text-align: center;" colspan="2">
                                    <asp:Label ID="Label3" runat="server" Text="簽核後知會" 
                                        meta:resourcekey="Label3Resource1" ></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td class="PopTableRightTD" colspan="2" align="center">
                                <center>
                                    <asp:Image ID="imgYes" runat="server" 
                                        ImageUrl="~/Common/Images/Icon/icon_m49.gif" Visible="False" 
                                        meta:resourcekey="imgYesResource1"/>
                                    <asp:Image ID="imgNo" runat="server" 
                                        ImageUrl="~/Common/Images/Icon/icon_m03.gif"  Visible="False" 
                                        meta:resourcekey="imgNoResource1"/>
                                    </center>
                                </td>
                                <td class="PopTableRightTD" colspan="2">
                                    <uc1:UC_ChoiceList ID="UC_ChoiceList_SignedAlter" runat="server" 
                                        ShowMember="False" />
                                </td>
                            </tr>

                        </table>
                        <asp:Panel ID="PanelOperator" runat="server" Width="100%" meta:resourcekey="PanelOperatorResource1">
                            <table align="right" cellpadding="0" cellspacing="0" width="500">
                                <tr>
                                    <td align="right">
                                        <telerik:RadButton ID="WebImageButton_UPSite" runat="server" 
                                             meta:resourcekey="WebImageButton_UPSiteResource1" 
                                            Text="↑" Width="20px" OnClick="WebImageButton_UPSite_Click1"></telerik:RadButton>
                                        <telerik:RadButton ID="WebImageButton_DownSite" runat="server" 
                                            meta:resourcekey="WebImageButton_DownSiteResource1" 
                                            Text="↓" Width="20px" OnClick="WebImageButton_DownSite_Click1"></telerik:RadButton>
                                        <telerik:RadButton ID="WebImageButton_InsertSite" runat="server" 
                                            meta:resourcekey="WebImageButton_InsertSiteResource1" OnClick="WebImageButton_InsertSite_Click1"></telerik:RadButton>
                                        <telerik:RadButton ID="WebImageButton_ModifySite" runat="server" 
                                            meta:resourcekey="WebImageButton_ModifySiteResource1"></telerik:RadButton>
                                        <telerik:RadButton ID="WebImageButton_DeleteSite" runat="server" 
                                            meta:resourcekey="WebImageButton_DeleteSiteResource1" OnClick="WebImageButton_DeleteSite_Click1"
                                            OnClientClicking="WebImageButton_DeleteSite_Clicking"></telerik:RadButton>
                                    </td>
                                </tr>
                            </table>
                        </asp:Panel>
                    </div>
                </td>
            </tr>
        </tbody>
    </table>
    <asp:Label ID="lblSite" runat="server" Text="插入站點" Visible="False" meta:resourcekey="lblSiteResource1"></asp:Label>
    <asp:Label ID="lblSet" runat="server" Text="設定" Visible="False" meta:resourcekey="lblSetResource1"></asp:Label>
    <asp:Label ID="lblDeleteSite" runat="server" Text="刪除" Visible="False" meta:resourcekey="lblDeleteSiteResource1"></asp:Label>
    <asp:Label ID="lblDelete" runat="server" Text="確定刪除站點?" Visible="False" meta:resourcekey="lblDeleteResource1"></asp:Label>
    <asp:Label ID="lblGeneral" runat="server" Text="一般" Visible="False" meta:resourcekey="lblGeneralResource1"></asp:Label>
    <asp:Label ID="lblOr" runat="server" Text="並簽" Visible="False" meta:resourcekey="lblAndResource1"></asp:Label>
    <asp:Label ID="lblAnd" runat="server" Text="會簽" Visible="False" meta:resourcekey="lblOrResource1"></asp:Label>
    <asp:Label ID="lblAssign" runat="server" Text="指定" Visible="False" meta:resourcekey="lblAssignResource1"></asp:Label>
    <asp:Label ID="lblAddCustSiteMsg" runat="server" Text="新增使用者自訂站點" Visible="False" meta:resourcekey="lblAddCustSiteMsgResource1"></asp:Label>
    <asp:Label ID="lblModifyCustSiteMsg" runat="server" Text="維護使用者自訂站點" Visible="False" meta:resourcekey="lblModifyCustSiteMsgResource1"></asp:Label></div>
